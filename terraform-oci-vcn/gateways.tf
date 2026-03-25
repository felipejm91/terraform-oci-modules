#Cria o gateway de internet
resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartimento_ocid
  vcn_id         = oci_core_vcn.vcn.id
  enabled        = var.enabled
  display_name   = var.internet_gateway_display_name

  freeform_tags = var.tags_freeform
}

#Cria o gateway NAT
resource "oci_core_nat_gateway" "vcn_nat_gateway" {
  compartment_id = var.compartimento_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.nat_gateway_display_name
  block_traffic  = false

  freeform_tags = var.tags_freeform
}

#Cria o gateway de Serviços
resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.compartimento_ocid
  vcn_id         = oci_core_vcn.vcn.id

  services {
    # All GRU Services In Oracle Services Network
    service_id = var.service_gateway_service_id
  }
  display_name = var.service_gateway_display_name

  freeform_tags = var.tags_freeform
}