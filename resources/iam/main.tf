resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = templatefile(var.role_document, var.role_parameters)
  tags               = merge(var.tags, { "Name" = var.role_name })
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.policies)
  role       = aws_iam_role.this.name
  policy_arn = var.policies[count.index]
  depends_on = [aws_iam_role.this]
}

resource "aws_iam_role_policy" "this" {
  count  = var.create_aws_iam_role_policy ? 1 : 0
  name   = var.policy_name
  role   = aws_iam_role.this.id
  policy = templatefile(var.policy_document, var.policy_parameters)
}

resource "aws_iam_instance_profile" "this" {
  count      = var.create_iam_instance_profile ? 1 : 0
  name       = var.profile_name
  role       = aws_iam_role.this.name
  depends_on = [aws_iam_role.this]
}
