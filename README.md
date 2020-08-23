# terraform

### https://docs.oracle.com/en/solutions/multi-tenant-topology-using-terraform/configure-terraform-execution-environment1.html#GUID-17AE60F0-FB45-4028-8BF5-71E149AA6C21

https://www.terraform.io/intro/


Before install terraform, update your environment and install packages docker, ansible, unzip and python3:

```
  sudo apt-get update -y
  sudo apt-get -y install docker.io ansible unzip python3-pip
```

Also you will need to generate a key:

```
enagamine@ENAGAMINE:~$ mkdir ~/.oci
enagamine@ENAGAMINE:~$ openssl genrsa -out ~/.oci/oci_api_key.pem 2048
Generating RSA private key, 2048 bit long modulus (2 primes)
......................................................+++++
....................................................................+++++
e is 65537 (0x010001)
enagamine@ENAGAMINE:~$ chmod go-rwx ~/.oci/oci_api_key.pem
enagamine@ENAGAMINE:~$ openssl rsa -pubout -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem
writing RSA key
```

# Install terraform:
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

# Testing if your installation is fine

Create a sample file:

```
vi main.tf

variable "myvar" {
  type = "string"
  default = "hello terraform"
}

```
Test in terraform console

```
terraform console

var.myvar

```



terraform console


variable "myvar" {
  type = "string"
  default = "hello terraform"
}


variable "mymap" {
  type = map{string}
  default = "My value"
}
var.myvar

var.mymap
