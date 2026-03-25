variable "tenancy_ocid" {
  type        = string
  description = "OCID da tenancy da OCI"
  validation {
    condition     = var.tenancy_ocid != ""
    error_message = "O OCID da tenancy é obrigatório."
  }
}

variable "user_ocid" {
  type        = string
  description = "OCID do usuário."
  validation {
    condition     = var.user_ocid != ""
    error_message = "O OCID do usuário é obrigatório."
  }
}

variable "fingerprint" {
  type        = string
  description = "Fingerprint criado pelo usuário."
  validation {
    condition     = var.fingerprint != ""
    error_message = "O fingerprint é obrigatório."
  }
}

variable "private_key_path" {
  type        = string
  description = "Caminho para a chave SSH criada com o fingerprint."
  validation {
    condition     = var.private_key_path != ""
    error_message = "O caminho para a chave privada é obrigatório."
  }
}

variable "region" {
  type        = string
  description = "Região que será utilizada."
  validation {
    condition     = var.region != ""
    error_message = "A região é obrigatória."
  }
}
