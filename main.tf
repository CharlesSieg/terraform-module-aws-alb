
###################################################################
# APPLICATION LOAD BALANCER
###################################################################

resource "aws_lb" "alb" {
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false
  internal                         = false
  name                             = "${var.environment}-${var.app_name}-alb"
  security_groups                  = [aws_security_group.alb_sg.id]
  subnets                          = var.public_subnets

  access_logs {
    bucket  = var.logs_bucket
    enabled = true
    prefix  = var.app_name
  }

  tags = {
    Application = var.app_name
    Billing     = "${var.environment}-${var.app_name}"
    Environment = var.environment
    Name        = "${var.environment}-${var.app_name}-alb"
    Terraform   = true
  }
}
