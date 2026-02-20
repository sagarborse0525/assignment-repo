resource "aws_iam_role" "app_role" {
  name = "${var.prefix_name}-${var.env_name}-${var.role_name}"
  path = "/"

  # The trust policy that allows EC2 instances to assume this role.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

data "aws_iam_policy_document" "app_role_policy_doc" {
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.app_bkt.arn,
      "${aws_s3_bucket.app_bkt.arn}/*",
    ]
  }
}

# Attach the policy document to the App role
resource "aws_iam_role_policy" "app_role_policy" {
  name   = "${var.prefix_name}-${var.env_name}-${var.iam_role_policy_name}"
  role   = aws_iam_role.app_role.id
  policy = data.aws_iam_policy_document.app_role_policy_doc.json
}