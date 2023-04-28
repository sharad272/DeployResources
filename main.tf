# Define a list of web app names
variable "web_app_names" {
  default = ["webapp1_github", "webapp2_github"]
}

# Create a resource for each web app using count.index
resource "azurerm_app_service" "web_app" {
  count = length(var.web_app_names)
#  name                = "${var.web_app_names[count.index]}-app-service"
  name                = var.web_app_names[count.index]
  location            = "eastus"
  resource_group_name = "research_development"
  app_service_plan_id = "/subscriptions/f545f248-4fb2-4f9c-a0cd-190c842b66d8/resourceGroups/research_development/providers/Microsoft.Web/serverfarms/ASP-researchdevelopment-b0ec"

  site_config {
    dotnet_framework_version = "v5.0"
  }
}
