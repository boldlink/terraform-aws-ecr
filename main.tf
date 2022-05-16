module "private" {
  source                           = "./modules/private"
  create_private_repository        = var.create_private_repository
  name                             = var.name
  image_tag_mutability             = var.image_tag_mutability
  create_replication_configuration = var.create_replication_configuration
  scan_on_push                     = var.scan_on_push
  scan_type                        = var.scan_type
  enable_pull_through_cache_rule   = var.enable_pull_through_cache_rule
  ecr_repository_prefix            = var.ecr_repository_prefix
  upstream_registry_url            = var.upstream_registry_url
  replica_region                   = var.replica_region
  registry_id                      = var.registry_id
  replication_configuration        = var.replication_configuration
  encryption_configuration         = var.encryption_configuration
  aws_ecr_lifecycle_policy         = var.aws_ecr_lifecycle_policy
  aws_ecr_repository_policy        = var.aws_ecr_repository_policy
  registry_policy                  = var.registry_policy
  create_aws_ecr_repository_policy = var.create_aws_ecr_repository_policy
  create_aws_ecr_lifecycle_policy  = var.create_aws_ecr_lifecycle_policy
  environment                      = var.environment
  other_tags                       = var.other_tags
  scan_on_push_filters             = var.scan_on_push_filters
  continuous_scan_filters          = var.continuous_scan_filters
}

module "public" {
  source                             = "./modules/public"
  create_public_repository           = var.create_public_repository
  repository_name                    = var.name
  catalog_data                       = var.catalog_data
  timeouts                           = var.timeouts
  create_ecrpublic_repository_policy = var.create_ecrpublic_repository_policy
  policy                             = var.policy
}
