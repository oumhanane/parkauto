resource "aws_key_pair" "parkauto_key" {
  key_name   = "parkauto-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Chemin vers ta clé publique locale
}
