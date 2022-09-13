#
# Create a single security group to manage traffic to and from the load balancer.
#
resource "aws_security_group" "alb" {
  name   = local.sg_name
  tags   = merge(var.tags, { Name = local.sg_name })
  vpc_id = var.vpc_id
}

#
# Create all of the rules for this security group.
#
resource "aws_security_group_rule" "alb_egress_all" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.alb.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "alb_ingress_http" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = var.http_port
  protocol          = "tcp"
  security_group_id = aws_security_group.alb.id
  to_port           = var.http_port
  type              = "ingress"
}

resource "aws_security_group_rule" "alb_ingress_https" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = var.https_port
  protocol          = "tcp"
  security_group_id = aws_security_group.alb.id
  to_port           = var.https_port
  type              = "ingress"
}
