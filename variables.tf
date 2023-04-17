variable "name" {
  description = "Name of the chart to install"
  type        = string
}

variable "proxied" {
  type        = bool
  description = "Whether the DNS recourd should be proxied by Cloudflare."
  default     = false
  nullable    = false
}

variable "external_ip" {
  description = "External cluster IP for getting a valid cert"
  type        = string
  nullable    = false
}

variable "timeout" {
  type        = string
  description = "(optional) Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds."
  default     = 300
  nullable    = false
}

variable "nfs_server" {
  type        = string
  description = "(optional) IP address of the NFS server"
  nullable    = false
}

variable "ingress" {
  description = "(optional) A list of endpoints"
  type        = list(string)
  default     = []
  nullable    = false
}

variable "zone_id" {
  type        = string
  description = "(optional) Zone ID to add the record to"
  nullable    = false
}

variable "create_volumes" {
  description = "A map of volume names and volume sizes to create"
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "limit" {
  description = "Whether to create a default limit for the namespace created"
  type        = bool
  default     = false
  nullable    = false
}

variable "atomic" {
  type        = bool
  description = "(Optional) If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to `false`."
  default     = true
  nullable    = false
}

variable "lint" {
  type        = bool
  description = "(Optional) Run the helm chart linter during the plan. Defaults to `false`."
  default     = true
  nullable    = false
}

variable "base_nfs_path" {
  type        = string
  description = "(optional) NFS Path on which to create the resources"
}

variable "chart" {
  description = "Chart name"
  type        = string
}

variable "settings" {
  description = "(optional) A list of maps to add helm settings"
  type        = list(map(string))
}

variable "sensitive_settings" {
  description = "(optional) A list of maps to add helm set_sensitive"
  type        = list(map(string))
}

variable "chart_version" {
  type        = string
  description = "Version of the Helm chart"
}

variable "create_namespace" {
  type        = bool
  description = "Whether to create the namespace"
  default     = true
  nullable    = false
}

variable "namespace" {
  type        = string
  description = "Namespace to place chart in"
}

variable "helm_file_override" {
  description = "(optional) Path(s) to the yaml override file"
  type        = list(string)
}

variable "repository" {
  description = "(optional) Repository to install the chart from"
  type        = string
  default     = "https://k8s-at-home.com/charts/"
  nullable    = false
}
