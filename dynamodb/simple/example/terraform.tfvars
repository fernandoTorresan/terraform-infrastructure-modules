# ---------------------------------------------------------------------------------------------------------------------
# DynamoDB - USUARIO
# Tabela responsável...
# ---------------------------------------------------------------------------------------------------------------------

terragrunt = {
  # Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
  # working directory, into a temporary folder, and execute your Terraform commands in that folder.
  terraform {
    source = "git::ssh:// git@github.com/fernandoTorresan/techtalk-terraform-blueprint.git//dynamodb/simple?ref=0.1.0"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# MODULE PARAMETERS
# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
# ---------------------------------------------------------------------------------------------------------------------

table_name = "USUARIO"

dynamodb_attributes = [
  {
    name = "cpf"
    type = "S"
  },
]

hash_key = "cpf"

# hash_key_type = "S"


# read_capacity = "5"


# write_capacity = "5"


# stream_enabled = "false"

