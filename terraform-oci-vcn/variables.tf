variable "compartimento_ocid" {
  type        = string
  description = "OCID do compartimento onde será criada a VCN"
  validation {
    condition     = var.compartimento_ocid != ""
    error_message = "O OCID do compartimento é obrigatório."
  }
}

variable "cidr_blocks_vcn" {
  default = [
    "172.16.0.0/16"
  ]
  type        = list(string)
  description = "CIDR que será utilizado pela VCN"
  validation {
    condition     = length(var.cidr_blocks_vcn) > 0
    error_message = "É necessário informar pelo menos um CIDR para a VCN."
  }
}

variable "cidr_blocks_public_subnet" {
  default     = "172.16.0.0/24"
  type        = string
  description = "CIDR que será utilizado na subrede publica"
  validation {
    condition     = var.cidr_blocks_public_subnet != ""
    error_message = "O CIDR da subrede pública é obrigatório."
  }
}

variable "cidr_blocks_private_subnet" {
  default     = "172.16.1.0/24"
  type        = string
  description = "CIDR que será utilizado na subrede privada"
  validation {
    condition     = var.cidr_blocks_private_subnet != ""
    error_message = "O CIDR da subrede privada é obrigatório."
  }
}

variable "vcn_display_name" {
  type        = string
  description = "Nome da VCN"
  validation {
    condition     = var.vcn_display_name != ""
    error_message = "O nome de exibição da VCN é obrigatório."
  }
}

variable "vcn_dns_label" {
  type        = string
  description = "Nome de DNS da VCN. Não pode conter caracteres especiais."
  validation {
    condition     = var.vcn_dns_label != "" && can(regex("^[a-zA-Z0-9-]*$", var.vcn_dns_label))
    error_message = "O nome de DNS da VCN é obrigatório e não pode conter caracteres especiais ou espaços."
  }
}

variable "vcn_public_subnet_display_name" {
  type        = string
  description = "Nome da subrede pública."
  validation {
    condition     = var.vcn_public_subnet_display_name != ""
    error_message = "O nome de exibição da subrede pública é obrigatório."
  }
}

variable "vcn_private_subnet_display_name" {
  type        = string
  description = "Nome da subrede privada."
  validation {
    condition     = var.vcn_private_subnet_display_name != ""
    error_message = "O nome de exibição da subrede privada é obrigatório."
  }
}

variable "route_table_for_private_subnet_display_name" {
  type        = string
  description = "Nome da tabela de roteamento da subrede privada."
  validation {
    condition     = var.route_table_for_private_subnet_display_name != ""
    error_message = "O nome de exibição da tabela de roteamento da subrede privada é obrigatório."
  }
}

variable "default_route_table_vcn_display_name" {
  type        = string
  description = "Nome da tabela de roteamento default."
  validation {
    condition     = var.default_route_table_vcn_display_name != ""
    error_message = "O nome de exibição da tabela de roteamento default é obrigatório."
  }
}

variable "internet_gateway_display_name" {
  type        = string
  description = "Nome do gateway de internet."
  validation {
    condition     = var.internet_gateway_display_name != ""
    error_message = "O nome de exibição do gateway de internet é obrigatório."
  }
}

variable "nat_gateway_display_name" {
  type        = string
  description = "Nome do gateway NAT."
  validation {
    condition     = var.nat_gateway_display_name != ""
    error_message = "O nome de exibição do gateway NAT é obrigatório."
  }
}

variable "service_gateway_display_name" {
  type        = string
  description = "Nome do gateway de serviço."
  validation {
    condition     = var.service_gateway_display_name != ""
    error_message = "O nome de exibição do gateway de serviço é obrigatório."
  }
}

variable "enabled" {
  default     = true
  type        = bool
  description = "Habilitar o gateway assim que criado."
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

variable "service_gateway_service_id" {
  type        = string
  description = "OCID do serviço para o Service Gateway (por exemplo, all-gru-services-in-oracle-services-network)."
  default     = "ocid1.service.oc1.sa-saopaulo-1.aaaaaaaacd57uig6rzxm2qfipukbqpje2bhztqszh3aj7zk2jtvf6gvntena"
  validation {
    condition     = var.service_gateway_service_id != ""
    error_message = "O OCID do serviço para o Service Gateway é obrigatório."
  }
}