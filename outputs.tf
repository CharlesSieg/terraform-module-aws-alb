output "alb_id" {
  description = "The ID of the Application Load Balancer."
  value       = aws_lb.alb.id
}

output "alb_arn" {
  description = "The ARN of the Application Load Balancer."
  value       = aws_lb.alb.arn
}

output "dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = aws_lb.alb.dns_name
}

output "sg_id" {
  description = "The ID of the security group which controls traffic to and from instances."
  value       = aws_security_group.alb_sg.id
}

output "zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
  value       = aws_lb.alb.zone_id
}
