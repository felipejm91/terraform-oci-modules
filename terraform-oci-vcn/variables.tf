variable "compartimento_ocid" {
  default     = ""
  type        = string
  description = "Compartimento onde será criado a VCN"
}

variable "cidr_blocks_vcn" {
  default = [
    "172.16.0.0/16"
  ]
  type        = list(string)
  description = "CIDR que será utilizado pela VCN"
}

variable "cidr_blocks_public_subnet" {
  default     = "172.16.0.0/24"
  type        = string
  description = "CIDR que será utilizado na subrede publica"
}

variable "cidr_blocks_private_subnet" {
  default     = "172.16.1.0/24"
  type        = string
  description = "CIDR que será utilizado na subrede privada"
}

variable "vcn_display_name" {
  default     = ""
  type        = string
  description = "Nome da VCN"
}

variable "vcn_dns_label" {
  default     = ""
  type        = string
  description = "Nome da VCN"
}

variable "vcn_public_subnet_display_name" {
  default     = ""
  type        = string
  description = "Nome da subrede pública."
}

variable "vcn_private_subnet_display_name" {
  default     = ""
  type        = string
  description = "Nome da subrede privada."
}

variable "route_table_for_private_subnet_display_name" {
  default     = ""
  type        = string
  description = "Nome da tabela de roteamento da subrede privada."
}

variable "default_route_table_vcn_display_name" {
  default     = ""
  type        = string
  description = "Nome da tabela de roteamento default."
}

variable "internet_gateway_display_name" {
  default     = ""
  type        = string
  description = "Nome do gateway de internet."
}

variable "nat_gateway_display_name" {
  default     = ""
  type        = string
  description = "Nome do gateway NAT."
}

variable "service_gateway_display_name" {
  default     = ""
  type        = string
  description = "Nome do gateway de serviço."
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