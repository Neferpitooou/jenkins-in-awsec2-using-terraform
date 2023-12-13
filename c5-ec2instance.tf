# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data = file("${path.module}/install-nginx-jenkins.sh")
  key_name = var.instance_keypair //make sure aws-keypair-name is equal to myec2vm
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id   ]
  tags = {
    "Name" = "aws-ec2-ubuntu-01"
  }
}
