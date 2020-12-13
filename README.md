# terraform-optional-attrib-bug
An example of a current bug with Terraform 0.14.2 and it's experimental feature module_variable_optional_attrs

Terriform version == 0.14.2
The experimental feature ```module_variable_optional_attrs``` is turned on.

## Error Description

This configuration doesn't have an input error, but one is reported anyway.  Furthermore, the error is inconsistent.
Running the apply several times, I received the three different error messages below.

```
The given value is not valid for variable "vpn_site_list": element
"vpn-test-site-ipsec": attribute "device_provider": string required.

The given value is not valid for variable "vpn_site_list": element
"vpn-test-site-ipsec": attribute "device_vendor": string required.

The given value is not valid for variable "vpn_site_list": element
"vpn-test-site-ipsec": attribute "onprem_address_space": string required.

```

## Local run commands

```
terraform init
terraform apply -var-file=environments/valid-multiple-entries.tfvars -auto-approve
```


