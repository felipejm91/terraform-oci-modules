resource "oci_core_instance" "instancia" {

  availability_domain = var.instance_availability_domain
  compartment_id      = var.compartimento
  shape               = var.instance_shape

  agent_config {
    is_management_disabled = false # Set to true to disable Management Agent, false to enable
    is_monitoring_disabled = false # Set to true to disable Monitoring Agent, false to enable
    dynamic "plugins_config" {
      for_each = var.agent_plugins_desired_state
      content {
        desired_state = plugins_config.value
        name          = plugins_config.key
      }
    }
  }

  create_vnic_details {
    display_name   = var.vnic_name
    nsg_ids        = var.vnic_nsg_ids
    subnet_id      = var.public_subnet_ocid
    hostname_label = var.vnic_name

    # Public IP assignment
    assign_public_ip = var.assign_new_public_ip # Assigns an ephemeral public IP if true

  }

  display_name = var.srv_name

  freeform_tags = var.tags_freeform

  launch_options {
    boot_volume_type                    = var.boot_volume_type
    is_pv_encryption_in_transit_enabled = "true"
    network_type                        = "PARAVIRTUALIZED"
  }

  metadata = {
    "ssh_authorized_keys" = file(var.ssh_path)
  }

  shape_config {
    memory_in_gbs = var.memory_size
    ocpus         = var.ocpu_size
  }

  source_details {
    source_id   = var.source_ocid_image
    source_type = "image"

    boot_volume_size_in_gbs = var.boot_volume_size
    boot_volume_vpus_per_gb = var.boot_volume_vpus
  }
  preserve_boot_volume = false

  is_pv_encryption_in_transit_enabled = true

  lifecycle {
    prevent_destroy = false
  }
}
