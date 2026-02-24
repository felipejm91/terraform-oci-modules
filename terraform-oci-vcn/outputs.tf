output "vcn_id" {
  value       = oci_core_vcn.vcn.id
  description = "OCID da VCN criada."
}

output "public_subnet_id" {
  value       = oci_core_subnet.vcn_public_subnet.id
  description = "OCID da subnet pública."
}

output "private_subnet_id" {
  value       = oci_core_subnet.vcn_private_subnet.id
  description = "OCID da subnet privada."
}