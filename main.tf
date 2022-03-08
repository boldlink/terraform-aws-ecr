
resource "aws_ecr_repository" "main" {
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

resource "aws_ecr_repository_policy" "main" {
  count      = var.create_aws_ecr_repository_policy ? 1 : 0
  repository = aws_ecr_repository.main.name
  policy     = var.aws_ecr_repository_policy
}

resource "aws_ecr_lifecycle_policy" "main" {
  count      = var.create_aws_ecr_lifecycle_policy ? 1 : 0
  repository = aws_ecr_repository.main.name
  policy     = var.aws_ecr_lifecycle_policy
}
