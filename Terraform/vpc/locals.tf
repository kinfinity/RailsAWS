locals {
  max_subnet_length = max(
    length(var.elasticache_subnets),
    length(var.database_subnets),
  )
  nat_gateway_count = var.single_nat_gateway ? 1 : var.one_nat_gateway_per_az ? length(var.azs) : local.max_subnet_length

  # Use `local.vpc_id` to give a hint to Terraform that subnets should be deleted before secondary CIDR blocks can be free!
  vpc_id = element(
    aws_vpc.this.*.id,
    0,
  )
}
