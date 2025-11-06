variable "hcl_pip" {
  description = "pip for hcl infra"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = optional(map(string))
    environment         = optional(string)

  }))

}
