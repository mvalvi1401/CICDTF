# prepare your code repository


#/azure-pipelines.yml         #pipeline files
#/infra/main.tf        #terraform code
#/src/your-app.sln     #. net solution







provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
    name = "devops-rg"
    location = "east us"
}

resource "azurerm_app-service_plan" "plan" {
    name         = "devops-plan"
    loacation    = azurerm_resource-group.rg.location
    resource-group_name = azurerm_resource_group.rg.name
    sku {
        tier = "basic"
        size = "B1"
    }
}

resource "azurerm-app_service" "app" {
    name = "devops-webapp-auto"
    loacation = azurerm_resource_group.rg.location
    resource_group_name = azure_resource_group.rg.name
    app_service_plan_id = azurerm_app-service_plan.plan.id
}
