#
# Create the HTTP port listener for Application Load Balancer.
#
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.http_port
  protocol          = "HTTP"
  tags              = var.tags

  # By default, all HTTP port traffic will be routed to the HTTPS port.
  default_action {
    type = "redirect"

    redirect {
      port        = var.https_port
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

#
# Create the HTTPS listener for the Application Load Balancer.
#
resource "aws_lb_listener" "https" {
  certificate_arn   = element(data.aws_acm_certificate.main.*.arn, 0)
  load_balancer_arn = aws_lb.main.arn
  port              = var.https_port
  protocol          = "HTTPS"
  ssl_policy        = var.elb_security_policy
  tags              = var.tags

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "CLOUDOPS ==> Internal server error: ${var.name}"
      status_code  = "500"
    }
  }
}

#
# Add all SSL certificates to the HTTPS listener.
#
resource "aws_lb_listener_certificate" "main" {
  certificate_arn = element(data.aws_acm_certificate.main.*.arn, count.index)
  count           = length(var.domain_names)
  listener_arn    = aws_lb_listener.https.arn
}
