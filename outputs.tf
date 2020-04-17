output "vm_public_ip" {
  description = "The ip of the vm."
  value       = "${module.spinec2.vm_public_ip}"
}
