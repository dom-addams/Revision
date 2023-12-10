# Microsoft Azure Well-Architected Framework - Reliability
Learn about Azure high availability, disaster recovery, and backup and restore solutions to incorporate reliability into your architecture.

Learning objectives:

* Use Azure services to design highly available architectures.
* Incorporate Azure disaster recovery capabilities into your architecture.
* Learn how Azure backup and restore capabilities can help protect your data and infrastructure.

## High availability
Imagine you're responsible for a system that must always be fully operational. 

Failures can happen, so you must ensure that your system remains online if something goes wrong. 

You must also carry out system maintenance and updates without service interruptions.

High availability (HA) ensures that your architecture can handle failures and maintenance events. 

In this unit, you learn how to evaluate an application for HA, and how to use Azure platform technologies and services to help meet your availability goals.

### High availability concepts
A highly available service absorbs temporary failures in dependent services and hardware and fluctuations in availability and load. 

The application remains online and available, or appears to do so, while performing acceptably. 

Business requirements, service-level objectives, or service-level agreements often define the degree of availability.

HA describes the ability to handle the loss or severe degradation of a system component. 

The loss or degradation might be due to application hosts failing and going offline, planned maintenance or upgrades, or cloud service failures. 

Identify the places where your system can fail, and build in capabilities to handle those failures to ensure that the services you offer your customers can stay online.

HA for a service typically requires HA of the components that make up the service. 

### Evaluate an application for HA
This section explores the steps to evaluate an application for HA:

1. Determine the service-level agreement of your application.
1. Evaluate the HA capabilities of the application.
1. Evaluate the HA capabilities of dependent applications.

### Define the service-level agreement
A service-level agreement (SLA) is an agreement between a service provider and consumer in which the service provider commits to a standard of service based on measurable metrics and defined responsibilities. 

SLAs can be strict, legally bound, contractual agreements, or can be assumed expectations of availability by customers. 

Regardless of the specific metrics that make up the SLA, failure to meet the SLA can have serious financial ramifications for the service provider. 

A common component of service agreements is guaranteed financial reimbursement for missed SLAs.

Service metrics typically focus on service throughput, capacity, and availability, which can all be measured in various ways. 

Service-level objectives (SLO) are the target metric values that measure performance, reliability, or availability. 

These metrics could define request processing performance in milliseconds, availability of services in minutes per month, or the number of requests processed per hour.

To define the acceptable and unacceptable ranges for SLOs, evaluate the metrics your application exposes and determine how customers measure quality. 

By defining these objectives, you clearly set goals and expectations with both the teams that support the services and customers who consume the services. 

The SLOs determine whether your overall SLA is being met.

The following table shows the potential cumulative downtime for various SLA levels.

SLA | Downtime per week | Downtime per month | Downtime per year
--- | --- | ---
99% | 1.68 hours | 7.2 hours | 3.65 days
99.9% | 10.1 minutes | 43.2 minutes | 8.76 hours
99.95% | 5 minutes | 21.6 minutes | 4.38 hours
99.99% | 1.01 minutes | 4.32 minutes | 52.56 minutes
99.999% | 6 seconds | 25.9 seconds | 5.26 minutes

Everything else being equal, higher availability is better. 

But as you strive for higher availability, symbolized by more 9s in the SLA, the cost and complexity to achieve that level increases. 

An 99.99% uptime means about five minutes of total downtime per month. 

Whether it's worth the added complexity and cost to reach five 9s depends on your business requirements.

Here are some other factors to consider when you define an SLA:

* To achieve four 9s, or 99.99%, you probably can't rely on manual intervention to recover from failures. The application must be self-diagnosing and self-healing.
* Beyond four 9s, it's challenging to detect outages quickly enough to meet the SLA.
* Consider the time window your SLA is measured against. The smaller the window, the tighter the tolerances. It probably doesn't make sense to define your SLA in terms of hourly or daily uptime.

Identifying SLAs is an important first step to determine the HA capabilities your architecture requires. 

The SLAs help shape the methods you use to make your application highly available.

### Evaluate application HA capabilities
To evaluate the HA capabilities of your application, perform a failure analysis. 

Focus on single points of failure and critical components that would have a large impact on the application if they were unreachable, misconfigured, or started behaving unexpectedly. 

For areas that have redundancy, determine whether the application is capable of detecting error conditions and self-healing.

You need to carefully evaluate all components of your application, including the pieces designed to provide HA functionality, such as load balancers. 

Single points of failure should either be modified to have HA capabilities, or be replaced with services that can provide HA capabilities.

### Evaluate dependent HA capabilities
You should understand not only your application's SLA requirements, but also the SLAs of any resource your application depends on. 

If you commit an uptime of 99.9% to your customers, but a service your application depends on has an uptime commitment of only 99%, you might not meet your SLA.

If a dependent service can't provide a sufficient SLA, you might modify your own SLA, replace the dependency with an alternative, or find ways to meet your SLA while the dependency is unavailable. 

Based on the scenario and the nature of the dependency, you might temporarily work around failing dependencies with solutions like caches and work queues.

### HA in Azure
Both hardware and software platform events can affect applications and systems. 

It's critical to design your application architecture to handle failures, and the Azure platform provides you with the tools and capabilities to make your application highly available.

The Azure platform provides HA over all its services. The following core technologies provide HA for Azure architectures:

* Availability sets
* Availability zones
* Load balancing
* Platform as a service (PaaS) HA capabilities

### Availability sets
Availability sets help ensure your application remains online if a high-impact maintenance event is required or hardware failures occur. 

Availability sets are a way to distribute virtual machines (VMs) that belong to the same application workload to prevent simultaneous impact from hardware failure and scheduled maintenance. 

Availability sets are made up of update domains (UDs) and fault domains (FDs).

Most updates have no impact on the VMs they run on, but sometimes VM hosts in an Azure datacenter need downtime for maintenance. 

UDs ensure that a subset of your application's servers always keep running during these downtimes.

To ensure that updates don't happen to a whole Azure datacenter at once, the datacenter is logically sectioned into UDs. 

A maintenance event, such as applying a performance update and critical security patch to the host, sequences through the UDs. 

Sequencing updates through UDs ensures that the whole datacenter isn't unavailable during platform updates and patching.

While UDs represent logical sections of the datacenter, FDs represent physical sections of the datacenter and ensure rack diversity of servers in an availability set. 

Placing your VMs in an availability set automatically spreads them across multiple FDs, so if there's a hardware failure, only some of your VMs are affected.

FDs align to the physical separation of shared hardware in the datacenter, including power, cooling, and network hardware that supports the servers in server racks.

If the hardware that supports a server rack becomes unavailable, the outage affects only that rack of servers.

### Availability zones
Availability zones are independent physical datacenter locations within a region that include their own power, cooling, and networking. 

Accounting for availability zones when you deploy resources helps you protect workloads from datacenter outages while you retain presence in a particular region.

Services like VMs are zonal services that allow you to deploy to specific zones within a region. 

Other services are zone-redundant services that replicate across the availability zones in the specific Azure region. 

Both service types ensure that there are no single points of failure within an Azure region.

Supported regions contain a minimum of three availability zones. 

When you create zonal service resources in those regions, you can select the zone to create the resource in. 

This ability lets you design your application to withstand a zonal outage and continue to operate in an Azure region instead of having to evacuate your application to another region.

Availability zones are a newer HA service that's currently available for certain regions. 

If you want to consider this functionality, be sure to check the service availability in the region where you plan to deploy your application. 

Availability zones are supported for VMs and for several PaaS services. 

Availability zones are mutually exclusive with availability sets. 

When you use availability zones, you no longer need to define availability sets for your systems. 

You have diversity at the datacenter level, and updates are never done to multiple availability zones at the same time.

### Load balancing
Load balancers manage how to distribute network traffic across an application. 

Load balancers are essential to keep your application resilient to individual component failures and to ensure your application is available to process requests. 

Applications that don't have built-in service discovery require load balancing for both availability sets and availability zones.

There are several Azure load-balancing services, each with distinct network traffic routing abilities. 

Use one or a combination of these technologies to help ensure you have the necessary options to architect a highly available solution for routing network traffic through your application.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-reliability/media/2-azure-load-balancer.png)

In the preceding diagram, Azure Traffic Manager balances the load between two regions. 

Within each region, Azure Application Gateway distributes the load among VMs in the web tier based on the type of request. 

Azure Load Balancer distributes further requests among the VMs in the database tier.

* Traffic Manager 
	* Provides global Domain Name System (DNS) load balancing. 
	* Consider using Traffic Manager to provide load balancing of DNS endpoints within or across Azure regions. 
	* Traffic Manager distributes requests to available endpoints and uses endpoint monitoring to detect and remove failed endpoints.

* Application Gateway 
	* Provides Layer 7 load-balancing capabilities, such as round-robin distribution of incoming traffic, cookie-based session affinity, URL path-based routing, and the ability to host multiple websites behind one gateway. 
	* Application Gateway monitors the health of all resources in its backend pool by default, and automatically removes unhealthy resources from the pool. 
	* Application Gateway continues to monitor the unhealthy instances and adds them back to the pool once they're available and healthy.

* Azure Load Balancer
	* Layer 4 load balancer. 
	* You can configure public and internal load-balanced endpoints and define rules to map inbound connections to backend destinations. 
	* Load Balancer can use TCP and HTTP health-probing options to help manage service availability.

### PaaS HA capabilities
Azure PaaS services come with HA built in. 

Services such as Azure SQL Database, Azure App Service, and Azure Service Bus include HA features and ensure that individual component failures are seamless to your application. 

Using PaaS services is one of the best ways to ensure that your architecture is highly available.

In summary, when you architect for HA, you should first understand the SLA that you commit to your customers. 

Then evaluate the HA capabilities of your application, and the HA capabilities and SLAs of dependent systems. 

After you evaluate your SLA and HA capabilities, use Azure features like availability sets, availability zones, and load-balancing technologies to add HA to your application. Azure PaaS services have HA capabilities built in.



## Disaster recovery
Designing for high availability helps keep an application or process running despite unfavorable events and adverse conditions. 

But significant occurrences can still happen where you lose data or it's impossible to keep your apps and processes from going down.

When disaster strikes, you need to have a recovery plan to get your services running again. 

You should know your goals and expectations for recovery, the costs and limitations of your recovery plan, and how to execute the plan. 

This unit covers how to promote reliability by planning for and recovering from disasters.

### Disaster recovery concepts
A disaster is a single, major event with a larger and longer-lasting impact than an application can mitigate through the high availability part of its design. 

Disaster recovery (DR) is about recovering from high-impact events that result in downtime and data loss.

The word disaster often evokes thoughts of natural disasters and external events like earthquakes, floods, and tropical storms, but many other kinds of disasters exist. 

A failed deployment or upgrade can leave an app in an unrecognizable state. 

Malicious hackers can encrypt or delete data and inflict other kinds of damage that take an application offline or eliminate some of its functionality.

Regardless of the cause, the best remedy for a disaster is a well-defined and tested DR plan and an application design that actively supports DR.

### Create a disaster recovery plan
A disaster recovery plan is a document that details the procedures required to recover from data loss and downtime caused by a disaster. 

The document identifies who's in charge of directing the procedures. 

Operators should be able to use the plan as a manual to restore application connectivity and recover data after a disaster.

A detailed, written plan dedicated to DR is critical to a favorable outcome. 

Creating a disaster recovery plan requires expert knowledge of the application's workflows, data, infrastructure, and dependencies. 

The process of creating the plan helps assemble a complete picture of the application. 

The resulting written steps promote good decision-making and follow-through in the panicked, chaotic aftermath of a disaster.

To create a DR plan, first do a risk assessment and process inventory for your application. 

Then define your recovery objectives, and then detail the recovery steps to achieve the objectives.

### Risk assessment and process inventory
The first step in creating a DR plan is to do a risk analysis that examines the impact of different kinds of disasters on the application. 

The exact nature of a disaster isn't as important to the risk analysis as its potential impact through data loss and application downtime.

Explore various kinds of hypothetical disasters and try to be specific when thinking about their effects. 

For example, a targeted malicious attack might modify code or data that results in a different kind of impact than an earthquake that disrupts network connectivity and datacenter availability.

The risk assessment needs to consider every process that can't afford unlimited downtime, and every category of data that can't afford unlimited loss. 

When a disaster occurs that affects multiple application components, plan owners must be able to use the plan to completely inventory the components and prioritize each item.

Applications that consist only of a single process or data classification are still important to include. 

These applications might be single components of a larger DR plan that includes multiple applications within the organization.

### Recovery objectives
A complete DR plan must specify the following critical business requirements for each process the application implements:

* Recovery Point Objective (RPO) 
	* The maximum duration of acceptable data loss. 
	* RPO is measured in units of time, not volume, such as "30 minutes of data" or "four hours of data". 
	* RPO is about limiting and recovering from data loss, not data theft.

* Recovery Time Objective (RTO) 
	* The maximum duration of acceptable downtime, where "downtime" is defined by your specification. 
	* For example, if the acceptable downtime duration in a disaster is eight hours, then the RTO is eight hours.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-reliability/media/3-rto-rpo.png)

Each major process or workload that an application implements should have separate RPO and RTO values. 

Even if you arrive at the same values for different processes, you should generate each value through a separate analysis that examines disaster-scenario risks and potential recovery strategies.

The process of specifying an RPO and RTO effectively creates DR requirements for your application. 

You must establish the priority of each workload and data category and do a cost-benefit analysis. 

The analysis includes the following concerns:

* Implementation and maintenance cost
* Operational expense
* Process overhead
* Performance impact
* Impact of downtime and data loss

You must define exactly what "downtime" means for your application, and in some cases you might establish separate RPO and RTO values for different levels of functionality. 

Specifying RPO and RTO should be more than simply choosing arbitrary values. 

Much of the value of a DR plan comes from the research and analysis that goes into discovering the potential impact of a disaster and the cost of mitigating the risks.

### Recovery steps
The final plan should detail exactly what steps to take to restore lost data and application connectivity. 

Recovery steps often include information about the following components:

* **Backups:** How often backups are created, where they're located, and how to restore data from them.
* **Data replicas:** The number and locations of replicas, the nature and consistency of the replicated data, and how to switch over to a different replica.
* **Deployments:** How deployments are executed, how rollbacks occur, and failure scenarios for deployments.
* **Infrastructure:** On-premises and cloud resources, network infrastructure, and hardware inventory.
* **Dependencies:** External services that the application uses, including their SLAs and contact information.
* **Configuration and notification:** Flags or options that can be set to gracefully degrade the application, and services that notify users of application impact.

The exact required steps depend heavily on the application's implementation details, so it's important to keep the plan updated. 

Routinely test the plan to help identify gaps and outdated sections.

### Design for DR
DR isn't an automatic feature, but must be designed, built, and tested. 

To support a solid DR strategy, you must build an application with DR in mind from the ground up. 

Azure offers services, features, and guidance to help you support DR when you create apps, but it's up to you to include those capabilities in your design.

Designing for disaster recovery has the following main concerns:

* Data recovery uses backups and replication to restore lost data.
* Process recovery recovers services and deploys code to recover from outages.

### Data recovery and replication
Replication duplicates data in multiple data store replicas. 

Unlike backup, which creates long-lived, read-only snapshots of data to use for recovery, replication creates real-time or near-real-time copies of live data. 

The goal of replication is to keep replicas synchronized with as little latency as possible while maintaining application responsiveness. 

Replication is a key component of designing for high availability and disaster recovery (HADR), and is a common feature of production-grade applications.

Replication mitigates a failed or unreachable data store by executing a failover, which changes application configuration to route data requests to a working replica. 

Error detection built into a data-storage product, or that you implement through a monitoring solution, can trigger and often automate failover. 

Depending on the implementation and scenario, system operators might need to manually perform failover.

Different replication designs place different priorities on data consistency, performance, and cost.

* Active replication requires updates to take place on multiple replicas simultaneously, guaranteeing consistency at the cost of throughput.
* Passive replication does synchronization in the background, removing replication as a constraint on application performance, but increasing RPO.
* Active-active or multimaster replication enables using multiple replicas simultaneously, enabling load balancing at the cost of complicating data consistency.
* Active-passive replication reserves replicas for live use during failover only.

You don't implement replication from scratch. 

Most fully featured database systems and other data-storage products and services include some kind of replication as a tightly integrated feature, due to its functional and performance requirements. 

It's up to you to include these features in your application design and use them appropriately.

The following Azure services support different replication levels and concepts:

* Azure Storage 
	* Replication capabilities depend on the type of replication you select for the storage account. 
	* The replication can be local within a datacenter, zonal between datacenters within a region, or regional between regions. 
	* Application and operators don't interact with replication directly. 
	* Failovers are automatic and transparent, and you simply need to select a replication level that balances cost and risk.

* Azure SQL Database 
	* Replication is automatic at a small scale, but recovery from a full Azure datacenter or regional outage requires geo-replication. 
	* Setting up geo-replication is manual, but it's a first-class Azure SQL Database feature that's well-supported by documentation.

* Azure Cosmos DB 
	* Globally distributed database system, and replication is central to its implementation. 
	* With Azure Cosmos DB, you can configure options for database regions, data partitioning, and data consistency.

> Neither replication nor backup are complete DR solutions on their own. 
> Data recovery is only one component of DR, and replication doesn't fully satisfy many DR scenarios. 


### Process recovery
After a disaster, business data isn't the only asset that needs recovering. 

Disaster scenarios also commonly result in downtime, whether due to network connectivity problems, datacenter outages, damaged virtual machines (VMs), or corrupted software deployments. 

Your application design must let you restore the application to a working state.

In most cases, process restoration involves failover to a separate, working deployment. 

Depending on the scenario, geographic location might be a critical aspect. 

For example, a large-scale natural disaster that brings an entire Azure region offline necessitates restoring service in another region.

Your application's DR requirements, especially RTO, should drive your design and help you make the following decisions:

* How many replicated environments to have.
* Where to locate the environments.
* Whether to maintain the environments in a ready-to-run state.
* Whether the environments should be ready to accept a deployment in a disaster.

Depending on your application design, you can use several different strategies and Azure features to improve your application's support for process recovery after a disaster.

### Azure Site Recovery
Azure Site Recovery is a service that manages process recovery for workloads running on VMs deployed to Azure, VMs on physical servers, and directly on physical servers. 

Site Recovery replicates workloads to alternate locations, helps you fail over when an outage occurs, and supports testing of a DR plan.

Site Recovery supports replicating VMs, physical server images, and individual workloads. 

A workload might be an individual application or an entire VM or operating system with its applications. 

Any application workload can be replicated, but Site Recovery has first-class integrated support for many Microsoft server applications, such as SQL Server and SharePoint, and some third-party applications like SAP.

Investigate Site Recovery for any app that runs on VMs or physical servers as a great way to discover and explore scenarios and possibilities for process recovery.

#### Service-specific DR features
Most services that run on Azure platform as a service (PaaS) offerings like Azure App Service provide features and guidance to support DR. 

For some scenarios, you can use service-specific features to support fast recovery. 

For example, Azure SQL Server supports geo-replication for quickly restoring service in another region. 

Azure App Service has a Backup and Restore feature, and the documentation includes guidance for using Azure Traffic Manager to support routing traffic to a secondary region.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-reliability/media/3-region-pairs.png)

### DR plan testing
DR planning doesn't end once you have a completed plan. 

Testing the plan to ensure that the directions and explanations are clear and up to date is a crucial aspect of DR planning.

Choose intervals to do different types and scopes of tests. 

For example, test backups and failover mechanisms every month and do a full-scale DR simulation every six months. 

Always follow the steps and details exactly as the plan documents. 

Consider having someone unfamiliar with the plan give perspective on anything that could be made clearer. 

As you run the test, identify gaps, areas of improvement, and places to automate, and add these enhancements to your plan.

Make sure to include your monitoring system in your testing. And include failure detection and triggering of automated failover in the plan and testing.

By carefully identifying your DR requirements and laying out a plan, you can determine what types of services you need to meet your DR objectives. 

Azure provides several services and features to help you meet these objectives.



## Processes for backup and restore
This unit describes backup and recovery as a powerful line of defense against permanent data loss. 

An effective backup strategy requires more than simply copying data, but should take your application's data architecture and infrastructure into account.

Applications can manage many data types of varying importance, spread across filesystems, databases, and other storage services in the cloud and on-premises.

Using the right services and products for each backup simplifies the backup process and decreases recovery time if a backup needs to be restored.

### Requirements for backup and restore
As with a disaster recovery strategy, you base backup requirements on a cost-benefit analysis. 

Guide the analysis of your application's data by the relative importance of the data categories the app manages. 

Also consider external requirements such as data retention laws.

To establish backup requirements for your application, group its data types based on the following requirements:

* How much of this type of data can afford to be lost, measured in duration.
* The maximum amount of time a restore of this type of data should require.
* Backup retention requirements, such as how long and how often backups must remain available.

These concepts map to the concepts of Recovery Point Objective (RPO) and Recovery Time Objective (RTO). 

The duration of acceptable loss generally translates to required backup intervals and RPO. 

The maximum amount of time a restore takes corresponds to the RTO for your application's data components.

Develop both requirements relative to the cost of achieving them. 

No organization wants to say that they can afford to lose any data, but that might change when they consider the cost of achieving that requirement.

Backup plays a role in disaster recovery (DR), but backups, restores, and their associated scenarios extend beyond the scope of DR. 

Backups might need to be restored in nondisaster situations, including scenarios where RTO and RPO aren't a concern.

Your DR plan might or might not include guidance for doing restores in nondisaster situations.

> Don't confuse archival or replication with backup. 
> Archival is storing data for long-term preservation and read access. 
> Replication is near-real-time copying of data between replicas to support high availability and some DR scenarios.


### Azure backup and restore services
Azure offers several backup-related services and features for Azure and on-premises data. 

Most Azure services offer some kind of backup functionality. 

This section reviews several popular backup-related Azure offerings.

#### Azure Backup
Azure Backup is a family of backup products that back up data to Recovery Services vaults for storage and recovery. 

Recovery Services vaults are storage resources in Azure that are dedicated to holding data and configuration backups for virtual machines (VMs), servers, and individual workstations and workloads.

Backup serves as a general-purpose backup solution for cloud and on-premises workflows that run on VMs or physical servers. 

Backup is a drop-in replacement for traditional backup solutions that stores data in Azure instead of on archive tapes or other local physical media. 

Backup can add value and contribute to the backup and restore strategy for infrastructure as a service (IaaS) and on-premises applications of many sizes and shapes.

The following products and services can use Backup to create backups:

* Microsoft Azure Recovery Services (MARS) agent 
	* A Windows application that backs up files, folders, and system state from the Windows VM it's installed on. 
	* It works like many consumer cloud-based backup solutions, but requires configuring a Recovery Services vault. 
	* Once you download and install the agent onto a Windows server or VM, you can configure it to create backups up to three times a day.

* System Center Data Protection Manager 
	* A robust, fully featured, enterprise-level backup and recovery system for Windows Server. 
	* Data Protection Manager can back up file systems and Windows and Linux VMs, create bare-metal backups of physical servers, and do application-aware backups of server products like SQL Server and Exchange. 
	* Data Protection Manager is part of System Center, which licenses and sells it. 
	* It's part of the Backup family because it can store backups in a Recovery Services vault.

* Microsoft Azure Backup Server (MABS) 
	* Similar to Data Protection Manager, but is licensed as part of an Azure subscription and doesn't require a System Center license. 
	* Azure Backup Server supports the same functionality as Data Protection Manager, except for local tape backup and integration with System Center products.

* Azure VM backup 
	* A turnkey backup and restore feature that supports scheduled backups for Azure Windows and Linux VMs. 
	* VM backup supports recovery of individual files, full disks, and entire VMs, and can also do application-consistent backups. 
	* You can make individual applications aware of backup operations so they get their filesystem resources into a consistent state before the snapshot is taken.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-reliability/media/4-azure-backup.png)


#### Azure Blob Storage
Azure Storage doesn't include automated backup, but blobs are commonly used to back up all kinds of data from various sources. 

Many services that provide backup capabilities use blobs to store their data, and blobs are a common target for scripts and tools in every backup scenario.

Azure general purpose v2 storage accounts support three different Blob Storage tiers of varying performance and cost. 

Cool storage offers the best cost-to-performance ratio for most backups, while hot storage offers lower access costs but higher storage costs. 

Archive storage might be appropriate for secondary backups or backups of data with low expectations for recovery time. 

Archive storage is low cost but requires up to 15 hours of lead time to access.

Immutable blob storage is configurable to be nonerasable and nonmodifiable for a user-specified interval. 

Immutable blob storage primarily fulfills strict requirements for certain kinds of data, such as financial data, and is a great option for ensuring that backups are protected against accidental deletion or modification.

#### Azure SQL Database
Comprehensive, automatic backup functionality is included with Azure SQL Database at no extra charge. 

SQL Database backup is enterprise-grade, production-ready, and enabled by default.

SQL Database creates full backups weekly, differential backups every 12 hours, and log backups every five minutes. 

You can use a SQL Database backup to restore a database to a specific point in time, even if the database has been deleted. 

You can do restores by using the Azure portal, PowerShell, or the REST API. Backups for databases encrypted with Transparent Data Encryption (TDE), enabled by default, are also encrypted.

If you're evaluating different database options for an application, you should include backup and restore as part of the cost-benefit analysis, because it's a significant benefit of SQL Database. 

Every application that uses SQL Database should take advantage of its backup and restore capabilities by including them in its DR plan and backup/restore procedures.

#### Azure App Service
Web applications hosted in Azure App Service Standard and Premium tiers support turnkey scheduled and manual backups. 

Backups include application configuration, file contents, and database contents, and support simple filters for excluding files. 

Restore operations can target different App Service instances, making App Service backup a simple way to move one application's contents to another application.

App Service backups are limited to 10 GB total, including application and database content, and are a good solution for applications under development and small-scale applications. 

Mature applications don't generally use App Service backup. 

These applications rely on robust deployment and rollback procedures, storage strategies that don't use application disk storage, and dedicated backup strategies for databases and persistent storage.

### Testing and verification for backup and restore
No backup system is complete without a strategy for verifying backups and testing restore procedures. 

Even if you use a dedicated backup service or product, you should still document and practice recovery procedures to ensure that everyone understands them. 

Make sure that the procedures always return the system to the expected state.

Strategies for verifying backups vary and depend on the nature of your infrastructure. 

You might consider techniques like creating a new deployment of the application, restoring the backup to it, and comparing the states of the two instances. 

In many cases, this technique closely mimics actual DR procedures.

Simply comparing a subset of the backup data with the live data immediately after creating a backup might be enough verification. 

A common component of backup verification is attempting to restore old backups to ensure that they're still available and operational, and that the backup system hasn't changed to render them incompatible. 

Any strategy is better than finding out that your backups are corrupted or incomplete while attempting to recover from a disaster.

A backup and restore strategy is an important part of ensuring your architecture can recover from data loss or corruption. 

Review your architecture to define your backup and restore requirements, determine a backup plan to meet the requirements, and then test the process regularly. 

Azure provides several services and features to provide backup and restore capabilities for many architectures.

