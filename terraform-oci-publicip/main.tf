terraform {
  required_version = ">=1.9.4"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.6.0"
    }
  }
}

resource "oci_core_public_ip" "public_ip" {
  compartment_id = var.compartimento_ocid
  lifetime       = var.public_ip_lifetime
  display_name   = var.public_ip_display_name
  freeform_tags  = var.tags_freeform
  private_ip_id  = var.private_ip_ocid
}

output "ip_address" {
  value       = oci_core_public_ip.public_ip.ip_address
  description = "IP criado."
}

