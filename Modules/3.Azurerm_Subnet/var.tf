variable "subnets" {
    description = "subnets of Frontend & Backend"
    type = map(object({
      name                 = string
  resource_group_name  = string
  virtual_network_name = string
  address_prefixes = optional(list(string)),
  # Optional delegation block to support services like Container Instances.
  delegation = optional(object({
    name = string
    service_delegation = object({
      name = string
      actions = list(string)
    })
  }))
}))
}