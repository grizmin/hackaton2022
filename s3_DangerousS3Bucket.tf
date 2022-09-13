resource "aws_s3_bucket" "dangerouss3bucket" {
  # arn           = "arn:aws:s3:::dangerouss3bucket"
  bucket        = "${local.s3_bucekt_name}"
  force_destroy = "false"

  object_lock_enabled = "false"

}

resource "aws_s3_bucket_policy" "dangerouss3bucket" {
  bucket = aws_s3_bucket.dangerouss3bucket.bucket
  policy = data.aws_iam_policy_document.dangerouss3bucket_document.json
}

data "aws_iam_policy_document" "dangerouss3bucket_document" {
    statement {
      sid = "Statement1"
      effect = "Allow"
      principals {
        type = "*"
        identifiers = ["*"]
      }
      actions = [
        "s3:GetObject",
        "s3:ListBucket"
      ]
      resources = [
        aws_s3_bucket.dangerouss3bucket.arn,
        "${aws_s3_bucket.dangerouss3bucket.arn}/*",
      ]
    }
}
