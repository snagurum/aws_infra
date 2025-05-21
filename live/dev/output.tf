

output "uuid" {
  description = "uuid"
  value       = try(random_uuid.test.id, null)
}



output "keypairprivate_key_openssh" {
  description = "private_key_openssh"
  sensitive= true
  value       = try(tls_private_key.my_private_key.private_key_openssh, null)
}


output "keypairprivate_id" {
  description = "private_key_openssh_id"
  value       = try(tls_private_key.my_private_key.id, null)
}
