# Output the website endpoint of the S3 bucket
output "websiteendpoint" {
  # The value of this output will be the website endpoint URL for the static website
  value = aws_s3_bucket.mybucket.website_endpoint
}
