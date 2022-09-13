resource "aws_iam_role" "DangerousLambdaRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows Lambda AWS services on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "3600"
  name                 = "DangerousLambdaRole"
  path                 = "/"
}

# resource "aws_iam_role_policy_attachment" "DangerousLambdaRole_AdministratorAccess" {
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
#   role       = "DangerousLambdaRole"
# }