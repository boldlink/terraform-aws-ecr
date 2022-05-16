
module "private_ecr" {
  source                    = "./../../"
  create_private_repository = true
  name                      = "samplerepo"
}
