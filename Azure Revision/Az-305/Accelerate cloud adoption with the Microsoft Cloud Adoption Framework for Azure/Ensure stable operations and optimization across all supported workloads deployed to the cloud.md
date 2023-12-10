# _Ensure stable operations and optimization across all supported workloads deployed to the cloud_
As workloads are deployed to the cloud, operations are critical to success. 

In this learn module, you learn how to deploy an operations baseline to manage workloads in your environment. 

The module also covers how to enhance the baseline, both for workloads and for platforms.

Learning objectives:

* Evaluate levels of business commitment across your portfolio of workloads
* Deploy an operations baseline
* Customize the baseline to meet operations needs
* Centralize operations for core platforms
* Partner with workload teams for richer decentralized operations

## Establish business commitments
The first step in creating business alignment is ensuring that everyone uses the same terms. 

Most likely, the engineers in the IT department don't use the same words as business stakeholders.

Developing a cloud strategy is a perfect opportunity to align these terms and look into commitments between IT and the business. 

The following three words can help improve the conversation with business stakeholders: criticality, impact, and commitment.

After all teams are aligned on terms, you should document and store that information for easy access.

### Criticality
How critical is the workload for the business? If you ask users, most say that their daily workload is the most critical one, but this conversation needs to be held from a business overview perspective.

A company-wide scale for criticality makes sure everyone involved in the conversation means the same thing. 

The following list is an example of a criticality scale:

* **Mission-critical:** The workload affects the company's mission and might noticeably affect corporate profit-and-loss statements.
* **Unit-critical:** The workload affects the mission of a specific business unit and its profit-and-loss statements.
* **High:** The workload might not affect the company's mission, but affects high-importance processes.
* **Medium:** Impact on processes is likely. Losses are low or immeasurable, but brand damage or upstream losses are possible.
* **Low:** Impact on business processes isn't measurable. No brand damage or upstream losses are likely. Localized impact on a single team is expected.
* **Unsupported:** No business owner, team, or process associated with this workload can justify any investment in the workload's ongoing management.

Some workloads might not be classified as critical, but can be vital indirectly. 

For example, if a noncritical compliance-management tool goes offline, maintaining business-critical compliance requirements is challenging. 

It can affect the company's mission in the long term.

A workload can also be critical because the customers who bring the most income use it. 

Another soft-cost factor can be that the board or CEO is using the workload daily.

Instead of walking through every workload, you can decide on a default criticality (for example, medium) for all workloads. 

A default criticality makes it easier to identify workloads that need higher or lower criticality classification.

### Impact
The business needs to understand what an outage costs. 

The output of the impact conversation is used to balance investments for cloud management.

The most common metric for impact is impact per hour, meaning operating revenue losses per hour of outage. 

To estimate impact per hour, you can look into the historical data of a previous outage. 

Also work with the finance department to determine the best approach to estimate loss per hour. 

If you can't find any financial data, you can use the percentage of affected customers to measure impact.

### Commitment
Documented commitments between the business and IT create a true partnership. 

All businesses have workloads that are key to the company. 

If any of these key workloads fail, the entire company is affected. 

On the other side of the scale, some workloads can be offline for months without any notice. 

These workloads should be managed in different ways.

Business commitments are about finding the balance between the level of operational management and operating cost.

For most workloads, a baseline level is enough. 

Critical workloads make it easier to justify double management costs because of any business interruption's potential impact.

### Management baseline
The first business commitment comes in the form of a promise to deliver a set level of services for operations management. 

Those services are called a management baseline. 

Based on the services included in the baseline, central IT can easily calculate a minimum service-level agreement (SLA) that applies to everything deployed to a controlled cloud platform.

### Management of higher-impact areas
The second business commitment focuses on what else is needed from operations for various platforms and workloads. 

Any platform or workload with higher levels of criticality or impact likely needs more than the minimum SLA.

To complete the business commitment, it's important to document the group or groups responsible for managing higher levels of day-to-day operations for those workloads. 

It can be a centralized responsibility with a central IT team or a mixed model between different groups.



## Deploy an operations baseline
The discipline of operational compliance is the cornerstone for maintaining the balance between security, governance, performance, and cost. 

Effective operational compliance requires consistency in a few critical processes:

* **Resource consistency:** If all resources are organized the same way and tagged the same way, other management tasks become more manageable.

* **Environment consistency:** If all landing zones are organized the same way, then management and troubleshooting become much more manageable.

* **Resource configuration consistency:** As with resources and landing zones, it's crucial to monitor resource configuration. If a configuration setting is changed, it can trigger an automation job to restore the environment.

* **Resource optimization:** Regular monitoring of resource performance reveals trends in resource utilization and opportunities to optimize the cost and performance of each resource.

* **Update consistency:** All updates to the environment should be done in a scheduled, controlled, and possibly automated way. Controlled change management reduces unnecessary outages and troubleshooting.

* **Remediation automation:** Automation for quick remediation of common incidents is a great way to increase customer satisfaction and minimize outages. However, you should fix known issues by their root causes. Fixing a root cause is often a long process, and automation is a quick fix.

Operational compliance can be fulfilled per workload; for example, in one of your landing zones.

The following table lists some of the Azure tools for operational compliance. 

Remember that not all of these tools need to be part of the default management baseline.

Tool | Description | Link to more information
--- | --- | ---
Azure Automation Update Management | Management and scheduling of updates | [Update Management overview](https://learn.microsoft.com/en-us/azure/automation/update-management/overview)
Azure Policy | Policy enforcement to ensure environmental and guest compliance | [Azure Policy overview](https://learn.microsoft.com/en-us/azure/governance/policy/overview)
Azure Blueprints | Automated compliance for core services | [Azure Blueprints overview](https://learn.microsoft.com/en-us/azure/governance/blueprints/overview)
Azure Automation State Configuration | Automated configuration on the guest OS and some aspects of the environment | [State Configuration overview](https://learn.microsoft.com/en-us/azure/automation/automation-dsc-overview)



## Protect and recover
Protection and recovery are the third and final discipline in a cloud-management baseline. 

For an enterprise environment, this table outlines the suggested minimum for any management baseline:

Tool | Description | Link to more information
--- | --- | ---
Azure Backup | Backup of data and virtual machines in Azure | [Azure Backup overview](https://learn.microsoft.com/en-us/azure/backup/backup-overview)
Microsoft Defender for Cloud | Strengthened security and advanced threat protection | [Microsoft Defender for Cloud product page](https://azure.microsoft.com/services/security-center/)

Another essential tool is Azure Site Recovery. 

Azure Site Recovery replicates virtual machines and workloads between clouds, Azure regions, or local datacenters. 

When an outage occurs in your primary Azure region, your workload (for example, virtual machines) fails over to the copy running in the secondary Azure region. 

The workload is then online in the secondary site or region.

This approach to recovery can significantly reduce recovery times. 

Most likely, the default management baseline includes Azure Site Recovery. 

For your most critical workloads, it can be a suitable protection.

An older IT environment often has one backup solution with one configuration. 

Azure makes it easy to deploy a backup vault for each workload if needed. 

With separate backup vaults, you can handle both permissions to back up data and showback for the backup cost.



## Enhance an operations baseline
So far in this module, we've talked about the three cloud-management disciplines, which we call a management baseline. 

This unit looks beyond the default management baseline.

There are most likely workloads in your environment that require more management services than the ones described in the management baseline. 

An enhanced management baseline is often a low-operations investment, compared to workload or platform specialization.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-manage/media/overview-002.png)

If most of your workloads require more than your default management baseline, it's a good idea to review the management baseline. 

It's also a good idea to review your management baseline when new services are implemented or new Azure features are released. 

For example, if your company implements an IT Service Management (ITSM) solution, a connection to automate incident creation adds to the enhanced operations baseline.

Workload specialization is for the most mission-critical workloads, which make up about 20 percent of the workloads.

Platform specialization is for the platform or platforms that run the most high-criticality workloads. 

The specialized platform investment is often divided over many workloads.

The following table shows some of the most common enhancements to a management baseline:

Tool | Description | Link to more information
--- | --- | ---
Azure Resource Graph | Visibility into changes to Azure resources that might help detect negative effects sooner or remediate faster | [Azure Resource Graph product page](https://azure.microsoft.com/features/resource-graph/)
IT Service Management Connector | Automated ITSM connection to create awareness sooner and enrich work items | [IT Service Management Connector overview](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/itsmc-overview)
Azure Automation | Automation of: <br /> * Responses to changes <br /> * Resource-specific scaling or sizing issues <br /> * Operations across multiple clouds | [Azure Automation product page](https://azure.microsoft.com/services/automation/)
Azure Automation State Configuration | Code-based configuration of guest operating systems to reduce configuration drifting and quickly find errors | [State Configuration overview](https://learn.microsoft.com/en-us/azure/automation/automation-dsc-overview)
Microsoft Defender for Cloud | Extended protection to include recovery triggers for security breaches | [Microsoft Defender for Cloud product page](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-manage/5-enhance-operations-baseline#:~:text=Microsoft%20Defender%20for%20Cloud%20product%20page)



## Manage platform and workload specialization
### Workload specialization
Workload-specific management usually requires in-depth knowledge about the specific workload, which is why the workload team or development team often does it. 

A workload-specific solution doesn't scale quickly to other workloads. 

Centralized IT can still guide and share knowledge with the workload-specialized team on operations.

### Platform specialization
Decentralized, workload-specific operations aren't scalable across an enterprise, but a study of the portfolio often identifies common platforms on which those workloads run. 

Those technology platforms (also known as technology stacks) are often at the heart of workload-specific incidents. 

When priority workloads share a common technology platform, it might be more valuable for central IT to focus on improving those platforms' operations, and thereby reduce or avoid workload-specific operations.

Examples of technology platforms might include data platforms, analytics platforms, container platforms, Azure Virtual Desktop platforms, enterprise resource planning (ERP) platforms, or even mainframes.

### Advanced operations
Platform and workload specialization consists of disciplined execution of the following four processes in an iterative approach:

* **Improve system design:** 
	* Technical debt and architectural flaws are the root cause of most business workload outages. 
	* By reviewing the platform or workload design, you can improve stability. 
	* The Azure Well-Architected Framework includes recommendations for improving the quality of the platform or a specific workload.

* **Automate remediation:** 
	* Some design improvements aren't cost-effective, because the technical debt can be too costly or complex to improve. 
	* In such cases, it might make more sense to automate remediation and reduce the effect of interruptions.

* **Scale the solution:** 
	* As system design and automated remediation are improved, those changes can be scaled across the environment through the service catalog. 
	* You can publish optimized platforms and solutions in Azure Managed Applications Center to easily reuse them for other workloads or external customers.

* **Continuously improve:** 
	* You'll gain valuable information for the next system review by collecting feedback from users, administrators, and customers. 
	* Collecting and visualizing critical system logs and performance data are also important. 
	* Both the feedback and the data collected will be used as a foundation for making new decisions about future system improvements.

The following table shows tools used for workload-specific management:

Tool | Description | Link to more information
--- | --- | ---
Application Insights | Advanced application monitoring with dependency mapping, application dashboard, application map, usage, and deep tracking | [Application Insights overview](https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview)

