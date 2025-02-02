terraform {
  required_version = "1.9.4"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.6.0"

    }
  }

  backend "s3" {
    bucket                      = "terraform-states"
    key                         = "NOME_ARQUIVO_ESTADO.tfstate"
    region                      = "sa-saopaulo-1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    use_path_style              = true
    skip_s3_checksum            = true
    skip_metadata_api_check     = true
    endpoints = {
      s3 = "https://gra70o7zxycj.compat.objectstorage.sa-saopaulo-1.oraclecloud.com"
    }
  }
}