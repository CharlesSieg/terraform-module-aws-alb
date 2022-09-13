locals {
  alb_name = "${var.name_prefix}-${var.name}-alb"
  sg_name  = "${var.name_prefix}-${var.name}-alb-sg"
}