resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 15
  require_lowercase_characters   = true
  require_uppercase_characters   = true
#   require_numbers                = true
  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 60
#   password_reuse_prevention      = true
}