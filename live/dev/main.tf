resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}

resource "random_uuid" "test" {
}

output "uuid" {
  description = "uuid"
  value       = try(random_uuid.id, null)
}
