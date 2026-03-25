variable "compartimento_ocid" {
  type        = string
  description = "OCID do compartimento onde será criado o NSG."
  validation {
    condition     = var.compartimento_ocid != ""
    error_message = "O OCID do compartimento é obrigatório."
  }
}

variable "vcn_ocid" {
  type        = string
  description = "OCID da VCN que será vinculado o NSG."
  validation {
    condition     = var.vcn_ocid != ""
    error_message = "O OCID da VCN é obrigatório."
  }
}

variable "name_display" {
  type        = string
  description = "Nome de exibição do NSG."
  validation {
    condition     = var.name_display != ""
    error_message = "O nome de exibição do NSG é obrigatório."
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

variable "ingress_rules" {
  type = list(object({
    protocol               = string
    source_type            = string # CIDR_BLOCK, NETWORK_SECURITY_GROUP
    source                 = string
    source_port_range      = string # Optional: e.g., "22", "80-81", "all"
    destination_port_range = string # Optional: e.g., "22", "80-81", "all"
    icmp_type              = number # Optional: for ICMP
    icmp_code              = number # Optional: for ICMP
    stateless              = bool   # Optional: default false
  }))
  default     = []
  description = "Lista de regras de segurança de entrada para o NSG."
}

variable "egress_rules" {
  type = list(object({
    protocol               = string
    destination_type       = string # CIDR_BLOCK, NETWORK_SECURITY_GROUP
    destination            = string
    source_port_range      = string # Optional: e.g., "22", "80-81", "all"
    destination_port_range = string # Optional: e.g., "22", "80-81", "all"
    icmp_type              = number # Optional: for ICMP
    icmp_code              = number # Optional: for ICMP
    stateless              = bool   # Optional: default false
  }))
  default     = []
  description = "Lista de regras de segurança de saída para o NSG."
}
