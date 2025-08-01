resource "aws_iam_role" "fis_role" {
  name = "aws-fis-role"

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
  name = "experiment-runner-role"

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
