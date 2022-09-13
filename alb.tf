// REQUIRES aws provider 4.25.0 ==> preserve_host_header             = var.preserve_host_header
resource "aws_lb" "main" {
  customer_owned_ipv4_pool         = var.customer_owned_ipv4_pool
  desync_mitigation_mode           = var.desync_mitigation_mode
  drop_invalid_header_fields       = var.drop_invalid_header_fields
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_waf_fail_open             = var.enable_waf_fail_open
  idle_timeout                     = var.idle_timeout
  internal                         = var.internal
  ip_address_type                  = var.ip_address_type
  load_balancer_type               = var.load_balancer_type
  name                             = local.alb_name
  security_groups                  = [aws_security_group.alb.id]
  subnets                          = var.subnets
  tags                             = merge(var.tags, { Name = local.alb_name })

  dynamic "access_logs" {
    for_each = var.logs_bucket == null ? [] : ["foo"]
    content {
      bucket  = var.logs_bucket
      enabled = true
      prefix  = local.alb_name
    }
  }
}
