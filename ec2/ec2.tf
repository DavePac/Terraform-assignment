variable "instance_profile_name"{
}

resource "aws_instance"  "webserver" {
     ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  associate_public_ip_address  = true
  key_name = "DevOps-Ingineer"
  iam_instance_profile  =var.instance_profile_name

  tags = {
    Name = "web-server"
  }
  
}
  
