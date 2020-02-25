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

[Azure Registry](https://registry.terraform.io/search?q=azure)

[HCL Reference](https://www.terraform.io/docs/configuration/index.html)

[AzureRm Provider Auth](https://www.terraform.io/docs/providers/azurerm/index.html#authenticating-to-azure)

[Guide for enthusiasts!](https://thorsten-hans.com/terraform-the-definitive-guide-for-azure-enthusiasts)

## Authentication Tips:

### Using Env Vars:

export ARM_CLIENT_ID=""

This is the name that your service principal uses to sign in to Azure.

export ARM_CLIENT_SECRET=""

This is the password that your service principal uses to sign in to Azure.

export ARM_TENANT_ID=""

A tenant is the organization in Azure Active Directory (Azure AD) where your service principal is located.

export ARM_SUBSCRIPTION_ID=""

This is your Azure subscription ID.

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

## Create tfstate storage

```
REGION=uksouth
RESOURCE_GROUP_NAME=tstate
STORAGE_ACCOUNT_NAME=tstate$RANDOM
CONTAINER_NAME=tstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $REGION

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"
```

## Lookup function usage:

```
location = "westus" # from terraform.tfvars

variable "sku" { # from variables.tf
    default = {
        westus = "16.04-LTS"
        eastus = "18.04-LTS"
    }
}

output "os_sku" {  # from main.tf
    value = lookup(var.sku, var.location)
}
```
...would return "16.04-LTS"





