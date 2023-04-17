# terraform-helm-release

Provisions resources on Kubernetes and Cloudflare to create a Helm release with associated PVC and Volume Claims, and  an optional DNS record for ingress.

## Requirements

| Name       | Version  |
|------------|----------|
| terraform  | >= 1.0.0 |
| cloudflare | ~> 4     |
| helm       | ~> 2     |
| kubernetes | ~> 2     |
| random     | ~> 3     |

## Providers

| Name       | Version |
|------------|---------|
| cloudflare | ~> 4    |
| helm       | ~> 2    |
| kubernetes | ~> 2    |
| random     | ~> 3    |

## Modules

No modules.

## Resources

| Name                                                                                                                                                  | Type     |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record)                                  | resource |
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)                                             | resource |
| [kubernetes_limit_range.limit](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/limit_range)                        | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace)                             | resource |
| [kubernetes_persistent_volume.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume)             | resource |
| [kubernetes_persistent_volume_claim.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [random_uuid.volume_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid)                                        | resource |

## Inputs

| Name                 | Description                                                                                                                                   | Type                | Default                             | Required |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|---------------------|-------------------------------------|:--------:|
| atomic               | (Optional) If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to `false`. | `bool`              | `true`                              |    no    |
| base\_nfs\_path      | (optional) NFS Path on which to create the resources                                                                                          | `string`            | n/a                                 |   yes    |
| chart                | Chart name                                                                                                                                    | `string`            | `""`                                |    no    |
| chart\_version       | Version of the Helm chart                                                                                                                     | `string`            | `""`                                |    no    |
| create\_namespace    | Whether to create the namespace                                                                                                               | `bool`              | `true`                              |    no    |
| create\_volumes      | A map of volume names and volume sizes to create                                                                                              | `map(string)`       | `{}`                                |    no    |
| external\_ip         | External cluster IP for getting a valid cert                                                                                                  | `string`            | `""`                                |    no    |
| helm\_file\_override | (optional) Path(s) to the yaml override file                                                                                                  | `list(string)`      | `[""]`                              |    no    |
| ingress              | (optional) A list of endpoints                                                                                                                | `list(string)`      | `[]`                                |    no    |
| limit                | Whether to create a default limit for the namespace created                                                                                   | `bool`              | `false`                             |    no    |
| lint                 | (Optional) Run the helm chart linter during the plan. Defaults to `false`.                                                                    | `bool`              | `true`                              |    no    |
| name                 | Name of the chart to install                                                                                                                  | `string`            | n/a                                 |   yes    |
| namespace            | Namespace to place chart in                                                                                                                   | `string`            | n/a                                 |   yes    |
| nfs\_server          | (optional) IP address of the NFS server                                                                                                       | `string`            | `""`                                |    no    |
| proxied              | Whether the DNS recourd should be proxied by Cloudflare.                                                                                      | `bool`              | `false`                             |    no    |
| repository           | (optional) Repository to install the chart from                                                                                               | `string`            | `"https://k8s-at-home.com/charts/"` |    no    |
| sensitive\_settings  | (optional) A list of maps to add helm set\_sensitive                                                                                          | `list(map(string))` | n/a                                 |   yes    |
| settings             | (optional) A list of maps to add helm settings                                                                                                | `list(map(string))` | n/a                                 |   yes    |
| timeout              | (optional) Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds.                    | `string`            | `300`                               |    no    |
| zone\_id             | (optional) Zone ID to add the record to                                                                                                       | `string`            | `""`                                |    no    |

## Outputs

| Name      | Description |
|-----------|-------------|
| namespace | n/a         |
