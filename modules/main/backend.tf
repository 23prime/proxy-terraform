terraform {
  required_version = "1.0.3"

  backend "s3" {
    bucket  = "proxy-tfstate-678084882233"
    encrypt = true
    key     = "tfstate/main/terraform.tfstate"
    region  = "ap-northeast-1"
  }
}
