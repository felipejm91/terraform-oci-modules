variable "compartimento_ocid" {
  default     = ""
  type        = string
  description = "Compartimento onde será criado o IP."
}

variable "public_ip_lifetime" {
  default     = ""
  type        = string
  description = "Tipo de IP que será criado."
}

variable "public_ip_display_name" {
  default     = ""
  type        = string
  description = "Nome de exibição do IP."
}

variable "private_ip_ocid" {
  default     = ""
  type        = string
  description = "Compartimento onde será criado o IP."
}

variable "tags_freeform" {
  type = map(string)
  default = {
    "ambiente" = ""
    "cliente"  = ""
    "projeto"  = ""
  }
  description = "Tags para identificação dos recursos"
}
