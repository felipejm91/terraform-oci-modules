variable "tenancy_ocid" {
  default     = ""
  type        = string
  description = "OCID da tenancy da OCI"
}

variable "user_ocid" {
  default     = ""
  type        = string
  description = "OCID do usuário."
}

variable "fingerprint" {
  default     = ""
  type        = string
  description = "Fingerprint criado pelo usuário."
}

variable "private_key_path" {
  default     = ""
  type        = string
  description = "Caminho para a chave SSH criada com o fingerprint."
}

variable "region" {
  default     = ""
  type        = string
  description = "Região que será utilizada."
}
