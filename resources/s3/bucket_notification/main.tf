resource "aws_s3_bucket_notification" "this" {
  bucket = var.bucket

  dynamic "lambda_function" {
    for_each = var.lambda_function
    content {
      events              = lambda_function.value.events
      filter_prefix       = lookup(lambda_function.value, "filter_prefix", null)
      filter_suffix       = lookup(lambda_function.value, "filter_suffix", null)
      lambda_function_arn = lambda_function.value.lambda_function_arn
    }
  }
}
