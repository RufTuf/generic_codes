module "rg" {
  source = "../Modules/1.Azurerm_Resource_Group"

  hcl-rg = var.hcl-rg1
}

module "vnet" {
  depends_on = [ module.rg ]
  source   = "../Modules/2.Azurerm_Vnet"
  hcl_vnet = var.hcl_vnet1
}

module "subnet" {
  depends_on = [ module.vnet ]
  source  = "../Modules/3.Azurerm_Subnet"
  subnets = var.subnets1
}

module "vm" {
  depends_on = [module.subnet]
  source  = "../Modules/4. Azurerm_VM"
  hcl_vm  = var.hcl_vm1
  hcl_nic = {
    for k, v in var.hcl_nic1 : k => merge(v, {
      ip_configuration = merge(v.ip_configuration, {
        subnet_id = module.subnet.subnet_ids["subnet-01"]  # Using the frontend subnet
      })
    })
  }
}

module "pip" {
  depends_on = [module.subnet]
  source = "../Modules/5. azurerm_pip"
  hcl_pip = var.hcl_pip1  
}

module "key_vault" {
  depends_on = [ module.vm ]
  source = "../Modules/6. azurerm_keyvault"
  hcl_keyvault = var.hcl_keyvault1
  hcl_kvsecret = var.hcl_kvsecret1
}