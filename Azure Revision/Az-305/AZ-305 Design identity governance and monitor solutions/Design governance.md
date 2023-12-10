# _AZ-305: Design identity, governance, and monitor solutions_

# _Design governance_
Design identity, governance, and monitor solutions including authentication.

Azure Architects design and recommend governance solutions.

Learning objectives:

* Design for governance.
* Design for management groups.
* Design for Azure subscriptions.
* Design for resource groups.
* Design for resource tagging.
* Design for Azure Policy.
* Design for Azure role-based access control.
* Design for Azure Blueprints.
* Design for Azure landing zones.

The term governance describes the general process of establishing rules and policies. Governance ensures those rules and policies are enforced.

A good governance strategy helps you maintain control over the applications and resources that you manage in the cloud. 

Maintaining control over your environment ensures that you stay compliant with:

* Industry standards, such as information security management.
* Corporate or organizational standards, such as ensuring that network data is encrypted.

Governance is most beneficial when you have:

* Multiple engineering teams working in Azure.
* Multiple subscriptions to manage.
* Regulatory requirements that must be enforced.
* Standards that must be followed for all cloud resources.


## Design for governance
Governance provides mechanisms and processes to maintain control over your applications and resources in Azure. 

Governance involves determining your requirements, planning your initiatives, and setting strategic priorities.

To effectively apply your governance strategies, you must first create a hierarchical structure for your organizational environment. 

This structure lets you apply governance strategies exactly where they're needed. 

The governance strategies we cover in this module are Azure policy and resource tags.

A typical Azure hierarchy has four levels: management groups, subscriptions, resource groups, and resources. 

* **Management groups** help you manage access, policy, and compliance for multiple subscriptions.
* **Subscriptions** are logical containers that serve as units of management and scale. Subscriptions are also billing boundaries.
* **Resource groups** are logical containers into which Azure resources are deployed and managed.
* **Resources** are instances of services that you create. For example, virtual machines, storage, and SQL databases.



## Design for management groups
Management groups are containers that help you manage access, policy, and compliance across multiple subscriptions. 

You can use management groups to:

* Limit the regions where virtual machines can be created, across subscriptions.
* Provide user access to multiple subscriptions by creating one role assignment that's inherited by other subscriptions.
* Monitor and audit role and policy assignments, across subscriptions.

### Things to know about management groups
As you plan the governance strategy, consider these characteristics of management groups:

* Management groups can be used to aggregate policy and initiative assignments via Azure Policy.
* A management group tree can support up to [six levels of depth](https://learn.microsoft.com/en-us/azure/governance/management-groups/overview). This limit doesn't include the tenant root level or the subscription level.
* Azure role-based access control authorization for management group operations isn't enabled by default.
* By default, all new subscriptions are placed under the root management group.

### Things to consider when creating management groups
Consider the below points when creating and using management groups in your organisation:

* Design management groups with governance in mind. 
	* Use Azure policies at the management group level for all workloads that require the same security, compliance, connectivity, and feature settings.

* Keep the management group hierarchy reasonably flat. 
	* A hierarchy that's too flat doesn't provide flexibility and complexity for large organizations. 
	* A hierarchy with too many levels can be difficult to manage.

* Consider a top-level management group. 
	* Implement a top-level management group to support common platform policy and Azure role assignments across the entire organization.

* Consider an organizational or departmental structure. 
	* Design your management groups based on the organizational structure, to make it easy to understand. 
	* Use Separate the management groups for each department like Sales, Corporate, and IT.

* Consider a geographical structure. 
	* Build your management groups by using a geographical structure to allow for compliance policies in different regions. 
	
* Consider a production management group. 
	* Institute a production management group to create policies that apply to all corporate products. 
	
* Consider a sandbox management group. 
	* Offer a sandbox management group for users to experiment with Azure. 
	* The sandbox provides isolation from your development, test, and production environments. 
	* It can be used to allow users can experiment with resources that might not yet be allowed in official environments.

* Consider isolating sensitive information in a separate management group. 
	* Secure sensitive data by using a corporate management group for Tailwind Traders. 
	* The separate management group provides both standard and enhanced compliance policies for the main office.



## Design for subscriptions
Azure Subscriptions are logical containers that serve as units of management and scale and billing boundaries. 

Limits and quotas can be applied, and each organization can use subscriptions to manage costs and resources by group.

### Things to know about subscriptions
To use Azure, you must have an Azure subscription. 

A subscription provides you with a logical container to create and pay for Azure products and services. 

There are several types of subscriptions, such as Enterprise Agreement and Pay-as-You-Go.

As you plan the governance strategy, consider these characteristics of subscriptions:

* Subscriptions can provide separate billing environments, such as development, test, and production.
* Policies for individual subscriptions can help satisfy different compliance standards.
* You can organize specialized workloads to scale beyond the limits of an existing subscription.
* By using subscriptions, you can manage and track costs for your organizational structure.

### Things to consider when creating subscriptions
Consider the below points when creating and using subscriptions in Azure:

* Treat subscriptions as a democratized unit of management. 
	* Align your subscriptions to meet specific Tailwind Traders business needs and priorities.

* Group subscriptions together under management groups. 
	* Group together subscriptions that have the same set of policies and Azure role assignments to inherit these settings from the same management group. 

* Consider a dedicated shared services subscription. 
	* Use a shared services subscription to ensure all common network resources are billed together and isolated from other workloads. 
	* Examples of shared services subscriptions include Azure ExpressRoute and Virtual WAN.

* Consider subscription scale limits. 
	* Subscriptions serve as a scale unit for component workloads. 
	* Large, specialized workloads like high-performance computing, IoT, and SAP are all better suited to use separate subscriptions. 
	* By having separate subscriptions for different you can avoid resource limits (such as a limit of 50 Azure Data Factory integrations).

* Consider administrative management. 
	* Subscriptions provide a management boundary, which allows for a clear separation of concerns. 

* Consider how to assign Azure policies. 
	* Both management groups and subscriptions serve as a boundary for the assignment of Azure policies. 
	* Workloads like those for the Payment Card Industry (PCI) typically require extra policies to achieve compliance. 
	* Rather than using a management group to group workloads that require PCI compliance, you can achieve the same isolation with a subscription. 
	* These types of decisions ensure you don't have too many management groups with only a few subscriptions.

* Consider network topologies. 
	* Virtual networks can't be shared across subscriptions. 
	* Resources can connect across subscriptions with different technologies, such as virtual network peering or Virtual Private Networks (VPNs). 
	* Consider which workloads must communicate with each other for deciding if a new subscription is required.

* Consider making subscription owners aware of their roles and responsibilities. 
	* Conduct a quarterly or biannual access review by using Microsoft Entra Privileged Identity Management. 
	* Access reviews ensure privileges don't proliferate as users move within the Tailwind Traders customer organization.

> When it comes to subscriptions, one size doesn't fit all. A solution that works for one business unit might not be suitable for another. 



## Design for resource groups
Resource groups are logical containers into which Azure resources are deployed and managed. 

These resources can include web apps, databases, and storage accounts. 

You can use resource groups to:

* Place resources of similar usage, type, or location in logical groups.
* Organize resources by life cycle so all the resources can be created or deleted at the same time.
* Apply role permissions to a group of resources or give a group access to administer a group of resources.
* Use resource locks to protect individual resources from deletion or change.

### Things to know about resource groups
Consider these characteristics of resource groups:

* Resource groups have their own location (region) assigned. This region is where the metadata is stored.
* If the resource group's region is temporarily unavailable, you can't update resources in the resource group because the metadata is unavailable. The resources in other regions still function as expected, but you can't update them.
* Resources in the resource group can be in different regions.
* A resource can connect to resources in other resource groups. You can have a web application that connects to a database in a different resource group.
* Resources can be moved between resource groups with some exceptions.
* You can add a resource to or remove a resource from a resource group at any time.
* Resource groups can't be nested.
* Each resource must be in one, and only one, resource group.
* Resource groups can't be renamed.

### Things to consider when creating resource groups
Consider the below for managing resources with resource groups:

* Consider group by type. 
	* Group resources by type for on-demand services that aren't associated with an app. 
	* For example, you can have a resource group for the SQL databases (SQL-RG) and a separate resource group (WEB-RG) for the web services.

* Consider group by app. 
	* Group resources by app when all resources have the same policies and life cycle. 
	* This method can also be applied to test or prototype environments. 
	* Each group can have all the resources for the specific application.

* Consider group by department, group by location (region), and group by billing (cost center). 

* Consider a combination of organizational strategies. 
	* Don't restrict your strategy to using only a single resource group. 
	* A combination of options is best.

* Consider resource life cycle. 
	* Design your resource groups according to life cycle requirements. 
	* Do you want to deploy, update, and delete certain resources at the same time? If so, place these resources in the same resource group.

* Consider administration overhead. 
	* Include overhead planning in your strategy. 
	* How many resource groups would you like to manage? 
	* Do you have centralized or decentralized Azure administrators?

* Consider resource access control. 
	* Implement access control for your resource groups. 
	* At the resource group level, you can assign Azure policies, Azure roles, and resource locks. 
	* Resource locks prevent unexpected changes to critical resources.

* Consider compliance requirements. 
	* Plan to build in support for compliance in your Tailwind Traders strategy. 
	* Do you need to ensure your resource group metadata is stored in a particular region?



## Design for resource tags
[Resource tags](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources?tabs=json) are another way to organize resources. Tags provide extra information, or metadata, about your resources.

> Before you start a resource tagging project, ask yourself what you want to accomplish. Will the tags be used for reporting or billing?

### Things to know about resource tags
Consider the below characteristics of resource tags:

* A resource tag consists of a name-value pair. For example, `env = production` or `env = dev, test`.
* You can assign one or more tags to each Azure resource, resource group, or subscription.
* Resource tags can be added, modified, and deleted. 
* You can use the following tools to manage tags: PowerShell, the Azure CLI, Azure Resource Manager (ARM) templates, the REST API, or the azure portal.
* [Tags can be applied](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources) to a resource group. However, tags applied to a resource group aren't inherited by the resources in the group.


### Things to consider when creating resource tags
Consider the below points for when to create resource tags:

* Consider your organization's taxonomy. 
	* Align your resource tags with accepted department nomenclature to make it easier to understand. 
	* Are there recognized terms for compliance or cost reporting? 
	* Add tags for office locations, confidentiality levels, or other defined policies.

* Consider whether you need IT-aligned or business-aligned tagging. 
	* Implement IT-aligned tagging or business-aligned tagging, or a combination of these approaches to be most effective.

> Many organizations are shifting from IT-aligned to business-aligned tagging strategies.

**The following table describes the tagging options in detail.**

Alignment | Description
--- | --- 
IT-aligned | The IT-aligned option is useful for tracking workload, application, function, or environment criteria. <br /> This option can reduce the complexity of monitoring assets.
Business-aligned | The Business-aligned option helps to focus on accounting, business ownership, cost responsibility, and business criticality. <br /> This option provides improved accounting for costs and value of IT assets to the overall business.

* Consider the type of tagging required. 
	* Plan to use different types of resource tags to support the different areas in the organisation. 
	* Resource tags generally fall into five categories: functional, classification, accounting, partnership, and purpose.


**The following table describes the different tagging types.**

Tag Type | Description | Example name-value pairs
--- | --- | ---
Functional | Functional tags categorize resources according to their purpose within a workload. <br /> This tag shows the deployed environment for a resource, or other functionality and operational details. | - `app = catalogsearch1` <br /> - `tier = web` <br /> - `webserver = apache` <br /> - `env = production, dev, staging` 
Classification | Classification tags identify a resource by how it's used and what policies apply to it. | - `confidentiality = private` <br /> - `SLA = 24hours`
Accounting | Accounting tags allow a resource to be associated with specific groups within an organization for billing purposes. | - `department = finance` <br /> - `program = business-initiative` <br /> - `region = northamerica`
Partnership | Partnership tags provide information about the people (other than IT members) who are associated with a resource, or otherwise affected by the resource. | - `owner = jsmith` <br /> - `contactalias = catsearchowners` <br /> - `stakeholders = user1;user2;user3`
Purpose | Purpose tags align resources to business functions to better support investment decisions. | - `businessprocess = support` <br /> - `businessimpact = moderate` <br /> - `revenueimpact = high`


* Consider starting with a few tags and then scale out. 
	* The resource tagging approach you choose can be simple or complex. 
	* Rather than identify all the possible tags required, prototype with just a few important or critical tags.
	* Determine how effective the tagging scheme is before you add more resource tags.

* Consider using Azure policy to apply tags and enforce tagging rules and conventions. 
	* Resource tagging is only effective if it's used consistently across an organization. 
	* You can use Azure policy to require that certain tags be added to new resources as they're created.
	* You can also define rules that reapply tags that have been removed.

* Consider which resources require tagging. 
	* Keep in mind that you don't need to enforce that a specific tag is present on all resources.
	* You might decide that only mission-critical resources have the Impact tag. 
	* All non-tagged resources would then not be considered as mission critical.

> To implement an effective resource tagging structure, be sure to seek input from the different stakeholders in your organization.



## Design for Azure Policy
[Azure Policy](https://azure.microsoft.com/services/azure-policy) is a service in Azure that enables you to create, assign, and manage policies to control or audit your resources. 

These policies enforce different rules over your resource configurations so the configurations stay compliant with corporate standards.

### Things to know about Azure Policy
Consider the following characteristics of Azure Policy:

* Azure Policy lets you define both individual policies and groups of related policies, called initiatives. Azure Policy comes with many built-in policy and initiative definitions.
* Azure policies are inherited down the hierarchy.
* You can scope and enforce Azure policies at different levels in the organizational hierarchy.
* Azure Policy evaluates all resources in Azure and Arc-enabled resources (specific resource types that are hosted outside of Azure).
* Azure Policy highlights resources that aren't compliant with the current policies.
* Use Azure Policy to prevent noncompliant resources from being created, and automatically remediate noncompliant resources.
* Azure Policy integrates with Azure DevOps by applying pre-deployment and post-deployment policies.


### Things to consider when using Azure Policy
Consider the following about Azure Policy:

* Consider using the Azure Policy compliance dashboard. 
	* Use the Azure Policy compliance dashboard to analyze the overall state of the environment. 
	* The dashboard offers an aggregated view where you can drill down to see policies for each resource and level. 
	* The tool provides bulk remediation for existing resources and automatic remediation for new resources, to resolve issues rapidly and effectively.

* Consider when Azure Policy evaluates resources. 
	* Plan for how Azure Policy evaluates your resources at specific times. 
	* Understand when and how evaluations are triggered. 
	* There might be a delay in identifying non-compliant resources. 
	
* The following events or times trigger an evaluation:
	* A resource is created, deleted, or updated in scope with a policy assignment.
	* A policy or an initiative is newly assigned to a scope.
	* An assigned policy or initiative for a scope is updated.
	* The standard compliance evaluation cycle (occurs once every 24 hours).

* Consider how to handle a noncompliant resource. 
	* Determine how you're going to handle noncompliant resources. 
	* An organization can have a different way of handling noncompliance depending on the resource. 
	* Some examples include: Deny changes to the resource. // Log changes to the resource.  // Alter the resource before or after the change.

* Consider when to automatically remediate noncompliant resources. 
	* Decide if you want Azure Policy to do automatic remediation for noncompliant resources. 
	* Remediation is especially useful in resource tagging. 
	* Azure Policy can tag resources and reapply tags that have been removed. 
	* You can use Azure Policy to ensure all resources in a certain resource group are tagged with a specific tag like Location to identify the region.

* Consider how Azure Policy is different from role-based access control (RBAC). 
	* It's important to understand that Azure Policy and Azure RBAC are different. 
	* Azure RBAC and Azure Policy should be used together to achieve full scope control.

* You use Azure Policy to ensure the resource state is compliant with the organization's business rules. 
	* Compliance doesn't depend on who made the change or who has permission to make changes. 
	* Azure Policy evaluates the state of a resource, and acts to ensure the resource stays compliant.

* You implement Azure RBAC to focus on user actions at different scopes. 
	* Azure RBAC manages who can access Azure resources, what they can do with those resources, and what areas they can access. 
	* If actions need to be controlled, use Azure RBAC. 
	* If a user has access to complete an action, but the result is a noncompliant resource, Azure Policy still blocks the action.


### Control resource access
After you determine your identity management solution, it's time to think about resource access. 

What resources should these identities be able to access? How will you enforce that access? How will you monitor and review the access?

A user's identity goes through several phases. 

Initially, the user has no access. 

Access can be granted through RBAC and verified with Microsoft Entra Conditional Access. 

Microsoft Entra ID Protection can be used to monitor the user's access. 

Periodically, Microsoft Entra access reviews confirm the access is still required.



## Design for role-based access control (RBAC)
Azure RBAC allows you to grant access to Azure resources that you control. 

Azure RBAC evaluates each request for access and determines if access should be blocked, not allowed, or allowed.

RBAC is an allow model. An allow model means when a user is assigned a specific role, Azure RBAC allows the user to perform the actions associated with that role. 

A role assignment could grant a user read permissions to a resource group. To have write permissions, the role would need to explicitly allow write access.

### Things to know about Azure RBAC
Suppose you need to manage access to resources in Azure. Here are some scenarios you can implement with Azure RBAC:

* Allow one user to manage virtual machines in a subscription, and allow another user to manage virtual networks.
* Allow members of a database administrator group to manage SQL databases in a subscription.
* Allow a user to manage all resources in a resource group, such as virtual machines, websites, and subnets.
* Allow an application to access all resources in a resource group.

### Things to consider when using Azure RBAC
Consider how to integrate Azure RBAC to control user privileges and resource access.

* Consider the highest scope level for each requirement. 
	* Your first step is to accurately define each role definition and its permissions.
	* Next, assign the roles to specific users, groups, and service principles. 
	* Lastly, scope the roles to management groups, subscriptions, resource groups, and resources. Assign each role at the highest scope level that meets the requirements.

* Consider the access needs for each user. 
	* As you plan your access control strategy, it's a best practice to grant users the least privilege they need to get their work done. 
	* This method makes it easier to separate team member responsibilities. 
	* By limiting roles and scopes, you limit what resources are at risk if a security principle is ever compromised. 
	* You can create a diagram to help plan your Azure RBAC roles.

* Consider assigning roles to groups, and not users. 
	* To make role assignments more manageable, avoid assigning roles directly to users. 
	* Instead, assign roles to groups. Assigning roles to groups helps minimize the number of role assignments.

* Consider when to use Azure policies. 
	* Azure policies are used to focus on resource properties. 
	* During deployment, an Azure policy can be used to ensure users can deploy only certain virtual machines in a resource group. 
	* By using a combination of Azure policies and Azure RBAC, you can provide effective access control in your solution. 

**The following table compares these access models.**

 | Azure Policy | Azure RBAC
 --- | --- | ---
Description | Defined policies to ensure resources are compliant with a set of rules. | Authorization system that provides fine-grained access controls.
Main focus | Focused on the properties of resources. | Focused on what resources users can access.
Implementation | Specify a set of rules. | Assign roles and scopes.
Default access | By default, policy rules are set to allow. | By default, all access for all users is denied.

* Consider when to create a custom role. 
	* Sometimes, the built-in roles don't grant the precise level of access you need. 
	* Custom roles allow you to define roles that meet the specific needs of your organization. 
	* Custom roles can be shared between subscriptions that trust the same Microsoft Entra ID.

* Consider how to resolve overlapping role assignments. 
	* Azure RBAC is an additive model, so your effective permissions are the sum of your role assignments. 
	* Consider a user is granted the Contributor role at the subscription scope and the Reader role on a resource group. 
	* The sum of the Contributor permissions and the Reader permissions is effectively the Contributor role for the subscription. 
	* Therefore, in this case, the Reader role assignment has no impact.



## Design for Azure landing zones
An [Azure landing zone](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/) provides an infrastructure environment for hosting your workloads. 

Landing zones ensure key foundational principles are put in place before you deploy services.

To use an analogy, shared city utilities like water, gas, and electricity are available to new homes before they're built. 

In the same manner, the network, identity and access management, policies, and monitoring configuration for landing zones must be ready before you try to deploy.

These "utilities" for landing zones need to be active and ready to help streamline the application migration process.


### Things to know about Azure landing zones
Consider the below characteristics of Azure landing zones:

* Landing zones are defined by management groups and subscriptions that are designed to scale according to business needs and priorities.

The following diagram shows landing zones for SAP, Corporate, and Online applications.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/wwl-azure/design-governance/media/landing-zones.png)

* Azure policies are associated with landing zones to ensure continued compliance with the organization platform.
* Landing zones are pre-provisioned through code.
* A landing zone can be scoped to support application migrations and development to scale across the organization's full IT portfolio.
* The Azure landing zone accelerator can be deployed into the same Microsoft Entra tenant for an existing Azure architecture. The accelerator is an Azure-portal-based deployment.

### Things to consider when using Azure landing zones
Consider how you can use Azure landing zones to scale your design:

* Consider including landing zones in your design. 
	* Include landing zones in your overall Azure infrastructure design. 
	* You can use subscriptions as a unit of management and scale that's aligned with business needs and priorities. 
	* Apply Azure Policy to provide guardrails and ensure continued compliance with your organization's platform, along with the applications that are deployed onto it.

* Consider creating landing zones through code. 
	* Implement landing zones that are pre-provisioned through code. 
	* As your situation changes, you should expect to refactor the code. 
	* Use an iterative approach that maximizes learning opportunities and minimizes time to business success. 
	* You can minimize refactoring by having a central IT team to review both short term and long-term scenarios.

* Consider using the [Azure landing zone accelerator](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/#azure-landing-zone-accelerator). 
	* Use the accelerator to provide a full implementation of the conceptual architecture, along with opinionated configurations for key components like management groups and policies.

* Consider focusing on your applications. 
	* Focus on application-centric migrations and development rather than pure infrastructure lift-and-shift migrations, such as moving virtual machines.

* Consider Azure-native design and aligning with the platform. 
	* Favor using Azure-native platform services and capabilities, when possible. 
	* It's crucial to align with the Azure platform roadmap to ensure that new capabilities are made available within customer environments.

* Consider scoping for both migrations and green field situations. 
	* Scope the landing zone to support application migrations and green field development at scale in Azure. 
	* This expansion allows for a design that can scale across your organization's complete IT portfolio, which looks well beyond a short-term cloud-adoption plan.

* Consider [transitioning existing architectures to Azure landing zones](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/transition). 
	* Take advantage of landing zones for existing Azure architecture. 
	* Deploy the Azure landing zone accelerator into the same Microsoft Entra tenant in parallel with the current environment.
	* You can create a new management group structure and ensure that the existing environment isn't affected by these changes.

> It's recommended to conduct an Azure landing zone review, to host workloads that you plan to build in or migrate to the cloud. 
> This assessment is designed for customers with two or more years of experience.

