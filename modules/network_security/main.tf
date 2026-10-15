locals {
  sgs = {
    ssh          = "ssh"
    public_http  = "public-http"
    private_http = "private-http"
  }
}

resource "aws_security_group" "ssh" {
  name   = "${var.name_prefix}-${local.sgs.ssh}-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "public_http" {
  name   = "${var.name_prefix}-${local.sgs.public_http}-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "private_http" {
  name   = "${var.name_prefix}-${local.sgs.private_http}-sg"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  for_each          = toset(var.allowed_ip_range)
  security_group_id = aws_security_group.ssh.id
  cidr_ipv4         = each.value
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "public_http" {
  for_each          = toset(var.allowed_ip_range)
  security_group_id = aws_security_group.public_http.id
  cidr_ipv4         = each.value
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "private_http" {
  security_group_id            = aws_security_group.private_http.id
  referenced_security_group_id = aws_security_group.public_http.id
  ip_protocol                  = "tcp"
  from_port                    = 80
  to_port                      = 80
}

# Egress: needed so instances can install the web server and the ALB can reach them
resource "aws_vpc_security_group_egress_rule" "all" {
  for_each = {
    ssh          = aws_security_group.ssh.id
    public_http  = aws_security_group.public_http.id
    private_http = aws_security_group.private_http.id
  }

  security_group_id = each.value
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}