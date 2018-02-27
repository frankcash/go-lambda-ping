provider "aws" {
  region = "us-east-1"
}

variable "url" {
  type        = "string"
  description = "URL of website to ping"
  default     = "http://example.com"
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "demo_lambda" {
  function_name    = "demo_lambda"
  handler          = "main"
  runtime          = "go1.x"
  filename         = "./function/function.zip"
  source_code_hash = "${base64sha256(file("./function/function.zip"))}"
  role             = "${aws_iam_role.lambda_exec_role.arn}"

  environment {
    variables = {
      URL = "${var.url}"
    }
  }
}
