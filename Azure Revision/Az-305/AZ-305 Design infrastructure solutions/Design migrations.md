# _Design migrations_
Azure Architects design and recommend migration solutions.

Learning objectives:

* Evaluate migration with the Microsoft Cloud Adoption Framework for Azure
* Describe the Azure Migration and Modernization Program (Azure Migration Framework)
* Assess your on-premises workloads
* Select a migration tool
* Migrate your databases
* Select an online storage migration tool
* Migrate offline data

## Evaluate migration with the Cloud Adoption Framework
The Microsoft Cloud Adoption Framework for Azure provides recommendations, best practice guidance, documentation, and tools to help you drive adoption of Azure in your organization. 

The Cloud Adoption Framework supports methodologies for defining your strategy, planning and preparing for your migration, and establishing organizational structure to align your teams and roles. 

You can migrate and modernize existing workloads and develop new cloud-native or hybrid solutions. 

You can employ Cloud Adoption Framework tools to govern your environment and workloads and manage operations for cloud and hybrid solutions.

The following diagram illustrates Cloud Adoption Framework methodologies within a cloud adoption lifecycle.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-migrations/media/cloud-adoption-framework.png)

### Understanding the migration approach in cloud adoption
The migration adoption process for Tailwind Traders should consist of three main phases or efforts for each workload: Assess, Deploy, and Release. 

The following table and illustration summarize the migration adoption efforts, as per the Migrate methodology of the Microsoft Cloud Adoption Framework.

Effort | Description
--- | ---
Assess | Assess your workloads to determine costs, modernization, and required deployment tools.
Deploy | After you assess your workloads, the existing workload functionality is replicated (or improved) in the cloud.
Release | After your workloads are deployed (replicated) to the cloud, you can test, optimize, and document your migrated workloads. <br /> <br /> When you're ready, you can release the workloads to your users. <br /> <br /> During the Release effort, be sure to hand off the workloads to governance, operations management, and security teams for ongoing support of the workloads.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-migrations/media/migrate-methodology.png)


### Using the migration guidance in the Cloud Adoption Framework
Proceeding with caution is especially recommended for the migrate phase in the cloud adoption lifecycle. 

To prepare for migration and learn more about the migration approach, review the following documentation:

* [Azure migration guide overview](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/migrate/azure-migration-guide). Review the Azure migration guide to learn about Azure native tools and a relevant approach to migration.

* [The One Migrate approach to migrating the IT portfolio](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios). Examine the scenarios captured in this Migrate methodology. The examples demonstrate the same set of consistent guidelines and processes for migrating both Microsoft and third-party technologies.

* [Azure cloud migration best practices checklist](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/migrate/azure-best-practices). Follow this document to learn how best to address common migration needs through the application of consistent best practices.

* [The Cloud Adoption Framework migration model](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/migrate/migration-considerations). Explore this document to understand migration and why the process can be an intensive activity. As you increase your migration effort, review these process improvements to help optimize aspects of your migration.



## Describe the Azure migration framework
Before you can start migrating Tailwind Traders on-premises workloads to Azure, you should consider creating a migration plan. 

The plan should identify the workloads to migrate, and the appropriate service or tools to use during the migration. 

Ideally, your plan should also include details about how to optimize the migrated services.

The Azure migration framework can help you develop your plan and work through your migration. 

The framework consists of four stages: Assess, Migrate, Optimize, and Monitor.

### Stage 1: Assess your on-premises environment
In the first stage, you assess the current on-premises environment:

* Identify your apps, and their related servers, services, and data, that's within scope for migration
* Start to involve stakeholders, such as the IT department and relevant business groups
* Create a full inventory and dependency map of your servers, services, and apps that you're planning to migrate
* Estimate your cost savings by using the Azure Total Cost of Ownership Calculator (TCO)
* Identify appropriate tools and services you can use to perform the four stages

### Migration strategy patterns
There are five broad strategy patterns for migrating workloads to the cloud, usually called [the five Rs of rationalization](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/digital-estate/5-rs-of-rationalization): Rehost, Refactor, Rearchitect, Rebuild, and Replace. 

The strategy you adopt depends on your business drivers and migration goals. 

You might consider adopting multiple patterns. 

You could choose to rehost simple apps or apps that aren't critical to your business, but rearchitect apps that are more complex and business critical.

* Rehost: 
	* Rehost is often referred to as a lift and shift migration. 
	* This strategy doesn't require code changes, and allows you to migrate your existing workloads to Azure quickly. 
	* Each workload is migrated as is, without the risk and cost associated with code changes.

* Refactor: 
	* Refactor is often referred to as repackaging.
	* Refactoring requires minimal changes to apps so they can connect to Azure platform as a service (PaaS) and use cloud offerings. 
	* You can migrate existing apps to Azure App Service or Azure Kubernetes Service (AKS). 
	* Or, you could refactor relational and non-relational databases into other options. 
	* Refactor into Azure SQL Managed Instance, Azure Database for MySQL, Azure Database for PostgreSQL, and Azure Cosmos DB (if your app can easily be repackaged to work in Azure).

* Rearchitect: 
	* Rearchitecting for migration focuses on modifying and extending app functionality and the code base to optimize the app architecture for cloud scalability. 
	* You can break down a monolithic application into a group of microservices that work together and scale easily. 
	* Or, you could rearchitect relational and non-relational databases to a fully managed database solution. 
	* Rearchitect to Azure SQL Managed Instance, Azure Database for MySQL, Azure Database for PostgreSQL, and Azure Cosmos DB.

* Rebuild: 
	* Rebuild takes things a step further by completely rebuilding an app by using Azure cloud technologies. 
	* You can build green-field apps with cloud-native technologies such as Azure Functions, Azure AI, Azure SQL Managed Instance, and Azure Cosmos DB.

* Replace: 
	* Implement solutions using the best technology and approach available at this time. 
	* Sometimes, software as a service (SaaS) applications can provide all the necessary functionality for your hosted applications. 
	* Then, a workload can be scheduled for replacement, removing it from the migration scope.

The following table lists scenarios for working with the four patterns.

Rehost | Refactor | Rearchitect | Rebuild | Replace
--- | --- | --- | --- | ---
Move workloads quickly to the cloud <br /> <br /> Move a workload without modifying it <br /> <br /> For apps designed to take advantage of Azure IaaS scalability after migration <br /> <br /> When workloads are important to your business, but you don't need immediate changes to app capabilities | Apply innovative DevOps practices provided by Azure <br /> <br /> Implement a DevOps container strategy for workloads <br /> <br /> Support portability of your existing code base and available development skills | Your apps need major revisions to incorporate new capabilities <br /> <br /> Your apps need major revisions to work effectively on a cloud platform <br /> <br /> Use existing application investments <br /> <br /> Meet scalability requirements <br /> <br /> Apply innovative DevOps practices <br /> <br /> Minimize use of virtual machines | Rapid development <br /> <br /> Support existing apps with limited functionality and lifespan <br /> <br /> Expedite business innovation by using DevOps practices <br /> <br /> Rebuild with new cloud-native technologies like Azure Blockchain <br /> <br /> Rebuild legacy applications as "no code apps" or "low apps" in the cloud | Standardize around industry best practices <br /> <br /> Accelerate the adoption of business process-driven approaches <br /> <br /> Reallocated development investments that create competitive differentiation or advantages <br /> <br /> Replace existing solutions in favor for SaaS offerings

### Stage 2: Migrate your workloads
After you complete the assessment, you can begin the process of migrating your targeted apps and their related services and data. 

The migration stage typically consists of the following efforts:

* **Deploy cloud infrastructure targets**. 
	* Before you can migrate Tailwind Traders workloads, you need to create the required cloud infrastructure targets. 
	* Depending on the tools you use to perform the migration, you might need to create the required Azure resources before you begin the migration. 
	* Some tools, such as Azure Migrate and Azure Database Migration Service can create the target Azure resources for you.

* **Migrate workloads**. 
	* It's a good idea to pilot your workload migration, and to choose a non-critical app for the pilot. 
	* This approach enables you to become familiar with tools, gain experience with processes and procedures, and reduce risk when migrating large or complex workloads.

* **Decommission on-premises infrastructure:** 
	* After you're satisfied that your source apps and databases are migrated successfully, you need to decommission the source workloads. 
	* Consider retaining the source workload backups and archived data. 
	* This data might prove useful as it provides a historical archive. 
	* You can store these backups and archives in Azure Blob Storage.

### Stage 3: Optimize your migrated workloads
For the optimization stage, there are three main efforts to focus on for your planning:

* Analyze migration costs for your workloads
* Review recommendations for reducing your costs
* Identify options for improving your workload performance

You can use Microsoft Cost Management (formerly known as Azure Cost Management and Billing) in the Azure portal to analyze your workload costs. 

This tool is available for the Azure resource group that contains your migrated workloads. 

You'll find the tool in the Costs analysis > Cost Management section. 

> To help reduce your costs, you can use the Azure Advisor features by choosing Advisor recommendations. 
> After you analyze your current costs and review the recommendations, you can determine your options for improving your workload performance.

### Stage 4: Monitor your workloads
You can use Azure Monitor to capture health and performance information from your Azure virtual machines.

Install the Azure Monitor Logs (formerly known as Log Analytics) agent on target virtual machines, and then set up alerting and reporting.

> You can install the Azure Monitor Logs agent on machines running Windows or Linux.

You can set up alerts based on a range of data sources:

* Specific metric values like CPU usage
* Specific text in log files
* Health metrics
* Autoscale metrics



## Assess your on-premises workloads
Before you begin a migration project, you need to review the tools, procedures, and services that Azure offers to support your migration process.

### Things to know about migration tools and services
There are a range of tools and services that can help you plan and complete the four stages of your migration. 

Most migrations require several procedures and services. 

For some migrations, you might need only one or two services or tools.

Service or tool | Stage(s) | Description
--- | --- | ---
Service Map | Assess | The Service Map feature of Azure Monitor maps communication between application components on Windows or Linux. Use this feature to identify dependencies when determining what data to migrate. Service Map requires another agent to be installed on the source environment virtual machines.
Azure TCO Calculator | Assess | The Azure Total Cost of Ownership (TCO) Calculator estimates the cost savings you can realize by migrating your workloads to Azure.
Azure Migrate | Assess & Migrate | Azure Migrate performs assessment and migration to Azure of virtual machines (Hyper-V and VMware), cloud-based virtual machines, physical servers, databases, data, virtual desktop infrastructure, and web applications.
Data Migration Assistant (DMA) | Assess & Migrate | SQL Server Data Migration Assistant helps you upgrade to a modern data platform. It detects compatibility issues that might impact database functionality in newer versions of SQL Server or Azure SQL Database.
Database Migration Service | Assess & Migrate | The Azure Database Migration Service performs assessment and migration for several different databases, not just Azure SQL Database.
Data Migration tool | Migrate | The Azure Cosmos DB Data Migration tool migrates your existing databases to Azure Cosmos DB.
Microsoft Cost Management | Optimize | Microsoft Cost Management (formerly known as Azure Cost Management and Billing) helps you monitor, optimize, and control your ongoing Azure costs.
Advisor | Monitor | Azure Advisor helps optimize your Azure resources for reliability, performance, cost, security, and operational excellence.
Monitor | Monitor | Azure Monitor collects monitoring telemetry from both on-premises and Azure resources that help you analyze data, set up alerts, and identify problems.
Microsoft Sentinel | Monitor | Microsoft Sentinel provides intelligent security analytics for your applications that enable you to collect, detect, investigate, and respond to incidents.

Let's examine three Azure services and tools to support the assessment stage of migrating to Azure:

* Azure Migrate
* The Azure TCO Calculator
* The Service Map feature of Azure Monitor

### Service Map
The Service Map feature of Azure Monitor lets you automatically discover applications and their components in your on-premises environment. 

Use the feature to gain valuable insights into the app structure to effectively plan and perform your migration. 

Service Map supports discovery on both Windows and Linux platforms.

You can use Service Map to review the server environment as a collection of interconnected systems. 

Service Map displays the environment details in several formats:

* Connections between servers
* Server processes
* Inbound and outbound connection latency
* TCP or UDP ports across any connected architecture

### Things to know about Service Map
The Service Map feature of Azure Monitor supports several critical assessment functions:

* Discovery: Build a common reference of dependencies of your servers and their processes. Review discovered information as an intuitive graphical map. Identify failed network connections.

* Incident management: Eliminate guesswork around problem isolation. Identify misconfigured systems and components.

* Migration assurance: Plan, accelerate, and validate your Azure migrations. Ensure nothing is left behind and unexpected outages don't occur.

* Business continuity: Identify how your systems rely on each other, thereby helping to ensure that your recovery plan is reliable. Identify, which front-end systems you must recover after a server is restored and available again.

* Patch management: Identify which other teams and servers depend on a service being patched. Notify teams in advance before you take down your systems for patching.

**To use Azure Service Map, you need the following configuration:**

* A Log Analytics workspace defined in the Azure portal.

* Azure Monitor Agent installed on the Windows or Linux computers. This agent collects events and performance data from the computer and delivers it to the Log Analytics workspace.

* The Dependency Agent installed on the Windows or Linux computers. This agent collects discovered data about processes running on the computer, and external process dependencies. The Dependency Agent requires Azure Monitor Agent to be installed on the same machine.

### Azure TCO Calculator
The Azure TCO Calculator helps you estimate and optimize your expected Azure costs following your migration. 

The calculator guides you through three steps to prepare the estimates:

* Define your workloads
* Adjust any assumptions
* View the estimates report

### Things to know about Azure TCO Calculator
You start by defining the characteristics of your existing workloads. 

You enter information about your servers, databases, storage, and networking. 

The following screenshot shows an example workload definition for servers:

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-migrations/media/calculator-estimate.png)

After you define your existing workloads, you adjust any assumptions, such as:

* Software Assurance coverage
* Geo-redundant storage
* Virtual machine costs
* Costs for electricity, storage, and IT labor
* Other assumptions, including hardware and software costs, virtualization costs, datacenter costs, and so on

By making these adjustments, you can fine tune your workloads to reflect actual costs as closely as possible.

In the last step, you review information about possible cost savings on the View report page.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-migrations/media/estimated-savings.png)

The information available from the report can be useful in helping identify the benefits in moving from an on-premises content to one based in Azure.

### Azure Migrate and assessment
Azure Migrate lets you perform an agentless environment discovery or use agents to perform a dependency analysis. 

You can access Azure Migrate features in the Azure portal to help assess your current on-premises workloads. 

Azure Migrate makes recommendations for the size of virtual machine you need to provision to assess readiness for your move to Azure. 

You can identify estimated costs for the resources that those machines will consume, so the management team can set the budgets.

Azure Migrate helps with performance-based sizing calculations (virtual machine sizing, compute/storage) for the machines to migrate and estimates the ongoing cost of running these machines in Azure. 

Azure Migrate can assess both Hyper-V and VMware-based virtual machines, and also physical servers.

Azure Migrate also supports the visualization of dependencies for those machines.

It helps you create groups of machines that can be assessed together and ultimately migrated to Azure at the same time.

### Things to know about Server Assessment
Azure Migrate includes several [assessment tools](https://learn.microsoft.com/en-us/azure/migrate/how-to-assess) to help you prepare for your migration. 

To perform an agentless discovery, you use the Azure Migrate Server Assessment tool.

Server Assessment guides you through downloading a lightweight collector appliance. 

The appliance carries out the discovery of systems in your environment. 

The tool uses data collected by the appliance to identify data about virtual machine cores, memory, disk sizes, and network adapters. 

Where applicable, the collector also gathers performance data like CPU and memory usage, disk IOPS, disk throughput, and network output.

After data collection is complete, the data is pushed to your Azure Migrate project. 

In the Azure portal, you can view the discovered systems and download a report. 

The full process for assessing a server can be visualized as follows:

1. Download and configure the appliance
1. Start discovery
1. Create an assessment
1. Review the assessment

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-migrations/media/migrate-discovery.png)



## Select a migration tool
After you assess on-premises workloads, you can begin to consider how to migrate those workloads to Azure. 

There are several tools in Azure Migrate for migrating your workloads, depending on your specific requirements. 

In this unit, we take a closer look at Azure Migrate and also explore Azure Resource Mover.

### Azure Migrate and migration
As we reviewed in the previous unit, Azure Migrate is a set of features located in a centralized hub that you can use to assess and migrate different workloads to Azure. 

You can use Azure Migrate to perform the migration of workloads, including applications and virtual machines. 

Workloads that can be migrated to Microsoft Azure include on-premises servers, infrastructure, applications, and data.

### Things to know about Azure Migrate and migration
Azure Migrate includes the following components to support the migration process:

* **Unified migration platform:** Azure Migrate provides a single portal where you can perform migration to Azure and track the migration status.

* **Assessment and migration tools:** Azure Migrate supplies several assessment and migration tools, including Server Assessment, Server Migration, and other independent software vendor (ISV) tools.

* **Assessment and migration features for different workloads:** Azure Migrate hub supports several different workloads for migration:
	* Servers: On-premises servers are assessed and migrated to Azure virtual machines.
	* Databases: On-premises databases are assessed and migrated to Azure SQL Database or to an Azure SQL Managed Instance.
	* Web applications: On-premises web applications are assessed and migrated to Azure App Service by using Azure App Service Migration Assistant.
	* Virtual desktops: On-premises virtual desktop infrastructure (VDI) is assessed and migrated to Azure Virtual Desktop.
	* Data: Large volumes of data are migrated to Azure by using Azure Data Box products.

* **Azure Migrate hub tools:** The Azure Migrate hub provides access to many migration tools.

Tool | Usage
--- | ---
Azure Migrate: Discovery and assessment: Server Assessment | Discover and assess servers including SQL and web apps
Azure Migrate: Server Migration | Migrate servers
SQL Server Data Migration Assistant (DMA) | Assess SQL Server databases for migration to Azure SQL Database, Azure SQL Managed Instance, or Azure virtual machines running SQL Server
Azure Database Migration Service | Migrate on-premises databases to Azure virtual machines running SQL Server, Azure SQL Database, or SQL Managed Instances
Web app migration assistant | Assess on-premises web apps and migrate them to Azure
Azure Data Box | Migrate offline data

### Things to consider when migrating with Azure Migrate
Azure Migrate can assist you in completing six major migration scenarios:

* Windows Server workloads
* SQL Server workloads
* Linux workloads
* Windows apps, Java apps and PHP apps
* SAP HANA
* Specialized compute

Choose the scenario that reflects your configuration requirements and migration goals.

### Migrating web apps to Azure
Azure Migrate uses Azure App Service Migration Assistant to assess and migrate your web apps. 

App Service Migration Assistant enables you to assess and migrate your on-premises Windows ASP.NET web apps to Azure. 

Use App Service Migration Assistant to perform these tasks:

* Determine whether your app is a suitable migration candidate
* Run readiness checks to perform a general assessment of app configuration settings
* Migrate an app to Azure App Service

App Service Migration Assistant uses an agent that you install locally, and then it uses the agent to perform a detailed analysis of your apps. 

You use the tool to migrate those apps to Azure. 

After the initial assessment of your apps is complete, you're guided through the migration process via a graphical wizard-driven interface.

After moving the app to Azure, you might also consider migrating any connected databases.

> App Service Migration Assistant migrates your web app and its associated configurations, but doesn't migrate any back-end databases connected to the app. 
> You can use DMA to complete the migration of your database.

### Migrating virtual machines
After you select the appropriate server workloads, you're ready to begin the migration. 

There are four main technical implementation steps involved in moving a server workload to an Azure virtual machine workload by using Azure Migrate.

1. Prepare Azure for the Azure Migrate: Server Migration tool.
1. Prepare the on-premises virtual machines for migration.
1. Replicate the on-premises virtual machines.
1. Migrate the virtual machines.

### Azure Resource Mover
Azure Resource Mover is a tool that helps move your Azure resources between subscriptions, resource groups, and regions. 

Azure Resource Mover provides the following advantages:

* A single location for moving resources.
* Simplicity and speed in moving resources.
* A consistent interface and procedure for moving different types of Azure resources.
* A way to identify dependencies across resources that you want to move.
* Automatic clean-up of resources in the source region.
* The ability to test a move operation before you commit it.

### Things to consider when migrating with Azure Resource Mover
You can use Azure Resource Mover in two ways:

* Before you migrate, to organize your resources.
* After you migrate, to optimize your resource organization.

> After you migrate your workloads to Azure, consider using Azure Resource Mover to move any of your recently migrated resources across subscriptions, regions or resource groups.



## Migrate your structured data in databases
Most applications use a database to store the data used by the application. 

For your migration planning, it's important to understand how to migrate databases to Azure to properly support moving data to the cloud. 

For this process, we'll examine another component of Azure Migrate, the Azure Database Migration Service.

### Azure Database Migration Service
The Azure Database Migration Service is part of Azure Migrate. 

You can use the Database Migration Service to migrate your on-premises databases, including:

* Azure virtual machines running SQL Server
* Azure SQL Database (Database Migration Assistant)
* Azure SQL Managed Instance
* Azure Cosmos DB
* Azure Database for MySQL
* Azure Database for PostgreSQL

### Things to know about the Database Migration Service
The Azure Database Migration Service is a fully managed service. The service provides two ways to migrate structured data in SQL Server databases:

* Online migration: An online migration uses a continuous synchronization of live data, which allows a cut over to the Azure replica database at any time. Online migration minimizes downtime.

* Offline migration: An offline migration requires shutting down the server at the start of the migration, which results in downtime for the service.

### Migrating data in databases
When you begin a migration of structured data with the Database Migration Service, [SQL Server Data Migration Assistant (DMA)](https://learn.microsoft.com/en-us/sql/dma/dma-overview) guides you through the process. 

This process consists of three primary steps:

1. Assess databases: DMA helps you assess the databases you want to migrate.

1. Migrate schema: DMA separates the schema from your databases. The schema is then recreated in the target Azure SQL Database instances.

1. Migrate data and verify: DMA copies the data in your databases to the target instances and then verifies the migrated databases.

### Things to consider when using the Database Migration Service
Let's examine how to use the Database Migration Service to migrate your databases to Azure and the cloud.

#### Prerequisites
For both online and offline migrations, you need to complete the following prerequisite tasks:

* Download DMA
* Create an Azure Virtual Network instance
* Configure network security groups (NSGs)
* Configure Azure Windows Firewall
* Configure credentials
* Provision your target database in Azure (size the target database appropriately for the migrated workload)

### Step 1: Assess on-premises databases
After you verify all prerequisites are met, you're ready to begin the migration. 

The first step is to assess your on-premises environment with DMA.

The assessment generates a report with recommendations and alternate approaches for the migration. 

Review the report for compatibility issues between the source and destination databases that might cause the migration to fail. 

Address any issues, and then generate a new assessment report. 

Repeat this process until you confirm all issues are addressed.

### Step 2: Migrate schema with DMA
Each database has a schema that represents its entire structure. 

The schema defines the rules for how the structured data is organized and the relationships between data elements. 

You migrate the schema before you migrate all the data in your database. 

By migrating the schema first, you accomplish two goals:

* An empty structure is created on the new Azure SQL database. This structure matches the structure of the on-premises source database.
* Connectivity is validated before you run the full data migration. DMA creates and runs a script to take the required actions.

When the script completes, check the target server to make sure the database is configured correctly.

### Step 3: Migrate data and verify
After you complete your assessment and migrate your schema, you can migrate the structured data with the Database Migration Service.

When all migration steps are complete, your schema and structured data have been migrated to the Azure SQL Database instance. 

You can then safely shut down and decommission your on-premises databases and servers.



## Select an online storage migration tool for unstructured data
In addition to migrating applications, virtual machines, databases, and other structured data, organizations also need to move unstructured data. 

This data might be stored in several locations and be liable to frequent changes. 

As a result, migrating storage that contains unstructured data can be challenging.

### Azure Storage Migration Service
The Azure Storage Migration Service in the Windows Admin Center is helpful when you need to move servers to newer hardware or virtual machines. 

You can use the Migration Service to assist with migrating your unstructured data in several ways, including:

* Conduct an inventory of your servers and their data
* Rapidly transfer files, file shares, and security configuration from the source servers
* Take over the identity of the source servers (or cut over)
* Manage one or multiple migrations from the Windows Admin Center interface

### Things to know about the Migration Service
The Azure Storage Migration Service can help you migrate unstructured data stored in on-premises file servers to Azure Files and Azure-hosted virtual machines. 

The migration process is accomplished through capabilities provided by the Migration Service, Azure File Sync, and Azure Migrate.

### Migrating online on-premises unstructured data
The Azure Storage Migration Service implements three steps to move your online on-premises unstructured data:

1. Inventory servers: The Migration Service inventories your servers to gather information about their files and configuration.
 
1. Transfer data: The Migration Service transfers your data from the source to the destination servers.
 
1. Cut over (option): As an option, the Migration Service cuts over to the new servers.

### Things to consider when using the Migration Service
To migrate your unstructured data with the Azure Storage Migration Service, you need to prepare the following configuration:

* Select the source server or failover cluster containing the data to migrate
* Select a destination server or failover cluster to receive the migrated data
* Identify an orchestrator server to manage the migration
* Prepare your PC or server with Windows Admin Center to run the Migration Service user interface
* Satisfy requirements for security, the Migration Service proxy service, and firewall port settings

### Azure File Sync
Azure File Sync is a feature of Azure Files. 

Azure Files is an Azure service that provides the functionality of an on-premises file share with the benefits of a platform as a service (PaaS) cloud service.

Azure File Sync enables you to centralize your organization's file shares in Azure Files, while keeping the flexibility, performance, and compatibility of an on-premises file server.

You can also use Azure File Sync to cache Azure file shares on Windows Server computers for fast access close to where the data is accessed. 

You can use any protocol that's available on Windows Server to access your data locally, including SMB, NFS, and FTPS.

In addition to using Azure Disks as back-end storage, you can utilize both Azure Files and a file server that's hosted in Azure virtual machines. 

This method involves installing Azure File Sync on a file server that's hosted on a cloud virtual machine. 

If the Azure file share is in the same region as your file server, you can enable cloud tiering and set the volume of free space percentage to maximum (99%). 

This option ensures minimal duplication of data. 

You also can use any applications you want with your file servers, such as applications that require NFS protocol support.

### Things to know about Azure File Sync
Let's take a closer look at how Azure File Sync works by using the Storage Sync Service.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-migrations/media/azure-file-synchronization-components.png)

* In the diagram, the server running Windows Server has the Azure File Sync agent and is registered with Azure File Sync.

* Next to this server are two sync groups: Accounting and Sales.

* The Accounting sync group has `D:\Accounting` as the server endpoint. The Sales sync group has `D:\Sales` as the server endpoint.

* Each sync group has a two-way interaction with the cloud endpoint. The server endpoint syncs its content with the cloud endpoint content. (The Azure file share is the cloud endpoint.)

* Both cloud endpoints have a two-way interaction with the same Storage Sync Service.

* Azure File Sync uses the Storage Sync Service.

* The Storage Sync Service has a two-way interaction with the Azure storage account. The cloud endpoints (Azure file shares) are created in the Azure storage account.

* The storage account has two-way interaction with Azure Backup. The Azure storage account can be backed up by using Backup.

After you configure Azure File Sync, data on your configured on-premises server endpoints is synchronized to Azure Files.


### Things to consider when using Azure Files and Azure File Sync
There are several common scenarios for working with Azure File Sync and Azure Files.

Scenario | Description
--- | ---
Replace or supplement on-premises file servers | Virtually all companies use file servers. <br /> <br /> Azure Files can completely replace or supplement traditional on-premises file servers or Network Attached Storage (NAS) devices. <br /> <br /> With Azure file shares and Microsoft Entra Domain Services authentication, you can migrate data to Azure Files and utilize high availability and scalability while minimizing client changes.
Lift and shift (rehome) | Azure Files makes it easy to lift-and-shift applications that expect a file share to store application or user data to the cloud.
Backup and disaster recovery | You can use Azure file shares as storage for backups, or for disaster recovery to improve business continuity. <br /> <br /> You can use Azure file shares to back up your data from existing file servers while preserving configured Windows discretionary access control lists (ACLs). <br /> <br /> Data that's stored on Azure file shares isn't affected by disasters that might affect on-premises locations.
Azure File Sync | With Azure File Sync, Azure file shares can replicate to Windows Server, either on-premises or in the cloud, for performance and distributed caching of data where it's being used. <br /> <br /> Consider using Azure File Sync when you want to migrate shared folder content to Azure. <br /> <br /> This method is especially useful as a means for replacing the Distributed File System on your Windows Servers in your on-premises datacenters.



## Migrate offline data
Azure offers several options for migrating data offline. For your migration planning, you should examine Azure Import/Export and Azure Data Box.

### Azure Import/Export service
The [Azure Import/Export](https://learn.microsoft.com/en-us/azure/import-export/storage-import-export-service) service migrates large quantities of data between an on-premises location and an Azure storage account. 

By using the Import/Export service, you send and receive physical disks that contain your data between your on-premises location and an Azure datacenter. 

You ship data that's stored on your own disk drives. 

These disk drives can be Serial ATA (SATA) hard-disk drives (HDDs) or solid-state drives (SSDs).

### Things to know about the Import/Export service
To use the Azure Import/Export service, you create a job that specifies the data that you want to import or export. 

You then prepare the disks to use to transfer the data. 

For an import job, you write your data to these disks and ship them to an Azure datacenter. 

Microsoft uploads the data for you. For an export job, you prepare a set of blank disks and ship them to an Azure datacenter. 

Microsoft copies the data to these disks and ships them back to you.

Here are a few more points about working with the Import/Export service:

* You can use the Azure Import/Export service to export data from Azure Blob Storage only.
* You can't export data that's stored in Azure Files.
* To use the Import/Export service, BitLocker must be enabled on the Windows system.
* You need an active shipping carrier account like FedEx or DHL for shipping drives to an Azure datacenter.
* For exporting, you need a set of disks that you can send to an Azure datacenter. The datacenter uses these disks to copy the data from Azure Storage.

### Things to consider when using the Import/Export service
The Azure Import/Export service is ideal for uploading and downloading large amounts of data when the network backbone doesn't have sufficient capacity or reliability to support large-scale transfers. 

The Import/Export service can be helpful in other scenarios, including:

Scenario | Description
--- | ---
Migration | Use the Import/Export service to migrate large amounts of data from on-premises to Azure, as a one-time task.
Backup | You can back up your data on-premises in Azure Storage with the Import/Export service.
Recovery | With the Import/Export service, you can recover large amounts of data that you previously stored in Azure Storage.
Distribution | The Import/Export service helps you distribute data from Azure Storage to customer sites.

### Azure Data Box
[Azure Data Box](https://learn.microsoft.com/en-us/azure/databox/) provides a quick, reliable, and inexpensive method for moving large volumes of data to Azure. 

By using Data Box, you can send terabytes of data into and out of Azure. 

The solution is based on a secure storage device that's shipped to your organization. 

Your Data Box can include various devices, such as disks, ruggedized server chassis, or mobile disks.

Azure offers several products to fit different scenarios: [Data Box](https://learn.microsoft.com/en-us/azure/databox/data-box-overview), [Data Box Disk](https://learn.microsoft.com/en-us/azure/databox/data-box-disk-overview), and [Data Box Heavy](https://learn.microsoft.com/en-us/azure/databox/data-box-heavy-overview). 

The configuration process is basically the same across all the products.

After you receive your storage device, you can quickly set it up by using the local web-based management interface. 

If you're exporting data to Azure, copy the required data to the storage device, and then return it to Azure.


### Things to know about Azure Data Box
Azure Data Box includes the following components:

* Data Box device: 
	* A physical device that provides primary storage, manages communication with cloud storage, and helps to ensure the security and confidentiality of all data stored on the device. 
	* The Data Box device has a usable storage capacity of 80 TB.

* Data Box service: 
	* An extension of the Azure portal that lets you manage a Data Box device by using a web interface that you can access from different geographical locations. 
	* Use the Data Box service to perform daily administration of your Data Box device. 
	* The service tasks include how to create and manage orders, view, and manage alerts, and manage shares.

* Data Box local web-based user interface: 
	* A web-based UI that's used to configure the device so it can connect to the local network, and then register the device with the Data Box service. 
	* You can also use the local web UI to shut down and restart the Data Box device, view copy logs, and contact Microsoft Support to file a service request.

> You define your encryption keys for the storage device. The entire process is tracked end-to-end by the Data Box service in the Azure portal.

### Things to consider when using Azure Data Box
Data Box is ideally suited for transferring data sizes larger than 40 TBs. 

The service is especially useful in scenarios with limited internet connectivity. 

You could consider using Data Box in the following situations.

Scenario | Description
--- | ---
One time migration | Use Azure Data Box to migrate a large amount of on-premises data to Azure. <br /> <br /> Move a media library from offline tapes into Azure to create an online media library. <br /> <br /> Migrate your virtual machine farm, SQL server, and applications to Azure. <br /> <br /> Move historical data to Azure for in-depth analysis and reporting by using Azure HDInsight.
Initial bulk transfer | You can perform an initial bulk transfer with Azure Data Box and follow it with incremental transfers over the network. <br /> <br /> Move large volumes of historical backup to Azure. <br /> <br /> After this data is added, you can continue to maintain the archive with incremental data transfers by network to Azure Storage.
Periodic uploads | Use Azure Data Box to move large volumes of data that's generated periodically to Azure. Move data generated by sensors from customer connected IoT devices.

### Compare Azure Import/Export and Azure Data Box
The following table provides a comparison of Azure Import/Export and Azure Data Box. 

Think about how you can implement these services to support your migration solution for an organisation.

Compare | Azure Import/Export | Azure Data Box
--- | --- | ---
Form factor | Internal SATA HDDs or SDDs | Secure, tamper-proof, single hardware appliance
Microsoft manages shipping logistics | No | Yes
Integrates with partner products | No | Yes
Custom appliance | No | Yes

> If you want to import or export more moderate volumes of data to and from Azure Blob Storage, consider using other tools like AzCopy or Azure Storage Explorer.

> Azure Migrate is an assessment and migration tool.

> Azure App Service Migration Assistant helps to assess and migrate your web apps.

> Data Migration Assistant helps detects compatibility issues that can impact database functionality in a new version of SQL Server or Azure SQL Database.

