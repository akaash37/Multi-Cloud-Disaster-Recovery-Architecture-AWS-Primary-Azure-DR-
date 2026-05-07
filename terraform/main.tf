module "aws" {
  source = "./modules/aws"

  project_name      = var.project_name
  aws_region        = var.aws_region
  instance_type     = var.aws_instance_type
}

module "azure" {
  source = "./modules/azure"

  project_name  = var.project_name
  location      = var.azure_location
  vm_size       = var.azure_vm_size
}
