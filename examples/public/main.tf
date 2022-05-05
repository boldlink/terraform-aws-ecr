provider "aws" {
  region = "us-east-1"
}
module "Publicecr" {
  source                   = "./../../"
  create_public_repository = true
  name                     = "samplepublicrepository"
  catalog_data = {
    catalog_data = {
      architectures     = ["ARM"]
      description       = "Sample Description for a public repository"
      operating_systems = ["Linux", "Windows"]
    }
  }
  create_ecrpublic_repository_policy = true
  policy                             = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "public ecr policy",
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

output "publicecr" {
  value = [
    module.Publicecr,
  ]
}
