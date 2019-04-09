provider "aws" {
  region              = "${var.aws_region}"
  version             = "~> 1.60"
  allowed_account_ids = ["${var.aws_account_id}"]
}

terraform {
  backend "s3" {}
}

module "dynamodb" {
  source = "git::ssh://git@github.com/fernandoTorresan/techtalk-terraform-module-dynamodb.git//modules/dynamodb?ref=0.1.0"

  table_name                     = "${var.table_name}"
  hash_key                       = "${var.hash_key}"
  hash_key_type                  = "${var.hash_key_type}"
  range_key                      = "${var.range_key}"
  range_key_type                 = "${var.range_key_type}"
  stream_enabled                 = "${var.stream_enabled}"
  stream_view_type               = "${var.stream_view_type}"
  read_capacity                  = "${var.read_capacity}"
  write_capacity                 = "${var.write_capacity}"
  enable_encryption              = "${var.enable_encryption}"
  dynamodb_attributes            = "${var.dynamodb_attributes}"
  local_secondary_index_map      = "${var.local_secondary_index_map}"
  point_in_time_recovery_enabled = "${var.point_in_time_recovery_enabled}"

  tags = "${var.tags}"
}
