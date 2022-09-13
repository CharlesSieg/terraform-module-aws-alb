#
# Look up the SSL certificates in AWS Certificate Manager for all provided domains.
#
data "aws_acm_certificate" "main" {
  count       = length(var.domain_names)
  domain      = "*.${var.domain_names[count.index]}"
  most_recent = true
  types       = ["AMAZON_ISSUED"]
}
