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
enagamine@ENAGAMINE:~/terraform$ vi main.tf

variable "myvar" {
  type = "string"
  default = "hello terraform"
}

```
Test in terraform console

```
enagamine@ENAGAMINE:~/terraform$ ./terraform console

Warning: Quoted type constraints are deprecated
>
  on /home/enagamine/terraform/main.tf line 2, in variable "myvar":
   2:   type = "string"

Terraform 0.11 and earlier required type constraints to be given in quotes,
but that form is now deprecated and will be removed in a future version of
Terraform. To silence this warning, remove the quotes around "string".

> var.myvar
hello terraform

```

Now we are ready to setup this in a cloud provider! :)

# Setup on a Oracle cloud stack

```
# Parameters to authenticate with Oracle Cloud Infrastructure
tenancy_ocid="EXAMPLE: ocid1.tenancy.oc1..aaaaaaaaf76usem7gyfrakr35anvky4tyowvdvbik7kbrcizlyjsgfxpdg2a"
user_ocid="EXAMPLE: ocid1.user.oc1..aaaaaaaa5tds42w2zzbsdflkjwerkjghswdjfbvbts7imlb5yru2p10a"
fingerprint="EXAMPLE: 9b:6a:ab:ab:32:0b:7f:d5:5b:6w:c0:fe:54:72:f1:pl"
private_key_path="YOUR_HOME_DIRECTORY/.oci/oci_api_key.pem"

# Leave empty if your private key does not have a password
private_key_password=""

# See https://docs.oracle.com/pls/topic/lookup?ctx=cloud&id=oci_general_regions
home_region="EXAMPLE: us-ashburn-1"
region="EXAMPLE: us-phoenix-1"

# A short identifier for the application, used as a prefix for naming the compartments and other resources
app_tag="myapp"

# The environment that you're creating resources for: test, dev, prod, or staging
environment="dev"

# Base CIDR for the VCN
vcn_cidr="10.0.0.0/16"
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
