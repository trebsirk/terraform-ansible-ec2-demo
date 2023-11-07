output "instance_ip" {
  description = "The public ip for ssh access"
  value       = aws_instance.devops_demo_server[*].public_ip
}