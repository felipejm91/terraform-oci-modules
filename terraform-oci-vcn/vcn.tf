#Cria uma VCN
resource "oci_core_vcn" "vcn" {

  compartment_id = var.compartimento_ocid

  cidr_blocks   = var.cidr_blocks_vcn
  display_name  = var.vcn_display_name
  dns_label     = var.vcn_dns_label
  freeform_tags = var.tags_freeform
}

#Define a subrede pública
resource "oci_core_subnet" "vcn_public_subnet" {
  cidr_block                 = var.cidr_blocks_public_subnet
  compartment_id             = var.compartimento_ocid
  vcn_id                     = oci_core_vcn.vcn.id
  display_name               = var.vcn_public_subnet_display_name
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_default_route_table.default_route_table_vcn.id
  dns_label                  = "publicdns"
  freeform_tags              = var.tags_freeform
}

#Define a subrede privada
resource "oci_core_subnet" "vcn_private_subnet" {
  cidr_block                 = var.cidr_blocks_private_subnet
  compartment_id             = var.compartimento_ocid
  vcn_id                     = oci_core_vcn.vcn.id
  display_name               = var.vcn_private_subnet_display_name
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.route_table_for_private_subnet.id
  dns_label                  = "privatedns"
  freeform_tags              = var.tags_freeform
}

