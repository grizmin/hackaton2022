resource "aws_lambda_function" "DangeorousLambda" {
  architectures = ["x86_64"]

  ephemeral_storage {
    size = "512"
  }
  filename                       = "lambda_function_payload.zip"
  function_name                  = "DangeorousLambda"
  handler                        = "lambda_function.lambda_handler"
  memory_size                    = "128"
  package_type                   = "Zip"
  reserved_concurrent_executions = "-1"
  role                           = aws_iam_role.DangerousLambdaRole.arn
  runtime                        = "python3.9"

  tags = {
    Demo = "True"
  }

  tags_all = {
    Demo = "True"
  }

  timeout = "3"

  tracing_config {
    mode = "PassThrough"
  }
}