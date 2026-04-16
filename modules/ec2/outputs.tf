output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "sg_id" {
  value = aws_security_group.sg.id
}
