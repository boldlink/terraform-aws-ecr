
module "kms_key" {
  source              = "boldlink/kms/aws"
  version             = "1.0.0"
  description         = "A test kms key"
  name                = "example-key"
  alias_name          = "alias/ecr-key-alias"
  enable_key_rotation = true
}

module "private_ecr" {
  source                    = "./../../"
  create_private_repository = true
  name                      = local.name
  image_tag_mutability      = "IMMUTABLE"
  aws_ecr_lifecycle_policy  = local.lifecycle_policy
  aws_ecr_repository_policy = local.repository_policy
  encryption_configuration = {
    encryption_type = "KMS"
    kms_key         = module.kms_key.arn
  }
}
