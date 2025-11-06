variable "hcl-rg" {
  description = "rescource group name of rg"
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = optional(map(string))
  }))

}
