# Configure the Azure provider
provider "azurerm" {
    version = "=1.44.0"

}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
    name     = "myTFResourceGroup"
    location = "uksouth"
    
    tags = {
        environment = "TF sandbox"
    }
}
