resource "azurerm_resource_group" "this" {
  name     = "${var.project_name}-azure-rg"
  location = var.location

  tags = {
    project = var.project_name
  }
}
resource "azurerm_virtual_network" "this" {
  name                = "${var.project_name}-azure-vnet"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = [var.vnet_cidr]

  tags = {
    project = var.project_name
  }
}
resource "azurerm_subnet" "this" {
  name                 = "${var.project_name}-azure-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.subnet_cidr]
}
