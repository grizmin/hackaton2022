resource "aws_iam_role" "testIPRole" {
  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
  path                 = "/"
  description          = "Allows Lambda AWS services on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  name                 = "testIPRole"
}


resource "aws_iam_instance_profile" "testIPRole" {
  name = "testIPRole"
  role = aws_iam_role.testIPRole.name
}

