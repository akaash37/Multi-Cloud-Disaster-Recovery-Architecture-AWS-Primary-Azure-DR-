output "aws_tools_public_ip" {
  value = module.aws.tools_public_ip
}

output "aws_app_public_ip" {
  value = module.aws.app_public_ip
}

output "aws_vpc_id" {
  value = module.aws.vpc_id
}

output "azure_vm_public_ip" {
  value = module.azure.vm_public_ip
}

output "azure_resource_group" {
  value = module.azure.resource_group_name
}
