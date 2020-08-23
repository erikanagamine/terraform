# terraform

### https://docs.oracle.com/en/solutions/multi-tenant-topology-using-terraform/configure-terraform-execution-environment1.html#GUID-17AE60F0-FB45-4028-8BF5-71E149AA6C21

https://www.terraform.io/intro/


Before install terraform, update your environment and install packages docker, ansible, unzip and python3:

```
  sudo apt-get update -y
  sudo apt-get -y install docker.io ansible unzip python3-pip
```

#install terraform:
  - Download the zip file on: https://www.terraform.io/downloads.html

```
enagamine@ENAGAMINE:~$ mkdir terraform
enagamine@ENAGAMINE:~$ cd terraform
enagamine@ENAGAMINE:~/terraform$ ls
terraform_0.13.0_linux_amd64.zip
enagamine@ENAGAMINE:~/terraform$ unzip terraform_0.13.0_linux_amd64.zip
Archive:  terraform_0.13.0_linux_amd64.zip
  inflating: terraform
enagamine@ENAGAMINE:~/terraform$ ./terraform -v
Terraform v0.13.0
```
