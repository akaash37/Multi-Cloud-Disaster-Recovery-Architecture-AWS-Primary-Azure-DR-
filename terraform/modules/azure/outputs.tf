output "resource_group_name" {
  value = azurerm_resource_group.this.name
}
output "vnet_id" {
  value = azurerm_virtual_network.this.id
}
output "subnet_id" {
  value = azurerm_subnet.this.id
}
output "nsg_id" {
  value = azurerm_network_security_group.this.id
}
output "vm_id" {
  value = azurerm_linux_virtual_machine.this.id
}
output "vm_public_ip" {
  value = azurerm_public_ip.this.ip_address
}
