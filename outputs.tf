output "arn" {
  description = "The ARN of the load balancer."
  value       = aws_lb.main.arn
}

output "dns_name" {
  description = "The DNS Name of the load balancer."
  value       = aws_lb.main.dns_name
}

output "https_listener_arn" {
  description = "The ARN of the HTTPS listener."
  value       = aws_lb_listener.https.arn
}

output "id" {
  description = "The ID of the load balancer."
  value       = aws_lb.main.id
}

output "security_group_id" {
  description = "The ID of the security group which contains the load balancer."
  value       = aws_security_group.alb.id
}

output "zone_id" {
  description = "The Zone ID of the load balancer."
  value       = aws_lb.main.zone_id
}
