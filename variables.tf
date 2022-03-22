
variable "name" {
  description = "(Required) Name of the repository."
  type        = string
}

variable "encryption_configuration" {
  description = "(Optional) Encryption configuration for the repository. "
  default = {
    encryption_type = null
    kms_key         = null
  }
  type = object({
    encryption_type = string
    kms_key         = any
  })
}

variable "image_tag_mutability" {
  description = "(Optional) The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE."
  default     = "MUTABLE"
  type        = string
}

variable "scan_on_push" {
  description = "(Required) Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  default     = true
  type        = bool
}

variable "environment" {
  description = "Environment tag, e.g prod, test"
  type        = string
  default     = null
}

variable "other_tags" {
  description = " Any additional values for tags"
  type        = map(string)
  default     = {}
}

variable "create_aws_ecr_repository_policy" {
  description = "Create the ecr repository policy? True or false"
  type        = bool
  default     = true
}

variable "aws_ecr_repository_policy" {
  description = "(Required) The policy document. This is a JSON formatted string."
  type        = string
  default     = ""
}

variable "create_aws_ecr_lifecycle_policy" {
  description = "Create the lifecyle policy? True or false"
  type        = bool
  default     = true
}

variable "aws_ecr_lifecycle_policy" {
  description = "(Required) The policy document. This is a JSON formatted string.."
  type        = string
  default     = ""
}

# Replication configuration

variable "create_replication_configuration" {
  description = "Whether or not to create ecr replication configuration"
  type        = bool
  default     = false
}

variable "replication_configuration" {
  description = "(Required) Replication configuration for a registry."
  type = list(object({
    region      = string
    registry_id = string
    filter      = string
    filter_type = string
  }))
  default = []
}

variable "replica_region" {
  description = "A Region to replicate to."
  type        = string
  default     = ""
}

variable "registry_id" {
  description = "The account ID of the destination registry to replicate to."
  type        = string
  default     = ""
}

# scanning configuration

variable "scan_type" {
  description = " (Required) the scanning type to set for the registry. Can be either ENHANCED or BASIC."
  type        = string
  default     = "BASIC"
}

variable "scan_on_push_filters" {
  description = "A list of repository filter to scan on push, Wildcard character is allowed"
  type        = list(string)
  default     = []
}

variable "continuous_scan_filters" {
  description = "A list of repository filter to scan continuous, Wildcard character is allowed"
  type        = list(string)
  default     = []
}


# ECR cache rule

variable "enable_pull_through_cache_rule" {
  description = "whether to enable pull through cache rule"
  type        = bool
  default     = false

}

variable "ecr_repository_prefix" {
  description = "(Required, Forces new resource) The repository name prefix to use when caching images from the source registry."
  type        = string
  default     = ""
}

variable "upstream_registry_url" {
  description = "(Required, Forces new resource) The registry URL of the upstream public registry to use as the source."
  type        = string
  default     = ""
}

# ECR registry policy

variable "registry_policy" {
  description = "(Required) The policy document. This is a JSON formatted string"
  type        = string
  default     = ""
}
