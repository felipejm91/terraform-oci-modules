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
