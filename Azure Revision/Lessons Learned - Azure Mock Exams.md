# _Lessons Learned - Azure Mock Exams_

Collection of bullet points from questions I failed or flagged in Whizlab mock exams for az-104.

## Skills measured in exam
* Manage Azure identities and governance (15-20%)
* Implement and manage storage (15-20%)
* Deploy and manage Azure compute resources (20-25%)
* Configure and manage virtual networking (25-30%)
* Monitor and backup Azure resources (10-15%)

## Point by learning area
Key highlights of each area mesaured.

### _Manage Azure identities and governance_

* To support billing across multiple resource groups, it's recommended to **tag each resource** <br /> (This makes it easier to group or isolate areas)

* Standard Load Balancer > Basic Load Balancer <br /> (basic LB is recommended for small non-critical/redundant applications. A Standard is recommended for everytihng else)

* When creating custom role based on existing, always start with **Get-AzRoleDefinition**

* Use Azure Policies to enforce standards and restrictions. This policies are best applied at a Subscription level

* The **"Security Admin"** role only has access to the Security Center despite what the name implies

* The role action definition `"Microsoft.Authorization/*"` gives access over *all* subscriptions in azure.



### _Implement and manage storage_

* To backup any Azure resource, you need a *Recovery Services Vault* in the same region as your resources. <br /> (The exception is with Sotrage Account resources i.e. blob)

* The minimum recommended Virtual Networks (Vnets) is 1. You only need multiple Vnets for complete isolation requirements or seperation of Non-prod and Prod networks + resources.

* "Net use" command is used to map/configure connections to shared resources like Network Drives. <br /> A Shared Access Signature (SAS) Token doesn't support the net use protocol. <br /> (Mounting an Azure File requires the primary or secondary storage access key.

* General Purpose(V1) Storage Accounts are no longer available

* Locally and Zone redundant storage options don't replicate to other regions <br /> (The minimum replication strategy that does this is *Geo-redundant* as it copies to a secondary region)



### _Deploy and manage Azure compute resources_

* **You cab move resources accross subscripotion using `Move-AzResource` PowerShell command**

* To add a NIC to a VM, the VM needs to be stopped first

* A tool called **IP Flow Verify** can be used to check if a packet is allowewd or denied to/from a VM

* You can find "Deployments" from a Resource Group "blade/view" to check what Azure Resource Manager templates was used for creating resources.

* Web Apps running on an App Service is the most effective wayto deploy and check code between environments as it uses "slots" which can be swapped out or restored.

* Virtual Machine Scale Sets is a free service with no backed SLA

* Create machines with an **"availability set"** for redundency

* **Azure Managed Disks** can also be used for guarenteeing 99% SLA for VM's

* **Number/Type of applications tiers == Number of availability sets that should be created**



### _Configure and manage virtual networking_

* **Number/Type of applications tiers == Number of Subnets that should be created**

* 





























