output "tls_private_key" {
  value     = tls_private_key.this.private_key_pem
  sensitive = true
}

output "admin_username" {
  value     = azurerm_linux_virtual_machine.this.admin_username
  sensitive = true
}

output "public_ip" {
  value = azurerm_public_ip.this.ip_address
}
