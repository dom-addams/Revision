# Microsoft Azure Well-Architected Framework - Performance efficiency
Scaling your system to handle load, identifying network bottlenecks, and optimizing your storage performance are important to ensure your users have the best experience. 

Learn how to make your application perform at its best.

Learning objectives:

* Scale your capacity based on workload.
* Optimize network performance.
* Optimize storage and database performance.
* Improve application performance by identifying bottlenecks.

## Use scaling up and scaling out in your architecture
It's rare that we can exactly predict the load on our systems. 

A public-facing application might grow rapidly in popularity and usage, or an internal application might need to support a larger user base as the business grows. 

Even when we can predict load, it's rarely flat. 

Retailers have more demand during the holidays, and sports websites peak during the playoff seasons.

In this unit, we:

* Define scaling up or down and scaling out or in.
* Discuss some ways Azure can improve your scaling capabilities.
* Look at how serverless and container technologies can improve your architecture's ability to scale.

### What is scaling?
When we look at ways to increase or decrease the compute capacity and relative costs for your applications, it's important to define two key concepts: scaling and resources.

* Scaling 
	* The process of managing your resources to help your application meet a set of performance requirements. 
	* When you have too many resources serving your users, you're not using those resources efficiently, and you're wasting money. 
	* When you have too few resources available, the performance of your application can be adversely affected. 
	* Your goal is to meet your defined performance requirements while optimizing for cost.

* Resources 
	* Refers to anything you need to manage and run your applications. 
	* Memory and CPUs for virtual machines are the most obvious resources, but some Azure services might require you to consider bandwidth or abstractions, like Request Units (RUs) for Azure Cosmos DB.

In a hypothetical world where application demand is constant, it would be easy to predict the right amount of resources you need. 

But in the real world, the demands of applications change over time, so the right amount of resources you need can be harder to predict. 

If you're lucky, that change is predictable or seasonal, but that's not typical of all scenarios. 

Ideally, you want to provision the right amount of resources to meet demand, then adjust the amount as demand changes.

In an on-premises scenario where you purchase and manage your own servers, scaling is difficult. 

Adding resources can be costly, and often it takes too much time to bring resources online. 

Sometimes it can take longer than your actual need for the increased capacity. 

It also can be difficult to reduce your resources during times of low demand on the system, so you might be stuck with the increased cost.

Easy scaling is a key benefit of Azure. Most Azure resources let you easily add or remove resources as demand changes. 

Many services have automated options that monitor demand and adjust for you. 

This automatic scaling capability is commonly known as autoscaling. 

Autoscaling lets you set thresholds for the minimum and maximum level of instances that should be available. 

It also adds or removes instances based on a performance metric. An example is CPU utilization.

### What is scaling up or down?
When you use a single instance of a service, such as a virtual machine, you might need to scale the number of resources that are available to your instance.

* Scaling up is the process where you increase the capacity of a given instance. For example, to increase your processing capacity, you might increase a virtual machine from 1 vCPU and 3.5 GB of RAM to 2 vCPUs and 7 GB of RAM.
* Scaling down is the process where you decrease the capacity of a given instance. For example, you might decrease a virtual machine's capacity from 2 vCPUs and 7 GB of RAM to 1 vCPU and 3.5 GB of RAM. In this way, you reduce capacity and cost.

* Let's look at what scaling up or down means in the context of Azure resources:
	* In Azure virtual machines, you scale based on a virtual machine size. 
	* Each VM size has a certain amount of vCPUs, RAM, and local storage associated with it. 
	* For example, you could scale up from a Standard_DS1_v2 virtual machine (1 vCPU and 3.5 GB of RAM) to a Standard_DS2_v2 virtual machine (2 vCPUs and 7 GB of RAM).

* Azure SQL Database is a platform as a service (PaaS) implementation of Microsoft SQL Server. 
	* You can scale up a database based on the number of database transaction units (DTUs) or vCPUs. 
	* DTUs are an abstraction of underlying resources and are a blend of CPU, IO, and memory. 
	* For example, you can give your database in Azure SQL Database more throughput and capacity by scaling it from a size of P2 with 250 DTUs up to a P4 with 500 DTUs.

* Azure App Service is a PaaS website-hosting service on Azure. 
	* Websites run on a virtual server farm, which is also known as an App Service plan. 
	* You can scale the App Service plan up or down between tiers. 
	* You also have capacity options within those tiers. 
	* For example, an S1 App Service plan has 1 vCPU and 1.75 GB of RAM per instance. 
	* You could scale up to an S2 App Service plan, which has 2 vCPUs and 3 GB of RAM per instance.

To scale these types of capabilities in an on-premises environment, you typically have to wait for procurement and installation of the necessary hardware before you can start using the new level of scale. 

In Azure, the physical resources are already deployed and available for you. You simply need to select the alternate level of scale that you want to use.

You might need to consider the impact of scaling up in your solution. Your decision depends on the cloud services that you chose.

For example, if you choose to scale up in Azure SQL Database, the service deals with scaling up individual nodes and continues the operation of your service. 

Changing the service tier or performance level of a database creates a replica of the original database at the new performance level. 

Connections are then switched over to the replica. No data is lost during this process. 

There's only a brief interruption when the service switches over to the replica. The interruption is typically less than four seconds.

Alternatively, if you choose to scale a virtual machine up or down, you do so by selecting a different instance size. 

In most situations, if the VM is already running, you're required to restart the VM. With that in mind, you should expect that a reboot is required when you scale your VMs and account for that eventuality in your planning.

Finally, you should always look for places where scaling down is an option. 

If your application can provide adequate performance at a lower price tier, your Azure bill could be reduced.

### What is scaling out or in?
You now know that scaling up and down adjusts the amount of resources a single instance has available. 

Scaling out and in adjusts the total number of instances.

* Scaling out 
	* The process of adding more instances to support the load of your solution. 
	* For example, if your website front ends were hosted on virtual machines, you could increase the number of virtual machines if the level of load increased.

* Scaling in 
	* The process of removing instances that are no longer needed to support the load of your solution. 
	* If your website front ends have low usage, you might want to lower the number of instances to save cost.

Here are some examples of what scaling out or in means in the context of Azure resources:

* For the infrastructure layer, you would likely use virtual machine scale sets to automate the addition and removal of extra instances.
	* Virtual machine scale sets let you create and manage a group of identical, load-balanced VMs.
	* The number of VM instances can automatically increase or decrease in response to demand or a defined schedule.

* In an Azure SQL Database implementation, you could share the load across database instances by sharding.
	* Sharding is a technique to distribute large amounts of identically structured data across several independent databases.

* In Azure App Service, the App Service plan is the virtual web server farm that hosts your application. 
	* Scaling out in this way means that you're increasing the number of virtual machines in the farm. 
	* As with virtual machine scale sets, the number of instances can be automatically raised or lowered in response to certain metrics or a schedule.

Scaling out is easily performed via the Azure portal, command-line tools, or Azure Resource Manager templates. In most cases, it's seamless to the user.

### Autoscale
You can configure some of these services to use a feature called autoscale. 

With autoscale, you no longer have to worry about scaling services manually.

Instead, you can set a minimum and maximum threshold of instances. 

You can scale based on specific metrics, like queue length or CPU utilization. 

You also can scale based on schedules. 

An example is weekdays between 5:00 PM and 7:00 PM. The following illustration shows how the autoscale feature manages instances to handle the load.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-performance-efficiency/media/2-autoscale.png)

#### Considerations when you scale in and out
When you scale out, the startup time of your application can impact how quickly your application can scale. 

If your web app takes two minutes to start up and become available for users, it means that each of your instances takes two minutes to become available. 

You need to consider this startup time when you determine how fast you want to scale.

You also need to think about how your application handles state. 

When the application scales in, any state that was stored on the instance that's removed from your environment is lost. 

If a user connects to an instance that has lost its state, your application might force the user to sign in or reselect their data. 

The result is a poor user experience. 

A common pattern is to externalize your state to another service, like Azure Cache for Redis or SQL Database, which makes your web servers stateless. 

Now that your web front ends are stateless, you don't need to worry about which individual instances are available. 

They're all doing the same job and are deployed in the same way.

### Throttling
We've established that the load on an application varies over time. 

This variation might be because of the number of active or concurrent users and the activities being performed. 

You can use autoscaling to add capacity, but you can also use a throttling mechanism to limit the number of requests from a source. 

You can safeguard performance limits by putting known limits into place at the application level. 

In this way, you prevent the application from breaking.

Throttling is most frequently used in applications that expose API endpoints.

You can set throttling to begin when your application reaches a particular performance limit. 

This mechanism ensures the overall system SLA isn't breached. 

For example, if you exposed an API for customers to get data, you could limit the number of requests to 100 per minute. 

If any single customer exceeded this limit, you could respond with an HTTP 429 status code and include the wait time before another request can successfully be submitted.

### Serverless
Serverless computing provides a cloud-hosted execution environment that runs your apps, but completely abstracts the underlying environment. 

You create an instance of the service, and you add your code. 

No infrastructure management or maintenance is required or even allowed.

You configure your serverless apps to respond to events. 

An event can be a REST endpoint, a timer, or a message received from another Azure service. 

The serverless app runs only when an event triggers it.

When you work with serverless apps, infrastructure isn't your responsibility. 

Scaling and performance are handled automatically. You're only billed for the resources you use. 

There's no need to reserve capacity. Azure Functions, Azure Container Instances, and Azure Logic Apps are examples of serverless computing available on Azure.

### Containers
A container is a method of running applications in a virtualized environment. 

A virtual machine is virtualized at the hardware level, where a hypervisor makes it possible to run multiple virtualized operating systems on a single physical server. 

Containers take the virtualization up a level. 

The virtualization is done at the OS level, which makes it possible to run multiple identical application instances within the same OS.

Containers are lightweight and well suited to scale out scenarios. 

By design, they can be created, scaled out, and stopped dynamically as your environment and demands change. 

Another benefit of using containers is the ability to run multiple isolated applications on each virtual machine. 

Because containers are secured and isolated at a kernel level, you don't necessarily need to separate VMs for separate workloads.

Although you can run containers on virtual machines, there are a couple of Azure services that ease the management and scaling of containers:

* **Azure Kubernetes Service (AKS)**

With Azure Kubernetes Service, you can set up virtual machines to act as your nodes. 

Azure hosts the Kubernetes management plane. 

You're charged only for the running worker nodes that host your containers.

To increase the number of your worker nodes in Azure, you can use the Azure CLI to increase that number manually. 

At the time of this writing, you can use Cluster Autoscaler on AKS to autoscale your worker nodes. 

On your Kubernetes cluster, you can use the Horizontal Pod Autoscaler to scale out the number of instances of the container to be deployed.

AKS can also scale with the Virtual Kubelet, which is described in the next section.

* **Azure Container Instances**

You can use the virtual nodes add-on in AKS to connect Azure Container Instances into your Kubernetes environment. 

The add-on is based on the open-source project Virtual Kubelet. 

With virtual nodes, when your Kubernetes cluster demands more container instances, those demands can be met from Container Instances. 

Because Container Instances is serverless, there's no need to have reserved capacity. 

You can take advantage of the control and flexibility of Kubernetes scaling with the per-second-billing of serverless.



## Optimize network performance
Network performance can have a dramatic impact on a user's experience. 

In complex architectures with many different services, minimizing the latency at each network hop can affect the overall performance. 

In this unit, you learn about the importance of network latency and how to reduce it within your architecture. 

We also discuss strategies to minimize network latency between Azure resources and between users and Azure.

### The importance of network latency
Latency is a measure of delay. Network latency is the time that it takes for data to travel from a source to a destination across a network. 

The time that it takes for data to travel from the source to a destination and for the destination to respond is commonly known as a round-trip delay.

In a traditional datacenter environment, latency might be minimal because resources often share the same location and a common set of infrastructure. 

The time taken to get from source to destination is typically lower when resources are physically close together.

In comparison, a cloud environment is built for scale. 

Cloud-hosted resources might not be in the same rack, datacenter, or region. 

This distributed approach can have an impact on the round-trip time of your network communications. 

While all Azure regions are interconnected with a high-speed fiber backbone, the speed of light is still a physical limitation. 

Calls between services in different physical locations still have network latency directly correlated to the distance between them.

In addition, depending on the communication needs of an application, more round trips might be required. 

Each round trip comes with a latency tax, and each round trip adds to the overall latency. 

The following illustration shows how the latency perceived by the user is the combination of the round trips required to service the request.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-performance-efficiency/media/3-network-latency.png)

### Latency between Azure resources
Imagine that you work for a healthcare organization that's pilot testing a new patient booking system. 

This system runs on several web servers and a database. 

All of the resources are located in the West Europe Azure region. 

The scope of your pilot test is available only for users in Western Europe. 

This architecture minimizes your network latency, because all of your resources are colocated inside a single Azure region.

Suppose that your booking system's pilot testing was successful. 

As a result, the scope of your pilot test has expanded to include users in Australia. 

When the users in Australia view your website, they incur the extra round-trip time that's necessary to access all of the resources that are located in West Europe. 

Their experience is diminished because of the added network latency.

To address your network latency issues, your IT team decides to host another front-end instance in the Australia East region. 

This design helps reduce the time for your web servers to return content to users in Australia but their experience is still diminished. 

There's significant latency for data that's being transferred between the front-end web servers in Australia East and the database in West Europe.

There are a few ways you could reduce the remaining latency:

* Create a read-replica of the database in Australia East. A read replica allows reads to perform well, but writes still incur latency. Azure SQL Database geo-replication allows for read-replicas.
* Sync your data between regions with Azure SQL Data Sync.
* Use a globally distributed database such as Azure Cosmos DB. This database allows both reads and writes to occur regardless of location, but it might require changes to the way your application stores and references data.
* Use caching technology, such as Azure Cache for Redis, to minimize high-latency calls to remote databases for frequently accessed data.

The goal is to minimize the network latency between each layer of the application. 

How you improve your network latency depends on your application and data architecture. 

Azure provides mechanisms to resolve latency issues through several services.

### Latency between users and Azure resources
You've looked at the latency between your Azure resources, but you should also consider the latency between your users and your cloud application. 

You want to optimize delivery of the front-end user interface to your users. 

Let's look at some ways to improve the network performance between your users and your application.

#### Use a DNS load balancer for endpoint path optimization
In our example scenario, your IT team created another web front-end node in Australia East. 

But users have to explicitly specify which front-end endpoint they want to use. 

As the designer of a solution, you want to make the experience as smooth as possible for users.

Azure Traffic Manager could help. 

Traffic Manager is a DNS-based load balancer that you can use to distribute traffic within and across Azure regions. 

Rather than having the user browse to a specific instance of your web front end, Traffic Manager can route users based on a set of characteristics:

* Priority: You specify an ordered list of front-end instances. If the one with the highest priority is unavailable, Traffic Manager routes the user to the next available instance.
* Weighted: You set a weight against each front-end instance. Traffic Manager then distributes traffic according to those defined ratios.
* Performance: Traffic Manager routes users to the closest front-end instance based on network latency.
* Geographic: You set up geographical regions for front-end deployments and route your users based on data-sovereignty mandates or localization of content.

Traffic Manager profiles can also be nested. 

For example, you could initially route your users across different geographies (such as Europe and Australia) by using geographic routing. 

Then you can route them to local front-end deployments by using the performance routing method.

Recall that the organization in our example scenario deployed a web front end in West Europe and another front end in Australia. 

Let's assume that they deployed Azure SQL Database with their primary deployment in West Europe and a read replica in Australia East. 

Let's also assume the application can connect to the local SQL instance for read queries.

Your team deploys a Traffic Manager instance in performance mode and adds the two front-end instances as Traffic Manager profiles. 

As a user, you navigate to a custom domain name (for example, contoso.com) which routes to Traffic Manager. 

Traffic Manager then returns the DNS name of the West Europe or Australia East front end based on the best network latency performance.

It's important to note that this load balancing is only handled via DNS. 

No inline load balancing or caching is happening here. Traffic Manager simply returns the DNS name of the closest front end to the user.

### Use a CDN to cache content close to users
Your website likely uses some form of static content, either whole pages or assets such as images and videos. 

This static content can be delivered to users faster by using a content delivery network (CDN) such as Azure Content Delivery Network.

With content deployed to Azure Content Delivery Network, those items are copied to multiple servers around the globe. 

Let's say one of those items is a video served from blob storage: `HowToCompleteYourBillingForms.MP4`. 

The team then configures the website so that each user's link to the video references the CDN edge server nearest them rather than referencing blob storage. 

This approach puts content closer to the destination, which reduces latency and improves the user experience. 

The following illustration shows how using Azure Content Delivery Network puts content closer to the destination, which reduces latency and improves the user experience.

You can also use content delivery networks to host cached dynamic content. 

Extra consideration is required, though, because cached content might be out of date compared with the source. 

You can control context expiration by setting a time to live (TTL). 

If the TTL is too high, out-of-date content might be displayed and the cache would need to be purged.

One way to handle cached content is with a feature called dynamic site acceleration, which can increase performance of webpages with dynamic content. 

Dynamic site acceleration can also provide a low-latency path to some services in your solution. An example is an API endpoint.

### Use ExpressRoute for connectivity from on-premises to Azure
Optimizing network connectivity from your on-premises environment to Azure is also important. 

You want to ensure that users have the best connection to your applications, whether they're hosted on virtual machines or on platform as a service (PaaS) offerings like Azure App Service.

You can always use the public internet to connect users to your services, but internet performance can vary and is subject to outside issues. 

Also, you might not want to expose all of your services over the internet. 

You might want a private connection to your Azure resources. 

Site-to-site VPN over the internet is also an option. 

VPN overhead and internet variability can have a noticeable impact on network latency for high-throughput architectures.

Azure ExpressRoute can help. 

ExpressRoute is a private, dedicated connection between your network and Azure. 

It gives you guaranteed performance and ensures that your users have the best path to all of your Azure resources. 

The following illustration shows how an ExpressRoute circuit provides connectivity between on-premises applications and Azure resources.



## Optimize storage performance
It's important to include storage performance considerations in your architecture. 

Just like network latency, poor performance at the storage layer can affect your user experience. 

How would you optimize your data storage? What things do you need to consider to make sure that you're not introducing storage bottlenecks into your architecture?

### Optimize virtual machine storage performance
Let's first look at how to optimize storage for virtual machines (VMs). 

Disk storage plays a critical role in the performance of your VMs. 

Selecting the right disk type for your application is an important decision.

Different applications have different storage requirements. 

Your application might be sensitive to latency of disk reads and writes, or it might require the ability to handle a large number of input/output operations per second (IOPS) or greater overall disk throughput.

When you build an infrastructure as a service (IaaS) workload, which type of disk should you use? There are six options:

* Local SSD storage: 
	* Each virtual machine has a temporary disk backed by local SSD storage. 
	* The size of this disk varies depending on the size of the virtual machine. 
	* Because this SSD is local to the virtual machine, the performance is high. 
	* But data could be lost during a maintenance event or a redeployment of the VM. 
	* This disk is only suitable for temporary storage of data that you don't need permanently. 
	* For example, this disk is great for the VM's page or swap file, and for things like tempdb in Azure SQL Server. 
	* There's no charge for this storage. It's included in the cost of the VM.

* Standard HDD: 
	* This type of storage is spindle disk storage. 
	* It might fit well where inconsistent latency or lower levels of throughput aren't binding your application. 
	* A dev/test workload where guaranteed performance isn't required is a great use case for this disk type.

* Standard SSD: 
	* This SSD-backed storage has the low latency of an SSD, but with lower levels of throughput. 
	* A nonproduction web server is a good use case for this disk type.

* Premium SSD: 
	* This SSD-backed storage is well suited for those workloads that are going into production and require the high reliability, demand consistent low latency, or need high levels of throughput and IOPS. 
	* Because these disks have greater performance and reliability capabilities, they're recommended for all production workloads.

* Premium SSD v2: 
	* Premium SSD v2 offers higher performance than Premium SSDs while also generally being less costly. 
	* You can individually tweak the performance (capacity, throughput, and IOPS) of Premium SSD v2 disks at any time, allowing workloads to be cost efficient while meeting shifting performance needs.
	* For example, a transaction-intensive database might need a large amount of IOPS at a small size, or a gaming application might need a large amount of IOPS but only during peak hours.
	* Because of this flexibility, Premium SSD v2 can provide the best price performance for most general purpose workload. Premium SSD v2 can't be used as OS disks.

* Ultra Disks: 
	* Azure ultra disks are the highest-performing storage option for Azure virtual machines (VMs). 
	* You can change the performance parameters of an ultra disk without having to restart your VMs. 
	* Ultra disks are suited for data-intensive workloads such as SAP HANA, top-tier databases, and transaction-heavy workloads. 
	* Ultra disks must be used as data disks and can only be created as empty disks.

Premium SSD, Premium SSD v2, and Ultra Disks can attach only to specific VM sizes. 

Premium-storage-capable sizes are designated with an "s" in the name. Examples are D2s_v3 or Standard_F2s_v2. 

Any virtual machine type (with or without an "s" in the name) can attach standard storage HDD or SSD drives.

Premium SSDs offer a few ways to increase their performance, including bursting, and changing their tier. 

Premium SSD v2 and Ultra Disks allow you to individually change their IOPS or throughput as you like, allowing you to be more cost efficient.

If necessary, disks can be striped by using a striping technology like Storage Spaces on Windows or mdadm on Linux. 

Striping increases the throughput and IOPS by spreading disk activity across multiple disks. 

You can use disk striping to push the limits of performance for disks. 

Striping is often seen in high-performance database systems and other systems with intensive storage requirements.

When you rely on virtual machine workloads, you need to evaluate the performance requirements of your application to determine the amount of underlying storage that you want for your virtual machines.

### Optimize storage performance for your application
Now that you've learned how you can use different types of storage technologies to improve raw disk performance. 

Let's look at a few ways you can optimize the performance of storage access at the application layer.

#### Caching
A common approach to improve application performance is to integrate a caching layer between your application and your data store.

A cache typically stores data in memory and allows for fast retrieval. 

This data can be frequently accessed data, data that you specify from a database, or temporary data such as user state. 

You have control over the type of data stored, how often it refreshes, and when it expires. 

By colocating this cache in the same region as your application and database, you reduce the overall latency between the two. 

Pulling data out of the cache is almost always faster than retrieving the same data from a database. 

By using a caching layer, you can substantially improve the overall performance of your application.

Azure Cache for Redis is a caching service on Azure that stores data in memory. 

It's based on the open-source Redis cache and is a fully managed service offering by Microsoft. 

You select the performance tier that you require, then you configure your application to use the service.

#### Bursting
Premium SSD disks and Standard SSDs both offer bursting. There are two models of bursting for disks:

* An on-demand bursting model, where the disk bursts whenever its needs exceed its current capacity. This model incurs extra charges anytime the disk bursts. On-demand bursting is only available for Premium SSDs larger than 512 GiB.
* A credit-based model, where the disk only bursts if it has burst credits accumulated in its credit bucket. This model doesn't incur extra charges when the disk bursts. Credit-based bursting is only available for Premium SSD managed disks 512 GiB and smaller, and standard SSDs 1024 GiB and smaller.

Premium SSDs can use either bursting model but standard SSDs can only use credit-based bursting.

#### Change performance tier
The performance of your Azure managed disk is set when you create your disk, in the form of its performance tier. 

When you set the provisioned size of your disk, a performance tier is automatically selected. 

The performance tier determines the IOPS and throughput your managed disk has. 

The performance tier can be changed at deployment or afterwards, without changing the size of the disk and without downtime. 

You can only change the performance tier of a Premium SSD.

#### Polyglot persistence
Polyglot persistence is the use of different data storage technologies to handle your storage requirements.

Consider the following e-commerce example. Suppose that you store:

* Application assets in a blob store.
* Product reviews and recommendations in a NoSQL store.
* User profile or account data in an SQL database.

The following illustration shows how an application might use multiple data storage techniques to store different types of data.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-performance-efficiency/media/4-polyglot-persistence.png)

It's important to know that different data stores are designed for certain use cases or might be more accessible because of cost. 

As an example, storing blobs in an SQL database might be costly and slower to access than directly from a blob store.

Maintaining data consistency across distributed data stores can be a significant challenge. 

Strategies such as serialization and locking only work well if all application instances share the same data store and the application ensures that locks are short-lived. 

But if data is partitioned or replicated across different data stores, locking and serializing data access to maintain consistency can become an expensive overhead. 

One that affects the throughput, response time, and scalability of a system. 

As a result, most modern distributed applications don't lock the data that they modify. 

They take a more relaxed approach to consistency, which is known as eventual consistency.

Eventual consistency means that replica data stores eventually converge if there are no further writes. 

If a write is made to one of the data stores, a read from another data store might provide slightly out-of-date data. 

Eventual consistency enables higher scale because there's a low latency for reads and writes, instead of waiting to check if information is consistent across all stores.



## Identify performance bottlenecks in your application
In today's fast-paced digital world, your users expect more from your applications. 

You want them to have a great experience without performance issues. 

How do you identify potential performance bottlenecks in your architecture?

In this unit, you look at processes and tools that can help you make sure that your application performs well. 

They can also help you discover the cause if your application doesn't perform well.

### Performance requirements
Before we talk about performance, it's important to talk about requirements. 

In theory, you could keep improving scalability and performance further and further without end. 

At some point, though, more improvement is prohibitively expensive, difficult, and doesn't have enough business impact to be worthwhile.

*Nonfunctional requirements* help you find that point. These particular requirements don't tell you what your app must do. Instead, they tell you what quality levels it must meet. 

You can define nonfunctional requirements to discover:

* How fast a transaction must return under a given load.
* How many simultaneous connections your application needs to support before it begins to return errors.
* If there's server failure, the maximum amount of time your application is allowed to be down before a backup is online.

Defining these requirements in advance of building your solution is critical. 

They ensure that your application meets expectations but doesn't require more effort or cost more money than necessary. 

You can also plan your monitoring and operations rules around these nonfunctional requirements.

You should discuss requirements with your stakeholders or customers, document them, and communicate them broadly to ensure that everyone agrees on what good performance means.

In the following section, let's look at some ways to track performance in your applications.

### Performance monitoring options in Azure
Monitoring is the act of collecting and analyzing data to determine the performance, health, and availability of your business application and associated resources.

You want to be kept informed that your applications are running smoothly. 

You can use proactive notifications to inform about critical issues that arise. 

There are many layers of monitoring to consider. Let's focus on the infrastructure layer and the application layer.

#### Azure Monitor
Azure Monitor provides a single management point for infrastructure-level logs and monitoring for most of your Azure services.

Azure Monitor maximizes the availability and performance of your applications by delivering a comprehensive solution for collecting, analyzing, and acting on telemetry from your cloud and on-premises environments.

The following diagram depicts a high-level view of Azure Monitor. 

At the center of the diagram, are the data stores for metrics and logs. 

These stores contain the two fundamental types of data that Azure Monitor uses. 

On the left side are the sources of monitoring data that populate these data stores. 

On the right side are the different functions that Azure Monitor performs with this collected data such as, analysis, alerting, and streaming to external systems.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-performance-efficiency/media/5-azure-monitor.png)

Azure Monitor can collect data from many sources. 

You can think of monitoring data for your applications as occurring in tiers that range from your application to any OS and the services it relies on to the platform itself. 

Azure Monitor collects data from each of the following tiers:

* Application monitoring data: Data about the performance and functionality of the code you've written, regardless of its platform.
* Guest OS monitoring data: Data about the OS on which your application is running. This OS might be in Azure, another cloud, or on-premises.
* Azure resource monitoring data: Data about the operation of an Azure resource.
* Azure subscription monitoring data: Data about the operation and management of an Azure subscription, and data about the health and operation of Azure itself.
* Azure tenant monitoring data: Data about the operation of tenant-level Azure services, such as Microsoft Entra ID.

As soon as you create an Azure subscription and start adding resources, such as VMs and web apps, Azure Monitor starts collecting data. 

Activity logs record when resources are created or modified. 

Metrics tell you how the resource is performing and the resources that it's consuming. 

You can also extend the data you collect. 

You can enable diagnostics in your apps and add agents to collect telemetry data from Linux and Windows or Application Insights.

Azure Monitor is the place to start for all your resource metric insights gathered in near-real time. 

Many Azure resources start outputting metrics automatically after they're deployed. 

For example, web apps built with the Web Apps feature of Azure App Service output compute and application-request metrics. 

Metrics from Application Insights are also collated here, in addition to VM host diagnostic metrics. 

VM guest diagnostic metrics also appear after you opt in.

### Log Analytics
Centralized logging can help you uncover hidden issues that might be difficult to track down. 

With Log Analytics, you can query and aggregate data across logs. 

This cross-source correlation can help you identify issues or performance problems that might not be evident when you look at logs or metrics individually. 

The following illustration shows how Log Analytics acts as a central hub for monitoring data. 

Log Analytics receives monitoring data from your Azure resources and makes it available to consumers for analysis or visualization.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-performance-efficiency/media/5-log-analytics.png)

You can collate a wide range of data sources, security logs, Azure activity logs, and server, network, and application logs. 

You can also push on-premises System Center Operations Manager data to Log Analytics in hybrid deployment scenarios. 

Then Azure SQL Database can send diagnostic information directly into Log Analytics for detailed performance monitoring.

Centralized logging can be highly beneficial for troubleshooting all types of scenarios. 

You can use it to troubleshoot performance issues. Centralized logging is a key part of a good monitoring strategy for any architecture.

### Application performance management
Deep application issues are often tricky to track down. 

This type of scenario is when it can be beneficial to integrate telemetry into your application by using an application performance management (APM) solution. 

An APM solution helps you to track down low-level application performance and behavior. 

Telemetry can include individual page request times, exceptions within your application, and even custom metrics to track business logic. 

This telemetry can provide a wealth of insight into what's going on within your application.

Application Insights is an Azure service that provides this deep application performance management. 

You install a small instrumentation package in your application and then set up an Application Insights resource in the Azure portal. 

The instrumentation monitors your app and sends telemetry data to the portal.

You can use Application Insights to consume telemetry from the host environments, such as performance counters, Azure diagnostics, and Docker logs. 

You can also set up web tests that periodically send synthetic requests to your web service. 

You could even configure your application to send custom events and metrics that you write yourself in the client or server code. 

For example, you can track application-specific events such as items sold or games won.

Application Insights stores its data in a common repository, and metrics are shared with Azure Monitor. 

Application Insights can also take advantage of shared functionality such as alerts, dashboards, and deep analysis with the Log Analytics query language.

A common pattern used to determine the availability of a web application is the health endpoint monitoring pattern. 

This pattern is used to monitor web applications and their associated back-end services to ensure that they're available and performing correctly. 

The pattern is implemented when a particular URI is queried. The endpoint checks on the status of many components. 

Even the back-end services that the app depends on are checked, instead of only the availability of the front end itself. 

The health endpoint monitoring pattern acts as a service-level health check that returns an indication of the overall health of the service.

You should use an APM solution such as Application Insights to gain a deep understanding of your application and to correlate activity across your application. 

An APM solution can help you understand how a specific action works in the client browser, on the server, and through to downstream services. It also provides insight into trends. 

An APM solution provides notifications when there's a problem, helps to identify where the problem is, and informs you how to fix it before your users are aware of it.

### EXTRA
Application Insights is a service to monitor availability, performance, and the use of web applications.

For custom logs and metrics, you can use the HTTP Data Collector API to write data to Log Analytics from any REST API client or an Azure Logic App to write data from a custom workflow.

