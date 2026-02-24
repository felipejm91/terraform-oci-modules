#Cria tabela de roteamento da subrede privada
resource "oci_core_route_table" "route_table_for_private_subnet" {
  compartment_id = var.compartimento_ocid
  vcn_id         = oci_core_vcn.vcn.id

  display_name = var.route_table_for_private_subnet_display_name
  route_rules {
    network_entity_id = oci_core_nat_gateway.vcn_nat_gateway.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
  route_rules {
    network_entity_id = oci_core_service_gateway.service_gateway.id
    destination       = "all-gru-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
  }

  freeform_tags = var.tags_freeform
}

#Cria tabela de roteamento default da VCN
resource "oci_core_default_route_table" "default_route_table_vcn" {
  compartment_id             = var.compartimento_ocid
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  display_name               = var.default_route_table_vcn_display_name
  route_rules {
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }

  freeform_tags = var.tags_freeform
}