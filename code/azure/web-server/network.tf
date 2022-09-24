resource "azurerm_virtual_network" "my-vnet" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraform_demo.location
  resource_group_name = azurerm_resource_group.terraform_demo.name
}

resource "azurerm_public_ip" "public_ip" {
  name                = "vm_public_ip"
  resource_group_name = azurerm_resource_group.terraform_demo.name
  location            = azurerm_resource_group.terraform_demo.location
  allocation_method   = "Dynamic"
}

resource "azurerm_subnet" "my-subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.terraform_demo.name
  virtual_network_name = azurerm_virtual_network.my-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "my-vni" {
  name                = "example-nic"
  location            = azurerm_resource_group.terraform_demo.location
  resource_group_name = azurerm_resource_group.terraform_demo.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_network_security_group" "my-nsg" {
  name                = "ssh_nsg"
  location            = azurerm_resource_group.terraform_demo.location
  resource_group_name = azurerm_resource_group.terraform_demo.name

  security_rule {
    name                       = "allow_ssh_sg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.my-vni.id
  network_security_group_id = azurerm_network_security_group.my-nsg.id
}
