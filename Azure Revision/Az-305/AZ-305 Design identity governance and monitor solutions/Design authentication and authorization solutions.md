# _Design authentication and authorization solutions_
Azure Architects design and recommend authentication and authorization solutions.

Learning objectives:

* Design for identity and access management.
* Design for Microsoft Entra ID.
* Design for Microsoft Entra business-to-business (B2B).
* Design for Azure Active Directory B2C (business-to-customer).
* Design for conditional access.
* Design for identity protection.
* Design for access reviews.
* Design for managed identities.
* Design for service principals for applications.
* Design for Azure Key Vault.

Authentication technologies are used to control who can access a system. 

When a process or user tries to access a system, the authentication scheme identifies if the requesting process or user is recognized by the system. 

When a user or process is allowed access, they're referred to as authenticated. 

Authentication helps to protect unwanted access to a system by allowing access only to users or processes that are authenticated.

Authorization mechanisms provide a more granular level of access control by guarding access to specific resources. 

When an authenticated process or user tries to access a particular resource, the authorization scheme verifies if the user or process has been granted permission to access the requested resource. 

Authorization also considers the type of access requested, such as read-only, write, or administrate.

Authentication and authorization work together to help you manage your corporate identities, and ensure strong protection for your organization. 

With these technologies, you can:

* Control access to your organization and corporate resources.
* Store corporate passwords and secrets in a secure manner.
* Integrate your identity solution for users and applications into Microsoft Entra ID.


## Design for identity and access management (IAM)
To implement authentication and authorization, Azure Architects design identity and access management (IAM) solutions. 

These solutions must work for all users, applications, and devices. 

A strong IAM solution should have unified identity management, secure adaptive access, simplified identity governance, and a seamless user experience.

### Things to know about IAM
As you look at your authentication and authorization options, consider these characteristics of a strong IAM solution:

* Unified identity management. 
	* Manage all your identities and access to all your applications in a central location, whether they’re in the cloud or on-premises, to improve visibility and control.

* Seamless user experience. 
	* Provide an easy, fast sign-in experience to keep your users productive, reduce time spent managing passwords, and increase end-user productivity.

* Secure adaptive access. 
	* Protect access to resources and data by using strong authentication and risk-based adaptive access policies without compromising the user experience.

* Simplified identity governance. 
	* Control access to applications and data for all users and admins. 
	* Automated identity governance ensures only authorized users have access.

### Things to consider when using IAM
The following table lists three basic choices for IAM solution:

* Consider using Microsoft Entra ID. 
	* Develop with Microsoft Entra ID for a solution that combines core directory services, application access management, and identity protection.
	* Microsoft Entra ID provides an identity and access management system that can operate in a cloud or hybrid environment.

* Consider your business-to-business (B2B) requirements. 
	* Support collaboration for guest users and external business partners such as suppliers and vendors. 
	* Build your solution with [Microsoft Entra B2B (business-to-business)](https://learn.microsoft.com/en-us/azure/active-directory/external-identities/compare-with-b2c) to support business-to-business operations.

* Consider your business-to-customer scenarios. 
	* Control how customers sign up, sign in, and manage their profiles when they use your apps. 
	* Use [Azure AD B2C (business-to-customer)](https://learn.microsoft.com/en-us/azure/active-directory-b2c/overview) to develop a Microsoft Entra solution that supports customer-focused operations.



## Design for Microsoft Entra ID
[Microsoft Entra ID](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-whatis) is the Azure solution for identity and access management. 

Microsoft Entra ID is a multitenant, cloud-based directory, and identity management service. 

It combines core directory services, application access management, and identity protection into a single solution.

Microsoft Entra ID can be used in cloud or hybrid environments.

### Things to know about Microsoft Entra identity management
Consider the following characteristics of Microsoft Entra ID:

* You can implement Microsoft Entra ID as a cloud-only identity solution for all your employee user accounts.
* The cloud-only identity solution provides both identity management and protection for your accounts, including role-based access control (RBAC), conditional access, and access reviews. We examine these features later in this module.
* Microsoft Entra ID also offers a hybrid identity solution for identity management in hybrid environments.
* In hybrid environments, Microsoft Entra ID extends on-premises Active Directory to the cloud.
* With Microsoft Entra Connect or Microsoft Entra Connect cloud sync, you can bring on-premises identities into Microsoft Entra ID. After the on-premises accounts are in Microsoft Entra ID, they'll get the benefits of easy management and identity protection.

### Things to consider when using Microsoft Entra identity management
There are several considerations to review as you work on the configuration of Entra ID.

* Consider benefits of centralized identity management. 
	* Integrate your on-premises and cloud directories when you're working in a hybrid identity scenario. 
	* Integration enables IT team to manage accounts from one location, whenever an account is created. 
	* Centralized integration also helps your users be more productive by providing a common identity for accessing both cloud and on-premises resources.

* Consider using a single Microsoft Entra instance. 
	* Use a single authoritative source and consistency to increase clarity and reduce security risks from human errors and configuration complexity. 
	* Designate a single Microsoft Entra directory as the authoritative source for corporate and organizational accounts.

* Consider limiting account synchronization. 
	* Don't synchronize accounts to Active Directory that have high privileges in your existing Microsoft Entra instance. 
	* By default, Microsoft Entra Connect filters out these high privileged accounts. 
	* This configuration mitigates the risk of adversaries pivoting from cloud to on-premises assets (which could result in a major incident).

* Consider password hash synchronization. 
	* Enable [password hash synchronization](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/whatis-phs) to sync user password hashes from an on-premises Microsoft Entra instance to a cloud-based Microsoft Entra instance. 
	* This sync helps to protect against leaked credentials being replayed from previous sign-ins.

* Consider single sign-on (SSO). 
	* Enable SSO to reduce the need for multiple passwords. 
	* Multiple passwords increase the likelihood of users reusing passwords or using weak passwords. 
	* With SSO, users provide their primary work or school account for their domain-joined devices and company resources. 
	* Their application access can be automatically provisioned (or deprovisioned) based on their organization group memberships and their status as an employee.

* Consider overhead of managing separate identities. 
	* Calculate the overhead of not integrating the on-premises identity with their cloud identity. 
	* Separate identities can result in extra account management. 
	* This overhead increases the likelihood of mistakes and security breaches.



## Design for Microsoft Entra business-to-business (B2B)
Every organization needs to work with external users. 

[Microsoft Entra business-to-business (B2B)](https://learn.microsoft.com/en-us/azure/active-directory/external-identities/what-is-b2b) is a feature of Microsoft Entra ID that enables you to securely collaborate with external partners. 

Your partner users are invited as guest users. You remain in control of what they have access to, and for how long.

### Things to know about Microsoft Entra B2B
Let's explore how the Microsoft Entra B2B features can support external users in a business-to-business solution.

* With Microsoft Entra B2B, the external partner uses their own identity management solution. Microsoft Entra ID isn't required.
* External users use their identities to collaborate with the organization. The identities are managed by the partner themselves, or by another external identity provider on their behalf.
* Guest users sign in to the services with their own work, school, or social identities.
* Microsoft Entra B2B makes it possible for collaboration with external partner users.

### Things to consider when using Microsoft Entra B2B
Here are some options about Microsoft Entra B2B to keep in mind.

* Consider designating an app owner to manage guest users.
	* Delegate guest user access to app owners because the owners know best who should be given access to their apps.

* Consider conditional access policies to control access. 
	* Define conditional access policies to intelligently grant or deny access to users. 
	* Conditional access policies use factors that aren't credential-based. 
	* You might make it mandatory for users to be on specific device platforms like Android or Windows.
	* You might block users from accessing the organisation if they don't meet the required location criteria.

* Consider the benefits of using MFA. 
	* Set conditional access policies to require an [MFA process](https://learn.microsoft.com/en-us/azure/active-directory/authentication/concept-mfa-howitworks), before the user can access organisation apps. 
	* This action ensures that all users who access an app must pass an extra authentication challenge before accessing the app.

* Consider integration with identity providers.
	* Integrate with identity providers so external users can sign in by using an existing account.
	* Microsoft Entra ID supports external identity providers like Facebook, Microsoft accounts, Google, or enterprise identity providers. 
	* You can set up federation with identity providers so external users can use their existing social or enterprise account. 
	* External users won't have to create a new account just to access your organisations apps.

* Consider self-service sign-up user flow. 
	* Create a self-service sign-up user flow for external users who want to access your apps. 
	* As part of the sign-up flow, you can provide options for different social or enterprise identity providers, and collect information about the user. 
	* You can also customize the onboarding experience for B2B guest users.



## Design for Azure Active Directory B2C (business-to-customer)
Azure AD B2C is a type of Microsoft Entra tenant for managing customer identities and their access to your apps. 

Azure AD B2C requires a Microsoft Entra tenant, but this tenant isn't the same as the Microsoft Entra tenant for your organization.

* **The Microsoft Entra tenant** represents your organization.
* The **Azure AD B2C tenant** represents the identities for your customer apps.

After you set up your Azure AD B2C tenant, you must register your app. 

You use user flows to manage things like user sign-ins and sign-ups. 

Your Azure AD B2C tenant lets you create multiple types of user flows.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-authentication-authorization-solutions/media/application-registration.png)

### Things to know about Azure AD B2C
Below are some customer features offered by Azure AD B2C.

* Azure AD B2C provides secure authentication for your customers by using their preferred identity providers.
* You can capture sign in, preference, and conversion data for your customers.
* Azure AD B2C stores custom attributes about customers so you can use the information in your apps.
* You can use branded registration and custom UI sign-in experiences.
* The B2C option lets you separate the organization account from the customer account.

### Things to consider when using Azure AD B2C
Review the following points about using the Azure AD B2C solution.

* Consider reusable flows for user journeys. 
	* A user journey is the path that you want people to take in your app to achieve their goal. 
	* A user might want to make a new account, update their profile, or frequently check for other users. 
	* Azure AD B2C comes with preconfigured policies called user flows. 
	* You can reuse the same user flows across different apps. Reusing user flows creates a consistent user journey across all apps.

* Consider allowing users to sign in with their social identities. 
	* Support identity providers to enable Tailwind Traders users to sign in with their existing social or enterprise accounts. 
	* There's a long list of identity providers and more are being added. 
	* Social providers include Amazon, Microsoft Entra ID, Facebook, LinkedIn, Twitter, and Microsoft accounts.

* Consider a customizable user interface to support branding. 
	* Customize the pages in your user flow. 
	* Write your own HTML and CSS or use built-in templates called page layout templates.

* Consider integration with external user stores. 
	* Azure AD B2C provides a directory that can hold 100 custom attributes per user. 
	* However, integration with external systems is also an option. 
	* You can use Azure AD B2C for authentication, but delegate to an external customer relationship management (CRM) or customer loyalty database as the source of truth for customer data.

* Consider third-party identity verification and proofing. 
	* Use Azure AD B2C to facilitate identity verification and proofing by collecting user data. 
	* Pass the data to a third-party system to perform validation, trust scoring, and approval for user account creation.


### Compare B2B to B2C identity solutions
The below table compares the options for using Microsoft Entra B2B (business-to-business) and Azure AD B2C (business-to-customer).

 | Microsoft Entra B2B (business-to-business) | Azure AD B2C (business-to-customer)
 --- | --- | ---
 Define your focus | collaborate with business partners from external organizations like suppliers, partners, and vendors. <br /> You'll support users as guest users in your directory, and they might or might not have managed IT. | Engage with customers of your products. You'll manage users in a separate Microsoft Entra directory / tenant.
 Identify your users | Your users will represent a partner company, or be employees of the company. | Your users will be customers who represent themselves.
 Manage user profiles | Manage partner user profiles through access reviews, email verification, or access and blocklists. | Customer users will manage their own profiles.
 Store user information	 | You'll manage external users in the same directory as existing employees but the external users will typically be annotated as guest users. | You'll manage external users in the Azure AD B2C directory.
 Enable user discovery and support privacy | Partner users will be discoverable and they can find other users from their organization. | Customer users will be invisible to other users. Privacy and content will be enforced.
 Work with identity providers | External users will collaborate by using work accounts, school accounts, any email address, SAML and WS-Fed based identity providers, Gmail, and Facebook. | Consumer users with local app accounts (any email address or user name), various supported social identities, and users with corporate and government-issued identities via SAML/WS-Fed based identity provider federation will access the apps.
 Customize UI and support branding | You expect to use customized UI branding for the host or inviting organization. | You want the branding to be fully customizable per app or organization and not specific to the organisation.



## Design for conditional access
[Conditional Access](https://learn.microsoft.com/en-us/azure/active-directory/conditional-access/overview) is a tool that Microsoft Entra ID uses to allow (or deny) access to resources. 

When a user signs in, Conditional Access examines who the user is, where the user is, and from what device the user is requesting access. 

Based on these signals, Conditional Access can allow access, enforce multifactor authentication (MFA), or deny access.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-authentication-authorization-solutions/media/conditions-actions.png)

### Things to know about Conditional Access
Review the below characteristics of Conditional Access.

* MFA supports granular control. You can use MFA selectively and require it for certain users only.
* Microsoft Entra ID allows named locations to be used with app policies to control access.
* Service access can be restricted through approved client apps only.
* Access to apps can be limited to [managed devices](https://learn.microsoft.com/en-us/azure/active-directory/conditional-access/concept-condition-filters-for-devices) that meet your security and compliance standards.
* Untrusted sources can be blocked, such as sources from an unknown or unexpected location.
* [Report-only mode](https://learn.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-report-only) helps admins evaluate the impact of Conditional Access policies before enabling them in their environment.
* The [What If](https://learn.microsoft.com/en-us/azure/active-directory/conditional-access/what-if-tool) tool helps you plan and troubleshoot Conditional Access policies.

> To use Conditional Access, you need a Microsoft Entra ID P1 or P2 license.
> If you have a Microsoft 365 Business Premium license, you also have access to Conditional Access features.

### Things to consider when using Conditional Access
Review the following scenarios to determine the best options for your use of the Conditional Access tool.

* Consider MFA for more granular control. 
	* Implement selective MFA and provide a more granular experience for users. 
	* If a user is from a known location, you might not require extra authentication.
	* For users from unknown or unexpected locations, you can challenge them to supply the second authentication factor.

* Consider preventing access from specific geographic areas. 
	* Exclude geographic areas that you don't expect to interact with. 
	* Use Microsoft Entra ID to create named locations for the geographic areas. 
	* Create a policy for all apps to block sign-in attempts from the named locations (be sure to exempt your admins from this policy!).

* Consider access only from managed devices. 
	* Supporting access to the cloud resources from a proliferation of devices can help user productivity. 
	* Protect the environment by restricting devices with an unknown protection level to access only certain resources. 
	* Require user access from only managed devices that meet standards for security and compliance.

* Consider access only from approved client apps. 
	* Protect corporate data by enabling access to services through approved client apps only. 
	* Employees use their mobile devices for both personal and work tasks. 
	* You must decide whether to manage the entire device or just the data on it. 
	* If you manage only the data and access, you can require access from only approved cloud apps.

* Consider using policies to handle compromised accounts. 
	* Enable one or more default policies to handle compromised accounts:
	* *Require all users to register for MFA.*
	* *Require a password change for users who are high-risk.*
	* *Require MFA for users with medium or high sign-in risk.*

* Consider blocking access. 
	* Block access to override all other assignments for a user. 
	* You can block your entire organization from signing on to your tenant. 
	* Blocking can be helpful when you're migrating an app to Microsoft Entra ID, but you aren't ready for anyone to sign-in yet. 
	* You can also block certain network locations from accessing your cloud apps, or block apps that use legacy authentication from accessing your tenant resources.

* Consider blocking legacy authentication protocols. 
	* Attackers exploit weaknesses in older protocols every day, particularly for password spray attacks. 
	* Configure Conditional Access to block legacy protocols from accessing Tailwind Traders apps.

* Consider running Report-only mode. 
	* Run Report-only mode to predict the number and names of users who will be affected by common deployment initiatives. 
	* Use Report-only mode to test blocking legacy authentication, requiring MFA, and implementing sign-in risk policies.

* Consider using the What If tool. 
	* Use the What If tool to test your proposed Conditional Access policies before you implement them.



## Design for identity protection
[Identity Protection](https://learn.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection) is a tool that allows organizations to accomplish three key tasks:

* [Automate the detection and remediation of identity-based risks](https://learn.microsoft.com/en-us/azure/active-directory/identity-protection/howto-identity-protection-configure-risk-policies).
* [Investigate risks](https://learn.microsoft.com/en-us/azure/active-directory/identity-protection/howto-identity-protection-investigate-risk) by using data in the Azure portal.
* [Export risk detection data](https://learn.microsoft.com/en-us/azure/sentinel/connect-azure-ad-identity-protection) to other tools.

The signals that are generated by and also fed into Identity Protection can be exported to other tools. 

You learned how the Conditional Access tool can make decisions based on your organization's policies. 

By using Identity Protection, you can pass this information to a security information and event management (SIEM) tool for more investigation.

The following example shows what happens when a user attempts to sign in to Microsoft Entra ID. 

Microsoft Entra ID calculates the real-time sign-in risk based on the sign-in properties. 

Identity Protection then aggregates the user's risk. 

If the risk level meets the Identity Protection policy threshold, the user can be blocked or challenged by MFA. 

If the user risk level is acceptable, they're granted access.


### Things to know about Identity Protection
Consider the following characteristics of Identity Protection:

* Identity Protection provides risk policy detection that includes any identified suspicious actions related to user accounts in the directory.
* Two risk policies are evaluated: user risk and sign-in risk:

* [User risk](https://learn.microsoft.com/en-us/azure/active-directory/identity-protection/concept-identity-protection-risks) represents the probability that a given identity or account is compromised. 
	* An example is when a user's valid credentials are leaked. 
	* User risks are calculated offline by using Microsoft's internal and external threat intelligence sources. 

Here are some user risks that can be identified:

* **Leaked credentials:** 
	* Microsoft checks for leaked credentials from the dark web, paste sites, or other sources. 
	* These leaked credentials are checked against Microsoft Entra users' current valid credentials for valid matches.
* **Microsoft Entra threat intelligence:** 
	* This risk detection type indicates user activity that's unusual for the given user or is consistent with known attack patterns.

* [Sign-in risk](https://learn.microsoft.com/en-us/azure/active-directory/identity-protection/concept-identity-protection-risks) represents the probability that a given sign-in (authentication request) isn't authorized by the identity owner.
	* Sign-in risk can be calculated in real time or offline. 

Here are some sign-in risks that can be identified:

* Anonymous IP address: 
	* A sign-in attempt from an anonymous IP address like a Tor browser or an anonymized VPN.
* Atypical travel: 
	* Two sign-ins from the same user that originate from a geographically distant location. 
	* Given past behavior, at least one of the locations might also be atypical for the user.
* Malware-linked IP address: 
	* A sign-in from an IP address that's infected with malware and the malware is known to actively communicate with a bot server.
* Password spray:
	* A password spray attack where a bad actor tries to defeat lockout and detection by attempting sign-in with different user names and the same password.


### Things to consider when using Identity Protection
Review these options that can enhance your strategy.

* Consider "High" threshold for user risk policy. 
	* Set the risk policy level for your users to "High." 
	* A high setting can detect for leaked credentials and unusual activity for a user, and check for known attack patterns. 
	* By setting the policy threshold to "high," you can spread a wide net to prevent attacks that target user credentials.

* Consider "Medium and above" threshold for sign-in risk policy. 
	* Configure the risk policy level for sign-in attempts to apps to "Medium and above." 
	* This setting supports the Identity Protection self-remediation options. 
	* Self-remediation, like password changes and MFA, have less impact than blocking users.

* Consider investigating risks in the Azure portal. 
	* Investigate Tailwind Traders risk events in the Azure portal and identify any weak areas in your security implementation. 
	* Download the risk events in .CSV format and view the output in the Security section of Microsoft Entra ID. 
	* Use the Microsoft Graph API integrations to aggregate your data with other sources.

* Consider exporting your risk detection data. 
	* Export the risk detection data by using the Microsoft Sentinel data connector for Identity Protection.



## Design for access reviews
An employee of a company might work in several different roles during their tenure. 

Each position they hold can require access to different resources or have varying levels of permissions requirements. 

When an employee is first hired, they need initial access to corporate resources and apps. 

For each position they hold, they can have specific access requirements and privileges. When the employee leaves the company, their access is removed.

To ensure employees and users always have the correct access, you can perform an access review. 

An [Microsoft Entra access review](https://learn.microsoft.com/en-us/azure/active-directory/governance/access-reviews-overview) is a planned review of the access needs, rights, and history of user access.


### Things to know to determine the purpose of the Microsoft Entra access review
Think about the following characteristics of an access review.

* Access reviews mitigate risk by protecting, monitoring, and auditing access to critical assets.
* You use access reviews to help ensure the correct users have the correct access to the correct resources.
* Confirm correct user access to apps integrated with Microsoft Entra ID for single sign-on, including SaaS apps and line-of-business apps.
* Verify group memberships that are synchronized to Microsoft Entra ID, or created in Microsoft Entra ID or Microsoft 365, including Microsoft Teams.
* Check access packages that group resources (groups, apps, and sites) into a single package to manage access.
* Access reviews can also be used for Microsoft Entra roles and Azure Resource roles as defined in Privileged Identity Management (PIM).

### Determine who will conduct the access reviews
Access reviews are only as good as the person doing the reviewing. 

Selecting good reviewers is critical to your success. 

The creator of the access review decides who will conduct the review. 

This setting can't be changed after the review is started. There are three types of reviewers:

* Resource owners: The business owners of a resource.
* Delegates: A group of individuals selected by the access reviews admin.
* End user: A user who self-attests to their need for continued access.

When you create an access review, admins can choose one or more reviewers.

All reviewers can start and carry out a review, and choose to grant the user continued access to a resource or remove their access.

### Things to consider when creating an access review plan
Review the following implementation scenario of an access review plan for Microsoft Dynamics resources.

Access review component | Implementation
--- | ---
What are the resources to review | Microsoft Dynamics resources
How often should the access review be done | Once a month
Who are the reviewers | Dynamics business group program managers
How will reviewers be notified | 24 hours before the start of the review, send email to the alias `Dynamics-PMs@tailwind-traders.org`.
How long should the review take to complete | At most, 24 hours, which is 48 hours after the reviewers are first notified.
Are there automatic actions for these resources | Yes. Automatic actions include: <br /> - Remove access for any user account that has had no interactive sign-in within 90 days. <br /> - Remove users from the security group `dynamics-access`. <br /> - Perform access review actions for any user accounts that aren't reviewed within the specified time to complete.
Are there manual actions available to the reviewers | Yes. Reviewers can approve user account removals before the automated action is completed, as desired.
How will affected users be notified | Send email to internal (member) users who are removed, explain their removal, and how they can regain access.



## Design service principals for applications
When a user or application requests access to a resource that's secured by a Microsoft Entra tenant, the user or app must be represented by a security principal. 

The security principal defines the access policy and permissions for the user (user principal) or app (service principal) in the Microsoft Entra tenant. 

The principal supports core features like authentication for a user and app during sign-in, or authorization during resource access.

There are two ways an app can be represented in Microsoft Entra ID: as an application object, or by a service principal.

* Application objects: 
	* Although there are exceptions, an app object can be considered the definition for an app. 
	* An app object allows the service to know how to issue tokens to the app based on the object settings. 
	* The app object exists only in its home directory, even if it's a multi-tenant app that supports service principals in other directories.

* Service principals: 
	* The service principal for an app can be considered an instance of an app. 
	* Service principals generally reference an app object. 
	* One app object can be referenced by multiple service principals across directories.

Service principals are what govern the app connection to Microsoft Entra ID and can be considered the instance of the app in your directory.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-authentication-authorization-solutions/media/application-service-principals.png)

### Types of service principals
There are three types of service principals that you can use for your organization: **application, managed identity, and legacy**.

* **Application:** 
	* An application service principal is a local representation, or app instance, of a global app object in a single tenant or directory. 
	* This service principal is a concrete instance created from the app object that inherits certain properties from the object. 
	* The principal is created in each tenant where the app is used, and references the globally unique object. 
	* The service principal object defines what the app can do in the specific tenant, who can access the app, and what resources the app can access.

* While an app object is the global representation of your app for use across all tenants, the application service principal is the local representation that's used in a specific tenant. 
* The app object serves as the template from which common and default properties are derived for use in creating corresponding service principal objects.

* **Managed identity:** 
	* This type of service principal represents a managed identity, which eliminates the need to manage credentials. 
	* Managed identities provide an identity for applications to use when connecting to resources that support Microsoft Entra authentication. 
	* When a managed identity is enabled, the service principal that represents that managed identity is created in your tenant.

* Common terms for managed identities and service principals:
	* Client ID: The unique ID that's linked to the app and service principal created when you provisioned the identity.
	* Object ID: The service principal object of the managed identity.
	* Azure Instance Metadata Service: The REST API that's enabled when Azure Resource Manager creates a VM. The endpoint is accessible only from within the VM.

* **Legacy:** 
	* A legacy service principal represents a legacy app that was created before app registrations were introduced, or an app created through a legacy configuration experience. 
	* A legacy service principal can have credentials, service principal names, reply URLs, and other properties that an authorized user can edit. 
	* A legacy service principal doesn't have an associated app registration.


### Things to know about application objects and service principals
Consider these characteristics of app objects and service principals:

* An app can have at most one app object, which is registered in a "home" directory.
* An app can have one or more service principal objects that represent instances of the app in every directory in which it acts.
* An app object has a `1:1` relationship with the software app, and a `1:many` relationship with its service principal object(s).
* A service principal must be created in each tenant where the app is used, to establish an identity for sign-in and access to resources secured by the tenant.
* A single-tenant app has only one service principal (in its home tenant) that's created and consented for use during app registration. A multi-tenant app also has a service principal created in each tenant where a user from that tenant has consented to its use.
* Managed identity service principals can be granted access and permissions, but they can't be updated or modified directly.
* Legacy service principals can only be used in the tenant where they're created.


### Things to consider when using service principals
Review the following considerations for service principles:

* Consider how to create your application service principals. A service principal object for an app can be created in different ways:
	* When an app is given permission to access resources in a tenant (upon registration or consent), a service principal object is created.
	* When you register an app by using the Azure portal, a service principal is created automatically.
	* You can create service principal objects in a tenant by using Azure PowerShell, the Azure CLI, Microsoft Graph, and other tools.

* Consider service principals without managed identities. 
	* Use service principals without managed identities when you want to be able to manage the credentials.

* Consider authentication of external apps to Azure resources. 
	* Authenticate external apps to Azure resources by using service principals.

* Consider the best practices for requesting permissions. 
	* Review these suggestions for how to build apps that use Microsoft Entra ID to provide sign-in and access tokens for secured endpoints:
		* Only ask for the permissions required for implemented app functionality. Don't request user consent for permissions that you haven't yet implemented for your application.
		* When you request permissions for app functionality, request the least-privileged access. If an app analyzes a user's email, but it takes no action on the mailbox, you shouldn't request the more permissive Mail.ReadWrite permission when the Mail.Read permission is sufficient.
		* Apps should gracefully handle scenarios where the user doesn't grant consent to the app when permissions are requested.

* Consider restricting user consent. 
	* Restrict user consent to allow users to consent only for apps from verified publishers, and only for the Tailwind Traders permissions you select. 
	* For apps that don't meet this policy, centralize the decision-making process to the security and identity administrator team. 
	* After end-user consent is disabled or restricted, there are several important considerations to ensure your organization stays secure while still allowing business-critical applications to be used. 
	* These steps are crucial to minimize impact on your organization's support team and IT admins, while preventing the use of unmanaged accounts in third-party applications.



## Design managed identities
A common challenge for developers is how to manage secrets and credentials that secure communication between different components of a solution. 

Managed identities eliminate the need for developers to manage credentials.

Azure managed identity is a feature of Microsoft Entra ID that you can use free of charge. 

This feature automatically creates identities to allow apps to authenticate with Azure resources and services.

Managed identities are available in all editions of Microsoft Entra ID, including the Free edition that comes with an Azure subscription. 

You can use managed identities in App Service at no extra cost, and with no required configuration.

Managed identities provide an identity for apps to use when connecting to resources that support Microsoft Entra authentication. 

Apps can use the managed identity to obtain Microsoft Entra tokens. 

An app might use a managed identity to access resources like Azure Key Vault where developers can store credentials in a secure manner or to access storage accounts.

### Things to know about managed identities
Consider these characteristics of managed identities:

* A managed identity combines Microsoft Entra authentication and Azure role-based access control (RBAC).

* When you use managed identities, you don't need to rotate credentials or worry about expiring certifications. 
* Azure handles credential rotation and expiration in the background. To configure an app to use a managed identity, you use the provided token to call the service.

* Resources that support system-assigned managed identities allow you to:
	* Enable or disable managed identities at the resource level.
	* Use RBAC roles to grant permissions.
	* Review create, read, update, delete (CRUD) operations in Azure Activity logs.
	* Review sign-in activity in Microsoft Entra sign-in logs.

* Managed identities can be enabled or disabled on an app at any time.

**There are two types of managed identities:**

* System-assigned: 
	* Some Azure services allow you to enable a managed identity directly on a service instance. 
	* When you enable a system-assigned managed identity, an identity is created in Microsoft Entra that's tied to the lifecycle of that service instance. 
	* When the resource is deleted, Azure automatically deletes the identity. 
	* By design, only that Azure resource can use that identity to request tokens from Microsoft Entra ID.

* User-assigned: 
	* You can create a managed identity as a standalone Azure resource. 
	* Create a user-assigned managed identity and assign it to one or more instances of an Azure service. 
	* A user-assigned identity is managed separately from the resources that use it.


### Things to consider when using managed identities
Consider the following for managed identities:

* Consider your Azure services and your targets: 
	* Build your apps with Azure App Service and access Azure Storage, and by using managed identities, you won't have to manage any credentials.

Build your app with an Azure service | Access a target without managing credentials
--- | ---
Azure Resources <br /> Azure Virtual Machines <br /> Azure App Service <br /> Azure Functions <br /> Azure Container Instances <br /> Azure Kubernetes Service <br /> Azure Logic Apps <br /> Azure Storage | Access any target that supports Microsoft Entra authentication: <br /> - Your applications <br /> - Azure services, such as Azure Key Vault, Azure Storage, Azure SQL, and so on

* Consider using system-assigned managed identities. 
	* Implement system-assigned managed identities for workloads that are contained within a single Azure resource, or for workloads that need independent identities.

* Consider choosing user-assigned managed identities. 
	* Choose user-assigned managed identities for workloads that run on multiple resources that can share a single identity. 
	* This type of identity is also good for workloads that need pre-authorization to a secure resource as part of a provisioning flow. 
	* User-assigned identities are suited for workloads with resources that are recycled frequently, but where permissions should stay consistent.

* Consider the benefits of managed identities for VMs in Azure. 

* Consider Azure Key Vault authentication for Azure resources. 
	* Authenticate managed identities for Azure resources by integrating with Azure Key Vault.

Scenario for using Key Vault:

* Your app requires service passwords, connection strings, and other secret configuration values to do its job. 
* Storing and handling secret values is risky, and every usage introduces the possibility of leakage. 
* Use Azure Key Vault with managed identities for Azure resources to enable your Azure web app to access secret configuration values easily and securely. 
* You won't need to store any secrets in your source control or configuration.

Key Vault uses Microsoft Entra ID to authenticate users and apps that try to access a vault. 

To grant your web app access to a vault, register your app with Microsoft Entra ID to create an identity for the app. 

After the app has an identity, you can assign it vault permissions.

Apps and users authenticate to Key Vault by using a Microsoft Entra authentication token. 
 
Getting a token from Microsoft Entra ID requires a secret or certificate because anyone with a token could use the app identity to access all the secrets in the vault.



## Design for Azure Key Vault
Direct storage and handling of secrets, encryption keys, and certificates is risky. 

Every usage introduces the possibility of unintentional data exposure. 

Azure Key Vault provides a secure storage area so you can manage all your app secrets and properly encrypt your data in transit or while it's being stored.

Azure Key Vault can help you solve security problems by enabling the following:

* **Manage secrets.** You can securely store and tightly control access to tokens, passwords, certificates, API keys, and other secrets.
* **Manage keys.** Key Vault is a key management solution that lets you easily create and control encryption keys to encrypt corporate data.
* **Manage certificates.** Key Vault is also a service that makes it easy to enroll, manage, and deploy public and private Transport Layer Security/Secure Sockets Layer (TLS/SSL) certificates for use with Azure and internal connected resources.

### Things to know about Azure Key Vault
Consider these characteristics of Key Vault:

* Key Vault is available in two service tiers:
	* Standard tier lets you encrypt your data with a software key.
	* Premium tier offers hardware security module (HSM)-protected keys.

* You can build access policies with restricted secret access that are tailored to the apps and individuals that need them.
 
* Sensitive app information can be separated from other configuration and code, which reduces the risk of accidental leaks.
 
* Centralized secret storage allows required changes to happen in only one place.
 
* Logging and monitoring in Key Vault helps you understand how and when secrets are accessed.

* Key Vault provides secure access to sensitive information from within your apps:
	* Keys, secrets, and certificates are protected without writing extra code, and you can use these assets from your apps.
	* Customers can own and manage their own keys, secrets, and certificates. 
	* Your apps don't own the responsibility or potential liability for customer assets
	* Your app can use keys for signing and encryption while keeping key management external from the app.
	* You can manage credentials like passwords, access keys, and shared access signature tokens by storing them in Key Vault as secrets.

### Things to consider when using Azure Key Vault
Consider how Azure Key Vault can be used to manage user passwords, certificates, API keys, and other secrets.

* Consider using separate key vaults. 
	* Key vaults define security boundaries for stored secrets. 
	* Grouping secrets into the same vault increases the blast radius of a security event. 
	* Consider what secrets a specific application should have access to, and then separate your key vaults based on this delineation. 
	* Separating key vaults by application is the most common boundary.

* Consider access to the key vault. 
	* Secure access to your key vaults by allowing only authorized applications and users. 
	* Here are some suggestions. Create access policies for every vault. // Use the principle of least privilege access to grant access. // Turn on firewall and virtual network service endpoints.

* Consider data protection for your key vault. 
	* Turn on [soft delete and purge protection](https://learn.microsoft.com/en-us/azure/key-vault/general/key-vault-recovery?tabs=azure-portal#what-are-soft-delete-and-purge-protection) to protect your key vault data.
	
* **Soft delete:** 
	* Designed to prevent accidental deletion of your key vault and keys, secrets, and certificates stored inside key vault. 
	* Think of soft-delete like a recycle bin.

* **Purge protection** 
	* Designed to prevent the deletion of your key vault, keys, secrets, and certificates by a malicious insider. 
	* Think of this as a recycle bin with a time based lock. 
	* You can recover items at any point during the configurable retention period.

