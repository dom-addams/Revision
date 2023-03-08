resource "azurerm_subnet" "firewall" {
  name                 = "firewall-subnet"
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "firewall" {
  name                = "firewall-ip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "firewall" {
  name                = "firewall-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.firewall.id
    public_ip_address_id          = azurerm_public_ip.firewall.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "firewall" {
  name                  = "firewall-vm"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.firewall.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Microsoft"
    offer     = "AzureFirewall"
    sku       = "azfw-hub"
    version   = "latest"
  }

  os_profile {
    computer_name  = "firewall-vm"
    admin_username = "adminuser"
    admin_password = "adminpassword"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
  }
}

resource "azurerm_route_table" "firewall" {
  name                = "firewall-routes"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet_route_table_association" "firewall" {
  subnet_id      = azurerm_subnet.example.id
  route_table_id = azurerm_route_table.firewall.id
}

resource "azurerm_route" "firewall" {
  name                = "firewall-route"
  route_table_id      = azurerm_route_table.firewall.id
  address_prefix      = "0.0.0.0/24"
  next_hop_type       = "VnetLocal"
}
