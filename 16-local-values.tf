/*Note
[locals vs variables.tf]
locals 
- allow expressions to compute values dynamically
- cannot be overwritten
- created by locals block but referenced by local.<property_name>
variables.tf and terraform.tfvars 
- are for pre-execution config input
- can be overwritten
*/

variable "tags" {
    type = map
    default = {
        Team = "security-team"
    }
}

locals {
    default = {
        Team = "security-team"
    }
}

resource "aws_security_group" "sg_01" {
    name = "app_firewall"
    tags = local.default
}

resource "aws_security_group" "sg_02" {
    name = "db_firewall"
    tags = var.tags
}