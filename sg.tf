#
# Create the single security group to manage traffic to the ALB.
#
resource "aws_security_group" "alb" {
  name   = "${var.environment}-${var.app_name}-alb-sg"
  vpc_id = var.vpc_id

  tags = {
    Application = var.app_name
    Billing     = var.environment
    Environment = var.environment
    Name        = "${var.environment}-${var.app_name}-alb-sg"
    Terraform   = true
  }
}

#
# Create all of the rules for this security group.
#
resource "aws_security_group_rule" "alb_egress_all" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.alb_sg.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "alb_ingress" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.alb_sg.id
  self              = true
  to_port           = 0
  type              = "ingress"
}

resource "aws_security_group_rule" "alb_ingress_grids" {
  cidr_blocks       = ["${var.ingress_cidr_block}"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.alb_sg.id
  to_port           = 0
  type              = "ingress"
}

resource "aws_security_group_rule" "alb_http" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  to_port           = 80
  type              = "ingress"
}

resource "aws_security_group_rule" "alb_https" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  to_port           = 443
  type              = "ingress"
}
