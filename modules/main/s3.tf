module "pac_s3_bucket" {
  source = "../../resources/s3/complete"
  acl    = "private"
  bucket = "${var.tags.service}-${var.tags.env}-pac"
  tags   = var.tags

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  objects = {
    0 = {
      key     = "proxy.pac"
      acl     = "public-read"
      content = data.template_file.pac.rendered
    }
  }
}
