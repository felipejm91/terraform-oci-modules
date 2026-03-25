variable "compartimento_ocid" {
  type        = string
  description = "OCID do compartimento onde será criado o IP."
  validation {
    condition     = var.compartimento_ocid != ""
    error_message = "O OCID do compartimento é obrigatório."
  }
}

variable "public_ip_lifetime" {
  type        = string
  description = "Tipo de IP que será criado. Valores válidos: 'RESERVED' ou 'EPHEMERAL'."
  validation {
    condition     = contains(["RESERVED", "EPHEMERAL"], var.public_ip_lifetime)
    error_message = "O tipo de vida útil do IP público deve ser 'RESERVED' ou 'EPHEMERAL'."
  }
}

variable "public_ip_display_name" {
  type        = string
  description = "Nome de exibição do IP."
  validation {
    condition     = var.public_ip_display_name != ""
    error_message = "O nome de exibição do IP público é obrigatório."
  }
}

variable "private_ip_ocid" {
  type        = string
  default     = ""
  description = "OCID do IP privado que será atribuído o IP público. Obrigatório para IP público efemero e opcional para IP público reservado."
  validation {
    condition     = var.public_ip_lifetime == "RESERVED" || (var.public_ip_lifetime == "EPHEMERAL" && var.private_ip_ocid != "")
    error_message = "O OCID do IP privado é obrigatório quando public_ip_lifetime é 'EPHEMERAL'."
  }
}

variable "tags_freeform" {
  type = map(string)
  default = {
    "ambiente" = ""
    "cliente"  = ""
    "projeto"  = ""
  }
  description = "Tags de formato livre para identificação dos recursos. As chaves 'ambiente', 'cliente' e 'projeto' são esperadas e seus valores devem ser fornecidos. Outras tags podem ser adicionadas conforme necessário."
  validation {
    condition     = try(var.tags_freeform["ambiente"] != "" && var.tags_freeform["cliente"] != "" && var.tags_freeform["projeto"] != "", false)
    error_message = "Os valores para as tags 'ambiente', 'cliente' e 'projeto' são obrigatórios."
  }
}
