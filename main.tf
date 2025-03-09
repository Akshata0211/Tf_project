# Create an S3 bucket
resource "aws_s3_bucket" "mybucket" {
  # Bucket name is passed from the variable
  bucket = var.bucketname
}

# Define S3 Bucket Ownership Controls
resource "aws_s3_bucket_ownership_controls" "example" {
  # Referencing the bucket created above
  bucket = aws_s3_bucket.mybucket.id

  # Ownership rule set to BucketOwnerPreferred
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Define S3 Bucket Public Access Block (ensuring public access isn't fully restricted)
resource "aws_s3_bucket_public_access_block" "example" {
  # Referencing the bucket created above
  bucket = aws_s3_bucket.mybucket.id

  # These settings allow public access control lists (ACLs) and public policies to be set
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Set the ACL for the S3 bucket (public-read allows everyone to read the content)
resource "aws_s3_bucket_acl" "example" {
  # Ensure bucket ACL is applied after ownership controls and public access block
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  # Bucket ACL is set to 'public-read' for public access
  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

# Upload an index.html file to the S3 bucket
resource "aws_s3_object" "index" {
  # Specify the bucket where the file will be uploaded
  bucket = aws_s3_bucket.mybucket.id
  # Specify the object key (name in the bucket)
  key = "index.html"
  # Source file path on local machine or current directory
  source = "index.html"
  # Set the file ACL to public-read
  acl = "public-read"
  # Specify the content type for the file
  content_type = "text/html"
}

# Upload an error.html file to the S3 bucket
resource "aws_s3_object" "error" {
  # Specify the bucket where the file will be uploaded
  bucket = aws_s3_bucket.mybucket.id
  # Specify the object key (name in the bucket)
  key = "error.html"
  # Source file path on local machine or current directory
  source = "error.html"
  # Set the file ACL to public-read
  acl = "public-read"
  # Specify the content type for the file
  content_type = "text/html"
}

# Upload a profile image to the S3 bucket
resource "aws_s3_object" "profile" {
  # Specify the bucket where the file will be uploaded
  bucket = aws_s3_bucket.mybucket.id
  # Specify the object key (name in the bucket)
  key = "profile.png"
  # Source file path on local machine or current directory
  source = "profile.png"
  # Set the file ACL to public-read
  acl = "public-read"
}

# Configure the bucket as a static website
resource "aws_s3_bucket_website_configuration" "website" {
  # Referencing the bucket created above
  bucket = aws_s3_bucket.mybucket.id

  # Set the index document for the static website
  index_document {
    suffix = "index.html"
  }

  # Set the error document for the static website
  error_document {
    key = "error.html"
  }

  # Ensure website configuration is applied after the bucket ACL
  depends_on = [ aws_s3_bucket_acl.example ]
}
