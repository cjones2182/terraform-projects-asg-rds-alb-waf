# bucket creation 
resource "aws_s3_bucket" "central_log_bucket281330" {  
  bucket = "central-log-bucket281330"

object_lock_enabled = true
}

# bucket versioning
resource "aws_s3_bucket_versioning" "central_log_bucket" {
  bucket = aws_s3_bucket.central_log_bucket281330.id

  versioning_configuration {
    status = "Enabled"
  }
}
# bucket object lock configuration
resource "aws_s3_bucket_object_lock_configuration" "central_log_bucket_object_lock_config" {
  bucket = aws_s3_bucket.central_log_bucket281330.id

  rule {
    default_retention {
      mode = "GOVERNANCE" #USED GOVERNANCE SO IT CAN BE DELETED 
      days = 30
    }
  }
}
# public access block 
resource "aws_s3_bucket_public_access_block" "central_log_bucket_public_access_block" {
 bucket = aws_s3_bucket.central_log_bucket281330.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# bucket sse 
resource "aws_s3_bucket_server_side_encryption_configuration" "central_log_bucket_sse" {
 bucket = aws_s3_bucket.central_log_bucket281330.id
rule {
  apply_server_side_encryption_by_default {
    sse_algorithm = "AES256"

   }
 }
}
resource "aws_s3_bucket_policy" "access_logs_bucket_policy" {
 bucket =  aws_s3_bucket.central_log_bucket281330.id

 policy = jsonencode({
    "Version": "2012-10-17"

   "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "logdelivery.elasticloadbalancing.amazonaws.com"
      },
      "Action": "s3:PutObject"
      "Resource": "${aws_s3_bucket.central_log_bucket281330.arn}/*"
    }]
  })
}