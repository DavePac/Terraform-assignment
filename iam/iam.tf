#creating an IAM Role

resource "aws_iam_role" "webserver_role_tf" {
  name = "webser_role_tf"
  managed_policy_arns =[aws_iam_policy.s3accesspolicyTf.arn]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "Assingnment role"
  }
}

#creating IAM policy
resource "aws_iam_policy" "s3accesspolicyTf" {
  name = "webseverS3AccessPolicy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Instance Profile
resource "aws_iam_instance_profile" "webserverver_profile" {
  name = "webserver_profile"
  role =  aws_iam_role.webserver_role_tf.name
}

output "instance_profile" {
            value =  aws_iam_instance_profile.webserverver_profile.name
}
