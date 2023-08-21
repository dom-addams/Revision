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

* Resource Groups with lock type *"Read Only"* won't let you Create/Update/Delete/Move resources to or from them

* RG lock type *"Delete"* stops you from deleting resources

* Region on Resource Groups is a form of metadata and does not stop you from moving resources to other RG's in a different region

* You **cannot** move an App Service resource to another RG if one already exists in the destination RG

* Cloud device administrators can do basically anything to devices in Azure AD

* Dynamic Device groups in Azure don't let you add users or devices manually 

* Admins don't have to answer security questions when resetting passwords

* Azure locks prevent users from accidentally deleting or modifying resources

* You should give roles with more or less access to specific resources when access to other resources isn't required

* A Virtual Machine requires a Virtual Network or the permissions to create one

* Azure Policies don't restrict or stop existing resources







### _Implement and manage storage_

* To backup any Azure resource, you need a *Recovery Services Vault* in the same region as your resources. <br /> (The exception is with Sotrage Account resources i.e. blob)

* The minimum recommended Virtual Networks (Vnets) is 1. You only need multiple Vnets for complete isolation requirements or seperation of Non-prod and Prod networks + resources.

* "Net use" command is used to map/configure connections to shared resources like Network Drives. <br /> A Shared Access Signature (SAS) Token doesn't support the net use protocol. <br /> (Mounting an Azure File requires the primary or secondary storage access key.

* General Purpose(V1) Storage Accounts are no longer available

* Locally and Zone redundant storage options don't replicate to other regions <br /> (The minimum replication strategy that does this is *Geo-redundant* as it copies to a secondary region)

* Azure Import/Export only connects to Azure Blob and Files storage in a Storage Account

* To connect to file shares youo need SMB port 445 open

* The UNC path for file shares in a Storage Account is \\<storage-account-name>.**file**.core.windows.net\<file-share--name>

* The UNC path for file in a Blob Container is https://<storage-account-name>.**blob**.core.windows.net/<container-name>/<filename>

* Enable **"Data Protection" (Soft Delete)** on storage accounts to prevent accidental deletes of data






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

* Resources in an RG don't have be in the same region as the RG

* Multi-container groups for Azure Container Instance are only available on Linux

* Resource Manager Templates created via cli  are *deployment groups* and can be created from file using *--template-file*

* Any script that is adding or creating resources starts with **New-Az** not set

* Restoring or Replacing a VM from backups requires existing to be in state *stopped*

* To create an Azure Bastion Host, you need to create the AzureBastionSubnet in the Vnet





### _Configure and manage virtual networking_

* **Number/Type of applications tiers == Number of Subnets that should be created**

* If not registering devices to AD, its recommended to require Multi-Factor Authentication

* To using customn domain/suffic in Azure AD, you need to 1. Verify the domain 2. Add a custom domain name 3. Add a record to the domain's public DNS Zone

* Use a NAT Rule (network address translation) on a load balancer to direct traffic to specific resources/IP's

* Data Collector Set is used to collect performance information

* "Packet Capture" on Azure Network watcher can be used to inspect all traffic

* **Number of VM's == Number of NICs**

* 1 NSG can link to many NICs

* To set IP ranges in a Vnet, you first need an **Address space** which can be used for creating a Subnet

* To create resource with IP range, you need to create a Subnet from the Vnet address space with the specific start address (i.e. 10.2.1.0/24)

* Vnets with overlapping ranges (address spaces) *can't* be peered

* Vnet Peering has 2 states. 1) Initiated 2) Connected <br /> Initiated state means its connected in 1 direction <br /> Connected state means it connected in both directions (bidirectional)

* When adding custom domain, you also need to add a **TXT record** to Azure AD

* In most scenarios of connecting to web servers, expect traffic to be HTTPS (port 443)

* Computers in a point-to-site vpn need to have the same certificate chain installed (.pfx file)

* Azure Private Link avoids internet or public ip's by running on *Azure Backbone network* to use private IP's assigned by Azure

* If auto-registration of private domains is enabled, resources created in virtual network will be automatically registered to the domain

* IP Flow Verify tool lets you check if security group rules and blocking packets

* Connection Monitor lets you check Source and Destination endpoints to check for external connections

* For `site-to-site` VPN's, if an on-premise target device changes the Public IP, the `local gateway IP address` needs modifying 

* Application Gateways are a web traffic load balancer with extra features like routing based on http request attributes like paths

* The `forwarded traffic` setting in Virtual Networks allows traffic to be forwarded across networks

* Route Tables and User-defined route (UDR) are alternative ways of routing traffic to specific endpoints (but must exist in all Subnets across network)

* Virutal Networks required a `gateway subnet` for VPN connections




### _Monitor and backup Azure resources_

* For small files use **Azure Storage Explorer** to copy to Blob Storage

* Use **Azure Import/Export service** when you need large one-time data transfers 

* A Recovery Services Vault can only backup resources/data in the same azure region its provisioned

* Install Microsoft Azure Recovery Services Agent onto VM's to backup files between them <br /> (lets you backup from one vm and restore to another)

* Use Log Analytics to save/view system logs and create alerts in Azure Monitor

* Use an *Azure Backup Center* to create a **Backup Vault** for snapshoting Azure Disks

* A Recovery Service Vault doesn't support azure disks, only VM's and DB's 
























