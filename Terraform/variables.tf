# VPC 
variable "name" {
  description = "Name to be used"
  type        = string
  default     = "dg-production-live"
}

variable "env" {
  description = "Environment"
  type        = string
  default = "prod"
}

variable "cidr_block" {
  description = "VPC CIDR Block to use"
  type        = map(string)

  default = {
    prod  = "10.23.0.0/16"
  }
}

variable "availability_zones" {
  description = "Availability Zones to Use"
  type = object({
    prod  = list(string),
  })

  default = {
    prod  = ["eu-west-1a", "eu-west-1b","eu-west-1c"]
  }
}

variable "database_subnets" {
  description = "Database Subnets to use"
  type = object({
    prod  = list(string),
  })

  default = {
    prod  = [ "10.23.64.0/20","10.23.80.0/20","10.23.96.0/20"]
  }
}

variable "public_subnets" {
  description = "Public Subnets to use"
  type = object({
    prod  = list(string),
  })

  default = {
    prod  = ["10.23.112.0/20","10.23.144.0/20","10.23.160.0/20"]
  }
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway or multiple"
  type        = map(string)

  default = {
    prod  = false
  }
}