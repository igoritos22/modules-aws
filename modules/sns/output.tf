output sns_arn {
  value       = [aws_sns_topic.alarms.arn]
  description = "arn do sns para ser consumido"
}
