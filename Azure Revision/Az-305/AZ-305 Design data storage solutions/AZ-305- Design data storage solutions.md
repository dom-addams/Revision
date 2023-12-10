# _AZ-305: Design data storage solutions_
Design data storage solutions including non-relational storage, relational storage, and data integration.

# _Design a data storage solution for non-relational data_
Azure Architects design and recommend non-relational data storage solutions.

Learning objectives:

* Design for data storage.
* Design for Azure storage accounts.
* Design for Azure blob storage.
* Design for data redundancy.
* Design for Azure files.
* Design an Azure disk solution.
* Design for storage security.

## Design for data storage
The first step in your design for Azure storage is to determine what types of data are required to support the organization. 

In general, data can be classified in three ways: 

* Structured
* Semi-structured
* Unstructured. 

Most organizations need to provide storage options for all data types.

### Things to know about types of data
The following table describes three data types. Consider how these different types are used in your organization.

Structured | Semi-structured | Unstructured
--- | --- | ---
Structured data is stored in a relational format that has a shared schema. <br /> Structured data is often contained in a database table with rows, columns, and keys. | Semi-structured data is less organized. <br /> The data fields don't fit neatly into tables, rows, and columns. <br /> Semi-structured data contains tags that clarify how the data is organized. <br /> The data is defined by using a serialization language. | Unstructured data is the least organized. This data is a mix of information that's stored together, but the data doesn't have a clear relationship. <br /> The format of unstructured data is referred to as non-relational.
- Relational databases, such as medical records, phone books, and financial accounts. <br /> - Application data for an e-commerce website. | - Hypertext Markup Language (HTML) files. <br /> - JavaScript Object Notation (JSON) files <br /> - Extensible Markup Language (XML) files | - Media files like photos, videos, and audio <br /> - Office files, such as Word documents and PowerPoint slides <br /> - Text files like PDF, TXT, and RTF

### Things to consider when choosing data storage
Non-relational data in Azure can be stored in several different data objects. 

We'll look at scenarios that implement four storage objects. 

As you review these options think about what types of non-relational data are of most interest to your organization. 

Consider the storage objects that you might need to implement.

* Consider Azure Blob Storage. 
	* Store vast amounts of unstructured data by using Azure Blob Storage. 
	* Blob stands for Binary Large Object. 
	* Blob Storage is often used for images and multimedia files.

* Consider Azure Files. 
	* Provide fully managed file shares in the cloud with Azure Files. 
	* This storage data is accessible via the industry standard Server Message Block (SMB) protocol, Network File System (NFS) protocol, and the Azure Files REST API.

* Consider Azure managed disks.
	* Support Azure Virtual Machines by using Azure managed disks. 
	* These disks are block-level storage volumes that are managed by Azure. 
	* Managed disks perform like physical disks in an on-premises server, but in a virtual environment.

* Consider Azure Queue Storage. 
	* Use Azure Queue Storage to store large numbers of messages. 
	* Queue Storage is commonly used to create a backlog of work to process asynchronously.



## Design for Azure storage accounts
After you determine the data storage requirements for your organization, you need to create storage accounts.

An [Azure storage account](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview) groups together all of your Azure Storage services. 

The storage account provides a unique namespace that's accessible from anywhere (assuming you have the correct permissions) in the world over HTTPS. 

Data in your storage account is durable and highly available, secure, and massively scalable.

A storage account represents a collection of settings like location, replication strategy, and subscription owner. 

Organizations often have multiple storage accounts so they can implement different sets of requirements. 


### Things to know about storage account types
Azure Storage offers several storage account options. 

Each storage account supports different features and has its own pricing model. 

Review the following options and think about what storage accounts are required to support different applications.

Storage account | Supported services | Recommended usage
--- | --- | ---
[Standard general-purpose v2](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-upgrade) | Blob Storage (including Data Lake Storage), Queue Storage, Table Storage, and Azure Files | Standard storage account for most scenarios, including blobs, file shares, queues, tables, and disks (page blobs).
[Premium block blobs](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-block-blob-premium/) | Blob Storage (including Data Lake Storage) | Premium storage account for block blobs and append blobs. <br /> Recommended for applications with high transaction rates. <br /> Use Premium block blobs if you work with smaller objects or require consistently low storage latency.
[Premium file shares](https://learn.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share) | Azure Files | Premium storage account for file shares only. Recommended for enterprise or high-performance scale applications. 
[Premium page blobs](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-pageblob-overview) | Page blobs only | Premium high-performance storage account for page blobs only. <br /> Page blobs are ideal for storing index-based and sparse data structures, such as operating systems, data disks for virtual machines, and databases.


### Things to consider when choosing storage accounts
You've reviewed Azure storage account options and some scenarios for when to use different types of storage accounts. 

If you're already using storage accounts, explore how well the configuration meets the business scenarios.

* Consider your storage locations. 
	* Locate data storage close to where it's most frequently used to increase performance. 
	* Do organisations have data that's specific to a country or region? You might need a storage account to best support each location.

* Consider compliance requirements. 
	* Are there guidelines for keeping data in a specific location? Does your company have internal requirements for auditing or storing data? 
	* You might require different storage accounts to meet the different requirements.

* Consider data storage costs. 
	* Factor in data storage costs into your plan. 
	* A storage account by itself has no financial cost. 
	* But, the settings you choose for the account do influence the cost of services in the account. 
	* Geo-redundant storage costs more than locally redundant storage. 
	* Premium performance and the hot access tier increase the cost of blobs. 
	* Do you need to keep track of expenses or billing by department or project? Are you working with partners where storage costs need to be separated?
	* By creating multiple storage accounts, you can better control the overall costs.

* Consider replication scenarios. 
	* Configure data storage to support different replication strategies.
	* You could partition your data into critical and non-critical categories. 
	* You could place critical data into a storage account with geo-redundant storage. 
	* You could put non-critical data in a different storage account with locally redundant storage.

* Consider administrative overhead. 
	* Plan for administrative overhead in your storage design. 
	* Each storage account requires some time and attention from an administrator to create and maintain. 
	* Using multiple storage accounts increases the complexity for users who add data to your cloud storage. 
	* Users in this role need to understand the purpose of each storage account to ensure they add new data to the correct account.

* Consider data sensitivity. 
	* Protect sensitive and proprietary data in your data storage. 
	* You can enable virtual networks for proprietary data and not for public data. 
	* This scenario might require separate storage accounts.

* Consider data isolation. 
	* Segregate regulatory and compliance data, or local policies by using multiple storage accounts. 
	* You can separate data in one application from data in another application to ensure data isolation.



## Design for data redundancy
Azure Storage always stores multiple copies of your data. 

This redundancy ensures the data is protected from planned and unplanned events. 

These events can include transient hardware failures, network or power outages, and massive natural disasters. 

[Storage redundancy](https://learn.microsoft.com/en-us/azure/storage/common/storage-redundancy) ensures your storage account meets its availability and durability targets.

### Things to know about data redundancy
Review the following characteristics of data redundancy in Azure Storage.

* Redundancy is achieved by replicating data to a primary region.
* When you create a storage account, you select the primary region for the account.
* The primary region supports two replication options: locally redundant storage (LRS) and zone-redundant storage (ZRS).
* Replication can also be done for a secondary region. A secondary region is recommended for applications that require high durability.
* The paired secondary region is determined based on the primary region and can't be changed.
* The secondary region is usually in a geographic location that's distant to the primary region. The distance helps to protect against regional disasters.
* The secondary region supports two replication options: geo-redundant storage (GRS) and geo-zone-redundant storage (GZRS).

### Redundancy in the primary region
Azure Storage offers two options for how your data is replicated in the primary region: **locally redundant storage** and **zone-redundant storage**.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-data-storage-solution-for-non-relational-data/media/data-redundancy.png)

* locally redundant storage:
	* The lowest-cost redundancy option, and offers the least durability. 
	* LRS protects your data against server rack and drive failures. 
	* However, if the data center fails, all replicas of a storage account that use LRS might be lost or unrecoverable.

* Zone-redundant storage:
	* Replicates synchronously across three Azure availability zones in the primary region. 
	* With ZRS, your data is still accessible for both read and write operations even if a zone becomes unavailable

### Redundancy in a secondary region
For applications that require high durability, you can choose to copy the data in your storage account to a secondary region. 

Azure Storage offers two options for copying your data to a secondary region: **geo-redundant storage** and **geo-zone-redundant storage**.

[IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-data-storage-solution-for-non-relational-data/media/geo-redundant-storage.png)

* The primary difference between GRS and GZRS is how data is replicated in the primary region. Within the secondary region, data is always replicated synchronously with LRS.

* If the primary region becomes unavailable, you can choose to fail over to the secondary region. After the failover has completed, the secondary region becomes the primary region, and you can again read and write data.

* Data is replicated to the secondary region asynchronously. A failure that affects the primary region might result in data loss if the primary region can't be recovered.

* With GRS or GZRS, the data in the secondary region isn't available for read or write access unless there's a failover to the secondary region. For read access to the secondary region, configure your storage account to use read-access geo-redundant storage (RA-GRS) or read-access geo-zone-redundant storage (RA-GZRS).

### Things to consider when using data redundancy
You've reviewed the different options for implementing replication. Data redundancy is accomplished through a primary region and paired secondary region

As you plan the storage accounts and redundancy settings, consider the following factor.

* Consider primary replication options. 
	* Explore different scenarios for how data can be replicated in the primary region. 
	* The redundancy options present tradeoffs between lower costs and higher availability. 
	* Some business centers can require more data redundancy. 
	* Specific departments or regions might work with data that's not sensitive or which doesn't require high durability. 
	* You can implement multiple storage accounts with different redundancy to control the overall costs across the organization.

* Consider locally redundant storage. 
	* Implement LRS for a low cost redundancy solution, but with limited durability. 
	* LRS is suited for apps that store data that can be easily reconstructed if data loss occurs.
	* LRS is also a good choice for apps that are restricted to replicating data only within a country or region due to data governance requirements.

* Consider zone-redundant storage. 
	* Choose ZRS for excellent performance, low latency, and resiliency for your data if it becomes temporarily unavailable. 
	* Keep in mind that ZRS by itself might not protect your data against a regional disaster where multiple zones are permanently affected.

* Consider secondary regions. 
	* For applications requiring high durability, you can choose to additionally copy the data in your storage account to a secondary region.
	* If your storage account is copied to a secondary region, then your data is durable even in the case of a complete regional outage or a disaster in which the primary region isn't recoverable.

* Consider read access requirements. 
	* Identify applications that require read access to the replicated data in the secondary region, if the primary region becomes unavailable for any reason. 
	* Configure your storage account with read access to the secondary region. 
	* Your applications can seamlessly shift to reading data from the secondary region if the primary region becomes unavailable.



## Design for Azure Blob Storage
There are two main points to consider in an implementation plan for [Azure Blob Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blobs-overview). 

First, you need to identify which Azure blob access tier satisfies your organization's storage availability, latency, and cost requirements. 

The second consideration is to decide if you need access to immutable storage.

There are four access options: Premium Blob Storage, and the Hot, Cool, and Archive access tiers. 

All four options support availability and latency, but they have differing costs depending on the level of support. 

All options also support immutable storage, but the storage is implemented differently for the Hot, Cool, and Archive access tiers.

The four access options for Azure Blob Storage offer a range of features and support levels to help you optimize your storage costs.

Comparison | Premium Blob Storage | Hot access tier | Cool access tier | Archive access tier
--- | --- | --- | --- | ---
Availability | 99.9% | 99.9% | 99% | Offline
Availability (RA-GRS reads) | N/A | 99.99% | 99.9% | Offline
Latency (time to first byte) | Single-digit milliseconds | milliseconds | milliseconds | hours
Minimum storage duration | N/A | N/A | 30 days | 180 days
Usage costs | Higher storage costs, Lower access & transaction costs | Higher storage costs, Lower access & transaction costs | Lower storage costs, Higher access & transaction costs | Lowest storage costs, Highest access & transaction costs

### Things to know about Azure blob access tiers
Think about your data sets, and which access options can satisfy the requirements.

* [Premium Blob Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-performance-tiers) 
	* Best suited for I/O intensive workloads that require low and consistent storage latency. 
	* Premium Blob Storage uses solid-state drives (SSDs) for fast and consistent response times. 
	* This storage is best for workloads that perform many small transactions. 
	* An example would be a mapping application that requires frequent and fast updates.

* Hot access tier
	* Has the lowest access costs, but higher storage costs than the Cool and Archive access tiers.
	* The Hot tier is optimized for frequent reads and writes of objects in the storage account. 
	* A good usage case is data that is actively being processed. 
	* By default, new storage accounts are created in the Hot tier.

* Cool access tier 
	* Has lower storage costs and higher access costs compared to Hot tier storage. 
	* The Cool tier is optimized for storing large amounts of data that's infrequently accessed. 
	* This tier is intended for data that remains in the Cool tier for at least 30 days. 
	* A usage case for the Cool tier is short-term backup and disaster recovery datasets and older media content. 
	* This content shouldn't be viewed frequently, but it needs to be immediately available.

* [Archive access tier](https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview#archive-access-tier) 
	* Most cost-effective option for storing data, but accessing that data is more expensive than accessing data in the other tiers. 
	* The Archive tier is an offline tier that's optimized for data that can tolerate several hours of retrieval latency. 
	* Data must remain in the Archive tier for at least 180 days or be subject to an early deletion charge. 
	* Data for the Archive tier includes secondary backups, original raw data, and legally required compliance information.


### Things to know about Azure Blob immutable storage
[Immutable storage](https://learn.microsoft.com/en-us/azure/storage/blobs/immutable-storage-overview) for Azure Blob Storage enables users to store business-critical data in a WORM (Write Once, Read Many) state. 

While in a WORM state, data can't be modified or deleted for a user-specified interval. 

By configuring immutability policies for blob data, you can protect your data from overwrites and deletes. 

Policies are applied at the container level and audit logs are available.

Azure Blob Storage supports two forms of immutability policies for implementing immutable storage:

* [Time-based retention policies](https://learn.microsoft.com/en-us/azure/storage/blobs/immutable-time-based-retention-policy-overview) 
	* Lets users set policies to store data for a specified interval. 
	* When a time-based retention policy is in place, objects can be created and read, but not modified or deleted. 
	* After the retention period has expired, objects can be deleted, but not overwritten. 
	* The Hot, Cool, and Archive access tiers support immutable storage by using time-retention policies.

* [Legal hold policies](https://learn.microsoft.com/en-us/azure/storage/blobs/immutable-legal-hold-overview) 
	* Stores immutable data until the legal hold is explicitly cleared. 
	* When a legal hold is set, objects can be created and read, but not modified or deleted. 
	* Premium Blob Storage uses legal holds to support immutable storage.

The following diagram shows how time-based retention policies and legal holds prevent write and delete operations.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/wwl-azure/design-data-storage-solution-for-non-relational-data/media/legal-hold.png)

### Things to consider when implementing Azure Blob Storage
Review the following consideration for Blob Storage.

* Consider Blob Storage availability. 
	* Determine the level of availability required for your data. 
	* Are there scenarios where offline data is sufficient? 
	* The Archive access tier is optimized for data that can remain offline for hours.

* Consider Blob Storage latency. 
	* Plan for the required time to access the first byte of data in different scenarios.
	* Some work tasks require instant access to data, while others can accommodate some delay. 
	* Premium Blob Storage supports single-digit millisecond latency for data, while the Hot and Cool access tiers support latency in milliseconds.

* Consider Blob Storage costs. 
	* Weigh your options for total cost. 
	* Factor in data storage minimum durations, and potential charges for transactions and access. 
	* Premium Blob Storage and the Hot access tier have higher overall storage costs, but lower charges for access and transactions. 
	* The Cool and Archive access tiers offer lower storage costs, but tend to have higher charges for access and transactions.

* Consider immutable storage. 
	* Review your business scenarios to identify where you might need immutable storage. 
	* Consider the different types immutability policies and which form satisfies your organization's requirements.



## Design for Azure Files
[Azure Files](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-introduction) provides fully managed cloud-based file shares that are hosted on Azure. 

Shared files are accessible by using the industry standard Server Message Block (SMB) protocol, Network File System (NFS) protocol, and the Azure Files REST API. 

You can mount or connect to an Azure file share at the same time on all the main operating systems.

### Things to know about Azure Files
Azure Files can be used to add to or replace a company's existing on-premises network attached storage (NAS) devices or file servers. 

Here are some reasons why organizations might want to use Azure Files:

* Developers can store apps and configuration files in a file share and connect new VMs to the shared files. This action reduces the time to get new machines into production.
* With file shares on Azure, a company doesn't need to buy and deploy expensive redundant hardware and manage software updates. The shares are cross-platform, and you can connect to them from Windows, Linux, or macOS.
* All the resilience of the Azure platform is inherited by your file share, which makes files globally redundant. You also gain options to use the integrated snapshots feature, and set up automatic backups by using Recovery Services vaults.
* All the data is encrypted in transit by using HTTPS and is stored encrypted when at rest.


### Choose your data access method
To move your company's shared files into Azure Files, you need to analyze your options and make an important decision. 

How are you going to access and update the files? You could replace your existing Server Message Block (SMB) file shares with their equivalent in Azure Files. 

Another option is to set up an instance of [Azure File Sync](https://learn.microsoft.com/en-us/azure/storage/file-sync/file-sync-introduction). 

If you choose to use Azure File Sync, there's more flexibility on how files are secured and accessed.

Azure file shares can be used in two ways. You can directly mount serverless Azure file shares (SMB) or cache Azure file shares on-premises by using Azure File Sync.

* Direct mount of Azure file shares: 
	* Because Azure Files provides SMB access, you can mount Azure file shares on-premises or in the cloud. 
	* Mounting uses the standard SMB client available in Windows, macOS, and Linux. 
	* Because Azure file shares are serverless, deploying for production scenarios doesn't require managing a file server or NAS device. 
	* Direct mounting means you don't have to apply software patches or swap out physical disks.

* Cache Azure file shares on-premises with Azure File Sync: 
	* Azure File Sync lets you centralize your organization's file shares. 
	* Azure Files provides the flexibility, performance, and compatibility of an on-premises file server. 
	* Azure File Sync transforms an on-premises (or cloud) Windows Server into a quick cache of your Azure file share.


### Choose your performance level
Because Azure Files stores files in a storage account, you can [choose your performance level](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-scale-targets). 

Performance metrics differ between standard and premium storage account levels. 

Premium accounts offer lower latency and higher IOPS and bandwidth.

Standard performance accounts use HDD to store data. 

With HDD, the costs are lower but so is the performance. 

SSD arrays back the premium storage account's performance, which comes with higher costs. 

Currently, premium accounts can only use file storage accounts with ZRS storage in a limited number of regions.

### Determine your storage tier
Azure Files offers four tiers of storage. 

These tiers allow you to tailor your file shares to meet the performance and price requirements for your scenarios.

* Premium: 
	* File shares are backed by solid-state drives (SSDs) and provide consistent high performance and low latency. 
	* Used for the most intensive IO workloads. Suitable workloads include databases, web site hosting, and development environments. 
	* Can be used with both Server Message Block (SMB) and Network File System (NFS) protocols.

* Transaction optimized: 
	* Used for transaction heavy workloads that don't need the latency offered by premium file shares. 
	* File shares are offered on the standard storage hardware backed by hard disk drives (HDDs).

* Hot access tier: 
	* Storage optimized for general purpose file sharing scenarios such as team shares. 
	* Offered on standard storage hardware backed by HDDs.

* Cool access tier:
	* Cost-efficient storage optimized for online archive storage scenarios. 
	* Offered on storage hardware backed by HDDs.

### Things to consider when choosing your implementation
[Your decision about which technology](https://learn.microsoft.com/en-us/azure/storage/common/nfs-comparison) to implement depends on your business use cases, the protocols required for your files, and your performance goals. 

We've reviewed considerations for using Azure Blob Storage and Azure Files.

Another option is to use Azure NetApp Files, which is a fully managed, highly available, enterprise-grade NAS service. 

[Azure NetApp Files](https://learn.microsoft.com/en-us/azure/azure-netapp-files/) can handle the most demanding, high-performance, low-latency workloads. 

You can migrate workloads that are deemed "un-migratable."

The following table compares features and uses cases for these three implementation options. 

Consider how you might implement Azure Blob Storage or Azure NetApp Files instead of Azure Files storage for an organisation.

Comparison | Azure Blob Storage | Azure Files | Azure NetApp Files
--- | --- | --- | ---
Description | Azure Blob Storage is best suited for large scale read-heavy sequential access workloads where data is ingested once and modified later | Azure Files is a highly available service best suited for random access workloads. | Azure NetApp Files is a fully managed file service in the cloud, powered by NetApp, with advanced management capabilities.
Use cases | Large scale analytical data, Throughput sensitive high-performance computing, Backup and archive, Autonomous driving, Media rendering, or Genomic sequencing | Shared files, Databases, Home directories, Traditional applications, ERP, CMS, NAS migrations that don't require advanced management, Custom applications that require scale-out file storage | On-premises enterprise NAS migration that requires rich management capabilities, Latency sensitive workloads like SAP HANA, Latency-sensitive or IOPS intensive high performance compute, Workloads that require simultaneous multi-protocol access.
Available protocols | - NFS 3.0 <br /> - REST <br /> - Data Lake Storage Gen2 | - SMB <br /> - NFS 4.1 <br /> - REST | - NFS 3.0 and 4.1 <br /> - SMB
Performance (per volume) | Up to 20,000 IOPS, up to 15 GiB/s throughput | Up to 100,000 IOPS, up to 10 GiB/s throughput | Up to 460,000 IOPS, up to 4.5 GiB/s throughput for regular volumes, up to 10 GiB/s throughput for large volumes.



## Design for Azure managed disks
Azure offers many disk solutions. In this module, we examine how to work with data disks by using Azure managed disks.

Data disks are used by virtual machines to store data like database files, website static content, or custom application code. 

The number of data disks you can add depends on the virtual machine size. Each data disk has a maximum capacity of 32,767 GB.

### Things to know about managed disks
Azure offers several types of managed disks. 

The following table shows a [comparison of four data disk types](https://learn.microsoft.com/en-us/azure/virtual-machines/disks-types#disk-type-comparison).

Comparison | Ultra-disk | Premium SSD | Standard SSD | Standard HDD
--- | --- | --- | --- | --- 
Disk type | SSD | SSD | SSD | HDD
Scenario | IO-intensive workloads, such as SAP HANA, top tier databases like SQL Server and Oracle, and other transaction-heavy workloads | Production and performance sensitive workloads | Web servers, Lightly used enterprise applications, Development and testing | Backup, Non-critical, Infrequent access
Max throughput | 2,000 Mbps | 900 Mbps | 750 Mbps | 500 Mbps
Max IOPS | 160,000 | 20,000 | 6,000 | 2,000

### Choose an encryption option
There are several encryption types available for your managed disks.

* [Azure Disk Encryption (ADE)](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/disk-encryption-overview) encrypts the VM's virtual hard disks (VHDs). If VHD is protected with ADE, the disk image is accessible only by the VM that owns the disk.

* [Server-Side Encryption (SSE)](https://learn.microsoft.com/en-us/azure/virtual-machines/disk-encryption) is performed on the physical disks in the data center. If someone directly accesses the physical disk, the data will be encrypted. When the data is accessed from the disk, it's decrypted and loaded into memory. This form of encryption is also referred to as encryption at rest or Azure Storage encryption.

* [Encryption at host](https://learn.microsoft.com/en-us/azure/virtual-machines/disk-encryption) ensures that data stored on the VM host is encrypted at rest and flows encrypted to the Storage service. Disks with encryption at host enabled aren't encrypted with SSE. Instead, the server hosting your VM provides the encryption for your data, and that encrypted data flows into Azure Storage.


### Things to consider when using managed disks
Think about what data disk types are needed for your organization. Consider your scenarios, throughput, and IOPS.

* Consider your scenarios, throughput, and IOPS. Compare disk types and choose the data disks that satisfy your business scenarios, and throughput and IOPS requirements.

* Ultra-disk storage: 
	* Azure Ultra Disk storage provides the best performance. 
	* Choose this option when you need the fastest storage performance in addition to high throughput, high input/output operations per second (IOPS), and low latency. 
	* Ultra-disk storage might not be available in all regions.

* Premium SSD storage: 
	* Azure Premium SSD-managed disks provide high throughput and IOPS with low latency. 
	* These disks offer a slightly less performance compared to Ultra Disk Storage. 
	* Premium SSD storage is available in all regions.

* Standard SSD: 
	* Azure Standard SSD-managed disks are a cost-effective storage option for VMs that need consistent performance at lower speeds. 
	* Standard SSD disks aren't as fast as Premium SSD disks or Ultra Disk Storage. 
	* You can attach Standard SSD disks to any VM.

* Standard HDD: 
	* In Azure Standard HDD-managed disks, data is stored on conventional magnetic disk drives that have moving spindles. 
	* Disks are slower and the variation in speeds is higher compared to solid-state drives (SSDs). 
	* Like Standard SSD disks, you can use Standard HDD disks for any VM.

* Consider Data Caching. 
	* Improve performance with [disk caching](https://learn.microsoft.com/en-us/azure/virtual-machines/premium-storage-performance#disk-caching). 
	* Azure Virtual Machines disk caching optimizes read and write access to the virtual hard disk (VHD) files. 
	* The VHDs are attached to Azure Virtual Machines. 
	* For OS disks, the default cache setting is ReadWrite, and for data disks, the default is ReadOnly.

> Disk caching isn't supported for disks 4 TiB and larger

* Consider using encryption. 
	* Secure your data disks with encryption. 
	* To fully protect your data disks, combine encryption services: ADE, SSE, and encryption at rest.



## Design for storage security
Azure Storage provides a layered security model that lets you secure and control the level of access to your storage accounts. 

The model consists of several storage security options, including firewall policies, customer-managed keys, and endpoints.

### Things to know about storage security
Let's take a look at some best practices for storage security. Think about options can be used for the Tailwind Traders infrastructure.

* [Azure security baseline for Azure Storage](https://learn.microsoft.com/en-us/security/benchmark/azure/baselines/storage-security-baseline) grants limited access to Azure Storage resources. Azure security baseline provides a comprehensive list of ways to secure your Azure storage.

* [Shared access signatures](https://learn.microsoft.com/en-us/azure/storage/common/storage-sas-overview) provide secure delegated access to resources in your storage account. With a SAS, you have granular control over how a client can access your data.

* [Firewall policies and rules](https://learn.microsoft.com/en-us/azure/storage/common/storage-network-security) limit access to your storage account. Requests can be limited to specific IP addresses or ranges, or to a list of subnets in an Azure virtual network. The Azure Storage firewall provides access control for the public endpoint of your storage account.

* [Virtual network service endpoints](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview) restrict network access and provide direct connection to your Azure storage. You can secure storage accounts to your virtual network, and enable private IP addresses in the virtual network to reach the service endpoint. With [private endpoints](https://learn.microsoft.com/en-us/azure/storage/common/storage-private-endpoints), you can create a special network interface for an Azure service in your virtual network.

* [Secure transfer](https://learn.microsoft.com/en-us/azure/storage/common/storage-require-secure-transfer) enables an Azure storage account to accept requests from secure connections. When you require secure transfer, any requests originating from non-secure connections are rejected. Microsoft recommends that you always require secure transfer for all your storage accounts.

* Data in your storage account is automatically encrypted. Azure Storage encryption offers two ways to manage encryption keys at the storage account level:

* Microsoft-managed keys: By default, Microsoft manages the keys used to encrypt your storage account.
* Customer-managed keys: You can optionally choose to manage encryption keys for your storage account. [Customer-managed keys](https://learn.microsoft.com/en-us/azure/storage/common/storage-encryption-key-model-get) must be stored in Azure Key Vault.


### Things to consider when implementing storage security
Consider the following points for storage security.

* Consider Azure security baseline options. 
	* Review the comprehensive options provided by Azure security baseline provides to secure your Azure storage.
	* Grant limited access to Azure Storage resources.

* Consider shared access signatures. 
	* Specify what Tailwind Traders resources clients can access. 
	* Define the access permissions for resources. Configure how long the SAS remains valid.

* Consider firewall policies and rules. 
	* Limit requests to IP addresses or subnets in an Azure virtual network. 
	* Use the Azure Storage firewall to block all access through the public endpoint when using private endpoints. 
	* Select trusted Azure platform services to access the storage account securely.

* Consider service endpoints. 
	* Secure Azure storage accounts to your virtual networks by using service endpoints. 
	* You can provide optimal routing by always keeping traffic destined to Azure Storage on the Azure backbone network. 
	* Enable private IP addresses in the virtual network to reach the service endpoint without requiring a public IP address. 
	* Allow on-premises networks to access resources by using NAT IP addresses.

* Consider private endpoints. 
	* Add private endpoints to create a special network interface for an Azure service in your virtual network. 
	* When you implement a private endpoint for your storage account, it provides secure connectivity between clients on your virtual network and your storage.

* Consider secure transfer. 
	* Always require secure transfer for all your Azure storage accounts. 
	* In the Azure portal, choose Enable secure transfer for your storage accounts. 
	* The Secure transfer required property is enabled by default when an Azure storage account is created.

* Consider customer-managed keys. 
	* Manage encryption keys for your storage account by using customer-managed keys stored in Azure Key Vault. 
	* Customer-managed keys give you full control over access to your encryption keys and encrypted data.

