# terraform-optional-attrib-bug
Invalid error with module_variable_optional_attrs

I get invalid error reports when using the "optional" experimental feature with complex map inputs. The value supplied should be valid. I realize this feature is experimental, but thought you would like to know. A minimal repo that reproduces this error can be found [here](https://github.com/Derek-Ashmore/terraform-optional-attrib-bug).

I've noticed the following:
* The error only appears when I supply a value for the optional ```ipsec_policy``` attribute.
* The error appears whether or not I supply variable validations
* the error messages indicate different fields on different runs with no changes in between (see description below)

Version and local run commands below.  Please feel free to contact me if you have questions. Thanks for looking at this.

## Error Description

This configuration doesn't have an input error, but one is reported anyway.  Furthermore, the error is inconsistent.
Running the apply several times, I received the three different error messages below although the input should be viewed as valid.

```
The given value is not valid for variable "vpn_site_list": element
"vpn-test-site-ipsec": attribute "device_provider": string required.

The given value is not valid for variable "vpn_site_list": element
"vpn-test-site-ipsec": attribute "device_vendor": string required.

The given value is not valid for variable "vpn_site_list": element
"vpn-test-site-ipsec": attribute "onprem_address_space": string required.

```

## Versions
Terriform version == 0.14.2
The experimental feature ```module_variable_optional_attrs``` is turned on.

## Local run commands

```
terraform init
terraform apply -var-file=environments/valid-multiple-entries.tfvars -auto-approve
```


