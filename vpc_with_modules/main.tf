provider "aws" {
  region = "ap-south-1"  
}
module "web-1" {
    source = "./module-1"
}
module "web-2" {
    source = "./module-2"
}