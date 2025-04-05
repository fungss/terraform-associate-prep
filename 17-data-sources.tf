/*Note
Data sources
- allow Terraform to use/fetch info defined outside terraform and pass to resource block

[Reference]
https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/account
*/

# Use case 1 - fetch from thrid party provider
terraform {
    required_providers {
        digitalocean = {
            source = "digitialocean/digitalocean"
        }
    }
}

provider "digitalocean" {

}

data "digitialocean_account" "some_name" {

}

# Use Case 2 - fetch from local file
data "local_file" "foo" {
    filename = "${path.module}/sample.txt" # result is stored in terraform.tfstate
}

# to use it
output "data" {
    value = data.local_file.foo.content
}

# Use Case 3 - fetch existing resources from main provider
provider "aws"{
    region = "us-east-1"
}

data "aws_instances" "example" {}