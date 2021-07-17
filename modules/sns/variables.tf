variable "sns_topic_name" {
  type        = string
  description = "Nome do Topic"
}
variable "protocol" {
  type        = string
  description = "Protocolo da publicação do SNS subscription"
  default     = "email"
}
variable "endpoint" {
  type        = string
  description = "lista de emails que recerão os alertas"
}