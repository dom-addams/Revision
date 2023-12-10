# _AZ-305: Design business continuity solutions_

# _Describe high availability and disaster recovery strategies_

Plan an appropriate high availability and disaster recovery strategy based on recovery time objective and recovery point objective. Choose the best solution for IaaS or PaaS deployments or hybrid workloads.

Learning objectives:

* Define recovery time objective and recovery point objective
* Explore the available high availability and disaster recovery options for both IaaS and PaaS
* Devise an appropriate high availability and disaster recovery strategy

Implementing HADR database platform solutions is more than just deploying a feature. Understand why and what you are doing to implement the right strategy.

## Describe recovery time objective and recovery point objective
Understanding recovery time and recovery point objectives are crucial to your high availability and disaster recovery (HADR) plan as they're the foundation for any availability solution.

### Recovery Time Objective
Recovery Time Objective (RTO) is the maximum amount of time available to bring resources online after an outage or problem. 

If that process takes longer than the RTO, there could be consequences such as financial penalties, work not able to be done, and so on. 

RTO can be specified for the whole solution, which includes all resources, as well as for individual components such as SQL Server instances and databases.

### Recovery Point Objective
Recovery Point Objective (RPO) is the point in time to which a database should be recovered and equates to the maximum amount of data loss that the business is willing to accept. 

For example, suppose an IaaS VM containing SQL Server experiences an outage at 10:00 AM and the databases within the SQL Server instance have an RPO of 15 minutes. 

No matter what feature or technology is used to bring back that instance and its databases, the expectation is that there will be at most 15 minutes worth of data lost.

That means the database can be restored to 9:45 AM or later to ensure minimal to no data loss meeting that stated RPO. 

There may be factors that determine if that RPO is achievable.

### Defining Recovery Time and Recovery Point Objectives
RTOs and RPOs are driven by business requirements but are also based on various technological and other factors, such as the skills and abilities of the administrators (not just DBAs). 

While the business may want no downtime or zero data loss, that may not be realistic or possible for a variety of reasons. 

Determining your solution’s RTO and RPO should be an open and honest discussion between all parties involved.

One of the aspects crucial for both RTO and RPO is knowing the cost of downtime. 

If you define that number and the overall effect being down or unavailable has to the business, it's easier to define solutions. 

For example, if the business can lose 10,000 per hour or could be fined by a government agency if something could not be processed, that is a measurable way to help define RTO and RPO. 

Spending on the solution should be proportional to the amount, or the cost, of downtime. If your HADR solution costs $X, but you wind up only being affected for a few seconds instead of hours or days when a problem occurs, it has paid for itself.

From a nonbusiness standpoint, RTO should be defined at a component level (for example, SQL Server) as well as for the entire application architecture. 

The ability to recover from an outage is only as good as its weakest link. 

For example, if SQL Server and its databases can be brought online in five minutes but it takes application servers 20 minutes to do the same, the overall RTO would be 20 minutes, not five. 

The SQL Server environment could still have an RTO of five minutes; it still will not change the overall time to recover.

RPO deals specifically with data and directly influences the design of any HADR solution as well as administrative policies and procedures. 

The features used must support both the RTO and RPOs that are defined. 

While it is hard to test every backup generated for each database in your environment, backups are just files on a file system. 

Without doing at least periodic restores, there is no guarantee they're good. Running checks during the backup process can give you some degree of confidence.

The specific features used, such as an Always On Availability Group (AG) or an Always On Failover Cluster Instance (FCI) will also affect your RTOs and RPOs.

Depending on how the features are configured, IaaS or PaaS solutions may or may not automatically fail over to another location, which could result in longer downtime.

By defining RTO and RPO, the technical solution that supports that requirement can be designed knowing the allowances for time and data loss. If those wind-up being unrealistic, RTOs and RPOs must be adjusted accordingly.

There should be RTOs and RPOs defined for both HA and DR. HA is considered a more localized event that can be recovered from more easily. 

One example of high availability would be an AG automatically failing over from one replica to another within an Azure region.

DR would be akin to bringing up a whole new data center. There are lots of pieces to the puzzle; SQL Server is just one component.

All RTOs and RPOs should be formally documented and revised periodically or as needed. Once they're documented, you can then consider what technologies and features you may use for the architecture.



## Explore high availability and disaster recovery options
To envision a solution for virtual machines (VMs), you must first understand the availability options for IaaS-based deployments.

### Infrastructure-as-a-Service versus Platform-as-a-Service
When it comes to availability, the choice of IaaS or PaaS makes a difference. 

With IaaS, you have a virtual machine, which means there is an operating system with an installation of SQL Server. 

The administrator or group responsible for SQL Server would have a choice of high availability and disaster recovery (HADR) solutions and a great deal of control over what how that solution was configured.

With PaaS-based deployments such as Azure SQL Database, the HADR solutions are built into the feature and often just need to be enabled. There are minimal options that can be configured.

Because of these differences, the choice of IaaS or PaaS may influence the final design of your HADR solution.

### SQL Server HADR Features for Azure Virtual Machine
When using IaaS, you can use the features provided by SQL Server to increase availability. 

In some cases, they can be combined with Azure-level features to increase availability even further.

The features available in SQL Server are shown in the table below

Feature Name | Protects
--- | ---
Always On Failover Cluster Instance (FCI) | Instance
Always On Availability Group (AG) | Database
Log Shipping | Database

An instance of SQL Server is the entire installation of SQL Server (binaries, all the objects inside the instance including things like logins, SQL Server Agent jobs, and databases). 

Instance-level protection means that the entire instance is accounted for in the availability feature.

A database in SQL Server contains the data that end users and applications use. 

There are system databases that SQL Server relies on, as well as databases created for use by end users and applications. 

An instance of SQL Server always has its own system databases. 

Database-level protection means that anything that is in the database, or is captured in the transaction log for a user or application database, is accounted for as part of the availability feature. 

Anything that exists outside of the database or that is not captured as part of the transaction log such as SQL Server Agent jobs and linked servers must be manually dealt with to ensure the destination server can function like the primary if there is a planned or unplanned failover event.

Both FCIs and AGs require an underlying cluster mechanism. 

For SQL Server deployments running on Windows Server, it is a Windows Server Failover Cluster (WSFC) and for Linux it is Pacemaker.

### Always On Failover Cluster Instances
An FCI is configured when SQL Server is installed. 

A standalone instance of SQL Server cannot be converted to an FCI. 

The FCI is assigned a unique name as well as an IP address that is different from the underlying servers, or nodes, participating in the cluster.

The name and IP address must also be different from the underlying cluster mechanism. 

Applications and end users would use the unique name of the FCI for access. 

This abstraction enables applications to not have to know where the instance is running. 

One major difference between Azure-based FCIs versus on-premises FCIs, is that for Azure, an internal load balancer (ILB) is required. 

The ILB is used to help ensure applications and end users can connect to the FCI’s unique name.

When an FCI (failover Cluster Instance) fails over to another node of a cluster, whether it is initiated manually or happens due to a problem, the entire instance restarts on another node. 

That means the failover process is a full stop and start of SQL Server. 

Any applications or end users connected to the FCI will be disconnected during failover and only applications that can handle and recover from this interruption can reconnect automatically.

Upon starting up on the other node, the instance goes through the recovery process. 

The FCI will be consistent to the point of failure, so technically there will be no data loss but any transactions that need to be rolled back will do so as part of recovery. 

FCIs require one copy of a database, but that is also its single point of failure. To ensure another node can access the database, FCIs require some form of shared storage.

For Windows Server-based architectures, this can be achieved via an Azure Premium File Share, iSCSI, Azure Shared Disk, Storage Spaces Direct (S2D), or a supported third-party solution like SIOS DataKeeper

FCIs also require the use of Active Directory Domain Services (AD DS) and Domain Name Services (DNS), so that means AD DS and DNS must be implemented somewhere in Azure for an FCI to work.

Using Windows Server 2016 or later, FCIs can use Storage Replica to create a native disaster recovery solution for FCIs without having to use another feature such as log shipping or AGs.


### Always On availability groups
AGs were introduced in SQL Server 2012 Enterprise Edition and as of SQL Server 2016, are also in Standard Edition. 

In Standard Edition, an AG can contain one database whereas in Enterprise Edition, an AG can have more than one database. 

While Availability Groups share some similarities with Failover Cluster Instances, in most ways they are different.

The biggest difference between an FCI and an AG is that AGs provide database-level protection. 

The primary replica is the instance participating in an AG that contains the read/write databases. 

A secondary replica is where the primary sends transactions over the log transport to keep it synchronized. 

Data movement between a primary replica can be synchronous or asynchronous. The databases on any secondary replica are in a loading state, which means they can receive transactions but cannot be a fully writeable copy until that replica becomes the primary. 

An AG in Standard Edition can have at most two replicas (one primary, one secondary) whereas Enterprise Edition supports up to nine (one primary, eight secondary). 

A secondary replica is initialized either from a backup of the database, or as of SQL Server 2016, you can use a feature called ‘automatic seeding’. 

Automatic seeding uses the log stream transport to stream the backup to the secondary replica for each database of the availability group using the configured endpoints.

An AG provides abstraction with the listener. 

The listener functions like the unique name assigned to an FCI and has its own name and IP address that is different from anything else (WSFC, node, etc.). 

The listener also requires an ILB and goes through a stop and start. 

Applications and end users can use the listener to connect, but unlike an FCI, if desired, the listener does not have to be used. Connections directly to the instance can occur. 

With Enterprise Edition, secondary replicas in Enterprise Edition can also be configured for read-only access if desired and can be used for other functionality such as database consistency checks (DBCCs) and backups.

AGs can have a quicker failover time compared to an FCI, which is one reason they are attractive. 

While AGs do not require shared storage, each replica has a copy of the data, which increases the total number of copies of the database and overall storage costs. 

The storage is local to each replica. For example, if the data footprint of the databases on the primary replica is 1 TB, each replica will also have the same. If there are five replicas, that means you need 5 TB of space.

Remember that any object that exists outside of the database or is not captured in the database’s transaction log must manually be created and accounted for on any other SQL Server instance should that instance need to become the new primary replica.


### Log shipping
The Log shipping feature is based on backup, copy, and restore and is one of the simplest methods of achieving HADR for SQL Server. 

Log shipping is primarily used for disaster recovery, but it could also be used to enhance local availability.

Log shipping, like AGs, provides database-level protection, which means you still need to account for SQL Server Agent jobs, linked servers, instance-level logins, etc. 

There is no abstraction provided natively by log shipping, so a switch to another server participating in log shipping must be able to tolerate a name change. 

If that is not possible, there are methods such as a DNS alias, which can be configured at the network layer to try to mitigate the name change issues.

The log shipping mechanism is simple: 

* First, take a full backup of the source database on the primary server
* Restore it in a loading state (STANDBY or NORECOVERY) on another instance known as a secondary server or warm standby. 
* This new copy of the database is known as a secondary database. 
* An automated process built into SQL Server will then automatically backup the primary database’s transaction log, copy the backup to the standby server, and finally, restore the backup onto the standby.

The SQL Server HADR (High Availability and Disaster Recovery) features are not the only options to enhance IaaS availability. There are some features in Azure that should also be considered.



## Describe Azure high availability and disaster recovery features for Azure Virtual Machines
Azure provides three main options to enhance availability for IaaS deployments:

* Availability Sets
* Availability Zones
* Azure Site Recovery

All three of these options are external to the virtual machine (VM) and don't know what kind of workload is running inside of it.

### Availability sets
Availability sets provide uptime against Azure-related maintenance and single points of failure in a single data center. 

This was one of the first availability features introduced into the Azure platform, and effectively it can be thought of as anti-affinity rules for your VMs. 

This means if you had two SQL Server VMs in an availability set or log shipping pair, they would be guaranteed to never run on the same physical server.

Availability sets are separated into both fault domains and update domains to support both updates to the underlying Azure Infrastructure. 

Fault domains are sets of servers within a data center, which use the same power source and network. 

There can be up to three fault domains in a data center as depicted in the image below by FD 0, 1, and 2. 

Update domains, denoted by UD in the image below, indicate groups of virtual machines and underlying physical hardware that can be rebooted at the same time. 

Different update domains ensure separation.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-data-ai/describe-high-availability-disaster-recovery-strategies/media/module-77-high-availability-final-01.png)

Availability sets and zones don't protect against in-guest failures, such as an OS or RDBMS crash; which is why you need to implement additional solutions such as AGs or FCIs to ensure you meet RTOs and RPOs. 

Both availability sets and zones are designed to limit the impact of environmental problems at the Azure level such as datacenter failure, physical hardware failure, network outages, and power interruptions.

For a multi-tier application, you should put each tier of the application into its own availability set.

Availability sets are not the only way to separate IaaS VMs. 

Azure also provides Availability Zones, but the two can't be combined. You can pick Availability Sets or Availability Zones, you can't use both simultaneously.

### Availability zones
Availability zones account for data center-level failure in Azure. 

Each Azure region consists of many data centers with low latency network connections between them. 

When you deploy VM resources in a region that supports Availability Zones, you have the option to deploy those resources into Zone 1, 2, or 3. 

A zone is a unique physical location, that is, a data center, within an Azure region.

Zone numbers are logical representations. For example, if two Azure subscribers both deploy a VM into Zone 1 in their own subscriptions, that doesn't mean those VMs exist in the same physical Azure data center. 

Additionally, because of the distance there can be some additional latency introduced into zonal deployments. You should test the latency between your VMs to ensure that the latency meets performance targets. 

In most cases round-trip latency will be less than 1 millisecond, which supports synchronous data movement in features like availability groups. 

You can also deploy Azure SQL Database into Availability Zones.

### Azure Site Recovery
Azure Site Recovery provides enhanced availability for VMs at the Azure level and can work with VMs hosting SQL Server. 

Azure Site Recovery replicates a VM from one Azure region to another to create a disaster recovery solution for that VM. 

As noted earlier, this feature does not know that SQL Server is running in the VM and knows nothing about transactions. 

While Azure Site Recovery may meet RTO, it may not meet RPO since it isn't accounting for where data is inside SQL Server. 

Azure Site Recovery has a stated monthly RTO of two hours. 

While most database professionals may prefer to use a database-based method for disaster recovery, Azure Site Recovery works well if it meets your RTO and RPO needs.



## Describe high availability and disaster recovery options for PaaS deployments
PaaS is different when it comes to availability; you can only configure the options that Azure provides.

For the SQL Server-based options of Azure SQL Database and Azure SQL Database Managed Instance, the options are active geo-replication (Azure SQL Database only) and autofailover groups (Azure SQL Database or Azure SQL Database Managed Instance).

Azure Database for MySQL has a service level agreement, which guarantees availability of 99.99, meaning nearly no downtime should be encountered. 

For Azure Database for MySQL, if a node-level problem happens such as hardware failure, a built-in failover mechanism will kick in. 

All transactional changes to the MySQL database are written synchronously to storage upon commit. 

If a node-level interruption occurs, the database server automatically creates a new node and attaches the data storage.

From an application standpoint, you will need to code the necessary retry logic because all connections are dropped as part of spinning up the new node and any in flight transactions are lost. 

This process is considered a best practice for any cloud application, as they should be designed to handle transient failures.

Azure Database for PostgreSQL uses a similar model to MySQL in its standard deployment model; however, Azure PostgreSQL also offers a scale-out hyperscale solution called Citus. 

Citus provides both scale-out and additional high availability for a server group. 

If enabled, a standby replica is configured for every node of a server group, which would also increase cost since it would double the number of servers in the group.

In the event, the original node has a problem such as becoming unresponsive or failing completely, the standby takes its place. 

The data is kept in sync via PostgreSQL synchronous streaming replication.

As with Azure Database for MySQL, solutions that use Azure Database for PostgreSQL must also include retry logic in the application because of dropped connections and loss of in-flight transactions.

Both Azure Database for MySQL and PostgreSQL supports the option for a read replica. 

This means a replica can be used for activities like reporting to offload work from the primary database. 

A read replica also enhances availability because it exists in another region.



## Explore an IaaS high availability and disaster recovery solution
There are many different combinations of features that could be deployed in Azure for IaaS. 

This section will cover five common examples of SQL Server high availability and disaster recovery (HADR) architectures in Azure.

### Single Region High Availability Example 1 – Always On availability groups
If you only need high availability and not disaster recovery, configuring an (availability group) AG is one of the most ubiquitous methods no matter where you are using SQL Server. 

The image below is an example of what one possible AG in a single region could look like.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-data-ai/describe-high-availability-disaster-recovery-strategies/media/module-77-high-availability-final-02.png)

Why is this architecture worth considering?

* This architecture protects data by having more than one copy on different virtual machines (VMs).
* This architecture allows you to meet recovery time objective (RTO) and recovery point objective (RPO) with minimal-to-no data loss if implemented properly.
* This architecture provides an easy, standardized method for applications to access both primary and secondary replicas (if things like read-only replicas will be used).
* This architecture provides enhanced availability during patching scenarios.
* This architecture needs no shared storage, so there is less complication than when using a failover cluster instance (FCI).

### Single Region High Availability Example 2 – Always On Failover Cluster Instance
Until AGs were introduced, FCIs were the most popular way to implement SQL Server high availability. 

FCIs, however, were designed when physical deployments were dominant. 

In a virtualized world, FCIs do not provide many of the same protections in the way they would on physical hardware because it is rare for a VM to have a problem. 

FCIs were designed to protect against things like network card failure or disk failure, both of which would likely not happen in Azure.

FCIs do work, and as long as you have the right expectations about what is and is not provided, an FCI is a perfectly acceptable solution. 

The image below, from the Microsoft documentation, shows a high-level view of what an FCI deployment looks like when using Storage Spaces Direct.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-data-ai/describe-high-availability-disaster-recovery-strategies/media/module-77-high-availability-final-03.png)

Why is this architecture worth considering?

* FCIs are still a popular availability solution.
* The shared storage story is improving with feature like Azure Shared Disk.
* This architecture meets most RTO and RPO for HA (although DR is not handled).
* This architecture provides an easy, standardized method for applications to access the clustered instance of SQL Server.
* This architecture provides enhanced availability during patching scenarios.

### Disaster Recovery Example 1 – Multi-Region or Hybrid Always On availability group
If you are using AGs, one option is to configure the AG across multiple Azure regions or potentially as a hybrid architecture. 

This means that all nodes which contain the replicas participate in the same WSFC. 

This assumes good network connectivity, especially if this is a hybrid configuration. 

One of the biggest considerations would be the witness resource for the WSFC. 

This architecture would require AD DS and DNS to be available in every region and potentially on premises as well if this is a hybrid solution. 

The image below shows what a single AG configured over two locations looks like using Windows Server.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-data-ai/describe-high-availability-disaster-recovery-strategies/media/module-77-high-availability-final-04.png)

Why is this architecture worth considering?

* This architecture is a proven solution; it is no different than having two data centers today in an AG topology.
* This architecture works with Standard and Enterprise editions of SQL Server.
* AGs naturally provide redundancy with additional copies of data.
* This architecture makes use of one feature that provides both HA and D/R

### Disaster Recovery Example 2 –Distributed availability group
A distributed AG is an Enterprise Edition only feature introduced in SQL Server 2016. It is different than a traditional AG. 

Instead of having one underlying WSFC where all of nodes contain replicas participating in one AG as described in the previous example, a distributed AG is made up of multiple AGs. 

The primary replica containing the read write database is known as the global primary. 

The primary of the second AG is known as a forwarder and keeps the secondary replica(s) of that AG in sync. In essence, this is an AG of AGs.

This architecture makes it easier to deal with things like quorum since each cluster would maintain its own quorum, meaning it also has its own witness. 

A distributed AG would work whether you are using Azure for all resources, or if you are using a hybrid architecture.

The image below shows an example distributed AG configuration with two WSFCs. 

Imagine each is in a different Azure region or one is on premises and the other is in Azure. 

Each WSFC has an AG with two replicas. 

The global primary in AG 1 is keeping the secondary of replica of AG 1 synchronized as well as the forwarder, which also is the primary of AG 2. 

That replica keeps the secondary replica of AG 2 synchronized.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-data-ai/describe-high-availability-disaster-recovery-strategies/media/module-77-high-availability-final-05.png)

Why is this architecture worth considering?

* This architecture separates out the WSFC as a single point of failure if all nodes lose communication
* In this architecture, one primary is not synchronizing all secondary replicas.
* This architecture can provide failing back from one location to another.

### Disaster Recovery Example 3 – Log shipping
Log shipping is one of the oldest HADR methods for configuring disaster recovery for SQL Server. 

As described above, the unit of measurement is the transaction log backup. 

Unless the switch to a warm standby is planned to ensure no data loss, data loss will most likely occur. 

When it comes to disaster recovery, it is always best to assume some data loss even if minimal. 

The image below, from the Microsoft documentation, shows an example log shipping topology.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-data-ai/describe-high-availability-disaster-recovery-strategies/media/module-77-high-availability-final-06.png)

Why is this architecture worth considering?

* Log shipping is a tried-and-true feature that has been around for over 20 years
* Log shipping is easy to deploy and administer since it is based on backup and restore.
* Log shipping is tolerant of networks that are not robust.
* Log shipping meets most RTO and RPO goals for DR.
* Log shipping is a good way to protect FCIs.

### Disaster Recovery Example 4 – Azure Site Recovery
For those who do not want to implement a SQL Server-based disaster solution, Azure Site Recovery is a potential option. 

However, most data professionals prefer a database-centric approach as it will generally have a lower RPO.

The image below, from the Microsoft documentation. shows where in the Azure portal you would configure replication for Azure Site Recovery.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-data-ai/describe-high-availability-disaster-recovery-strategies/media/module-77-high-availability-final-07.png)

Why is this architecture worth considering?

* Azure Site Recovery will work with more than just SQL Server.
* Azure Site Recovery may meet RTO and possibly RPO.
* Azure Site Recovery is provided as part of the Azure platform.



## Describe hybrid solutions
You should now understand recovery time objectives (RTOs) and recovery point objectives (RPOs) as well as the different features both in SQL Server as well as Azure.

To increase availability, you can put all of the information covered together and design a solution to meet high availability and disaster recovery (HADR) requirements.

While an architecture can be deployed in one or more Azure regions, many organizations will need or want to have solutions that span both on premises and Azure, or possibly Azure to another public cloud. This type of architecture is known as a hybrid solution.

PaaS solutions by nature aren't designed to allow traditional hybrid solutions. 

HADR is provided by the Azure infrastructure. 

There are some exceptions to HADR in Azure. For example, SQL Server’s transactional replication feature can be configured from a publisher located on premises (or another cloud) to an Azure SQL Managed Instance subscriber, but not the other way.

Hybrid solutions are therefore IaaS-based since they rely on traditional infrastructure. 

Hybrid solutions are useful. Not only can they be used to help migrate to Azure, but the most common usage of a hybrid architecture is to create a robust disaster recovery solution for an on premises system. 

For example, a secondary replica for an AG can be added in Azure. That means any associated infrastructure must exist, such as AD DS and DNS.

Arguably the most important consideration for a hybrid HADR solution that extends to Azure is networking. 

Not having the right bandwidth could mean missing your RTO and RPO. Azure has a fast networking option called ExpressRoute. 

If ExpressRoute isn't something your company can or will implement, configure a secure site-to-site VPN so that the Azure VMs will act as an extension of your on premises infrastructure. 

> Exposing IaaS VMs directly to the public internet is discouraged.

Although not traditionally thought of as hybrid, Azure can also be used as the destination for a database backup and as cold, archival storage for backups.

