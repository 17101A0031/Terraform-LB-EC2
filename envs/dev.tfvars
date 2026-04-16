aws_region   = "ap-south-1"
environment  = "dev"
project_name = "demo"

ec2_instances = {
  web1 = {
    ami_id        = "ami-0f58b397bc5c1f2e8"
    instance_type = "t3.micro"
  }
  web2 = {
    ami_id        = "ami-0f58b397bc5c1f2e8"
    instance_type = "t3.micro"
  }
  web3 = {
    ami_id        = "ami-0f58b397bc5c1f2e8"
    instance_type = "t3.micro"
  }
}
