data "aws_ec2_instance_type" "t3" {
  instance_type = "t3.micro"
}

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_ebs_volume" "volume" {
  availability_zone = "us-east-1a"
  size              = 8
  type              = "gp2"
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ami.id
  instance_type = data.aws_ec2_instance_type.t3.instance_type

  tags = {
    Name = "HelloWorld"
  }
}