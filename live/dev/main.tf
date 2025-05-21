resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}

resource "random_uuid" "test" {
}


resource "tls_private_key" "my_private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

