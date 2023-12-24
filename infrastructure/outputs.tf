output "endpoint_url" {
  description = "CNAME endpoint to the elastic beanstalk environment"
  value       = aws_elastic_beanstalk_environment.eb_env.cname
}


output "elasticache_cluster_endpoint" {
  value       = aws_elasticache_cluster.redis-cluster.arn
}

output "redis_primary_endpoint" {
  description = "The primary endpoint of the Redis cluster"
  value       = aws_elasticache_cluster.redis-cluster.cache_nodes[0].address
}