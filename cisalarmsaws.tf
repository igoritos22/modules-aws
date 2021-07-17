module "sns" {
  source         = "./modules/sns"
  sns_topic_name = "SecurityAlarmsAWS"
  endpoint       = "iluiz.sousa@gmail.com"
}
module "cis_UnauthorizedAPICall" {
  source              = "./modules/cloudwatch"
  metric_name         = "UnauthorizedAPICall"
  metric_pattern      = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
  alarm_namespace     = "CISAmazonWebServices"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = "300"
  statistic           = "Sum"
  threshold           = "10"
  alarm_description   = "Detecção chamadas não autorizadas na API da AWS"
  sns_arn             = module.sns.sns_arn
}

module "cis_IAMChanges" {
  source              = "./modules/cloudwatch"
  metric_name         = "IAMChangePolicy"
  metric_pattern      = "{($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"
  alarm_namespace     = "CISAmazonWebServices"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Detecção de alterações realizadas nas políticas do IAM"
  sns_arn             = module.sns.sns_arn
}
module "cis_ConsoleLoginFailure" {
  source              = "./modules/cloudwatch"
  metric_name         = "ConsoleLoginFailure"
  metric_pattern      = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"
  alarm_namespace     = "CISAmazonWebServices"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = "300"
  statistic           = "Sum"
  threshold           = "3"
  alarm_description   = "Detecção de tentativas de login mal sucediadas na consle da AWS"
  sns_arn             = module.sns.sns_arn
}
module "cis_S3Changes" {
  source              = "./modules/cloudwatch"
  metric_name         = "S3Changes"
  metric_pattern      = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"
  alarm_namespace     = "CISAmazonWebServices"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Detecção de alterações na configuração ou politicas dos Buckets"
  sns_arn             = module.sns.sns_arn
}
module "cis_NACLsChanges" {
  source              = "./modules/cloudwatch"
  metric_name         = "NACLsChanges"
  metric_pattern      = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"
  alarm_namespace     = "CISAmazonWebServices"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Detação de alterações nas Network ACLs"
  sns_arn             = module.sns.sns_arn
}
module "cis_SecurityGroupChanges" {
  source              = "./modules/cloudwatch"
  metric_name         = "SecurityGroupChanges"
  metric_pattern      = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup)}"
  alarm_namespace     = "CISAmazonWebServices"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Detecção de alterações realizadas securityGroups"
  sns_arn             = module.sns.sns_arn
}
module "cis_OrganizationChanges" {
  source              = "./modules/cloudwatch"
  metric_name         = "OrganizationChanges"
  metric_pattern      = "{ ($.eventSource = organizations.amazonaws.com) && (($.eventName = \"AcceptHandshake\") || ($.eventName = \"AttachPolicy\") || ($.eventName = \"CreateAccount\") || ($.eventName = \"CreateOrganizationalUnit\") || ($.eventName= \"CreatePolicy\") || ($.eventName = \"DeclineHandshake\") || ($.eventName = \"DeleteOrganization\") || ($.eventName = \"DeleteOrganizationalUnit\") || ($.eventName = \"DeletePolicy\") || ($.eventName = \"DetachPolicy\") || ($.eventName = \"DisablePolicyType\") || ($.eventName = \"EnablePolicyType\") || ($.eventName = \"InviteAccountToOrganization\") || ($.eventName = \"LeaveOrganization\") || ($.eventName = \"MoveAccount\") || ($.eventName = \"RemoveAccountFromOrganization\") || ($.eventName = \"UpdatePolicy\") || ($.eventName =\"UpdateOrganizationalUnit\")) }"
  alarm_namespace     = "CISAmazonWebServices"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Detecção de alterações a nível da organização da AWS"
  sns_arn             = module.sns.sns_arn
}
module "cis_RouteTableChanges" {
  source              = "./modules/cloudwatch"
  metric_name         = "RouteTableChanges"
  metric_pattern      = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"
  alarm_namespace     = "CISAmazonWebServices"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "Detecção de alterações realizadas nas tabelas de roteamento"
  sns_arn             = module.sns.sns_arn
}