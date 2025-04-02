resource "local_sensitive_file" "games" { //this resource creates a local file with the content but you wnt see its value during plan and apply
  filename     = "/root/favorite-games"
  content  = "FIFA 21"
}