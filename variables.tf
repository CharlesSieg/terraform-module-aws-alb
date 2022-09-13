variable "customer_owned_ipv4_pool" {
  default     = null
  description = "The ID of the customer owned ipv4 pool to use for this load balancer."
  type        = string
}

variable "desync_mitigation_mode" {
  default     = "defensive"
  description = "Determines how the load balancer handles requests that might pose a security risk to an application due to HTTP desync. Valid values are monitor, defensive (default), strictest."
  type        = string
}

variable "domain_names" {
  description = "REQUIRED. A list of domain names for which SSL certificates from ACM will be added to the load balancer."
  type        = list(string)
}

variable "drop_invalid_header_fields" {
  default     = false
  description = "Indicates whether HTTP headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false). The default is false."
  type        = bool
}

variable "elb_security_policy" {
  description = "REQUIRED. The SSL security policy used for the HTTPS listener."
  type        = string
}

variable "enable_cross_zone_load_balancing" {
  default     = true
  description = "If true, cross-zone load balancing of the load balancer will be enabled. This is a network load balancer feature."
  type        = bool
}

variable "enable_deletion_protection" {
  default     = false
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer."
  type        = bool
}

variable "enable_http2" {
  default     = true
  description = "Indicates whether HTTP/2 is enabled in application load balancers. Defaults to true."
  type        = bool
}

variable "enable_waf_fail_open" {
  default     = false
  description = "Indicates whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to AWS WAF. Defaults to false."
  type        = bool
}

variable "http_port" {
  default     = 80
  description = "The port used by the HTTP listener. Defaults to 80."
  type        = number
}

variable "https_port" {
  default     = 443
  description = "The port used by the HTTPS listener. Defaults to 443."
  type        = number
}

variable "idle_timeout" {
  default     = 60
  description = "The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type application. Default: 60."
  type        = number
}

variable "internal" {
  default     = false
  description = "Determines whether the LB will be internal."
  type        = bool
}

variable "ip_address_type" {
  default     = "ipv4" # TODO: Should be dualstack but no subnets with IPv6.
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
  type        = string
}

variable "load_balancer_type" {
  default     = "application"
  description = "The type of load balancer to create. Possible values are application, gateway, or network."
  type        = string
}

variable "logs_bucket" {
  default     = null
  description = "An S3 bucket where the load balancer access logs should be sent."
  type        = string
}

variable "name" {
  description = "REQUIRED. The name of the load balancer."
  type        = string
}

variable "name_prefix" {
  description = "REQUIRED. A prefix attached to the front of any resource name created by this module."
  type        = string
}

variable "preserve_host_header" {
  default     = false
  description = "Indicates whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change. Defaults to false."
  type        = bool
}

variable "subnets" {
  description = "REQUIRED. A list of subnet IDs to attach to the LB. Subnets cannot be updated for Load Balancers of type network. Changing this value for load balancers of type network will force a recreation of the resource."
  type        = list(string)
}

variable "tags" {
  description = "REQUIRED. A map of tags assigned to the resource. The Name tag is automatically created."
  type        = map(string)
}

variable "vpc_id" {
  description = "REQUIRED. The ID of the VPC in which the load balancer will be created. Used for provisioning the security group."
  type        = string
}
