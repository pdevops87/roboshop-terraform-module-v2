variable "component"{
  default = "frontend"
}
variable "ami" {
  default="ami-0220d79f3f480ecf5"
}
variable "instance_type" {
  default="t2.micro"
}
variable "env" {
  default = "dev"
}
variable "zone_id"{
  default="Z08520602FC482APPVUI7"
}