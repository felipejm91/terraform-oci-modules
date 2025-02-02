terraform {
  required_version = "1.9.4"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.6.0"
    }
  }
}

resource "oci_identity_compartment" "compartimento" {
  compartment_id = var.parent_compartment_id
  description    = var.compartment_description
  name           = var.compartment_name
  enable_delete  = var.enable_delete
  freeform_tags  = var.tags_freeform
}

output "ocid_compartimento" {
  value       = oci_identity_compartment.compartimento.id
  description = "OCID do compartimento criado"
}