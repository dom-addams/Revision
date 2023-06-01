# _AZ-104: Prerequisites for Azure administrators_

The pre-requisite information that could be useful to know for taking AZ-104

## Use Azure Resource Manager
Learn how to use resource groups to organize your Azure resources.

> Topics covered:

- Review Azure Resource Manager benefits
- Review Azure resource terminology
- Create resource groups
- Create Azure Resource Manager locks
- Reorganize Azure resources
- Remove resources and resource groups
- Determine resource limits

### Review Azure Resource Manager benefits
- The infrastructure for your application is typically made up of many components i.e. VM, Storage Account, Vnet, Web App, Database
- These components aren't separate entitities
- Instead they are related and interdependent parts of a single entity
- You want to deploy, manage, and monitor them as one/a group
- With Resource Manager, you can achieve this "solution as a group" to pefrom a single, coordinated operation

#### Consistent management layer
- Resource Manager provides a consistent management layer to perform tasks with: 
	- PowerShell
	- Azure CLI
	- Azure Portal
	- REST API
	- Client SDKs

#### Benefits
- Benefits provided by Resource Manager are:
	- Deploy, Manage, and Monitor all the resources for your solution as a group
	- Repeatedly deploy solution throughout the development lifecycle and maintain a consistent state each time
	- Manage infrastructure through declarative templates rather than scripts
	- Define dependencies between resources to deploy in the correct order
	- Apply access control to all services in your resource group using Role-Based Access Control (RBAC)
	- Apply tags to resources to logically organize all the resources in a subscription
	- Clarify your organization's billing by viewing costs for a group of resources sharing the same tag

#### Guidance
- Microsoft recommends the following to take full advantage of Azure Resource Manager
	- Define and deploy infrastructure using declarative syntax with **Resource Manager templates**, instead of imperative commands.
	- Define all deployment and configuration steps in the template. (There is no reason to have manual steps with templates)
	- Only run imperative commands to manage your resources, such as to start or stop a Virtual Machine
	- Arrange resources with the same lifecycle in a resource group. Use tags for all other organizing of resources.

### Review Azure resource terminology

#### Terminology
Azure Resource Manager has many functions and terms. The most common are:

- **Resource** - A manageable item that is available through Azure i.e. Virtual Machine
- **Resource Group** - A container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources 
- **Resource Provider** - A service that supplies the resources you can deploy and manage through Resource Manager. Each resource provider offers operations for working with the resources that are deployed. Some common resource providers are 
	- Microsoft.Compute, which supplies the virtual machine resource
	- Microsoft.Storage, which supplies the storage account resource
	- Microsoft.Web, which supplies resources related to web apps.
- **Template** - A JavaScript Object Notation (JSON) file that defines one or more resources to deploy to a resource group. It also defines the dependencies between the deployed resources. The template can be used to deploy the resources consistently and repeatedly.
- **Declarative Syntax** - Syntax that lets you state "Here is what I intend to create" without having to write the sequence of programming commands to create it. The Resource Manager template is an example of declarative syntax. In the file, you define the properties for the infrastructure to deploy to Azure.

#### Resource Providers
- Each resource provider offers a set of resources and operations for working with an Azure service.
- For example, if you want to store keys and secrets, you work with the Microsoft.KeyVault resource provider.
- This resource provider offers a resource type called vaults for creating the key vault.

- **The name of a resource type is in the format: {resource-provider}/{resource-type}. Key Vault example is Microsoft.KeyVault/vaults.**

### Create resource groups
- Resources can be deployed to any new or existing resource group
- Resource Groups are a simple and logical collection of resources 
- There are a few rules for using resource groups

#### Considerations
- Resources can only exist in one resource group.
- Resource Groups cannot be renamed.
- Resource Groups can have resources of many different types (services).
- Resource Groups can have resources from many different regions.

#### Creating Resource Groups
* There are some important factors to consider when defining your resource group:
	* All the resources in your group should share the same lifecycle
	* If a resource needs a different deployment cycle, it must be created in another resource group
	* Each resource can only exist in one resource group.
	* You can add or remove a resource to a resource group at any time.
	* You can move a resource from one resource group to another group. Limitations do apply to moving resources.
	* A resource group can contain resources that reside in different regions.
	* A resource group can be used to scope access control for administrative actions.
	* A resource can interact with resources in other resource groups (a common example is web apps connecting to a database)

* Resource groups have require a location for Azure to know where to store metadata and offer compliance to ensure that your data is stored in a particular region

### Create Azure Resource Manager locks
- A common concern with resources provisioned in Azure is the ease with which they can be deleted
- Resource Manager locks allow organizations to put a structure in place that prevents the accidental deletion of resources in Azure
	- You can associate the lock with a subscription, resource group, or resource.
	- Locks are inherited by child resources.

#### Lock Types
There are two types of resource locks

* Read-Only locks, which prevent any changes to the resource.
* Delete locks, which prevent deletion.

### Reorganize Azure resources
Sometimes you may need to move resources to either a new subscription or a new resource group

* When moving resources, both the source group and the target group are locked during the operation. 
* Write and delete operations are blocked on the resource groups until the move completes.
* This lock means you can't add, update, or delete resources in the resource groups.
* Locks don't mean the resources aren't available. For example, if you move a virtual machine to a new resource group, an application can still access the virtual machine.

#### Limitations
Before beginning this process be sure to read the [Move operation support](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/move-support-resources) for resources page. 

This page details what resources can be moved between resources group, subscriptions, and regions.

#### Implementation
To move resources, select the resource group containing those resources, and then select the Move button

Select the resources to move and the destination resource group. Acknowledge that you need to update scripts.

### Remove resources and resource groups
Use caution when deleting a resource group. Deleting a resource group deletes all the resources contained within it.

That resource group might contain resources that resources in other resource groups depend on.

#### Removing resources
You can delete individual resources within a resource group.

Instead, of deleting you can move the resource to another resource group.

It's also possible to delete a resource group via PowerShell using **Remove-AzResourceGroup**

### Determine resource limits
Azure lets you view resource usage against limits. This is helpful to track current usage, and plan for future use.

* The limits shown are the limits for your subscription.
* When you need to increase a default limit, there is a Request Increase [link](https://learn.microsoft.com/en-us/azure/azure-subscription-service-limits?toc=%2fazure%2fnetworking%2ftoc.json).
* All resources have a maximum limit listed in Azure limits.
* If you are at the maximum limit, the limit can't be increased.

### Configure resources with Azure Resource Manager templates

#### Azure Resource Manager template advantages
An Azure Resource Manager template precisely defines all the Resource Manager resources in a deployment.

You can deploy a Resource Manager template into a resource group as a single operation.

Using Resource Manager templates will make your deployments faster and more repeatable

#### Template benefits
- **Templates improve consistency** - Resource Manager templates provide a common language for you and others to describe your deployments.
- **Templates help express complex deployments.** - Templates enable you to deploy multiple resources in the correct order.
- **Templates reduce manual, error-prone tasks** - Manually creating and connecting resources can be time consuming, and it's easy to make mistakes.
- **Templates are code** 
- **Templates promote reuse** - Your template can contain parameters that are filled in when the template runs.
- **Templates are linkable** - You can link Resource Manager templates together to make the templates themselves modular and re-useable 
- **Templates simplify orchestration** - You only need to deploy the template to deploy all of your resources

### Azure Resource Manager template schema
Azure Resource Manager templates are written in JSON, which allows you to express data stored as an object (such as a virtual machine) in text.

A JSON document is essentially a collection of key-value pairs. Each key is a string, whose value can be:

- A string
- A number
- A Boolean expression
- A list of values
- An object (which is a collection of other key-value pairs)

A Resource Manager template can contain sections that are expressed using JSON notation, but aren't related to the JSON language itself:

~~~json
{
    "$schema": "http://schema.management.​azure.com/schemas/2019-04-01/deploymentTemplate.json#",​
    "contentVersion": "",​
    "parameters": {},​
    "variables": {},​
    "functions": [],​
    "resources": [],​
    "outputs": {}​
}
~~~

#### Schema Elements
* $schema - (required) - Location of the JSON schema file that describes the version of the template language. Use the URL shown in the preceding example.
* contentVersion - (required) - Version of the template (such as 1.0.0.0). You can provide any value for this element. Use this value to document significant changes in your template. 
* parameters - Values that are provided when deployment is executed to customize resource deployment.
* variables - Values that are used as JSON fragments in the template to simplify template language expressions.
* functions - User-defined functions that are available within the template.
* resources - (required) - Resource types that are deployed or updated in a resource group.
* outputs - Values that are returned after deployment.

### Azure Resource Manager template parameters
In the parameters section of the template, you specify which values you can input when deploying the resources. 

The available properties for a parameter are:

~~~~json
"parameters": {
    "<parameter-name>" : {
        "type" : "<type-of-parameter-value>",
        "defaultValue": "<default-value-of-parameter>",
        "allowedValues": [ "<array-of-allowed-values>" ],
        "minValue": <minimum-value-for-int>,
        "maxValue": <maximum-value-for-int>,
        "minLength": <minimum-length-for-string-or-array>,
        "maxLength": <maximum-length-for-string-or-array-parameters>,
        "metadata": {
        "description": "<description-of-the parameter>"
        }
    }
}
~~~~

Example illustrating two parameters for a virtual machine. its username and its password:

~~~~json
"parameters": {
  "adminUsername": {
    "type": "string",
    "metadata": {
      "description": "Username for the Virtual Machine."
    }
  },
  "adminPassword": {
    "type": "securestring",
    "metadata": {
      "description": "Password for the Virtual Machine."
    }
  }
}
~~~~

### Consider Bicep templates
[Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview) is a domain-specific language (DSL) that uses declarative syntax to deploy Azure resources. 

It provides concise syntax, reliable type safety, and support for code reuse.

* You can use Bicep instead of JSON to develop your Azure Resource Manager templates (ARM templates).
* The JSON syntax to create an ARM template can be verbose and require complicated expressions.
* Bicep syntax reduces that complexity and improves the development experience

**How does Bicep work?**

* When you deploy a resource or series of resources to Azure, you submit the Bicep template to Resource Manager, which still requires JSON templates.
* The tooling that's built into Bicep converts your Bicep template into a JSON template. (known as transpilation).
* Transpilation is the process of converting source code written in one language into another language.

**Bicep provides many improvements over JSON for template authoring, including:**

* **Simpler syntax:** Bicep provides a simpler syntax for writing templates.
* **Modules:** You can break down complex template deployments into smaller module files and reference them in a main template.
* **Automatic dependency management:** In most situations, Bicep automatically detects dependencies between your resources.
* **Type validation and IntelliSense:** The Bicep extension for Visual Studio Code features rich validation and IntelliSense for all Azure resource type API definitions. This feature helps provide an easier authoring experience.


### Administrative Tools
Azure provides three administration tools:

1. The Azure portal
2. The Azure CLI
3. Azure PowerShell

#### Azure Portal
The portal is a Graphical User Interface (GUI) that makes it convenient to locate the resource you need and execute any required changes. 

It also guides you through complex administrative tasks by providing wizards and tooltips. However, the portal doesn't provide any way to automate repetitive tasks.

#### Azure CLI
The Azure CLI is a cross-platform command-line program to connect to Azure and execute administrative commands on Azure resources. 

Below is an example to create a VM, using CLI command:

~~~
az vm create \
  --resource-group CrmTestingResourceGroup \
  --name CrmUnitTests \
  --image UbuntuLTS
  ...
~~~

#### Azure PowerShell
Azure PowerShell is a module you add to PowerShell to let you connect to your Azure subscription and manage resources.

Azure PowerShell provides the New-AzVM command, which creates a virtual machine in Azure.

The example code to do this is:

~~~
New-AzVm `
    -ResourceGroupName "CrmTestingResourceGroup" `
    -Name "CrmUnitTests" `
    -Image "UbuntuLTS"
    ...
~~~

And vice versa, the command to delete everything inside a Resource Group is:

~~~
Remove-AzResourceGroup -Name MyResourceGroupName
~~~

### Deploy Azure infrastructure by using JSON ARM templates
JSON Azure Resource Manager templates (ARM templates) allow you to specify your project's infrastructure in a declarative and reusable way.

#### What is an ARM template?
* ARM templates are JavaScript Object Notation (JSON) files that define the infrastructure and configuration for your deployment. 
* The template uses a declarative syntax. 
* The declarative syntax is a way of building the structure and elements that outline what resources will look like without describing its control flow.
	* Declarative syntax is different than imperative syntax, which uses commands for the computer to perform.
	* Imperative scripting focuses on specifying each step in deploying the resources.

#### Benefits of ARM Templates
* ARM templates allow you to automate deployments and use the practice of infrastructure as code (IaC)
* ARM templates allow you to declare what you intend to deploy without having to write the sequence of programming commands to create it
* Just like application code, you can store the IaC files in a source repository and version it
* ARM templates are idempotent, which means you can deploy the same template many times without state drifting
* Resource Manager orchestrates the deployment of the resources so they're created in the correct order.
	* When possible, resources will also be created in parallel to finish deployments quicker
	* It also has built-in validation, it checks the template before starting the deployment

#### ARM template file structure
Below are the elements used within an ARM Template for deploying resources:

Element | Description
------------- | -------------
schema | A required section that defines the location of the JSON schema file that describes the structure of JSON data.
contentVersion | A required section that defines the version of your template (such as 1.0.0.0)
apiProfile | An optional section that defines a collection of API versions for resource types. Use this value to avoid having to specify API versions for each resource
parameters | An optional section where you define values that are provided during deployment.
variables | An optional section where you define values that are used to simplify template language expressions.
functions | An optional section where you can define [user-defined functions](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/template-user-defined-functions) that are available within the template
resources | A required section that defines the actual items you want to deploy or update in a resource group or a subscription.
output | An optional section where you specify the values that will be returned at the end of the deployment.

Example StorageAccount template:

~~~json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.1",
  "apiProfile": "",
  "parameters": {},
  "variables": {},
  "functions": [],
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts",
      "apiVersion": "2019-06-01",
      "name": "learntemplatestorage123",
      "location": "westus",
      "sku": {
        "name": "Standard_LRS"
      },
      "kind": "StorageV2",
      "properties": {
        "supportsHttpsTrafficOnly": true
      }
    }
  ],
  "outputs": {}
}
~~~

Example Parameter Section of Template:

~~~json
"parameters": {
  "<parameter-name>": {
    "type": "<type-of-parameter-value>",
    "defaultValue": "<default-value-of-parameter>",
    "allowedValues": [
      "<array-of-allowed-values>"
    ],
    "minValue": <minimum-value-for-int>,
    "maxValue": <maximum-value-for-int>,
    "minLength": <minimum-length-for-string-or-array>,
    "maxLength": <maximum-length-for-string-or-array-parameters>,
    "metadata": {
      "description": "<description-of-the-parameter>"
    }
  }
}
~~~

#### Recommendations for using parameters
Use parameters for settings that vary according to the environment; for example, SKU, size, or capacity.

Also use parameters for resource names that you want to specify yourself for easy identification or to comply with internal naming conventions. 

Provide a description for each parameter, and use default values whenever possible.

#### Use outputs in an ARM template
~~~json
"outputs": {
  "storageEndpoint": {
    "type": "object",
    "value": "[reference('learntemplatestorage123').primaryEndpoints]"
  }
}
~~~

Notice the reference part of the expression. This function gets the runtime state of the storage account.

Remember, templates are idempotent. This means that if you run a template with no changes a second time it won't make any changes

