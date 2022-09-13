data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  s3_bucekt_name = "dangerouss3bucket-${local.account_id}"
}