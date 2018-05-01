output "vpc_id" {
	value = "${module.vpc.vpc_id}"
}
output "vpc_cidr_block" {
	value = "${module.vpc.vpc_cidr_block}"
}
output "default_security_group_id" {
	value = "${module.vpc.default_security_group_id}"
}
output "default_network_acl_id" {
	value = "${module.vpc.default_network_acl_id}"
}
output "default_route_table_id" {
	value = "${module.vpc.default_route_table_id}"
}
output "vpc_instance_tenancy" {
	value = "${module.vpc.vpc_instance_tenancy}"
}
output "vpc_enable_dns_support" {
	value = "${module.vpc.vpc_enable_dns_support}"
}
output "vpc_enable_dns_hostnames" {
	value = "${module.vpc.vpc_enable_dns_hostnames}"
}
output "vpc_main_route_table_id" {
	value = "${module.vpc.vpc_main_route_table_id}"
}
output "private_subnets" {
	value = "${module.vpc.private_subnets}"
}
output "private_subnets_cidr_blocks" {
	value = "${module.vpc.private_subnets_cidr_blocks}"
}
output "public_subnets" {
	value = "${module.vpc.public_subnets}"
}
output "public_subnets_cidr_blocks" {
	value = "${module.vpc.public_subnets_cidr_blocks}"
}
output "database_subnets" {
	value = "${module.vpc.database_subnets}"
}
output "database_subnets_cidr_blocks" {
	value = "${module.vpc.database_subnets_cidr_blocks}"
}
output "database_subnet_group" {
	value = "${module.vpc.database_subnet_group}"
}
output "redshift_subnets" {
	value = "${module.vpc.redshift_subnets}"
}
output "redshift_subnets_cidr_blocks" {
	value = "${module.vpc.redshift_subnets_cidr_blocks}"
}
output "redshift_subnet_group" {
	value = "${module.vpc.redshift_subnet_group}"
}
output "elasticache_subnets" {
	value = "${module.vpc.elasticache_subnets}"
}
output "elasticache_subnets_cidr_blocks" {
	value = "${module.vpc.elasticache_subnets_cidr_blocks}"
}
output "elasticache_subnet_group" {
	value = "${module.vpc.elasticache_subnet_group}"
}
output "elasticache_subnet_group_name" {
	value = "${module.vpc.elasticache_subnet_group_name}"
}
output "public_route_table_ids" {
	value = "${module.vpc.public_route_table_ids}"
}
output "private_route_table_ids" {
	value = "${module.vpc.private_route_table_ids}"
}
output "nat_ids" {
	value = "${module.vpc.nat_ids}"
}
output "nat_public_ips" {
	value = "${module.vpc.nat_public_ips}"
}
output "natgw_ids" {
	value = "${module.vpc.natgw_ids}"
}
output "igw_id" {
	value = "${module.vpc.igw_id}"
}
output "vpc_endpoint_s3_id" {
	value = "${module.vpc.vpc_endpoint_s3_id}"
}
output "vpc_endpoint_s3_pl_id" {
	value = "${module.vpc.vpc_endpoint_s3_pl_id}"
}
output "vpc_endpoint_dynamodb_id" {
	value = "${module.vpc.vpc_endpoint_dynamodb_id}"
}
output "vgw_id" {
	value = "${module.vpc.vgw_id}"
}
output "vpc_endpoint_dynamodb_pl_id" {
	value = "${module.vpc.vpc_endpoint_dynamodb_pl_id}"
}
output "default_vpc_id" {
	value = "${module.vpc.default_vpc_id}"
}
output "default_vpc_cidr_block" {
	value = "${module.vpc.default_vpc_cidr_block}"
}
output "default_vpc_default_security_group_id" {
	value = "${module.vpc.default_vpc_default_security_group_id}"
}
output "default_vpc_default_network_acl_id" {
	value = "${module.vpc.default_vpc_default_network_acl_id}"
}
output "default_vpc_default_route_table_id" {
	value = "${module.vpc.default_vpc_default_route_table_id}"
}
output "default_vpc_instance_tenancy" {
	value = "${module.vpc.default_vpc_instance_tenancy}"
}
output "default_vpc_enable_dns_support" {
	value = "${module.vpc.default_vpc_enable_dns_support}"
}
output "default_vpc_enable_dns_hostnames" {
	value = "${module.vpc.default_vpc_enable_dns_hostnames}"
}
output "default_vpc_main_route_table_id" {
	value = "${module.vpc.default_vpc_main_route_table_id}"
}
