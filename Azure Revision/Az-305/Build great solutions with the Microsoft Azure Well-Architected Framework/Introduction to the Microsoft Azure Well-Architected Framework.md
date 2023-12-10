# _Introduction to the Microsoft Azure Well-Architected Framework_
You want to build great things on Azure, but you're not sure exactly what that means. 

Using key principles throughout your architecture, regardless of technology choice, can help you design, build, and continuously improve your architecture.

Learning objectives:

* Describe the pillars of the Azure Well-Architected Framework
* Identify key principles for creating a solid architectural foundation

## Azure Well-Architected Framework pillars
The cloud has changed the way organizations solve their business challenges, and how applications and systems are designed. 

The role of a solution architect isn't limited to delivering business value through the functional requirements of the application. 

They must also ensure that the solution is designed in ways that are scalable, resilient, efficient, and secure.

Solution architecture is concerned with the planning, design, implementation, and ongoing improvement of a technology system. 

The architecture of a system must balance and align the business requirements with the technical capabilities that are needed to execute those requirements. 

The finished architecture is a balance of risk, cost, and capability throughout the system and its components.

### Azure Well-Architected Framework
The Azure Well-Architected Framework is a set of guiding tenets to build high-quality solutions on Azure. 

There's no one-size-fits-all approach to designing an architecture, but there are some universal concepts that apply regardless of the architecture, technology, or cloud provider.

These concepts aren't all-inclusive, but focusing on them can help you build a reliable, secure, and flexible foundation for your application.

The Azure Well-Architected Framework consists of five pillars:

* Cost optimization
* Operational excellence
* Performance efficiency
* Reliability
* Security

#### Cost optimization
You want to design your cloud environment so that it's cost-effective for operations and development. 

Identify inefficiency and waste in cloud spending to ensure you're spending money where you can make the greatest use of it.

#### Operational excellence
By taking advantage of modern development practices such as DevOps, you can enable faster development and deployment cycles. 

You need to have a good monitoring architecture in place so that you can detect failures and problems before they happen or, at a minimum, before your customers notice. 

Automation is a key aspect of this pillar to remove variance and error while increasing operational agility.

#### Performance efficiency
For an architecture to perform well and be scalable, it should properly match resource capacity to demand. 

Traditionally, cloud architectures accomplish this balance by scaling applications dynamically based on activity in the application. 

Demand for services changes, so it's important for your architecture to be able to adjust to demand. 

By designing your architecture with performance and scalability in mind, you provide a great experience for your customers while being cost-effective.

#### Reliability
Every architect's worst fear is having an architecture fail with no way to recover it. 

A successful cloud environment is designed in a way that anticipates failure at all levels. 

Part of anticipating failures is designing a system that can recover from a failure within the time that your stakeholders and customers require.

#### Security
Data is the most valuable piece of your organization's technical footprint. 

In this pillar, you focus on securing access to your architecture through authentication and protecting your application and data from network vulnerabilities. 

You should also protect the integrity of your data through tools like encryption.

You must think about security throughout the entire lifecycle of your application, from design and implementation to deployment and operations. 

The cloud provides protections against various threats, such as network intrusion and DDoS attacks. 

But you still need to build security into your application, processes, and organizational culture.

### General design principles
In addition to each of these pillars, there are some consistent design principles that you should consider throughout your architecture.

* Enable architectural evolution: 
	* No architecture is static. 
	* Allow for the evolution of your architecture by taking advantage of new services, tools, and technologies when they're available.

* Use data to make decisions: 
	* Collect data, analyze it, and use it to make decisions surrounding your architecture. 
	* From cost data, to performance, to user load, using data can guide you to make the right choices in your environment.

* Educate and enable: 
	* Cloud technology evolves quickly. 
	* Educate your development, operations, and business teams to help them make the right decisions and build solutions to solve business problems. 
	* Document and share configurations, decisions, and best practices within your organization.

* Automate: 
	* Automation of manual activities reduces operational costs, minimizes error introduced by manual steps, and provides consistency between environments.


### Shared responsibility
Moving to the cloud introduces a model of shared responsibility.

In this model, your cloud provider manages certain aspects of your application, leaving you with the remaining responsibility.

In an on-premises environment, you're responsible for everything. 

As you move to infrastructure as a service (IaaS), then to platform as a service (PaaS) and software as a service (SaaS), your cloud provider takes on more of this responsibility.

This shared responsibility plays a role in your architectural decisions, because these decisions can have implications on cost, security, and your application's technical and operational capabilities. 

By shifting these responsibilities to your provider, you can focus on bringing value to your business and move away from activities that aren't a core business function.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-introduction/media/cloud-responsibility-model.png)

### Design choices
In an ideal architecture, you'd build the most secure, high-performance, highly available, and efficient environment possible. 

However, as with everything, there are tradeoffs.

To build an environment with the highest level of all these pillars, there's a cost.

That cost might be in money, time to deliver, or operational agility. 

Every organization has different priorities that affect the design choices that are made in each pillar. 

As you design your architecture, you need to determine which trade-offs are acceptable and which aren't.

When you're building an Azure architecture, there are many considerations to keep in mind. 

You want your architecture to be secure, scalable, available, and recoverable. 

To make that possible, you have to make decisions based on cost, organizational priorities, and risk.



## Cost optimization
Your organization has moved most of its systems to the cloud, but you're now seeing cost increases in areas you didn't expect. 

After some observation, you realize that you're inefficient across your environment, and you're still doing manual operational work.

In this unit, you learn about cost optimization and look at ways to reduce unnecessary expenses and improve operational efficiencies.

### What is cost optimization?
Cost optimization is ensuring that the money your organization spends is being used to maximum effect. 

Cloud services provide computing as a utility. 

Technologies in the cloud are provided under a service model, to be consumed on demand. 

On-demand service offerings drive a fundamental change that directly affects planning, bookkeeping, and organizing.

When an organization decides to own infrastructure, it buys equipment that goes onto the balance sheet as assets. 

Because a capital investment was made, accountants categorize this transaction as a capital expense (CapEx). 

Over time, to account for the assets' limited useful lifespan, assets are depreciated or amortized.

Cloud services, on the other hand, are categorized as an operating expense (OpEx) because of their consumption model. 

Under this scheme, there's no asset to amortize. Instead, OpEx has a direct impact on net profit, taxable income, and the associated expenses on the balance sheet.

When an organization adopts a cloud platform, it must shift away from CapEx-oriented budgeting toward OpEx. 

This move reflects the shift from owning infrastructure to leasing solutions. 

Some organizations can derive value just from this new accounting model. 

To optimize costs in your organization's architecture, you can use several principles.


### Plan and estimate costs
For any cloud project, whether it's the development of a new application or the migration of an entire datacenter, it's important to get an estimate of your costs. 

This estimate involves identifying any current resources to move or redevelop, understanding business objectives that might affect sizing, and selecting the appropriate services for the project.

With the requirements identified, you can use cost-estimation tools to provide a more concise estimate of the resources that would be required. 

Transparency is important here, so that all stakeholders can review for accuracy and have visibility into the costs that are associated with the project.

### Provision with optimization
Provisioning services that are optimized for cost from the outset can reduce your work effort in the future. 

For example, you should ensure that you're selecting the appropriate service level for your workload and take advantage of services that let you adjust the service level. 

You should also use discounts when they're available, such as reserved instances and bring-your-own-license offers.

Where possible, you want to move from IaaS to PaaS services. 

PaaS services typically cost less than IaaS, and they generally reduce your operational costs.

With PaaS services, you don't have to worry about patching or maintaining VMs, because the cloud provider typically handles those activities. 

Not all applications can be moved to PaaS, but with the cost savings that PaaS services provide, it's worth considering.

### Use monitoring and analytics to gain cost insights
If you're not monitoring your spending, you don't know what you can save. 

Take advantage of cost-management tools and regularly review billing statements to better understand where money is being spent.

Take time to conduct regular cost reviews across services to understand if the expenditure is appropriate for the resource requirements of the workload. 

Adjust expenditures as necessary. 

Identify and track down any cost anomalies that might show up on billing statements or through alerts. 

If you notice a large spike in cost associated with network traffic, it might uncover both cost savings and potential technical issues.

### Maximize efficiency of cloud spend
Efficiency is focused on identifying and eliminating unnecessary expenses within your environment. 

The cloud is a pay-as-you-go service, and avoidable expenses are typically the result of provisioning more capacity than your demand requires. 

Operational costs can also contribute to unnecessary or inefficient costs. 

These inefficient operational costs show up as wasted time and increased error. 

As you design your architecture, identify and eliminate waste across your environment.

Waste can show up in several ways. Below are a few examples:

* A virtual machine that's always 90 percent idle.
* Paying for a license included in a virtual machine when a license is already owned.
* Retaining infrequently accessed data on a storage medium optimized for frequent access.
* Manually repeating the build of a nonproduction environment.

In each of these cases, you're spending more money than you should. Each case presents an opportunity for cost reduction.

As you evaluate your cost, take the opportunity to optimize environments. 

Capacity demands can and will change over time, and many cloud services can manually or dynamically adjust the provisioned resources to meet the demands. 

These adjustments can drive the balance between a well-running application and the most cost-effective size.

Optimize your systems at every level. At the network level, ensure that data transfer is efficient and meets the expectations of your customers. 

Use services to cache data to increase application performance and reduce the transaction load on your data-storage services. 

Identify and decommission unused resources. Take advantage of lower-cost data-storage tiers to archive infrequently accessed data.



## Operational excellence
Moving just your resources to the cloud is taking advantage of only a small portion of what the cloud can bring to your organization. 

Along with the technical capabilities that the cloud delivers, you can improve your operational capabilities as well. 

From improving developer agility to improving your visibility into the health and performance of your application, you can use the cloud to improve the operational capabilities of your organization.

### What is operational excellence?
Operational excellence is about ensuring that you have full visibility into how your application is running, and ensuring the best experience for your users.

Operational excellence includes making your development and release practices more agile, which allows your business to quickly adjust to changes. 

By improving operational capabilities, you can have faster development and release cycles, and a better experience for your application's users.

> You can use several principles when driving operational excellence through your architecture.

### Design, build, and orchestrate with modern practices
Modern architectures should be designed with DevOps and continuous integration in mind. 

A modern architecture allows you to automate deployments by using infrastructure as code, automate application testing, and build new environments as needed. 

DevOps is as much cultural as it's technical, but can bring many benefits to organizations that embrace it.

Regardless of the type of project you're managing, you can bring DevOps practices into your organization. 

Whether your project is an application that uses full continuous integration and continuous deployment (CI/CD) and containers, or a legacy application that you're continuing to service.

Breaking down silos within an organization is a common thread throughout DevOps. 

So is working collaboratively across every stage in a project, including change management. 

By creating a culture of sharing, collaboration, and transparency, you can bring operational excellence to your organization.

### Use monitoring and analytics to gain operational insights
Throughout your architecture, you want to have a thorough monitoring, logging, and instrumentation system. 

By creating an effective system for monitoring what's going on in your architecture, you can ensure that you know when something isn't right before your users are affected. 

With a comprehensive approach to monitoring, you can identify performance issues and cost inefficiencies, correlate events, and gain a greater ability to troubleshoot issues.

Operationally, it's important to have a robust monitoring strategy. 

Monitoring helps you identify areas of waste, troubleshoot issues, and optimize the performance of your application. 

A multilayered approach is essential. 

Gathering data points from components at every layer will help alert you when values are outside acceptable ranges and help you track spending over time.

### Use automation to reduce effort and error
You should automate as much of your architecture as possible. 

The human element is costly, injecting time and error into operational activities. 

This increased time and error results in increased operational costs. 

You can use automation to build, deploy, and administer resources. 

By automating common activities, you can eliminate the delay in waiting for a human to intervene.

### Test
You should include testing in your application deployment and your ongoing operations. 

A good testing strategy helps you identify issues in your application before it's deployed, and ensure that dependent services can properly communicate with your application.

A good testing strategy can also help identify performance issues and potential security vulnerabilities in both preproduction and production deployments. 

A robust testing plan can uncover issues with infrastructure deployments that can affect the user experience, and testing can help you provide a great experience for your users.



## Performance efficiency
Imagine that a news story is published about one of your organization's recent product announcements. 

The added publicity from the news story brings a large influx of traffic to your website. 

Can your website handle this traffic increase? Can your site take on the extra load without becoming slow or unresponsive?

In this unit, we look at some of the basic principles of ensuring outstanding application performance. 

Especially, the scaling and optimization principles that make up the performance efficiency pillar.

### What is performance efficiency?
Performance efficiency is matching an application's available resources with the demand that it's receiving. 

Performance efficiency includes scaling resources, identifying and optimizing potential bottlenecks, and optimizing your application code for peak performance.

#### Scale up and scale out
Compute resources can be scaled in two directions:

* Scaling up is adding more resources to a single instance. Also known as vertical scaling.
* Scaling out is adding more instances. Also known as horizontal scaling.

Scaling up is concerned with adding more resources, such as CPU or memory, to a single instance. This instance might be a virtual machine or a PaaS service.

The act of adding more capacity to the instance increases the resources that are available to your application, but it does come with a limit. 

Virtual machines are limited to the capacity of the host on which they run, and hosts themselves have physical limitations. 

Scaling out is concerned with adding more instances to a service. They can be virtual machines or PaaS services. 

Instead of adding more capacity by making a single instance more powerful, we add capacity by increasing the total number of instances.

The advantage of scaling out is that you can conceivably scale out forever if you have more machines to add to the architecture. 

Scaling out requires some type of load distribution. 

In both types of scaling, resources can be reduced, which brings cost optimization into the picture.

Autoscaling is the process of dynamically allocating resources to match performance requirements. 

* As the volume of work grows, an application might need more resources to maintain the desired performance levels and satisfy service-level agreements (SLAs). 
* As demand slackens and the added resources are no longer needed, they can be deallocated to minimize costs.

Autoscaling takes advantage of the elasticity of cloud-hosted environments while easing management overhead. It reduces the need for an operator to continually monitor the performance of a system and make decisions about adding or removing resources.

### Optimize network performance
When you're optimizing for performance, you look at network and storage performance to ensure that their levels are within acceptable limits. 

These performance levels can affect the response time of your application. 

Selecting the right networking and storage technologies for your architecture helps you ensure that you're providing the best experience for your consumers.

Adding a messaging layer between services can have a benefit to performance and scalability. 

A messaging layer creates a buffer so that requests can continue to flow in without error if the receiving application can't keep up. 

As the application works through the requests, they're answered in the order in which they were received.

### Optimize storage performance
In many large-scale solutions, data is divided into separate partitions that can be managed and accessed separately. 

The partitioning strategy must be chosen carefully to maximize the benefits while minimizing adverse effects. 

Partitioning can help improve scalability, reduce contention, and optimize performance.

Use caching in your architecture to help improve performance. 

Caching is a mechanism to store frequently used data or assets (webpages, images) for faster retrieval. 

You can use caching at different layers of your application. 

You can use caching between your application servers and a database in order to decrease data retrieval times.

You can also use caching between your users and your web servers by placing static content closer to users. 

This type of caching decreases the time it takes to return webpages to the users. It also has a secondary effect of offloading requests from your database or web servers, increasing the performance for other requests.

### Identify performance bottlenecks in your application
Distributed applications and services running in the cloud are complex pieces of software that comprise many moving parts. 

In a production environment, it's important to be able to track the way in which users utilize your system. 

It's also important to trace resource utilization, and generally monitor the health and performance of your system. 

You can use this information as a diagnostic aid to detect and correct issues. You can also use this information to help spot potential problems and prevent them from occurring.

Performance optimization includes understanding how the applications themselves are performing. 

Errors, poorly performing code, and bottlenecks in dependent systems can all be uncovered through an application performance-management tool. 

Often, these issues might be hidden or obscured for users, developers, and administrators, but they can have an adverse effect on the overall performance of your application.

With a thorough approach to performance monitoring, you're able to determine the types of patterns and practices from which your architecture can benefit.



## Reliability
Imagine that you run a clinical system for a healthcare organization. 

Clinicians and caregivers have little tolerance for downtime. 

They need to have access to clinical IT systems around the clock to ensure that they're always providing the highest-quality care.

To meet the around-the-clock demands of clinicians, applications must be able to handle failures with minimal impact to their users. 

### What is reliability?
In a complex application, any number of things can go wrong at any scale. It's critical that your application stays reliable and can handle both localized and broad-impact incidents.

Designing for reliability includes maintaining uptime through small-scale incidents and temporary conditions like partial network outages. 

You can ensure that your application handles localized failures by integrating high availability into each component. 

This application design eliminates single points of failure. Such a design also minimizes the impact of infrastructure maintenance.

High-availability designs typically aim to eliminate the impact of incidents quickly and automatically, and to ensure that the system can continue to process requests with little to no effect.

Designing for reliability also focuses on recovery from data loss and from larger-scale disasters. 

Recovery from these types of incidents often involves active intervention, though automated recovery steps can reduce the time needed to recover. 

Including high availability and recoverability in your architecture design protects your business from financial losses that result from downtime and lost data. They also protect your business from a loss of reputation caused by a loss of trust from your customers.

> Architecting for reliability ensures that your application can meet the commitments you make to your customers. 
> You want to ensure that your systems are available to end users and can recover from any failures.

### Build a highly available architecture
For availability, identify the service-level agreement (SLA) to which you're committing. 

Examine the potential high-availability capabilities of your application relative to your SLA, and identify where you have proper coverage and where you need to make improvements.

Your goal is to add redundancy to components of the architecture so that you're less likely to experience an outage.

Examples of high-availability design components include clustering and load balancing:

* Clustering replaces a single VM with a set of coordinated VMs. When one VM fails or becomes unreachable, services can fail over to another one that can service the requests.
* Load balancing spreads requests across many instances of a service, detecting failed instances and preventing requests from being routed to them.

### Build an architecture that can recover from failure
For recoverability, you should perform an analysis that examines your possible data loss and major downtime scenarios. 

Your analysis should include an exploration of recovery strategies and the cost/benefit tradeoff for each. 

This exercise gives you important insight into your organization's priorities, and helps clarify the role of your application. 

The results of your analysis should include these duration values for your application:

* Recovery point objective (RPO): The maximum duration of acceptable data loss. RPO is measured in units of time, not volume.
* Recovery time objective (RTO): The maximum duration of acceptable downtime, where your specification defines "downtime".

With RPO and RTO defined, you can design backup, restore, replication, and recovery capabilities into your architecture to meet these objectives.

Every cloud provider offers a suite of services and features that you can use to improve your application's availability and recoverability. When possible, use existing services and best practices, and try to resist creating your own.



## Security
Healthcare organizations store personal and potentially sensitive customer data. 

Financial institutions store account numbers, balances, and transaction histories. 

Retailers store purchase history, account information, and demographic details of customers. 

A security incident might expose this sensitive data, which might cause personal embarrassment or financial harm.

### What is security?
Security is ultimately about protecting the data that your organization uses, stores, and transmits. 

The data that your organization stores or handles is at the heart of your securable assets. 

This data might be sensitive data about customers, financial information about your organization, or critical line-of-business data that supports your organization.

Securing the infrastructure on which the data exists, along with the identities used to access it, is also critically important.

Your data might be subject to more stringent legal and regulatory requirements. 

These extra requirements depend on where you're located, the type of data you're storing, or the industry in which your application operates.

In Europe, the General Data Protection Regulation (GDPR) lays out the rules of how personal data is protected, and defines individuals' rights related to stored data. Some countries/regions require that certain types of data don't leave their borders.

When a security breach occurs, there can be a substantial effect on the finances and reputation of both organizations and customers. 

A security breach breaks down the trust that customers are willing to instill in your organization, and can affect the organization's long-term health.

### Defense in depth
A multilayered approach to securing your environment increases its security posture. Commonly known as defense in depth, we can break down the layers as follows:

* Data
* Applications
* VM/compute
* Networking
* Perimeter
* Policies and access
* Physical security

Each layer focuses on a different area where attacks can happen, and creates a depth of protection if one layer fails or an attacker bypasses it. 

If you were to focus on just one layer, an attacker would have unfettered access to your environment if they got through this layer.

Addressing security in layers increases the work an attacker must do to gain access to your systems and data. 

Each layer has different security controls, technologies, and capabilities that apply. 

When you're identifying the protections to put in place, cost is often of concern. You need to balance cost with business requirements and overall risk to the business.

No single security system, control, or technology fully protects your architecture. 

Security is more than just technology; it's also about people and processes. 

Creating an environment that looks holistically at security and makes it a requirement by default helps ensure that your organization is as secure as possible.

### Protect from common attacks
At each layer, there are some common attacks that you want to protect against. 

The following list isn't all-inclusive, but it can give you an idea of how each layer can be attacked and what types of protections you might need.

* Data layer: 
	* Exposing an encryption key or using weak encryption can leave your data vulnerable if unauthorized access occurs.

* Application layer: 
	* Malicious code injection and execution are the hallmarks of application-layer attacks. 
	* Common attacks include SQL injection and cross-site scripting (XSS).

* VM/compute layer: 
	* Malware is a common method of attacking an environment, which involves executing malicious code to compromise a system. 
	* After malware is present on a system, further attacks can occur that lead to credential exposure and lateral movement throughout the environment.

* Networking layer: 
	* Taking advantage of unnecessary open ports to the internet is a common method of attack. 
	* Open ports might also include leaving the SSH or RDP protocols open to virtual machines. 
	* When these protocols are open, they can allow brute-force attacks against your systems as attackers attempt to gain access.

* Perimeter layer: 
	* Denial-of-service (DoS) attacks often happen at this layer. 
	* These attacks try to overwhelm network resources, forcing them to go offline or making them incapable of responding to legitimate requests.

* Policies and access layer: 
	* This layer is where authentication occurs for your application. 
	* This layer might include modern authentication protocols such as OpenID Connect, OAuth, or Kerberos-based authentication such as Active Directory. 
	* The exposure of credentials is a risk at this layer, and it's important to limit the permissions of identities. 
	* You also want to have monitoring in place to look for possible compromised accounts, such as logins coming from unusual places.

* Physical layer: 
	* Unauthorized access to facilities through methods, such as door drafting and theft of security badges, can happen at this layer.


### Shared security responsibility
Revisiting the model of shared responsibility, we can reframe this model in the context of security. 

Depending on the type of service you select, some security protections are built into the service, while others remain your responsibility. 

Careful evaluation of the services and technologies you select are necessary, to ensure that you're providing the proper security controls for your architecture.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-introduction/media/shared-responsibilities.png)

## Summary
Architecture is the foundation of your application's design. 

Using the Azure Well-Architected Framework will give you the confidence that your app can sustainably meet the needs of your customers both now and in the future.

The architectural priorities and needs of every app are different. 

The five pillars in the Azure Well-Architected Framework are an excellent guidepost that you can use to make sure that you've given enough attention to every aspect of your application:

* Cost optimization
* Operational excellence
* Performance efficiency
* Reliability
* Security

Focusing on these pillars when designing your architecture ensures that you're laying a solid foundation for your applications in the cloud. 

With a solid foundation, you're able to drive innovation through your environment, build solutions that your users love, and foster the trust of your customers.
