terraform {
  required_version = "1.9.4"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.6.0"
    }
  }
}
