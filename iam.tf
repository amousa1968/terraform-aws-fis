resource "aws_iam_role" "fis_role" {
  name = var.iam_role_name_fis

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "fis.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "fis_role_policy" {
  role       = aws_iam_role.fis_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSFaultInjectionServiceRolePolicy"
}

#------------------------------------------------------
# AWSFaultInjectionServiceRolePolicy managed policy
#------------------------------------------------------
resource "aws_iam_role" "experiment_runner" {
  name = var.iam_role_name_experiment_runner

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "fis.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "experiment_runner_policy" {
  role       = aws_iam_role.experiment_runner.name
  policy_arn = "arn:aws:iam::aws:policy/AWSFaultInjectionServiceRolePolicy"
}
