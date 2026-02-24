variable "compartimento_ocid" {
  type        = string
  default     = ""
  description = "OCID do compartimento onde será criado o NSG."
}

variable "vcn_ocid" {
  type        = string
  default     = ""
  description = "OCID da VCN que será vinculado o NSG."
}

variable "name_display" {
  type        = string
  default     = ""
  description = "Nome de exibição do NSG."
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

