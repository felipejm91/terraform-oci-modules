output "instancia_id" {
  value       = oci_core_instance.instancia.id
  description = "OCID da instância criada"
}

output "instancia_private_ip" {
  value       = oci_core_instance.instancia.private_ip
  description = "IP privado da instância. VNIC pública."
}

output "instancia_public_ip" {
  value       = oci_core_instance.instancia.public_ip
  description = "IP público da instância, se habilitado."
}

output "instancia_state" {
  value       = oci_core_instance.instancia.state
  description = "Estado da instância."
}

output "instancia_time_created" {
  value       = oci_core_instance.instancia.time_created
  description = "Data e hora que instância foi criada."
}

# Necessário esses passos para pegar o OCID do IP privado e atribuir o IP público
data "oci_core_vnic_attachments" "vnic_attach_id" {
  compartment_id = var.compartimento
  instance_id    = oci_core_instance.instancia.id
}

data "oci_core_vnic" "vnic_id" {
  vnic_id = data.oci_core_vnic_attachments.vnic_attach_id.vnic_attachments[0].vnic_id
}

data "oci_core_private_ips" "private_ip_ocid" {
  vnic_id = data.oci_core_vnic.vnic_id.id
}

output "ocid_private_ip" {
  value = data.oci_core_private_ips.private_ip_ocid.private_ips[0].id
}