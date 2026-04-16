resource "oci_core_network_security_group" "network_security_group" {
  compartment_id = var.compartimento_ocid
  vcn_id         = var.vcn_ocid
  display_name   = var.name_display
}

# Ingress Rules
resource "oci_core_network_security_group_security_rule" "ingress_rules" {
  for_each = {
    for idx, rule in var.ingress_rules : idx => rule
  }

  network_security_group_id = oci_core_network_security_group.network_security_group.id
  direction                 = "INGRESS"
  protocol                  = each.value.protocol
  stateless                 = lookup(each.value, "stateless", false)

  dynamic "tcp_options" {
    for_each = each.value.protocol == "6" && (lookup(each.value, "source_port_range", "") != "" || lookup(each.value, "destination_port_range", "") != "") ? [each.value] : []
    content {
      source_port_range {
        min = split("-", tcp_options.value.source_port_range)[0]
        max = length(split("-", tcp_options.value.source_port_range)) > 1 ? split("-", tcp_options.value.source_port_range)[1] : split("-", tcp_options.value.source_port_range)[0]
      }
      destination_port_range {
        min = split("-", tcp_options.value.destination_port_range)[0]
        max = length(split("-", tcp_options.value.destination_port_range)) > 1 ? split("-", tcp_options.value.destination_port_range)[1] : split("-", tcp_options.value.destination_port_range)[0]
      }
    }
  }

  dynamic "udp_options" {
    for_each = each.value.protocol == "17" && (lookup(each.value, "source_port_range", "") != "" || lookup(each.value, "destination_port_range", "") != "") ? [each.value] : []
    content {
      source_port_range {
        min = split("-", udp_options.value.source_port_range)[0]
        max = length(split("-", udp_options.value.source_port_range)) > 1 ? split("-", udp_options.value.source_port_range)[1] : split("-", udp_options.value.source_port_range)[0]
      }
      destination_port_range {
        min = split("-", udp_options.value.destination_port_range)[0]
        max = length(split("-", udp_options.value.destination_port_range)) > 1 ? split("-", udp_options.value.destination_port_range)[1] : split("-", udp_options.value.destination_port_range)[0]
      }
    }
  }

  dynamic "icmp_options" {
    for_each = each.value.protocol == "1" && (lookup(each.value, "icmp_type", null) != null || lookup(each.value, "icmp_code", null) != null) ? [each.value] : []
    content {
      type = icmp_options.value.icmp_type
      code = lookup(icmp_options.value, "icmp_code", null)
    }
  }

  # Conditional attributes for source
  source_type = each.value.source_type
  source      = each.value.source
}

# Egress Rules
resource "oci_core_network_security_group_security_rule" "egress_rules" {
  for_each = {
    for idx, rule in var.egress_rules : idx => rule
  }

  network_security_group_id = oci_core_network_security_group.network_security_group.id
  direction                 = "EGRESS"
  protocol                  = each.value.protocol
  stateless                 = lookup(each.value, "stateless", false)

  dynamic "tcp_options" {
    for_each = each.value.protocol == "6" && (lookup(each.value, "source_port_range", "") != "" || lookup(each.value, "destination_port_range", "") != "") ? [each.value] : []
    content {
      source_port_range {
        min = split("-", tcp_options.value.source_port_range)[0]
        max = length(split("-", tcp_options.value.source_port_range)) > 1 ? split("-", tcp_options.value.source_port_range)[1] : split("-", tcp_options.value.source_port_range)[0]
      }
      destination_port_range {
        min = split("-", tcp_options.value.destination_port_range)[0]
        max = length(split("-", tcp_options.value.destination_port_range)) > 1 ? split("-", tcp_options.value.destination_port_range)[1] : split("-", tcp_options.value.destination_port_range)[0]
      }
    }
  }

  dynamic "udp_options" {
    for_each = each.value.protocol == "17" && (lookup(each.value, "source_port_range", "") != "" || lookup(each.value, "destination_port_range", "") != "") ? [each.value] : []
    content {
      source_port_range {
        min = split("-", udp_options.value.source_port_range)[0]
        max = length(split("-", udp_options.value.source_port_range)) > 1 ? split("-", udp_options.value.source_port_range)[1] : split("-", udp_options.value.source_port_range)[0]
      }
      destination_port_range {
        min = split("-", udp_options.value.destination_port_range)[0]
        max = length(split("-", udp_options.value.destination_port_range)) > 1 ? split("-", udp_options.value.destination_port_range)[1] : split("-", udp_options.value.destination_port_range)[0]
      }
    }
  }

  dynamic "icmp_options" {
    for_each = each.value.protocol == "1" && (lookup(each.value, "icmp_type", null) != null || lookup(each.value, "icmp_code", null) != null) ? [each.value] : []
    content {
      type = icmp_options.value.icmp_type
      code = lookup(icmp_options.value, "icmp_code", null)
    }
  }

  # Conditional attributes for destination
  destination_type = each.value.destination_type
  destination      = each.value.destination
}