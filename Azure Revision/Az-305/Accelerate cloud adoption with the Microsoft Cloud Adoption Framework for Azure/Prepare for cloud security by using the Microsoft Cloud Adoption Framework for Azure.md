# _Prepare for cloud security by using the Microsoft Cloud Adoption Framework for Azure_
Organizations moving to the cloud often find they need to modernize security practices and tooling to keep up with continuous changes in cloud platforms, business requirements, and security threats.

The Microsoft Cloud Adoption Framework for Azure provides guidance for this security modernization journey by providing clarity on processes, best practices, models, and experiences. 

This guidance is based on [Zero Trust](https://aka.ms/zerotrust) principles and the lessons learned and real-world experiences of Microsoft's own security work. 

It's also based on work with organizations like the National Institute of Standards and Technology, the Open Group, and the [Center for Internet Security](https://www.cisecurity.org/).

Learning objectives:

* Understand cloud security methodology.
* Identify security roles and responsibilities.
* Assess cultural and role and responsibility changes that typically come with cloud adoption.
* Learn how to simplify compliance and security implementation in the cloud.

## Methodology
The Secure methodology of the Microsoft Cloud Adoption Framework for Azure provides a complete end-state vision to guide your security program's improvement over time. 

The Secure methodology provides a bridge between your business' digital transformation and your security program and strategy. 

It also provides structured guidance for modernizing your security disciplines.

![INFOGRAPHIC](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-security/media/security-integration-mapping.png)

### Business alignment
Focus your security program on business alignment in three categories:

* **Risk insights:** 
* Align and integrate security insights and risk signals and sources to the business initiatives. 
* Ensure repeatable processes educate all teams on the application of those insights and hold teams accountable for improvements.

* **Security integration:** 
	* Integrate security knowledge, skills, and insights deeper into daily business operations and IT environment. 
	* Use repeatable processes and develop a deep partnership at all levels of the organization.

* **Business resilience:** 
	* Prevent as many attacks as possible and limit the damage of those attacks to foster organizational resilience. 
	* Ensure that you can continue operations during an attack, even if at a degraded state. 
	* Also ensure the organization rapidly bounces back to full operations.

### Security disciplines
Cloud migration affects each security discipline differently. 

Each of these disciplines is important and requires continuous investment and improvement as you adopt the cloud.

* Access control: Apply network and identity create access boundaries and segmentation to reduce the frequency and reach of any security breaches.
* Security operations: Monitor IT operations to detect, respond, and recover from a breach. Use data to continuously reduce risk of breach.
* Asset protection: Maximize protection of infrastructure, devices, data, applications, networks, and identities to minimize risk to the overall environment.
* Security governance: Monitor decisions, configurations, and data to govern decisions made across the environment and within all workloads across the portfolio.

* Innovation security: 
	* Integrate security into your DevOps models to improve security and safety assurances as you increase the pace of innovation in your organization. 
	* To avoid expensive security incidents and late-stage mitigation, security must become an integral part of a DevSecOps process. 
	* Empower workload teams to quickly identify and mitigate security risks.



## Security roles and responsibilities
Individual security team members must see themselves as part of a security team that's part of the whole organization. 

They're also part of a larger security community that defends against the same adversaries.

This holistic view enables the team to work well in general. 

It's especially important as teams work through any unplanned gaps and overlaps discovered during the evolution of roles and responsibilities.

### Security responsibilities (functions)
This diagram depicts the specific organizational functions within security. 

It represents an ideal view of a complete enterprise security team and might be an aspirational view for some security teams. 

One or more people can perform each function. 

Each person can perform one or more functions based on factors like culture, budget, and available resources.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-security/media/security-organizational-functions.png)

The following articles provide information about each function and include a summary of objectives. 

They discuss how the function can evolve because of the threat environment or cloud technology changes. 

They also explore the relationships and dependencies that are critical to the function's success.

* [Policy and standards](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-policy-standards)
* [Security operations](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-operations-center)
* [Security architecture](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-architecture)
* [Security compliance management](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-compliance-management)
* [People security](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-people)
* [Application security and DevSecOps](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-application-security-devsecops)
* [Data security](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-data-security)
* [Infrastructure and endpoint security](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-infrastructure-endpoint)
* [Identity and key management](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-identity-keys)
* [Threat intelligence](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-threat-intelligence)
* [Posture management](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-posture-management)
* [Incident preparation](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/organize/cloud-security-incident-preparation)

The following diagram summarizes the roles and responsibilities in a security program to help you familiarize yourself with these roles:

![DIAGRAM](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-security/media/security-roles-responsibilities.png)

### Map security to business outcomes
At the organizational level, the security disciplines map to standard plan-build-run phases seen widely across industries and organizations. 

This cycle is accelerating into a continuous change cycle with the digital age and the advent of DevOps. 

It also illustrates how security maps to normal business processes.

Security is a discipline with its own unique functions. 

Integration into normal business operations is a critical element.

### Role types
In the preceding diagram, the dark labels group these responsibilities into typical roles that have common skill sets and career profiles. 

These groupings also help provide clarity on how industry trends affect security professionals.

* Security leadership: 
	* These roles frequently span across functions. 
	* They ensure that teams coordinate with each other, prioritize, and set cultural norms, policies, and standards for security.

* Security architect: 
	* These roles span across functions and provide a key governance capability to ensure all the technical functions work harmoniously within a consistent architecture.

* Security posture and compliance: 
	* This newer role type represents the increasing convergence of compliance reporting with traditional security disciplines like vulnerability management and configuration baselines. 
	* While the scope and audience are different for security and compliance reporting, they answer different versions of the question "How secure is the organization?" 
	* The way that question is answered is growing more similar via tools like Microsoft Secure Score and Microsoft Defender for Cloud.
		* The use of on-demand data feeds from cloud services reduces the time required to report compliance.
		* The increased scope of data available enables security governance to look beyond traditional software updates or patches and discover and track "vulnerabilities" from security configurations and operational practices.

* Platform security engineer: 
	* These technology roles focus on platforms that host multiple workloads focused on access control and asset protection. 
	* These roles are often grouped into teams with specialized technical skill sets. 
	* They include network security, infrastructure and endpoints, and identity and key management. 
	* These teams work on preventive controls and detective controls, with detective controls being a partnership with SecOps and preventive controls being primarily a partnership with IT operations. 
	* For more information, see [Security integration](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/secure/security-integration).

* Application security engineer: 
	* These technology roles focus on security controls for specific workloads and support classic development models and modern DevOps/DevSecOps models. 
	* They blend application and development security skills for unique code and infrastructure skills for common technical components like VMs, databases, and containers. 
	* These roles might be in central IT or security organizations, or within business and development teams based on organizational factors.


### Modernization
Security architecture is affected by different factors:

* **Continuous engagement model:** 
	* Continuous release of software updates and cloud features makes fixed engagement models obsolete. 
	* Architects should be engaged with all teams working in technical topic areas to guide decision making along those teams' capability lifecycles.

* **Security from the cloud:** 
	* Incorporate security capabilities from the cloud to reduce enablement time and ongoing maintenance costs like hardware, software, time, and effort.

* **Security of the cloud:** 
	* Ensure coverage of all cloud assets including software as a service (SaaS) applications, infrastructure as a service (IaaS) VMs, and platform as a service (PaaS) applications and services. 
	* Include discovery and security for both sanctioned and unsanctioned services.

* **Identity integration:** 
	* Security architects should ensure tight alignment with identity teams to help organizations meet the dual goals of enabling productivity and providing security assurances.

* **Integration of internal context in security designs such as context from posture management and incidents investigated by security operations center:** 
	* Include elements like relative risk scores of user accounts and devices, data sensitivity, and key security-isolation boundaries to actively defend.



## Simplify compliance and security
To speed up implementing the security your organization needs for the cloud, use the Azure Security Benchmark and the landing zones in the Microsoft Cloud Adoption Framework for Azure.

The Azure Security Benchmark represents the recommended security practices from Microsoft. 

The Azure Security Benchmark is integrated into the landing zones to simplify implementing these best practices.

### Security benchmarks
Security benchmarks are configuration baselines and best practices for securely configuring a system. 

Security benchmarks can help you quickly secure cloud deployments. 

Benchmark recommendations from your cloud service provider give you a starting point for selecting specific security configuration settings in your environment. 

Use the settings to quickly reduce risk to your organization.

The Azure Security Benchmark is frequently used to address common challenges for customers or service partners who:

* Are new to Azure and looking for security best practices to ensure a secure deployment of Azure services and application workloads.

* Want to improve the security posture of existing Azure deployments to prioritize top risks and mitigations.
 
* Need to evaluate the security features and capabilities of Azure services before they onboard and approve an Azure service into the cloud-service catalog.

* Must meet compliance requirements in highly regulated industries like government, finance, and healthcare. These customers need to ensure their service configurations of Azure meet strict security specifications. These specifications are defined in frameworks like the:
	* Center for Internet Security (CIS)
	* National Institute of Standards and Technology (NIST)
	* Payment Card Industry (PCI) 

The Azure Security Benchmark includes high-impact security recommendations to help you secure services you use in Azure. 

Think of the recommendations as general or organizational as they apply to most Azure services.

The Azure Security Benchmark recommendations are then customized for each Azure service. 

The security baselines are the service-specific applications of the benchmark controls. They contain service-level configuration guidance and details.

The Azure Security Benchmark documentation specifies security controls and service recommendations:

* [Security controls](https://learn.microsoft.com/en-us/security/benchmark/azure/overview): 
	* The Azure Security Benchmark recommendations are categorized by security controls. 
	* Security controls represent high-level, vendor-agnostic security requirements, like network security and data protection. 
	* Each security control has a set of security recommendations and instructions that help you implement those recommendations.

* Security baselines: When available, benchmark recommendations for Azure services include the Azure Security Benchmark recommendations that are tailored specifically for that service.


### Implement the Azure Security Benchmark
Implement the Azure Security Benchmark in three steps:

* Plan your implementation: 
	* Review the documentation for the enterprise controls and service-specific baselines. 
	* Plan your control framework and how it maps to guidance like CIS controls, NIST, and the PCI Data Security Standard framework.

* Monitor your compliance: 
	* Use the Microsoft Defender for Cloud regulatory compliance dashboard to monitor compliance with the Azure Security Benchmark status and other control sets.

* Establish guardrails: 
	* Automate secure configurations and enforce compliance with the Azure Security Benchmark and other requirements in your organization with Azure Policy.



## Simplify security implementation
Azure landing zones are a logical construct that captures everything that must be true to enable application migrations and development at scale in Azure. 

Landing zones consider all platform resources that are required to support your organization's application portfolio. 

Azure landing zones provide cloud adoption teams with a well-managed environment for their workloads.

Landing zones help with cloud adoption by creating better ways to organize resources, not just by type, but by organization, cost, and security.

When you design and implement an Azure landing zone, consider security throughout the process. 

The security design area focuses on considerations and recommendations for landing zone decisions. 

Azure Security Benchmarks are built into Azure landing zones to make adopting a strong security stance easier.

The security design area creates a foundation for security across Azure, hybrid, and multicloud environments. 

The security design considerations within the Azure landing zones focus on providing visibility into what's happening within the technical cloud estate.

Security monitoring and audit logging for Azure platform services are key components of a scalable framework. 

The security operations design considerations have in-scope security alerts, logs, and controls. 

They also include vulnerability management, shared responsibilities, and encryption and keys. 

You can later enhance this foundation with security guidance outlined in the Secure methodology of the Microsoft Cloud Adoption Framework for Azure.

Continue to learn about implementation options for Azure landing zones by reviewing the best practices in the [Ready methodology](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/) of the Cloud Adoption Framework. 

Those practices help you to choose how and when to refactor your landing zone to better fit your needs.

You can learn how Cloud Adoption Framework enterprise-scale landing zones can help your organization accelerate cloud adoption from months to weeks in the [Create a scalable and modular architecture with Azure landing zones](https://learn.microsoft.com/en-us/training/paths/enterprise-scale-architecture/) learning path.

### Security implementation best practices
Several key steps can help you to mitigate or avoid the business risk from cybersecurity attacks. 

They can also help you rapidly establish essential security practices in the cloud. 

Follow these steps to integrate security into your cloud adoption process.

Adhering to these steps helps you integrate security at critical points in the process. 

The goal is to avoid obstacles in cloud adoption and reduce unnecessary business or operational disruption.

These steps show you how to:

* Establish essential security practices.
* Modernize the security strategy.
* Develop a security plan.
* Secure new workloads.
* Secure existing cloud workloads.
* Govern to manage and improve security posture.

This [Get started guide](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/get-started/security) describes the key steps. 

Use it to help you rapidly establish essential security practices in the cloud and integrate security into your cloud adoption process.


### Security tools and policies
This unit describes which controls to add to this customer's environment to move closer to the Azure landing zones conceptual architecture and prepare the organization's security requirements.

Several tools and controls are available to help you quickly achieve a security baseline:

* [Microsoft Defender for Cloud](https://learn.microsoft.com/en-us/azure/defender-for-cloud/defender-for-cloud-introduction): Provides the tools needed to harden your resources, track your security posture, protect against cyberattacks, and streamline security management.

* [Microsoft Entra ID](https://learn.microsoft.com/en-us/security/benchmark/azure/baselines/aad-security-baseline): The default identity and access management service. Microsoft Entra ID provides an identity security score to help you assess your identity security posture relative to Microsoft's recommendations.

* [Microsoft Sentinel](https://learn.microsoft.com/en-us/azure/sentinel/overview): A cloud-native SIEM that provides intelligent security analytics for your entire enterprise, powered by AI.

* [Azure Distributed Denial of Service (DDoS) standard protection plan](https://learn.microsoft.com/en-us/azure/ddos-protection/ddos-protection-overview) (optional): Provides enhanced DDoS mitigation features to defend against DDoS attacks.

* [Azure Firewall:](https://learn.microsoft.com/en-us/azure/firewall/overview) A cloud-native and intelligent network firewall security service that provides threat protection for your cloud workloads running in Azure.

* [Web Application Firewall](https://azure.microsoft.com/products/web-application-firewall/): A cloud-native service that protects web apps from common web-hacking techniques such as SQL injection and security vulnerabilities such as cross-site scripting.

* [Privileged Identity Management (PIM)](https://learn.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-configure): A service in Microsoft Entra ID that lets you manage, control, and monitor access to important resources in your organization.

* [Microsoft Intune](https://learn.microsoft.com/en-us/mem/intune/fundamentals/what-is-intune): A cloud-based service that focuses on mobile device management and mobile application management.

### Baseline implementation for identifying and protecting sensitive business data
After the right tools are in place, make sure you have good policies in place to enforce proper use of those tools. 

Several policies apply to online and corporate-connected landing zones:

* [Enforce secure access, like HTTPS, to storage accounts](https://learn.microsoft.com/en-us/azure/storage/common/storage-require-secure-transfer): Configure your storage account to accept requests from secure connections only by setting the Secure transfer required property for the storage account. When you require secure transfer, any requests that originate from an insecure connection are rejected.

* [Enforce auditing for Azure SQL Database](https://learn.microsoft.com/en-us/azure/azure-sql/database/auditing-overview): Track database events and write them to an audit log in your Azure storage account, Log Analytics workspace, or event hubs.

* [Enforce encryption for Azure SQL Database](https://learn.microsoft.com/en-us/azure/azure-sql/database/transparent-data-encryption-tde-overview): Transparent data encryption helps protect SQL Database, Azure SQL Managed Instance, and Azure Synapse Analytics against the threat of malicious offline activity by encrypting data at rest.

* [Prevent IP forwarding](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-network-interface): IP forwarding enables a network interface attached to a VM to receive network traffic not destined for any of the IP addresses assigned to any of the network interface's IP configurations. You can also send network traffic with a different source IP address than the one assigned to one of a network interface's IP configurations. The setting must be enabled for every network interface that's attached to the VM that receives traffic that the VM needs to forward.

* [Ensure subnets are associated with network security groups (NSGs)](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview): Use an Azure NSG to filter network traffic to and from Azure resources in an Azure virtual network. An NSG contains security rules that allow or deny inbound network traffic to, or outbound network traffic from, several types of Azure resources. For each rule, you can specify the source and destination, port, and protocol.


