# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data = file("${path.module}/nginx-jenkins-install.sh")
  key_name = var.instance_keypair //make sure aws-keypair-name is equal to myec2vm
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id   ]
  subnet_id = "subnet-0c9c8d76c6ef399bb"
  associate_public_ip_address = true
  tags = {
    "Name" = "awsec2-nginx-jenkins-01"
  }
}
