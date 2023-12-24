resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "my-cache-subnet"
  subnet_ids = ["subnet-06054901bed3f86f0"]
}

resource "aws_elasticache_cluster" "redis-cluster" {
  cluster_id           = "multi-docker-redis"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  engine_version       = "7.0"
  port                 = 6379  
  apply_immediately    = true
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids   = [ "${aws_security_group.my_security_group.id}","sg-0f1d5e6f2c2b75b29"]

}
