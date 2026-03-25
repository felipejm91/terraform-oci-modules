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
  description = "Controla se o compartimento pode ser excluído. Se 'true', o compartimento pode ser excluído quando vazio. Se 'false' (padrão), o compartimento não pode ser excluído."
}

variable "tags_freeform" {
  type = map(string)
  default = {
    "ambiente" = ""
    "cliente"  = ""
    "projeto"  = ""
  }
  description = "Tags de formato livre para identificação dos recursos. As chaves 'ambiente', 'cliente' e 'projeto' são esperadas e seus valores devem ser fornecidos. Outras tags podem ser adicionadas conforme necessário."
}


