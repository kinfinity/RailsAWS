provider "aws" {
  region  = "eu-west-1"
}

module "vpc" {
  source = "./vpc"
  name = "rails"
  cidr = var.cidr_block[var.env]

  default_network_acl_egress = [ { "action": "allow", "cidr_block": "0.0.0.0/0", "from_port": 0, "protocol": "-1", "rule_no": 100, "to_port": 0 }, { "action": "allow", "from_port": 0, "ipv6_cidr_block": "::/0", "protocol": "-1", "rule_no": 101, "to_port": 0 } ]
  default_network_acl_name  = "dg-prod-vpc-acl"
  default_security_group_name = "dg-prod-vpc-sg"

  azs                   = var.availability_zones[var.env]
  public_subnets        = var.public_subnets[var.env]
  database_subnets      = var.database_subnets[var.env]
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_dedicated_network_acl = true
  database_inbound_acl_rules  = [ { "cidr_block": "0.0.0.0/0", "from_port": 0, "protocol": "-1", "rule_action": "allow", "rule_number": 100, "to_port": 0 } ]
  database_outbound_acl_rules = [ { "cidr_block": "0.0.0.0/0", "from_port": 0, "protocol": "-1", "rule_action": "allow", "rule_number": 100, "to_port": 0 } ]
  database_subnet_suffix= "db"
  public_subnet_suffix  = "pub"
  
  public_dedicated_network_acl = true
  public_inbound_acl_rules     = [ { "cidr_block": "0.0.0.0/0", "from_port": 0, "protocol": "-1", "rule_action": "allow", "rule_number": 100, "to_port": 0 } ]
  public_outbound_acl_rules    = [ { "cidr_block": "0.0.0.0/0", "from_port": 0, "protocol": "-1", "rule_action": "allow", "rule_number": 100, "to_port": 0 } ]

  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway   = true
  one_nat_gateway_per_az = true

}