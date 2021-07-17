locals {
  common_tags = {
    Name = "alarms_security_${terraform.workspace}"
  }
}
resource "aws_cloudwatch_log_metric_filter" "metric_fileter_config" {
  name           = var.metric_name
  pattern        = var.metric_pattern
  log_group_name = var.log_group_name

  metric_transformation {
    name      = var.metric_name
    namespace = var.alarm_namespace
    value     = "1"
  }
}
resource "aws_cloudwatch_metric_alarm" "metric_alarm_config" {
  alarm_name                = var.metric_name
  comparison_operator       = var.comparison_operator
  evaluation_periods        = "1"
  metric_name               = aws_cloudwatch_log_metric_filter.metric_fileter_config.id
  namespace                 = var.alarm_namespace
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.threshold
  alarm_description         = var.alarm_description
  alarm_actions             = var.sns_arn
  treat_missing_data        = "notBreaching"
  insufficient_data_actions = []
  tags                      = local.common_tags
}