variable "parent_compartment_id" {
  default     = ""
  description = "OCID do compartimento pai do compartimento que será criado."
  type        = string

  validation {
    condition     = var.parent_compartment_id != ""
    error_message = "É necessário informar um OCID para o Compartimento Pai."
  }
}

variable "compartment_description" {
  default     = ""
  description = "Descrição do compartimento que será criado."
  type        = string

  validation {
    condition     = var.compartment_description != ""
    error_message = "É necessário informar uma descrição para o Compartimento."
  }
}

variable "compartment_name" {
  default     = ""
  description = "Nome do compartimento que será criado."
  type        = string

  validation {
    condition     = var.compartment_name != ""
    error_message = "É necessário informar uma nome para o Compartimento."
  }
}

variable "enable_delete" {
  type        = bool
  default     = false
  description = "Permite a criação de compartimentos com nomes iguais."
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


