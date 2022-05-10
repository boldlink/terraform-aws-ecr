
terraform {
  required_version = ">= 0.13"
}


locals {
  name = "samplerepo"
  tagged_images = [
    {
      rulePriority = 1,
      description  = "Keep last 10 images",
      selection = {
        tagStatus     = "tagged",
        tagPrefixList = ["v"],
        countType     = "imageCountMoreThan",
        countNumber   = 10
      },
      action = {
        type = "expire"
      }
    }
  ]
  untagged_images = [
    {
      rulePriority = 2,
      description  = "Expire images older than 5 days",
      selection = {
        tagStatus   = "untagged",
        countType   = "sinceImagePushed",
        countUnit   = "days",
        countNumber = 5
      },
      action = {
        type = "expire"
      }
    }
  ]
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_partition" "current" {}


module "kms_key" {
  source              = "boldlink/kms/aws"
  version             = "1.0.0"
  description         = "A test kms key"
  name                = "example-key"
  alias_name          = "alias/ecr-key-alias"
  enable_key_rotation = true
}

module "private_ecr" {
  source                           = "./../../"
  create_private_repository        = true
  name                             = local.name
  image_tag_mutability             = "IMMUTABLE"
  create_replication_configuration = true
  scan_type                        = "ENHANCED"
  enable_pull_through_cache_rule   = true
  ecr_repository_prefix            = "ecr-public"
  upstream_registry_url            = "public.ecr.aws"
  replica_region                   = "eu-west-2"
  create_aws_ecr_repository_policy = true
  create_aws_ecr_lifecycle_policy  = true
  registry_id                      = data.aws_caller_identity.current.account_id
  encryption_configuration = {
    encryption_type = "KMS"
    kms_key         = module.kms_key.arn
  }

  aws_ecr_lifecycle_policy = jsonencode({
    rules = concat(local.tagged_images, local.untagged_images)
  })
  aws_ecr_repository_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": {
              "AWS" : "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"
            },
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
EOF
  registry_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "testpolicy",
        Effect = "Allow",
        Principal = {
          "AWS" : "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        Action = [
          "ecr:ReplicateImage"
        ],
        Resource = [
          "arn:${data.aws_partition.current.partition}:ecr:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:repository/*"
        ]
      }
    ]
  })

}

output "private" {
  description = "Sample module output"
  value = [
    module.private_ecr,
  ]
}
