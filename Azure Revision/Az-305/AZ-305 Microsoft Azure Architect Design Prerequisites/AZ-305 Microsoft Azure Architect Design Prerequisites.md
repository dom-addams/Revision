# _AZ-305 Microsoft Azure Architect Design Prerequisites_
Learn the basic Azure concepts you'll need to know as an Azure infrastructure architect. 

## Describe the core architectural components of Azure
This module, introduces the core architectural components of Azure.

Learning objectives

* Describe Azure regions, region pairs, and sovereign regions
* Describe Availability Zones
* Describe Azure datacenters
* Describe Azure resources and Resource Groups
* Describe subscriptions
* Describe management groups
* Describe the hierarchy of resource groups, subscriptions, and management groups


Learn about the physical organization of Azure: datacenters, availability zones, and regions. And also about the organizational structure of Azure: resources and resource groups, subscriptions, and management groups.

### Describe Azure physical infrastructure
The core architectural components of Azure can be broken down into two main groupings: the physical infrastructure, and the management infrastructure.

#### Physical infrastructure
The physical infrastructure for Azure starts with datacenters. 

Conceptually, the datacenters are the same as large corporate datacenters. 

They’re facilities with resources arranged in racks, with dedicated power, cooling, and networking infrastructure.

As a global cloud provider, Azure has datacenters around the world. However, these datacenters aren’t directly accessible.

Datacenters are grouped into Azure Regions or Azure Availability Zones to achieve resiliency and reliability.

#### Regions
A region is a geographical area on the planet that contains at least one, but potentially multiple datacenters that are nearby. 

Azure intelligently assigns and controls the resources within each region to ensure workloads are appropriately balanced.

When you deploy a resource in Azure, you'll often need to choose the region where you want your resource deployed.

> Some services or virtual machine (VM) features are only available in certain regions, such as specific VM sizes or storage types.
> There are also some global Azure services that don't require you to select a particular region, such as Azure Active Directory.

#### Availability Zones
Availability zones are physically separate datacenters within an Azure region. 

Each availability zone is made up of one or more datacenters.

An availability zone is set up to be an isolation boundary. If one zone goes down, the other continues working. 

#### Use availability zones in your apps
You should ensure your services and data are redundant so you can protect your information in case of failure. 

Azure can help make your app highly available through availability zones.
 
You can use availability zones by co-locating your compute, storage, networking, and data resources within an availability zone and replicating in other availability zones.

Availability zones are primarily for VMs, managed disks, load balancers, and SQL databases. 

The Azure services that support availability zones fall into three categories:

* **Zonal services:** You pin the resource to a specific zone (for example, VMs, managed disks, IP addresses).
* **Zone-redundant services:** The platform replicates automatically across zones (for example, zone-redundant storage, SQL Database).
* **Non-regional services:** Services are always available from Azure geographies and are resilient to zone-wide outages as well as region-wide outages.

Even with the additional resiliency that availability zones provide, it’s possible that an event could be so large that it impacts multiple availability zones in a single region. To provide even further resilience, Azure has Region Pairs.

#### Region pairs
Most Azure regions are paired with another region within the same geography (such as US, Europe, or Asia) at least 300 miles away.

This approach allows for the replication of resources across a geography that helps reduce the likelihood of interruptions.

Examples of region pairs in Azure are West US paired with East US and South-East Asia paired with East Asia. 

There are several advantages of region pairs such as:

* If an extensive Azure outage occurs, one region out of every pair is prioritized to make sure at least one is restored as quickly as possible
* Planned Azure updates are rolled out to paired regions one region at a time to minimize downtime and risk of application outage.
* Data continues to reside within the same geography as its pair (except for Brazil South) for tax- and law-enforcement jurisdiction purposes.

Most regions are paired in two directions, meaning they are the backup for the region that provides a backup for them (West US and East US back each other up).

However, some regions, such as West India and Brazil South, are paired in only one direction.

In a one-direction pairing, the Primary region does not provide backup for its secondary region

#### Sovereign Regions
In addition to regular regions, Azure also has sovereign regions. 

Sovereign regions are instances of Azure that are isolated from the main instance of Azure. 

You may need to use a sovereign region for compliance or legal purposes.

Azure sovereign regions include:

* US DoD Central, US Gov Virginia, US Gov Iowa and more
* China East, China North, and more

### Describe Azure management infrastructure
The management infrastructure includes Azure resources and resource groups, subscriptions, and accounts. 

Understanding the hierarchical organization will help you plan your projects and products within Azure.

#### Azure resources and resource groups
A resource is the basic building block of Azure. Anything you create, provision, deploy, etc. is a resource.

Virtual Machines (VMs), virtual networks, databases, cognitive services, etc. are all considered resources within Azure.

Resource groups are simply groupings of resources. When you create a resource, you’re required to place it into a resource group.

Some resources may be moved between resource groups, but when you move a resource to a new group, it will no longer be associated with the former group.

Resource groups provide a convenient way to group resources together. 

When you apply an action to a resource group, that action will apply to all the resources within the resource group. 

#### Azure subscriptions
In Azure, subscriptions are a unit of management, billing, and scale. 

Similar to how resource groups are a way to logically organize resources, subscriptions allow you to logically organize your resource groups and facilitate billing.

A subscription provides you with authenticated and authorized access to Azure products and services. It also allows you to provision resources. 

An Azure subscription links to an Azure account, which is an identity in Azure Active Directory (Azure AD) or in a directory that Azure AD trusts.

An account can have multiple subscriptions, but it’s only required to have one. 

In a multi-subscription account, you can use the subscriptions to configure different billing models and apply different access-management policies. 

You can use Azure subscriptions to define boundaries around Azure products, services, and resources. 

There are two types of subscription boundaries that you can use:

* **Billing boundary:** This subscription type determines how an Azure account is billed for using Azure.
* **Access control boundary:** Azure applies access-management policies at the subscription level, and you can create separate subscriptions to reflect different organizational structures.

#### Create additional Azure subscriptions
Similar to using resource groups to separate resources by function or access, you might want to create additional subscriptions for resource or billing management purposes. 

For example, you might choose to create additional subscriptions to separate:

* Environments
* Organizational structures
* Billing

#### Azure management groups
The final piece is the management group. Resources are gathered into resource groups, and resource groups are gathered into subscriptions.

If you have many subscriptions, you might need a way to efficiently manage access, policies, and compliance for those subscriptions. 

Azure management groups provide a level of scope above subscriptions.

You organize subscriptions into containers called management groups and apply governance conditions to the management groups.

All subscriptions within a management group automatically inherit the conditions applied to the management group.

#### Management group, subscriptions, and resource group hierarchy
You can build a flexible structure of management groups and subscriptions to organize your resources into a hierarchy for unified policy and access management. 

The following diagram shows an example of creating a hierarchy for governance by using management groups.

![DIAGRAM](https://learn.microsoft.com/en-us/training/wwl-azure/describe-core-architectural-components-of-azure/media/management-groups-subscriptions-dfd5a108.png)

Some examples of how you could use management groups might be:

**Create a hierarchy that applies a policy.** You could limit VM locations to the US West Region in a group called Production. 

**Provide user access to multiple subscriptions.** By moving multiple subscriptions under a management group, you can create one Azure role-based access control (Azure RBAC) assignment on the management group.

