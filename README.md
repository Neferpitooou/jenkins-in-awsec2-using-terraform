# Provision AWS EC2 Intance Installed with Nginx-server and Jenkins Platform using Terraform  

## Personal Learning ##

The Mini project is about to provision an instance from aws ec2 with nginx server and jenkins application using terraform to be used for personal learning.

- Can adminester Jenkins Platform
- Configure credentias and webhooks. 

## Repo Includes ##

- [x] 01-06         : Terraform files that congures the Infrastucture-as-a-Code
- [x] Shell Script  : nginx-jenkins-install.sh file that configures the installation of the update and upgrade ec2 instance to its latest version, Nginx server, Jenkins Platform and its services. Setting up Jenkins upstream local domain server.

- [x] Added sample private key directory with `myec2vm.pem` key

## Steps ##
Terraform manual commands and can be used in a Pipeline CI/CD Automation

> terraform init

> terraform validate

> terraform plan

> terraform apply -auto-approve


> terraform destroy -auto-approve


> [!IMPORTANT]
> The README.md :shipit: 

### References ###
[AWS Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest)

Enjoy! :+1: :+1: :+1: