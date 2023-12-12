terraform {
  backend "s3" {
    bucket = "b50-test-s3-bucket"
    key    = "dev/default.tfstate"
    region = "us-east-1"
  }
}