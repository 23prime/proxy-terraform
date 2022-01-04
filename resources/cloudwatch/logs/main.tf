resource "aws_cloudwatch_log_group" "this" {
  for_each          = var.log_group_names
  name              = each.value
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id
  tags              = merge(var.tags, { "Name" = each.value })
}
