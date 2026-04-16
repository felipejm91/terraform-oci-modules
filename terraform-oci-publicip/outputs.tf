output "public_ip_id" {
  value       = oci_core_public_ip.public_ip.id
  description = "OCID do IP público reservado criado."
}
