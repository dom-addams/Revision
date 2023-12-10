# _AZ-104: Monitor and back up Azure resources_
Learn how to monitor resources by using Azure Monitor and implement backup and recover in Azure.


## Configure file and folder backups
Learn how to configure backup and restore policies that meet your company's regulatory needs.

Learning objectives:

* Identify features and usage cases for Azure Backup.
* Configure Azure Recovery Services vault backup options.
* Configure the Microsoft Azure Recovery Services (MARS) agent for Azure Backup.
* Implement on-premises file and folder backups.

The Azure Backup service provides a simple, secure, and cost-effective solution for backing up your data. 

Administrators implement the Microsoft Azure Recovery Services (MARS) agent for Azure Backup to recover their data from the Microsoft Azure cloud.


### _Describe Azure Backup benefits_
Azure Backup is the Azure-based service you can use to back up (or protect) and restore your data in the Microsoft cloud. 

Azure Backup replaces your existing on-premises or off-site backup solution with a cloud-based solution that's reliable, secure, and cost-competitive.

Azure Backup offers multiple components that you download and deploy on the appropriate computer, server, or in the cloud. 

The component, or agent, that you deploy depends on what you want to protect. 

All Azure Backup components (no matter whether you're protecting data on-premises or in the cloud) can be used to back up data to a Recovery Services vault in Azure.

#### Things to know about Azure Backup
Let's take a look at some of the many benefits you gain from implementing Azure Backup.

Benefit | Description
--- | ---
Offload on-premises backup | Azure Backup offers a simple solution for backing up your on-premises resources to the cloud.
Back up Azure IaaS VMs | Azure Backup provides independent and isolated backups to guard against accidental destruction of original data. <br /> Backups are stored in an Azure Recovery Services vault with built-in management of recovery points.
Get unlimited data transfer | Azure Backup doesn't limit the amount of inbound or outbound data you transfer, or charge for the data that's transferred. <br /> Outbound data refers to data transferred from a Recovery Services vault during a restore operation.
Keep data secure | Data encryption allows for secure transmission and storage of your data in the public cloud. <br /> You store the encryption passphrase locally, and it's never transmitted or stored in Azure.
Get app-consistent backups | An application-consistent backup means a recovery point has all required data to restore the backup copy.
Retain short and long-term data | You can use Azure Recovery Services vaults for short-term and long-term data retention. <br /> Azure doesn't limit the length of time data can remain in a Recovery Services vault.
Automatic storage management | Hybrid environments often require heterogeneous storage with some on-premises instances and some instances in the cloud. 
Multiple storage options | Azure Backup offers two types of replication to keep your storage and data highly available. <br /> **Locally redundant storage (LRS)** replicates your data three times (it creates three copies of your data) in a storage scale unit in a datacenter. <br /> **Geo-redundant storage (GRS)** is the default and recommended replication option. GRS replicates your data to a secondary region

### _Implement Backup center for Azure Backup_
Backup center for Azure Backup provides a single unified management experience in Azure. 

Enterprises can govern, monitor, operate, and analyze their backups at scale. 

The Backup center interface is consistent with Azure's native management experiences.

In the Azure portal, search for Backup center and browse to the Backup center dashboard:

![DIA](https://learn.microsoft.com/en-us/training/wwl-azure/configure-file-folder-backups/media/backup-center-b3bf1f45.png)

#### Things to consider when using Backup center
Consider the following benefits of implementing Backup center for Azure Backup.

* **Consider range of capabilities**. 
	* Backup center is designed to function well across a large and distributed Azure environment. 
	* You can use Backup center to efficiently manage backups spanning multiple workload types, vaults, subscriptions, regions, and tenants.

* **Consider datasource-centric management.**
	* Backup center provides views and filters that are centered on the datasources that you're backing up like virtual machines and databases. 
	* A resource owner or backup administrator can manage backup items across different vaults. 
	* The admin can also filter views by datasource-specific properties, including datasource subscription, resource group, and tags.

* **Consider connected experiences.**
	* Backup center provides native integrations to existing Azure services that enable management at scale. 
	* Backup center uses the Azure Policy experience to help you govern your backups. 
	* It uses the Azure Workbooks of Azure Monitor and Azure Monitor Logs (Log Analytics) to help you view detailed reports on backups. 
	* You don't need to learn new principles to use the varied features that Backup center offers. 
	* You can also discover community resources from the Backup center.

* Consider supported scenarios. Backup center is currently supported in many scenarios:
	* Azure Virtual Machines backup, including SQL and SAP HANA in Azure Virtual Machines backup
	* Azure Files backup, Azure Blob Storage backup, and Azure-managed disks backup
	* Azure Database for PostgreSQL Server backup

### _Configure Azure Recovery Services vault backup options_
The **Recovery Services vault** is a storage entity in Azure that stores data. 

Recovery Services vaults make it easy to organize your backup data, while minimizing management overhead.

#### Things to know about Recovery Services vaults
Review below characteristics of Recovery Services vaults.

* The Recovery Services vault can be used to back up Azure Files file shares or on-premises files and folders.
* Recovery Services vaults store backup data for various Azure services, such as IaaS virtual machines (Linux or Windows) and Azure SQL in Azure VMs.
* Recovery Services vaults support System Center Data Protection Manager, Windows Server, Azure Backup Server, and other services.
* In the Azure portal, you can create a Recovery Services vault from the Backup center dashboard.

#### Things to know about configuring Recovery Services vaults
Azure Backup automatically handles the storage for your vault. 

Depending on your configuration, you need to specify how your storage is replicated.

* If you're using Azure Backup for Azure Files file shares, you don't need to configure the storage replication type. 
* Azure Files backup is snapshot-based, and no data is transferred to the vault. 
* Snapshots are stored in the same Azure storage account as your backed-up file share.
* You can configure replication for your Recovery Services vaults from the Backup center dashboard under **Properties > Backup Configuration > Update**.
* There are three storage replication options: Geo-redundant, locally redundant, and zone redundant. The following table provides recommendations for the replication types.

Replication type | Recommendation
--- | ---
Geo-redundant (GRS) | (Default) Use GRS when Azure is your primary backup storage endpoint.
Locally redundant (LRS) | If Azure isn't your primary backup storage endpoint, use LRS to reduce your storage costs.
Zone redundant | If you require data availability without downtime in a region and need to guarantee data residency, use ZRS.

* You can also specify how to restore data in a secondary, Azure paired region by enabling the Cross Region Restore.

> You must change the storage replication type for your Recovery Services vault before you try to configure a backup in the vault. 
> After you configure a backup, the option to modify the replication type is disabled.

### _Use the Microsoft Azure Recovery Services (MARS) agent_
Azure Backup uses the Microsoft Azure Recovery Services (MARS) agent to back up files, folders, and system data from your on-premises machines and Azure virtual machines.

The MARS agent is a full-featured agent that offers many benefits for both backing up and restoring your data.

#### Things to know about the MARS agent
Review some of the characteristics of the MARS agent.

* Azure Backup for files and folders relies on the MARS agent to be installed on your Windows client or Windows Server.
* The data that's available for backup depends on where you install and run the MARS agent.
* You can back up files and folders on Windows virtual machines or physical machines. Virtual machines can be on-premises or in Azure.
* The MARS agent doesn't require a separate backup server.
* The MARS agent isn't application-aware. You can restore files and folders from backups, or do a volume-level restore.

#### Things to consider when using the MARS agent
You can deploy the MARS agent on any Windows Server virtual machine or physical machine. 

The data that's available for backup depends on where you run the MARS agent. 

There are several ways you can run the MARS agent.

Backup scenario | MARS agent implementation
--- | ---
On-premises direct backup | Run the MARS agent on your on-premises Windows machines to back up your machine data directly to a Recovery Services vault in Azure.
Back up for specific files or folders | Run the MARS agent on Azure virtual machines to back up specific files and folders on your virtual machine.
Back up to MABS or System Center DPM | Run the MARS agent on a Microsoft Azure Backup Server (MABS) instance or a System Center Data Protection Manager (DPM) server.

### _Configure on-premises file and folder backups_
Let's review how to use the MARS agent and Azure Backup to complete backups of your on-premises files and folders. 

The following diagram shows the high-level steps to use the MARS agent for Azure Backup.

![DIA](https://learn.microsoft.com/en-us/training/wwl-azure/configure-file-folder-backups/media/file-folder-backup-6d3d3d1e.png)

#### Step 1. Create Recovery Services vault
The first step is to create a Recovery Services vault for your backups. 

The vault must be created within your Azure subscription, as described in the previous section.

#### Step 2. Download MARS agent and credentials file
On the Backup center dashboard, the Recovery Services vault page provides a link to download the MARS agent (Recovery Services Agent). 

To complete the MARS agent installation, you also need to download the vault credentials file. 

For details, see [Download the MARS agent](https://learn.microsoft.com/en-us/azure/backup/install-mars-agent#download-the-mars-agent).

#### Step 3. Install and register MARS agent
The MARS agent installer provides a wizard to configure the installation location, proxy server, and passphrase information. 

The downloaded credentials file is used to register the agent. 

The MARS agent is installed on your local machine.

#### Step 4. Configure backups
Now you're ready to use the MARS agent to create a backup policy. 

You can specify when to do the backup, what data to back up, how long to retain the backup items, and other settings such as network throttling.


## Configure virtual machine backups
Learn how to configure virtual machine backups including restore operations.

Learning objectives:

* Identify features and usage cases for different Azure backup methods.
* Configure virtual machine snapshots and backup options.
* Implement virtual machine backup and restore, including soft delete.
* Perform site-to-site recovery by using Azure Site Recovery.
* Compare the Azure Backup agent to the Microsoft Azure Backup Server.

Azure Backup provides independent and isolated backups to guard against unintended destruction of the data on your virtual machines.

Administrators can implement Azure services to support their backup requirements.

Including the Microsoft Azure Recovery Services (MARS) agent for Azure Backup, the Microsoft Azure Backup Server (MABS), Azure managed disks snapshots, and Azure Site Recovery.

### _Explore options to protect virtual machine data_
You can protect your data by taking backups at regular intervals. 

Azure provides several backup options for virtual machines to support different scenarios and configuration requirements.

#### Things to know about backup options for virtual machines
Let's examine four options for backing up your virtual machines: Azure Backup, Azure Site Recovery, and Azure managed disks snapshots and images.

The following table summarizes these options and provides scenarios for using the different methods. 

As you review these options, think about which method can support the requirements for the business scenario presented in this module.

Azure backup option | Configuration scenarios | Description
--- | --- | ---
Azure Backup | -Back up Azure virtual machines running production workloads <br /> <br/> -Create application-consistent backups for both Windows and Linux virtual machines | Azure Backup takes a snapshot of your virtual machine and stores the data as recovery points in geo-redundant recovery vaults. <br /> <br /> When you restore from a recovery point, you can restore your entire virtual machine or specific files only.
Azure Site Recovery | Quickly and easily recover specific applications <br /> <br /> Replicate to the Azure region of your choice | Azure Site Recovery protects your virtual machines from a major disaster scenario.
Azure managed disks - snapshot | Quickly and easily back up your virtual machines that use Azure managed disks at any point in time <br /> <br /> Support development and test environments | An Azure managed disks snapshot is a read-only full copy of a managed disk that's stored as a standard managed disk by default.
Azure managed disks - image | Create an image from your custom VHD in an Azure storage account or directly from a generalized (via Sysprep) virtual machine <br /> <br /> Create hundreds of virtual machines by using your custom image without copying or managing any storage account | Azure managed disks also support creating a managed custom image

#### Things to consider when creating images versus snapshots
It's important to understand the differences and benefits of creating an image and a snapshot backup of an Azure managed disk.

* Consider images. 
	* With Azure managed disks, you can take an image of a generalized virtual machine that's been deallocated. 
	* The image includes all of the disks attached to the virtual machine. 
	* You can use the image to create a virtual machine that includes all of the disks.

* Consider snapshots. 
	* A snapshot is a copy of a disk at the point in time the snapshot is taken. 
	* The snapshot applies to one disk only, and doesn't have awareness of any disk other than the one it contains. 
	* Snapshot backups are problematic for configurations that require the coordination of multiple disks, such as striping. 
	* In this case, the snapshots need to coordinate with each other, but this functionality isn't currently supported.

* Consider operating disk backups. 
	* If you have a virtual machine with only one disk (the operating system disk), you can take a snapshot or an image of the disk. 
	* You can create a virtual machine from either a snapshot or an image.


### _Create virtual machine snapshots in Azure Backup_
An Azure Backup job creates a snapshot for your virtual machine in two phases:

* Phase 1: Take a snapshot of the virtual machine data
* Phase 2: Transfer the snapshot to an Azure Recovery Services vault

After the Azure Backup job completes, you can use recovery points for the snapshot to restore your virtual machine or specific files.

#### Things to know about snapshots and recovery points
Let's take a closer look at the characteristics of snapshots and recovery points in Azure Backup.

* By default, Azure Backup keeps snapshots for two days to reduce backup and restore times. 
* The local retention reduces the time required to transform and copy data back from an Azure Recovery Services vault.
* You can set the default snapshot retention value from one and five days.
* Incremental snapshots are stored as Azure page blobs (Azure Disks).
* Recovery points for a virtual machine snapshot are available only after both phases of the Azure Backup job are complete.
* Recovery points are listed for the virtual machine snapshot in the Azure portal and are labeled with a recovery point type.
* After a snapshot is first taken, the recovery points are identified with the snapshot recovery point type.
* After the snapshot is transferred to an Azure Recovery Services vault, the recovery point type changes to snapshot and vault.

#### Things to consider when using snapshots and recovery points
Here are some important benefits and considerations about using snapshots and recovery points.

* **Consider recovery after Phase 1** 
	* Use the snapshot captured in Phase 1 of the Azure Backup job to restore your virtual machine from the snapshot. 
	* Phase 2 transfers the snapshot to the Recovery Services vault, so recovery points can be created. 
	* You don't have to wait for Phase 2 to complete before attempting a full restore from the snapshot.

* **Consider disk type, sizing, pricing** 
	* Back up Standard SSD disks, Standard HDD disks, and Premium SSD disks. 
	* Use disk sizes up to 32 TB. For Premium Azure storage accounts, snapshots taken for instant recovery points count towards the 10-TB limit of allocated space.

> Azure Backup doesn't recommend resizing disks.

* **Consider snapshot retention and cost savings**
	* Configure how long Azure Backup retains your snapshots based on your restore needs. 
	* Depending on your requirements, you might set the snapshot retention value to a minimum of one day. 
	* This setting can help reduce costs for snapshot retention, if you don't perform restores frequently.

### _Set up Azure Recovery Services vault backup options_
An Azure Recovery Services vault is a storage entity in Azure that houses data. 

The data is typically copies of data, or configuration information for virtual machines, workloads, servers, or workstations. 

You can use Recovery Services vaults to organize your backup data and minimize your management overhead.

#### Things to know about Recovery Services vaults
Here are some characteristics of Azure Recovery Services vaults.

* A Recovery Services vault stores backup data for various Azure services, such as IaaS virtual machines (Linux or Windows) and Azure SQL databases.
* Azure Recovery Services vaults support System Center Data Protection Manager (DPM), Windows Server, Microsoft Azure Backup Server (MABS), and other services.
* In the Azure portal, you can use an Azure Recovery Services vault to back up your Azure virtual machines.
* A Recovery Services vault can be used to back up your on-premises virtual machines, such as Hyper-V, VMware, System State, and Bare Metal Recovery.

### _Back up your virtual machines_
To use Azure Backup to protect your Azure virtual machines, you follow a simple three-step process: create a vault, define your backup options, and trigger the backup job.

#### Step 1. Create a Recovery Services vault
The first step is to create an Azure Recovery Services vault for your virtual machine backups. 

The vault must be created within your Azure subscription, and in the region where you want to store the data.

You also need to specify how you want your storage replicated, either geo-redundant (default) or locally redundant.

* Geo-redundant (GRS): (Default) Use GRS when Azure is your primary backup storage endpoint.
* Locally redundant (LRS): If Azure isn't your primary backup storage endpoint, use LRS to reduce your storage costs.

#### Step 2. Define your backup policy options
After you create your vault, you need to define your backup policy.

The policy specifies when to take the data snapshots, and how long to keep the snapshots.

Your virtual machine is protected by taking snapshots of your data at defined intervals. 

The snapshots produce recovery points that are stored in your Recovery Services vault.

If it becomes necessary to repair or rebuild your virtual machine, you can restore your machine by using your saved recovery points. 

In your backup policy, you can specify to trigger a backup from one to five times per day.

#### Step 3. Back up your virtual machine
The last step is to run the Azure Backup job process and create your backups.

To run the backup job, the Azure Backup extension requires the Microsoft Azure Virtual Machine Agent to be present on your Azure virtual machine.

* If your virtual machine was created from the Azure gallery, the agent is installed by default on your machine.
* If your virtual machine was migrated from an on-premises data center, you need to manually install the agent on your machine.

For details, see Install the [Azure Virtual Machine Agent](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/agent-windows#install-the-vm-agent).

### _Restore your virtual machines_
After you back up your virtual machine, the backup snapshots and recovery points are stored in your Recovery Services vault. 

You can recover your machine by accessing the snapshot, or restore data to a specific point-in-time by using recovery points.

![DIA](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-virtual-machine-backups/media/virtual-machine-restore-876df613.png)

#### Things to know about restoring your virtual machines
Let's review a few points about restoring your virtual machines from your backup snapshots.

* You can select recovery points for your virtual machine snapshots in the Azure portal.
* When you trigger a restore operation, Azure Backup creates a job to track the restore operation.
* Azure Backup creates and temporarily displays notifications about the restore operation.
* You can track the restore operation by monitoring the job notifications in the Azure portal.

### _Implement System Center DPM and Azure Backup Server_
Another option for backing up your virtual machines is to use System Center Data Protection Manager (DPM) or Microsoft Azure Backup Server (MABS). 

You can use these services to back up specialized workloads, virtual machines, or files, folders, and volumes. 

Specialized workloads can include data from Microsoft SharePoint, Microsoft Exchange, and SQL Server.

You can back up your virtual machines and applications to System Center DPM or MABS storage, and then back up the DPM or MABS storage to an Azure Recovery Services vault.

#### Things to know about using System Center DPM and MABS
Examine the configuration details for using System Center DPM or MABS to back up your data.

* When you set up protection for a machine or application by using System Center DPM or MABS, you select to back up to the MABS or DPM local disk for short-term storage, and to Azure for online protection. 
* You specify when to run the backup to the local DPM or MABS storage, and when to run the online backup to Azure.
* To protect your on-premises machines, the System Center DPM or MABS instance must be located on-premises.
* To protect your Azure virtual machines, the MABS instance must run as an Azure virtual machine and located in Azure.
* The System Center DPM / MABS protection agent must be installed on each machine you want to protect. 
* The machines that you want to back up must be added to a [System Center DPM protection group](https://learn.microsoft.com/en-us/system-center/dpm/create-dpm-protection-groups).
* When the backup triggers, the disk of the protected workload is backed up to the local MABS or DPM disks, according to the schedule you specified. 
* The DPM and MABS disks are then backed up to the Recovery Services vault by the MARS agent running on the DPM or MABS instance.

#### Things to consider when using System Center DPM and MABS
There are several advantages to choosing System Center DPM or MABS for your backup solution.

* **Consider optimized app-aware backups.**
	* Back up your data to MABS or System Center DPM to enable app-aware backups that are optimized for common apps. 
	* Apps can include SQL Server, Exchange, and SharePoint. 
	* The optimization can be achieved for file/folder/volume backups, and machine-state backups. 
	* The machine-state backups can be bare-metal, or system-state.

* **Consider simplified backups for on-premises machines.** 
	* Implement System Center DPM or MABS implementation to avoid installing the Microsoft Azure Recovery Services (MARS) agent on each on-premises machine to back up. 
	* Your on-premises machines automatically run the System Center DPM (and MABS) protection agent. 
	* The MARS agent runs only on the MABS or DPM instance.

* **Consider flexibility and scheduling.**
	* Configure System Center DPM or MABS to gain flexibility and more granular scheduling options for running your backups.

* **Consider consolidated management.**
	* Manage backups for multiple machines by gathering them into protection groups in a single console. 
	* Grouping machines is useful when apps are tiered over multiple machines and you want to back them up at the same time.

### _Compare the MARS agent and Azure Backup Server_
The are advantages and limits to using the different Azure backup components. 

In this section, we compare the Microsoft Azure Recovery Services (MARS) backup agent and Microsoft Azure Backup Server, which uses the System Center DPM protection agent.

The following table summarizes features and restrictions, and identifies what data is protected by the backup, and where the backups are stored in the configuration.

Component | Benefits | Limits | Data protected | Backups stored
--- | --- | --- | --- | ---
MARS backup agent | Back up files and folders on physical or virtual machines running Windows <br /> <br /> No separate backup server required | -Backups triggered 3x per day <br /> -Not application aware <br /> -File, folder, and volume-level restore only <br /> -No support for Linux | Files and folders | Azure Recovery Services vault
Azure Backup Server | App-aware snapshots <br /> <br /> Full flexibility for when backups are triggered <br /> <br /> Recovery granularity <br /> <br /> Linux support on Hyper-V and VMware virtual machines <br /> <br /> Back up and restore VMware virtual machines <br /> <br /> No System Center license required | -Always requires an active Azure subscription <br /> -No backups for Oracle workloads <br /> - No support for tape backup | Files, folders, volumes, virtual machines, applications, and workloads | Azure Recovery Services vault or locally attached disk

### _Implement soft delete for your virtual machines_
Azure Storage now offers the soft delete option for Azure Blob objects. 

With this feature, you can more easily recover your data when it's erroneously modified or deleted by an application or other storage account user.

Soft delete for virtual machines protects backups of your virtual machines from unintended deletion. 

Even after the backups are deleted, they're preserved in the soft-delete state for 14 more days.

> If a virtual machine is deleted without a backup, the soft-delete feature won't preserve the data. 

#### Things to know about soft delete for backups
Review the following details regarding implementing soft delete for your virtual machine backups.

* Stop backup job. 
	* Before you can delete or retain backup data for your virtual machine, you must stop the active backup job. 
	* After you stop the backup job in the Azure portal, you can choose to delete or retain your backup data.

* Apply soft-delete state. 
	* Prevent your virtual machine backup data from being permanently deleted by selecting Delete backup data followed by Stop backup. 
	* The soft-delete state is applied to your backup data, and the data is retained for 14 days.
	* If you apply the state to a virtual machine, the machine is referred to as soft-deleted.

* View soft-delete data in the vault. 
	* During the 14 day retention period, the Recovery Services vault shows your soft-deleted virtual machine with a red soft-delete icon.

> When a Recovery Services vault contains any soft-deleted items, the vault can't be deleted.

* Undelete backup items. 
	* Before you can restore a soft-deleted virtual machine, you must undelete the backup data.

* Restore items. 
	* After you undelete the backup item, you can restore your virtual machine by selecting Restore virtual machine from the chosen recovery point in the backup.

* Resume backups. 
	* When the undelete process completes, the backup job status returns to Stop backup with retain data, and you can choose Resume backup. 
	* The resume operation retrieves the backup item in the active state according to the backup policy selected by the user. 
	* The policy defines the backup and retention schedules.

### _Implement Azure Site Recovery_
Azure Site Recovery helps ensure business continuity by keeping business applications and workloads running during outages. 

Site Recovery replicates workloads running on physical and virtual machines from a primary site to a secondary location. 

When an outage occurs at your primary site, Site Recovery implements a failover to the secondary location to allow continued access to your applications. 

After the primary location is running again, you can resume application access on the primary machine.

#### Things to know about Azure Site Recovery
Azure Site Recovery supports many configurations and complements various Azure services.

You can implement Site Recovery to back up your virtual machines and physical machines in the following scenarios:

* Replicate Azure virtual machines from one Azure region to another
* Replicate on-premises VMware virtual machines, Hyper-V virtual machines, physical servers (Windows and Linux), and Azure Stack virtual machines to Azure
* Replicate AWS Windows instances to Azure
* Replicate on-premises VMware virtual machines, Hyper-V virtual machines managed by System Center VMM, and physical servers to a secondary site

#### Things to consider when using Site Recovery
There are many benefits to implementing Azure Site Recovery. 

As you review the following features, consider how the service can support your business requirements.

Feature | Description
--- | ---
Consolidated management | Set up and manage replication, failover, and failback from a single location in the Azure portal.
Reduced cost and complexity | Replicate to Azure to eliminate the cost and complexity of maintaining a secondary datacenter.
Replication resilience | Orchestrate replication without intercepting your app data and gain the resilience of Azure Storage. When failover occurs, Azure virtual machines are created, based on the replicated data.
Continuous replication | Access continuous replication for Azure virtual machines and VMware virtual machines, and replication frequency as low as 30 seconds for Hyper-V.
Snapshot recovery points | Replicate by using recovery points with app-consistent snapshots that capture disk data, all data in memory, and all transactions in process.
Failover and easy fall back | Run planned failovers for expected outages with zero-data loss. Run unplanned failovers with minimal data loss depending on replication frequency. Easily fall back to your primary site when it's available again.
Integration | Integrate with Azure for simple application network management, including reserving IP addresses, configuring load-balancers, and integrating Azure Traffic Manager for efficient network switchovers.


## Configure Azure Monitor
Learn how to configure Azure Monitor, including querying the Azure Monitor activity log.

Learning objectives:

* Identify the features and usage cases for Azure Monitor.
* Configure and interpret metrics and logs.
* Identify the Azure Monitor components and data types.
* Configure the Azure Monitor activity log.

Logging and monitoring the health of your services is a vital component of production applications. 

Azure Administrators determine the causes of failures and try to identify any problems before they occur.

Azure Monitor is an important tool to help you in this process. 

It enables you to gather monitoring and diagnostic information about the health of your services. 

You can use this information to visualize and analyze the causes of problems that might occur in your app.

### _Describe Azure Monitor key capabilities_
Azure Monitor provides you with a comprehensive solution for collecting, analyzing, and responding to telemetry data from your on-premises and cloud environments.

The service features help you understand how your applications are performing. 

You can use Azure Monitor to proactively identify issues that affect your apps and resources, and take action to maximize their availability and performance.

#### Things to know about Azure Monitor
Azure Monitor provides features and capabilities in three areas:

* Monitor and visualize metrics: 
	* Azure Monitor gathers numerical metric values from your Azure resources according to your preferences. 
	* Azure Monitor offers different methods for viewing your metric data to help you understand the health, operation, and performance of your system.

* Query and analyze logs: 
	* Azure Monitor Logs (Log Analytics) generates activity logs, diagnostic logs, and telemetry information from your monitoring solutions. 
	* The service provides analytics queries that you can use to help with troubleshooting and visualizations of your log data.

* Set up alerts and actions: 
	* Azure Monitor lets you set up alerts for your gathered data to notify you when critical conditions arise. 
	* You can configure actions based on the alert conditions, and take automated corrective steps based on triggers from your metrics or logs.

### _Describe Azure Monitor components_
Monitoring is the act of collecting and analyzing data. 

The data can be used to determine the performance, health, and availability of your business applications and the resources they depend on.

An effective monitoring strategy helps you understand the detailed operation of the components of your applications. 

Monitoring also helps you increase your uptime by proactively notifying you of critical issues. 

You can then resolve the issues before they become severe.

Azure includes multiple services that individually perform a specific role or task in the monitoring space. 

Together, these services deliver a comprehensive solution for collecting, analyzing, and acting on data from your applications and the Azure resources that support them. 

The services also work to monitor critical on-premises resources to provide a hybrid monitoring environment. 

Understanding the tools and data that are available is the first step in developing a complete monitoring strategy for your application.

#### Things to know about monitoring with Azure
Let's take a look at the various Azure components that support Azure Monitor capabilities.

* The monitoring and diagnostic services offered in Azure are divided into broad categories such as Core, Application, Infrastructure, and Shared Capabilities.
* Data stores in Azure Monitor hold your metrics and logs. [Azure Monitor Metrics](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/data-platform-metrics) and [Azure Monitor Logs](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-platform-logs) are the two base types of data used by the service.
* Various monitoring sources provide Azure Monitor with the metrics and logs data to analyze. 
* These sources can include your Azure subscription and tenant, your Azure service instances, your Azure resources, data from your applications, and more.

* Azure Monitor Insights performs different functions with the collected data, including analysis, alerting, and streaming to external systems.
	* Get insights: 
		* Access the Azure Application Insights extension to Azure Monitor to use the Application Performance Monitoring (APM) features. 
		* You can use APM tools to monitor your application performance and gather trace logging data. 
		* Application Insights are available for many Azure services, such as Azure Virtual Machines and Azure Virtual Machine Scale Sets, Azure Container Instances, Azure Cosmos DB, and Azure IoT Edge.
	* Visualize: 
		* Utilize the many options in Azure Monitor for viewing and interpreting your gathered metrics and logs. 
		* You can use Power BI with the Azure Workbooks feature of Azure Monitor and access configurable dashboards and views.
	* Analyze: 
		* Work with Azure Monitor Logs (Log Analytics) in the Azure portal to write log queries for your data. 
		* You can interactively analyze your log data by using Azure Monitor Metrics and the powerful analysis engine.
	* Respond: 
		* Set up log alert rules in Azure Monitor to receive notifications about your application performance. 
		* You can configure the service to take automated action when the results of your queries and alerts match certain conditions or results.
	* Integrate: 
		* Ingest and export log query results from the Azure CLI, Azure PowerShell cmdlets, and various APIs. 
		* Set up automated export of your log data to your Azure Storage account or Azure Event Hubs. 
		* Build workflows to retrieve your log data and copy to external locations with Azure Logic Apps.

		
### _Define metrics and logs_
All data collected by Azure Monitor fits into one of two fundamental types, [metrics and logs](https://learn.microsoft.com/en-us/azure/azure-monitor/platform/data-collection):

**Metrics** are numerical values that describe some aspect of a system at a particular point in time. Metrics are lightweight and capable of supporting near real-time scenarios.

**Logs** contain different kinds of data organized into records with different sets of properties for each type. 

Data like events and traces are stored as logs along with performance data so all the data can be combined for analysis.

#### Things to know about Azure Monitor metrics
For many Azure resources, the metrics data collected by Azure Monitor is displayed on the Overview page for the resource in the Azure portal. 

Consider the overview for an Azure virtual machine that has several charts that show performance metrics.

You can use Azure Monitor metrics explorer to view the metrics for your Azure services and resources.

In the Azure portal, select any graph for a resource to open the associated metrics data in metrics explorer. 

The tool lets you chart the values of multiple metrics over time. 

You can work with the charts interactively or pin them to a dashboard to view them with other visualizations.

#### Things to know about Azure Monitor Logs
You can also work with Azure Monitor Logs (Log Analytics) in the Azure portal. Let's review the details.

* In the Azure portal, log data collected by Azure Monitor is stored in Log Analytics.
* Log Analytics includes a [rich query language](https://learn.microsoft.com/en-us/azure/azure-monitor/log-query/log-query-overview) to help you quickly retrieve, consolidate, and analyze your collected data.
* You can work with Log Analytics to create and test queries. Use the query results to directly analyze the data, save your queries, visualize the data, and create alert rules.
* Azure Monitor uses a version of the [Data Explorer](https://learn.microsoft.com/en-us/azure/kusto/query/) query language. 
* The language is suitable for simple log queries, but also includes advanced functionality like aggregations, joins, and smart analytics. 
* You can quickly learn the query language by completing several available lessons. Particular guidance is provided for users familiar with SQL and Splunk.

### _Identify monitoring data and tiers_
Azure Monitor can collect data from various sources. 

You can think of the collected data as being categorized by tier. 

Tiers can include data collected from many sources, such as:

* Your application
* The operating system
* Services and resources used by your application
* The platform that supports your application

#### Things to know about data collection
Review the following details about how Azure Monitor collects different categories of data.

* Azure Monitor begins collecting data as soon as you create your Azure subscription and add resources.
* When you create or modify resources, this data is stored in Azure Monitor activity logs.
* Performance data about resources, along with the amount of resources consumed, is stored as Azure Monitor metrics.
* Extend the data you're collecting by enabling diagnostics and adding Azure Monitor Agent to compute resources. By extending your data sources, you can collect data for the internal operation of the resources.
* Azure Monitor Agent also lets you configure different data sources to collect logs and metrics from Windows and Linux guest operating systems.
* Azure Monitor can collect log data from any REST client by using the Data Collector API. The Data Collector API lets you create custom monitoring scenarios and extend monitoring to resources that don't expose data through other sources.

#### Monitoring data tiers
The following table summarizes the tiers of monitoring data that are collected by Azure Monitor.

Data tier | Description
--- | ---
Application | The Application tier contains monitoring data about the performance and functionality of your application code. This data is collected regardless of your platform.
Guest OS | Monitoring data about the operating system on which your application is running is organized into the Guest OS tier. 
Azure resource | The Azure resource tier holds monitoring data about the operation of any Azure resource you utilize, including consumption details for the resource.
Azure subscription | The Azure subscription tier contains monitoring data about the operation and management of your Azure subscription. The tier also contains data about the health and operation of Azure itself.
Azure tenant | Data about the operation of your tenant-level Azure services, such as Azure Active Directory, is organized into the Azure tenant tier.

### _Describe activity log events_
The Azure Monitor activity log is a subscription log that provides insight into subscription-level events that occur in Azure. 

Events can include a range of data from Azure Resource Manager operational data to updates on Azure service health events.

#### Things to know about activity logs
Let's examine some details about working with activity logs in Azure Monitor.

* You can use the information in activity logs to understand the status of resource operations and other relevant properties.
* Activity logs can help you can determine the "what, who, and when" for any write operation (PUT, POST, DELETE) performed on resources in your subscription.
* Activity logs are kept for 90 days.
* You can query for any range of dates in an activity log, as long as the starting date isn't more than 90 days in the past.
* You can retrieve events from your activity logs by using the Azure portal, the Azure CLI, PowerShell cmdlets, and the Azure Monitor REST API.

#### Business scenarios
Activity logs can help you monitor your configuration and get details for many scenarios, such as:

* What operations happened on resources in my subscription?
* Who initiated the operations?
* When did the operations occur?
* What's the current status of the operations?
* What are the values of other properties that can help with my analysis of the resources and operations?

### _Query the activity log_
In the Azure portal, you can filter your Azure Monitor activity logs so you can view specific information. 

The filters enable you to review only the activity log data that meets your criteria. 

You might set filters to review monitoring data about critical events for your primary subscription and production virtual machine during peak business hours.

![image](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-monitor/media/query-activity-log-a92271d9.png)

#### Things to know about activity log filters
Let's review some of the filters you can set to control what data to review in your activity log:

* **Subscription:** Show the data for one or more specified Azure subscription names.
* **Timespan:** Show data for a specified time by choosing the start and end time for events, such as a six-hour period.
* **Event Severity:** Show events at the selected severity levels, including Informational, Warning, Error, or Critical.
* **Resource group:** Show data for one or more specified resource groups within your specified subscriptions.
* **Resource (name):** Show data for the specified resources.
* **Resource type:** Show data for resources of a specified type, such as `Microsoft.Compute/virtualmachines`.
* **Operation name:** Show data for a selected Azure Resource Manager operation, such as `Microsoft.SQL/servers/Write`.
* **Event initiated by:** Show operation data for a specified user who performed the operation, referred to as the "caller."

After you define a set of filters, you can pin the filter set to the Azure Monitor dashboard. 

You can also download your activity log search results as a CSV file.

In addition to the filters, you can enter a text string in the Search box.

Azure Monitor tries to match your search string against data returned for all fields in all events that corresponds to your filter settings.

#### Things to know about event categories
The following table summarizes the categories of events that you can review in your activity logs. 

The information displayed for events is based on your other filter settings.

Event category | Event data | Examples
--- | --- | ---
Administrative | All create, update, delete, and action operations performed through Azure Resource Manager, and any changes to role-based access control (RBAC) in your filtered subscriptions | `create virtual machine` <br /> <br /> `delete network security group`
Service Health | All service health events for Azure services and resources connected with your filtered subscriptions, including Action Required, Assisted Recovery, Incident, Maintenance, Information, or Security | `SQL Azure in East US is experiencing downtime` <br /> <br /> `Azure SQL Data Warehouse Scheduled Maintence Complete`
Resource Health | All resource health events for your filtered Azure resources, including Available, Unavailable, Degraded, or Unknown, and identified as Platform Initiated or User Initiate | `Virtual Machine health status changed to unavailable` <br /> <br /> `Web App health status changed to available`
Alert | All activations of Azure alerts for your filtered subscriptions and resources | `CPU % on devVM001 has been over 80 for the past 5 minutes` <br /> <br /> `Disk read LessThan 100000 in the last 5 minutes`
Autoscale | All events related to the operation of the autoscale engine based on any autoscale settings defined for your filtered subscriptions | `Autoscale scale up action failed`
Recommendation | Recommendation events for certain Azure resource types, such as web sites and SQL servers, based on your filtered subscriptions and resources | Recommendations for how to better utilize your resources
Security | All alerts generated by Microsoft Defender for Cloud affecting your filtered subscriptions and resources | `Suspicious double extension file executed`
Policy | All effect action operations performed by Azure Policy for your filtered subscriptions and resources, where every action taken by Azure Policy is modeled as an operation on a resource | `Audit` and `Deny`

> Azure Monitor activity logs are kept for 90 days.


## Configure Azure alerts
Learn how to configure Azure alerts including action groups.

Learning objectives:

* Identify Azure Monitor alerts, including alert types and alert states.
* Configure Azure Monitor alerts.
* Create alert rules and action groups.

Azure Administrators use Azure Monitor to receive alerts for their monitored applications and resources. 

Alerts can help an organization address system issues in a timely manner, including setting up automated responsive actions.

### _Describe Azure Monitor alerts_
Azure Monitor captures logs and metrics telemetry data for your infrastructure or applications so you can analyze and identify potential problems. 

You can configure Azure alerts to initiate responsive action and send notifications based on your telemetry data. 

Azure alerts help you detect and address issues to keep your applications running and prevent service disruptions for your users.

#### Things to know about Azure alerts
Let's examine how to work with Azure alerts and Azure Monitor.

* In the Azure portal, you configure Azure Monitor to capture telemetry data for your Azure services, resources, and applications.

* You create alerts for your Azure configuration to work with the captured telemetry data.

* An alert consists of alert rules that combine the settings and conditions you want to monitor, including:
	* Resources to monitor
	* Signals or telemetry to gather from the resources
	* Conditions to match

* An alert rule specifies action groups to fulfill responsive steps when an alert triggers, such as sending notifications.

* Each alert monitors your telemetry and captures a signal about changes to your specified resource.

* The alert rule captures the signal and checks if the signal matches your condition criteria.

* When your rule conditions match your telemetry data, an alert triggers and invokes the specified action groups.

* If you're monitoring multiple resources, the system evaluates your conditions separately for each resource, and alerts trigger for each resource separately.

#### Things to consider when using Azure alerts
The Azure Monitor alerts experience offers many benefits. 

As you review this list, consider how you can implement alerts to improve your monitoring and diagnostics solution.

Benefit | Description
--- | ---
Improved notification system | Implement action groups for all newer alerts to access notifications. Define notifications and other actions and reuse these settings for multiple alerts.
Unified authoring experience | Easily create all your alerts in one place. Follow the same process to set up alerts for metrics, logs and activity logs across Azure Monitor, Log Analytics (in the Azure portal), and Azure Application Insights.
Combined view for Log Analytics alerts | Monitor Log Analytics alerts for your subscriptions in the Azure portal, along with your other monitored resources and applications.
Separation of active alerts and alert rules | Differentiate between alert rules with conditions to trigger an alert and the active (fired) alert. Separate the operational and configuration views for your alerts, alert rules, and actions.
Better workflow | Take advantage of the new Azure alerts authoring experience that guides you through the process of configuring alert rules.

### _Manage Azure Monitor alerts_
You can work with Azure Monitor alerts in the Azure portal. 

There are options for creating and managing your alert instances, alert rules and conditions, and alert response actions.

#### Things to know about alert types
There are different types of alerts to support various configuration and monitoring scenarios, such as metrics, logs, and events. 

You define alert rules for the different types of telemetry gathered from your monitored data sources. 

Trigger alerts according to conditions for your metrics and logs data, or by watching for activity log events. 

You can also implement alerts to help maintain the health of the underlying Azure platform and test your website availability.

Here are some of the most common types of alerts:

* Metric alerts:
	* Evaluate metrics data from your resources at regular intervals. 
	* Gather metrics data from your platform, Azure Monitor logs converted to metrics, Azure Application Insights, and custom metrics. 
	* Metric alerts can apply multiple conditions and dynamic thresholds.

* Log alerts: Use Log Analytics queries in the Azure portal to evaluate resource logs at a predefined frequency.

* Activity log events: 
	* Implement alerts to trigger when a new activity log event occurs that meets your conditions. 
	* Resource Health alerts and Service Health alerts are two types of activity log alerts.

* Smart detection alerts: 
	* Receive automatic warnings about potential performance issues and failure anomalies in your web apps by using smart detection on your Application Insights resources. 
	* Migrate smart detection on your Application Insights resources to create alert rules for the different smart detection modules.

#### Things to know about alert states
In the Azure portal, each alert has a state indicator to identify where the alert and corresponding issue are in the monitoring process.

* There are three alert states:
	* **New:** The issue is new (open) and not in review.
	* **Acknowledged:** The issue is in review and work is in progress.
	* **Closed:** The issue is complete.

* During the alert monitoring process, when the conditions of an alert rule match telemetry data for your specified resource, an alert triggers and invokes the specified action groups. 

* The system sets the alert state to New.
 
* After the system sets an alert state to New, you can change the state to specify where the related issue is in the resolution process.
 
* When the issue for alert is in review, you can change the alert state to Acknowledged.
 
* After the issue for an alert clears, you can change the alert state to Closed.
 
* If an alert is in the Closed state, you can "reopen" the alert by changing the alert state to New or Acknowledged. |
 
* The history of the alert stores all state changes.

#### Alert state and Azure Monitor condition
The alert state is different and independent of the Azure Monitor condition as shown in the Azure portal.

* Upon the initial trigger of an alert, the system changes the alert state to New. A local administrator makes all further changes to the alert state.
* For all updates to the Azure Monitor condition for the same alert, the system makes all the changes.
* When an alert triggers, the Azure Monitor condition for the alert changes to fired.
* When the issue for the alert clears, the Azure Monitor condition for the alert changes to resolved.

#### Stateless and stateful alerts
You can configure most types of alerts as stateful or stateless, which corresponds to how many instances of the same alert can be active at the same time.

* Stateless alerts 
	* Trigger each time your alert rule condition matches your data, even if the same alert already exists. 
	* You can configure log alerts and metric alerts as stateless.

* Stateful alerts 
	* Trigger when your alert rule condition matches your data and the same alert doesn't exist. 
	* A stateful alert doesn't trigger any more actions until the current alert rule conditions clear. 
	* You can configure log alerts and metric alerts as stateful. Activity log alerts are always stateless.

### _Create alert rules_
To create an alert in the Azure portal, you define an alert rule for the alert. 

The alert rules consist of resources, action groups, and monitor conditions that represent the target and criteria for your alert operation.

#### Things to know about alert rules
Let's take a closer look at how to create and work with alert rules.

* An alert rule consists of several key attributes: the target resource, an alert signal, the rule criteria, the issue severity, and a name and description.
* Your target resource defines the scope and signals that are available for your alert operation. A target can be any Azure resource.
* The target resource for your alert emits a signal based on your selected resource type. The emitted signal can be Metric, Activity log, Application Insights, or Log.
* You define criteria for your alert rule that combines your signal with processing logic. The criteria apply to your target resource.
* You can specify the severity level for your alert rule that corresponds to the issue pertaining to your alert. The severity can be in the range from 0 to 4.
* When an issue matches your rule conditions, the system invokes the actions for your alert rule. 
* Actions are the responsive steps pertaining to the issue such as sending notifications.
* By default, the system sets a new alert rule to enabled. If you don't want an alert to trigger, set the alert rule to disabled.
* An alert can only trigger when the alert rule is in the enabled state.

### _Create action groups_
An action group is a collection of notification preferences that you define as an Azure subscription owner. 

When Azure Monitor detects an issue in your telemetry data, your alert triggers and your alert rule actions initiate. 

Azure Monitor, Azure Service Health, and Azure Advisor use action groups to notify users when an alert triggers.

#### Things to know about action groups
Let's review the characteristics of action groups, including how to configure notifications and define actions.

* Multiple alerts can use the same action group or different action groups depending on the user's requirements.
* Notifications specify how to notify users when your action group triggers.
* Actions specify how to invoke your defined actions when your action group triggers.

#### Notifications
You can configure notifications to operate by configuring email or similar communication settings.

![example](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-alerts/media/alert-notifications-618b4c6f.png)

In the Azure portal, you can select the **Email Azure Resource Manager role** option to send email notifications to the members of your Azure subscription's role. 

The system sends email to Azure Active Directory (Azure AD) user members of the role only, and not to Azure AD groups or service principals.

You can also select the **Email/SMS message/Push/Voice** option to specify any email, SMS, push, or voice actions.

#### Actions
You provide each action with a unique name and details, and define the notifications or actions to perform. 

You might specify actions to send a voice call, an SMS message, or an email message.

You can configure the action group to use an automated action via the Action type attribute. 

Here are some automated options:

* Automation runbook:
	* An automation runbook is the ability to define, build, orchestrate, manage, and report on workflows that support system and network operational processes. 
	* A runbook workflow can potentially interact with all types of infrastructure elements, such as applications, databases, and hardware.

* Azure Functions: 
	* Azure Functions is a serverless compute service that lets you run event-triggered code without having to explicitly provision or manage infrastructure.

* ITSM: 
	* The action can connect Azure and a supported IT Service Management (ITSM) product or service. This action requires an ITSM connection.

* Logic Apps: 
	* Azure Logic Apps connects your business-critical apps and services by automating your workflows.

* Webhook: 
	* A webhook is an HTTPS or HTTP endpoint that allows external applications to communicate with your system.


## Configure Log Analytics
You will learn how to configure Log Analytics including structuring queries.

Learning objectives:

* Identify the features and usage cases for Log Analytics.
* Create a Log Analytics workspace.
* Structure a Log Analytics query and review results.

Azure Monitor collects log data and stores it in tables. 

Administrators use Log Analytics in the Azure portal to configure their input data sources and conduct queries for their Azure Monitor logs.

Queries provide insights into system infrastructure, such as assessing system updates and troubleshooting operational incidents. 

To retrieve and consolidate data in the repository, administrators can create Kusto Query Language (KQL) queries.

### _Determine Log Analytics uses_
Log Analytics is a tool for Azure Monitor that's available in the Azure portal. 

You can use Log Analytics to edit and run log queries for the data collected in Azure Monitor Logs. 

Log queries help you to search for patterns and identify issues.

#### Things to know about Log Analytics
Let's examine some characteristics of Log Analytics in Azure Monitor.

* Log Analytics in Azure Monitor offers query features and tools that help you answer virtually any question about your monitored configuration.

* Log Analytics supports the Kusto Query Language (KQL). You can create simple or complex queries with KQL, including:
	* Search and sort by value, time, property state, and more
	* Join data from multiple tables
	* Aggregate large sets of data
	* Perform intricate operations with minimal code

* When your Azure Monitor Logs contain sufficient collected data, and you understand how to construct the appropriate query, you can use Log Analytics to complete detailed analysis and problem solving.

#### Things to consider when using Log Analytics
Some features in Azure Monitor, such as insights and solutions, process log data without exposing you to the underlying queries. 

To use other Azure Monitor features, you need to understand how to construct queries and apply them to interactively analyze data in Azure Monitor Logs. 

The following business scenarios showcase the advantages of querying Azure Monitor Logs with Log Analytics.

#### Business scenario: Track changes and identify access issues
Troubleshooting an operational incident is a complex process that requires access to multiple data streams. 

By monitoring your systems from the Azure platform, you can easily perform analysis from multiple angles.

You have access to data from a wide variety of sources through a single interface for correlation of information.

By tracking changes across the Azure environment, Log Analytics in Azure Monitor can help you easily identify common issues, such as:

* Abnormal behavior from a specific account
* Users installing unapproved software
* Unexpected system reboots or shutdowns
* Evidence of security breaches
* Specific problems in loosely coupled applications

### _Create a Log Analytics workspace_
When you capture logs and data in Azure Monitor, Azure stores the collected information in a Log Analytics workspace. 

Your Log Analytics workspace is the basic management environment for Azure Monitor Logs.

![workspace](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-log-analytics/media/create-workspace-f37a5b11.png)

#### Things to know about the Log Analytics workspace
To get started with Log Analytics in Azure Monitor, you need to create your workspace. 

Each workspace has a unique workspace ID and resource ID. 

After you create your workspace, you configure your data sources and solutions to store their data in your workspace.

To create your Log Analytics workspace, configure the following parameters:

* Name: Provide a name for your new Log Analytics workspace. The name for your workspace must be unique within your resource group.
* Subscription: Specify the Azure Subscription to associate with your workspace.
* Resource Group: Specify the resource group to associate with your workspace. You can choose an existing resource group or create a new one. The resource group must contain at least one Azure Virtual Machines instance.
* Region: Select the region where you deploy your virtual machines.
* Pricing: The default pricing tier for a new workspace is pay-as-you-go. Charges incur only after you start collecting data.

> Each Log Analytics workspace in Azure Monitor can have a different pricing tier. You can change the pricing tier for a workspace and also track the changes.

### _Create Kusto (KQL) queries_
Log Analytics in Azure Monitor supports the Kusto Query Language (KQL). 

The KQL syntax helps you quickly and easily create simple or complex queries to retrieve and consolidate your monitoring data in the repository.

#### Things to consider when using KQL queries
Here are some of the many things you can accomplish with KQL log queries in Log Analytics:

* Create and save searches of your data stored in the Azure Monitor Logs repository.
* Use your saved log searches to directly analyze your data in the Azure portal.
* Configure your saved log searches to run automatically.
* Configure your saved log searches to produce notification alerts.
* Add visualizations for your saved log searches to see graphical views of your environment health.
* Export your data from the repository into tools like Power BI or Excel to analyze your data outside of Log Analytics.
* Build custom query solutions with the [Log Analytics REST API](https://learn.microsoft.com/en-us/rest/api/loganalytics/).

### _Structure Log Analytics queries_
Administrators build Log Analytics queries from data stored in dedicated tables in a Log Analytics workspace. 

Some common dedicated tables include Event, Syslog, Heartbeat, and Alert. 

When you build a Kusto Query Language (KQL) query, you begin by determining which tables in the Azure Monitor Logs repository have the data you're looking for.

The following illustration highlights how KQL queries use the dedicated table data for your monitored services and resources.

![illustration](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-log-analytics/media/query-tables-f3872e3a.png)

#### Things to know about KQL query structure
Let's take a closer look at dedicated table data and how to structure a KQL log query.

* Each of your selected data sources and solution stores its data in dedicated tables in your Log Analytics workspace.
* Documentation for each data source and solution includes the name of the data type that it creates and a description of each of its properties.
* The basic structure of a query is a source table followed by a series of commands (referred to as operators).
* A query can have a chain of multiple operators to refine your data and perform advanced functions.
* Each operator in a query chain begins with a pipe character |.
* Many queries require data from a single table only, but other queries can use various options and include data from multiple tables.

#### KQL log query examples
Let's review some common KQL log query operators and example syntax.

We can build queries to search for data in the `StormEvent` table that has five entries:

type | event | severity | start | duration | region
--- | --- | --- | --- | --- | ---
Water | Freezing rain | 1 | 6:00 AM 01-27-2023 | 3 hours | 1, 2
Wind | High winds | 1 | 8:00 AM 01-27-2023 | 12 hours | 1, 2, 4, 5
Temperature | Below freezing | 2 | 11:00 PM 01-26-2023 | 10 hours | 1, 2, 4, 5
Water | Snow | 3 | 4:00 PM 01-26-2023 | 10 hours | 1, 2, 4, 5
Water | Flood warning | 2 | 9:00 AM 01-26-2023 | 10 hours | 3

To find other operators and examples, review [Azure Monitor log queries](https://learn.microsoft.com/en-us/azure/azure-monitor/log-query/query-language).

#### Count number of items
Use the `count` operator to discover the number of records in an input record set.

The following example returns the number of records in the `StormEvent` table. The query results reveal the `StormEvent` table has five entries.

```kusto
StormEvent | count
```
Query results:

count |
:---: |
3 |

#### Return first number of items
Use the `top` operator to see the first N records of your input record set, sorted by your specified columns. 

The columns correspond to data properties defined in the dedicated table.

The following example returns the first three data records for `StormEvent`. 

The results table shows the storm event name, the severity, and the forecasted duration.

```kusto
StormEvent | top 3 by event severity duration
```
Query results:

event | severity | duration
--- | :---: | :---:
Freezing rain | 1 | 3 hours
High winds | 1 | 12 hours
Below freezing | 2 | 10 hours

#### Find matching items
Use the `where` operator to filter your table to the subset of rows that match the supplied predicate value. 

The predicate value indicates what to search for in the table, as in `where=="find-this"`.

The following example filters the data records for StormEvent to use only records that match `"snow."`

```kusto
StormEvent | where event=="snow"
```
Your query filters to one row in the `StormEvent` table:

type | event | severity | start | duration | region
--- | --- | --- | --- | --- | ---
Water | Snow | 3 | 4:00 PM 01-26-2023 | 10 hours | 1, 2, 4, 5

#### Aggregate content
Use the `summarize` operator to create a table that aggregates the content of the input record set based on your specifications.

The following example returns an aggregate table for `StormEvent`. 

The results table shows the average (`avg`) severity level of each storm type for each `region` for all (`count`) data records in the dedicated table.

```kusto
StormEvent | summarize count(), avg(severity) by type, region
```
Query results:

type | avg(severity) | region
--- | --- | ---
Water | 2 | 1, 2, 3
Water | 3 | 4, 5
Wind | 1 | 1, 2, 4, 5
Temperature | 2 | 1, 2, 4, 5

#### Chain operators
Any query can contain an operator chain.

Suppose you want to search the `StormEvent` table to see how many days experienced below-zero freezing temperatures over the last two weeks.

If there are results, you want to see them in descending order (oldest date first).

You can create a query with chained operators: `where` and `summarize`. 

The query searches the table data collected in the past `ago(14days)`. 

It looks for matches to the string Below, which is part of the entry text `Below freezing` for the storm type `Temperature`.

The results table aggregates (`summarize`) all items (`count`) in the dedicated table and shows the returned items in descending (`desc`) order.

```kusto
StormEvent
| where (EventLevelName == "Below")
| where (TimeGenerated > ago(14days))
| summarize StormEvent = count(), desc
```
Query results:

type | event | start
--- | --- | ---
Temperature | Below freezing | 11:00 PM 01-13-2023
Temperature | Below freezing | 12:00 AM 01-14-2023
Temperature | Below freezing | 3:00 AM 01-16-2023
Temperature | Below freezing | 12:00 AM 01-17-2023
Temperature | Below freezing | 11:00 PM 01-26-2023


## Configure Network Watcher
You'll learn how to configure Network Watcher and troubleshoot common networking problems.

Learning objectives:

* Identify the features and usage cases for Azure Network Watcher.
* Configure diagnostic capabilities like IP Flow Verify, Next Hop, and Network Topology.

Administrators use Azure Network Watcher to monitor, diagnose, and gain insight into their network health and performance. 

Network Watcher provides monitoring and network diagnostics of metrics and logs data gathered from your monitored network resources.

### _Describe Azure Network Watcher features_
Azure Network Watcher provides tools to monitor, diagnose, view metrics, and enable or disable logs for resources in an Azure virtual network. 

Network Watcher is a regional service that enables you to monitor and diagnose conditions at a network scenario level.

#### Things to know about Network Watcher
Let's review some of the prominent features of Network Watcher.

Feature | Description | Scenarios
--- | --- | ---
IP flow verify | Quickly diagnose connectivity issues from or to the internet, and from or to your on-premises environment. | Identify if a security rule blocks ingress or egress traffic to or from a virtual machine <br /> <br /> Troubleshoot issues to determine if other exploration is required
Next hop | View the next connection point (or next hop) in your network route, and analyze your network routing configuration. | Determine if there's a next hop, and view the next hop target, type, and route table <br /> <br /> Confirm traffic reaches an intended target destination
VPN troubleshoot | Diagnose and troubleshoot the health of your virtual network gateway or connection with gathered data. View connection statistics, CPU and memory information, IKE security errors, packet drops, and buffers and events. | View summary diagnostics in the Azure portal <br /> <br /> Review detailed diagnostics in generated log files stored in your Azure storage account <br /> <br /> Simultaneously troubleshoot multiple gateways or connections
NSG diagnostics | Use flow logs to map IP traffic through a network security group (NSG) and gather diagnostic data. | Define prescriptive NSG rules for your organization, and conduct periodic compliance audits <br /> <br /> Compare your prescriptive NSG rules against the effective rules for each virtual machine in your network
Connection troubleshoot	 | Azure Network Watcher Connection Troubleshoot is a more recent addition to the Network Watcher suite of networking tools and capabilities. | Troubleshoot your network performance and connectivity issues in Azure <br /> <br /> Troubleshoot connection issues for a virtual machine, application gateway, or Azure Bastion host

#### Things to consider when using Network Watcher
Azure Network Watcher supports many Azure monitoring tasks and scenarios. 

As you review these features, think about how Network Watcher can support your Azure monitoring requirements.

* Consider remote monitoring. 
	* Automate remote network monitoring with packet capture. You can monitor and diagnose networking issues without logging in to your virtual machines.

* Consider alert notifications. 
	* Set alerts to trigger packet capture, and access real-time performance information at the packet level. 
	* When you observe an issue, you can investigate in detail for better diagnoses.

* Consider NSG flow log diagnosis. 
	* Use NSG flow logs to gain insight into your network traffic. 
	* Build a deeper understanding of your network traffic pattern by using NSG flow logs. 
	* Information provided by flow logs helps you gather data for compliance, auditing, and monitoring your network security profile.

* Consider log analysis. 
	* Diagnose your most common Azure VPN Gateway and connections issues.
	* You can identify issues and use the generated detailed logs to assist your analysis.

### _Review IP flow verify diagnostics_
The IP flow verify feature in Azure Network Watcher checks connectivity from or to the internet, and from or to your on-premises environment. 

This feature helps you identify if a security rule is blocking traffic to or from your virtual machine or the internet.

#### Things to know about IP flow verify
Let's examine the configuration details and functionality of the IP flow verify feature in Azure Network Watcher.

* You configure the IP flow verify feature with the following properties in the Azure portal:
	* Your subscription and resource group
	* Local (source) IP address, and local port number
	* Remote (destination) IP address, and remote port number
	* Communication protocol (TCP or UDP)
	* Traffic direction (Inbound or Outbound)

* The feature tests communication for a target virtual machine with associated network security group (NSG) rules by running inbound and outbound packets to and from the machine.

* After the test runs complete, the feature informs you whether communication with the machine succeeds (allows access) or fails (denies access).

* If the target machine denies the packet because of an NSG, the feature returns the name of the controlling security rule.

#### Things to consider when using IP flow verify
The IP flow verify feature is ideal for helping to ensure correct application of your security rules.

When you deploy a virtual machine, Azure applies several default security rules to your machine. 

The security rules allow or deny traffic to or from your virtual machine. 

You can override Azure's default rules or create other rules.

At some point, your virtual machine might be unable to communicate with other resources because of a security rule. 

You can use the IP flow verify feature to troubleshoot your NSG rules.

If test runs fail, but the IP flow verify feature doesn't indicate the issue is related to your NSG rules, you need to explore other areas, such as firewall restrictions.

### _Review next hop diagnostics_
The next hop feature in Azure Network Watcher checks if traffic is being directed to the intended destination. 

This feature lets you view the next connection point (or next hop) in your network route, and helps you verify a correct network configuration.

#### Things to know about next hop
Let's review the configuration properties and summary of the next hop feature in Azure Network Watcher.

* You configure the next hop feature with the following properties in the Azure portal:
	* Your subscription and resource group
	* Virtual machine and network interface
	* Source IP address
	* Destination IP address (If you want to confirm a specified target is reachable)

* The feature tests the next connection point in your network route configuration.

* The next hop test returns three items:
	* Next hop type
	* IP address of the next hop (If available)
	* Route table for the next hop (If available)

* The next hop type can be Internet, VirtualAppliance, VirtualNetworkGateway, VirtualNetwork, VirtualNetworkPeering, VirtualNetworkServiceEndpoint, MicrosoftEdge, or None.

* If the next hop is a user-defined route (UDR), the process returns the UDR route. Otherwise, next hop returns the system route.

* If the next hop is of type None, there might be a valid system route to the destination IP address, but no next hop exists to route the traffic to the target.

#### Things to consider when using next hop
The next hop feature is ideal for identifying unresponsive virtual machines or broken routes in your network.

When you create a virtual network, Azure creates several default outbound routes for network traffic. 

Outbound traffic from all resources (such as virtual machines) deployed in the virtual network is routed based on Azure's default routes. 

You can override Azure's default routes or create other routes.

You might find that a virtual machine can no longer communicate with other resources connected by a specific route. 

You can use the next hop feature to examine a specific source and destination IP address in your configuration.

Next hop tests the communication between the source and destination, and reports the type of next hop in the traffic route. 

You can then remove, change, or add a route, to resolve routing issues.

### _Visualize the network topology_
Administrators sometimes need to troubleshoot virtual networks that they didn't help to create. 

They might not be fully aware of all the aspects of the infrastructure and configuration.

Azure Network Watcher provides a network monitoring topology tool to help administrators visualize and understand infrastructure. 

The following image shows an example topology diagram for a virtual network in Network Watcher.

![image](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-network-watcher/media/monitor-visualization-1fb7bd5c.png)

#### Things to know about the topology tool
Review the following characteristics of the network topology capability in Azure Network Watcher.

* The Network Watcher Topology tool generates a visual diagram of the resources in a virtual network.
* The graphical display shows the resources in the network, their interconnections, and their relationships with each other.
* You can view subnets, virtual machines, network interfaces, public IP addresses, network security groups, route tables, and more.
* To generate a topology, you need an Azure Network Watcher instance in the same region as the virtual network.


## Improve incident response with alerting on Azure
Respond to incidents and activities in your infrastructure through alerting capabilities in Azure Monitor.

Learning objectives:

* Configure alerts on events in your Azure resources based on metrics, log events, and activity log events.
* Learn how to use action groups in response to an alert, and how to use alert processing rules to override action groups when necessary.

Microsoft Azure provides a robust alerting and monitoring solution called Azure Monitor.

You can use Azure Monitor to configure notifications and alerts for your key systems and applications. 

These alerts will ensure that the correct team knows when a problem arises.

### _Explore the different alert types that Azure Monitor supports_
Azure Monitor is a powerful reporting and analytics tool. 

You can use it for insights into the behavior and running of your environment and applications. 

You can then respond proactively to faults in your system.

#### Data types in Azure Monitor
Azure Monitor receives data from target resources like applications, operating systems, Azure resources, Azure subscriptions, and Azure tenants. 

The nature of the resource defines which data types are available. 

A data type can be a metric, a log, or both a metric and a log:

* The focus for metric-based data types is the numerical time-sensitive values that represent some aspect of the target resource.
* The focus for log-based data types is the querying of content data held in structured, record-based log files that are relevant to the target resource.

You'll learn about the three signal types that you can use to monitor your environment:

* Metric alerts provide an alert trigger when a specified threshold is exceeded. For example, a metric alert can notify you when CPU usage is greater than 95 percent.
* Activity log alerts notify you when Azure resources change state. For example, an activity log alert can notify you when a resource is deleted.
* Log alerts are based on things written to log files. For example, a log alert can notify you when a web server has returned a number of 404 or 500 responses.

#### Composition of an alert rule
Every alert or notification available in Azure Monitor is the product of a rule. 

Some of these rules are built into the Azure platform. 

You can use alert rules to create custom alerts and notifications. 

No matter which target resource or data source you use, the composition of an alert rule remains the same.

* RESOURCE
	* The target resource for the alert rule. 
	* You can assign multiple target resources to a single alert rule. 
	* The type of resource defines the available signal types.

* CONDITION
	* The signal type used to assess the rule. 
	* The signal type can be a metric, an activity log, or logs. 
	* There are others, but this module doesn't cover them.
	* The alert logic applied to the data that's supplied via the signal type. 
	* The structure of the alert logic changes depending on the signal type.

* ACTIONS
	* The action, like sending an email, sending an SMS message, or using a webhook.
	* An action group, which typically contains a unique set of recipients for the action.

* ALERT DETAILS
	* An alert name and an alert description that specify the alert's purpose.
	* The severity of the alert if the criteria or logic test evaluates true. The five severity levels are:
		* 0: Critical
		* 1: Error
		* 2: Warning
		* 3: Informational
		* 4: Verbose

#### Scope of alert rules
You can get monitoring data from across most of the Azure services, and report on it by using the Azure Monitor pipeline. 

In the Azure Monitor pipeline, you can create alert rules for these items and more:

* Metric values
* Log search queries
* Activity log events
* Health of the underlying Azure platform
* Tests for website availability

#### Manage alert rules
Not every alert rule that you create needs to run forever. 

With Azure Monitor, you can specify one or more alert rules and enable or disable them, as needed.

As an Azure solution architect, you'd use Azure Monitor to enable tightly focused and specific alerts before any application change. 

You'd then disable the alerts after a successful deployment.

#### Alert summary view
The alert page shows a summary of all alerts. 

You can apply filters to the view by using one or more of the following categories: subscriptions, alert condition, severity, or time ranges. 

The view includes only alerts that match these criteria.

![view](https://learn.microsoft.com/en-gb/training/modules/incident-response-with-alerting-on-azure/media/2-alerts-page.png)

#### Alert condition
The alert condition is set by the system.

* When an alert fires, the alert's monitor condition is set to Fired.
* After the underlying condition that caused the alert to fire clears, the monitor condition is set to Resolved.


### _Use metric alerts for alerts about performance issues in your Azure environment_
Azure Monitor can use thresholds to monitor specific resources. 

In an organization, it's far more useful to be notified when the free disk space on a server is less than 5 percent instead of being alerted every time a file is saved.

As a solution architect, you want to implement regular threshold monitoring for many of your target resources and instances. 

Monitoring will help to head off potential issues before they can affect your customers.

#### When would you use metric alerts?
In Azure Monitor, you can use metric alerts to achieve regular threshold monitoring of Azure resources. 

Azure Monitor runs metric alert trigger conditions at regular intervals.

When the evaluation is true, Azure Monitor sends a notification. 
 
Metric alerts are stateful, and Azure Monitor will send a notification only when the prerequisite conditions are met.

Metric alerts can be useful if, for instance, you need to know when your server CPU utilization is reaching a critical threshold of 90 percent. 

You can be alerted when your database storage is getting too low, or when network latency is about to reach unacceptable levels.

#### Composition of a metric alert
As you learned in the previous unit, all alerts are governed by their rules.

For metric alerts, there's another factor to define: the condition type. It can be static or dynamic.

You must define the type of statistical analysis to be used with either static or dynamic metric alerts. 

Example types are minimum, maximum, average, and total. In this example, you define the period of data to be assessed: the last 10 minutes. 

Finally, you set the frequency by which the alert conditions are checked: every 2 minutes.

#### Use static threshold metric alerts
Static metric alerts are based on simple static conditions and thresholds that you define. 

With static metrics, you specify the threshold that will be used to trigger the alert or notification.

In the previously defined scenario, a static alert with a threshold of 85 percent CPU utilization checks the rule every 2 minutes.

It evaluates the last 10 minutes of CPU utilization data to assess if it rises above the threshold.

If the evaluation is true, the alert triggers the actions associated with the action group.

#### Use dynamic threshold metric alerts
Dynamic metric alerts use machine-learning tools that Azure provides to automatically improve the accuracy of the thresholds defined by the initial rule.

There's no hard threshold in dynamic metrics. 

However, you'll need to define two more parameters:

* The look-back period defines how many previous periods need to be evaluated. 
* For example, if you set the look-back period to 3, then in the example used here, the assessed data range would be 30 minutes (three sets of 10 minutes).

* The number of violations expresses how many times the logic condition has to deviate from the expected behavior before the alert rule fires a notification. 
* In this example, if you set the number of violations to two, the alert would be triggered after two deviations from the calculated threshold.

#### Understand dimensions
Until now, the assessed metric alerts have focused on a single target instance. 

Azure Monitor supports dimensions, which enable monitoring data to be supplied from multiple target instances.

You can use dimensions to define one metric alert rule and have it applied to multiple related instances. 

For example, you can monitor CPU utilization across all the servers running your app. 

You can then receive an individual notification for each server instance when the rule conditions are triggered.

You can define the dimensions by naming each target instance specifically, or you can define the dimensions by using the asterisk (*) wildcard, which will use all available instances.

#### Scale metric alerts
Azure Monitor supports the creation of metric alerts that, like dimensions, monitor multiple resources. 

Scaling is currently limited to Azure virtual machines. 

However, a single metric alert can monitor resources in one Azure region.

Creating scaling metric alert rules to monitor multiple resources is no different than creating any other metric alert rule. You just select all the resources you want to monitor.

Like dimensions, a scaling metric alert is individual to the resource that triggered it.


### _Use log alerts to alert on events in your application_
You can use Azure Monitor to capture important information from log files. 

These log files can be created by applications, operating systems, other hardware, or Azure services.

As a solution architect, you want to explore ways that monitoring log data can detect issues before they become issues for your customers. 

You know that Azure Monitor supports the use of log data.

#### When to use log alerts
Log alerts use log data to assess the rule logic and, if necessary, trigger an alert. 

This data can come from any Azure resource: server logs, application server logs, or application logs.

By its nature, log data is historical, so usage is focused on analytics and trends.

You can use these types of logs to assess if any of your servers have exceeded their CPU utilization by a given threshold during the last 30 minutes, or you can evaluate response codes issued on your web application server in the last hour.

#### How log alerts work
Log alerts behave in a slightly different way from other alert mechanisms. 

The first part of a log alert defines the log search rule. 

The rule defines how often it should run, the time period under evaluation, and the query to be run.

When a log search evaluates as positive, an alert record is created and any associated actions are triggered.

#### Composition of log search rules
Every log alert has an associated search rule. The composition of these rules is as follows:

* **Log query:** Query that runs every time the alert rule fires.
* **Time period:** Time range for the query.
* **Frequency:** How often the query should run.
* **Threshold:** Trigger point for an alert to be created.

Log search results are one of two types: number of records or metric measurement.

#### Number of records
Consider using the number-of-records type of log search when you're working with an event or event-driven data. Examples are syslog and web-app responses.

This type of log search returns a single alert when the number of records in a search result reaches or exceeds the value for the number of records (threshold). 

For example, when the threshold for the search rule is greater or equal to five, the query results have to return five or more rows of data before the alert is triggered.

#### Metric measurement
Metric measurement logs offer the same basic functionality as metric alert logs.

Unlike number-of-records search logs, metric measurement logs require additional criteria to be set:

* Aggregate function: The calculation that will be made against the result data. An example is count or average. The result of the function is called AggregatedValue.
* Group field: A field by which the result will be grouped. This criterion is used with the aggregated value. For example, you might specify that you want the average grouped by computer.
* Interval: The time interval by which data is aggregated. For example, if you specify 10 minutes, an alert record is created for each aggregated block of 10 minutes.
* Threshold: A point defined by an aggregated value and the total number of breaches.


Consider using this type of alert when you need to add a level of tolerance to the results found. 

One use for this type of alert is to respond if a particular trend or pattern is found. 

For example, if the number of breaches is five, and any server in your group exceeds 85 percent CPU utilization more than five times within the given time period, an alert is fired.

As you can see, metric measurements greatly reduce the volume of alerts that are produced.

Give careful consideration when you're setting the threshold parameters to avoid missing critical alerts.

#### Stateless nature of log alerts
One of the primary considerations when you're evaluating the use of log alerts is that they're stateless (stateful log alerts are currently in preview). 

A stateless log alert will generate new alerts every time the rule criteria are triggered, regardless of whether the alert was previously recorded.


### _Use activity log alerts to alert on events within your Azure infrastructure_
Activity log alerts allow you to be notified when a specific event happens on some Azure resource. 

For example, you can be notified when someone creates a new VM in a subscription.

An activity log can also include alerts for Azure service health. 

A company can be notified when service issues or planned maintenance happens on the Azure platform.

As an Azure solution architect, you want to explore the capability to monitor selected Azure resources within your subscription. 

You'll understand how the resources can be used to improve your team's responsiveness and the stability of your systems.

#### When to use activity log alerts
Activity log alerts are designed to work with Azure resources. 

Typically, you'd create this type of log to receive notifications when specific changes occur on a resource within your Azure subscription.

There are two types of activity log alerts:

* **Specific operations:** 
	* Applies to resources within your Azure subscription, and often has a scope with specific resources or a resource group. 
	* You'll use this type when you need to receive an alert that reports a change to an aspect of your subscription. 
	* For example, you can receive an alert if a VM is deleted or new roles are assigned to a user.

* **Service health events:** Include notice of incidents and maintenance of target resources.

#### Composition of an activity log alert
It's important to note that activity log alerts will monitor events only in the subscription where the log alert was created.

Activity log alerts are based on events. 

The best approach for defining them is to use Azure Monitor to filter all the events in your subscription until you find the one that you want. 

To begin the creation process, you'll then select Add activity log alert.

Like the previous alerts, activity log alerts have their own attributes:

* Category: Administrative, service health, autoscale, policy, or recommendation
* Scope: Resource level, resource group level, or subscription level
* Resource group: Where the alert rule is saved
* Resource type: Namespace for the target of the alert
* Operation name: Operation name
* Level: Verbose, informational, warning, error, or critical
* Status: Started, failed, or succeeded
* Event initiated by: Email address or Azure Active Directory identifier (known as the "caller") for the user

#### Create a resource-specific log alert
When you create your activity log alert, you'll select Activity Log for the signal type. 

You'll then see all the available alerts for the resource you select. 

The following image shows all the administrative alerts for Azure VMs. 

In this example, an alert is triggered when a VM is powered off.

Changing the monitor service will enable you to reduce the list of options. Selecting Administrative filters all the signals to show only admin-related signals.

![image](https://learn.microsoft.com/en-gb/training/modules/incident-response-with-alerting-on-azure/media/6-example-activity-log-alert.png)

#### Create a service health alert
Service health alerts aren't like all the other alert types you've seen so far in this module. 

To create a new alert, search for and select Service Health in the Azure portal. 

Next, select Health alerts. After you select Create service health alert, the steps to create the alert are similar to the steps you've seen to create other alerts.

![image](https://learn.microsoft.com/en-gb/training/modules/incident-response-with-alerting-on-azure/media/6-service-health-alerts.png)

The only difference is that you no longer need to select a resource, because the alert is for a whole region in Azure. 

What you can select is the kind of health event on which you want to be alerted. 

You can select service issues, planned maintenance, health advisories, or choose all of the events. 

The remaining steps of performing actions and naming the alerts are the same.

### _Use action groups and alert processing rules to send notifications when an alert is fired_
When an alert is fired, Azure Monitor, Azure Service Health, and Azure Advisor use action groups to notify users about the alert and take an action. 

An action group is a collection of notification preferences and actions that are executed when the alert is fired. 

You can run one or more actions for each triggered alert.

Azure Monitor can perform any of the following actions:

* Send an email
* Send an SMS message
* Create an Azure app push notification
* Make a voice call to a number
* Call an Azure function
* Trigger a logic app
* Send a notification to a webhook
* Create an ITSM ticket
* Use a runbook (to restart a VM, or scale a VM up or down)

Once you've created an action group, you can reuse that action group as often as you want. 

For example, after you've created an action to email your company's operations team, you can add that action group to all service health events.

While you're creating the alert rule, you can either create a new action group or add an existing action group to the alert rule. 

You can also edit an existing alert to add an action group.

#### Alert processing rules
Use alert processing rules to override the normal behavior of a fired alert by adding or suppressing an action group. 

You can use alert processing rules to add action groups or remove (suppress) action groups from your fired alerts. 

Alert processing rules are different from alert rules. 

Alert rules trigger alerts when a condition is met in your monitored resources. 

Alert processing rules modify the alerts as they're being fired.

You can use alert processing rules to:

* Suppress notifications during planned maintenance windows
* Implement management at scale, by specifying commonly used logic in a single rule, instead of having to set it consistently in all your alert rules.
* Add an action group to all alert types

You can apply alert processing rules to different resource scopes, from a single resource, or to an entire subscription. 

You can also use them to apply various filters or have the rule work on a predefined schedule.

You can control when the alert processing rule applies.

By default the rule is always active, but you can select a one-time window for this rule to apply, or you can have set a recurrence, such as a weekly recurrence.



## Analyze your Azure infrastructure by using Azure Monitor logs
Use Azure Monitor logs to extract valuable information about your infrastructure from log data.

Learning objectives:

* Identify the features and capabilities of Azure Monitor logs.
* Create basic Azure Monitor log queries to extract information from log data.

Logging and monitoring the health of your services is a vital component of production applications. 

You need to be able to determine the causes of failures. You also need to identify any problems before they occur.

Azure Monitor is an important tool to help you in this process. 

It allows you to gather monitoring and diagnostic information about the health of your services. 

You can use this information to visualize and analyze the causes of problems that might occur in your app.

### _Features of Azure Monitor logs_
Azure Monitor is a service for collecting and analyzing telemetry. 

It helps you get maximum performance and availability for your cloud applications, and for your on-premises resources and applications. 

It shows how your applications are performing and identifies any issues with them.

#### Data collection in Azure Monitor
Azure Monitor collects two fundamental types of data: metrics and logs. 

Metrics tell you how the resource is performing, and the other resources that it's consuming. 

Logs contain records that show when resources are created or modified.

Azure Monitor collects data automatically from a range of components. For example:

* Application data: Data that relates to your custom application code.
* Operating system data: Data from the Windows or Linux virtual machines that host your application.
* Azure resource data: Data that relates to the operations of an Azure resource, such as a web app or a load balancer.
* Azure subscription data: Data that relates to your subscription. It includes data about Azure health and availability.
* Azure tenant data: Data about your Azure organization-level services, such as Azure Active Directory.

Because Azure Monitor is an automatic system, it begins to collect data from these sources as soon as you create Azure resources like virtual machines and web apps. 

You can extend the data that Azure Monitor collects by:

* Enabling diagnostics:
	* For some resources, such as Azure SQL Databases, you'll receive full information about a resource only after you have enabled diagnostic logging for it. 
	* You can use the Azure portal, the Azure CLI, or PowerShell to enable diagnostics.

* Adding an agent:
	* For virtual machines, you can install the Log Analytics agent and configure it to send data to a Log Analytics workspace. 
	* This agent increases the amount of information that's sent to Azure Monitor.

Your developers might also want to send data to Azure Monitor from custom code, such as a web app, an Azure function, or a mobile app. 

They send data by calling the Data Collector API. 

You can communicate with this REST interface through HTTP. 

This interface is compatible with various development frameworks, such as .NET Framework, Node.js, and Python. 

Developers can choose their favorite language and framework to log data in Azure Monitor.

#### Logs
Logs contain time-stamped information about changes made to resources. 

The type of information recorded varies by log source. 

The log data is organized into records, with different sets of properties for each type of record. 

The logs can include numeric values such as Azure Monitor metrics, but most include text data rather than numeric values.

The most common type of log entry records an event.

Events can occur sporadically rather than at fixed intervals or according to a schedule. 

Events are created by applications and services, which provide the context for the events. 

You can store metric data in logs to combine them with other monitoring data for analysis.

You can log data from Azure Monitor in a Log Analytics workspace. 

Azure provides an analysis engine and a rich query language. 

The logs show the context of any problems, and are useful for identifying root causes.

#### Metrics
Metrics are numerical values that describe some aspect of a system at a point in time. 

Azure Monitor can capture metrics in near-real time. 

The metrics are collected at regular intervals, and are useful for alerting because of their frequent sampling. 

You can use various algorithms to compare a metric to other metrics and observe trends over time.

#### Analyzing logs by using Kusto
To retrieve, consolidate, and analyze data, you can specify a query to run in Azure Monitor logs. 

You can write a log query with the Kusto query language, which Azure Data Explorer also uses.

You can test log queries in the Azure portal so you can work with them interactively. 

You'll typically start with basic queries, then progress to more advanced functions as your requirements become more complex.

In the Azure portal, you can create custom dashboards, which are targeted displays of resources and data. 

Each dashboard is built from a set of tiles. 

Each tile might show a set of resources, a chart, a table of data, or some custom text. Azure Monitor provides tiles that you can add to dashboards.

For example, you might use a tile to display the results of a Kusto query in a dashboard.

By using Azure dashboards, you can combine various kinds of data, including both logs and metrics, into a single pane in the Azure portal. 

For example, you might want to create a dashboard that combines tiles that show a graph of metrics, a table of activity logs, charts from Azure Monitor, and the output of a log query.


### _Create basic Azure Monitor log queries to extract information from log data_
You can use Azure Monitor log queries to extract information from log data. 

Querying is an important part of examining the log data that Azure Monitor captures.

#### Write Azure Monitor log queries by using Log Analytics
You can find the Log Analytics tool in the Azure portal and use it to run sample queries or to create your own queries:

1. In the Azure portal, in the left menu pane, select Monitor.

The Azure Monitor page appears along with more options, including Activity Log, Alerts, Metrics, and Logs.

1. Select Logs.

Here, you can enter your query and see the output.

![console](https://learn.microsoft.com/en-gb/training/modules/analyze-infrastructure-with-azure-monitor-logs/media/3-azure-monitor-portal-query-pane.png)

#### Write queries by using the Kusto language
You use the Kusto Query Language to query log information for your services running in Azure.

A Kusto query is a read-only request to process data and return results. 

You'll state the query in plain text by using a data-flow model that's designed to make the syntax easy to read, write, and automate. 

The query uses schema entities that are organized in a hierarchy similar to that of Azure SQL Database: databases, tables, and columns.

A Kusto query consists of a sequence of query statements, delimited by a semicolon (`;`). At least one statement is a tabular expression statement. 

A tabular expression statement formats the data arranged as a table of columns and rows.

The syntax of a tabular expression statement has a tabular data flow from one tabular query operator to another, starting with a data source. 

A data source might be a table in a database, or an operator that produces data. 

The data then flows through a set of data-transformation operators that are bound together with the pipe (`|`) delimiter.

> The Kusto query language that Azure Monitor uses is case-sensitive. 
> Language keywords are typically written in lowercase. 
> When you're using names of tables or columns in a query, make sure to use the correct case.

Events captured from the event logs of monitored computers are just one type of data source. 

Azure Monitor provides many other types of data sources. 

For example, the Heartbeat data source reports the health of all computers that report to your Log Analytics workspace. 

You can also capture data from performance counters and update management records.

The following example retrieves the most recent heartbeat record for each computer

```kusto
Heartbeat
| summarize arg_max(TimeGenerated, *) by ComputerIP
```


## Monitor performance of virtual machines by using Azure Monitor VM Insights
Deploy monitoring for workloads on virtual machines. 

Set up a log analytics workspace, onboard virtual machines to Azure Monitor VM Insights, and build log queries by using Kusto Query Language.

Learning objectives

* Evaluate Azure Monitor Logs and Azure Monitor VM Insights.
* Configure a Log Analytics workspace.
* Build queries from the Heartbeat and InsightsMetrics tables.

### _What are Azure Monitor Logs and Azure Monitor VM Insights?_
Azure Monitor Logs collects and organizes log data generated from Azure resources. 

Log data is stored in a Log Analytics workspace. 

You can query data living in the workspace for trend analysis, reporting, and alerting. 

Some examples of data captured include Windows event logs, Heartbeat logs, performance data, and Syslogs.

Azure Monitor VM Insights is a feature of Azure Monitor that relies on Azure Monitor Logs. 

Think of Azure Monitor VM Insights as a feature that provides a predefined, curated monitoring experience, with little configuration required. 

Azure Monitor VM Insights use a table named InsightsMetrics. Administrators can query performance and usage for virtual machines by using that table. 

The data generated allows you to display everything in a meaningful way. Administrators can also use Azure Monitor VM Insights to process log data without exposing the underlying queries.

#### What is the relationship between all the Azure native monitoring tools?
There are a few different resources and services that complete the native monitoring toolkit in Azure. 

Azure Monitor becomes the service at the top, which spans across all monitoring tools, while everything else lives underneath. 

The service collects and analyzes data generated from Azure resources. Azure Monitor captures monitoring data from the following sources:

* Application
* Guest OS
* Azure resources
* Azure subscriptions
* Azure tenant

Data collected by Azure Monitor is composed of metrics in Azure Monitor Metrics and logs in Azure Monitor Logs. 

Azure Monitor Metrics are lightweight numerical values stored in a time-series database that can be used for near-real-time alerting. 

Some examples of metrics captured include IOPS percentages and CPU cycles.

The major difference between Azure Monitor Metrics and Azure Monitor Logs is the structure of data generated. 

Azure Monitor Metrics only stores numeric data using a specific structure.

Azure Monitor Logs can store Azure Monitor Metrics data and various other data types, each using their own structure.

In addition to logs and metrics, Azure resources also emit Azure platform logs, which are collected by Azure Monitor.

Platform logs provide comprehensive diagnostic and auditing information for Azure resources and the underlying Azure platform. 

Platform logs are resource logs (formerly known as diagnostic logs), activity logs, and Azure Active Directory logs. 

All resources automatically generate platform logs. 

Administrators might need to configure certain platform logs to be forwarded to one or more destinations (like Log Analytics) in order to be kept.

#### Plan a Log Analytics workspace deployment
One of the tasks involved with a Log Analytics deployment is picking the right design. 

Log Analytics workspaces are containers where Azure Monitor data is collected, aggregated, and analyzed. 

To better understand Log Analytics workspaces, the following diagram provides more insight into all the different types of logs that can be ingested. 

These logs include everything from Event logs to Syslogs to Heartbeats, and so on. 

There are also Azure resources that can send platform logs and Azure Activity logs to the workspace.

Many Azure features help Log Analytics workspace adoption within enterprises. Log Analytics workspaces now provide different levels of access control for the collected logs.

Feature | Description | Notes
--- | --- | ---
Access mode | Involves how users access a Log Analytics workspace, plus defines data scope | There are two options. Workspace-context provides access to all logs in a workspace where the permission is assigned. Queries are scoped to all data in all tables <br /> <br /> Resource-context provides access to view logs for resources in all tables you have access to. Queries are scoped to only data associated with that resource.
Access control mode | Defines how permissions work for any given Log Analytics workspace | Require workspace permissions means a user would have access to all data in any table where permissions have been defined, which doesn't allow granular role-based access control (RBAC). <br /> <br /> Use resource or workspace permissions allows for granular RBAC, because users can only see log data for resources they're permitted to view.
Table-level RBAC | Provides a mechanism to define more granular data control inside a Log Analytics workspace with other permissions listed in the table | This feature allows an administrator to define what specific data types are accessible to a set of users. <br /> <br /> Configuring table-level RBAC requires Azure custom roles to either grant or deny access to specific tables.

The best strategy is to limit the total number of workspaces required for daily operations. 

Reducing the number of workspaces will make administration and query experience easier and quicker. 

Multiple workspaces might still need to be a design consideration for certain companies. 

#### Azure collects compute monitoring data by using agents
Compute resources in Azure require many agents to help collect monitoring data inside Log Analytics and Azure Monitor. 

Each agent allows customers to measure performance, responsiveness, and availability of guest operating systems and underlying workloads.

The following table lists each agent:

Agent | Description | Notes
--- | --- | ---
Azure Monitor Agent | Collects monitoring data from guest operating systems on VMs and delivers data to Azure Monitor logs and/or metrics | Over time, this agent will replace the Log Analytics Agent and Azure diagnostic extension.
Log Analytics agent | Collects logs and performance data for virtual machines in Azure, other clouds, or on-premises | Allows for the onboarding of Azure Monitor VM Insights, Microsoft Defender for Cloud, and Microsoft Sentinel. <br /> <br /> The agent also works with Azure Automation accounts to onboard Azure Update Management and Azure Automation State Configuration.
Azure diagnostics extension | Enables customers to receive extra data from guest operating systems and workloads living on compute resources | Data primarily captured with this extension will be sent to Azure Monitor Metrics.
Dependency agent | Collects discovered data about certain processes running on virtual machines | Maps all dependencies between virtual machines and any external process dependencies.

As referenced earlier, Azure Monitor VM Insights needs to be configured for the Log Analytics workspace. 

Azure Monitor VM Insights is a newer service that provides extra visibility and capabilities for data collection of virtual machines.


### _Build log queries by using the Kusto Query Language_
Several Azure services use Azure Monitor Logs to store data and use the Kusto Query Language (KQL) to extract data. 

Microsoft Defender for Cloud, Microsoft Sentinel, and Azure Monitor Application Insights all use Log Analytics workspaces to store and query logs. 

Azure Monitor Logs are based on Azure Data Explorer. 

A Log Analytics workspace is the equivalent of a database inside Azure Data Explorer.

To unlock the full range of possibilities with Azure Monitor Logs, you'll need to use log queries. 

These queries help you obtain a deep understanding of data collected in Azure Monitor Logs. 

The underlying query language allows for complex operations with minimal code. 

Kusto is a rich language designed to be easy to read and author.

All data generated in Azure Monitor Logs is available to collect and examine through log queries. Different Azure data sources write to different log tables.

Log Analytics is the primary tool used for writing log queries and analyzing results. 

Even if a log query is used elsewhere in Azure Monitor, you'll typically write and test the query by using Log Analytics.

In addition to writing and working with log queries in Log Analytics, you can use log queries in the following areas:

Feature | Description
--- | ---
Alert rules | Proactively identify issues related to Azure resources reporting into your workspace. Each alert rule consists of a log search, which automatically runs at regular intervals.
Dashboards | Results of any query can be pinned to an Azure dashboard.
Export | Azure Monitor data can be imported into Excel or Power BI. Prior to the import, you'll create a log query that defines all data to export.
PowerShell | A PowerShell script can be run from a command line or an Azure Automation runbook. The script retrieves log data from Azure Monitor and determines the data to collect based on the query.
Azure Monitor Logs API | Allows for any REST API client to receive and collect log data from the workspace.

#### Kusto syntax and operators
At its core, a Kusto query is a read-only request. 

The request processes data and returns results. 

The request comes back in plain text, which makes the data easy to read. 

Each query uses schema entities that are organized into a hierarchy similar to SQL: databases, tables, and columns.

A query consists of references to actual tables and one or more query operators applied in sequence.

When you look at a query, each reference is indicated visually by the use of a pipe character (|) to delimit operators. 

At least one statement in the query is a tabular expression statement, which is a statement that produces data arranged in columns and rows.

Tabular operators will predominantly be how you'll interact with and query monitoring data. 

Tabular operators such as count, distinct, evaluate, join, limit, and project are all relevant in formulating queries. 

Since the KQL was originally written for Azure Data Explorer, there are a number of additional ways to manipulate data that are outside the scope of this Learn module. 

The language is powerful and can perform complex analysis on generated data.

#### Understand the schema and schema pane
The schema is a series of tables logically grouped together. 

The schema allows for an easy understanding behind how Log Analytics stores data. 

The schema displays on the schema pane located on the far left of a Log Analytics workspace. 

The schema is helpful when you craft queries.

As you look at the schema pane, you'll begin to understand that you don't have to build a query from scratch. You're able to:

* Identify a table as a favorite.
* Change scopes so you only see the relevant tables for the resources you select.
* Display metadata to easily find what you need.

#### Write a new query
Starting with a table name is the right way to configure log queries.

Using a table name defines a clear scope for the query, which improves query performance and relevance of the results.

The KQL is case sensitive. 

Language keywords are typically written in lowercase, such as consume, count, distinct, evaluate, join, limit, and project. 

When you use names of tables or columns in a query, make sure to use the correct case. 

If you're ever stuck, the schema pane will show how to use correct casing for the table name.

#### Basic query understanding
One of the tables captured by Azure Monitor is the Heartbeat table. 

This table contains a number of useful columns. 

Heartbeat captures data on everything from OS type, OS major version, resource ID, and resource group. 

To understand all columns that make up this table, run a query with only Heartbeat.

![heartbeat](https://learn.microsoft.com/en-gb/training/modules/monitor-performance-using-azure-monitor-for-vms/media/4-heartbeat-query.png#lightbox)

In the results pane at the bottom of logs, you'll find some of the following fields in the screenshot: TimeGenerated [UTC], SourceComputerId, ComputerIP, Computer, Category, OSType, and so on. 

Each of these columns is a data point you can filter on.

The tabular operators can be applied to help the query return more relevant and specific information you want to examine. 

Recall that tabular operators help you filter on extracted data. 

There seem to be many results received from Heartbeat in this example. 

You know from the previous module that only two virtual machines are reporting to the Log Analytics workspace. 

To make sure there are only two virtual machines reporting to the workspace, let's add the distinct operator to this query.

![query](https://learn.microsoft.com/en-gb/training/modules/monitor-performance-using-azure-monitor-for-vms/media/4-distinct-operator.png#lightbox)

The results now show only two virtual machines are reporting to the workspace. 

Heartbeat acts like an inventory of all virtual machines reporting to a specific workspace. 

The distinct operator produces a table with the distinct combination of columns requested within the input query.

