# _AZ-104: Deploy and manage Azure compute resources_
Learn how to deploy and configure virtual machines, containers, and Web Apps in Azure.

## Configure Virtual Machines
Learn how to configure virtual machines including sizing, storage, and connections.

Learning objectives:

* Create a virtual machine planning checklist.
* Determine virtual machine locations and pricing models.
* Determine the correct virtual machine size.
* Configure virtual machine storage.

Azure Virtual Machines enables you to create on-demand, scalable computing resources.

Azure Architects commonly use virtual machines to gain greater control over the computing environment.

### _Review cloud services responsibilities_
The primary advantage of working with virtual machines is to have more control over installed software and configuration settings. 

Azure Virtual Machines supports more granular control than other Azure services, such as Azure App Service or Azure Cloud Services.

#### Things to know about Azure Virtual Machines
Consider the following characteristics of Azure Virtual Machines.

* Azure Virtual Machines is the basis of the Azure infrastructure as a service (IaaS) model.
* A virtual machine provides its own operating system, storage, and networking capabilities, and can run a wide range of applications.
* You can implement multiple virtual machines, and configure each machine with different software and settings.
* You can use virtual machines to quickly scale up and down with demand and pay only for what you use.
* The responsibilities associated with configuring and maintaining virtual machines is shared between Microsoft and the customer.

#### Things to consider when using IaaS and virtual machines
Review the following points and think about how you can implement virtual machines in Azure.

- **Consider test and development** - Teams can quickly set up and dismantle test and development environments, bringing new applications to market faster.
- **Consider website hosting** - Running websites by using IaaS and virtual machines can be less expensive than traditional web hosting.
- **Consider storage, backup, and recovery** - Virtual machines let organizations avoid the expense for storage and complexity of storage management.
- **Consider high-performance computing** - Virtual machines enable high-performance computing (HPC) on supercomputers, computer grids, or computer clusters. 
- **Consider big data analysis** - Big data is a popular term for massive data sets that contain potentially valuable patterns, trends, and associations.
- **Consider extended datacenters** - Add capacity to your datacenter by adding virtual machines in Azure. 

### _Plan virtual machines_
Before you create an Azure virtual machine, it's helpful to make a plan for the machine configuration.

#### Things to know about configuring virtual machines
Review the following points for things you need to consider when configuring a virtual machine.

* Start with the network.
* Choose a name for the virtual machine.
* Decide the location for the virtual machine.
* Determine the size of the virtual machine.
* Review the pricing model and estimate your costs.
* Identify which Azure Storage to use with the virtual machine.
* Select an operating system for the virtual machine.

#### Network configuration
Virtual networks are used in Azure to provide private connectivity between Azure Virtual Machines and other Azure services.

Virtual machines and services that are part of the same virtual network can access one another.

By default, services outside the virtual network can't connect to services within the virtual network.

Network addresses and subnets aren't trivial to change after they're configured.

#### Virtual machine name
The virtual machine name is used as the computer name, which is configured as part of the operating system.

You can specify a name with up to 15 characters on a Windows virtual machine and 64 characters on a Linux virtual machine.

A good convention uses several of the following elements in the machine name:

Name element | Examples | Description
--- | --- | ---
Environment or purpose | dev (development), prod (production), QA (testing) | A portion of the name should identify the environment or purpose for the machine.
Location | UW (US West), JE (Japan East), NE (North Europe) | Another portion of the name should specify the region where the machine is deployed.
Instance | 1, 02, 005 | For multiple machines that have similar names, include an instance number to differentiate.
Product or service | Outlook, SQL, AzureAD | A portion of the name can specify the product, application, or service.
Role | security, web, messaging | A portion of the name can specify what role/purpose of the machine is.

#### Virtual machine location
Azure has datacenters all over the world filled with servers and disks. 

These datacenters are grouped into geographic regions like West US, North Europe, Southeast Asia, and so on.

There are two other points to consider about the virtual machine location.

1. The machine location can limit your available options. Each region has different hardware available, and some configurations aren't available in all regions.
2. There are price differences between locations. To find the most cost-effective choice, check for your required configuration in different regions.

#### Virtual machine size
Azure offers different memory and storage options for different [virtual machine sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes).

The best way to determine the appropriate machine size is to consider the type of workload your machine needs to run.

Based on the workload, you can choose from a subset of available virtual machine sizes.

#### Azure Storage
[Azure Managed Disks](https://learn.microsoft.com/en-us/azure/virtual-machines/managed-disks-overview) handle Azure storage account creation and management in the background for you. 

You specify the disk size and the performance tier (Standard or Premium). Azure creates and manages the disk.
 
As you add disks or scale the virtual machine up and down, you don't have to worry about the storage being used. 
 
#### Virtual machine pricing options
A subscription is billed two separate costs for every virtual machine: compute and storage. 

By separating these costs, you can scale them independently and only pay for what you need.

- **Compute expenses** are priced on a per-hour basis but billed on a per-minute basis. 
	- **Consumption-based** - With the consumption-based option, you pay for compute capacity by the second. You're able to increase or decrease compute capacity on demand and start or stop at any time.
	- **Reserved Virtual Machine Instances** - The Reserved Virtual Machine Instances (RI) option is an advance purchase of a virtual machine for one or three years in a specified region.
- **Storage costs** are charged separately for the Azure Storage used by the virtual machine. The status of the virtual machine has no relation to the Azure Storage charges that are incurred.

#### Operating system
Azure provides various operating system images for virtual machine, including several versions of Windows and flavors of Linux.

Azure bundles the cost of the operating system license into the price.

If you're looking for more than just base operating system images, you can search [Azure Marketplace](https://azuremarketplace.microsoft.com/marketplace/apps/category/compute).

If you don't find a suitable operating system image, you can create your own disk image. This can be uploaded to Azure Storage and used to create an Azure virtual machine.


### _Determine virtual machine sizing_
Rather than specify processing power, memory, and storage capacity independently, Azure provides different virtual machine sizes.

The best way to determine the appropriate virtual machine size is to consider the type of workload your virtual machine needs to run.

The following table shows size classifications for Azure Virtual Machines workloads and recommended usage scenarios.

Classification | Description | Scenarios
:---: | --- | ---
General purpose | General-purpose virtual machines are designed to have a balanced CPU-to-memory ratio. | Testing and development, Small to medium databases, Low to medium traffic web servers
Compute optimized | Compute optimized virtual machines are designed to have a high CPU-to-memory ratio. | Medium traffic web servers, Network appliances, Batch processes
Memory optimized | Memory optimized virtual machines are designed to have a high memory-to-CPU ratio. | Relational database servers, Medium to large caches, In-memory analytics
Storage optimized | Storage optimized virtual machines are designed to have high disk throughput and I/O. | Big Data, SQL and NoSQL databases, Data warehousing
GPU | GPU virtual machines are specialized virtual machines targeted for heavy graphics rendering and video editing | Model training, Inferencing with deep learning
High performance computes | High performance compute offers the fastest and most powerful CPU virtual machines with optional high-throughput network interfaces (RDMA). | Workloads that require fast performance, High traffic networks

#### Resizing virtual machines
Azure allows you to change the virtual machine size when the existing size no longer meets your needs. 

You can resize a virtual machine if your current hardware configuration is allowed in the new size. 

This option provides a fully agile and elastic approach to virtual machine management.

When you stop and deallocate the virtual machine, you can select any size available in your region.


### _Determine virtual machine storage_
Just like any other computer, virtual machines in Azure use disks as a place to store the operating system, applications, and data.

#### Things to know about virtual machine storage and disks
All Azure virtual machines have at least two disks: an operating system disk and a temporary disk. 

Virtual machines can also have one or more data disks. All disks are stored as virtual hard disks (VHDs).

A VHD is like a physical disk in an on-premises server but, virtualized.

#### Operating system disk
Every virtual machine has one attached operating system disk. 

The OS disk has a pre-installed operating system, which is selected when the virtual machine is created.

The OS disk is registered as a SATA drive (Serial Advanced Technology Attachment) and labeled as the C: drive by default.

#### Temporary disk
Data on a temporary disk might be lost during a maintenance event or when you redeploy a virtual machine.

During a standard reboot of the virtual machine, the data on the temporary drive should persist.

There are cases where the data might not persist, such as moving to a new host.

* On Windows virtual machines, the temporary disk is labeled as the D: drive by default. This drive is used for storing the pagefile.sys file.
* On Linux virtual machines, the temporary disk is typically /dev/sdb. This disk is formatted and mounted to /mnt by the Azure Linux Agent.

#### Data disks
A data disk is a managed disk that's attached to a virtual machine to store application data, or other data you need to keep.

Data disks are registered as SCSI drives and are labeled with a letter you choose.

The size of a virtual machine determines how many data disks you can attach and the type of storage you can use to host the data disks.

#### Things to consider when choosing storage for your virtual machines
Review the following considerations about using Azure Storage and Azure Managed Disks with virtual machines.

- **Consider Azure Premium Storage** - You can choose Premium Storage to gain high-performance, low-latency disk support for your virtual machines with input/output (I/O)-intensive workloads.
- **Consider multiple Storage disks** - In Azure, you can attach several Premium Storage disks to a virtual machine. 
- **Consider managed disks** - An Azure-managed disk is a VHD. Azure-managed disks are stored as page blobs, which are a random IO storage object in Azure
- **Consider migrating to Premium Storage** - Migrate any virtual machine disk that requires high IOPS to Premium Storage to use SSD drives.

### _Connect to virtual machines_
There are several ways to access your Azure virtual machines. 

The Azure portal supports options for connecting your Windows and Linux machines, and making connections by using Azure Bastion.

#### Things to know about connecting Windows-based virtual machines
To connect to a Windows-based virtual machine hosted on Azure, use the Microsoft Remote Desktop application with the remote desktop protocol (RDP).

The Remote Desktop app provides a graphical user interface (GUI) session to an Azure virtual machine that runs any supported version of Windows.

To create an RDP connection, you specify the IP address for the virtual machine. As an option, you can select the port to use for the connection.

#### Things to know about connecting Linux-based virtual machines
To connect to a Linux-based virtual machine, you can use a secure shell protocol (SSH) client.

SSH is an encrypted connection protocol that allows secure sign-ins over unsecured connections.

Depending on your organization's security policies, you can reuse a single public-private key pair to access multiple Azure virtual machines and services.

You don't need a separate pair of keys for each virtual machine or service you wish to access.

* The **public key** is placed on your Linux virtual machine, or any other service that you wish to use with public-key cryptography.
* The **private key** remains on your local system.

#### Things to know about connecting with Azure Bastion
The Azure Bastion service is a fully platform-managed PaaS service.

Azure Bastion provides secure and seamless RDP/SSH connectivity to your virtual machines directly over SSL.

When you connect via Azure Bastion, your virtual machines don't need a public IP address. 

Azure Bastion provides secure RDP and SSH connectivity to all virtual machines in the virtual network in which it's provisioned.

Azure Bastion protects your virtual machines from exposing RDP/SSH ports to the outside world while still providing secure access with RDP/SSH. 


## Configure virtual machine availability
Learn how to configure virtual machine availability including vertical and horizontal scaling.

Learning objectives

* Implement availability sets and availability zones.
* Implement update and fault domains.
* Implement Azure Virtual Machine Scale Sets.
* Autoscale virtual machines.

Managing virtual machines at scale can be challenging, especially when usage patterns vary and demands on applications fluctuate.

Azure Architects need to be able to adjust their virtual machine resources to match changing demands.

At the same time, they need to keep their virtual machine configuration consistent to ensure application stability. 

### _Plan for maintenance and downtime_
Azure Administrators must be prepared for planned and unplanned failures.

#### Things to know about maintenance planning
An availability plan for Azure virtual machines needs to include strategies for unplanned hardware maintenance, unexpected downtime, and planned maintenance.

Review the following scenarios:

- **unplanned hardware maintenance** - This event occurs when the Azure platform predicts that the hardware or any platform component associated to a physical machine is about to fail. When the platform predicts a failure, it issues an unplanned hardware maintenance event.
- **Unexpected downtime** - This occurs when the hardware or the physical infrastructure for your virtual machine fails unexpectedly. This downtime can include local network failures, local disk failures, or other rack level failures. 
- **Planned maintenance** - These events are periodic updates made by Microsoft to the underlying Azure platform infrastructure. The aim is to improve the overall reliability, performance, and security of the platform.

> Microsoft doesn't automatically update your virtual machine operating system or other software.

### _Create availability sets_
An availability set is a logical feature you can use to ensure a group of related virtual machines are deployed together.

The grouping helps to prevent a single point of failure from affecting all of your machines.

The grouping ensures that not all of the machines are upgraded at the same time during a host operating system upgrade in the datacenter.

#### Things to know about availability sets
Below are some characteristics of availability sets.

* All virtual machines in an availability set should perform the identical set of functionalities.
* All virtual machines in an availability set should have the same software installed.
* Azure ensures that virtual machines in an availability set run across multiple physical servers, compute racks, storage units, and network switches.
* If a hardware or Azure software failure occurs, only a subset of the virtual machines in the availability set are affected.
* You can create a virtual machine and an availability set at the same time.
* You can build availability sets by using the Azure portal, Azure Resource Manager (ARM) templates, scripting, or API tools.
* Microsoft provides robust Service Level Agreements (SLAs) for Azure virtual machines and availability sets. For details, see [SLA for Azure Virtual Machines](https://azure.microsoft.com/support/legal/sla/virtual-machines/v1_9/).

#### Things to consider when using availability sets
Availability sets are an essential capability when you want to build reliable cloud solutions. 

In planning for availability sets, keep the following general principles in mind:

* Consider redundancy.
* Consider separation of application tiers
* Consider load balancing
* Consider managed disks

### _Review update domains and fault domains_
Azure Virtual Machine Scale Sets implements two node concepts to help Azure maintain high availability and fault tolerance when deploying and upgrading applications: update domains and fault domains.

Each virtual machine in an availability set is placed in one update domain and one fault domain.

#### Things to know about update domains
An update domain is a group of nodes that are upgraded together during the process of a service upgrade (or rollout).

An update domain allows Azure to perform incremental or rolling upgrades across a deployment.

Here are some other characteristics of update domains:

* Each update domain contains a set of virtual machines and associated physical hardware that can be updated and rebooted at the same time.
* During planned maintenance, only one update domain is rebooted at a time.
* By default, there are five (non-user-configurable) update domains.
* You can configure up to 20 update domains.

#### Things to know about fault domains
A fault domain is a group of nodes that represent a physical unit of failure. 

Think of a fault domain as nodes that belong to the same physical rack.

* A fault domain defines a group of virtual machines that share a common set of hardware (or switches) that share a single point of failure.
* Two fault domains work together to mitigate against hardware failures, network outages, power interruptions, or software updates.

#### Review availability zones
Availability zones are a high-availability offering that protects your applications and data from datacenter failures.

An availability zone in an Azure region is a combination of a fault domain and an update domain.

#### Things to know about availability zones
Review the following characteristics of availability zones.

* Availability zones are unique physical locations within an Azure region.
* Each zone is made up of one or more datacenters that are equipped with independent power, cooling, and networking.
* To ensure resiliency, there's a minimum of three separate zones in all enabled regions.
* The physical separation of availability zones within a region protects applications and data from datacenter failures.
* Zone-redundant services replicate your applications and data across availability zones to protect against single-points-of-failure.

#### Things to consider when using availability zones
Azure services that support availability zones are divided into two categories.

Category | Description | Examples
--- | --- | ---
Zonal services | Azure zonal services pin each resource to a specific zone. | Azure Virtual Machines, Azure managed disks, Standard IP addresses
Zone-redundant services | For Azure services that are zone-redundant, the platform replicates automatically across all zones. | 

### _Compare vertical and horizontal scaling_
A robust virtual machine configuration includes support for scalability.

Scalability allows throughput for a virtual machine in proportion to the availability of the associated hardware resources.

A scalable virtual machine can handle increases in requests without adversely affecting response time and throughput.

For most scaling operations, there are two implementation options: *vertical* and *horizontal*.

#### Things to know about vertical scaling
Vertical scaling, also known as scale up and scale down, involves increasing or decreasing the virtual machine size in response to a workload. 

Vertical scaling makes a virtual machine more (scale up) or less (scale down) powerful.

#### Things to know about horizontal scaling
Horizontal scaling, also referred to as scale out and scale in, is used to adjust the number of virtual machines in your configuration to support the changing workload.

When you implement horizontal scaling, there's an increase (scale out) or decrease (scale in) in the number of virtual machine instances.

#### Things to consider when using vertical and horizontal scaling
Review the following considerations regarding vertical and horizontal scaling.

- **Consider limitations** - Generally speaking, horizontal scaling has fewer limitations than vertical scaling. A vertical scaling implementation depends on the availability of larger hardware, which quickly hits an upper limit and can vary by region. Vertical scaling also usually requires a virtual machine to stop and restart.
- **Consider flexibility** - When operating in the cloud, horizontal scaling is more flexible. 
- **Consider reprovisioning** - Reprovisioning is the process of removing an existing virtual machine and replacing it with a new machine. A robust availability plan considers where reprovisioning might be required and plans for interruptions to service.

### _Implement Azure Virtual Machine Scale Sets_
Azure Virtual Machine Scale Sets are an Azure Compute resource that you can use to deploy and manage a set of identical virtual machines.

When you implement Virtual Machine Scale Sets and configure all your virtual machines in the same way, you gain true autoscaling.

With Virtual Machine Scale Sets, you don't need to pre-provision your virtual machines.

#### Things to know about Azure Virtual Machine Scale Sets
Review the following characteristics of Azure Virtual Machine Scale Sets.

* All virtual machine instances are created from the same base operating system image and configuration.
* Scale Sets support the use of Azure Load Balancer for basic layer-4 traffic distribution and Azure Application Gateway for more advanced layer-7 traffic distribution and SSL termination.
* You can use Virtual Machine Scale Sets to run multiple instances of your application.
* Customer demand for your application might change throughout the day or week. To meet customer demand, Virtual Machine Scale Sets implements autoscaling.
* Virtual Machine Scale Sets support up to 1,000 virtual machine instances.

### _Create Virtual Machine Scale Sets_
You can implement Azure Virtual Machine Scale Sets in the Azure portal.

You specify the number of virtual machines and their sizes, and indicate preferences for using Azure Spot instances, Azure managed disks, and allocation policies.

In the Azure portal, there are several settings to configure to create an Azure Virtual Machine Scale Sets implementation.

These settings are:

- **Orchestration mode** - Choose how virtual machines are managed by the scale set. *Uniform* or *Flexible*.
- **Image** - Choose the base operating system or application for the VM.
- **VM Architecture** - Azure provides a choice of x64 or Arm64-based virtual machines to run your applications.
- **Run with Azure Spot discount** 
- **Size** - Select a VM size to support the workload that you want to run. The size that you choose then determines factors such as processing power, memory, and storage capacity. 
- **Enable scaling beyond 100 instances** - Identify your scaling allocation preference. If you select No, Scale Sets is limited to one placement group with a maximum capacity of 100. If you select Yes, your implementation can span multiple placement groups with capacity up to 1,000.
- **Spreading algorithm** - Microsoft recommends allocating Max spreading for your implementation.

### _Implement autoscale_
An Azure Virtual Machine Scale Sets implementation can automatically increase or decrease the number of virtual machine instances that run your application.

Autoscaling allows you to dynamically scale your configuration to meet changing workload demands.

Autoscaling minimizes the number of unnecessary virtual machine instances that run your application when demand is low. 

#### Things to consider when using autoscaling
Review the following considerations about autoscaling. 

* Consider automatic adjusted capacity.
* Consider scale out.
* Consider scale in. 
* Consider scheduled events.
* Consider overhead.

### _Configure autoscale_
When you create an Azure Virtual Machine Scale Sets implementation in the Azure portal, you can enable autoscaling.

In the Azure portal, there are several settings to configure to enable autoscaling with Azure Virtual Machine Scale Sets.

* **Scaling policy:** Manual scale maintains a fixed instance count. Custom autoscale scales the capacity on any schedule, based on any metrics.
	* Minimum number of VMs
	* Maximum number of VMs

* Scale out
	* CPU threshold
	* Duration in minutes: Duration in minutes is the amount of time that Autoscale engine will look back for metrics.
	* Number of VMs to increase by: Specify the number of virtual machines to add

* Scale in
	* Scale in CPU threshold: Specify the CPU usage percentage threshold to trigger the scale-in autoscale rule.
	* Number of VMs to decrease by: Specify the number of virtual machines to remove


## Configure virtual machine extensions
Learn how to use virtual machine extensions to automate virtual machine deployments.

Learning objectives

* Identify features and usage cases for virtual machine extensions.
* Identify features and usage cases for Custom Script Extensions.
* Identify features and usage cases for Desired State Configuration.

When a virtual machine requires software installation or anti-virus protection, or the machine needs to run a script, you can use virtual machine extensions to manage these processes.

### _Implement virtual machines extensions_
There are several ways to automate the tasks of creating, maintaining, and removing virtual machines. One way is to use a virtual machine extension.

Azure virtual machine extensions are small applications that provide post-deployment configuration and automation tasks for Azure Virtual Machines.

#### Things to know about virtual machine extensions
Examine the following characteristics of virtual machine extensions.

* You can manage virtual machine extensions with the Azure CLI, PowerShell, Azure Resource Manager (ARM) templates, and the Azure portal.
* Virtual machine extensions can be bundled with a new virtual machine deployment or run against any existing system.
* There are different virtual machine extensions for Windows and Linux machines. 

#### Things to consider when using virtual machine extensions
- **Consider deployment** - Virtual machine extension small applications can be a subset of a larger deployment for your virtual machines.
- **Consider provisioning** - You can use virtual machine extensions as configuration applications to assist with provisioning your virtual machines.
- **Consider post-deployment** - Virtual machine extensions can be run against any supported extension operated systems after deployment.

### _Implement Custom Script Extensions_
Custom Script Extensions can be used to automatically launch and execute virtual machine customization tasks after initial machine configuration.

Your script extension can perform simple tasks such as stopping the virtual machine or installing a software component.

Scripts can also be more complex and perform a series of tasks.

#### Things to know about Custom Script Extensions
Examine the below details about working with Custom Script Extensions.

* You can install Custom Script Extensions from the Azure portal by accessing your virtual machine's Extensions page.
* After the Custom Script Extensions resource is created for your virtual machine, you provide a PowerShell script file with the commands to execute on the machine.
* Scripts can be downloaded from Azure Storage or GitHub, or provided to the Azure portal at extension run time.
* You can also use the PowerShell Set-AzVmCustomScriptExtension command to run scripts with Custom Script Extensions.

#### Things to consider when using Custom Script Extensions
Review the following considerations regarding using Custom Script Extensions with virtual machines.

- **Consider tasks that might time out** - Keep in mind that Custom Script Extensions only have 90 minutes to execute.
- **Consider dependencies** - Identify dependencies in your virtual machine task configuration. If your Custom Script Extension requires networking or storage access, make sure the content is available.
- **Consider failure events** - Plan for any errors that might occur when running your script.
- **Consider sensitive data** - Your Custom Script Extension might need sensitive information such as credentials, storage account names, and storage account access keys.

### _Implement Desired State Configuration_
Desired State Configuration is a management platform in Windows PowerShell. 

Desired State Configuration enables deploying and managing configuration data for software services and managing the environment in which these services run.

#### Things to know about creating your Desired State Configuration
Review the following details about how to create a Desired State Configuration for your virtual machines.

* You can use Desired State Configuration when Custom Script Extensions don't satisfy the application requirements
* Desired State Configuration centers around creating specific configurations by using scripts.
* A configuration is an easy-to-read script that describes an environment made up of computers (nodes) with specific characteristics.
* The configuration script consists of a configuration block, node block, and one or more resource blocks.
	* The configuration block is the outermost script block. You define the block with the `Configuration` keyword and providing a name.
	* Node blocks define the computers or virtual machines that you're configuring. You define a node with the `Node` keyword and providing a name for the resource.
	* Resource blocks configure the resource (computers or virtual machines) properties. You provide the name of the Windows Role or Feature that you want to ensure is added or removed.
	* The `Ensure` keyword is used to indicate if the Role or Feature is added.
* Desired State Configuration provides a set of Windows PowerShell language extensions, Windows PowerShell cmdlets, and resources.
* You can use these extension features to declaratively specify how you want your software environment to be configured.
* The Windows PowerShell Desired State Configuration comes with a set of built-in configuration resources, such as `File Resource`, `Log Resource`, and `User Resource`.

#### Things to consider when using Desired State Configuration
The following PowerShell script installs IIS on the localhost and ensures the web server is present. The configuration is saved as a PS1 file.

* The configuration block is named **IISInstall**.
* There's one node block that targets a computer resource named **localhost**.
* There's one resource block that specifies the Web-Server Windows Feature for IIS. The `Ensure` value indicates the Windows Feature is Present.


## Configure Azure App Service plans
Learn how to configure an Azure App Service plan, including pricing and scaling.

Learning objectives

* Identify features and usage cases for Azure App Service.
* Select an appropriate Azure App Service plan pricing tier.
* Scale an Azure App Service plan.
* Scale out an Azure App Service plan.

Azure Architects need to be able to scale a web application.

Scaling enables an application to remain responsive during periods of high demand. 

### _Implement Azure App Service plans_
In Azure App Service, an application runs in an Azure App Service plan.

In App Service plan defines a set of compute resources for a web application to run.

The compute resources are analogous to a server farm in conventional web hosting.

One or more applications can be configured to run on the same computing resources (or in the same App Service plan).

#### Things to know about App Service plans
* When you create an App Service plan in a region, a set of compute resources is created for the plan in the specified region.
* Any applications that you place into the plan run on the compute resources defined by the plan.
* Each App Service plan defines three settings:
	* Region - The region for the App Service plan.
	* Number of VM instances - The number of virtual machine instances to allocate for the plan.
	* Size of VM instances - The size of the virtual machine instances in the plan, including Small, Medium, or Large.

#### How applications run and scale in App Service plans
The Azure App Service plan is the scale unit of App Service applications.

Depending on the pricing tier for your Azure App Service plan, your applications run and scale in a different manner.

Here's a summary of how applications run and scale in Azure App Service plan pricing tiers:

* **Free or Shared tier:**
	* Applications run by receiving CPU minutes on a shared virtual machine instance.
	* Applications can't scale out.

* **Basic, Standard, Premium, or Isolated tier:**
	* Applications run on all virtual machine instances configured in the App Service plan.
	* Multiple applications in the same plan share the same virtual machine instances.
	* If you have multiple deployment slots for an application, all deployment slots run on the same virtual machine instances.
	* If you enable diagnostic logs, perform backups, or run WebJobs, these tasks use CPU cycles and memory on the same virtual machine instances.

#### Things to consider when using App Service plans
Review the following considerations about using Azure App Service plans to run and scale your applications.

- **Consider cost savings**
- **Consider multiple applications in one plan**
- **Consider plan capacity**
- **Consider application isolation.** Isolate your application into a new App Service plan when:
	- The application is resource-intensive.
	- You want to scale the application independently from the other applications in the existing plan.
	- The application needs resource in a different geographical region.

> Overloading an App Service plan can potentially cause downtime for new and existing applications.

### _Determine Azure App Service plan pricing_
The pricing tier of an Azure App Service plan determines what App Service features you get and how much you pay for the plan.

#### Things to know about App Service plan pricing tiers
There are six categories of pricing tiers for an Azure App Service plan.

Feature | Free | Shared | Basic | Standard | Premium | Isolated
--- | --- | --- | --- | --- | --- | --- 
Usage | Development, Testing | Development, Testing | Dedicated development, Testing | Production workloads | Enhanced scale, performance | High performance, security, isolation
Web, mobile, or API applications | 10 | 100 | Unlimited | Unlimited | Unlimited | Unlimited
Disk space | 1 GB | 1 GB | 10 GB | 50 GB | 250 GB | 1 TB
Auto scale | 	n/a | n/a | n/a | Supported | Supported | Supported
Deployment slots | n/a | n/a | n/a | 5 | 20 | 20
Max instances | n/a | n/a | Up to 3 | Up to 10 | Up to 30 | Up to 100

#### Free and Shared
The Free and Shared service plans are base tiers that run on the same Azure virtual machines as other applications.

Some applications might belong to other customers.

These tiers are intended to be used for development and testing purposes only. 

No SLA is provided for the Free and Shared service plans. 

Free and Shared plans are metered on a per application basis.

#### Basic
The Basic service plan is designed for applications that have lower traffic requirements, and don't need advanced auto scale and traffic management features.

Pricing is based on the size and number of instances you run.

Built-in network load-balancing support automatically distributes traffic across instances.

The Basic service plan with Linux runtime environments supports Web App for Containers.

#### Standard
The Standard service plan is designed for running production workloads.

Pricing is based on the size and number of instances you run. 

Built-in network load-balancing support automatically distributes traffic across instances.

The Standard plan includes auto scale that can automatically adjust the number of virtual machine instances running to match your traffic needs.

The Standard service plan with Linux runtime environments supports Web App for Containers.

#### Premium
The Premium service plan is designed to provide enhanced performance for production applications.

The upgraded Premium plan, Premium v2, offers Dv2-series virtual machines with faster processors, SSD storage, and double memory-to-core ratio compared to the Standard tier.

The new Premium plan also supports higher scale via increased instance count while still providing all the advanced capabilities of the Standard tier.

The first generation of Premium plan is still available to support existing customer scaling needs.

#### Isolated
The Isolated service plan is designed to run mission critical workloads that are required to run in a virtual network.

The Isolated plan allows customers to run their applications in a private, dedicated environment in an Azure datacenter.

The plan offers Dv2-series virtual machines with faster processors, SSD storage, and a double memory-to-core ratio compared to the Standard tier.

The private environment used with an Isolated plan is called the App Service Environment. 

The plan can scale to 100 instances with more available upon request.


### _Scale up and scale out Azure App Service_
There are two methods for scaling your Azure App Service plan and applications: scale up and scale out.

You can scale your applications manually or automatically, which is referred to as autoscale.

#### Things to know about Azure App Service scaling
Let's examine the details of scaling for your Azure App Service plan and App Service applications.

* The scale up method increases the amount of CPU, memory, and disk space. 
* The scale-out method increases the number of virtual machine instances that run your application.
* You can scale out to as many as 30 instances, depending on your App Service plan pricing tier.
* With autoscale, you can automatically increase the scale instance count for the scale-out method. (Autoscale is based on predefined rules and schedules)
* Your App Service plan can be scaled up and down at any time by changing the pricing tier of the plan.

#### Things to consider when using Azure App Service scaling
Review the following benefits of implementing scaling for your App Service plan and applications.

* Consider manually adjusting plan tiers - Start your plan at a lower pricing tier and scale up as needed to acquire more App Service features.
* Consider autoscale to support users and reduce costs - Keep serving your users when your application is experiencing high throughput. 
* Consider no redeployment - When you change your scale settings, you don't need to change your code or redeploy your applications.
* Consider scaling other Azure services - If your App Service app depends on other Azure services, such as Azure SQL Database or Azure Storage, you can scale those resources separately.

### _Configure Azure App Service autoscale_
The autoscale process allows you to have the right amount of resources running to handle the load on your application.

You can add resources to support increases in load and save money by removing idle resources.

#### Things to know about autoscale
Let's take a closer look at how to use autoscale for your Azure App Service plan and applications.

* To use autoscale, you specify the minimum, and maximum number of instances to run by using a set of rules and conditions.
* When your application runs under autoscale conditions, the number of virtual machine instances are automatically adjusted based on your rules.
* An autoscale setting is read by the autoscale engine to determine whether to scale out or in.
* Autoscale settings are grouped into profiles.
* Autoscale rules include a trigger and a scale action (in or out). The trigger can be metric-based or time-based.
	* Metric-based rules measure application load and add or remove virtual machines based on the load
	* Time-based rules (or, schedule-based) allow you to scale when you see time patterns in your load
* The autoscale engine uses notification settings.
	* A notification setting defines what notifications should occur when an autoscale event occurs based on satisfying the criteria

#### Things to consider when configuring autoscale
There are several considerations to keep in mind when you configure autoscale for your Azure App Service plan and applications.

- **Minimum instance count**
- **Maximum instance count**
- **Adequate scale margin**
- **Scale rule combinations** - Always use a scale-out and scale-in rule combination 
- **Metric statistics** - Choose the appropriate statistic for scaling
- **Default instance count**
- **Notifications** - Always configure autoscale notifications.


## Configure Azure App Service
Learn how to configure and monitor Azure App Service instances, including deployment slots.

Learning objectives

* Identify features and usage cases for Azure App Service.
* Create an app with Azure App Service.
* Configure deployment settings, specifically deployment slots.
* Secure your Azure App Service app.
* Configure custom domain names.
* Back up and restore your Azure App Service app.
* Configure Azure Application Insights.

Azure Architects are interested in solutions that make it easier to deploy and manage their web, mobile, and API applications.

### _Implement Azure App Service_
Azure App Service brings together everything you need to create websites, mobile backends, and web APIs for any platform or device.

#### App Service benefits
Review the following table and think about what features can help you host your App Service instances.

Benefit | Description
--- | ---
Multiple languages and frameworks | App Service has first-class support for ASP.NET, Java, Ruby, Node.js, PHP, and Python.
DevOps optimization	| App Service supports continuous integration and deployment with Azure DevOps, GitHub, BitBucket, Docker Hub, and Azure Container Registry.
Global scale with high availability | App Service lets you choose from more than 50 connectors for enterprise systems (such as SAP), SaaS services (such as Salesforce), and internet services (such as Facebook).
Security and compliance | App Service is ISO, SOC, and PCI compliant. You can authenticate users with Azure Active Directory or with social logins like Microsoft. Create IP address restrictions and manage service identities.
Application templates | Choose from an extensive list of application templates in the Azure Marketplace, such as WordPress, Joomla, and Drupal.
Visual Studio integration | App Service offers dedicated tools in Visual Studio to help streamline the work of creating, deploying, and debugging.
API and mobile features | App Service provides turn-key CORS support for RESTful API scenarios.
Serverless code | App Service lets you run a code snippet or script on-demand without having to explicitly provision or manage infrastructure. You pay only for the compute time your code actually uses.

### _Create an app with App Service_
You can use the Web Apps, Mobile Apps, or API Apps features of Azure App Service, and create your own apps in the Azure portal.

#### Things to know about configuration settings
Let's examine some of the basic configuration settings you need to create an app with App Service.

* Name - The name for your app must be unique because it's used to identify and locate your app in Azure. 
* Publish - App Service hosts (publishes) your app as code or as a Docker Container.
* Runtime stack - App Service uses a software stack to run your app, including the language and SDK versions.
* Operating system - The operating system for your app runtime stack can be Linux or Windows.
* Region - The region location that you choose for your app affects the App Service plans that are available.
* App Service plan - Your app needs to be associated with an Azure App Service plan to establish available resources, features, and capacity.

#### Post-creation settings
After your app is created, other configuration settings become available in the Azure portal, including app deployment options and path mapping.

Some of the extra configuration settings can be included in the developer's code, while others can be configured in your app.

Here are a few of the extra application settings.

* Always On - You can keep your app loaded even when there's no traffic. 
* ARR affinity - In a multi-instance deployment, you can ensure your app client is routed to the same instance for the life of the session.
* Connection strings - Connection strings for your app are encrypted at rest and transmitted over an encrypted channel.

### _Explore continuous integration and deployment_
The Azure portal provides out-of-the-box continuous integration and deployment with Azure DevOps, GitHub, Bitbucket, FTP, or a local Git repository.

You can connect your web app with any of the above sources and App Service handles the rest for you. 

With Azure DevOps, you can also define your own build and release process.

#### Things to know about continuous deployment
When you create your web app with App Service, you can choose automated or manual deployment.

- **Automated deployment** - Continuous Integration is a process used to push out new features and bug fixes in a fast and repetitive pattern.
	- Azure DevOps - Push your code to Azure DevOps, build your code, run the tests, generate a release from the code, and finally, push your code to an Azure web app.
	- GitHub: Azure supports automated deployment directly from GitHub. Updates from GitHUb and automatically deployed to the app.
	- Bitbucket: With its similarities to GitHub, you can configure an automated deployment with Bitbucket.

- **Manual deployment** - Enables you to manually push your code to Azure. There are several options for manually pushing your code:
	- Git - The App Service Web Apps feature offers a Git URL that you can add as a remote repository. 
	- CLI - The webapp up command is a feature of the command-line interface that packages your app and deploys it.
	- Visual Studio: Visual Studio features an App Service deployment wizard that can walk you through the deployment process.
	- FTP/S: FTP or FTPS is a traditional way of pushing your code to many hosting environments, including App Service.

### _Create deployment slots_
When you deploy your web app, web app on Linux, mobile backend, or API app to Azure App Service, you can use a separate deployment slot instead of the default production slot.

#### Things to know about deployment slots
Characteristics of deployment slots.

* Deployment slots are live apps that have their own hostnames.
* Deployment slots are available in the Standard, Premium, and Isolated App Service pricing tiers. Your app needs to be running in one of these tiers to use deployment slots.
* The Standard, Premium, and Isolated tiers offer different numbers of deployment slots.
* App content and configuration elements can be swapped between two deployment slots, including the production slot.

#### Things to consider when using deployment slots
There are several advantages to using deployment slots with your App Service app.

* Consider validation - You can validate changes to your app in a staging deployment slot before swapping the app changes with the content in the production slot.
* Consider reductions in downtime - Deploying an app to a slot first and swapping it into production ensures that all instances of the slot are warmed up before being swapped.
* Consider restoring to last known good site - After a swap, the slot with the previously staged app now has the previous production app.
* Consider Auto swap - Auto swap streamlines Azure DevOps scenarios where you want to deploy your app continuously with zero cold starts and zero downtime for app customers.

### _Add deployment slots_
Deployment slots are configured in the Azure portal. You can swap your app content and configuration elements between deployment slots, including the production slot.

#### Things to know about creating deployment slots
Let's review some details about how deployment slots are configured.

* New deployment slots can be empty or cloned.

* Deployment slot settings fall into three categories:
	* Slot-specific app settings and connection strings (if applicable)
	* Continuous deployment settings (when enabled)
	* Azure App Service authentication settings (when enabled)

* When you clone a configuration from another deployment slot, the cloned configuration is editable.
* Some configuration elements follow the content across the swap. 
* Other slot-specific configuration elements stay in the source slot after the swap.

#### Swapped settings versus slot-specific settings
The following table lists the settings that are swapped between deployment slots, and settings that remain in the source slot (slot-specific).

Swapped settings | Slot-specific settings
--- | ---
General settings, such as framework version, 32/64-bit, web sockets | Custom domain names
App settings * | Non-public certificates and TLS/SSL settings
Connection strings * | Scale settings
Handler mappings | Always On
Public certificates | IP restrictions
WebJobs content | WebJobs schedulers
Hybrid connections ** | Diagnostic settings
Service endpoints ** | Cross-origin resource sharing (CORS)
Azure Content Delivery Network ** | Virtual network integration
Path mapping | Managed identities
 | Settings that end with the suffix \_EXTENSION_VERSION

"*" Setting can be configured to be slot-specific.

"**" Feature isn't currently available.
 
### _Secure your App Service app_
Azure App Service provides built-in authentication and authorization support.

You can sign in users and access data by writing minimal or no code in your web app, API, and mobile backend, and also your Azure Functions apps.

Secure authentication and authorization require deep understanding of security, including federation, encryption, JSON web tokens (JWT) management, grant types, and so on.

App Service provides these utilities so you can spend more time and energy on providing business value to your customer.

#### Things to know about app security with App Service
Let's take a closer look at how App Service helps you provide security for your app.

* The authentication and authorization security module in Azure App Service runs in the same environment as your application code, yet separately.
* The security module is configured by using app settings. No SDKs, specific languages, or changes to your application code are required.
* When you enable the security module, every incoming HTTP request passes through the module before it's handled by your application code.
* The security module handles several tasks for your app:
	* Authenticate users with the specified provider
	* Validate, store, and refresh tokens
	* Manage the authenticated session
	* Inject identity information into request headers


#### Things to consider when using App Service for app security
You configure authentication and authorization security in App Service by selecting features In the Azure portal.

- **Allow Anonymous requests (no action)** - Defer authorization of unauthenticated traffic to your application code.
- **Allow only authenticated requests** - Redirect all anonymous requests to `/.auth/login/<provider>` for the provider you choose. The feature is equivalent to `Log in with <provider>`.
- **Logging and tracing** - View authentication and authorization traces directly in your log files.

#### Create custom domain names
When you create a web app, Azure assigns the app to a subdomain of `azurewebsites.net`.

Suppose your web app is named `contoso`.

Azure creates a URL for your web app as `contoso.azurewebsites.net`.

Azure also assigns a virtual IP address for your app.

#### Configure a custom domain name for your app
There are three steps to create a custom domain name.

The following steps outline how to create a domain name in the Azure portal.

> To map a custom DNS name to your app, you need a paid tier of an App Service plan for your app.

1. **Reserve your domain name** - If you haven't registered for an external domain name for your app, the easiest way to set up a custom domain is to buy one directly in the Azure portal.
	2. This name isn't the Azure assigned name of `\*.azurewebsites.net`.
	3. The registration process enables you to manage your web app's domain name directly in the Azure portal instead of going to a third-party site.
	4. Configuring the domain name in your web app is also a simple process in the Azure portal.

1. **Create DNS records to map the domain to your Azure web app** - The Domain Name System (DNS) uses data records to map domain names to IP addresses. There are several types of DNS records.
	2. For web apps, you create either an `A` (Address) record or a `CNAME` (Canonical Name) record.
		3. An `A` record maps a domain name to an IP address.
		4. A `CNAME` record maps a domain name to another domain name. (DNS uses the second name to look up the address but Users still see the first domain name in their browser)
	5. If the IP address changes, a `CNAME` entry is still valid, whereas an A record must be updated.
	6. Some domain registrars don't allow `CNAME` records for the root domain or for wildcard domains. In such cases, you must use an `A` record.

1. **Enable the custom domain** - After you have your domain and create your DNS record, use the Azure portal to validate your custom domain and add it to your web app.


### _Back up and restore your App Service app_
The Backup and Restore feature in Azure App Service lets you easily create backups manually or on a schedule.

You can configure the backups to be retained for a specific or indefinite amount of time.

You can restore your app or site to a snapshot of a previous state by overwriting the existing content or restoring to another app or site.

#### Things to know about Backup and Restore
Examine the following details about the Backup and Restore feature.

* To use the Backup and Restore feature, you need the Standard or Premium tier App Service plan for your app or site.
* You need an Azure storage account and container in the same subscription as the app to back up.
* Azure App Service can back up the following information to the Azure storage account and container you configured for your app:
	* App configuration settings
	* File content
	* Any database connected to your app
* In your storage account, each backup consists of a Zip file and XML file:
	* The Zip file contains the back-up data for your app or site.
	* The XML file contains a manifest of the Zip file contents.
* You can configure backups manually or on a schedule.
* Full backups are the default.
* Partial backups are supported. You can specify files and folders to exclude from a backup.
* You restore partial backups of your app or site the same way you restore a regular backup.
* Backups can hold up to 10 GB of app and database content.
* Backups for your app or site are visible on the Containers page of your storage account and app (or site) in the Azure portal.

#### Things to consider when creating backups and restoring backups
Let's review some considerations about creating a backup for your app or site, and restoring data and content from a backup.

- **Consider full backups** - Do a full backup to easily save all configuration settings, all file content, and all database content connected with your app or site.
- **Consider partial backups** - Specify a partial backup so you can choose exactly which files to back up.
- **Consider browsing back-up files** - Unzip and browse the Zip and XML files associated with your backup to access your backups.
- **Consider firewall on back-up destination** - If your storage account is enabled with a firewall, you can't use the storage account as the destination for your backups.

### _Use Azure Application Insights_
Azure Application Insights is a feature of Azure Monitor that lets you monitor your live applications.

You can integrate Application Insights with your App Service configure to automatically detect performance anomalies in your apps.

Application Insights is designed to help you continuously improve the performance and usability of your apps.

The feature offers powerful analytics tools to help you diagnose issues and understand what users actually do with your apps.

#### Things to know about Application Insights
Below are some characteristics of Application Insights for Azure Monitor.

* Application Insights works on various platforms including .NET, Node.js and Java EE.
* The feature can be used for configurations that are hosted on-premises, in a hybrid environment, or in any public cloud.
* Application Insights integrates with your Azure DevOps process, and has connection points to many development tools.
* You can monitor and analyze data from mobile apps by integrating with Visual Studio App Center.

#### Things to consider when using Application Insights
Consider monitoring the following items in your App Service configuration scenario.

- **Consider Request rates, response times, and failure rates**
- **Consider Dependency rates, response times, and failure rates**
- **Consider Exceptions**
- **Consider Page views and load performance**
- **Consider User and session counts**
- **Consider Performance counters**
- **Consider Host diagnostics**
- **Consider Diagnostic trace logs**
- **Consider Custom events and metrics**


## Configure Azure Container Instances
Learn how to configure Azure Container Instances including container groups.

Learning objectives

* Identify when to use containers versus virtual machines.
* Identify the features and usage cases of Azure Container Instances.
* Implement Azure container groups.

Containers in Azure offer a standardized and repeatable way to package, deploy, and manage cloud applications.

Azure Container Instances let you run a container in Azure without managing virtual machines and without a higher-level service.

### _Compare containers to virtual machines_
Hardware virtualization has made it possible to run multiple isolated instances of operating systems concurrently on the same physical hardware.

Containers represent the next stage in the virtualization of computing resources.

Container-based virtualization allows you to virtualize the operating system.

This approach lets you run multiple applications within the same instance of an operating system, while maintaining isolation between the applications. 

The containers within a virtual machine provide functionality similar to that of virtual machines within a physical server.

#### Things to know about containers versus virtual machines
To better understand container-based virtualization, let's compare containers and virtual machines.

Compare | Containers | Virtual machines
--- | --- | ---
Isolation | A container typically provides lightweight isolation from the host and other containers. | A virtual machine provides complete isolation from the host operating system and other virtual machines. 
Operating system | Containers run the user mode portion of an operating system and can be tailored to contain just the needed services for your app. | Virtual machines run a complete operating system including the kernel, which requires more system resources.
Deployment | You can deploy individual containers by using Docker or deploy multiple containers by using an orchestrator such as Azure Kubernetes Service. | You can deploy individual virtual machines by using Windows Admin Center or Hyper-V Manager. Or multiple by using PowerShell or System Center Virtual Machine Manager.
Persistent storage | Containers use Azure Disks for local storage for a single node, or Azure Files (SMB shares) for storage shared by multiple nodes or servers. | Virtual machines use a virtual hard disk (VHD) for local storage for a single machine, or an SMB file share for multiple servers.
Fault tolerance | If a cluster node fails, any containers running on the node are rapidly recreated on another cluster node. | Virtual machines can fail over to another server in a cluster, where the virtual machine's operating system restarts on the new server.

#### Things to consider when using containers
Containers offer several advantages over physical and virtual machines.

Review the following benefits and consider how you can implement containers for the internal apps for your company.

- **Consider flexibility and speed** - Gain increased flexibility and speed when developing and sharing your containerized application code.
- **Consider testing** - Choose containers for your configuration to allow for simplified testing of your apps.
- **Consider app deployment** - Implement containers to gain streamlined and accelerated deployment of your apps.
- **Consider workload density** - Support higher workload density and improve your resource utilization by working with containers.

### _Review Azure Container Instances_
Containers are becoming the preferred way to package, deploy, and manage cloud applications.

Azure Container Instances offers the fastest and simplest way to run a container in Azure.

Azure Container Instances is a great solution for any scenario that can operate in isolated containers, including simple applications, task automation, and build jobs.

#### Things to know about Azure Container Instances
Review the below list of the benefits of using Azure Container Instances.

* Fast startup times - Containers can start in seconds without the need to provision and manage virtual machines.
* Public IP connectivity and DNS names - Containers can be directly exposed to the internet with an IP address and FQDN (fully qualified domain name).
* Hypervisor-level security - Container applications are as isolated in a container as they would be in a virtual machine.
* Custom sizes - Container nodes can be scaled dynamically to match actual resource demands for an application.
* Persistent storage. Containers support direct mounting of Azure Files file shares.
* Linux and Windows containers. Container Instances can schedule both Windows and Linux containers.
* Coscheduled groups - Container Instances supports scheduling of multi-container groups that share host machine resources.
* Virtual network deployment - Container Instances can be deployed into an Azure virtual network.

### _Implement container groups_
The top-level resource in Azure Container Instances is the container group.

A container group is a collection of containers that get scheduled on the same host machine.

The containers in a container group share a lifecycle, resources, local network, and storage volumes.

#### Things to know about container groups
Review the below details about container groups for Azure Container Instances.

* A container group is similar to a pod in Kubernetes. It typically has a 1:1 mapping but can contain multiple containers.
* Azure Container Instances allocates resources to a multi-container group by adding together the resource requests of all containers in the group.
* There are two common ways to deploy a multi-container group: *Azure Resource Manager (ARM) templates* and *YAML files*.
* Container groups can share an external-facing IP address, one or more ports on the IP address, and a DNS label with an FQDN.
	* External Client Access - You must expose the port on the IP address and from the container to enable external access
	* Port mapping - **isn't supported** because containers in a group share a port namespace.
	* Deleted groups - When a container group is deleted, its IP address and FQDN are released.

#### Things to consider when using container groups
Multi-container groups are useful when you want to divide a single functional task into a few container images.

The images can be delivered by different teams and have separate resource requirements.

* Consider web app updates - Consider front-end and back-end support
* Consider log data collection - Use a multi-container group to capture logging and metrics data about your app.
* Consider app monitoring - Enable monitoring for your app with a multi-container group.
* Consider front-end and back-end support - Create a multi-container group to hold your front-end container and back-end container. 

### _Review the Docker platform_
Docker is a platform that enables developers to host applications within a container. 

A container in Docker is essentially a standalone package that contains everything needed to run an app or piece of software.

Docker Hub provides a large global repository of container images from developers, open source projects, and independent software vendors.

Docker Hosts are machines that run Docker and allow you to run your apps as containers.

#### Things to know about Docker and containers
* The Docker platform is available on both Linux and Windows and can be hosted on Azure.
* A Docker container package includes the application executable code, the runtime environment such as .NET Core, system tools, and settings.
* A Dockerfile is a text file with instructions on how to build a Docker image. The Dockerfile is like a batch script. 
* The first line of a Dockerfile identifies the base image. The rest of the file includes the build actions.
* The key feature of Docker is the guarantee that a Container always runs the same locally, on Windows, Linux, or in the cloud on Azure.
* Develop your code locally within a Docker container, share it with Quality Assurance resources for testing, and deploy your code to Azure.

#### Things to consider when using Docker
Review the following terminology and concepts for Docker and Azure Container Instances.

* Container - An instance of a Docker image
* Container image - A package with all the dependencies and information required to create a container. 
* Build - The process of creating a container image based on the information and context provided by the Dockerfile.
* Pull: The process of downloading a Docker container image from a container registry.
* Push: The process of uploading a Docker container image to a container registry.


## Configure Azure Kubernetes Service
Learn how to configure Azure Kubernetes Service including networking, storage, and scaling.

Learning objectives

* Identify Azure Kubernetes Service (AKS) components including pods, clusters, and nodes.
* Configure network connections for AKS.
* Configure storage options for AKS.
* Implement security options for AKS.
* Scale AKS including adding Azure Container Instances.

To make the management process easier, it's common to use a container management platform, such as Kubernetes.

Azure offers its own flavour of Kubernetes called Azure Kubernetes Service.

### _Explore Azure Kubernetes Service terminology_
Azure Kubernetes Service (AKS) provides a simplified approach for deploying a managed Kubernetes cluster in Azure.

Azure operates as a hosted Kubernetes service and performs critical functions like health monitoring and maintenance.

AKS employs components like nodes, pods, and pools to help you deploy and manage your container applications in Kubernetes clusters.

#### AKS concepts
Review the following terminology and concepts for Azure Kubernetes Service.

* **Pools:** A pool is a group of nodes that have an identical configuration.
* **Nodes:** A node is an individual virtual machine that runs containerized applications.
* **Pods:** A pod is a single instance of an application. A pod can contain multiple containers.
* **Container:** A container is a lightweight and portable executable image that contains software and all of its dependencies.
* **Deployment:** A deployment has one or more identical pods managed by Kubernetes.
* **Manifest:** The manifest is the YAML file that describes a deployment.

### _Explore the AKS cluster and node architecture_
An Azure Kubernetes Service cluster is divided into two components: Azure-managed nodes and customer-managed nodes.

Azure-managed nodes provide the core Kubernetes services and orchestration of application workloads in your AKS cluster.

Customer-managed nodes run your application workloads in your AKS cluster.

[Architecture Overview Image](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-kubernetes-service/media/kubernetes-clusters-4ae0bac1.png)

#### Things to know about AKS clusters, nodes, and pools
Let's take a closer look at how Azure Kubernetes Service implements clusters and nodes.

* To run your applications and supporting services, you need a Kubernetes node for your AKS cluster.
* Nodes are instances of Azure Virtual Machines. Nodes of the same configuration are grouped together into node pools.
* The initial number of nodes and size are defined when you create an AKS cluster, which creates the default node pool.
* When you create an AKS cluster, an Azure-managed cluster node is automatically created and configured.
* The kubelet is the Kubernetes agent that processes the orchestration requests from the Azure-managed node, and scheduling of running the requested containers.
* The kube-proxy component handles virtual networking on each node. 
* The proxy routes network traffic and manages IP addressing for services and pods.
* The container runtime component allows containerized applications to run and interact with other resources such as the virtual network and storage.
* When you implement Azure Kubernetes Service clusters, you pay only for running agent nodes in your cluster.
	* AKS clusters with Kubernetes version 1.19 node pools and later use containerd as the container runtime.
	* AKS clusters with node pools that use Kubernetes versions earlier than v1.19 implement Moby (upstream Docker) as the container runtime.

### _Configure Azure Kubernetes Service networking_
Kubernetes provides an abstraction layer for virtual networking to allow access to your applications, or for application components to communicate with each other.

Azure Kubernetes Service expands on the Kubernetes features to simplify the process to support networking.

#### Things to know about Kubernetes virtual networking
Let's review how virtual networking is supported in Kubernetes.

* Kubernetes nodes are connected to a virtual network, which provides inbound and outbound connectivity for pods.
* The kube-proxy component runs on each node to provide the network features.
* Network policies configure security and filtering of the network traffic for pods.
* Network traffic can be distributed by using a load balancer.
* Complex routing of application traffic can be achieved with Ingress Controllers.

#### Azure Kubernetes Service
The Azure platform helps to simplify virtual networking for Azure Kubernetes Service clusters.

When you create a Kubernetes load balancer, the underlying Azure Load Balancer resource is created and configured.

As you open network ports to pods, the corresponding Azure network security group rules are configured.

For HTTP application routing, Azure can configure an external DNS as new ingress routes are configured.

#### Things to know about Kubernetes service types
There are four service types available for creating network configurations.

Service type | Description | Scenario
:---: | --- | ---
Cluster IP | Create an internal IP address for use within an Azure Kubernetes Service cluster. | Implement internal-only applications that support other workloads within the cluster
NodePort | Create a port mapping on the underlying node. | Allow direct access to the application with the node IP address and port
LoadBalancer | Create an Azure Load Balancer resource, configure an external IP address, and connect the requested pods to the load balancer back-end pool. | Allow customer traffic to reach the application by creating load-balancing rules on the desired ports
ExternalName | Create a specific DNS entry. | Support easier application access

Here are some details about these network configuration options:

* You can create internal and external load balancers.
* The IP address for load balancers and services can be dynamically assigned, or you can specify an existing static IP address.
* Internal load balancers are only assigned a private IP address, so can't be accessed from the internet.
* Both internal and external static IP addresses can be assigned. The existing static IP address is often tied to a DNS entry.

#### Things to know about Kubernetes pods
Kubernetes uses pods to run an instance of your application, where a pod represents a single instance of your application.

Let's examine how Kubernetes uses pods and containers to support networking.

* Pods typically have a 1:1 mapping with a container
* Multi-container pods are scheduled together on the same node, and allow containers to share related resources.
* When you create a pod, you can define resource limits to request a certain amount of CPU or memory resources.
* You can specify maximum resource limits that prevent a given pod from consuming too much
* A pod is a logical resource, but a container is where the application workloads run.

### _Configure Azure Kubernetes Service storage_
There are different scenarios where applications in an Azure Kubernetes Service cluster might need to store and retrieve data.

Consider the following examples for when to configure storage in AKS:

* Your application workload uses local, fast data storage on a node that's not needed after the pods are deleted.
* Your application workload requires storage that persists on more regular data volumes within the Azure platform.
* Multiple pods share the same data volumes, or reattach data volumes if the pod is rescheduled on a different node.
* You need to inject sensitive data or application configuration information into pods.

#### Things to know about storage volumes
Applications often need to store and retrieve data. 

Kubernetes treats individual pods as ephemeral, disposable resources.

There are different approaches are available for applications to use and persist data as necessary.

Storage volumes represent a way to store, retrieve, and persist data across pods and through the application lifecycle.

* Traditional storage volumes that store and retrieve data are created as Kubernetes resources backed by Azure Storage.

* You can manually create storage volumes to be assigned to pods directly, or have Kubernetes automatically create them.

* Storage volumes can use Azure Disks or Azure Files:
	* Use Azure Disks to create a Kubernetes DataDisk resource.
	* Use Azure Files to mount an SMB 3.0 share backed by an Azure storage account to pods. 

#### Things to know about persistent volumes
Volumes are defined and created as part of the pod lifecycle and exist only until the pod is deleted.

A persistent volume (PersistentVolume) is a storage resource that can exist beyond the lifetime of an individual pod.

* You can use Azure Disks or Azure Files to provide a persistent volume.
* A persistent volume can be statically created by a cluster administrator, or dynamically created by the Kubernetes API server.
* If a pod is scheduled, and requests Storage that's not currently available, Kubernetes can create the underlying Azure Disks or Azure Files storage.
* Dynamic provisioning uses a `StorageClass` type to identify what kind of Azure Storage needs to be created.

#### Things to know about storage classes
To define different tiers of storage, such as Premium and Standard, you can configure a StorageClass type

The StorageClass type also defines the reclaimPolicy actions for the storage. 

The reclaimPolicy definition controls the behavior of the underlying Azure Storage resource when the pod is deleted.

The underlying Storage resource can be deleted, or retained for use with a future pod.

In Azure Kubernetes Service, four initial `StorageClasses` types are created for a cluster by using in-tree storage plugins:

StorageClass type | Description | reclaimPolicy action
:---: | --- | ---
default | Use Azure StandardSSD storage to create an Azure managed disk. | Ensures the underlying Azure disk is deleted when the persistent volume that used the disk is deleted.
managed-premium | Use Azure Premium storage to create an Azure managed disk. | Ensures the underlying Azure disk is deleted when the persistent volume that used the disk is deleted.
azurefile | Use Azure Standard storage to create an Azures Files file share. | Ensures the underlying Azure Files file share is deleted when the persistent volume that used the file share is deleted.
azurefile-premium | Use Azure Premium storage to create an Azures Files file share. | Ensures the underlying Azure Files file share is deleted when the persistent volume that used the file share is deleted.


> If no StorageClass type is specified for a persistent volume, the default type is used.

#### Things to know about persistent volume claims
A persistent volume claim (PersistentVolumeClaim) requests either Azure Disks or Azure Files storage of a particular StorageClass, access mode, and size.

* The Kubernetes API server can dynamically provision the underlying storage resource in Azure, if no resource exists to fulfill the claim based on defined StorageClass type.
* The pod definition includes the volume mount after the volume has been connected to the pod.
* A persistent volume is bound to a persistent volume claim after an available Storage resource is assigned to the pod that requests the volume.
* There's a 1:1 mapping of persistent volumes to claims.

### _Configure Azure Kubernetes Service scaling_
The process of scaling involves adjusting the compute resources allocated for your application instances to meet workload demands.

When you run applications in an Azure Kubernetes Service cluster, you might need to apply scaling to increase or decrease your compute resources. 

#### Things to know about scaling techniques
In an Azure Kubernetes Service cluster, you can manually scale pods or nodes, and automatically scale pods or clusters.

Scaling technique | Description | Version requirements
--- | --- | ---
Manually scale pods or nodes | Manually scale your replicas (pods) and nodes to test how your application responds to changes in available resources and state. | All Kubernetes versions
Automatically scale pods | Use the horizontal pod autoscaler (HPA) to monitor resource demand and automatically scale the number of your replicas. | AKS clusters that deploy the Metrics Server for Kubernetes 1.8 or later
Automatically scale clusters | Respond to changing pod demands with the cluster autoscaler, which adjusts the number of your nodes based on the requested compute resources in the node pool. | RBAC-enabled AKS clusters that run Kubernetes 1.10.x or later

#### Things to consider when using horizontal autoscaling
Let's review some details about working with the horizontal pod autoscaler.

* Consider number of pods (replicas)
* Consider scaling metrics
* Consider cooldown for scaling events
* Consider tuning cooldown values

#### Things to consider when using cluster autoscaling
Now let's consider the details for working with the cluster autoscaler.

* Consider combining with HPA - Cluster autoscaler is typically used alongside the horizontal pod autoscaler.
* Consider scale-out events - autoscale in scenarios such as when pods don't have enough compute resources.
* Consider burst scaling to Azure Container Instances - For applications that have high burst demands, you can scale with virtual nodes and Azure Container Instances.
* Consider scale-in events - The cluster autoscaler monitors the pod scheduling status for nodes that haven't recently received new scheduling requests. 
* Consider avoiding single pods 

### _Configure AKS burst scaling to Azure Container Instances_
Kubernetes has built-in components to scale your replicas (pods) and nodes. 

If your application needs to scale rapidly, the horizontal pod autoscaler might schedule more pods than can be provided by the existing compute resources in the node pool.

To resolve this situation, you can rapidly scale your Azure Kubernetes Service cluster by integrating with Azure Container Instances.

#### Things to know about rapid burst scaling
Review the following characteristics of an AKS cluster that uses Azure Container Instances for rapid burst scaling.

* Azure Container Instances lets you quickly deploy your container instance without extra infrastructure overhead.
* The Virtual Kubelet component is installed in your AKS cluster. The component presents your container instance as a virtual Kubernetes node.
* Kubernetes schedules pods to run as container instances through virtual nodes rather than AKS Cluster Nodes.
* Your application requires no modification to use virtual nodes.
* Deployments can scale across AKS and Container Instances with no delay when scaling nodes
* Virtual nodes are deployed to another subnet in the same virtual network as your AKS cluster. This allows the traffic between Container Instances and AKS to be secured.


## Create a Windows virtual machine in Azure
Azure virtual machines (VMs) enable you to create dedicated compute resources in minutes that can be used just like a physical desktop or server machine.

Learning objectives

* Create a Windows virtual machine using the Azure portal
* Connect to a running Windows virtual machine using Remote Desktop
* Install software and change the network configuration on a VM using the Azure portal

### _Create a Windows virtual machine in Azure_
Azure VMs are an on-demand, scalable cloud computing resource.

They're similar to virtual machines that are hosted in Windows Hyper-V and include processor, memory, storage, and networking resources.

You can use a Remote Desktop Protocol (RDP) client to connect directly to the Windows desktop (UI) and use the VM as if you were signed in to a local Windows computer.

#### Create an Azure VM
You can create VMs on Azure in several ways: the Azure portal, a script (using the Azure CLI or Azure PowerShell), or through an Azure Resource Manager template.

The Azure Marketplace also provides pre-configured images that include both an OS and popular software tools installed for specific scenarios.

#### Resources used in a Windows VM
When creating a Windows VM in Azure, you also create resources to host the VM. 

These resources work together to virtualize a computer and run the Windows operating system. 

These resources must either exist (and be selected during VM creation), or they will be created with the VM.

* A virtual machine that provides CPU and memory resources
* An Azure Storage account to hold the virtual hard disks
* Virtual disks to hold the OS, applications, and data
* Virtual network (VNet) to connect the VM to other Azure services or your own on-premises hardware
* A network interface to communicate with the VNet
* A public IP address so you can access the VM (this is optional)

> All resources pertaining to the VM need to be in a Resource Group

#### Choose the VM image
Selecting an image is one of the first and most important decisions you'll make when creating a VM.

An image is a template that's used to create a VM. These templates include an OS and often other software, such as development tools or web-hosting environments.

Any application that the computer can support can be included in the VM image. 

You can create a VM from an image that's pre-configured to exactly match your requirements, such as hosting an ASP.NET Core app.

#### Size your VM
Just as a physical machine has a certain amount of memory and CPU power, so does a virtual machine. 

Azure offers a range of VMs of differing sizes at different price points. 

The size that you choose will determine the VMs processing power, memory, and max storage capacity.

VM sizes are grouped into categories, starting with the B-series for basic testing, and running up to the H-series for massive computing tasks.

The below table shows some guideline sizes beased on different scenarios:

What are you doing? | Consider these sizes
--- | ---
General use computing / web: Testing and development, small to medium databases, or low to medium traffic web servers | B, Dsv3, Dv3, DSv2, Dv2
Heavy computational tasks: Medium traffic web servers, network appliances, batch processes, and application servers | Fsv2, Fs, F
Large memory usage: Relational database servers, medium to large caches, and in-memory analytics. | Esv3, Ev3, M, GS, G, DSv2, Dv2
Data storage and processing: Big Data, SQL, and NoSQL databases, which need high disk throughput and IO | Ls
Heavy graphics rendering or video editing, as well as model training and inferencing (ND) with deep learning | NV, NC, NCv2, NCv3, ND
High-performance computing (HPC): If you need the fastest and most powerful CPU virtual machines with optional high-throughput network interfaces | H

#### Choose storage options
The next set of decisions revolves around storage. 

First, you can choose the disk technology. Options include a traditional platter-based hard disk drive (HDD) or a more modern solid-state drive (SSD). 

SSD storage costs more but provides better performance. (There are two levels of SSD storage available: standard and premium)

#### Map storage to disks
Azure uses virtual hard disks (VHDs) to represent physical disks for the VM

VHDs replicate the logical format and data of a disk drive, but are stored as page blobs in an Azure Storage account.

You can choose on a per-disk basis what type of storage it should use (SSD or HDD). 

By default, two virtual hard disks (VHDs) will be created for your Windows VM:

1. The Operating System disk. This is your primary or C: drive and has a maximum capacity of 2048 GB.
2. A Temporary disk. This provides temporary storage for the OS or any apps. It is configured as the D: drive by default and is sized based on the VM size.

#### What about data?
You can store data on the C: drive along with the OS, but a better approach is to create dedicated data disks. 

You can create and attach additional disks to the VM. 

Each data disk can hold up to 32,767 gibibytes (GiB) of data, with the maximum amount of storage determined by the VM size you select.

#### Unmanaged vs. Managed disks
The final storage choice you'll make is whether to use *unmanaged* or *managed* disks.

* With unmanaged disks:
	* You're responsible for the storage accounts that are used to hold the VHDs corresponding to your VM disks
	* You pay the storage account rates for the amount of space you use.
	* A single storage account has a fixed rate limit of 20,000 I/O operations/sec. 
	* A single storage account is capable of supporting 40 standard virtual hard disks at full throttle.

* Managed disks
	* Are the newer (and recommended) disk-storage model.
	* They solve the complexity of unmanaged disks by putting the burden of managing the storage accounts onto Azure.
	* You specify the disk type (Premium or Standard) and the size, and Azure creates and manages both the disk and the storage

Managed Disk also have the following benefits:

* Increased reliability - Azure ensures that VHDs associated with high-reliability VMs will be placed in different parts of Azure storage
* Better security - Managed disks are truly managed resources in the resource group. They can use role-based access control to restrict who can work with the VHD data.
* Snapshot support - You can use snapshots to create a read-only copy of a VHD. 
* Backup support	- You can automatically back up managed disks to different regions for disaster recovery with Azure Backup.

#### Network communication
Virtual machines communicate with external resources using a virtual network (VNet).

The VNet represents a private network in a single region on which your resources communicate.

You can divide Virtual Networks up with subnets to isolate resources, connect them to other networks (including your on-premises networks), and apply traffic rules to govern inbound and outbound connections.

#### Plan your network
When you create a new VM, you'll have the option of creating a new virtual network or using an existing VNet in your region.

Having Azure create the network together with the VM is simple, but it's likely not ideal for most scenarios.

It's better to plan your network requirements up front for all the components in your architecture.

After planning you can create the VNet structure you need, and then create the VMs and place them into the already-created VNets.

### _Use RDP to connect to Windows Azure virtual machines_
After creating a Windows virtual machine, if you need to install custom software onto it. There are several options to choose from:

1. Remote Desktop Protocol (RDP)
1. Custom scripts
1. Custom VM images (with the software preinstalled)

#### What is the Remote Desktop Protocol?
Remote Desktop (RDP) provides remote connectivity to the UI of Windows-based computers. 

RDP lets you sign in to a remote physical or virtual Windows computer and control that computer as if you were seated at the console.

An RDP connection enables you to carry out a majority of operations with the exception of some power and hardware-related functions.

An RDP connection requires an RDP client. Microsoft provides RDP clients for the following operating systems:

* Windows (built-in)
* macOS
* iOS
* Android

> There are also open-source Linux clients, such as Remmina, that allow you to connect to a Windows PC from an Ubuntu distribution.

#### Connecting to an Azure VM
VM's can also have an optional public IP address assigned to them.

With a public IP, we can communicate with the VM over the Internet.

Alternatively, you can set up a virtual private network (VPN) to connect your local network to Azure allowing connections without expising a public IP.

Public IP addresses in Azure is they're often dynamically allocated. This means the IP address can change over time such as when the VM is restarted.

You can pay more to assign static addresses if you want to connect directly to an IP address instead of a name and need to ensure that the IP address won't change.

#### How do you connect to a VM in Azure using RDP?
Connecting to a VM in Azure using RDP is a simple process

1. In the Azure portal, go to the properties of the VM, and at the top, click Connect.
2. This will show you the IP addresses assigned to the VM and give you the option to download a preconfigured.rdp file (used in RDP client tool)
3. You can choose to connect over the public IP address of the VM in the RDP file.
4. If you're connecting over VPN or ExpressRoute, you can select the internal IP address. You can also select the port number for the connection.

If you're using a static public IP address for the VM, you can save and reuse the .rdp file. 

If you're using dynamic IP addressing, the .rdp file only remains valid while the VM is running. If you stop and restart the VM, you must download another .rdp file.

When you connect, you'll typically receive two warnings. These are:

1. Publisher warning: caused by the .rdp file not being publicly signed
2. Certificate warning: caused by the machine certificate not being trusted


### _Configure Azure virtual machine network settings_
Making adjustments to server configuration is commonly performed with equipment in your on-premises environment.

In this sense, you can consider Azure VMs to be an extension of that environment. 

You can make configuration changes, manage networks, open or block traffic, and more through the Azure portal, Azure CLI, or Azure PowerShell tools.

#### Open ports in Azure VMs
By default, new VMs are locked down.

Apps can make outgoing requests, but the only inbound traffic allowed is from the Virtual Network (other Azure resources) and from Azure's Load Balancer (probe checks).

When you create a new VM, you have an opportunity to open a few common ports (RDP, HTTP, HTTPS, and SSH).

The process for opening common ports involves two steps:

1. Create a Network Security Group.
2. Create an inbound rule allowing traffic on port 20 and 21 for active FTP support. 

#### What is a Network Security Group?
Virtual networks (VNets) are the foundation of the Azure networking model, and provide isolation and protection. 

Network Security Groups (NSGs) are the main tool you use to enforce and control network traffic rules at the networking level. 

NSGs are an optional security layer that provides a software firewall by filtering inbound and outbound traffic on the VNet.

Security groups can be associated to a network interface (for per-host rules), a subnet in the virtual network (to apply to multiple resources), or both levels.

#### Security group rules
NSGs use rules to allow or deny traffic moving through the network.

Each rule consists of the following:

* the source and destination address (or range)
* protocol
* port (or range)
* direction (inbound or outbound)
* a priority number (101, 102, etc)
* allow or deny 

Each security group has a set of default security rules to apply the default network rules described above. 

The default rules can't be modified, but can be overridden.

#### How Azure uses network rules
For inbound traffic, Azure processes the security group associated to the subnet, then the security group applied to the network interface.

Outbound traffic is processed in the opposite order (the network interface first, followed by the subnet).

> Security Groups are optional at both levels
> If no security group is applied, then all traffic is allowed by Azure.

The rules are evaluated in *priority order*, starting with the lowest priority rule.

Deny rules always stop the evaluation.

In order for traffic to be allowed through the security group, it must pass through all applied groups.

The last rule is always a Deny All rule. This is a default rule added to every security group for both inbound and outbound traffic with a priority of 65500.

The default rule means to have traffic pass through the security group, you must have an allow rule or it will be blocked by the default final rule.

> SMTP (port 25) is a special case. Depending on your subscription level and when your account was created, outbound SMTP traffic may be blocked.
> You can make a request to remove this restriction with business justification.


## Host a web application with Azure App Service
Azure App Service enables you to build and host web applications in the programming language of your choice without managing infrastructure. 

Learning objectives

* Use the Azure portal to create an Azure App Service web app.
* Use developer tools to create the code for a starter web application.
* Deploy your code to Azure App Service.

Hosting your web application using Azure App Service makes deploying and managing a web app much easier when compared to managing a physical server.

### _Create a web app in the Azure portal_
This unit, explains how to create an Azure App Service web app using the Azure portal.

#### Why use the Azure portal?
The first step in hosting your web application is to create a web app (an Azure App Service app) inside your Azure subscription.

There are several ways to create a web app. You can use: Azure portal, Azure (CLI), a script, or an integrated development environment (IDE) like Visual Studio.

The portal helps you discover available features, add additional resources, and customize existing resources.

#### What is Azure App Service?
Azure App Service is a fully managed web application hosting platform. 

This platform as a service (PaaS) Azure allows you to focus on designing and building your app while Azure handles infrastructure to run and scale the app.

#### Deployment slots
Using the Azure portal, you can easily add deployment slots to an App Service web app.

You can create a staging deployment slot where you can push your code to test on Azure.

After testing, you can easily swap the staging deployment slot with the production slot.

#### Continuous integration/deployment support
The Azure portal provides out-of-the-box continuous integration and deployment with Azure DevOps, GitHub, Bitbucket, FTP, or a local Git repositories.

Connect your web app with any of the above sources, and App Service will automatically sync code and any future changes to the code into the web app.

With Azure DevOps, you can define your own build and release process to perform actions like compiling and running tests nefpre releasing to the web app.

#### Integrated Visual Studio publishing and FTP publishing
In addition to continuous integration/deployment for web apps, you can integrate with Visual Studio to publish your web app to Azure via Web Deploy technology.

App Service also supports FTP-based publishing for more traditional workflows.

#### Built-in autoscale support (automatic scale-out based on real-world load)
The ability to scale up/down or scale out is baked into the web app. 

Depending on the usage, you can scale your app up/down by increasing/decreasing the resources of the underlying machine that is hosting the web app.

Resources can be number of cores or the amount of RAM available.

Scaling out, on the other hand, is the ability to increase the number of machine instances that are running your web app.

#### Creating a web app
The Azure portal provides a wizard to create a web app. This wizard requires the following fields:

Field | Description
--- | ---
Subscription | A valid and active Azure subscription.
Resource group | A valid resource group.
App name | The name of the web app. This name becomes part of the app's URL, so it must be unique among all Azure App Service web apps.
Publish | You can deploy your application to App Service as code or as a ready-to-run Docker image. Selecting Docker image will activate the Docker tab of the wizard, where you'll provide information about the Docker registry from which App Service will retrieve your image.
Runtime stack | If you choose to deploy your application as code, App Service needs to know what runtime your application uses (examples include Node.js, Python, Java, and .NET). If you deploy your application as a Docker image, you won't need to choose a runtime stack, since your image will include it.
Operating system | App Service can host applications on Windows or Linux servers. See below for additional information.
Region | The Azure region from which your application will be served.
App Service Plan | See below for information about App Service plans.

#### Operating systems
If you're deploying your app as code, many of the available runtime stacks are limited to one operating system or the other. 

After choosing a runtime stack, the toggle will indicate whether or not you have a choice of operating system. 

If your target runtime stack is available on both operating systems, select the one that you use to develop and test your application.

If your application is packaged as a Docker image, choose the operating system on which your image is designed to run.

Selecting **Windows** activates the **Monitoring** tab, where you can enable **Application Insights**.

Enabling this feature configures your app to automatically send detailed performance telemetry to the Application Insights for monitoring.

> Application Insights runs from Linux-hosted apps as well, but this turnkey, no-code option is only available on Windows.

#### App Service plans
An **App Service** plan is a set of virtual server resources that run App Service apps.

A plan's size (sometimes referred to as its sku or pricing tier) determines the performance characteristics as well as the App Service features to which those apps have access.

Every App Service web app you create must be assigned to a single App Service plan that runs it.

A single App Service plan can host multiple App Service web apps.

App Service plans are the unit of billing for App Service. The size of each App Service plan and the bandwidth resources deployed to those plans use, determines the price that you pay.

The number of web apps deployed to your App Service plans has no effect on your bill.

You can use any of the available Azure management tools to create an App Service plan. The portal has a wizard to support creating a new plan.

### _Prepare the web application code_
In this unit, you'll learn how to create the code for your web application and integrate it into a source-control repository.

#### Bootstrap a web application
You can use the Node Package Manager (npm) command-line tool that comes bundled with Node.js to create a new application. 

The init command creates a new package.json required for our application:

```bash
npm init -y
```

If you open the package.json file that was created on the current folder, you can add a start entry to the scripts section to describe how your web application should be run:

```json
  "scripts": {
    "start": "node index.js"
  },
```

After you've done that, you can write the actual code of your web application in a new index.js file:

```javascript
const http = require('http');
const port = process.env.PORT || 3000;

http.createServer(function(request, response) {
  response.writeHead(200, { 'Content-Type': 'text/plain' });
  response.end('Hello World!');
}).listen(port);

console.log(`Server running at http://localhost:${port}`);
```

This example code creates a server that listens on port 3000 of your computer and answers every request with a "Hello World!" message.

> Using CI/CD enables more frequent code deployment in a reliable manner by automating builds, tests, and deployments for every code change.


### _Deploy code to App Service_
Now, let's see how we can deploy our application to App Service.

#### Automated deployment
Automated deployment, or continuous integration, is a process of pushing new features and bug fixes in a fast and repetitive pattern with minimal impact on end users.

Azure supports automated deployment directly from several sources. The following options are available:

- **Azure DevOps:** You can push your code to Azure DevOps, build and run the tests, generate a release and push your code to an Azure Web App.
- **GitHub:** When you connect your GitHub repository to Azure for automated deployment, any changes you push to your production branch on GitHub will be automatically deployed for you.
- **Bitbucket:** With its similarities to GitHub, you can configure an automated deployment with Bitbucket.
- **OneDrive:** OneDrive is Microsoft's cloud-based storage. You must have a Microsoft Account linked to a OneDrive account to deploy to Azure.
- **Dropbox:** Azure supports deployment from Dropbox, which is a popular cloud-based storage system that is similar to OneDrive.

#### Manual deployment
There are a few options that you can use to manually push your code to Azure:

- **Git:** App Service web apps feature a Git URL that you can add as a remote repository. Pushing to the remote repository will deploy your app.
- **az webapp up:** webapp up is a feature of the az command-line interface that packages your app and deploys it. 
- **ZIP deploy:** You can use az webapp deployment source config-zip to send a ZIP of your application files to App Service.
- **WAR deploy:** WAR deploy is a mechanism designed for deploying Java web applications using WAR packages. You can access WAR deploy using the Kudu HTTP API located at http://<your-app-name>.scm.azurewebsites.net/api/wardeploy. If that fails, try: https://<your-app-name>.scm.azurewebsites.net/api/wardeploy.
- **Visual Studio:** Visual Studio features an App Service deployment wizard that can walk you through the deployment process.
- **FTP/S:** FTP or FTPS is a traditional way of pushing your code to many hosting environments, including App Service.


## Protect your virtual machine settings with Azure Automation State Configuration
Create a desired state configuration script that checks that IIS is installed. 

Onboard virtual machines (VMs) for management by Azure Automation. Automatically install IIS on the VMs where that feature is missing.

Learning objectives

* Identify the capabilities of Azure Automation State Configuration
* Learn how to onboard VMs for management by Azure Automation
* Automatically update VMs to maintain a desired state configuration (DSC)

When you deploy a set of virtual machines (VMs) to host a production system, it's essential that all the VMs have the same state. 

They must have the same services installed because if there's a configuration drift for each VM, you can end up with systems that are prone to failure.

To reduce the time you spend troubleshooting and maintaining the configuration, you can set up Azure Automation State Configuration.

### _What is Azure Automation State Configuration?_
Automation State Configuration ensures that the virtual machines (VMs) in a cluster area are in a consistent state, with the same software installed and the same configurations.

In this unit, you learn about the features and capabilities of Azure Automation, review the declarative model of `PowerShell Desired State Configuration (DSC)`, and explore its benefits.

Azure Automation State Configuration is an Azure service built on PowerShell. 

It enables you to consistently deploy, reliably monitor, and automatically update the desired state of all your resources.

Azure Automation provides tools to define configurations and apply them to real and virtual machines.

#### Why use Azure Automation State Configuration?
Manually maintaining a correct and consistent configuration for the servers that run your services can be difficult and error prone. 

Azure Automation State Configuration uses PowerShell DSC to help address these challenges as it centrally manages your DSC artifacts and the DSC process.

Azure Automation State Configuration has a built-in pull server.

You can target nodes to automatically receive configurations from this pull server, conform to the desired state, and report back on their compliance.

You can target virtual or physical Windows or Linux machines, in the cloud or on-premises.

Combine with Azure Monitor logs to review the compliance of your nodes by configuring Azure Automation State Configuration to send this data.

#### What is PowerShell DSC?
PowerShell DSC is a declarative management platform that Azure Automation State Configuration uses to configure, deploy, and control systems.

A declarative programming language separates intent (what you want to do) from execution (how you want to do it).

You specify the desired state and let DSC do the work to get there. 

You don't have to know how to implement or deploy a feature when a DSC resource is available. Instead, you focus on the structure of your deployment.

#### Example
When you want to create a share on a Windows server, you might use this PowerShell command:

```powershell
# Create a file share
New-SmbShare -Name MyFileShare -Path C:\Shared -FullAccess User1 -ReadAccess User2
```

The script is straightforward and easy to understand. However, if you use this script in production, you encounter several problems.

Consider what might happen if the script runs multiple times or if User2 already has full access rather than read only access.

This approach isn't idempotent. Idempotence describes an operation that has the same effect whether you run it once or 10,001 times. 

Instead, to achieve idempotence in PowerShell, you need to add logic and error handling. If = Ture/False.

Your PowerShell script would look something like:

```powershell
$shareExists = $false
$smbShare = Get-SmbShare -Name $Name -ErrorAction SilentlyContinue
if($smbShare -ne $null)
{
    Write-Verbose -Message "Share with name $Name exists"
    $shareExists = $true
}

if ($shareExists -eq $false)
{
    Write-Verbose "Creating share $Name to ensure it is Present"
    New-SmbShare @psboundparameters
}
else
{
    # Need to call either Set-SmbShare or *ShareAccess cmdlets
    if ($psboundparameters.ContainsKey("ChangeAccess"))
    {
       #...etc., etc., etc
    }
}
```

DSC handles unexpected cases automatically. With DSC, you describe the result rather than the process to achieve the result.

The following DSC code snippet shows an example:

```powershell
Configuration Create_Share
{
   Import-DscResource -Module xSmbShare
   # A node describes the VM to be configured

   Node $NodeName
   {
      # A node definition contains one or more resource blocks
      # A resource block describes the resource to be configured on the node
      xSmbShare MySMBShare
      {
          Ensure      = "Present"
          Name        = "MyFileShare"
          Path        = "C:\Shared"
          ReadAccess  = "User1"
          FullAccess  = "User2"
          Description = "This is an updated description for this share"
      }
   }
}
```
The DSC Resource Kit has more than 80 resource modules, including one for installing an IIS site. 

#### What is the LCM?
The local configuration manager (LCM) is a component of the Windows Management Framework (WMF) on a Windows operating system. 

The LCM is responsible for updating the state of a node, like a VM, to match the desired state. 

Every time the LCM runs, it completes the following steps:

1. Get: Gets the current state of the node.
2. Test: Compares the current state of a node against the desired state by using a compiled DSC script (.mof file).
3. Set: Updates the node to match the desired state described in the .mof file.

You configure the LCM when you register a VM with Azure Automation.

#### Push and pull architectures in DSC
The LCM on each node can operate in two modes.

* Push mode: 
	* An administrator manually sends, or pushes, the configurations to one or more nodes. 
	* The LCM makes sure that the state on each node matches what the configuration specifies.

* Pull mode: 
	* A pull server holds the configuration information. 
	* The LCM on each node polls the pull server at regular intervals, by default every 15 minutes, to get the latest configuration details. 
	* The pull server sends the details about any configuration changes back to each node.
	* In pull mode, each node has to be registered with the pull service.

Both modes have advantages:

* Push mode 
	* Easy to set up. 
	* Doesn't need its own dedicated infrastructure, and it can run on a laptop. 
	* Helpful to test the functionality of DSC. You could also use push mode to get a newly imaged machine to the baseline desired state.

* Pull Mode
	* Useful in an enterprise deployment that spans a large number of machines. 
	* The LCM regularly polls the pull server and makes sure the nodes are in the desired state. 
	* If an external tool or team applies hotfixes that result in configuration drift, the machines are quickly brought back in line with the configuration you've set. 
	* This process can help you achieve a state of continuous compliance for your security and regulatory obligations.


#### Supported platforms and operating systems
Azure Automation DSC is supported by Azure Cloud Services and other cloud providers, on-premises infrastructure, or a hybrid of all of these environments.

Azure Automation DSC supports the following operating systems:

* Windows
	* Server 2019
	* Server 2016
	* Server 2012 R2
	* Server 2012
	* Server 2008 R2 SP1
	* 11
	* 10
	* 8.1
	* 7
* Linux
	* The DSC Linux extension supports all the Linux distributions listed in the [PowerShell DSC documentation](https://learn.microsoft.com/en-us/powershell/dsc/getting-started/lnxgettingstarted).

PowerShell DSC is installed on all Linux machines supported by Azure Automation DSC.

#### DSC requirements for Windows
For Windows machines, the Azure Desired State Configuration (DSC) VM extension uses WMF to manage the versions of Windows features like Windows PowerShell DSC and Windows Remote Management (WinRM). 

Azure DSC supports WMF 4.0 and later. So Windows machines must run Windows Server 2008 R2 SP1, Windows 7, or later.

The first time the Azure DSC extension is called, it installs an OS-compatible version of WMF on all Windows versions except Windows Server 2016 and later. 

Windows Server 2016 and later versions already have the latest version of WMF installed. 

After WMF is installed, the machine requires a restart.

WinRM is enabled on machine nodes that run Windows Server 2012 or later, and Windows 7 or later.

Proxy support for the DSC agent is available in Windows builds 1809 and later. Proxy support is unavailable in DSC for previous versions of Windows.

#### Other DSC requirements
If your nodes are located in a private network, DSC needs the following port and URLs to communicate with Azure Automation:

* **Port:** Only TCP 443 is required for outbound internet access.
* **Global URL:** *.azure-automation.net
* **Global URL of US Gov Virginia:** *.azure-automation.us
* **Agent service:** https://<workspaceId>.agentsvc.azure-automation.net


### _Use PowerShell DSC to achieve a desired state_
You use PowerShell DSC to specify the desired state for a VM. 

In this unit, you learn more about PowerShell DSC and how to use it to control the state of your VMs. 

In the example scenario, you use PowerShell DSC to make sure that IIS for Windows Server is installed and configured consistently across all of your web servers.

By the end of this unit, you'll:

* Understand node and configuration blocks.
* Understand credential assets.
* Write PowerShell DSC code to install Microsoft IIS idempotently.

#### DSC resources
You've seen that PowerShell DSC is a declarative scripting language. 

Declarative programming focuses on the outcome, not the journey. 

When you need to configure and deploy an Azure resource in a consistent way across a set of VMs, PowerShell DSC can help. 

You can use PowerShell DSC even when you're not familiar with the technical steps to install and configure the software and services.

Windows Server has a set of built-in PowerShell DSC resources. You can view these resources by running the Get-DSCResource PowerShell cmdlet.

```powershell
Get-DscResource | select Name,Module,Properties
```

The following table lists some of the built-in PowerShell DSC resources.

Resource | Description
:---: | ---
File | Manages files and folders on a node
Archive | Decompresses an archive in the .zip format
Environment | Manages system environment variables
Log	 | Writes a message in the DSC event log
Package | Installs or removes a package
Registry | Manages a node's registry key (except HKEY Users)
Script | Executes PowerShell commands on a node
Service | Manages Windows services
User | Manages local users on a node
WindowsFeature | Adds or removes a role or feature on a node
WindowsOptionalFeature | Adds or removes an optional role or feature on a node
WindowsProcess | Manages a Windows process

For more complex resources, like Active Directory integration, use the DSC Resource Kit, which is updated monthly. 

The resource you want to configure must already be part of the VM or part of the VM image. Otherwise, the job fails to compile and run.

#### Anatomy of a DSC code block
A DSC code block contains four sections. Use the following example to take a closer look. 

In the example, the numbers aren't part of the syntax. 

They're denoted as comments and they refer to sections in the discussion that follows.

```powershell
Configuration MyDscConfiguration {              ##1
    Node "localhost" {                          ##2
        WindowsFeature MyFeatureInstance {      ##3
            Ensure = 'Present'
            Name = 'Web-Server'
        }
    }
}
MyDscConfiguration -OutputPath C:\temp\         ##4
```

The configuration syntax includes these sections:

1. **Configuration:** The configuration block is the outermost script block. 

It starts with the Configuration keyword, and you provide a name. Here, the name of the configuration is MyDscConfiguration.

The configuration block describes the desired configuration. 

(think of a configuration block like a function, except that it contains a description of the resources to install rather than the code to install them)

Like a PowerShell function, a configuration block can take parameters. For example, you could parameterize the node name.

```powershell
Configuration MyDscConfiguration {
param
(
    [string] $ComputerName='localhost'
)

Node $ComputerName {
    ...
}
```

2. **Node:** You can have one or more node blocks.

The node block determines the names of .mof files that are generated when you compile the configuration. 

For example, the node name localhost generates only one localhost.mof file. 

But you can send that .mof file to any server. You generate multiple .mof files when you use multiple node names.

Use the array notation in the node block to target multiple hosts. For example:

```powershell
Node @('WEBSERVER1', 'WEBSERVER2', 'WEBSERVER3')
```

3. **Resource:** One or more resource blocks can specify the resources to configure. 

In this case, a single resource block references the WindowsFeature resource. 

The WindowsFeature resource here ensures that the Windows feature Web-Server is installed.

4. **MyDscConfiguration:** This call invokes the MyDscConfiguration block. 

It's like running a function. 

When you run a configuration block, it's compiled into a Managed Object Format (MOF) document. 

MOF is a compiled language created by Desktop Management Task Force, and it's based on interface definition language.

For every node listed in the DSC script, a .mof file is created in the folder you specified with the -OutputPath parameter.


#### Configuration data in a DSC script
In a configuration data block, you can provide data that the configuration process might need. 

You apply this data to named nodes, or you apply it globally across all nodes.

A configuration data block is a named block that contains an array of nodes. 

The array must be named `AllNodes`. Inside the `AllNodes` array, you specify the data for a node by using the `NodeName` variable.

Using the previous scenario, let's say that on the web server that's installed on each node, you want to set the SiteName property to different values. You could define a configuration data block like this:

```powershell
$datablock =
@{
    AllNodes =
    @(
        @{
            NodeName = "WEBSERVER1"
            SiteName = "WEBSERVER1-Site"
        },
        @{
            NodeName = "WEBSERVER2"
            SiteName = "WEBSERVER2-Site"
        },
        @{
            NodeName = "WEBSERVER3"
            SiteName = "WEBSERVER3-Site"
        }
    );
}
```

If you want to set a property to the same value in each node, in the `AllNodes` array, specify `NodeName = "*"`.

#### Secure credentials in a DSC script
A DSC script might require credential information for the configuration process.

Avoid putting a credential in plaintext in your source code management tool.

Instead, DSC configurations in Azure Automation can reference credentials stored in a `PSCredential` object. 

You define a parameter for the DSC script by using the `PSCredential` type. 

Before running the script, get the credentials for the user, use the credentials to create a new `PSCredential` object, and pass this object into the script as a parameter.

Credentials aren't encrypted in .mof files by default, tey're exposed as plaintext. 

To encrypt credentials, use a certificate in your configuration data. 

The certificate's private key needs to be on the node on which you want to apply the configuration. (Certificates are configured through the node's LCM)

> Starting in PowerShell 5.1, .mof files on the node are encrypted at rest. In transit, all credentials are encrypted through WinRM.


#### Push the configuration to a node
After you create a compiled .mof file for a configuration, you can push it to a node by running the `Start-DscConfiguration` cmdlet. 

If you add the path to the directory, it applies any .mof file it finds in that directory to the node:

```powershell
Start-DscConfiguration -path D:\
```

This step corresponds to push mode, which you learned about in the previous unit.

#### Pull the configuration for nodes
If you have hundreds of VMs on Azure, pull mode is more appropriate than push mode.

You can configure an Azure Automation account to act as a pull service. 

Upload the configuration to the Automation account. Then register your VMs with this account.

Before you compile your configuration, import any PowerShell modules the DSC process needs into your Automation account. 

By default, after 15 minutes, the LCM on the VM polls Azure Automation for any changes to the DSC configuration file. 

Any changes in the VMs are recorded in the desired state configuration. 

If you change a configuration, you can upload it to the Automation account to automatically reconfigure the VMs.

> Your Automation account handles the credentials natively. This management reduces the complexity of securing and working with credentials.

