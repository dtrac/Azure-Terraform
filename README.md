# Azure-Terraform

## Getting Started

Mac:

```bash
brew upgrade terraform
```

Windows:

```powershell
choco install terraform -y
```

Both:

Ensure terraform executable is available on your PATH
If using VS Code and terraform > 0.12 - ensure the >0.12 language support extension is installed..

## Verify installation

```
$ terraform
Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.

Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
...
```

## Useful Links:

[HCL Reference](https://www.terraform.io/docs/configuration/index.html)

[AzureRm Provider Auth](https://www.terraform.io/docs/providers/azurerm/index.html#authenticating-to-azure)

[Guide for enthusiasts!](https://thorsten-hans.com/terraform-the-definitive-guide-for-azure-enthusiasts)

## Authentication Tips:

### Using Env Vars:

export ARM_CLIENT_ID="<Redacted>"
export ARM_CLIENT_SECRET="<Redacted>"
export ARM_SUBSCRIPTION_ID="<Redacted>"
export ARM_TENANT_ID="<Redacted>"

### Using Provider Block:
```
variable "client_secret" {
}

provider "azurerm" {
  version = "=1.44.0"

  subscription_id = "00000000-0000-0000-0000-000000000000"
  client_id       = "00000000-0000-0000-0000-000000000000"
  client_secret   = var.client_secret
  tenant_id       = "00000000-0000-0000-0000-000000000000"
}
```



