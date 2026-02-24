
resource "oci_core_instance" "instancia" {

  availability_domain = var.instance_availability_domain
  compartment_id      = var.compartimento
  shape               = var.instance_shape

  agent_config {

    are_all_plugins_disabled = false
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Management Agent"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Custom Logs Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute RDMA GPU Monitoring"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Auto-Configuration"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Authentication"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Block Volume Management"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
    is_management_disabled = false
    is_monitoring_disabled = false
  }

  create_vnic_details {
    display_name   = var.vnic_name
    nsg_ids        = var.nsg_ids_public
    subnet_id      = var.public_subnet_ocid
    hostname_label = var.vnic_name
  }

  display_name = var.srv_name

  freeform_tags = var.tags_freeform

  launch_options {
    # boot_volume_type = var.instance_launch_options_boot_volume_type                
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
