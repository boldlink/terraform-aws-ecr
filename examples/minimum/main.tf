
terraform {
  required_version = ">= 0.13"
}

module "private_ecr" {
  source                    = "./../../"
  create_private_repository = true
  name                      = "samplerepo"
}

