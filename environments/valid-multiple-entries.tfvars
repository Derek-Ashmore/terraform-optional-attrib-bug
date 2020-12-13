

vpn_site_list = {
    vpn-test-site-no-ipsec = {
        onprem_address_space    = "172.16.0.0/24"
        device_vendor           = "Microsoft"               
        device_provider         = "RRAS"                    
        links = {
            vpn-test-site-link = {
                preshared_key_secret	= "preshared-key-nt-eus-vwan-hub-vpn-test-site"
                onprem_gateway_address  = "40.122.0.5"
            }
        }
    }
    vpn-test-site-ipsec = {
        onprem_address_space    = "172.16.0.0/24"
        device_vendor           = "Microsoft"               
        device_provider         = "RRAS"                    
        links = {
            vpn-test-site-link = {
                preshared_key_secret	= "preshared-key-nt-eus-vwan-hub-vpn-test-site"
                onprem_gateway_address  = "40.122.0.6"
                ipsec_policy            = {                         # This attribute is *optional*  
                    saLifeTimeSeconds       = 3600,
                    saDataSizeKilobytes     = 2048,
                    ipsecEncryption         = "GCMAES256",
                    ipsecIntegrity          = "GCMAES256",
                    ikeEncryption           = "GCMAES256",
                    ikeIntegrity            = "SHA256",
                    dhGroup                 = "DHGroup14",
                    pfsGroup                = "None"
                }
            }
        }
    }
}