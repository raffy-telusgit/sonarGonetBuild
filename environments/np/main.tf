module "vpc" {
  source = "../../modules/vpc"

  project_id   = var.project_id
  region       = var.region
  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
}

module "vm" {
  source = "../../modules/vm"

  project_id    = var.project_id
  instance_name = var.vm_instance_name
  machine_type  = var.vm_machine_type
  zone          = var.zone
  subnetwork    = module.vpc.subnet_name
  tags          = ["ssh-enabled"]
}

output "vm_instance_name" {
  description = "The name of the VM instance"
  value       = module.vm.instance_name
}

output "vm_instance_ip" {
  description = "The internal IP address of the VM instance"
  value       = module.vm.instance_ip
}

output "vpc_network_name" {
  description = "The name of the VPC network"
  value       = module.vpc.network_name
}

output "vpc_subnet_name" {
  description = "The name of the VPC subnet"
  value       = module.vpc.subnet_name
}
