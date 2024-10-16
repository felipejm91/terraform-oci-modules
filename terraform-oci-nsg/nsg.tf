resource "oci_core_network_security_group" "network_security_group" {
  compartment_id = var.compartimento_ocid
  vcn_id         = var.vcn_ocid
  display_name   = var.name_display
}