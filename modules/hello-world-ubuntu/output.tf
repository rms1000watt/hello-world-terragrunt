output "public-ips" {
  value = ["${aws_instance.ubuntu.*.public_ip}"]
}

output "private-ips" {
  value = ["${aws_instance.ubuntu.*.private_ip}"]
}
