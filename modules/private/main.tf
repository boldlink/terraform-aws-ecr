
resource "aws_ecr_repository" "this" {
  count                = var.create_private_repository ? 1 : 0
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration != null ? [var.encryption_configuration] : []
    content {
      encryption_type = encryption_configuration.value.encryption_type
      kms_key         = encryption_configuration.value.kms_key
    }
  }

  tags = merge(
    {
      "Name"        = "${var.name}_tag"
      "Environment" = var.environment
    },
    var.other_tags,
  )

}

# Replication configuration

resource "aws_ecr_replication_configuration" "this" {
  count = var.create_replication_configuration && var.create_private_repository ? 1 : 0
  replication_configuration {
    rule {
      destination {
        region      = var.replica_region
        registry_id = var.registry_id
      }
      dynamic "repository_filter" {
        for_each = try(var.replication_configuration, [])
        content {
          filter      = lookup(repository_filter.value, "filter", null)
          filter_type = lookup(repository_filter.value, "filter_type", "PREFIX_MATCH")
        }
      }
    }
  }
}

# Scanning configuration

resource "aws_ecr_registry_scanning_configuration" "this" {
  count     = var.scan_on_push && var.create_private_repository ? 1 : 0
  scan_type = var.scan_type

  dynamic "rule" {
    for_each = var.scan_on_push_filters
    content {
      scan_frequency = "SCAN_ON_PUSH"

      repository_filter {
        filter      = lookup(repository_filter.value, "filter", "*")
        filter_type = lookup(repository_filter.value, "filter_type", "WILDCARD")
      }
    }
  }

  dynamic "rule" {
    for_each = var.continuous_scan_filters
    content {
      scan_frequency = "CONTINUOUS_SCAN"

      repository_filter {
        filter      = lookup(repository_filter.value, "filter", "*")
        filter_type = lookup(repository_filter.value, "filter_type", "WILDCARD")
      }
    }
  }

}

#  Pull through cache rule

resource "aws_ecr_pull_through_cache_rule" "this" {
  count                 = var.enable_pull_through_cache_rule && var.create_private_repository ? 1 : 0
  ecr_repository_prefix = var.ecr_repository_prefix
  upstream_registry_url = var.upstream_registry_url
}

resource "aws_ecr_repository_policy" "this" {
  count      = var.create_aws_ecr_repository_policy && var.create_private_repository ? 1 : 0
  repository = aws_ecr_repository.this[0].name
  policy     = var.aws_ecr_repository_policy
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = var.create_aws_ecr_lifecycle_policy && var.create_private_repository ? 1 : 0
  repository = aws_ecr_repository.this[0].name
  policy     = var.aws_ecr_lifecycle_policy
}

# ECR registry policy

resource "aws_ecr_registry_policy" "name" {
  count  = var.create_replication_configuration && var.create_private_repository ? 1 : 0
  policy = var.registry_policy
}
