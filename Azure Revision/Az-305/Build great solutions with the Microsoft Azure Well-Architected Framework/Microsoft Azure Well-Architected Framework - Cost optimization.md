# Microsoft Azure Well-Architected Framework - Cost optimization
Identify cost optimization opportunities to maximize cloud efficiency and visibility with the Microsoft Azure Well-Architected Framework.

Learning objectives:

* Use monitoring and analytics to gain cost insights
* Maximize the efficiency of your cloud environment
* Provision resources that are optimized for cost

## Plan and estimate your Azure costs
Whether your organization wants to build a new application on Azure, or you're looking to move an entire datacenter to the cloud, estimating costs is a key part of your planning process to ensure a successful project. 

For example, how do you know which services to select, or which service tier or virtual machine (VM) size to choose? Do you provision VMs for your workload, or do you take advantage of higher-level services that can reduce operational costs?

Proper planning is incredibly important to any cloud project. Let's look at what you need to consider.

### Capture requirements
Before you start any cloud project, take time to plan properly. That's especially important when you're considering costs.

Start by identifying the stakeholders for the project. This should include the business teams that are driving the organizational outcomes. 

It should also include the technical teams involved in the project. Bring everyone together and foster a culture of transparency. 

All teams involved in the project should have visibility into the decisions that will affect costs.

Identify the business and technical requirements of your project:

* Business requirements might be an API to enable partner communications or a reporting interface for the accounting department to view financial transactions.

* Technical requirements might be the ability to store relational data, or the ability for users to use a personal identity to access applications.

Both of these requirements will affect the overall cost of the project. They'll also influence your selection of services.

After you've identified your requirements, you'll want to define the workloads that are in scope to use cloud services and identify the services and resources you'll use. 

This effort will include evaluating and comparing service options in order to select the best services to meet your requirements.

When you've listed all of the requirements, services, and resources for your project, you can begin to estimate your costs.

### Estimate costs
With your list of services captured, you can use the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) to create estimates of your application's cost. 

You can use the calculator to create, save, and share estimates for all Azure services.

As part of your cost estimation, it's also important to understand the subscription and billing models available on Azure. 

Two of the most common models are pay-as-you-go and enterprise agreement:

* Pay-as-you-go subscriptions give you the flexibility to purchase and use the services you need, with the advantage of having no up-front commitments.

* Enterprise agreements let organizations take advantage of discounts through up-front commitments. These agreements allow organizations to centralize their Azure costs and billing. They can include other Microsoft services, such as Microsoft 365.

There are additional billing models. Each gives you access to the full suite of Azure services with the flexibility to purchase only what you need, when you need it.

No architecture is static, so you'll want your estimates to include any investments that you might be planning to make in the future. 

Taking the extra time to plan effectively for your application's future will give you better visibility into the long-term costs for your project, even if your costs might shift over time.

Evolving your architecture can reduce resources costs, such as moving from virtual machines to app services. It can also reduce operational costs by requiring less downtime for maintenance.

### Organize resources for cost awareness
It's also important to set up an organizational framework to enable the control, reporting, and attribution of costs throughout your environment.

You can use Azure Policy to create limitations for the size or tier of resources that can be provisioned. 

For example, you can prevent users from creating virtual machines from the G or M series, which have higher costs.

You can let your users view reports and billing as needed by creating roles that allow them to view services such as Microsoft Cost Management. 

Allowing your users to view costs will help them see the impact of their business decisions. It also provides for transparency across the organization for cloud-resource costs.

Organize your resources into resource groups or subscriptions. 

They can serve as boundaries for projects, business units, or services. 

You can also use Azure Policy to enforce the tagging of resources. Subscriptions, resource groups, and tags are exposed in billing reports. 

These reports will allow you to account for the usage of resources by product, business unit, or project.

### Budget for education
Educating your engineers, developers, and users is an important piece of a successful cloud project. 

The cloud is a transformational shift for an organization, and it's an ever-changing set of services and technologies. 

Your organization will need to ensure that your staff is properly trained to build and maintain resources on Azure. 

Microsoft Learn provides full product documentation along with self-paced training. 

Microsoft also has a large network of partners to deliver in-person and custom training for your staff.

Identify both the initial and ongoing training needs for your organization. Include this as part of the cost of your project.


## Provision with optimization
When provisioning resources, you'd ideally make them as efficient as possible from the start. 

Resource demands and technical requirements can change over time, but if you start with a workload that was optimized for cost when you initially designed it, it'll set you up for success down the line. 

Let's look at some ways to provision your resources with cost optimization in mind.

### Select appropriate service tiers and sizes
When you're provisioning resources on the cloud, selecting the right SKU or tier will have a direct impact on the Azure service's capabilities, capacity, and performance. 

This selection is tied directly to cost. Carefully evaluate the workload requirements for your application and select the SKU or tier that matches your resource requirements.

There's a wide variety of virtual machine types to choose from when you're provisioning for VM-based workloads. 

Each VM SKU comes with an assigned amount of CPU, memory, and storage. 

Assess the resource requirements for your workload and select the VM SKU that most closely matches your needs.

Provisioning VM sizes can often be challenging. 

You might be deploying for your maximum workload, even though your application needs that capacity for only a portion of its running time. 

Choosing a VM size is not a permanent decision, you can modify your VM size at any time, but in most cases it will require you to restart your VM.

### Pay only for consumption
Many cloud services provide a consumption billing model. 

With consumption models, you pay for only the amount of transactions, CPU time, or run time of your application.

This can bring cost savings and efficiency to your application, because you aren't paying for the resources to run your application when it's not being used. 

Let's look at a few examples of Azure services that have a consumption cost model:

* Azure Functions 
	* An event-driven, serverless compute platform that provides a consumption plan. 
	* When you're using the consumption plan, you're charged for compute resources only when your functions are running. 
	* Billing is based on the number of executions, the length of time running, and the amount of memory used. 
	* As an added benefit, your function scales automatically. 
	* Instances of the Azure Functions host are dynamically added and removed based on the number of incoming events. 
	* Function execution times out after a configurable period of time.

* Azure Logic Apps 
	* A service that helps you create automated integration workflows in the cloud. 
	* The Logic Apps service provides a consumption tier where you only pay per execution of a connector.

* Azure SQL Database 
	* A service that allows you to store relational data in the cloud. 
	* Azure SQL Database has a serverless tier where you can reduce your costs by pausing the database when it's not in use. 
	* Azure SQL Database serverless is price-performance optimized for single databases with intermittent, unpredictable usage patterns that can afford some delay in compute warm-up after idle usage periods.

* Azure API Management 
	* A service that provides centralized API administration, proxy, and deployment. 
	* API Management has a consumption tier that bills per execution, and will scale out automatically as requests change over time. 
	* The consumption tier enables the service to be used in a serverless fashion, with instant provisioning, automated scaling, built-in high availability, and pay-per-action pricing.

### Use spot instances for low-priority workloads
You can use spot VMs to take advantage of unused capacity on Azure at a significant cost savings. 

At any point when Azure needs the capacity back, the Azure infrastructure will evict spot VMs. 

Spot VMs are great for workloads that can handle interruptions, like batch processing jobs, development/test environments, and large compute workloads.

### Take advantage of reserved instances
Azure reservations help you save money by committing to one-year or three-year plans for multiple products. 

Committing to one of these plans gets you a discount on the resources you use. 

Reservations can reduce your resource costs up to 72 percent on pay-as-you-go prices. 

Reservations provide a billing discount and don't affect the runtime state of your resources. 

After you purchase a reservation, the discount automatically applies to matching resources.

Reservations are available for services such as:

* Windows and Linux virtual machines
* Azure SQL Database
* Azure Cosmos DB
* Azure Synapse Analytics
* Azure Storage

If you have consistent resource usage that supports reservations, buying a reservation provides you the option of reducing your costs. 

For example, when you continuously run instances of a service without a reservation, you're charged at pay-as-you-go rates. 

When you buy a reservation, you immediately get the reservation discount. 

The resources are no longer charged at the pay-as-you-go rates.

### Use managed services when possible
Whenever possible, take advantage of combining lower resource costs and lower operational costs by using managed services. 

These services come with lower operational costs because you don't need to patch and manage the underlying infrastructure and services. 

Deploying applications on VMs comes with the administration and maintenance of the operating system, as well as any layered software.

Azure SQL Database is a great example of a managed service. 

You can deploy a single or pooled database or a managed instance, and each of these is fully managed. 

You don't need to patch the underlying database software, and operational items like backup are built in and provided for you.

Azure App Service is another example of a managed service that is designed to host web applications. 

Rather than deploying and managing VMs to host your web applications, you can deploy your applications directly to App Service and dramatically reduce the amount of effort that's required to maintain infrastructure.


## Use monitoring and analytics to gain cost insights
You've deployed your application by using infrastructure and services that are as cost-effective as possible. 

But what do you do when your business, customer demand, or application changes? 

How do you ensure that your costs aren't growing out of control relative to the resources that are required to run them? 

How do you detect areas to improve efficiency in your environment? 

Architectures aren't static, resource demands will shift over time, and cloud services will evolve to introduce new features and cost savings.

### Track your cloud spend
To make intelligent decisions, you need data.

By analyzing where your money is going, you can compare your costs to your utilization to discover where you might have waste within your environment.

You can export billing data at any time. 

By using your billing data, you can track where your costs are going and how they're allocated across your resources. 

One challenge for you is that the billing data shows your costs, but not your utilization. 

You'll have data that indicates you're paying for a large VM, but how much are you actually using it?

Microsoft Cost Management gives you insights into where your spend is going, as well as underutilized resources. 

Microsoft Cost Management tracks your total spend, cost by service, and cost over time. 

You can drill down into resource types and instances. 

You can also break down your costs by organization or cost center by tagging resources with those categories.

Azure Advisor also has a cost component that:

* Recommends VM resizing when necessary.
* Identifies unused Azure ExpressRoute circuits and idle virtual network gateways.
* Advises when to consider buying reserved instances because that might be more cost-effective than using pay-as-you-go instances.

Azure Advisor makes additional recommendations in the areas of performance, high availability, and security.

The important part of optimization is to take time to review your spend and evaluate where your money is going. 

Effective analysis will help you identify areas of inefficiency and ensure you're operating as cost-effectively as possible.

### Conduct cost reviews
After your Azure services are running, you should regularly check your costs to track your Azure spending. 

You can use cost analysis to understand where the costs originated for your Azure usage.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-cost-optimization/media/4-cost-analysis.png)

Take time as an organization to regularly meet and review billing and expenditures that are related to cloud services. 

Review the respective expenditures with the technical and business stakeholders for each application. 

This brings increased visibility to the costs that are associated with an application and the decisions made from a cost perspective.

### Respond to cost alerts
One of the key features of Microsoft Cost Management is the ability to configure alerts that are based on spending. 

These alerts can provide immediate visibility into spending that might be exceeding your budget. 

You can then take steps to address these costs. There are three types of cost alerts:

* Budget alerts notify you when spending, based on usage or cost, reaches or exceeds the amount defined in the alert condition of the budget. 
* Credit alerts notify you when your Azure credit monetary commitments are consumed. Monetary commitments are for organizations with enterprise agreements.
* Department spending quota alerts notify you when department spending reaches a fixed threshold of the quota. You can configure spending quotas in the Azure Enterprise Agreement portal.

### Report anomalies
When an anomaly in spending is identified through your data collection, cost reviews, or cost alerts, you should report it to the necessary stakeholders. 

Active engagement on cost can ensure that you identify a potential for cost overrun before it becomes problematic. 

Transparency with stakeholders is important so they can fully understand any technical or business decisions that caused abnormal cloud costs.


## Maximize efficiency of cloud spend
You're a solution architect, and your organization has moved its workloads to the cloud. 

You've been asked to determine whether the increase is the result of natural, efficient growth, or whether the cost can be reduced by improving efficiency with the organization's cloud resources.

### How the cloud changes your expenses
One of the differences between the public cloud and on-premises infrastructure is how you pay for the services that you use.

In an on-premises datacenter, hardware procurement is a long process. 

Physical hardware is sized for maximum capacity. 

Some of the costs, such as computer power and storage space, can be hidden from the business units that are consuming those resources. 

Purchasing physical infrastructure ties up investments in long-term assets, which hinders your ability to be agile with your resources.

Shifting to the cloud replaces the burgeoning costs of maintaining physical infrastructure with a pay-for-what-you-use cost model. 

You no longer need to tie up investments in physical assets. 

If your resource requirements change, you can respond by adding, moving, or removing resources.

Workloads vary between and within services, demand can be unpredictable, and your growth patterns shift over time. 

Because you pay for only what you use in the cloud, your cost structure can move in sync with the changes in resources.

Cloud infrastructure can handle fluctuating resource-usage scenarios. 

Resources that have significant periods of inactivity can be shut down when not in use, and then not incur any cost at all. 

Resource allocation can grow automatically with a successful service as demand increases, rather than having to wait for the next procurement cycle. 

Additional resources can be dynamically added and removed to respond to predictable and unpredictable bursts of demand.

In an efficient architecture, resources are provisioned to match the demand. 

### Optimize IaaS costs
When you're using infrastructure as a service (IaaS) resources (such as virtual machines) as part of your solution, the cost associated with VMs is often the biggest portion of your spending. 

The compute costs are typically your largest expense, followed by storage costs. 

Taking time to optimize pay-for-what-you-use resources can have a large impact on the size of your monthly bill.

Let's take a look at best practices to reduce your compute and storage costs.

#### Compute
A few options are available to achieve cost savings for virtual machines:

* Choose a smaller size for the virtual machine instance
* Reduce the number of hours a virtual machine runs
* Use discounts for the compute costs

#### Rightsize virtual machines
Rightsizing a virtual machine is the process of matching virtual machine sizes with the respective requirements for resource demand. 

If a VM is running 25 percent idle, reducing the size of the VM will immediately reduce your cost. 

Virtual machine costs are linear within an instance family; each next size larger will double your cost. 

Conversely, reducing a VM by a single instance size will reduce your cost by half.

#### Implement shutdown schedules for virtual machines
If you have VM workloads that are used only periodically, but are running continuously, you're wasting money. 

You can shut down these VMs when they're not in use, which saves your compute costs while the VM is deallocated. 

You have several options to deallocate a VM. For example:

* You can use Azure Automation to run your VMs only during times that your workloads require
* You can use the auto-shutdown feature on a virtual machine to schedule a one-off automated shutdown
* You can manually stop a VM in the Azure portal

You should always use the Azure controls to stop your VMs. 

Shutting down the OS from inside a VM doesn't deallocate its Azure resource, so you'll continue to accrue costs.

#### Apply compute cost discounts
Azure Hybrid Benefit offers an additional way to optimize the costs of your Windows Server and SQL Server instances. 

It lets you use your licenses for your on-premises computers running Windows Server or SQL Server with Software Assurance as a discount toward the compute cost of these VMs. 

You can then reduce or eliminate the costs for Windows Server and SQL Server on enabled instances.

Some virtual machines need to be up and running all the time. 

Perhaps you have a web-application server farm for a production workload. 

Or maybe you have a domain controller that supports various servers on a virtual network. 

If you know with certainty that these virtual machines will run continuously throughout the coming year or longer, you can reduce your costs even more by purchasing a reserved instance.

Azure Reserved Virtual Machine Instances (Azure RI) lets you purchase compute capacity for a one-year or three-year commitment. 

It offers you significant savings; up to 72 percent when compared to pay-as-you-go compute resources.

#### Cost optimization for VM disk storage
For workloads that don't require high reliability and performance disks, you can use the reduced-cost standard storage. 

For example, you might choose to use standard storage for your development and test environments that aren't required to be an identical match for your production workloads.

Disks that aren't associated with a VM still incur storage costs, so you should make sure you don't have any orphaned disks remaining in your environment. 

If you've removed a VM but not its associated disks, you can reduce your storage costs by identifying and removing these orphaned disks from your environment.

You should also make sure that you don't have any orphaned snapshots remaining in your environment. 

Pricing for snapshots is lower than pricing for the disks themselves, but it's still a good practice to eliminate costs for unnecessary resources.

### Optimize PaaS costs
Platform as a service (PaaS) services are typically optimized for costs over IaaS services. 

There are opportunities to identify waste and optimize for minimal costs in your PaaS services as well. 

Let's look at ways to reduce Azure SQL Database and Azure Blob storage costs.

#### Optimize Azure SQL Database costs
When creating an Azure SQL database, you have to select a server and decide on a performance tier.

Each tier provides a performance level either in database transaction units (DTUs) or virtual cores (vCores).

For steady database loads, it's easy to optimize by selecting the appropriate tier size for the performance needs. 

When you're dealing with unpredictable workloads, elastic pools can help you reduce your costs.

SQL Database elastic pools are a simple, cost-effective solution for managing and scaling several databases that have varying and unpredictable usage demands. 

The databases in an elastic pool are on a single Azure SQL Database server and share a set number of resources at a set price. 

Pools are well suited for a large number of databases with specific utilization patterns. For a given database, this pattern is characterized by low average utilization with relatively infrequent utilization spikes.

The more databases you can add to a pool, the greater your savings become. 

The following illustration shows the capabilities of the three types of elastic database pools:

* Basic autoscales up to 5 eDTUs per database
* Standard autoscales up to 100 eDTUs per database
* Premium autoscales up to 1,000 eDTUs per database

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-cost-optimization/media/5-sqldb-elastic-pools.png)

Elastic pools are a great way to spread costs across multiple databases. They can make a significant impact on reducing your Azure SQL Database costs.

#### Optimize Blob Storage costs
Blob Storage is a cost-effective way to store data, but as the amount of data grows, your bill can benefit from optimizing how the data is stored.

Azure Storage offers three tiers for blob object storage:

* Hot access tier:
	* Highest storage costs, but lowest access costs. 
	* This tier is optimized for storing data that's accessed often.

* Cool access tier: 
	* Lower storage costs and higher access costs compared to hot storage. 
	* This tier is optimized for storing data that's infrequently accessed and stored for at least 30 days.

* Archive access tier: 
	* Lowest storage cost and highest data-retrieval cost compared to hot and cool storage. 
	* This tier is optimized for storing data that is rarely accessed and stored for at least 180 days, with flexible latency requirements.

#### Consumption pricing models
Moving to PaaS services can take the pay-as-you-go model even further into a true consumption pricing model. 

Services such as Azure Functions have the ability to use consumption plans.

When you're using a consumption plan, instances of the Azure Functions host are dynamically added and removed based on the number of incoming events. 

This serverless plan scales automatically, and you're charged for compute resources only when your functions are running. 

On a consumption plan, a function execution times out after a configurable period of time. 

Billing is based on the number of executions, the length of execution time, and the amount of memory used. 

Billing is aggregated across all functions within a function app.

Moving to services that use a consumption pricing model can bring a new approach to cost savings into your architecture.












































































































