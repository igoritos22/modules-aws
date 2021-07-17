variable sns_arn {
  type = list
  description = "ARN do SNS para envio dos emails"
}
variable "log_group_name" {
  type        = string
  description = "Nome do grupo de logs do cloudTrial"
  default     = "aws-cloudtrail-logs-seginfoalarms"
}
variable "alarm_namespace" {
  type        = string
  description = "Namespace onde serao organizados os alarmes"
}
variable metric_name {
  type = string
  description = "Nome da metrica e alarme"
}
variable metric_pattern {
  type = string
  description = "A string do filtro nos logs do cloudtrail"
}
variable comparison_operator {
  type = string
  description = "O tipo de comparação para o alarme"
}       
variable period {
  type = string
  description = "Periodo de analise da metrica"
}                    
variable statistic {
  type = string
  description = "tipo do agregador das estatiscas"
}               
variable threshold {
  type = string
  description = "threshold ou trigger que ativara o alerta"
}                
variable alarm_description {
  type = string
  description = "descrição para o alerta configurado"
}         