terraform {
  required_version = ">=1.9.4"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.6.0"

    }
  }
}

provider "oci" {
  tenancy_ocid           = var.tenancy_ocid
  user_ocid              = var.user_ocid
  fingerprint            = var.fingerprint
  private_key_path       = var.private_key_path
  region                 = var.region
  disable_auto_retries   = false
  retry_duration_seconds = 60
}
