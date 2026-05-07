resource "azurerm_public_ip" "this" {
  name                = "${var.project_name}-azure-pip"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    project = var.project_name
  }
}

resource "azurerm_network_interface" "this" {
  name                = "${var.project_name}-azure-nic"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.this.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }

  tags = {
    project = var.project_name
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                = "${var.project_name}-azure-vm"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.this.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
    # ssh_public_key_path = "C:/Users/user/.ssh/id_rsa.pub"
  }

  os_disk {
    name                 = "${var.project_name}-azure-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  disable_password_authentication = true

  tags = {
    project = var.project_name
    role    = "dr-app"
  }
}
