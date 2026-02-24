output "nsg_id" {
  value       = oci_core_network_security_group.network_security_group.id
  description = "OCID do NSG criado."
}

output "nsg_name" {
  value       = oci_core_network_security_group.network_security_group.display_name
  description = "Nome de exibição do NSG criado."
}