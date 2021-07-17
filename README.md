# Descrição
- Repositório com alguns modulos AWS para uso

## Como utilizar o modulo:
```bash
module "sns" {
  source         = "./modules/sns"
  sns_topic_name = "nome_do_seu_topic"
  endpoint       = "iluiz.sousa@gmail.com" #quem recebera o email
}
module "identificacao_do_seu_modulo" {
  source              = "./modules/cloudwatch" 
  metric_name         = "Nome da metrica"
  metric_pattern      = "{ ($.errorCode = \"minha_metrica\") }"
  alarm_namespace     = "namespace_para_organizar_alarmes"
  comparison_operator = "metrica_para_compracao_and_or"
  period              = "intervalo_para_analise_em_segundos"
  statistic           = "media_valor_atual_ou_sumarizado"
  threshold           = "treshold_que_ira_ativar_o_alerta"
  alarm_description   = "Descrição simples do seu alarma"
  sns_arn             = module.sns.sns_arn #caso esteja usando o modulo de sns
}
```


# To Do
- Implementar modulos de S3, CLoudTrail