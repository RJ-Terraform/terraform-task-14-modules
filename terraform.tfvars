region           = "eu-west-1"
name_prefix      = "cmtr-n9nbj5cz"
vpc_cidr         = "10.10.0.0/16"
instance_type    = "t3.micro"
allowed_ip_range = ["18.153.146.156/32", "203.170.48.2/32"]
public_subnets = {
  a = { cidr = "10.10.1.0/24", az = "eu-west-1a" }
  b = { cidr = "10.10.3.0/24", az = "eu-west-1b" }
  c = { cidr = "10.10.5.0/24", az = "eu-west-1c" }
}