# Microsoft Azure Well-Architected Framework - Security
Learn how to incorporate security into your architecture design, and discover the tools that Azure provides to help you create a secure environment through all the layers of your architecture.

Learning objectives:

* Develop a defense-in-depth approach to securing your architecture
* Choose the technologies to secure your Azure infrastructure
* Develop a strategy for secure identity management

## Defense in depth
There's no easy solution that solves all your problems from a security perspective. 

Let's imagine you work for an organization that has neglected security in its environment. 

The company has realized that it needs to put some major focus in this area. 

The company isn't sure where to start, or if it's possible to just buy a solution to make the environment secure. 

The company knows it needs a holistic approach, but is unsure what fits into that.

Here, we'll identify key concepts of defense in depth and identify key security technologies and approaches to support a defense-in-depth strategy.

We'll also discuss how to apply these concepts when you're architecting your own Azure services.

### Zero Trust model
The analyst firm Forrester Research introduced the Zero Trust model, which states that you should never assume trust, but instead continually validate trust.

When users, devices, and data all resided inside the organization's firewall, they were assumed to be trusted. 

This assumed trust allowed for easy lateral movement after a malicious hacker compromised an endpoint device.

Most users now access applications and data from the internet, and many companies now allow users to use their own devices at work (bring your own device, or BYOD). 

Most components of the transactions (the users, network, and devices) are no longer completely under organizational control. 

The Zero Trust model relies on verifiable user and device trust claims to grant access to organizational resources. 

No longer is trust assumed based on the location inside an organization's perimeter.

This model has forced security researchers, engineers, and architects to rethink the approach applied to security and use a layered strategy to protect their resources.

### Defense in depth: A layered approach to security
Defense in depth is a strategy that employs a series of mechanisms to slow the advance of an attack that's aimed at acquiring unauthorized access to information.

Each layer provides protection so that if one layer is breached, a subsequent layer is already in place to prevent further exposure.

Microsoft applies a layered approach to security, both in its physical datacenters and across Azure services. 

The objective of defense in depth is to protect information and prevent it from being stolen by individuals who aren't authorized to access it. 

The common principles that help define a security posture are confidentiality, integrity, and availability, known collectively as CIA.

* Confidentiality: 
	* The principle of least privilege restricts access to information only to individuals explicitly granted access. 
	* This information includes protection of user passwords, remote access certificates, and email content.

* Integrity: 
	* The goal is to prevent unauthorized changes to information at rest or in transit. 
	* A common approach used in data transmission is for the sender to create a unique fingerprint of the data by using a one-way hashing algorithm. 
	* The hash is sent to the receiver along with the data. 
	* The receiver recalculates the data's hash and compares it to the original to ensure that the data wasn't lost or modified in transit.

* Availability: 
	* Ensures that services are available to authorized users. 
	* Denial-of-service attacks are a common cause of loss of availability to users. 
	* Natural disasters also drive system design to prevent single points of failure and deploy multiple instances of an application to geo-dispersed locations.


### Security layers
You can visualize defense in depth as a set of concentric rings with the data to be secured at the center. 

Each ring adds a layer of security around the data. This approach removes reliance on any single layer of protection. 

It also acts to slow down an attack and provide alert telemetry that can be acted upon either automatically or manually.

Let's look at each of the layers.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-security/media/2-defense-in-depth.png)

Each layer can implement one or more of the CIA concerns:

 | Ring | Example | Principle
 --- | --- | --- | ---
1 | Data | Data encryption at rest in Azure Blob Storage | Integrity
2 | Application | SSL/TLS encrypted sessions | Integrity
3 | Compute | Regular application of OS and layered software patches | Availability
4 | Network | Network security rules | Confidentiality
5 | Perimeter | DDoS protection | Availability
6 | Identity and access | Microsoft Entra user authentication | Integrity
7 | Physical security | Azure datacenter biometric access controls | Confidentiality

### Data
In almost all cases, attackers are after data:

* Stored in a database
* Stored on disk inside virtual machines
* Stored on a software as a service (SaaS) application such as Microsoft 365
* Stored in cloud storage

The people who store and control access to data are responsible for ensuring that it's properly secured. 

Often, regulatory requirements dictate the controls and processes that must be in place to ensure the confidentiality, integrity, and availability of the data.

### Applications
Integrating security into the application development life cycle will help reduce the number of vulnerabilities introduced in code.

Encourage all development teams to make their applications secure by default. 

Make security requirements non-negotiable.

* Ensure that applications are secure and free of vulnerabilities
* Store sensitive application secrets in a secure storage medium
* Make security a design requirement for all application development


### Compute
Malware, unpatched systems, and improperly secured systems open your environment to attacks. 

The focus in this layer is on making sure that your compute resources are secure and that you have the proper controls in place to minimize security issues.

* Secure access to virtual machines
* Implement endpoint protection and keep systems patched and current

### Networking
At this layer, the focus is on limiting network connectivity across all your resources. 

Segment your resources and use network-level controls to restrict communication to only what's needed. 

By limiting this communication, you reduce the risk of lateral movement throughout your network.

* Limit communication between resources through segmentation and access controls
* Deny by default
* Restrict inbound internet access and limit outbound where appropriate
* Implement secure connectivity to on-premises networks

### Perimeter
At the network perimeter, it's about protecting from network-based attacks against your resources. 

Identifying these attacks, eliminating their impact, and alerting on them are important to keep your network secure.

* Use distributed denial-of-service (DDoS) protection to filter large-scale attacks before they can cause a denial of service for users
* Use perimeter firewalls to identify and alert on malicious attacks against your network

### Identity and access
The identity and access layer is all about ensuring that identities are secure, that access granted is only what's needed, and that changes are logged.

* Control access to infrastructure (change control)
* Use single sign-on and multifactor authentication
* Audit events and changes

### Physical security
Physical building security and controlling access to computing hardware within the datacenter are the first line of defense.

With physical security, the intent is to provide physical safeguards against access to assets. 

This ensures that other layers can't be bypassed, and that loss or theft is handled appropriately.

### Shared responsibilities
As computing environments move from customer-controlled datacenters to cloud datacenters, the responsibility of security also shifts. 

Security is now a concern that both cloud providers and customers share.

### Continuous improvement
The threat landscape is evolving in real time and at massive scale, so a security architecture is never complete. 

Microsoft and its customers need the ability to respond to these threats intelligently, quickly, and at scale.

Microsoft Defender for Cloud provides customers with unified security management and advanced threat protection to understand and respond to security events on-premises and in Azure. 

In turn, Azure customers have a responsibility to continually reevaluate and evolve their security architecture.



## Identity management
Here, we'll look at identity as a security layer for internal and external applications. 

We'll also review the benefits of single sign-on (SSO) and multifactor authentication to provide identity security, and why you should consider replicating on-premises identities to Microsoft Entra ID.

### Identity as a layer of security
Digital identities are an integral part of today's business and social interactions on-premises and online. 

In the past, identity and access services were restricted to operating within a company's internal network. 

Protocols such as Kerberos and LDAP were designed for this purpose.

More recently, mobile devices have become the primary way that people interact with digital services. 

Customers and employees alike expect to be able to access services from anywhere at any time. 

This expectation has driven the development of identity protocols that can work at internet scale across many disparate devices and operating systems.

As your organization evaluates the capabilities of its architecture around identity, it's looking at ways to bring the following capabilities into the application:

* Provide single sign-on to application users
* Enhance the application to use modern authentication with minimal effort
* Enforce multifactor authentication for all sign-ins outside the company's network
* Develop an application to allow patients to enroll and securely manage their account data

### Single sign-on
The more identities a user has to manage, the greater the risk of a credential-related security incident. 

More identities mean more passwords to remember and change. 

Password policies can vary between applications. 

As complexity requirements increase, it's more difficult for users to remember them.

On the other side is the management required for all those identities. 

Additional strain is placed on help desks as they deal with account lockouts and password-reset requests. 

If a user leaves an organization, tracking down all those identities and ensuring that they're disabled can be challenging. 

An overlooked identity can allow access that should've been eliminated.

With single sign-on, users need to remember only one ID and one password. 

Access across applications is granted to a single identity tied to a user, simplifying the security model. 

As users change roles or leave an organization, access modifications are tied to the single identity, greatly reducing the effort needed to change or disable accounts.

Using single sign-on for accounts will make it easier for users to manage their identities. 

It'll also increase the security capabilities in your environment.

### SSO with Microsoft Entra ID
Microsoft Entra ID is a cloud-based identity service. 

It has built-in support for synchronizing with your on-premises Active Directory instance, or it can be used on its own. 

This means that all your applications, whether on-premises, in the cloud (including Microsoft 365), or even on mobile can share the same credentials. 

Administrators and developers can control access to data and applications by using centralized rules and policies configured in Microsoft Entra ID.

By using Microsoft Entra ID for SSO, you'll also have the ability to combine multiple data sources into an intelligent security graph. 

This security graph can help you provide threat analysis and real-time identity protection to all accounts in Microsoft Entra ID, including accounts that are synchronized from on-premises Active Directory. 

By using a centralized identity provider, you'll have centralized the security controls, reporting, alerting, and administration of your identity infrastructure.

### Synchronize directories with Microsoft Entra Connect
Microsoft Entra Connect can integrate your on-premises directories with Microsoft Entra ID. 

Microsoft Entra Connect provides the newest capabilities and replaces older versions of identity-integration tools such as DirSync and Azure AD Sync.

It's a single tool to provide an easy deployment experience for synchronization and sign-in.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-security/media/3-azure-ad-connect.png)

Imagine your organization has made the decision to move forward with the following configuration:

* Use Microsoft Entra Connect to synchronize groups, user accounts, and password hashes stored in on-premises Active Directory to Microsoft Entra ID.
* Configure pass-through authentication by using an on-premises authentication agent installed on Windows Server.
* Use the seamless SSO feature of Microsoft Entra ID to automatically sign users in from on-premises domain-joined computers.

### Authentication and access
Your organization's security policy requires that all sign-ins that occur outside the company's perimeter network are authenticated with an additional factor of authentication. 

This requirement combines two aspects of the Microsoft Entra service: multifactor authentication and Conditional Access policies.

#### Multifactor authentication
Multifactor authentication provides additional security for your identities by requiring two or more elements for full authentication. 

These elements fall into three categories:

* Something you know: A password or the answer to a security question
* Something you have: A mobile app that receives a notification, or a token-generating device
* Something you are: Some sort of biometric property such as a fingerprint or face scan used on many mobile devices

Using multifactor authentication increases the security of your identity by limiting the impact of credential exposure. 

An attacker who has a user's password would also need to have possession of their phone or their face in order to fully authenticate. 

Authentication with only a single factor verified is insufficient, and the attacker would be unable to use those credentials to authenticate. 

The benefits that this approach brings to security are huge, so organizations should enable multifactor authentication wherever possible.

Microsoft Entra ID has multifactor authentication capabilities built in, and will integrate with other multifactor authentication providers. 

Basic multifactor authentication features are available to Microsoft 365 and Microsoft Entra administrators for no extra cost. 

If you want to upgrade the features for your admins or extend multifactor authentication to the rest of your users, you can purchase more capabilities.

### Conditional Access policies
Along with multifactor authentication, ensuring that additional requirements are met before granting access can add another layer of protection. 

Blocking logins from a suspicious IP address, or denying access from devices without malware protection, can limit access from risky sign-ins.

Microsoft Entra ID provides Conditional Access policies based on group, location, or device state. 

The location feature allows your organization to differentiate IP addresses that don't belong to the network, and it satisfies the security policy to require multifactor authentication from all such locations.

Your organization has created a Conditional Access policy that requires users who access the application from an IP address outside the company network to be challenged with multifactor authentication.

In the following illustration, user requests to access the on-premises and cloud applications are first checked against a list of conditions. 

The requests are either allowed access, forced to go through multifactor authentication, or blocked based on the conditions that they satisfy.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-security/media/3-conditional-access.png)

### Securing applications
Your employees require secure remote access to their administrative application hosted on-premises.

Users currently authenticate to the application by using Windows Integrated Authentication from their domain-joined machines behind the corporate firewall.

Although a project to incorporate modern authentication mechanisms into the application has been planned, there's considerable business pressure to enable remote-access capabilities as soon as possible. 

Microsoft Entra application proxy can allow users to access the application remotely without any code changes.

Microsoft Entra application proxy is:

* Simple
	* You don't need to change or update your applications to work with Application Proxy.
	* Your users get a consistent authentication experience. 
	* They can use the portal to get single sign-on to both SaaS apps in the cloud and your apps on-premises.

* Secure
	* When you publish your apps by using Microsoft Entra application proxy, you can take advantage of the authorization controls and security analytics in Azure.
	* You get cloud-scale security and Azure security features like Conditional Access and two-step verification.
	* You don't have to open any inbound connections through your firewall to give your users remote access.

* Cost-effective
	* Application Proxy works in the cloud, so you can save time and money. 
	* On-premises solutions typically require you to set up and maintain perimeter networks, edge servers, or other complex infrastructures.

Microsoft Entra application proxy has two components. 

The first is a connector agent that sits on a server running Windows within your corporate network. 

The second is an external endpoint, either the portal or an external URL. 

When a user goes to the endpoint, they authenticate with Microsoft Entra ID and are routed to the on-premises application via the connector agent.

### Working with consumer identities
Since your organization integrated modern authentication with its existing application, it has quickly acknowledged the benefits of a managed-identity system such as Microsoft Entra ID. 

The leadership team is now interested in exploring other ways that Microsoft identity services can add business value. 

The team is focusing its attention on external customers, and how modernization of existing customer interactions might provide tight integration with identity providers like Google, Facebook, and LinkedIn.

Azure AD B2C is an identity management service that's built on the foundation of Microsoft Entra ID. 

It lets you customize and control how customers sign up, sign in, and manage their profiles when using your applications. 

This includes applications developed for iOS, Android, and .NET, among others.

Azure AD B2C provides a social identity login experience, while at the same time protecting your customer identity profile information. 

Azure AD B2C directories are distinct from standard Microsoft Entra directories. You can create them in the Azure portal.



## Infrastructure protection
Imagine your organization recently experienced a significant outage to a customer-facing web application. 

An engineer was granted full access to a resource group that contains the production web application. 

This engineer accidentally deleted the resource group and all child resources, including the database that hosts live customer data.

Fortunately, the application's source code and resources were available in source control, and regular database backups were running automatically on a schedule. 

The service was reinstated relatively easily. 

Here, we'll explore how the organization could've avoided this outage by using capabilities in Azure to protect access to the infrastructure.

### Criticality of infrastructure
Cloud infrastructure is becoming an essential piece of many businesses. 

It's critical to ensure that people and processes have only the rights they need to get their job done. 

Assigning incorrect access can result in data loss, data leakage, or unavailability of services.

System administrators can be responsible for a large number of users, systems, and permission sets, so correctly granting access can quickly become unmanageable and can lead to a "one size fits all" approach. 

This approach can reduce the complexity of administration, but makes it far easier to inadvertently grant more permissive access than required.

### Role-based access control
Role-based access control (RBAC) offers a slightly different approach. 

Roles are defined as collections of access permissions. 

Security principals are mapped to roles directly or through group membership. 

Separating security principals, access permissions, and resources provides simplified access management and more detailed control.

On Azure, users, groups, and roles are all stored in Microsoft Entra ID. 

The Azure Resource Manager API uses role-based access control to secure all resource access management within Azure.

### Roles and management groups
Roles are sets of permissions, like read-only or contributor, that users can be granted to access an Azure service instance. 

Roles can be granted at the level of an individual service instance, but they also flow down the Azure Resource Manager hierarchy. 

Roles assigned at a higher scope (like an entire subscription) are inherited by child scopes (like service instances).

Management groups are an additional hierarchical level recently introduced into the RBAC model. 

Management groups add the ability to group subscriptions together and apply policy at an even higher level.

The ability to flow roles through an arbitrarily defined subscription hierarchy also allows administrators to grant temporary access to an entire environment for authenticated users. 

### Privileged Identity Management
In addition to managing Azure resource access with RBAC, a comprehensive approach to infrastructure protection should consider including the ongoing auditing of role members as the organization changes and evolves. 

Microsoft Entra Privileged Identity Management (PIM) is an additional paid offering that provides oversight of role assignments, self-service, and just-in-time (JIT) role activation.

With the Microsoft Entra PIM service, you can manage, control, and monitor access to important resources in your organization. 

This includes access to resources in Microsoft Entra ID, Azure, and other Microsoft Online Services like Microsoft 365 and Microsoft Intune. 

This control does not eliminate the need for users to carry out privileged operations in Microsoft Entra ID, Azure, Microsoft 365, and software as a service (SaaS) apps.

Organizations can give users JIT privileged access to Azure resources and Microsoft Entra ID. 

Oversight is needed for what those users do with their administrator privileges. 

PIM helps mitigate the risk of excessive, unnecessary, or misused access rights.

Here are some of the key features of PIM:

* Providing just-in-time privileged access to Microsoft Entra ID and Azure resources
* Assigning time-bound access to resources by using start and end dates
* Requiring approval to activate privileged roles
* Enforcing Microsoft Entra multifactor authentication to activate any role
* Using justification to understand why users activate
* Getting notifications when privileged roles are activated
* Conducting access reviews to ensure that users still need roles
* Downloading an audit history for an internal or external audit

To use PIM, you need one of the following paid or trial licenses:

* Microsoft Entra ID P2
* Enterprise Mobility + Security (EMS) E5

### Providing identities to services
It's often valuable for services to have identities. 

Often (and against best practices) credential information is embedded in configuration files. 

With no security around these configuration files, anyone with access to the systems or repositories can access these credentials and risk exposure.

Microsoft Entra ID addresses this problem through two methods: service principals and managed identities for Azure services.

### Service principals
To understand service principals, it's useful to first understand the words identity and principal as they're used in the world of identity management.

An *identity* is just a thing that can be authenticated. 

This includes users with usernames and passwords, but it can also include applications or other servers, which might authenticate with secret keys or certificates. 

A *principal* is an identity that acts with certain roles or claims. 

Consider the use of Sudo on a Bash prompt or on Windows via Run as administrator. 

In both of those cases, you're still signed in as the same identity as before, but you've changed your role.

So, a service principal is literally named. It's an identity that a service or application uses. Like other identities, you can assign roles to it.

### Managed identities for Azure resources
The creation of service principals can be a tedious process. 

There are also many touchpoints that can make maintaining service principals difficult. 

Managed identities for Azure resources are much easier, and will do most of the work for you.

You can instantly create a managed identity for any Azure service that supports it. 

(The list is constantly growing.) When you create a managed identity for a service, you're creating an account on the Microsoft Entra tenant. 

Azure infrastructure will automatically take care of authenticating the service and managing the account. 

You can then use that account like any other Active Directory account, including letting the authenticated service securely access other Azure resources.



## Encryption
Data is an organization's most valuable and irreplaceable asset. 

Encryption serves as the last and strongest line of defense in a layered security strategy for data.

Here, we'll take a look at what encryption is, how to approach the encryption of data, and what encryption capabilities are available on Azure.

### What is encryption?
Encryption is the process of making data unreadable and unusable. 

To use or read the encrypted data, it must be decrypted, which requires the use of a secret key. 

There are two top-level types of encryption: symmetric and asymmetric.

Symmetric encryption uses the same key to encrypt and decrypt the data. 

Consider a password manager application. You enter your passwords, and they're encrypted with your own personal key. 

(Your key is often derived from your master password.) When the data needs to be retrieved, the same key is used and the data is decrypted.

Asymmetric encryption uses a public key and private key pair. 

Either key can encrypt, but can't decrypt its own encrypted data. 

To decrypt, you need the paired key. Asymmetric encryption is used for things like TLS (used in HTTPS) and data signing.

Both symmetric and asymmetric encryption play a role in properly securing your data.

Encryption is typically approached in two ways: encryption at rest and encryption in transit.

### Encryption at rest
Data at rest is the data that has been stored on a physical medium. 

This might be data stored on the disk of a server, data stored in a database, or data stored in a storage account.

Regardless of the storage mechanism, encryption of data at rest ensures that the stored data is unreadable without the keys and secrets needed to decrypt it. 

If an attacker obtained a hard drive with encrypted data and didn't have access to the encryption keys, the attacker would have great difficulty compromising the data. 

In such a scenario, an attacker would have to attempt attacks against encrypted data, which is much more complex and resource consuming than accessing unencrypted data on a hard drive.

The data that's encrypted can vary in its content, usage, and importance to the organization. 

It might be financial information that's critical to the business, intellectual property that has been developed by the business, personal data that the business stores about customers or employees, and even the keys and secrets used for the encryption of the data itself.

### Encryption in transit
Data in transit is the data that's actively moving from one location to another, such as across the internet or through a private network. 

An organization can handle secure transfer by encrypting the data before sending it over a network, or by setting up a secure channel to transmit unencrypted data between two systems. 

Encrypting data in transit protects the data from outside observers and provides a mechanism to transmit data while limiting risk of exposure.

The following illustration is an example of encryption in transit. 

The data is encrypted before it's transferred. After the data reaches the destination, it's decrypted.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-security/media/5-encryption-in-transit.png)

### Identify and classify data
Let's revisit the problem that your organization is trying to solve. 

The organization has had previous incidents that exposed sensitive data, so there's a gap between what's being encrypted and what should be encrypted. 

The organization needs to start by identifying and classifying the types of data that it's storing, and align this with the business and regulatory requirements for the storage of data.

It's beneficial to classify this data as it relates to the impact of exposure to the organization, its customers, or its partners. 

An example classification might be as follows:

Data classification | Explanation | Examples
--- | --- | ---
Restricted | Data classified as restricted poses significant risk if exposed, altered, or deleted. This data requires strong levels of protection. | Data that contains Social Security numbers, credit card numbers, personal health records
Private | Data classified as private poses moderate risk if exposed, altered, or deleted. This data requires reasonable levels of protection. Data that isn't classified as restricted or public will be classified as private. | Personal records that contain information such as address, phone number, academic records, customer purchase records
Public | Data classified as public poses no risk if exposed, altered, or deleted. This data doesn't require any protection. | Public financial reports, public policies, product documentation for customers

By taking an inventory of the types of data being stored, the organization can get a better picture of where sensitive data might be stored and where existing encryption might or might not be happening.

A thorough understanding of the regulatory and business requirements that apply to data that the organization stores is also important. 

The regulatory requirements to which an organization adheres often drive a large part of the data encryption requirements.

In the example scenario, your organization is storing sensitive data that falls under the Health Insurance Portability and Accountability Act (HIPAA), which contains requirements on how to handle and store patient data. 

Other industries fall under different regulatory requirements. 

A financial institution might store account information that falls within Payment Card Industry (PCI) standards. 

An organization that does business in the EU might fall under the General Data Protection Regulation (GDPR), which defines the handling of personal data in the EU.

Business requirements might also dictate that any data that could put the organization at financial risk needs to be encrypted. 

Competitive information falls in this category.

After you've classified the data and defined your requirements, you can take advantage of tools and technologies to implement and enforce encryption in your architecture.


### Encryption on Azure
Let's take a look at some ways that Azure enables you to encrypt data across services.

#### Encrypt raw storage
Azure Storage encryption for data at rest helps you protect your data to meet your organizational security and compliance commitments. 

The Azure Storage platform automatically encrypts your data with 256-bit Advanced Encryption Standard (AES) encryption before persisting it to disk and then decrypts the data during retrieval. 

This handling of encryption, encryption at rest, decryption, and key management in Azure Storage is transparent to applications that use the service. 

You don't need to add any code or turn on any features.

You can use Microsoft-managed encryption keys with Azure Storage encryption, or you can use your own encryption keys by selecting the option in the Azure portal.

Azure Storage automatically encrypts data in:

* All Azure Storage services, including Azure Managed Disks, Azure Blob Storage, Azure Files, Azure Queue Storage, and Azure Table Storage
* Both performance tiers (Standard and Premium)
* Both deployment models (Azure Resource Manager and classic)

#### Encrypt virtual machines
Azure Storage provides low-level encryption protection for data written to physical disk, but how do you protect the virtual hard disks (VHDs) of virtual machines (VMs)? 

If a malicious attacker gained access to your Azure subscription and exfiltrated the VHDs of your virtual machines, how would you ensure they'd be unable to access data stored on the VHD?

Azure Disk Encryption is a capability that helps you encrypt your Windows and Linux IaaS virtual machine disks. 

Azure Disk Encryption uses the industry-standard BitLocker feature of Windows and the DM-Crypt feature of Linux to provide volume encryption for the OS and data disks. 

The solution is integrated with Azure Key Vault to help you control and manage the disk-encryption keys and secrets. 

(You can also use managed identities for Azure services for accessing the key vault.)

Disk Encryption for Windows IaaS and Linux VMs is in general availability in all Azure public regions and Azure Government regions for Standard and Premium VMs. 

When you apply the Disk Encryption management solution, you can satisfy the following business needs:

* IaaS VMs are secured at rest through industry-standard encryption technology to address organizational security and compliance requirements.
* IaaS VMs start under customer-controlled keys and policies. You can audit their usage in your key vault.

In addition, if you use Microsoft Defender for Cloud, you're alerted if you have VMs that aren't encrypted, the alerts appear as High Severity, and the recommendation is to encrypt these VMs.

Your organization can apply Disk Encryption to its virtual machines to be sure that any data stored on VHDs is secured to organizational and compliance requirements. 

Because startup disks are also encrypted, the organization can control and audit usage.

### Encrypt databases
Your organization has several databases that store data that needs more protection. 

The organization has moved many databases to Azure SQL Database, and wants to ensure that data is encrypted there. 

The organization wants to make sure that if the data files, log files, or backup files are stolen, they're unreadable without access to the encryption keys.

Transparent data encryption helps protect Azure SQL Database and Azure Data Warehouse against the threat of malicious activity. 

It performs real-time encryption and decryption of the database, associated backups, and transaction log files at rest without requiring changes to the application. 

By default, transparent data encryption is enabled for all newly deployed Azure SQL databases.

Transparent data encryption encrypts an entire database's storage by using a symmetric key called the database encryption key. 

By default, Azure provides a unique encryption key per logical SQL Server instance and handles all the details. 

Bring your own key is also supported with keys stored in Azure Key Vault.

Because transparent data encryption is enabled by default, your organization can be confident that it has the proper protections in place for data stored in its databases.

The Always Encrypted client driver performs the encryption and decryption processes. 

It rewrites the T-SQL queries as necessary to encrypt data passed to the database and decrypt the results, while keeping these operations transparent to the application.

### Encrypt secrets
We've learned that the encryption services all use keys to encrypt and decrypt data. 

How do we ensure that the keys themselves are secure? You might also have passwords, connection strings, or other sensitive pieces of information that you need to securely store.

Azure Key Vault is a cloud service that works as a secure store for secrets. 

Key Vault allows you to create multiple secure containers called vaults. 

These vaults are backed by hardware security modules (HSMs). 

Vaults help reduce the chances of accidental loss of security information by centralizing the storage of application secrets. 

Vaults also control and log access to anything stored in them.

Azure Key Vault can handle requesting and renewing Transport Layer Security (TLS) certificates to provide a robust certificate lifecycle management solution. 

Key Vault is designed to support any type of secret. 

These secrets can be passwords, database credentials, API keys, and certificates.

Because you can grant Microsoft Entra identities access to use Key Vault secrets, applications that use managed identities for Azure services can automatically and seamlessly acquire the secrets they need.

Your organization can use Key Vault to store all of its sensitive application information. 

That information includes the TLS certificates that the organization uses to secure communication between systems.

### Encrypt backups
Encrypting all of its data won't help your organization if the daily backups of systems aren't also encrypted. 

Your organization uses Azure Backup to back up data from on-premises machines and Azure VMs. 

Azure Backup lets the IT department back up and recover data at a granular level. 

The backups include files, folders, machine system state, and app-aware data.

Luckily for your hard-working IT department, there's no work to do here, because all the data is stored encrypted at rest. 

Azure Backup encrypts local backups by using AES256 and a key created from the passphrase configured by the administrator. 

The data is securely transferred to Azure through HTTPS. 

The already-encrypted data is then stored on disk. 

Azure VMs are also automatically encrypted at rest, because they use Azure Storage for their disks.



## Network security
Securing your network from attacks and unauthorized access is an important part of any architecture. 

As part of preparation for its cloud migration, your company took the time to plan its network infrastructure. 

The company wanted to ensure that it had network security controls in place to protect the network infrastructure from attack.

Here, we'll look at what network security is, how to integrate a layered approach into your architecture, and how Azure can help you provide network security for your environment.

### What is network security?
Network security is protecting the communication of resources within and outside your network. 

The goal is to limit exposure at the network layer across your services and systems. 

By limiting this exposure, you decrease the likelihood that your resources can be attacked. 

For network security, an organization can focus its efforts on the following areas:

* *Securing traffic flow between applications and the internet* 
	* Focuses on limiting exposure outside your network. 
	* Network attacks will most often start outside your network, so by limiting the internet exposure and securing the perimeter, you can reduce the risk of being attacked.

* *Securing traffic flow among applications* 
	* Focuses on data between applications and their tiers, between different environments, and in other services within your network. 
	* By limiting exposure between these resources, you reduce the effect that a compromised resource can have. 
	* This can help reduce further propagation within the network.

* *Securing traffic flow between users and an application* 
	* Focuses on securing the network flow for your users. 
	* This limits the exposure that your resources have to outside attacks, and it provides a secure mechanism for users to utilize your resources.

### Layered approach to network security
A common thread throughout this module has been taking a layered approach to security, and this approach is no different at the network layer. 

It's not enough to just focus on securing the network perimeter, or focusing on the network security between services inside a network. 

A layered approach provides multiple levels of protection, so that if an attacker gets through one layer, further protections are in place to limit the attack.

Let's look at how Azure can provide the tools for a layered approach to securing your network footprint.

#### Internet protection
If you start on the perimeter of the network, you're focused on limiting and eliminating attacks from the internet. 

A great place to start is to assess the resources that are internet-facing, and allow inbound and outbound communication only where necessary. 

Identify all resources that are allowing inbound network traffic of any type. 

Ensure that they're necessary and restricted to only the required ports and protocols.

You can look for this information in Microsoft Defender for Cloud, which will identify internet-facing resources that don't have network security groups associated with them. 

It will also identify resources that aren't secured behind a firewall.

There are a couple of ways to provide inbound protection at the perimeter. 

Azure Application Gateway is a Layer 7 load balancer that also includes a web application firewall (WAF) to provide advanced security for your HTTP-based services. 

The WAF is based on rules from the OWASP 3.2, 3.1, 3.0, or 2.2.9 core rule sets. 

It provides protection from commonly known vulnerabilities such as cross-site scripting and SQL injection.

In the following diagram, the WAF feature of the application gateway protects the system from malicious attacks. 

The load balancer distributes the legitimate requests among virtual machines.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-security/media/6-app-gateway-waf.png)

For non-HTTP-based services protection or for increased customization, you can use Azure Firewall to secure your network resources. 

Azure Firewall is a fully stateful firewall as a service with built-in high availability and unrestricted cloud scalability. 

It provides both east-west and north-south traffic inspection. 

It can provide greater security customization for those applications that require it. 

This can increase complexity, so you should carefully consider your requirements.

Any resource exposed to the internet is at risk for a denial-of-service attack. 

These types of attacks try to overwhelm a network resource by sending so many requests that the resource becomes slow or unresponsive.

To mitigate these attacks, Azure DDoS Protection provides basic protection across all Azure services and enhanced protection for further customization for your resources. 

DDoS Protection blocks attack traffic and forwards legitimate traffic to its intended destination. 

Within a few minutes of attack detection, you're notified through Azure Monitor metrics.

### Virtual network security
Inside a virtual network, it's important to limit communication between resources to only what's required.

For communication between virtual machines, network security groups are a critical piece to restrict unnecessary communication. 

Network security groups operate at layers 3 and 4. 

They provide a list of allowed and denied communication to and from network interfaces and subnets.

Network security groups are fully customizable, and they enable you to lock down network communication to and from your virtual machines. 

By using network security groups, you can isolate applications between environments, tiers, and services.

The following diagram shows how a network security group restricts the back end and middle tier from communicating directly with the internet. 

The front end receives the internet requests and then passes them to the middle tier. 

The middle tier communicates with the back end.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-security/media/6-azure-network-security.png)

To isolate Azure services to allow communication only from virtual networks, you can use virtual network service endpoints. 

With service endpoints, you can secure Azure service resources to your virtual network.

Securing service resources to a virtual network provides improved security by fully removing public internet access to resources and allowing traffic only from your virtual network. 

This technique:

* Reduces the attack surface for your environment.
* Reduces the administration required to limit communication between your virtual network and Azure services.
* Provides optimal routing for this communication.

### Network integration
It's common to have existing network infrastructure that needs to be integrated to provide communication from on-premises networks, or to provide improved communication between services in Azure. 

There are a few key ways to handle this integration and improve the security of your network.

Virtual private network (VPN) connections are a common way of establishing secure communication channels between networks. 

This is no different when you're working with virtual networking on Azure. 

Connection between Azure virtual networks and an on-premises VPN device is a great way to provide secure communication between your network and your virtual machines on Azure.

To provide a dedicated, private connection between your network and Azure, you can use Azure ExpressRoute. 

ExpressRoute lets you extend your on-premises networks into the Microsoft cloud over a private connection facilitated by a connectivity provider.

With ExpressRoute, you can establish connections to Microsoft cloud services, such as Azure, Microsoft 365, and Dynamics 365. 

This improves the security of your on-premises communication by sending this traffic over the private circuit instead of over the internet. 

You don't need to allow access to these services for your users over the internet, and you can send this traffic through appliances for further traffic inspection.

To easily integrate multiple virtual networks in Azure, virtual network peering establishes a direct connection between designated virtual networks. 

After a connection is established, you can use network security groups to provide isolation between resources in the same way that you secure resources within a virtual network. 

This integration lets you provide the same fundamental layer of security across any peered virtual networks. 

Communication is allowed only between directly connected virtual networks.



## Application security
Hosting applications on a cloud platform provides advantages over traditional on-premises deployments. 

The cloud's shared-responsibility model moves security at the physical network, building, and host levels under the control of the cloud provider. 

An attacker who tries to compromise the platform at this level would see diminishing returns versus the considerable investment and insight that providers make in securing and monitoring their infrastructure.

It's far more effective for attackers to pursue vulnerabilities introduced at the application level by cloud-platform customers. 

Furthermore, by adopting platform as a service (PaaS) to host their applications, customers can free resources from managing operating system security and deploy them to harden application code and monitor the identity perimeter around the application.

Here, we'll discuss some of the ways that you can improve application security through design.

### Scenario
Imagine you work for a healthcare organization whose customers require access to their personal medical records through an online web portal. 

Compliance with the Health Insurance Portability and Accountability Act (HIPAA) is mandatory, and puts the company at significant risk of financial penalties if a breach of personal data occurs. 

Securing the application and personal data with which it interacts is paramount.

Here are the primary areas that concern customer applications:

* Secure application design
* Data security
* Identity and access management
* Endpoint security

### Security Development Lifecycle
You can use the Microsoft Security Development Lifecycle (SDL) process during the application-design stage to ensure that security concerns are incorporated in the software development lifecycle. 

Security and compliance issues are far easier to address when you're designing an application, and you can mitigate many common errors that can lead to security flaws in the final product. 

Fixing issues early in the software development journey is also far less costly. 

A software project can use this typical sequence of SDL steps:

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-security/media/7-security-development-lifecycle.png)

The SDL is as much a cultural aspect as it is a process or set of tools. 

Building a culture where security is a primary focus and requirement of any application development can make great strides in evolving an organization's capabilities around security.

### Operational security assessment
After an application has been deployed, it's essential to continually evaluate its security posture, determine how to mitigate any issues that are discovered, and feed the knowledge back into the software-development cycle. 

The depth to which an organization performs this evaluation is a factor of the maturity level of the software-development and operational teams, as well as the data-privacy requirements.

Software services that scan for security vulnerabilities are available to help automate this process and assess security concerns on a regular cadence. 

Such services offer these benefits without burdening teams with costly manual processes, such as penetration testing.

Microsoft Defender for Cloud is a service that's now enabled by default for all Azure subscriptions. 

It's tightly integrated with other Azure application-level services, such as Azure Application Gateway and Azure Web Application Firewall. 

By analyzing logs from these services, Defender for Cloud can report on known vulnerabilities in real time and recommend responses to mitigate them. 

You can even configure Defender for Cloud to automatically execute playbooks in response to attacks.

Defender for Cloud has a free tier of protection features enabled for your subscription. 

You must enable the enhanced security features for advanced security and threat detection capabilities. 

These enhanced features are free for the first 30 days. 

### Identity as the perimeter
Identity validation is becoming the first line of defense for applications. 

Restricting access to a web application by authenticating and authorizing sessions can drastically reduce the attack surface area.

Microsoft Entra ID and Azure Active Directory B2C (Azure AD B2C) offer an effective way to offload the responsibility of identity and access to a fully managed service. 

Microsoft Entra Conditional Access policies, Privileged Identity Management, and identity protection controls further enhance your ability to prevent unauthorized access and audit changes.

### Data protection
Customer data is the target for most, if not all, attacks against web applications. 

The secure storage and transport of data between an application and its data storage layer is paramount.

Your organization stores and accesses sensitive patient medical record data. 

HIPAA, enacted by the United States Congress in 1996, among other controls, defines the standards for electronic healthcare transactions by healthcare providers and employers. 

Healthcare providers and employers must ensure that patients and authorized parties such as physicians have secure access to medical data.

To comply with these requirements, your organization has modified its applications to encrypt all patient data at rest and in transit. 

For example, the organization uses Transport Layer Security (TLS) to encrypt data exchanged between the web application and back-end SQL databases. 

Data is also encrypted at rest in SQL Server through transparent data encryption. 

Encryption at rest ensures that even if the environment is compromised, data is effectively useless to anyone without the correct decryption keys.

To encrypt data stored in Azure Blob Storage, you can use client-side encryption to encrypt the data in memory before it's written to the storage service. 

Libraries that support this encryption are available for .NET, Java, and Python. 

These libraries enable the integration of data encryption directly into applications to enhance data integrity.

### Secure key and secret storage
Separating application secrets (like connection strings or passwords) and encryption keys from the application that's used to access data is vital. 

Encryption keys and application secrets should never be stored in the application code or configuration files.

Instead, use a secure store such as Azure Key Vault. 

You can then limit access to this sensitive data to application identities through managed identities for Azure resources. 

You can rotate keys on a regular basis to limit exposure if encryption keys are leaked.

You can also choose to use your own encryption keys generated by on-premises hardware security modules (HSMs). 

You can even mandate that Azure Key Vault instances are implemented in single-tenant, discrete HSMs.

