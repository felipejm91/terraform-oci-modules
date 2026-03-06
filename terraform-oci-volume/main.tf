terraform {
  required_version = ">=1.9.4"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.6.0"
    }
  }
}

#Declara o volume
resource "oci_core_volume" "data_volume" {
  compartment_id      = var.compartimento_ocid
  availability_domain = var.instance_availability_domain
  display_name        = var.volume_display_name
  size_in_gbs         = var.size_in_gbs_volume
  vpus_per_gb         = var.vpus_per_gbs_volume
  freeform_tags       = var.tags_freeform
}

#Anexa o volume à instância
resource "oci_core_volume_attachment" "volume_attachment" {
  attachment_type = "paravirtualized"
  instance_id     = var.instance_ocid
  volume_id       = oci_core_volume.data_volume.id

  display_name                        = var.volume_display_name
  is_pv_encryption_in_transit_enabled = "true"
  is_read_only                        = "false"
  is_shareable                        = "true"
}
