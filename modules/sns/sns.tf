locals {
  common_tags = {
    Name = "alarms_security_${terraform.workspace}"
  }
}
#Caso for usar um SNS para envio dos alarmes via email
resource "aws_sns_topic" "alarms" {
  name  = var.sns_topic_name
  tags  = local.common_tags
}
resource "aws_sns_topic_subscription" "alarms_subscription" {
  topic_arn = aws_sns_topic.alarms.arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}