
output "private" {
  description = "Sample module output"
  value = [
    module.private_ecr,
  ]
}
