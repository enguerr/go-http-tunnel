# docker-tunneld
## Build

> 

## Usage

> docker run enguerr/go-http-tunnel


## Docker run env options

This image can be run using a couple of environment variables that configures the image.

TunnelD config
----

| VARIABLE | DESCRIPTION | DEFAULT |
| :------- | :---------- | :------ |
| DEBUG | turn on debugging | false |
| CLIENTS | Specify comma separated client ID's that should recognize | empty |
| DISABLE_HTTPS | Disables https | false | 

TLS Cert
----

| VARIABLE | DESCRIPTION | DEFAULT |
| :------- | :---------- | :------ |
| COUNTY | Certificate subject country string | US |
| STATE | Certificate subject state string | New Jersey |
| LOCATION | Certificate subject location string | Piscataway |
| ORGANISATION | Certificate subject organisation string | Example |
| ROOT_CN | Root certificate common name | Root |
| ISSUER_CN | Intermediate issuer certificate common name | Example Ltd |
| PUBLIC_CN | Public certificate common name | *.example.com |
| ROOT_NAME | Root certificate filename | root |
| ISSUER_NAME | Intermediate issuer certificate filename | example |
| PUBLIC_NAME | Public certificate filename | public |
| RSA_KEY_NUMBITS | The size of the rsa keys to generate in bits | 2048 |
| DAYS | The number of days to certify the certificates for | 365 |