# locals.tf

locals {
  # Construct a unique name for resources by combining the environment with a base name
  resource_name_prefix = "${var.environment}-terraform-demo"

  # Define common tags
  common_tags = merge(
    {
      Environment = var.environment
      Project     = "TerraformVariablesLocalsDemo"
    },
    var.additional_tags
  )
}
