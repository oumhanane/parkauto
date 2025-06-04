resource "aws_key_pair" "parkauto_key" {
  key_name   = "parkauto-key"
  public_key = var.ssh_public_key
}
