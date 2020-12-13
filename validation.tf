terraform {
  required_version = "= 0.14.2"
  experiments = [module_variable_optional_attrs]
}

variable "vpn_site_list" {
    type = map(object({
        onprem_address_space    = string
        device_vendor           = string
        device_provider         = string
        links                   = map(object({
            preshared_key_secret    = string
            onprem_gateway_address  = string
            ipsec_policy            = optional(map(object({
                saLifeTimeSeconds   = number
                saDataSizeKilobytes = number
                ipsecEncryption         = string
                ipsecIntegrity          = string
                ikeEncryption           = string
                ikeIntegrity            = string
                dhGroup                 = string
                pfsGroup                = string
            })))
        }))
    }))

    validation {
        condition   = alltrue(
            [
                for k,v in var.vpn_site_list : 
                    length(
                        regexall("^([0-9]{1,3}[.]){3}[0-9]{1,3}[/][0-9]{1,2}$" , v["onprem_address_space"])
                    ) > 0
            ]
        )
        error_message = "Variable onprem_address_space must have a CIDR value."
    }
    validation {
        condition   = alltrue(
            flatten(
                [
                    for k1,v1 in var.vpn_site_list : [
                        for k2,v2 in v1["links"] : 
                            length(regexall("^([0-9]{1,3}[.]){3}[0-9]{1,3}$" , v2["onprem_gateway_address"])) > 0
                    ]
                ]
            )
        )
        error_message = "Variable onprem_gateway_address must have an IP address value."
    }

}