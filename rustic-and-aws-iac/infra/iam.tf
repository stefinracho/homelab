resource "aws_iam_user" "rustic" {
  name = "rustic"
}

resource "aws_iam_access_key" "rustic" {
  user = aws_iam_user.rustic.name
}

resource "aws_iam_user_policy" "rustic" {
  user = aws_iam_user.rustic.name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Action = "s3:ListBucket"
        Resource = [
          aws_s3_bucket.hot.arn,
          aws_s3_bucket.cold.arn,
        ]
        Effect = "Allow"
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
        ]
        Resource = [
          "${aws_s3_bucket.hot.arn}/*",
          "${aws_s3_bucket.cold.arn}/*",
        ]
        Effect = "Allow"
      },
      {
        Action   = "s3:RestoreObject"
        Resource = "${aws_s3_bucket.cold.arn}/*",
        Effect   = "Allow"
      },
    ]
  })
}

output "access_key_id" {
  value     = aws_iam_access_key.rustic.id
  sensitive = true
}

output "access_key_secret" {
  value     = aws_iam_access_key.rustic.secret
  sensitive = true
}
