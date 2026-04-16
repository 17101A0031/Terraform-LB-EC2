output "lb_dns" {
  value = module.lb.lb_dns
}

output "ec2_ips" {
  value = {
    for k, v in module.ec2_instances :
    k => v.public_ip
  }
}
