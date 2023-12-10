# _AZ-104: Implement and manage storage in Azure_
Learn how to manage storage accounts, data in Azure Storage, and Azure File and Blob storage.

## Configure storage accounts
Learn how to configure storage accounts, including replication and endpoints.

Learning objectives:

* Identify features and usage cases for Azure storage accounts.
* Select between different types of Azure Storage and storage accounts.
* Select a storage replication strategy.
* Configure network access to storage accounts.
* Secure storage endpoints.

### _Implement Azure Storage_
Azure Storage is Microsoft's cloud storage solution for modern data storage scenarios.

Azure Storage offers a massively scalable object store for data objects

It provides a file system service for the cloud, a messaging store for reliable messaging, and a NoSQL store.

Azure Storage is a service that you can use to store files, messages, tables, and other types of information.

#### Things to know about Azure Storage
You can think of Azure Storage as supporting three categories of data: 

* Structured data 
* Unstructured data 
* Virtual Machine data

Category | Description	| Storage examples
--- | --- | ---
Virtual machine data | Virtual machine data storage includes disks and files. Disks are persistent block storage for Azure IaaS virtual machines | Storage for virtual machine data is provided through Azure managed disks. The number of data disks you can add depends on the virtual machine size.
Unstructured data | Unstructured data is the least organized. It can be a mix of information that's stored together, but the data doesn't have a clear relationship. | Unstructured data can be stored by using Azure Blob Storage and Azure Data Lake Storage.
Structure Data | Structured data is stored in a relational format that has a shared schema. | Structured data can be stored by using Azure Table Storage, Azure Cosmos DB, and Azure SQL Database.

#### Extra Notes
> Blob Storage is a highly scalable, REST-based cloud object store. 

> Azure Data Lake Storage is the Hadoop Distributed File System (HDFS) as a service.

> Azure Cosmos DB is a globally distributed database service.

> Azure SQL Database is a fully managed database-as-a-service built on SQL.

#### Storage account tiers
General purpose Azure storage accounts have two tiers: Standard and Premium.

- **Standard** - Storage accounts are backed by magnetic hard disk drives (HDD). A standard storage account provides the lowest cost per GB.
- **Premium** - Storage accounts are backed by solid-state drives (SSD) and offer consistent low-latency performance.

> You can't convert a Standard tier storage account to a Premium tier storage account or vice versa.

> You must create a new storage account with the desired type and copy data, if applicable, to a new storage account.

#### Things to consider when using Azure Storage
- **Consider durability and availability** - Azure Storage is durable and highly available. Redundancy ensures your data is safe during transient hardware failures.
- **Consider secure access** - All data written to Azure Storage is encrypted by the service. Azure Storage provides you with fine-grained control over who has access to your data.
- **Consider scalability** - Azure Storage is designed to be massively scalable to meet the data storage and performance needs of modern applications.
- **Consider manageability** - Microsoft Azure handles hardware maintenance, updates, and critical issues for you.
- **Consider data accessibility** - Data in Azure Storage is accessible from anywhere in the world over HTTP or HTTPS. Microsoft provides SDKs for Azure Storage in various languages.

### _Explore Azure Storage services_
Azure Storage offers four data services that can be accessed by using an Azure storage account:

- **Azure Blob Storage (containers)** - A massively scalable object store for text and binary data.
- **Azure Files** - Managed file shares for cloud or on-premises deployments.
- **Azure Queue Storage** - A messaging store for reliable messaging between application components.
- **Azure Table Storage** - A service that stores non-relational structured data (also known as structured NoSQL data).

#### Azure Blob Storage (containers)
Azure Blob Storage is Microsoft's object storage solution for the cloud.

Blob Storage is optimized for storing massive amounts of unstructured or non-relational data, such as text or binary data.

Blob Storage is ideal for:

* Serving images or documents directly to a browser.
* Storing files for distributed access.
* Streaming video and audio.
* Storing data for backup and restore, disaster recovery, and archiving.
* Storing data for analysis by an on-premises or Azure-hosted service.

Objects in Blob Storage can be accessed from anywhere in the world via HTTP or HTTPS. 

> You can access data from Azure Blob Storage [by using the NFS protocol](https://learn.microsoft.com/en-us/training/modules/access-data-azure-blob-storage-multiple-protocols/4-access-data-azure-blob-storage-nfs-protocol).

#### Azure Files
Azure Files enables you to set up highly available network file shares.

Shares can be accessed by using the Server Message Block (SMB) protocol and the Network File System (NFS) protocol.

Multiple virtual machines can share the same files with both read and write access.

You can also read the files by using the REST interface or the storage client libraries.

File shares can be used for many common scenarios:

- **Many on-premises applications use file shares** - This feature makes it easier to migrate those applications that share data to Azure.
- **Configuration files can be stored on a file share and accessed from multiple virtual machines**
- **Diagnostic logs, metrics, and crash dumps** - These are just three examples of data that can be written to a file share and processed or analyzed later.

The storage account credentials are used to provide authentication for access to the file share.

All users who have the share mounted should have full read/write access to the share.

#### Azure Queue Storage
Azure Queue Storage is used to store and retrieve messages.

Queue messages can be up to 64 KB in size, and a queue can contain millions of messages.

Queues are used to store lists of messages to be processed asynchronously.

#### Azure Table Storage (Azure Cosmos DB)
Azure Table Storage is a fully managed NoSQL database service for modern app development.

As a fully managed service, Azure Cosmos DB takes database administration off your hands with automatic management, updates, and patching. 

It also handles capacity management with cost-effective serverless and automatic scaling options to match capacity with demand.

In addition to the existing Azure Table Storage service, there's a new Azure Cosmos DB Table API offering that provides throughput-optimized tables, global distribution, and automatic secondary indexes.

#### Things to consider when choosing Azure Storage services
Consider the follwoing prominent features of the types of Azure Storage which can support your application needs.

- **Consider storage optimization for massive data** - Azure Blob Storage is optimized for storing massive amounts of unstructured data.
- **Consider storage with high availability** - Azure Files supports highly available network file shares. On-premises apps use file shares for easy migration.
- **Consider storage for messages** - Use Azure Queue Storage to store large numbers of messages. It is commonly used to create a backlog of work to process asynchronously.
- **Consider storage for structured data** - Azure Table Storage is ideal for storing structured, non-relational data. 

### _Determine storage account types_
Azure Storage offers several storage account options. 

Each [Storage Account](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview) supports different features and has its own pricing model.

#### Things to know about storage account types
Review the following table of storage options:

Storage Account | Supported services | Recommended usage
--- | --- | ---
[Standard general-purpose v2](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-upgrade) | Blob Storage (including Data Lake Storage), Queue Storage, Table Storage, and Azure Files | Standard storage account for most scenarios, including blobs, file shares, queues, tables, and disks (page blobs).
[Premium block blobs](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-block-blob-premium) | Blob Storage (including Data Lake Storage) | Premium storage account for block blobs and append blobs. Recommended for applications with high transaction rates.
[Premium file shares](https://learn.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share) | Azure Files | Premium storage account for file shares only. Recommended for enterprise or high-performance scale applications.
[Premium page blobs](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-pageblob-overview) | Page blobs only | Premium high-performance storage account for page blobs only. Page blobs are ideal for storing index-based and sparse data structures.

> All storage account types are encrypted by using Storage Service Encryption (SSE) for data at rest.

### _Determine replication strategies_
The data in your Azure storage account is always replicated to ensure durability and high availability.

Azure Storage replication copies your data so that it's protected from planned and unplanned events.

You can choose to replicate your data within the same data center, across zonal data centers within the same region, and even across regions.

The four replication strategies are:

* Locally redundant storage (LRS)
* Zone redundant storage (ZRS)
* Geo-redundant storage (GRS)
* Geo-zone-redundant storage (GZRS)

#### Locally redundant storage
Locally redundant storage is the lowest-cost replication option and offers the least durability.

Data may be lost if a data center-level disaster occurs, such as fire or flooding.

LRS can be appropriate in for the following scenarios:

* Your application stores data that can be easily reconstructed if data loss occurs.
* Your data is constantly changing like in a live feed, and storing the data isn't essential.
* Your application is restricted to replicating data only within a country due to data governance requirements.

#### Zone redundant storage
Zone redundant storage synchronously replicates your data across three storage clusters in a single region.

Each storage cluster is physically separated from the others and resides in its own availability zone.

Each availability zone, and the ZRS cluster within it, is autonomous, and has separate utilities and networking capabilities

ZRS provides excellent performance and low latency.

* ZRS isn't currently available in all regions.
* Changing to ZRS from another data replication option requires the physical data movement from a single storage stamp to multiple stamps within a region.

#### Geo-redundant storage
Geo-redundant storage replicates your data to a secondary region (hundreds of miles away from the primary location of the source data).

GRS provides a higher level of durability even during a regional outage.

GRS is designed to provide at least 99.99999999999999% (16 9's) durability.

If you implement GRS, you have two related options to choose from:

* GRS replicates your data to another data center in a secondary region. 
* Data is available to be read only if Microsoft initiates a failover from the primary to secondary region.
* Read-access geo-redundant storage (RA-GRS) is based on GRS.
* RA-GRS replicates your data to another data center in a secondary region, and also provides you with the option to read from the secondary region.

For a storage account with GRS or RA-GRS enabled, all data is first replicated with locally redundant storage. 

An update is first committed to the primary location and replicated by using LRS. The update is then replicated asynchronously to the secondary region by using GRS.

#### Geo-zone redundant storage
Geo-zone-redundant storage combines the high availability of zone-redundant storage with protection from regional outages as provided by geo-redundant storage.

Data in a GZRS storage account is replicated across three Azure availability zones in the primary region, and also replicated to a secondary geographic region.

Each Azure region is paired with another region within the same geography, together making a regional pair.

With a GZRS storage account, you can continue to read and write data if an availability zone becomes unavailable or is unrecoverable.

Data is also durable during a complete regional outage or during a disaster in which the primary region isn't recoverable.

GZRS is designed to provide at least 99.99999999999999% (16 9's) durability of objects over a given year.

GZRS also offers the same scalability targets as LRS, ZRS, GRS, or RA-GRS.

> You can optionally enable read access to data in the secondary region with read-access geo-zone-redundant storage (RA-GZRS).

> Microsoft recommends using GZRS for applications that require consistency, durability, high availability, excellent performance, and resilience for disaster recovery.

#### Things to consider when choosing replication strategies
The following table describes several key factors during the replication process, including node unavailability within a data center, and whether the entire data center (zonal or non-zonal) becomes unavailable.

Node in data center unavailable | Entire data center unavailable | Region-wide outage | Read access during region-wide outage | Supported storage accounts
:---: | :---: | :---: | :---: | ---
LRS | ZRS | GRS | RA-GRS | LRS: GPv1, GPv2, Blob
ZRS | GRS | RA-GRS | RA-GZRS | ZRS: GPv2
GRS | RA-GRS | GZRS |  | GRS: GPv1, GPv2, Blob
RA-GRS | GZRS | RA-GZRS |  | RA-GRS: GPv1, GPv2, Blob
GZRS | RA-GZRS |  |  | GZRS: GPv2
RA-GZRS |  |  |  | RA-GZRS: GPv2

### _Access storage_
Every object you store in Azure Storage has a unique URL address.

The storage account name forms the subdomain portion of the URL address.

The combination of the subdomain and the domain name, which is specific to each service, forms an endpoint for your storage account.

Example table of endpoints with hname *mystorageaccount*:

Service | Default Endpoint
--- | ---
Container service | //mystorageaccount.blob.core.windows.net
Table service	 | //mystorageaccount.table.core.windows.net
Queue service	 | //mystorageaccount.queue.core.windows.net
File service	| //mystorageaccount.file.core.windows.net

We create the URL to access an object in your storage account by appending the object's location in the storage account to the endpoint.

The URL address for a blob *myblob* container called *mycontainer* would look like:

```
//mystorageaccount.blob.core.windows.net/mycontainer/myblob
```

#### Configure custom domains
You can configure a custom domain to access blob data in your Azure storage account.

You can map a custom domain and subdomain, such as www.contoso.com, to the blob or web endpoint for your storage account.

Users can use that domain to access blob data in your storage account.

> Azure Storage doesn't currently provide native support for HTTPS with custom domains.

> You can implement an Azure Content Delivery Network (CDN) to access blobs by using custom domains over HTTPS.

_*There are two ways to configure a custom domain: direct mapping and intermediary domain mapping.*_

* **Direct mapping** - lets you enable a custom domain for a subdomain to an Azure storage account. For his approach, you create a CNAME record that points from the subdomain to the Azure storage account.

Example: how a subdomain is mapped to an Azure Storage Account to create a CNAME record in DNS 
	
	* Subdomain: blobs.contoso.com
	* Azure storage account: \<storage account>\.blob.core.windows.net
	* Direct CNAME record: contosoblobs.blob.core.windows.net

* **Intermediary domain mapping** - is applied to a domain that's already in use within Azure. 

This approach might result in minor downtime while the domain is being mapped. 

To avoid downtime, you can use the asverify intermediary domain to validate the domain.

By prepending the `asverify` keyword to your own subdomain, you permit Azure to recognize your custom domain without modifying the DNS record for the domain.

Example: domain is mapped to an Azure Storage Account in DNS with the `asverify` intermediary domain:

	* CNAME record: asverify.blobs.contoso.com
	* Intermediate CNAME record: asverify.contosoblobs.blob.core.windows.net

### _Secure storage endpoints_
In the Azure portal, each Azure service has required steps to configure the service endpoints and restrict network access for the service.

To access these settings for your storage account, you use the Firewalls and virtual networks settings.

You add the virtual networks that should have access to the service for the account.

#### Things to know about configuring service endpoints
* The Firewalls and virtual networks settings restrict access to your storage account from specific subnets on virtual networks or public IPs.
* You can configure the service to allow access to one or more public IP ranges.
* Subnets and virtual networks must exist in the same Azure region or region pair as your storage account.

> Test the service endpoint and verify the endpoint limits access as expected.


## Configure Azure Blob Storage
Learn how to configure Configure Azure Blob Storage, including tiers and object replication.

Azure Blob Storage is a service for storing large amounts of unstructured object data. 

Unstructured data is data that doesn't adhere to a particular data model or definition, such as text or binary data.

Learning Objectives:

* Identify features and usage cases for Azure Blob Storage.
* Configure Blob Storage and Blob access tiers.
* Configure Blob lifecycle management rules.
* Configure Blob object replication.
* Upload and price Blob Storage.

### _Implement Azure Blob Storage_
Azure Blob Storage is a service that stores unstructured data in the cloud as objects or blobs. 

Blob stands for Binary Large Object. Blob Storage is also referred to as object storage or container storage.

#### Things to know about Azure Blob Storage
The following are configuration characteristics of Blob Storage.

* Blob Storage can store any type of text or binary data. Such as text documents, images, video files

	* Blob Storage uses three resources to store and manage your data:
		* An Azure storage account
		* Containers in an Azure storage account
		* Blobs in a container

	* To implement Blob Storage, you configure several settings:
		* Blob container options
		* Blob types and upload options
		* Blob Storage access tiers
		* Blob lifecycle rules
		* Blob object replication options

#### Things to consider when implementing Azure Blob Storage
There are many common uses for Blob Storage. Review the following considerations:

- **Consider browser uploads** - Use Blob Storage to serve images or documents directly to a browser
- **Consider distributed access** - Blob Storage can store files for distributed access such install files
- **Consider streaming data** - Stream video and audio by using Blob Storage
- **Consider archiving and recovery** - Blob Storage is a great solution for storing data for backup and restore
- **Consider application access** - Allow on-premises or Azure-hosted services to have access to blob storage for analysing data

### _Create blob containers Completed_
Azure Blob Storage uses a container resource to group a set of blobs.

A blob can't exist by itself in Blob Storage. A blob must be stored in a container resource.

#### Things to know about containers and blobs
* All blobs must be in a container.
* A container can store an unlimited number of blobs.
* An Azure storage account can contain an unlimited number of containers.
* You can create the container in the Azure portal.
* You upload blobs into a container.

#### Configure Blob Container in Azure Portal
In the Azure portal, you configure two settings to create a container for an Azure storage account.

* **Name** 
	* must be unique within the Azure storage account
	* The name can contain only lowercase letters, numbers, and hyphens.
	* The name must begin with a letter or a number.
	* The minimum length for the name is three characters.
	* The maximum length for the name is 63 characters.

* **Public Access Level**
	* The access level specifies if the container and its blobs can be accessed publicly.
	* Default, container data is private and visible only to the account owner. 
	* There are three access level choices:
		* **Private**: (Default) Prohibit anonymous access to the container and blobs.
		* **Blob**: Allow anonymous public read access for the blobs only.
		* **Container**: Allow anonymous public read and list access to the entire container, including the blobs.

> You can also create a blob container with PowerShell by using the New-AzStorageContainer command.

### _Assign blob access tiers_
Azure Storage supports several access tiers for blob data, they are: Hot, Cool, and Archive.

Each access tier is optimized to support a particular pattern of data usage.

#### Blob Access Tiers
Examine the characteristics of each blob access tiers.

#### Hot tier
By default, new storage accounts are created in the Hot tier.

Hot tier is optimized for frequent reads and writes of objects in the Azure storage account.

A good usage case is data that is actively being processed.

This tier has the lowest access costs, but higher storage costs than the Cool and Archive tiers.

#### Cool tier
Cool tier is optimized for storing large amounts of data that's infrequently accessed.

This tier is intended for data that remains in the Cool tier for at least 30 days.

A usage case for the Cool tier is short-term backup and disaster recovery datasets and older media content.

This content shouldn't be viewed frequently, but it needs to be immediately available.

Storing data in the Cool tier is more cost-effective but accessing data can be more expensive than accessing data in the Hot tier.

#### Archive tier
The Archive tier is an offline tier that's optimized for data that can tolerate several hours of retrieval latency.

Data must remain in the Archive tier for at least 180 days or be subject to an early deletion charge.

Data for the Archive tier includes secondary backups, original raw data, and legally required compliance information.

This tier is the most cost-effective option for storing data but is the most expensive for accessing than data in the other tiers.

#### Compare access tiers
The below table shows the range of features and support levels for each blob tier

Compare | Hot Tier | Cool Tier | Archive Tier
--- | --- | --- | ---
Availability | 99.9% | 99% | Offline
Availability (RA-GRS reads) | 99.99% | 99.9% | Offline
Latency (time to first byte) | milliseconds | milliseconds | hours
Minimum storage duration | N/A | 30 days | 180 days
Usage costs | Higher storage costs, Lower access & transaction costs | Lower storage costs, Higher access & transaction costs | Lowest storage costs, Highest access & transaction costs

#### Configure the blob access tier
In the Azure portal, you can select the blob access tier for your Azure storage account. 

You can also change the blob access tier for your account at any time. 

By selecting the correct access tier for your needs, you can store your blob data in the most cost-effective manner.

### _Add blob lifecycle management rules_
Every data set (data in blob tier) has a unique lifecycle. As the data set ages, access to all of the data in the set tends to dramatically reduce.

Some data set stays idle in the cloud and is rarely accessed after it's stored.

Some data expires within a few days or months after it's created. 

Other data is actively read and modified throughout the data set lifetime.

Azure Blob Storage supports lifecycle management for data sets, it offers a rich rule-based policy for GPv2 and Blob Storage accounts.

With a lifecycle policy, you can have rules to transition data to other blob tiers and set expiration time for transitioning data in the lifecycle.

#### Things to know about lifecycle management
* Transition blobs to a cooler storage tier (Hot to Cool, Hot to Archive, Cool to Archive) to optimize for performance and cost. 
* Delete blobs at the end of their lifecycles. 
* Define rule-based conditions to run once per day at the Azure storage account level. 
* Apply rule-based conditions to containers or a subset of blobs.

#### Configure lifecycle management policy rules
To create lifecycle management policy rules for your Azure storage account, you have to specify several settings.

For each rule, you create ***If - Then*** block conditions to transition or expire data based on your specifications.

An example is "*If* Created more than 3days *Then* Move to cool storage".

* **If:**
	* The If clause sets the evaluation clause for the policy rule.
	* When the If clause evaluates to true, the Then clause is executed.
	* The If clause sets a time period to apply to the blob data. 
	* Lifecycle Management checks if the data was accessed or modified according to the time period
	* The time period options thaht applies to Last Modified and Created is:
		* **More than (days ago)** - The number of days to use in the evaluation condition

* **Then:**
	* The Then clause sets the action clause for the policy rule.
	* When the If clause evaluates to true, the Then clause is executed.
	* The Then clause sets the transition action for blob data.
	* Lifecycle Management transitions the data based on the setting.
	* The action settings for blob data are:
		* **Move to cool storage** - move blob data to Cool Tier
		* **Move to archive storage** - move blob data to Archive Tier
		* **Delete the blob** - All blob data is deleted. 

### _Determine blob object replication_
Object replication copies blobs in a container asynchronously according to policy rules configured.

During the replication process, the following contents are copied from the source container to the destination container:

* The blob contents
* The blob metadata and properties
* Any versions of data associated with the blob

#### Things to know about blob object replication
* Object replication requires blob versioning enabled on source and destination Storage Accounts.
* Object replication doesn't support blob snapshots. (Snapshots aren't replicated across).
* Object replication is only supported for Blobs in the Hot or Cool tier. (Source and Destination can be diffenrent tiers).
* When you configure object replication, you create a replication policy that defines Source and Destination Storage Accounts.
* A replication policy includes one or more rules that specify a source container and a destination container.

#### Things to consider when configuring blob object replication
Consider the following points when looking to apply replication as part of a Blob Storage strategy. 

- **Consider latency reductions** - Minimize latency object replication such as enabling it to consume data from a region that's in closer physical proximity.
- **Consider efficiency for compute workloads** - With object replication, compute workloads can process the same sets of blobs in different regions.
- **Consider data distribution** - Process or Analyze data in a single location and replicate the results to other regions.
- **Consider costs benefits** - Consider Blob Tiers for replicated data. (For example, replicate and transition to Archive Tier).

### _Upload blobs_
A blob can be any type of data and any size file. 

Azure Storage offers three types of blobs: block blob, page blob, and append blob.

#### Blob Types
Below are the different characteristics of each blob type.

* **Block blobs**
	* A block blob consists of blocks of data that are assembled to make a blob. 
	* Most Blob Storage scenarios use block blobs. 
	* Block blobs are ideal for storing text and binary data in the cloud, like files, images, and videos.

* **Append blobs**
	* An append blob is similar to a block blob because the append blob also consists of blocks of data. 
	* The blocks of data in an append blob are optimized for append operations. 
	* Append blobs are useful for logging scenarios, where the amount of data can increase as the logging operation continues.

* **Page blobs** 
	* A page blob can be up to 8 TB in size. 
	* Page blobs are more efficient for frequent read/write operations. 
	* Azure Virtual Machines use page blobs for OS and data disks.

The block blob type is the default type for any new blob but you can choose a specific type when creating a new blob.

**After you create a blob, you can't change its type.**

#### Things to consider when using blob upload tools
A common approach for uploading blobs to your Azure storage account is to use Azure Storage Explorer however, other tools are also available.

Upload Tool | Description
--- | ---
AzCopy | CLI Tool for copying data to and from Blob Storage, across containers, and across storage accounts.
Azure Data Box Disk	| A service for transferring on-premises data to Blob Storage for large datasets that can't realistic be transferred over the network.
Azure Import/Export	| A service that helps you export large amounts of data from your storage account to hard drives that you provide and  Microsoft ships back to you.

### _Determine Blob Storage pricing_
All Azure storage accounts use a pricing model for Azure Blob Storage that's based on the tier of each blob.

#### Things to know about pricing for Blob Storage
Review the following billing considerations for an Azure storage account and Blob Storage.

* **Performance tiers**
	* The Blob Storage tier determines the amount of data stored and the cost for storing that data. 
	* As the performance tier gets cooler, the per-gigabyte cost decreases.

* **Data access costs**
	* Data access charges increase as the tier gets cooler. 
	* For data in the Cool and Archive tiers, you're billed a per-gigabyte data access charge for reads.

* **Transaction costs** 
	* There's a per-transaction charge for all tiers which increases as the tier gets cooler.

* **Geo-replication data transfer costs**
	* This charge only applies to accounts that have geo-replication configured. Including GRS and RA-GRS replication
	* Geo-replication data transfer incurs a per-gigabyte charge

* **Outbound data transfer costs**
	* Outbound data transfers (data that's transferred out of an Azure region) incur billing for bandwidth usage on a per-gigabyte basis.
	* This billing is consistent with general-purpose Azure storage accounts.

* **Changes to the storage tier**
	* If you change the Blob Tier from Cool to Hot incurs a charge equal to reading all the data within the storage account. 
	* Changing the Blob Tier from Hot to Cool incurs a charge equal to writing all the data into the Cool tier (GPv2 accounts only).


## Configure Azure Storage security
Azure Storage provides a comprehensive set of security capabilities that work together to enable developers to build secure applications.

In this module, you'll learn how to configure common Azure Storage security features like storage access signatures.

Learning objectives:

* Configure a shared access signature (SAS), including the uniform resource identifier (URI) and SAS parameters.
* Configure Azure Storage encryption.
* Implement customer-managed keys.
* Recommend opportunities to improve Azure Storage security.

### _Review Azure Storage security strategies_
Administrators use different strategies to ensure their data is secure.

Common approaches include encryption, authentication, authorization, and user access control with credentials, file permissions, and private signatures. 

Azure Storage offers a suite of security capabilities based on common strategies to help you secure your data.

#### Things to know about Azure Storage security strategies
* **Encryption** - All data written to Azure Storage is automatically encrypted
* **Authentication** - Both Azure Active Directory (Azure AD) and role-based access control (RBAC) are supported for Azure Storage
	* Assign RBAC roles scoped to an Azure storage account to security principals
	* Use Azure AD to authorize resource management operations like key management
	* Azure AD integration is supported for data operations on Azure Blob Storage and Azure Queue Storage.
* **Data in transit** - Data in transit can be secured by using Client-Side Encryption, HTTPS, or SMB 3.0.
* **Disk encryption** - Disks used by Azure Virtual Machines can be encrypted by using Azure Disk Encryption.
* **Shared access signatures** - Delegated access to the data objects by using a shared access signature (SAS).
* **Authorization** - Every request made against a secured storage resource must be authorized.

#### Things to consider when using authorization security
The below table shows different security strategies for Azure Storage.

Authorization Srategy | Description
--- | ---
Azure Active Directory | With Azure AD, you can assign fine-grained access to users, groups, or applications by using role-based access control.
Shared Key | Shared Key authorization relies on your Azure storage account access keys and other parameters to produce an encrypted signature string.
Shared Access Signatures | A SAS delegates access to a particular resource with specific permissions and for a specific amount of time. 
Anonymous access to containers and blobs | You can make blob resources public at the container or blob level but it will be accessible to any user for anonymous read access.

### _Create shared access signatures_
A shared access signature (SAS) token is a uniform resource identifier (URI) that grants restricted access rights to Azure Storage resources. 

SAS Tokens are a secure way to share your storage resources without compromising your account keys.

#### Things to know about shared access signatures
* A SAS gives you granular control over the type of access you grant to clients who have the SAS.
* An account-level SAS can delegate access to multiple Azure Storage services, such as blobs, files, queues, and tables.
* You can specify the time interval for which a SAS is valid, including the start time and the expiration time.
* You specify the permissions granted by the SAS for example R/W but not Delete
* SAS provides account-level and service-level control.
	* **Account-level** - SAS delegates access to resources to many Azure Storage services.
	* **Service-level** - SAS delegates access to a resource in only one Azure Storage service.

> A stored access policy can provide another level of control when you use a service-level SAS on the server side.

* Optional SAS configuration settings:
	* **IP addresses** - You can specify a range of IP addresses that are allowed access to Azure Storage with a SAS
	* **Protocols** - You can specify the protocol over which Azure Storage accepts the SAS.

#### Configure a shared access signature
To create a SAS, you must configure several settings. These are:

* Allowed Service - Blob / File / Queue / Table
* Allowed Resource Types - Service / Container / Object
* Permisions - Read / Write / Delete / List / Add / Create / Update / Process / Immutable Storage / Permanent Delete
* Blob Versioning Permissions - Enables deletion of versions
* Allowed blob index permissions - Read/Write and Filter
* Start and Expiry date/time - Specify the time interval for which the SAS is valid.
* Allowed IP addresses
* Allowed protocols
* Signing key - Select the signing key from your list of keys.
* Signing method - Account key or User delegation key.

### _Identify URI and SAS parameters_
When you create your shared access signature (SAS), a uniform resource identifier (URI) is created by using parameters and tokens.

The URI consists of your Azure Storage resource URI and the SAS token.

#### Things to know about URI definitions
Below table is a sample URI definition and its parameters.

This sample creates a service-level SAS that grants read and write permissions to a blob.

Parameter | Example | Description
--- | --- | ---
Resource URI	| https://myaccount.blob.core.windows.net/ ?restype=service &amp;comp=properties' | Defines the Azure Storage endpoint and other parameters.
Storage version | sv=2015-04-05 | For Azure Storage version 2012-02-12 and later, this parameter indicates the version to use.
Storage service | ss=bf	 | Specifies the Azure Storage to which the SAS applies. This shows Blob Storoage and Azure Files.
Start time | st=2015-04-29T22%3A18%3A26Z | (Optional) Specifies the start time for the SAS in UTC time. This shows April 29, 2015 22:18:26 UTC.
Expiry time | se=2015-04-30T02%3A23%3A26Z | Specifies the expiration time for the SAS in UTC time. This shows April 30, 2015 02:23:26 UTC.
Resource | sr=b	| Specifies which resources are accessible via the SAS. This shows only Blob Storage is accessible.
Permissions | sp=rw | Lists the permissions to grant.
IP range | sip=168.1.5.60-168.1.5.70 | Specifies a range of IP addresses from which a request is accepted.
Protocol | spr=https | Specifies the protocols from which Azure Storage accepts the SAS.
Signature | sig=F%6GRVAZ5Cdj2Pw4tgU7Il STkWgn7bUkkAg8P6HESXwmf%4B | Specifies that access to the resource is authenticated by using an HMAC signature that is computed over a string-to-sign with a key by using the SHA256 algorithm, and encoded by using Base64 encoding.

### _Determine Azure Storage encryption_
Azure Storage encryption protects data at rest by ensuring to ensure your organizational security and compliance commitments are met. 

The encryption and decryption processes happen automatically.

Because your data is secured by default, no extra steps are required to protect your data.

#### Things to know about Azure Storage encryption
* Data is encrypted automatically before it's persisted to any Azure Storage Resource suc has Blob Storage, Azure Files, Cosmos DB.
* Data is automatically decrypted before it's retrieved.
* Azure Storage encryption, encryption at rest, decryption, and key management are transparent to users.
* All data written to Azure Storage is encrypted through 256-bit advanced encryption standard (AES) encryption.
* Azure Storage encryption is enabled for all new and existing storage accounts and can't be disabled.

### _Create customer-managed keys_
You can use Azure Key Vault to manage your encryption keys.

The Azure Key Vault APIs can be used to generate encryption keys. You can also create your own encryption keys and store them in a key vault.

#### Things to know about customer-managed keys
Characteristics of customer-managed keys:

* By creating your own keys (referred to as customer-managed keys), you have more flexibility and greater control.
* You can create, disable, audit, rotate, and define access controls for your encryption keys.
* Customer-managed keys can be used with Azure Storage encryption and you can use a new key or an existing key vault and key.

> The Azure storage account and the key vault must be in the same region, but they can be in different subscriptions.

#### Configure customer-managed keys in Auzre Portal
In the Azure portal, you can configure customer-managed encryption keys.

You can create your own keys, or have the keys managed by Microsoft. 

Consider the following points for using Azure KeyVault to manage your own encryption keys:

- **Encryption type** - Choose how the encryption key is managed: by Microsoft or by yourself (customer).
- **Encryption key** - Specify an encryption key by entering a URI, or select a key from an existing key vault.

### _Apply Azure Storage security best practices_
It's important to understand that when you use a SAS in your application, there can be potential risks.

* If a SAS is compromised, it can be used by anyone who obtains it, including a malicious user.
* If a SAS provided to an application expires and it is unable to retrieve a new SAS from your azure, functionality of the app will be hindered.

#### Recommendations for managing risks
The below table lists some recommendations that can help mitigate risks when working with a SAS.

Recommendation | Description
--- | ---
Always use HTTPS for creation and distribution | If a SAS is passed over HTTP and intercepted, an attacker can intercept and use the SAS.
Reference stored access policies where possible | Stored access policies give you the option to revoke permissions without having to regenerate Storage Account keys.
Set near-term expiry times for an unplanned SAS | If a SAS is compromised, you can mitigate attacks by limiting the SAS validity to a short time. Near-term expiration times also limit the amount of data that can be written to a blob.
Require clients automatically renew the SAS | Require your clients to renew the SAS well before the expiration date.
Plan carefully for the SAS start time | In general, it's good to set the start time to at least 15 minutes in the past. Or, don't set a specific start time, which causes the SAS to be valid immediately in all cases.
Define minimum access permissions for resources | A security best practice is to provide a user with the minimum required privileges.
Understand account billing for usage, including a SAS | Provide limited permissions to help mitigate the potential actions of malicious users such as high-egress costs from dowwnloads.
Validate data written by using a SAS | If your application requires validated or authorized data, validate the data after it's written, but before it's used.
Don't assume a SAS is always the correct choice | Sometimes, the risks associated with a particular operation against your Storage Account outweigh the benefits of using a SAS. In these cases, you can create a middle-tier service to perform rule validation, authentication, and auditing.
Monitor your applications with Azure Storage Analytics | You can use logging and metrics to observe any spike in authentication failures.


## Configure Azure Files and Azure File Sync
Learn how to configure Azure Files and Azure File Sync.

Learning objectives:

* Identify storage for file shares and blob data.
* Configure Azure Files shares and file share snapshots.
* Identify features and usage cases of Azure File Sync.
* Identify Azure File Sync components and configuration steps.

Azure Files offers fully managed file shares in the cloud that are accessible via industry standard protocols. 

Azure File Sync is a service that allows you to cache several Azure Files shares on an on-premises Windows Server or cloud virtual machine.

### _Compare storage for file shares and blob data_
[Azure Files ](https://learn.microsoft.com/en-us/azure/storage/files/storage-files-introduction) offers shared storage for applications by using the industry standard [Server Message Block protocol](https://msdn.microsoft.com/library/windows/desktop/aa365233.aspx).

Microsoft Azure Virtual Machines and cloud services can share file data across application components by using mounted shares.

#### Things to know about Azure Files
Below points are some characteristics of Azure Files.

* Azure Files stores data as true directory objects in file shares.
* Azure Files provides shared access to files across multiple virtual machines.
* Applications that run in Azure Virtual Machines or cloud services can mount an Azure Files storage share to access file data.
* Azure Files offers fully managed file shares in the cloud that are accessible via SMB. 

#### Things to consider when using Azure Files
- **Consider replacement and supplement options** - Replace or supplement traditional on-premises file servers or NAS devices wiht Azure Files
- **Consider global access** - Directly access Azure Files shares by using most operating systems from anywhere in the world.
- **Consider lift and shift support** - Lift and shift applications to the cloud with Azure Files for apps that expect a file share.
- **Consider the Azure File Sync agent** - Replicate Azure Files shares to Windows Servers by using the Azure File Sync agent.
- **Consider shared applications** - Store shared application settings such as configuration files.
- **Consider diagnostic data** - Store diagnostic data such as logs, metrics, and crash dumps in a shared location.
- **Consider tools and utilities** - Use Azure Files for storing tools and utilities for VM's or Cloud Services.

#### Compare Azure Files to Blob Storage and Azure Disks
Below table shows comparison of Azure Files, Blob Storage and Azure Disks.

Azure Files (file shares) | Azure Blob Storage (blobs) | Azure Disks (page blobs)
--- | --- | ---
Azure Files provides the SMB and NFS protocols, client libraries, and a REST interface | Blob Storage provides client libraries and a REST interface that supports unstructured data | Azure Disks provides a REST interface to store and access index-based or structured data in page blobs.
Files in an Azure Files share are true directory objects, Data in Azure Files is accessed through file shares | Blobs are a flat namespace and are accessed through a container. | Page blobs in Azure Disks are stored as 512-byte pages and data is exclusive to a single virtual machine.
Ideal for lift and shift for services that already uses the native file system APIs. | Ideal for applications that need to support streaming and random-access scenarios. | Ideal when your applications run frequent random read/write operations.

### _Manage Azure Files shares_
To access your files, you need an Azure storage account.

There are two important settings for Azure Files that you need to be aware of when creating and configuring file shares.

- **Open port 445** - Azure Files uses the SMB protocol. SMB communicates over TCP port 445.
- **Enable secure transfer** - The Secure transfer required setting enhances the security of your storage account by limiting requests to your storage account from secure connections only.

### _Create file share snapshots_
Azure Files provides the capability to take share snapshots of file shares.

File share snapshots capture a point-in-time, read-only copy of your data.

#### Things to know about file share snapshots
* The Azure Files share snapshot capability is provided at the file share level.
* Share snapshots are incremental in nature. Only data changed since the most recent share snapshot is saved.
* Incremental snapshots minimize the time required to create share snapshots and saves on storage costs.
* Even though share snapshots are saved incrementally, you only need to retain the most recent share snapshot to restore the share.
* You can retrieve a share snapshot for an individual file. 
* If you want to delete a share that has share snapshots, you must first delete all of its' snapshots.

#### Things to consider when using file share snapshots
There are several benefits to using file share snapshots and having access to incremental point-in-time data storage.

The below table highlights a few of these benefits.

Benefit | Description
--- | ---
Protect against application error and data corruption | Applications that use file shares perform operations like writing, reading, storage, transmission, and processing.
Protect against accidental deletions or unintended changes | Imagine you're working on a text file in a file share. After the text file is closed, you lose the ability to undo your changes.
Support backup and recovery | After you create a file share, you can periodically create a snapshot of the file share to use it for data backup.

### _Implement Azure File Sync_
Azure File Sync enables you to cache several Azure Files shares on an on-premises Windows Server or cloud virtual machine.

Fule Sync centralizes file shares and keeps flexibility, performance, and compatibility of an on-premises file server.

#### Things to know about Azure File Sync
* Azure File Sync transforms Windows Server into a quick cache of your Azure Files shares.
* You can use any protocol that's available on Windows Server to access your data locally with Azure File Sync, including SMB, NFS, and FTPS.
* Azure File Sync supports as many caches as you need around the world.

#### Cloud tiering
Cloud tiering is an optional feature of Azure File Sync.

Frequently accessed files are cached locally on the server while all other files are tiered to Azure Files based on policy settings.

* When a file is tiered, Azure File Sync replaces the file locally with a pointer.
	* A pointer is commonly referred to as a reparse point.
	* The reparse point represents a URL to the file in Azure Files.
* When a user opens a tiered file, Azure File Sync seamlessly recalls the file data from Azure Files
* Cloud tiering files have greyed icons with an offline O file attribute to let the user know when the file is only in Azure.

#### Things to consider when using Azure File Sync
Below are some advantages to using Azure File Sync.

- **Consider application lift and shift** - Use Azure File Sync to move applications that require access between Azure and on-premises systems.
- **Consider support for branch offices** - Support your branch offices that need to back up files by using Azure File Sync.
- **Consider backup and disaster recovery** - After you implement Azure File Sync, Azure Backup backs up your on-premises data.
- **Consider file archiving with cloud tiering** - Azure File Sync stores only recently accessed data on local servers. Implement cloud tiering so non-used data moves to Azure Files.

### _Identify Azure File Sync components_
Azure File Sync is composed of four main components that work together to provide caching for Azure Files shares.

#### Storage Sync Service
The Storage Sync Service is the top-level Azure resource for Azure File Sync. 

This resource is a peer of the storage account resource and can be deployed in a similar manner.

* The Storage Sync Service forms sync relationships with multiple storage accounts by using multiple sync groups.
* The service requires a distinct top-level resource from the storage account resource to support the sync relationships.
* A subscription can have multiple Storage Sync Service resources deployed.

#### Sync group
A sync group defines the sync topology for a set of files.

Endpoints within a sync group are kept in sync with each other.

An instance of the Storage Sync Service can host as many sync groups as you need.

#### Registered server
The registered server object represents a trust relationship between your server (or cluster) and the Storage Sync Service resource.

You can register as many servers to a Storage Sync Service resource as you want.

#### Azure File Sync agent
The Azure File Sync agent is a downloadable package that enables Windows Server to be synced with an Azure Files share. 

The Azure File Sync agent has three main components:

- **FileSyncSvc.exe** - Background Windows service responsible for monitoring changes and for sync sessions to Azure.
- **StorageSync.sys** - This file is the Azure File Sync file system filter that supports cloud tiering and is responsible for tiering files to Azure Files.
- **PowerShell cmdlets** - These PowerShell management cmdlets allow you to interact with the Microsoft.StorageSync Azure resource provider.
	- ``C:\\Program Files\\Azure\\StorageSyncAgent\\StorageSync.Management.PowerShell.Cmdlets.dll``
	- ``C:\\Program Files\\Azure\\StorageSyncAgent\\StorageSync.Management.ServerCmdlets.dll``

#### Server endpoint
A server endpoint represents a specific location on a registered server, such as a folder on a server volume.

Multiple server endpoints can exist on the same volume if their namespaces are unique. For example, F:\\sync1 and F:\\sync2.

#### Cloud endpoint
A cloud endpoint is an Azure Files share that's part of a sync group.

As part of a sync group, the entire cloud endpoint (Azure Files share) syncs.

- An Azure Files share can be a member of one cloud endpoint only.
- An Azure Files share can be a member of one sync group only.
- If you add a share with existing files as a cloud endpoint to a sync group. The files are merged with the files from other endpoints in the sync group.

### _Deploy Azure File Sync_
Before you can start synchronizing files with Azure File Sync, there are several high-level steps that need to be completed.

#### Step 1: Deploy the Storage Sync Service
You can deploy the Storage Sync Service from the Azure portal. You configure the following settings:

* The deployment name for the Storage Sync Service
* The Azure subscription ID to use for the deployment
* A Resource Group for the deployment
* The deployment location

#### Step 2: Prepare each Windows Server to use Azure File Sync
After deploying the Storage Sync Service, you configure each Windows Server or cloud virtual machine that you intend to use with Azure File Sync.

#### Step 3: Install the Azure File Sync agent
When the Windows Server configuration is complete, you can install the Azure File Sync agent.

The agent is a downloadable package that enables Windows Server to be synced with an Azure Files share.

The Azure File Sync agent installation package should install relatively quickly.

> For the agent installation, Microsoft recommends using the default installation path.\

#### Step 4: Register each Windows Server with the Storage Sync Service
After the Azure File Sync agent installation completes, the **Server Registration** window opens.

By registering a Windows Server with a Storage Sync Service, you establish a trust relationship between your server (or cluster) and the Storage Sync Service.

For the registration, you need:

	- Azure subscription ID
	- The Storage Sync Service deployment name
	- The Resource Group for the deployment

> A server (or cluster) can be registered with only one Storage Sync Service resource at a time.


## Configure Azure Storage with tools
Learn how to configure Azure Storage with tools like Azure Storage Explorer and AZCopy.

Learning objectives:

* Configure and use Azure Storage Explorer.
* Configure the Azure Import/Export service.
* Use the WAImportExport tool with the Azure Import/Export service.
* Configure and use AZCopy.

Skills measured: Implement and manage storage (15–20%)

* Manage Azure Storage
	* Export from Azure job
	* Import into Azure job
	* Install and use Azure Storage Explorer
	* Copy data by using AzCopy

### _Use Azure Storage Explorer_
Azure Storage Explorer is a standalone application that makes it easy to work with Azure Storage data on Windows, macOS, and Linux.

With Azure Storage Explorer, you can access multiple accounts and subscriptions, and manage all your Storage content.

#### Things to know about Azure Storage Explorer
Azure Storage Explorer has the following characteristics.

- Azure Storage Explorer requires both management (Azure Resource Manager) and data layer permissions to allow full access to your resources.
- You need Azure Active Directory (Azure AD) permissions to access your storage account, the containers in your account, and the data in the containers.

- Azure Storage Explorer lets you connect to different storage accounts.
	- Connect to storage accounts associated with your Azure subscriptions.
	- Connect to storage accounts and services that are shared from other Azure subscriptions.
	- Connect to and manage local storage by using the Azure Storage Emulator.

#### Things to consider when using Azure Storage Explorer
Azure Storage Explorer supports many scenarios for working with storage accounts in global and national Azure.

The below table covers some scenarios to apply with Azure Storage implementation.

Scenario | Description
--- | ---
Connect to an Azure subscription | Manage storage resources that belong to your Azure subscription.
Work with local development storage | Manage local storage by using the Azure Storage Emulator.
Attach to external storage | Manage storage resources that belong to another Azure subscription or that are under national Azure clouds by using the storage account name, key, and endpoints. 
Attach a storage account with a SAS | Manage storage resources that belong to another Azure subscription by using a shared access signature (SAS).
Attach a service with a SAS | Manage a specific Azure Storage service (blob container, queue, or table) that belongs to another Azure subscription by using a SAS.

#### Attach to external storage account
Azure Storage Explorer lets you attach to external storage accounts so storage accounts can be easily shared.

To create the connection, you need the external storage ***Account name*** and ***Account key***

To use a storage account name and key from a national Azure cloud, use the Storage endpoints domain drop-down menu to select Other, and then enter the custom storage account endpoint domain.

#### Access keys
Access keys provide access to the entire storage account.

You're provided two access keys so you can maintain connections by using one key while regenerating the other.

> Store your access keys securely. We recommend regenerating your access keys regularly.

	When you regenerate your access keys, you must update any Azure resources and applications that access this storage account to use the new keys.
	
	(This action doesn't interrupt access to disks from your virtual machines.)

### _Use the Azure Import/Export service_
The Azure Import/Export service is used to securely import large amounts of data to Azure Blob Storage and Azure Files by shipping disk drives to an Azure datacenter. 

This service can also be used to transfer data from Azure Blob Storage to disk drives and ship to your on-premises sites.

#### Things to know about the Azure Import/Export service
- Data from your disk drives can be imported to Azure Blob Storage or Azure Files in your Azure storage account.
- Data from Azure Storage in your Azure storage account can be exported to drives that you provide.
- Create an Azure Import job to import data from physical disks into Azure Blob Storage or Azure Files.
- Create an Azure Export job to export data from Azure Storage to hard disk drives.
- You can create jobs directly from the Azure portal or programmatically by using the Azure Storage Import/Export REST API.

#### Things to consider when using the Azure Import/Export service
The Azure Import/Export service is used when uploading or downloading data over the network is too slow or getting more network bandwidth is cost-prohibitive.

The below scenarios are example of when Azure Import/Export can help:

- **Consider cloud migrations** - Move large amounts of data to Azure quickly and cost effectively with the Azure Import/Export service.
- **Consider content distribution** - Send data quickly to customer sites in diverse geographic locations.
- **Consider backup operations** - Take backups of your on-premises data to store in Azure Blob Storage.
- **Consider data recovery** - Recover large amounts of data stored in Blob Storage, and have the delivered to your on-premises location.

#### Azure Import jobs
Azure Import jobs securely transfer large amounts of data to Azure Blob Storage (block blobs or page blobs) or Azure Files.

You ship disk drives to an Azure datacenter, the staff copy specified data to the Azure storage and then return the drives to you.

#### Create an Azure Import job
Follow these steps to create an Azure Import job.

1. If you don't have an Azure storage account, [create an account](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create) to use for the Import job.
2. Determine the number of disks needed to accommodate the data to transfer.
3. Identify the computer to use to perform the data copy, and attach the physical disks you intend to ship to Microsoft.
4. Install the WAImportExport tool on the disks. We'll take a closer look at the WAImportExport tool in the next unit.
5. Run the WAImportExport tool to copy the data on the disks.
	6. Encrypt the disk drives with BitLocker.
	7. Generate journal files to document the data transfer.
8. In the Azure portal, create an Azure Import job and provide the following information:
	9. The Azure Storage account to use for the Import job
	10. The return address for shipment of your disks
	11. Your shipment carrier account number
	12. The datacenter address of the Azure region that hosts the Azure storage account
13. Ship the required number of disks to the Azure region datacenter that hosts the storage account. 
14. Update the Import job to include the shipment tracking number.
15. After the disks arrive at the Azure datacenter, the staff completes the following tasks:
	16. The data on the provided disks is copied to the specified storage account.
	17. The disks are shipped back to you.

#### Azure Export jobs
Follow these steps to create an Azure Export job.

1. Identify the data in Azure Blob Storage to export.
2. Determine the number of disks needed to accommodate the data to transfer.
3. In the Azure portal, create an Azure Export job and provide the following information:
	4. The Azure Storage account to use for the Export job
	5. The blob data to export
	6. The return address for shipment of your disks
	7. Your shipment carrier account number 
8. Ship the required number of disks to the Azure region datacenter that hosts the storage account.
9. Update the Export job to include the shipment tracking number.
10. After the disks arrive at the Azure datacenter, the staff completes the following tasks:
	11. The specified data in the storage account is copied to the disks you provided.
	12. The disk volumes are encrypted by using BitLocker.
	13. The disks are shipped back to you.

> The BitLocker keys used to encrypt your disks are stored with the specified storage account in the Azure portal. 
> You can decrypt the content of the disks and copy the data to your on-premises storage.


### _Use the WAImportExport tool_
WAImportExport is the Azure Import/Export service tool. 

The tool is used to prepare drives before importing data, and to repair any corrupted or missing files after data transfer.

> The WAImportExport tool is available in two versions:
>> Version 1 is best for importing and exporting data in Azure Blob Storage.
>> Version 2 is best for importing data into Azure Files.
> The WAImportExport tool is only compatible with 64-bit Windows operating system.

#### Things to know about the WAImportExport tool
You can use the WAImportExport tool with the Azure Import/Export service to complete the following tasks:

- Before creating an Azure Import job, use the WAImportExport tool to copy data to the hard disk drives you intend to ship to Microsoft.
- After the Azure Import job completes, use the WAImportExport tool to repair any blobs that were corrupted, missing, or that have conflicts with other blobs in your Azure Storage.
- After you receive your disk drives from a completed Azure Export job, use the WAImportExport tool to repair any corrupted or missing files on the drives.
- The WAImportExport tool handles data copy, volume encryption, and creation of journal files. 
	- Journal files are necessary to create an Azure Import/Export job and help ensure the integrity of the data transfer.

#### Things to consider when using the WAImportExport tool
There are several points to consider before using the WAImportExport tool with the Azure Import/Export service.

- **Consider supported disk drives** - For hard disk drives, the Azure Import/Export service requires internal SATA II/III HDDs or SSDs.
- **Consider BitLocker encryption** - When you prepare a disk for an Azure Import job, you must encrypt the NTFS volume of each disk drive with BitLocker.
- **Consider OS version** -  To prepare a disk drive, you must connect the drive to a computer running a 64-bit version of the Windows client or server operating system.

### _Use the AzCopy tool_
An alternate method for transferring data is the AzCopy tool.

AzCopy v10 is the next-generation command-line utility for copying data to and from Azure Blob Storage and Azure Files.

AzCopy v10 offers a redesigned command-line interface (CLI) and new architecture for high-performance reliable data transfers.

You can use AzCopy to copy data between a file system and a storage account, or between storage accounts.

#### Things to know about AzCopy
Below points are some characteristics of the AzCopy tool.

- Every AzCopy instance creates a job order and a related log file.
- You can view and restart previous jobs, and resume failed jobs.
- You can use AzCopy to list or remove files or blobs in a given path. 
- AzCopy supports wildcard patterns in a path, `--include flags`, and `--exclude flags`.
- AzCopy automatically retries a transfer when a failure occurs.
- When you use Azure Blob Storage, AzCopy lets you copy an entire account to another account. (No data transfer to the client is needed)
- AzCopy supports Azure Data Lake Storage Gen2 APIs.
- AzCopy is built into Azure Storage Explorer.
- AzCopy is available on Windows, Linux, and macOS.

#### Authentication options
There are two options to authenticate your transferred data when using AzCopy.

Authentication | Support | Description
--- | --- | ---
Azure Active Directory (Azure AD) | Azure Blob Storage and Azure Data Lake Storage Gen2 | The user enters the .\\azcopy sign-in command to sign in by using Azure AD. The user should have the Storage Blob Data Contributor role assigned.
SAS tokens | Azure Blob Storage and Azure Files | On the command line, the user appends a SAS token to the blob or file path for every command they enter.

#### AzCopy and Azure Storage Explorer
Azure Storage Explorer uses the AzCopy tool for all of its data transfers.

If you want to use a graphical UI to work with your files, you can use Azure Storage Explorer and gain the performance advantages of AzCopy.

Azure Storage Explorer uses your account key to perform operations.

After you sign into Azure Storage Explorer, you don't need to provide your authorization credentials again.

#### Things to consider when using AzCopy
Consider how the tool features can enhance Azure Storage solutions with the following points:

- **Consider data synchronization** - Use AzCopy to synchronize a file system to Azure Blob Storage and vice versa.
- **Consider job management** - Manage your transfer operations with AzCopy. View and restart previous jobs. Resume failed jobs.
- **Consider transfer resiliency** - Provide data resiliency for your data transfers. AzCopy automatically retries failed jobs.
- **Consider fast account to account copy** - Use AzCopy with Azure Blob Storage for the account to account copy feature.


## Create an Azure Storage account
Create an Azure Storage account with the correct options for your business needs.

Learning objectives

* Decide how many storage accounts you need for your project
* Determine the appropriate settings for each storage account
* Create a storage account using the Azure portal

### _Decide how many storage accounts you need_
Organizations often have multiple storage accounts to enable them to implement different sets of requirements.

In the chocolate-manufacturer example, there will be one storage account for private business data and one storage account for consumer-facing files.

#### What is Azure Storage?
Azure provides many ways to store your data, including multiple database options like Azure SQL Database, Azure Cosmos DB, and Azure Table Storage.

Azure offers multiple ways to store and send messages, such as Azure Queues and Event Hubs.

You can even store loose files using services like Azure Files and Azure Blobs.

Azure groups four of these data services together under the name Azure Storage. 

- The four services are:
	- Azure Blobs
	- Azure Files
	- Azure Queues
	- Azure Tables

#### What is a storage account?
A storage account is a container that groups a set of Azure Storage services together.

Only data services from Azure Storage can be included in a storage account (Azure Blobs, Azure Files, Azure Queues, and Azure Tables).

Combining data services into a single storage account enables you to manage them as a group.

The settings you specify when you create the account, or any changes that you make after creation, apply to all services in the storage account.

Deleting a storage account deletes all of the data stored inside it.

Other Azure data services, such as Azure SQL and Azure Cosmos DB, are managed as independent Azure resources and cannot be included in a storage account.

#### Storage account settings
A storage account defines a policy that applies to all the storage services in the account.

For example, you could specify that all the contained services will be stored in the UK West datacenter and accessible only over https.

The settings that are defined by a storage account are:

- **Subscription** - The Azure subscription that will be billed for the services in the account.
- **Location** - The datacenter that will store the services in the account.
- **Performance** - Determines the data services you can have and the type of hardware disks used to store the data.
	- **Standard** allows you to have any data service (Blob, File, Queue, Table) and uses magnetic disk drives.
	- **Premium** provides more services for storing data. These storage accounts also use solid-state drives (SSD) for storage.
- **Replication** - Determines the strategy used to make copies of your data to protect against hardware failure or natural disaster.
- **Access tier** - Controls how quickly you'll be able to access the blobs in a storage account. Tiers commonly used are Hot and Cool.
- **Secure transfer required** - A security feature that determines the supported protocols for access. Enabled requires HTTPS, while disabled allows HTTP.
- **Virtual networks** - A security feature that allows inbound access requests only from the virtual network(s) you specify.

#### How many storage accounts do you need?
A storage account represents a collection of settings like location, replication strategy, and subscription owner.

You need one storage account for each group of settings that you want to apply to your data. For example, specifying different locations will create seperate Storage Accounts.

#### Data diversity
Organizations often generate data that differs in where it is consumed, how sensitive it is, which group pays the bills, etc. 

Diversity along any of these vectors can lead to having multiple storage accounts.

1. Do you have data that is specific to a country or region? If so, you might want to store the data in a datacenter in that region or country for performance or compliance reasons.
2. Do you have some data that is proprietary and some for public consumption? If so, you could enable virtual networks for the proprietary data and not for the public data. 

#### Cost Sensitivity
A storage account by itself has no financial cost. However, the settings you choose for the account influences the cost of it's services.

Geo-redundant storage costs more than locally redundant storage. 

Premium performance and the Hot access tier increase the cost of blobs.

You can use multiple storage accounts to reduce costs. Such as putting critical data in Geo-redundant storage and non-critical in locally redundant storage.

#### Tolerance for management overhead
Each storage account requires some time and attention from an administrator to create and maintain.

It also increases complexity for anyone who adds data to your cloud storage.

Everyone in an administrator role needs to understand the purpose of each storage account so they add new data to the correct account.

Storage accounts are powerful tools to help you obtain the performance and security you need while minimizing costs. 

A typical strategy is to start with an analysis of your data. 

Once you know the kind of data you'll be storing, you then create partitions that share characteristics like location, billing, and replication strategy. 

And basedon those characteristics, you then create a storage account for each partition.


### _Choose your account settings_
The storage account settings already covered apply to the data services in the account.

Here, we will learn about the three settings that apply to the account itself, rather than to the data stored in the account:

* Name
* Deployment model
* Account kind

These settings impact how you manage your account and the cost of the services within it.

#### Name
Each storage account has a name. 

This name must be globally unique within Azure, use only lowercase letters and digits and be between 3 and 24 characters.

#### Deployment model
A deployment model is the system Azure uses to organize your resources.

The model defines the API that you use to create, configure, and manage those resources. Azure provides two deployment models:

- **Resource Manager** - the current model that uses the Azure Resource Manager API
- **Classic** - a legacy offering that uses the classic deployment model

Most Azure resources only work with Resource Manager, which makes it easy to decide which model to choose.

However, storage accounts, virtual machines, and virtual networks support both options.

The key feature difference between the two models is their support for grouping. 
	
	- The Resource Manager model adds the concept of a resource group, which is not available in the classic model
	- A resource group lets you deploy and manage a collection of resources as a single unit.

> Microsoft recommends that you use Resource Manager for all new resources.

#### Account kind
Storage account kind is a set of policies that determine which data services you can include in the account and the pricing of those services. 

There are four kinds of storage accounts:

* **Standard - StorageV2 (general purpose v2):** The current offering that supports all storage types and all of the latest features
* **Premium - Page blobs:** Premium storage account type for page blobs only
* **Premium - Block blobs:** Premium storage account type for block blobs and append blobs
* **Premium - File shares:** Premium storage account type for file shares only

> Microsoft recommends that you use the General-purpose v2 option for new storage accounts.

The core advice here is to choose the Resource Manager deployment model and the StorageV2 (general purpose v2) account kind for all your storage accounts unless you need specific kind for your data.


### _Choose an account creation tool_
There are several tools that create a storage account. 

Your choice is typically based on if you want a GUI and whether you need automation.

#### Available tools
The available tools are:

* Azure Portal
* Azure CLI (Command-line interface)
* Azure PowerShell
* Management client libraries

The portal provides a GUI with explanations for each setting. Which makes the portal easy to use and helpful for learning about the options.

The other tools in the above list all support automation. For example, the Azure CLI and Azure PowerShell let you write scripts for ceating resources.

#### How to choose a tool
Storage accounts are typically based on an analysis of your data, so they tend to be relatively stable.

As a result, storage-account creation is usually a one-time operation done at the start of a project and the portal is the most common choice for these cases.

If you need automation, the decision is between a programmatic API or a scripting solution.


## Control access to Azure Storage with shared access signatures
Grant access to data stored in your Azure Storage accounts securely through the use of shared access signatures.

Learning objectives

* Identify the features of a shared access signature for Azure Storage.
* Identify the features of stored access policies.
* Programmatically generate and use a shared access signature to access storage.

The Azure Storage platform is Microsoft's cloud storage solution for modern data storage solution.

Every request to access files stored in Azure requires authorization.

A shared access signature (SAS) provides secure, delegated access to resources in your storage account.

### _Authorization options for Azure Storage_ 
A shared access signature (SAS) provides a secure way of granting access to resources but isn't the only way to grant access.

#### Access Azure Storage
Files stored in Azure Storage are accessed by clients over HTTP/HTTPS. 

Azure checks each client request for authorization to access stored data. Four options are available for blob storage:

* Public access
* Azure Active Directory (Azure AD)
* Shared key
* Shared access signature (SAS)

#### Public access
Public access is also known as anonymous public read access for containers and blobs.

There are two separate settings that affect public access:

- **The Storage Account** - Configure the storage account to allow public access by setting the AllowBlobPublicAccess property.
- **The Container** - You can enable anonymous access only if anonymous access has been allowed for the storage account. 

> A container has two possible settings for public access: Public read access for blobs, or public read access for a container and its blobs.

Both storage account and container settings are required to enable anonymous public access. 

The advantages of this approach are that you don't need to share keys with clients who need access to your files. You also don't need to manage a SAS.

#### Azure Active Directory
Use the Azure AD option to securely access Azure Storage without storing any credentials in your code.

AD authorization takes a two-step approach. First, you authenticate a security principal that returns an OAuth 2.0 token if successful. 

This token is then passed to Azure Storage to enable authorization to the requested resource.

> Use this form of authentication if you're running an app with managed identities or using security principals.

#### Shared key
Azure Storage creates two 512-bit access keys for every storage account that's created.

You share these keys to grant clients access to the storage account. These keys grant anyone with access equivalent to root access to your storage.

> Microsoft recommends that you manage storage keys with Azure Key Vault because

#### Shared access signature
A SAS lets you grant granular access to files in Azure Storage, such as read-only or read-write access, expiration time.

A shared access signature is a key that grants permission to a storage resource, and should be protected in the same manner as an account key.

Azure Storage supports three types of shared access signatures:

- **User delegation SAS** - Can only be used for Blob storage and is secured with Azure AD credentials.
- **Service SAS** - A service SAS is secured using a storage account key. A service SAS delegates access to a resource in any one of four Azure Storage services.
- **Account SAS** - An account SAS is secured with a storage account key. An account SAS has the same controls as a service SAS, but can also control access to service-level operations, such as Get Service Stats.

You can create a SAS ad-hoc by specifying all the options you need to control, including start time, expiration time, and permissions.

If you plan to create a service SAS, there's also an option to associate it with a stored access policy. A stored access policy can be associated with up to five active SASs.


### _Use shared access signatures to delegate access to Azure Storage_
By using a shared access signature (SAS), you can delegate access to your resources. 

Clients don't have direct access to your storage account credentials and, at a granular level, you control what they access.

#### How shared access signatures work
A SAS has two components: a URI that points to one or more storage resources and a token that indicates how the resources may be accessed by the client.

The SAS token contains the following components, or query parameters.

Query Parameter | Field Name | Example | Description
:---: | --- | :---: | ---
sp | signed permission | sp=r	| Indicates one or more operations the client can perform.
st | start time | st=2020-01-20T11:42:32Z | The date and time when access starts.
se | expiry time | se=2020-01-20T19:42:32Z | The date and time when access ends. 
spr | signed protocol | spr=https | The protocol permitted for a request made with the SAS.
sv | signed version | sv=2019-02-02 | The service version of the storage API to use.
sr | scope of resource | sr=b | The kind of storage being accessed. Available values include b (blob), c (container), d (directory), f (file) s (share)
sig | signature | sig=SrW1...wVZs%3D | The cryptographic signature.

The signature is signed with your storage account key when you create a service or account shared access signature.

#### Best practices
To reduce the potential risks of using a SAS, Microsoft provides some guidance:

* To securely distribute a SAS and help prevent man-in-the-middle attacks, always use HTTPS.
* The most secure SAS is user delegation. Use it wherever possible because it removes the need to store your storage account key in code.
* Try to set your expiration time to the smallest useful value in case a SAS key becomes compromised.
* Apply the rule of minimum-required privileges. Only grant the access that's required.
* When there's an unacceptable risk of using a SAS, create a middle-tier service to manage users and their access to storage.

The most flexible and secure way to use a service or account SAS is to associate the SAS tokens with a stored access policy. 

### _Use stored access policies to delegate access to Azure Storage_
A shared access signature (SAS) is a secure way to give access to clients without having to share your Azure credentials.

This ease of use comes with a downside. Anyone with the correct SAS can access the file while it's still valid.

To revoke access, the valid keys would need regenerating and sharing with relevant people.

#### What are stored access policies?
You can create a stored access policy on four kinds of storage resources:

* Blob containers
* File shares
* Queues
* Tables

The stored access policy you create for a blob container can be used for all the blobs in the container and for the container itself. 

A stored access policy is created with the following properties:

- **Identifier** - The name you use to reference the stored access policy.
- **Start time** - A DateTimeOffset value for the date and time when the policy might start to be used. This value can be null.
- **Expiry time** - A DateTimeOffset value for the date and time when the policy expires.
- **Permissions** - The list of permissions as a string that can be one or all of acdlrw.

#### Create stored access policies
You can create a stored access policy with C# code by using the Azure portal or Azure CLI commands.

**With C# .NET code**

```C#
BlobSignedIdentifier identifier = new BlobSignedIdentifier
{
    Id = "stored access policy identifier",
    AccessPolicy = new BlobAccessPolicy
    {
        ExpiresOn = DateTimeOffset.UtcNow.AddHours(1),
        Permissions = "rw"
    }
};

blobContainer.SetAccessPolicy(permissions: new BlobSignedIdentifier[] { identifier });
```

**In the portal**

* Go to the storage account 
* Then go to the blob storage container 
* On the left, select Access policy. 
* To add a new stored access policy, select + Add policy.
* Enter all the required parameters.

**With Azure CLI commands**

```
az storage container policy create \
    --name <stored access policy identifier> \
    --container-name <container name> \
    --start <start time UTC datetime> \
    --expiry <expiry time UTC datetime> \
    --permissions <(a)dd, (c)reate, (d)elete, (l)ist, (r)ead, or (w)rite> \
    --account-key <storage account key> \
    --account-name <storage account name> \
```

## Upload, download, and manage data with Azure Storage Explorer
Azure Storage Explorer allows you to quickly view all the storage services under your account. 

You can browse through, read, and edit data stored in those services through a user-friendly graphical interface.

Learning objectives

* Describe the features of Azure Storage Explorer
* Install Storage Explorer
* Use Storage Explorer to connect to Azure Storage services and manipulate stored data

### _Connect Azure Storage Explorer to a storage account_
Storage accounts provide a flexible solution that keeps data as files, tables, and messages. 

With Azure Storage Explorer, it's easy to read and manipulate this data.

#### What is Storage Explorer?
Storage Explorer is a GUI application developed by Microsoft to simplify access to, and the management of, data stored in Azure storage accounts. 

Some of the benefits of using Storage Explorer are:

* It's easy to connect to and manage multiple storage accounts.
* The interface lets you connect to Data Lake Storage.
* You can also use the interface to update and view entities in your storage accounts.
* Storage Explorer is free to download and use.

With Storage Explorer, you can use a range of storage and data operation tasks such as edit, download, copy, and delete on any of your Azure storage accounts.

#### Azure Storage types
Azure Storage Explorer can access many different data types from services like these:

- **Azure Blob Storage:** Blob storage is used to store unstructured data as a binary large object (blob).
- **Azure Table Storage:** Table storage is used to store NoSQL, semi-structured data.
- **Azure Queue Storage:** Queue storage is used to store messages in a queue, which can then be accessed and processed by applications through HTTP(S) calls.
- **Azure Files:** Azure Files is a file-sharing service that enables access through the Server Message Block protocol, similar to traditional file servers.
- **Azure Data Lake Storage:** Azure Data Lake, based on Apache Hadoop, is designed for large data volumes and can store unstructured and structured data.

#### Manage multiple storage accounts in multiple subscriptions
Storage Explorer gives you the ability to manage the data stored in multiple Azure storage accounts and across Azure subscriptions.

#### Use local emulators
During the development phase of your project, developers can use a locally based emulator.

Storage Explorer supports two emulators: Azure Storage Emulator and Azurite.

* Azure Storage Emulator uses a local instance of Microsoft SQL Server 2012 Express LocalDB. It emulates Azure Table, Queue, and Blob storage.
* Azurite, which is based on Node.js, is an open-source emulator that supports most Azure Storage commands through an API.

Storage Explorer requires the emulator to be running before you open it.

All locally emulated storage connection types appear in Local & Attached > Storage accounts.

#### Connecting Storage Explorer to Azure
There are several ways to connect your Storage Explorer application to your Azure storage accounts.

* You need two permissions to access your Azure storage account: **management and data.**
* You can use Storage Explorer with only the data-layer permission.
* The data layer requires the user to be granted, at a minimum, a read data role.
* The nature of the read/write role should be specific to the type of data stored in the storage account. 
* The data layer is used to access blobs, containers, and other data resources.

The management role grants access to see lists of your various storage accounts, containers, and service endpoints.

#### Connection types
There are many ways to connect an Azure Storage Explorer instance to your Azure resources. For example:

* Add resources by using Azure Active Directory (Azure AD)
* Use a connection string
* Use a shared access signature URI
* Use a name and key
* Attach to a local emulator
* Attach to Azure Data Lake Storage by using a URI

#### Add an Azure account by using Azure AD
Use this connection type when the user can access the data layer.

You can use it only to create an Azure Data Lake blob container or a standard blob container. 

Connecting to Azure Storage through Azure AD requires more configuration than the other methods.

To add a resource by using Azure AD:

1. Open Storage Explorer.
1. Select the Add an Azure Account option and sign in to Azure.
1. Connect to your Azure storage account.
1. Select Add a resource via Azure AD, and then choose the Azure tenant and the associated account.
1. When you're prompted, provide the type of resource that you're connecting to.
1. Review and verify the connection details, and then select Connect.

It's crucial to select the correct resource type because it changes the information that you need to enter.

Any connections that you create through this approach will appear in the resource tree (Local & attached > Storage Accounts > Attached Containers > Blob).

#### Connect by using a shared access signature URI
A shared access signature (SAS) URI is an unambiguous identifier that's used to access your Azure Storage resources.

With this connection method, you'll use a SAS URI for the required storage account.

You'll need a SAS URI whether you want to use a file share, table, queue, or blob container.

To add a SAS connection:

1. Open Storage Explorer.
1. Connect to your Azure storage account.
1. Select the connection type: shared access signature URI (SAS).
1. Provide a meaningful name for the connection.
1. Provide the SAS URI.
1. Review and verify the connection details, and then select Connect.

When you've added a connection, it appears in the resource tree as a new node. 

You'll find the connection node in this branch: Local & attached > Storage Accounts > Attached Container > Service.

#### Connect by using a storage account name and key
To connect to a storage account on Azure quickly, you use the account key that's associated with the storage. 

To find the storage access keys from the Azure portal, go to the correct storage account page and select access keys.

To add a connection:

1. Open Storage Explorer.
1. Connect to your Azure storage account.
1. Select the connection type: storage account name and key.
1. Provide a meaningful name for the connection.
1. When you're prompted, provide the name of the storage account and either of the account keys needed to access it.
1. From the provided list, select the storage domain that you want to use.
1. Review and verify the connection details, and then select Connect.

When the connection is added, it appears in the resource tree as a connection node. The connection node is in this branch: Local & attached > Storage Accounts.

#### Manage Data Lake Storage Gen1
You can use Storage Explorer to access and manage data stored in Data Lake Storage Gen1.

To connect to a Data Lake service, you'll need the URI associated with the data lake. 

Using a URI allows you to access resources that aren't in your subscription. 

When you have the URI of the resource that you want to access, you connect to it by using the Data Lake Storage Gen1 option.


### _Connect Azure Storage Explorer to Azure Data Lake Storage_
Azure Storage Explorer doesn't just access Azure Storage. It can also access data in Azure Data Lake Storage.

#### Use Storage Explorer to manage Data Lake Storage
You've worked through the basics of connecting Storage Explorer to your Azure account. In the CRM system, your developers use Data Lake Storage for big data storage. 

Azure Data Lake Storage is used for storing and analyzing large data sets.

It supports large data workloads. 

It's well suited to capture data of any type or size, and at any speed. 

Data Lake Storage features all the expected enterprise-grade capabilities like security, scalability, reliability, manageability, and availability.

There are two types of Azure Data Lake Storage: Gen1 and Gen2. Both types are supported in Storage Explorer.

You can use Storage Explorer to connect to Data Lake accounts. Just like storage accounts, you can use it to:

* Create, delete, and manage containers.
* Upload, manage, and administer blobs.

