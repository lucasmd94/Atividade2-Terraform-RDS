output "endpoint" {
  description = "DB Endpoint"
  value       = aws_db_instance.db_instance.endpoint
}

output "instance_id" {
  description = "DB ID"
  value       = aws_db_instance.db_instance.id
}