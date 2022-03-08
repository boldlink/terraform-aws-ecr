
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

module "kms_key" {
  source              = "boldlink/kms-key/aws"
  version             = "1.0.0"
  description         = "A test kms key"
  name                = "example-key"
  alias_name          = "alias/my-key-alias"
  enable_key_rotation = true
}

module "ecr" {
  source               = "./../"
  name                 = local.name
  image_tag_mutability = "IMMUTABLE"

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
            "Principal": "*",
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

}

output "example" {
  value = [
    module.ecr,
  ]
}
