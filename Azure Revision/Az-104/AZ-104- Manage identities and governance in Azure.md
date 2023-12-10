# _AZ-104: Manage identities and governance in Azure_

Learn how to manage Azure Active Directory objects, role-based access control (RBAC), subscriptions, and governance in Azure.

## Configure Azure Active Directory
Learn how to configure Azure Active Directory, including features like Azure AD join and self-service password reset.

> Topics covered:

- Define Azure AD concepts, including identities, accounts, and tenants.
- Describe Azure AD features to support different configurations.
- Understand differences between Azure AD and Active Directory Domain Services (AD DS).
- Choose between supported editions of Azure AD.
- Implement the Azure AD join feature.
- Use the Azure AD self-service password reset feature.

> Manage identities and governance in Azure (15-20%)

- Manage Azure Active Directory objects
	- Configure self-service password reset
	- Configure Azure AD join

### _Describe Azure Active Directory benefits and features_
[Azure Active Directory (Azure AD)](https://learn.microsoft.com/en-us/azure/active-directory/) is Microsoft's multi-tenant cloud-based directory and identity management service.

- Azure AD helps to support user access to resources and applications, such as:
	- Internal resources and apps located on your corporate network.
	- External resources like Microsoft 365, the Azure portal, and SaaS applications.
	- Cloud apps developed for your organization.

#### Things to know about Azure AD features

Azure AD feature	 | Description
------------- | -------------
Single sign-on (SSO) access | Azure AD provides secure single sign-on (SSO) to web apps on the cloud and to on-premises apps. 
Ubiquitous device support | Azure AD works with iOS, macOS, Android, and Windows devices, and offers a common experience across the devices.
Secure remote access | Azure AD enables secure remote access for on-premises web apps. Secure access can include multifactor authentication (MFA), conditional access policies, and group-based access management.
Cloud extensibility | Azure AD can extend to the cloud to help you manage a consistent set of users, groups, passwords, and devices across environments. 
Sensitive data protection | Azure AD offers unique identity protection capabilities to secure your sensitive data and apps. Admins can monitor for suspicious sign-in activity and potential vulnerabilities in a consolidated view of users and resources in the directory.
Self-service support | Azure AD lets you delegate tasks to company employees that might otherwise be completed by admins with higher access privileges.

#### Things to consider when using Azure AD features
Azure AD offers many features and benefits for corporate scenarios.

- **Consider enabling single sign-on access** - Enable SSO access for your users to connect to the cloud or use on-premises apps. Azure AD SSO supports Microsoft 365 and thousands of SaaS apps.
- **Consider UX and device support** - Build a consistent user experience that works for all devices and directory access points. You can design custom company portals and personalized web-based access.
- **Consider benefits of secure remote access** - Protect your on-premises web apps by implementing secure remote access with MFA and access policies.
- **Consider advantages of cloud extensibility** - Connect Active Directory and other on-premises directories in the cloud to Azure AD in just a few steps.
- **Consider advanced protection for sensitive data** - Enhance the security of your sensitive data and apps by using the built-in protection features of Azure AD.
- **Consider reduced costs, self-service options** - Take advantage of the Azure AD self-service features to help reduce costs for your organization. Delegate certain tasks like resetting passwords, or creating and managing groups to your non-admin users.


### _Describe Azure Active Directory concepts_
The following table describes the main components and concepts of Azure AD and explains how they work together to support service features.

Azure AD concept	 | Description
------------- | -------------
Identity | An identity is an object that can be authenticated. The identity can be a user with a username and password. Identities can also be applications or other servers.
Account | An account is an identity that has data associated with it. To have an account, you must first have a valid identity. You can't have an account without an identity.
Azure AD account	| An Azure AD account is an identity that's created through Azure AD or another Microsoft cloud service, such as Microsoft 365. Identities are stored in Azure AD and are accessible to your organization's cloud service subscriptions. 
Azure tenant (directory) | An Azure tenant is a single dedicated and trusted instance of Azure AD. Each tenant (also called a directory) represents a single organization. 
Azure subscription | An Azure subscription is used to pay for Azure cloud services. Each subscription is joined to a single tenant. You can have multiple subscriptions.

### _Compare Active Directory Domain Services to Azure Active Directory_
Active Directory Domain Services (AD DS) is the traditional deployment of Windows Server-based Active Directory on a physical or virtual server.

- Active Directory Domain Services (AD DS) also includes:
	- Active Directory Certificate Services (AD CS)
	- Active Directory Lightweight Directory Services (AD LS)
	- Active Directory Federation Services (AD FS)
	- Active Directory Rights Management Services (AD RMS)

#### Things to consider when using Azure AD rather than AD DS
Azure AD is similar to AD DS, but there are significant differences.

Using Azure AD for your configuration is different from deploying an Active Directory domain controller on an Azure virtual machine and then adding it to your on-premises domain.

**Consider the following characteristics that distinguish Azure AD from AD DS.**

- **Identity solution** - AD Domain Service is primarily a directory service, while Azure AD is a full identity solution. Azure AD is designed for internet-based applications that use HTTP and HTTPS communications.
- **Communication protocols** - Because Azure AD is based on HTTP and HTTPS, it doesn't use Kerberos authentication. Instead it uses protocols, such as SAML, WS-Federation, and OpenID Connect for authentication (and OAuth for authorization).
- **Federation services** - Azure AD includes federation services, and many third-party services like Facebook.
- **Flat structure** - Azure AD users and groups are created in a flat structure. There are no organizational units (OUs) or group policy objects (GPOs).
- **Managed service** - Azure AD is a managed service. You manage only users, groups, and policies. Deploying AD DS on VM's involved managing other tasks, including deployment, configuration, virtual machines, patching, and other backend processes.

> Note: kerberos authentication uses symmetric key cryptography and a key distribution center (KDC) to authenticate and verify user identities


### _Select Azure Active Directory editions_
Azure Active Directory comes in four editions: Free, Microsoft 365 Apps, Premium P1, and Premium P2. 

The Premium editions are available through a Microsoft Enterprise Agreement, the Open Volume License Program and the Cloud Solution Providers program.

(Azure and Microsoft 365 subscribers can also buy Azure Active Directory Premium P1 and P2 online)

#### Things to know about Azure AD editions
Consider the following features that distinguish the different editions of Azure AD. An X indicates the feature is supported.

Feature | Free | Microsoft 365 Apps | Premium P1 | Premium P2
------- | :---: | :---: | :---: | :---:
Directory Objects | 500,000 | Unlimited | Unlimited | Unlimited
Single Sign-on | Unlimited | Unlimited | Unlimited | Unlimited
Core Identity and Access Management | X | X | X | X
Business-to-business Collaboration |  | X | X | X
Identity and Access Management for Microsoft 365 apps |  | X | X | X
Premium Features	|  |  | X | X | 
Hybrid Identities |  |  | X | X 
Advanced Group Access Management |  |  | X | X
Conditional Access  |  |  | X | X
Identity Protection	|  |  |  | X
Identity Governance	|  |  |  | X

#### Azure Active Directory Free
The Free edition provides user and group management, on-premises directory synchronization, and basic reports. 

Single sign-on access is supported across Azure, Microsoft 365, and many popular SaaS apps.

#### Azure Active Directory Microsoft 365 Apps
This edition is included with Microsoft 365. In addition to the Free features. This edition provides Identity and Access Management for Microsoft 365 apps. 

The extra support includes branding, MFA, group access management, and self-service password reset for cloud users.

#### Azure Active Directory Premium P1
In addition to the Free features, the Premium P1 edition lets your hybrid users access both on-premises and cloud resources.

This edition supports advanced administration like dynamic groups, self-service group management, and cloud write-back capabilities.

P1 also includes Microsoft Identity Manager, an on-premises identity and access management suite. The extra features in P1 allow self-service password reset for your on-premises users.

#### Azure Active Directory Premium P2
Premium P2 edition offers all of Free and P1 and adds Azure AD Identity Protection to help provide risk-based Conditional Access to your apps and critical company data. 

Privileged Identity Management is included to help discover, restrict, and monitor administrators and their access to resources, and to provide just-in-time access when needed.


### _Implement Azure Active Directory join_
Azure Active Directory enables single sign-on (SSO) to devices, applications, and services from anywhere

The Azure AD join feature works with SSO to provide access to organizational apps and resources, and to simplify Windows deployments of work-owned devices.

#### Things to know about the Azure AD join feature
Table of benefits for using joined devices:

Benefit | Description
--- | ---
Single-Sign-On (SSO) | Joined devices offer SSO access to your Azure-managed SaaS apps and services.
Enterprise state roaming | Starting in Windows 10, your users can securely synchronize their user settings and app settings data to joined devices
Access to Microsoft Store for Business	| When your users access Microsoft Store for Business by using an Azure AD account, they can choose from an inventory of applications pre-selected by your organization.
Windows Hello	 | Provide your users with secure and convenient access to work resources from joined devices.
Restriction of access | Restrict user access to apps from only joined devices that meet your compliance policies.
Seamless access to on-premises resources | Joined devices have seamless access to on-premises resources, when the device has line of sight to the on-premises domain controller.

#### Things to consider when using joined devices
For using joined devices, review and consider these configuration points:

- **Consider connection options** - Connect your device to Azure AD in one of two ways
	- **Register your device to Azure AD** - Azure AD device registration provides the device with an identity that's used to authenticate the device when a user signs into Azure AD. 
	- **Join your device** - (extension of registering a device) - Joining provides the benefits of registering, and also changes the local state of the device. 
- **Consider combining registration with other solutions** - Combine registration with a mobile device management (MDM) solution like Microsoft Intune, to provide other device attributes in Azure AD.
- **Consider other implementation scenarios** - Although AD Join is intended for organizations that don't have an on-premises Windows Server Active Directory infrastructure, it can be used for other scenarios like branch offices.


### _Implement Azure Active Directory self-service password reset_
The Azure Active Directory self-service password reset (SSPR) feature lets you give users the ability to bypass helpdesk and reset their own passwords.

#### Things to know about the Azure AD SSPR feature
Examine the following characteristics and requirements of the Self-Service Password Reset feature:

- SSPR requires an Azure AD account with Global Administrator privileges to manage SSPR options.
- SSPR uses a security group to limit the users who have SSPR privileges.
- All user accounts in your organization must have a valid license to use SSPR.

#### Things to consider when using SSPR
For implementing the Self-Service Password Reset feature, review the following points:

- **Consider who can reset their passwords** 
- **Consider your authentication methods** - Determine how many authentication methods are required to reset a password. Options available are:
	- Your system must require at least one authentication method to reset a password.
	- multiple authentication methods including email notification, text message, or a security code sent to the user's mobile or office phone
	- You can require security questions to be registered for the users in your Azure AD tenant.
	- You can configure how many correctly answered security questions are required for a successful password reset.
- **Consider combining methods for stronger security**


## Configure user and group accounts
Learn how to configure user and group accounts.

> Topics covered:

- Configure users accounts and user account properties.
- Create new user accounts.
- Import bulk user accounts with a template.
- Configure group accounts and assignment types. 

### _Create user accounts_
Every user who wants access to Azure resources needs an Azure user account.

A user account has all the information required to authenticate the user during the sign-in process.

Azure Active Directory (Azure AD) supports three types of user accounts, which indicate where the user is defined (in the cloud or on-premises) and if the user is internal or external to AD.

#### Things to know about user accounts
The following table describes the user accounts supported in Azure AD.

User Account | Description
--- | ---
Cloud identity | A user account with a cloud identity is defined only in Azure AD. This type of user account includes administrator accounts and users who are managed as part of your organization. 
Directory-synchronized identity | User accounts that have a directory-synchronized identity are defined in an on-premises Active Directory. A synchronization activity occurs via Azure AD Connect to bring these user accounts in to Azure.
Guest user | Guest user accounts are defined outside Azure. Examples include user accounts from other cloud providers, and Microsoft accounts like an Xbox LIVE account.

#### Things to consider when choosing user accounts
- **Consider where users are defined** - Determine where your users are defined. Are they in AZ AD or an external AD?
- **Consider support for external contributors** -  Allow external contributors to access your Azure Organisation through Guest Accounts.
- **Consider a combination of user accounts** - Implement the user account types that enable your organization to satisfy their business requirements. Such as AD Sync for external users and AZ AD for internal cloud indentity users.

### _Manage user accounts_
There are several ways to add cloud identity user accounts in Azure Active Directory (Azure AD). 

The most common is by using the Azure portal. Users can also be added to Azure AD through Microsoft 365 Admin Center, Microsoft Intune admin console, and the Azure CLI.

#### Things to know about cloud identity accounts
Reviewing how cloud identity user accounts are defined in Azure AD.

- **A new user account must have a display name and an associated user account name**
- **Information and settings that describe a user are stored in the user account profile**
- **The profile can have other settings like a user's job title, and their contact email address**
- **A user with Global administrator or User administrator privileges can preset profile data in user accounts**
- **Non-admin users can set some of their own profile data, but they can't change their display name or account name**

#### Things to consider when managing cloud identity accounts
There are several points to consider about managing user accounts. They are:

- **Consider user profile data** - Allow users to set their profile information for their accounts, as needed
- **Consider restore options for deleted accounts** - Include restore scenarios in your account management plan. Such as restore deleted acocunt up to 30 days after removal.
- **Consider gathered account data** - Collect sign-in and audit log information for user accounts.

### _Create bulk user accounts_
Azure Active Directory (Azure AD) supports several bulk operations, including bulk create and delete for user accounts.

#### Things to know about bulk account operations
Below are some characteristics of bulk operations in the Azure portal.

- **Only Global administrators or User administrators have privileges to create and delete user accounts in the Azure portal.**
- **To complete bulk create or delete operations, the admin fills out a comma-separated values (CSV) template of the data for the user accounts.**
- **Bulk operation templates can be downloaded from the Azure AD portal.**
- **Bulk lists of user accounts can be downloaded.**

#### Things to consider when creating user accounts
Here are some design considerations for creating and deleting user accounts. Think about what user account conventions and processes might be required by your organization.

- **Consider naming conventions** - stablish or implement a naming convention for your user accounts.
- **Consider using initial passwords** - Implement a convention for the initial password of a newly created user.
- **Consider strategies for minimizing errors** - View and address any errors, by downloading the results file on the Bulk operation results page in the Azure portal. 

### _Create group accounts_
Azure Active Directory (Azure AD) allows your organization to define two different types of group accounts. Security groups and Microsoft 365 groups.

> Security groups are used to manage member and computer access to shared resources

> Microsoft 365 groups provide collaboration opportunities by sharing mailbox, files and more 

#### Things to know about creating group accounts
Review the following characteristics of group accounts in Azure AD. 

- Use security groups to set permissions for all group members at the same time, rather than adding permissions to each member individually.
- Add Microsoft 365 groups to enable group access for guest users outside your Azure AD organization.
- Security groups can be implemented only by an Azure AD administrator.
- Normal users and Azure AD admins can both use Microsoft 365 groups.

#### Things to consider when adding group members
When you add members to a group, there are different ways you can assign member access rights.

Access Rights | Description
--- | ---
Assigned | Add specific users as members of a group, where each user can have unique permissions.
Dynamic user	| Use dynamic membership rules to automatically add and remove group members.
Dynamic device | (Security groups only) y) Apply dynamic group rules to automatically add and remove devices in security groups.

### _Create administrative units_
As you design your strategy for managing identities and governance in Azure, planning for comprehensive management of your Azure Active Directory (Azure AD) infrastructure is critical. 

It can be useful to restrict administrative scope by using administrative units for your organization.

> An administrative unit is an Azure AD resource that can be a container for other Azure AD resources

#### Things to think about administrative units
Consider how a central admin role can use administrative units to benefit an organisation.

- Create an administrative unit for the desired department.
- Create a role that has administrative permissions for the specific AD users/group
- Populate the administrative unit with only relevant people/users

#### Things to consider when working with administrative units
Considerations for using Administrative Units in an organisation:

- **Consider management tools** - Review best option for managing AUs i.e. Azure portal or Azure CLI
- **Consider role requirements in the Azure portal** - Plan your strategy for administrative units according to role privileges.
- **Consider scope of administrative units** - Recognize that the scope of an administrative unit applies only to management permissions.


## Configure subscriptions
Learn how to configure Azure subscriptions, including how to obtain a subscription, implement cost management, and apply Azure resource tags.

> Topics Covered

- Determine the correct region to locate Azure services.
- Review features and use cases for Azure subscriptions.
- Obtain an Azure subscription.
- Understand billing and features for different Azure subscriptions.
- Use Microsoft Cost Management for cost analysis.
- Discover when to use Azure resource tagging.
- Identify ways to reduce costs.

### _Identify Azure regions_
Microsoft Azure is made up of datacenters located around the globe. These datacenters are organized and made available to end users by region.

A [region](https://azure.microsoft.com/global-infrastructure/regions/) is a geographical area on the planet containing at least one, but potentially multiple datacenters.

#### Things to know about regions
- Azure is generally available in more than 60 regions in 140 countries.
- Azure has more global regions than any other cloud provider.
- Regions provide you with the flexibility and scale needed to bring applications closer to your users.
- Regions preserve data residency and offer comprehensive compliance and resiliency options for customers.

#### Things to know about regional pairs
Most Azure regions are paired with another region within the same geography to make a regional pair (or paired regions).

An example of this is for the UK has 2 regions, UK South and UK West.

The following table describes some prominent characteristics of paired regions:

Characteristic | Description
--- | ---
Physical isolation | Azure prefers at least 300 miles of separation between datacenters in a regional pair.
Platform-provided replication	| Some services like Geo-Redundant Storage provide automatic replication to the paired region.
Region recovery order | During a broad outage, recovery of one region is prioritized out of every pair.
Sequential updates | Planned Azure system updates are rolled out to paired regions sequentially (not at the same time) using Rolling Updates.
Data residency | Regions reside within the same geography as their enabled set (except for the Brazil South and Singapore regions).

#### Things to consider when using regions and regional pairs
- **Consider resource and region deployment** - Plan the regions where you want to deploy your resources.
- **Consider service support by region** - Research region and service availability.
- **Consider services that don't require regions** - Identify services that don't need region support.
- **Consider exceptions to region pairing** - Check the Azure website for current region availability and exceptions.
- **Consider benefits of data residency** - Take advantage of the benefits of data residency offered by regional pairs.

#### Find regions for your business geography
Option | Link
--- | ---
By geography	| Search [Azure Regions](https://azure.microsoft.com/global-infrastructure/geographies/#geographies) by geography.
By product | Search [Azure products](https://azure.microsoft.com/global-infrastructure/services/) by region or geography.
Paired Regions | Search for [Paired Regions](https://learn.microsoft.com/en-us/azure/best-practices-availability-paired-regions#azure-cross-region-replication-pairings-for-all-geographies) and exceptions.

### _Implement Azure subscriptions_
An Azure subscription is a logical unit of Azure services that's linked to an Azure account.

An Azure account is an identity in Azure Active Directory (Azure AD) or a directory that's trusted by Azure AD.

#### Things to know about subscriptions
As you think about implementing subscriptions to for your company, consider the following points:

- Every Azure cloud service belongs to a subscription.
- Each subscription can have a different billing and payment configuration.
- Multiple subscriptions can be linked to the same Azure account.
- More than one Azure account can be linked to the same subscription.
- Billing for Azure services is done on a per-subscription basis.
- If your Azure account is the only account associated with a subscription, you're responsible for the billing requirements.
- Programmatic operations for a cloud service might require a subscription ID.

#### Things to consider when using subscriptions
Consider how many subscriptions your organization needs to support the business scenarios.

- **Consider the types of Azure accounts required** - Determine the types of Azure accounts your users will link with Azure subscriptions.
- **Consider multiple subscriptions** 
- **Consider a dedicated shared services subscription** - Plan for how users can share resources allocated in a single subscription.
- **Consider access to resources** - Every Azure subscription can be associated with an Azure AD Instance.

### _Obtain an Azure subscription_
To use Azure, you must have an Azure subscription.

There are several ways to procure an Azure subscription. These ways are:

- [Enterprise agreement](https://azure.microsoft.com/pricing/enterprise-agreement/)
- [Microsoft reseller](https://www.microsoft.com/licensing/licensing-programs/open-license.aspx)
- [Microsoft partner](https://azure.microsoft.com/partners/directory/)
- [Personal free account](https://azure.microsoft.com/free/)

### _Identify Azure subscription usage_
Azure offers free and paid subscription options to meet different needs and requirements.

The most common subscriptions are Free, Pay-As-You-Go, Enterprise Agreement, and Student.

For an organization, you can choose a combination of procurement options and subscription choices to meet your business scenarios.

#### Things to consider when choosing Azure subscriptions
- Consider trying Azure for free - An Azure free subscription includes a monetary credit to spend on any service for the first 30 days.
- Consider paying monthly for used services - A Pay-As-You-Go (PAYG) subscription charges you monthly for the services you used in that billing period.
- Consider using an Azure Enterprise Agreement - An Enterprise Agreement provides flexibility to buy cloud services and software licenses under one agreement.
- Consider supporting Azure for students - An Azure for Students subscription includes a monetary credit that can be used within the first 12 months.

### _Implement Microsoft Cost Management_
With Azure products and services, you pay only for what you use. 

As you create and use Azure resources, you're charged for the resources.

Microsoft Cost Management provides support for administrative billing tasks and helps you manage billing access to costs.

You can use Cost Management Service to monitor and control Azure spending, and optimize your Azure resource usage.

#### Things to know about Microsoft Cost Management
Microsoft Cost Management has the following product characteristics and features:

- Microsoft Cost Management shows organizational cost and usage patterns with advanced analytics.
- Costs are based on negotiated prices and factor in reservation and Azure Hybrid Benefit discounts. (Predictive analytics are also available)
- Reports in Microsoft Cost Management show the usage-based costs consumed by Azure services and third-party Marketplace offerings.
- Reports show your internal and external costs for usage and Azure Marketplace charges.
- It uses Azure management groups, budgets, and recommendations to show clearly how your expenses are organized and how you might reduce costs.
- You can use the Azure portal or various APIs for export automation to integrate cost data with external systems and processes.

#### Things to consider when using Microsoft Cost Management
Microsoft Cost Management can help you plan for and control your organization costs

- **Consider cost analysis** - Take advantage of cost analysis features to explore and analyze your organizational costs.
- **Consider budget options** - Use features to establish and maintain budgets.
- **Consider recommendations** - Review recommendations to learn how you can optimize and improve efficiency.
- **Consider exporting cost management data** - Microsoft Cost Management helps you work with your billing information.

### _Apply resource tagging_
You can apply tags to your Azure resources to logically organize them by categories. 

Tags are useful for sorting, searching, managing, and doing analysis on your resources.

Each resource tag consists of a name and a value. For example, name = Env amd Value = Dev / Test / Prod

#### Things to know about resource tags
Azure resource tags has the following characteristics:

- Each resource tag has a name and a value.
- The tag name remains constant for all resources that have the tag applied.
- The tag value can be selected from a defined set of values, or unique for a specific resource instance.
- A resource or resource group can have a maximum of 50 tag name/value pairs.
- Tags applied to a resource group aren't inherited by the resources in the resource group.

#### Things to consider when using resource tags
- **Consider searching on tag data** - You can search for resources by querying on the tag name and value. 
- **Consider finding related resources** - Retrieve related resources from other resource groups by searching on the tag name or value.
- **Consider grouping billing data** - Group resources like virtual machines by cost center and environment. (downloaded reports will have column "Tags")
- **Consider creating tags with PowerShell or the Azure CLI**

### _Apply cost savings_
Azure has several options that can help you gain significant cost savings for your organization.

Below table shows options/advantages for cost saving.

Cost Saving | Description
--- | ---
Reservations | Save money by paying ahead. You can pay for one year or three years for most Azure resources like Virtual Machines, DB's
Azure Hybrid Benefits | Access pricing benefits if you have a license that includes Software Assurance
Azure Credits | Use the monthly credit benefit to develop, test, and experiment with new solutions on Azure. A Visual Studio subscriber could use Microsoft Azure at no extra charge.
Azure regions | Compare pricing across regions. Pricing can vary from one region to another, even in the US.
Budgets | Apply the budgeting features in Microsoft Cost Management to help plan and drive organizational accountability.
Pricing Calculator | The [Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) provides estimates in all areas of Azure, including compute, networking, storage, web, and databases.


## Configure Azure Policy
[Azure Policy](https://azure.microsoft.com/services/azure-policy/) is a service in Azure that enables you to create, assign, and manage policies to control or audit your resources. 

These policies enforce different rules over your resource configurations so the configurations stay compliant with corporate standards. You apply the policies to your resources by using management groups.

### _Create management groups_
Organizations that use multiple subscriptions need a way to efficiently manage access, policies, and compliance.

[Azure management groups](https://learn.microsoft.com/en-us/azure/governance/management-groups/overview) provide a level of scope and control above your subscriptions. You can use management groups as containers to manage access, policy, and compliance across your subscriptions.

#### Things to know about management groups
The following are characteristics of Azure management groups:

- By default, all new subscriptions are placed under the top-level management group, or root group.
- All subscriptions within a management group automatically inherit the conditions applied to that management group.
- A management group tree can support up to six levels of depth.
- Azure role-based access control authorization for management group operations isn't enabled by default.

#### Things to consider when using management groups
- **Consider custom hierarchies and groups** - Align your Azure subscriptions by using custom hierarchies and grouping that meet your company's organizational structure and business scenarios.
- **Consider policy inheritance** - Control the hierarchical inheritance of access and privileges in policy definitions. All subscriptions within a management group inherit the conditions applied to the management group.
- **Consider compliance rules** - Organize your subscriptions into management groups to help meet compliance rules for individual departments and teams.
- **Consider cost reporting** - Use management groups to do cost reporting by department or for specific business scenarios. You can use management groups to report on budget details across subscriptions.

#### Create management groups
You can create a management group with Azure Policy by using the Azure portal, PowerShell, or the Azure CLI.

- A management group has a directory unique identifier (ID) and a display name. 
- The ID is used to submit commands on the management group.
- The ID value can't be changed after it's created because it's used throughout the Azure system to identify the management group.
- The display name for the management group is optional and can be changed at any time.

### _Implement Azure policies_
You can use policies to enforce rules on your resources to meet corporate compliance standards and service level agreements.

Azure Policy runs evaluations and scans on your resources to make sure they're compliant.

#### Things to know about Azure Policy
The main advantages of Azure Policy are in the areas of enforcement and compliance, scaling, and remediation. 

Azure Policy is also important for teams that run an environment that requires different forms of governance.

Advantages | Description
--- | ---
Enforce rules and compliance | Enable built-in policies, or build custom policies for all resource types. Support real-time policy evaluation and enforcement, and periodic or on-demand compliance evaluation.
Apply policies at scale	 | Apply policies to a management group with control across your entire organization. Apply multiple policies and aggregate policy states with policy initiative. Define an exclusion scope.
Perform remediation	| Conduct real-time remediation, and remediation on your existing resources.
Exercise governance	| Implement governance tasks for your environment: Support multiple engineering teams, Manage multiple subscriptions, Standardize and enforce how cloud resources are configured, Manage regulatory compliance, cost control, security, and design consistency

#### Things to consider when using Azure Policy
- **Consider deployable resources** - Specify the resource types that your organization can deploy by using Azure Policy. For example, virtual machine SKUs.
- **Consider location restrictions** - Restrict the locations your users can specify when deploying resources. Do this by setting geographic locations or regions.
- **Consider rules enforcement** - Enforce compliance rules and configuration options to help manage your resources and user options.
- **Consider inventory audits** - Use Azure Policy with Azure Backup service on your VMs and run inventory audits.

### _Create Azure policies_
Azure Administrators use Azure Policy to create policies that define conventions for resources.

A policy definition describes the compliance conditions for a resource, and the actions to complete when the conditions are met.

One or more policy definitions are grouped into an initiative definition, to control the scope of your policies and evaluate the compliance of your resources.

#### Step 1: Create policy definitions
- A policy definition expresses a condition to evaluate and the actions to perform when the condition is met.
- You can create your own policy definitions, or choose from built-in definitions in Azure Policy. 
- You can create a policy definition to prevent VMs in your organization from being deployed, if they're exposed to a public IP address.

#### Step 2: Create an initiative definition
- An initiative definition is a set of policy definitions that help you track your resource compliance state to meet a larger goal.
- You can create your own initiative definitions, or use built-in definitions in Azure Policy.
- You can use an initiative definition to ensure resources are compliant with security regulations.

#### Step 3: Scope the initiative definition
- Azure Policy lets you control how your initiative definitions are applied to resources in your organization.
- You can limit the scope of an initiative definition to specific management groups, subscriptions, or resource groups.

#### Step 4: Determine compliance
- After you assign an initiative definition, you can evaluate the state of compliance for all your resources.
- Individual resources, resource groups, and subscriptions within a scope can be exempted from having the policy rules affect it.
- Exclusions are handled individually for each assignment.

### _Create policy definitions_
Azure Policy offers built-in policy definitions to help you quickly configure control conditions for your resources.

In addition to the built-in policies, you can also create your own definitions, or import definitions from other sources.

#### Access built-in policy definitions
You can sort the [list of built-in definitions](https://learn.microsoft.com/en-us/azure/governance/policy/samples/built-in-policies) by category to search for policies that meet your business needs.

Some examples of built-in policy definitions:

- **Allowed virtual machine size SKUs** - Specify a set of VM size SKUs that your organization can deploy.
- **Allowed locations** - Restrict the locations users can specify when deploying resources.
- **Configure Azure Device Update for IoT Hub accounts to disable public network access** - Disable public network access for your Device Update for IoT Hub resources. This policy is located under the Internet of Things category.

#### Add new policy definitions
If you don't find a built-in policy to meet your business needs, you can add or create a new definition.

Policy definitions can also be imported into Azure Policy from [GitHub](https://github.com/Azure/azure-policy/tree/master/samples)

New policy definitions are added to the samples repository almost daily.

> When you add or create a policy definition, be sure the definition uses the specific JSON format required by Azure.

### _Create an initiative definition_
After you determine your policy definitions, the next step is to create an initiative definition for your policies. An initiative definition has one or more policy definitions.

One example for using initiative definitions is to ensure your resources are compliant with security regulations.

> Even if you have only a few policy definitions, Microsoft recommends creating and applying an initiative definition.

#### Use a built-in initiative definition
You can create your own initiative definitions, or use built-in definitions in Azure Policy.

Sort the [list of built-in definitions](https://learn.microsoft.com/en-us/azure/governance/policy/samples/built-in-policies) by category to search for policies that meet your business needs.

Some examples of built-in policy definitions:

- **Audit machines with insecure password security settings** - Use this initiative to deploy an audit policy to specified resources in your organization. 
- **Configure Windows machines to run Azure Monitor Agent and associate them to a Data Collection Rule** - Use this initiative to monitor and secure your Windows VMs, Virtual Machine Scale Sets, and Arc machines.
- **Configure Azure Defender to be enabled on SQL servers** - nable Azure Defender on your Azure SQL Servers to detect anomalous activities indicating unusual and potentially harmful attempts to access or exploit databases. This initiative is located in the SQL category.

### _Scope the initiative definition_
After you create your initiative definition, the next step is to assign the initiative to establish the scope for the policies. 

The scope determines what resources or grouping of resources are affected by the conditions of the policies.

To establish the scope, you select the affected subscriptions. As an option, you can also choose the affected resource groups.

### _Determine compliance_
You have your policies defined, your initiative definition created, and your policies assigned to affected resources.

The last step is to evaluate the state of compliance for your scoped resources.

Your policy conditions are evaluated against your existing scoped resources. 

Although the Azure portal doesn't show the evaluation logic, the compliance state results are shown. The compliance state result is either compliant or non-compliant.


## Configure role-based access control
Learn how to use role-based access control (RBAC) to ensure resources are protected, but users can still access the resources they need.

Azure Administrators need to secure access to their Azure resources like virtual machines (VMs), websites, networks, and storage.

They need mechanisms to help them manage who can access their resources, and what actions are allowed.

### _Implement role-based access control_
Role-based access control (RBAC) is a mechanism that can help you manage who can access your Azure resources.

RBAC lets you determine what operations specific users can do on specific resources, and control what areas of a resource each user can access.

Azure RBAC is an authorization system built on Azure Resource Manager. Azure RBAC provides fine-grained access management of resources in Azure.

#### Things you can do with Azure RBAC
- Allow an application to access all resources in a resource group.
- Allow one user to manage VMs in a subscription, and allow another user to manage virtual networks.
- Allow a database administrator (DBA) group to manage SQL databases in a subscription.
- Allow a user to manage all resources in a resource group, such as VMs, websites, and subnets.

#### Azure RBAC concepts
The following table describes the core concepts of Azure RBAC.

Concept | Description | Examples
--- | --- | ---
Security principal | An object that represents something that requests access to resources | User, group, service principal, managed identity
Role definition | A set of permissions that lists the allowed operations. RBAC comes with built-in role definitions, but you can also create your own role definitions | Reader, Contributor, Owner
Scope | The boundary for the requested level of access, or "how much" access is granted. | Root, management group, subscription, resource group, resource
Assignment | An assignment attaches a role definition to a security principal at a particular scope. | Assign the Contributor role to a user scoped to a subscription

#### Things to consider when using Azure RBAC
Consider the following when thinking about implementing roles and scope assignments.

- **Consider your requestors** - Security principals are created for anything that requests access to your resources. Determine who are the requestors in your organization. This can be internal or external users, groups of users, applications and services and more.
- **Consider your roles** - Roles are commonly built around the requirements to fulfill job tasks or complete work goals. Examine the types of job responsibilities and work scenarios required.
- **Consider scope of permissions** - Think about how you can ensure security by controlling the scope of permissions for role assignments. Outline the types of permissions and levels of scope that you need to support.
- **Consider built-in or custom definitions** - Review the built-in role definitions in Azure RBAC and if you need to create custom role definitions from scratch.

### Create a role definition
A role definition consists of sets of permissions that are defined in a JSON file. 

Each permission set has a name, such as Actions or NotActions that describes the purpose of the permissions.

Some examples of permission sets include:

	- Actions permissions identify what actions are allowed.
	- NotActions permissions specify what actions aren't allowed.
	- DataActions permissions indicate how data can be changed or used.
	- AssignableScopes permissions list the scopes where a role definition can be assigned.

Example of Contributor Role:

```json
"actions": [
	"*"
],
"NotActions" : [
	"Authorization/*/Delete",
	"Authorization/*/Write",
	"Authorization/elevateAccess/Action"
],
"DataActions" : [],
	"NotDataActions": [],
	"AssignableScopes": [
	"/"
]	
```

The Actions permissions show the Contributor role has all action privileges.

The asterisk "*" wildcard means "all." 

The NotActions permissions narrow the privileges provided by the Actions set, and deny three actions:

	- Authorization/\*/Delete: Not authorized to delete or remove for "all."
	- Authorization/*/Write: Not authorized to write or change for "all."
	- Authorization/elevateAccess/Action: Not authorized to increase the level or scope of access privileges.

The Contributor role also has two DataActions permissions to specify how data can be affected:

	- "NotDataActions": []: No specific actions are listed. Therefore, all actions can affect the data.
	- "AssignableScopes": ["/"]: The role can be assigned for all scopes that affect data.

#### Things to know about role definitions
- Azure RBAC provides built-in roles and permissions sets. You can also create custom roles and permissions.
- The Owner built-in role has the highest level of access privilege in Azure.
- The system subtracts NotActions permissions from Actions permissions to determine the effective permissions for a role.
- The AssignableScopes permissions for a role can be management groups, subscriptions, resource groups, or resources.

#### Role permissions
Use the Actions and NotActions permissions together to grant and deny the exact privileges for each role.

The following table shows how the Actions or NotActions permissions used by the following built-in roles: Owner, Contributor, and Reader.

Role Name | Description | Actions permissions | NotActions permissions
--- | --- | :---: | ---
Owner | Allow all actions | * | N/A
Contributor | Allow all actions, except write or delete role assignment | * | Microsoft.Authorization/\*/Delete, Microsoft.Authorization/\*/Write, Microsoft.Authorization/elevateAccess/Action
Reader | Allow all read actions | /*/read | N/A

#### Role scopes
After you define the role permissions, you use the AssignableScopes permissions to specify how the role can be assigned.

Some examples are:

- Scope a role as available for assignment in two subscriptions:
```
"/subscriptions/c276fc76-9cd4-44c9-99a7-4fd71546436e", "/subscriptions/e91d47c4-76f3-4271-a796-21b4ecfe3624"
```	
- Scope a role as available for assignment only in the Network resource group:
```
"/subscriptions/c276fc76-9cd4-44c9-99a7-4fd71546436e/resourceGroups/Network"
```
- Scope a role as available for assignment for all requestors:
```
"/"
```

#### Things to consider when creating roles
- **Consider using built-in roles** 
- **Consider creating custom definitions**
- **Consider limiting access scope** - Assign your roles with the minimum level of scope required to perform the job duties.
- **Consider controlling changes to data** - Identify data or resources that should only be modified in specific scenarios and apply tight access control.
- **Consider applying deny assignments** - Determine if you need to implement the deny assignment feature. 

### _Create a role assignment_
A role assignment is the process of scoping a role definition to limit permissions for a requestor, such as a user, group, service principal, or managed identity.

#### Things to know about role assignments
- The purpose of a role assignment is to control access.
- The scope limits which permissions defined for a role are available for the assigned requestor.
- Access is revoked by removing a role assignment.
- A resource inherits role assignments from its parent resource.
- The effective permissions for a requestor are a combination of the permissions for the requestor's assigned roles, and the permissions for the roles assigned to the requested resources.

### _Compare Azure roles to Azure Active Directory roles_
Three types of roles are available for access management in Azure:

- Classic subscription administrator roles
- Azure role-based access control (RBAC) roles
- Azure Active Directory (Azure AD) administrator roles

In addition to Classic subscription admin roles and Azure RBAC roles, Azure AD provides built-in administrator roles to manage Azure AD resources like users, groups, and domains.

> The following table highlights differences between Azure RBAC roles and Azure AD administrator roles.


Purpose | Azure RBAC Roles | Azure AD Admin Roles
Access management | Manages access to Azure resources | Manages access to Azure AD resources
Scope assignment | Scope can be specified at multiple levels, including management groups, subscriptions, resource groups, and resources | Scope is specified at the tenant level
Role definitions | Roles can be defined via the Azure portal, the Azure CLI, Azure PowerShell, Azure Resource Manager templates, and the REST API | Roles can be defined via the Azure admin portal, Microsoft 365 admin portal, and Microsoft Graph Azure AD PowerShell

### _Apply role-based access control_
Built-in role definitions in Azure RBAC are defined for several categories of services, tasks, and users.

You can assign built-in roles at different scopes to support various scenarios, and build custom roles from the base definitions.

Azure Active Directory (Azure AD) also provides built-in roles to manage resources in Azure AD, including users, groups, and domains.

Azure AD offers [administrator roles ](https://learn.microsoft.com/en-us/azure/active-directory/roles/permissions-reference) that you can implement for your organization, such as Global admin, Application admin, and Application developer.

- **Azure AD admin roles** - used to manage resources in Azure AD, such as users, groups, and domains. 
> These roles are defined for the Azure AD tenant at the root level of the configuration.

- **Azure RBAC roles** - provide more granular access management for Azure resources. 
> These roles are defined for a requestor or resource and can be applied at multiple levels: the root, management groups, subscriptions, resource groups, or resources.

#### Review fundamental Azure RBAC roles
The following table describes four built-in Azure RBAC role definitions that are considered fundamental.

Fundamental Role	| Description
--- | ---
Owner | The Owner role has full access to all resources, including the right to delegate access to others.
Contributor | The Contributor role can create and manage all types of Azure resources. This role can't grant access to others.
Reader | The Reader role can view existing Azure resources.
User Access Administrator | The User Access Administrator role can manage user access to Azure resources.


## Create Azure users and groups in Azure Active Directory
Create users in Azure Active Directory. Understand different types of groups. Create a group and add members. Manage business-to-business guest accounts.

### _What are user accounts in Azure Active Directory?_ 
In Azure Active Directory (Azure AD), all user accounts are granted a set of default permissions.

A user's account access consists of the type of user, their role assignments, and their ownership of individual objects.

There are different types of user accounts in Azure AD. Each type has a level of access specific to the scope of work expected to be done under each type of user account.

#### Permissions and roles
Azure AD uses permissions to help you control the access rights that a user or group is granted which is done through roles.

Azure AD has many roles with different permissions attached to them. 

When a user is assigned a specific role, they inherit permissions from that role.

Understanding when to assign the correct type of role to the right user is a fundamental and crucial step in maintaining privacy and security compliance.

#### Administrator roles
Administrator roles in Azure AD allow users elevated access to control who is allowed to do what.

You assign these roles to a limited group of users to manage identity tasks in an Azure AD organization. 

You can assign administrator roles that allow a user to create or edit users, assign administrative roles to others, reset user passwords, manage user licenses, and more.

#### Member users
A member user account is a native member of the Azure AD organization that has a set of default permissions.

When someone new joins your organization, they typically have this type of account created for them.

Anyone who isn't a guest user or isn't assigned an administrator role falls into this type.

A member user is meant for users who are considered internal to an organization and are members of the Azure AD organization.

These users shouldn't be able to manage other users by, for example, creating and deleting users.

#### Guest users
Guest users have restricted Azure AD organization permissions.

When you invite someone to collaborate with your organization, you add them to your Azure AD organization as a guest user.

Guest users sign in with their own work, school, or social identities. 

By default, Azure AD member users can invite guest users. This default can be disabled by someone who has the User Administrator role.

To collaborate with your organization, these partners often need to have a certain level of access to specific resources. For this sort of situation, it's a good idea to use guest user accounts.

#### Delete user accounts
You can also delete user accounts through the Azure portal, Azure PowerShell, or the Azure CLI.

In PowerShell, run the cmdlet Remove-AzADUser. In the Azure CLI, run the cmdlet az ad user delete.

When you delete a user, the account remains in a suspended state for 30 days. During that 30-day window, the user account can be restored.

### _Manage app and resource access by using Azure Active Directory groups_ 
Azure Active Directory (Azure AD) helps you to manage your cloud-based apps, on-premises apps, and resources by using your organization's groups.

Your resources can be part of the Azure AD organization, like permissions to manage objects through roles.

Or your resources can be external to the organization, like software as a service (SaaS) apps, Azure services, SharePoint sites, and on-premises resources.

#### Access management in Azure AD
- **Azure AD roles** - Use Azure AD roles to manage Azure AD-related resources like users, groups, billing, licensing, application registration, and more.
- **Role-based access control (RBAC) for Azure resources** - Use RBAC roles to manage access to Azure resources like virtual machines, SQL databases, or storage.

#### Access rights through single user or group assignment
Azure AD helps you provide access rights to a single user or to an entire group of users.

You can assign a set of access permissions to all the members of the group.

Access permissions range from full access to the ability to create or remove resources.

There are different ways you can assign access rights:

- **Direct assignment** - Assign a user the required access rights by directly assigning a role that has those access rights.
- **Group assignment** - Assign a group the required access rights, and members of the group will inherit those rights.
- **Rule-based assignment** - Use rules to determine a group membership based on user or device properties. The rules can be simple. You can select prewritten rules or write your own advanced rules.

### _Collaborate by using guest accounts and Azure Active Directory B2B_
If your organization has multiple Azure AD tenants, you may also want to use Azure AD B2B. This allows you o give a user in tenant access to resources in tenant.

Each Azure AD tenant is distinct and separate from other Azure AD tenants and has its own representation of identities and app registrations.

#### Guest user access in Azure AD B2B
In any scenario where external users need temporary or restricted access to your organization's resources, give them guest user access.

You can grant guest user access with the appropriate restrictions in place. Then remove access when the work is done.

You can use the Azure portal to invite B2B collaboration users. Invite guest users to the Azure AD organization, group, or application.

> After you invite a user, their account is added to Azure AD as a guest account.

The guest can get the invitation through email. Or you can share the invitation to an application by using a direct link. 

By default, users and administrators in Azure AD can invite guest users. But this ability can be limited or disabled by the Global Administrator.

#### Collaborate with any partner by using their identities
With Azure Active Directory B2B, you don't have to manage your external users' identities. The partner has the responsibility to manage its own identities.

External users continue to use their current identities to collaborate with your organization.

#### Why use Azure AD B2B instead of federation?
With Azure AD B2B, you don't take on the responsibility of managing and authenticating the credentials and identities of partners. Your partners can collaborate with you even if they don't have an IT department.

Federation is more complex than B2B for giving access to external users. Federation is where you have a trust established with another organization, or a collection of domains, for shared access to a set of resources.

You might be using an on-premises identity provider and authorization service like Active Directory Federation Services (AD FS) that has an established trust with Azure AD.

To get access to resources, all users have to provide their credentials and successfully authenticate against the AD FS server.

If you have someone trying to authenticate outside the internal network, you need to set up a web application proxy.

An on-premises federation with Azure AD might be good if your organization wants all authentication to Azure resources to happen in the local environment. 

But this means that, if your local environment is down, users can't access the Azure resources and services they need.

With a B2B collaboration, external teams get the required access to Azure resources and services with the appropriate permissions. There's no need for a federation and trust to be established, and authentication doesn't depend on an on-premises server. Authentication is instead done directly through Azure.


## Secure your Azure resources with Azure role-based access control (Azure RBAC)
Learn how to use Azure RBAC to manage access to resources in Azure.

Learning objectives:

* Verify access to resources for yourself and others.
* Grant access to resources.
* View activity logs of Azure RBAC changes.

Securing your Azure resources, such as virtual machines, websites, networks, and storage, is a critical function for any organization using the cloud. 

Azure role-based access control (Azure RBAC) is an authorization system in Azure that helps you manage who has access to Azure resources, what they can do with those resources, and where they have access.

### _What is Azure RBAC?_
Azure Active Directory (Azure AD) and Azure role-based access control (Azure RBAC) work together to make it simple to carry out these goals.

#### Azure subscriptions
Each Azure subscription is associated with a single Azure AD directory.

Users, groups, and applications in that directory can manage resources in the Azure subscription.

The subscriptions use Azure AD for single sign-on (SSO) and access management.

#### What's Azure RBAC?
Azure role-based access control (Azure RBAC) is an authorization system built on Azure Resource Manager that provides fine-grained access management of resources in Azure.

With Azure RBAC, you can grant the exact access that users need to do their jobs.

You can use Azure RBAC to let one employee manage virtual machines in a subscription while another manages SQL databases within the same subscription.

You can grant access by assigning the appropriate Azure role to users, groups, and applications at a certain scope. 

The scope of a role assignment can be a management group, subscription, a resource group, or a single resource.

> A role assigned at a parent scope also grants access to the child scopes contained within it.

The Azure role that you assign dictates what resources the user, group, or application can manage within that scope.

#### What can I do with Azure RBAC?
Azure RBAC allows you to grant access to Azure resources that you control.

Here are some scenarios you can implement with Azure RBAC:

* **Allow one user to manage virtual machines in a subscription and another user to manage virtual networks**
* **Allow a database administrator group to manage SQL databases in a subscription**
* **Allow a user to manage all resources in a resource group, such as virtual machines, websites, and subnets**
* **Allow an application to access all resources in a resource group**

#### How does Azure RBAC work?
You can control access to resources using Azure RBAC by creating role assignments, which control how permissions are enforced.

To create a role assignment, you need three elements: a security principal, a role definition, and a scope.

You can think of these elements as "who", "what", and "where".

**_Security principal (who)_**
A security principal is just a fancy name for a user, group, or application to which you want to grant access.

**_Role definition (what you can do)_**
A role definition is a collection of permissions.

A role definition lists the permissions that can be performed, such as read, write, and delete.

The four funadmental built-in roles are: Owner, Contributor, Reader, User Access Administrator

**_Scope (where)_**
Scope is to where the access applies. This is helpful if you want to make someone a Contributor for a single resource group.

In Azure, you can specify a scope at multiple levels: management group, subscription, resource group, or resource.

Scopes are structured in a parent-child relationship. When you grant access at a parent scope, those permissions are inherited by the child scopes.

**_Role Assignment_**
Once you have determined the who, what, and where, you can combine those elements to grant access.

A role assignment is the process of binding a role to a security principal at a particular scope for the purpose of granting access.

#### Azure RBAC is an allow model
Azure RBAC is an allow model.

This means that when you're assigned a role, Azure RBAC allows you to perform certain actions, such as read, write, or delete.

If one role assignment grants you read permissions to a resource group and a different role assignment grants you write permissions to the same resource group, you will have read and write permissions on that resource group.

Azure RBAC has something called _NotActions_ permissions. You can use _NotActions_ to create a set of not allowed permissions.

The access granted by a role, the effective permissions, is computed by subtracting the _NotActions_ operations from the _Actions_ operations.

A wildcard (*) in Actions indicates that it can perform all operations on the control plane.


## Allow users to reset their password with Azure Active Directory self-service password reset
Evaluate self-service password reset to allow users in your organization to reset their passwords or unlock their accounts. 

Set up, configure, and test self-service password reset.

### _What is self-service password reset in Azure Active Directory?_
In this unit, you'll learn how self-service password reset (SSPR) works in Azure Active Directory (Azure AD).

#### Why use SSPR?
In Azure AD, any user can change their password if they're already signed in. If they're not signed in and forgot their password or it's expired, they'll need to reset their password.

With SSPR, users can reset their passwords in a web browser or from a Windows sign-in screen to regain access to Azure, Microsoft 365, and any other application that uses Azure AD for authentication.

SSPR reduces the load on administrators, because users can fix password problems themselves, without having to call the help desk.

#### How SSPR works
The user initiates a password reset either by going directly to the password reset portal or by selecting the Can't access your account link on a sign-in page.

The reset portal takes these steps:

1. **Localization** - The portal checks the browser's locale setting and renders the SSPR page in the appropriate language.
2. **Verification** - The user enters their username and passes a captcha to ensure that it's a user and not a bot.
3. **Authentication** - The user enters the required data to authenticate their identity. For example, security code or question
4. **Password Reset** - If the user passes the authentication tests, they can enter a new password and confirm it.
5. **Notifications** - A message is sent to the user to confirm the reset.

There are several ways you can customize the SSPR user experience such as adding your company logo to the sign-in page.

#### Authenticate a password reset
It's critical to verify the identity of a user before you allow a password reset.

Azure supports six different ways to authenticate reset requests.

The methods available are:

Authentication Method | How to register	| How to authenticate for a password reset
--- | --- | ---
Mobile app notification | Install the Microsoft Authenticator app and register it on the multifactor authentication setup page. | Azure sends a notification to the app, which you can either verify or deny.
Mobile app code | This method also uses the Authenticator app, and you install and register it in the same way. | Enter the code from the app.
Email | Provide an email address that's external to Azure and Microsoft 365. | Azure sends a code to the address, which you enter in the reset wizard.
Mobile phone | Provide a mobile phone number | Azure sends a code to the phone in an SMS message. Or you can choose to get an automated call
Office phone	| Provide a nonmobile phone number | You receive an automated call to this number and press #
Security questions | Select questions such as "In what city was your mother born?" and save responses to them. | Answer security questions.

#### Require the minimum number of authentication methods
You can specify the minimum number of methods that the user must set up: one or two for authentication.

Then users can choose the two methods they prefer, like mobile app code and email.

For the security question method, you can specify a minimum number of questions a user must set up. You can also specify minimum required correct answers.

After your users register the required information for the minimum number of methods you've specified, they're considered registered for SSPR.

#### Recommendations
- **Enable two or more of the authentication reset request methods.**
- **Use the mobile app notification or code as the primary method, but also enable the email or office phone**
- **DON't use the mobile phone method as it's possible to send fraudulent SMS messages.**
- **DON'T use the security question option because the answers to the security questions might be known to other people. Only use in comibination with another method**

#### Accounts associated with administrator roles
- A strong, two-method authentication policy is always applied to accounts with an administrator role
- The security questions method isn't available to accounts that are associated with an administrator role.

#### Configure notifications
Administrators can choose how users are notified of password changes. 

- **Notify users on password resets** - The user who resets their own password is notified to their primary and secondary email addresses.
- **Notify all admins when other admins reset their password** - All administrators are notified when another administrator resets their password.

#### License requirements
The editions of Azure AD are free, Premium P1, and Premium P2. The password reset functionality you can use depends on your edition.

Any user who is signed in can change their password, regardless of the edition of Azure AD.

You can use SSPR in Azure AD Premium P1 or P2. It's also available with Microsoft 365 Apps for business or Microsoft 365.

In a hybrid situation, where you have Active Directory on-premises and Azure AD in the cloud, any password change in the cloud must be written back to the on-premises directory.

This writeback support is available in Azure AD Premium P1 or P2. It's also available with Microsoft 365 Apps for business.

#### SSPR deployment options
You can deploy SSPR with password writeback by using [Azure AD Connect](https://learn.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-sspr-writeback) or [cloud sync](https://learn.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-cloud-sync-sspr-writeback), depending on the needs of users. 

Each option can be deployed side-by-side in different domains to target different sets of users.

This helps existing users on-premises to writeback password changes while adding an option for users in disconnected domains because of a company merger or split.

Users from an existing on-premises domain can use Azure AD Connect while new users from a merger can use cloud sync in another domain.

Cloud sync can also provide higher availability because it doesn't rely on a single instance of Azure AD Connect.


### _Implement Azure AD self-service password reset_
In this unit, you'll learn how to enable SSPR in Azure AD.

#### Prerequisites
Before you start to configure SSPR, you need these things in place:

* An Azure AD organization. (This organization must have at least a trial license enabled)
* An Azure AD account with Global Administrator privileges to set up SSPR.
* A non-administrative user account to test SSPR.
* A security group to test the configuration with. (The non-administrative user account must be a member of this group)

#### Scope of SSPR rollout
There are three settings for the Self-service password reset enabled property:

- **Disabled** - No users in the Azure AD organization can use SSPR. (This value is the default)
- **Enabled** - All users in the Azure AD organization can use SSPR.
- **Selected** - Only the members of the specified security group can use SSPR. You can use this option to enable SSPR for a targeted group of users.

#### Configure SSPR
Here are the high-level steps to configure SSPR.

1. Go to the [Azure portal](https://portal.azure.com/), go to Active Directory > Password reset.

2. Under Properties, Enable SSPR.

You can enable it for all users in the Azure AD organization or for selected users.

To enable for selected users, you must specify the security group.

3. Authentication methods:

Choose whether to require one or two authentication methods.

Choose the authentication methods that the users can use.

4. Registration:

Specify whether users are required to register for SSPR when they next sign in.

Specify how often users are asked to reconfirm their authentication information.

5. Notifications: Choose whether to notify users and administrators of password resets.

6. Customization: Provide an email address or web page URL where your users can get help.

