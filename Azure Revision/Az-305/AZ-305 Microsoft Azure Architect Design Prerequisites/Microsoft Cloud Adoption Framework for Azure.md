# _Microsoft Cloud Adoption Framework for Azure_
This module covers the basics of how to use the Cloud Adoption Framework—a set of documentation, implementation guidance, best practices, and tools that aid in aligning the strategy for business, people, and technology.

Learning objectives:

* Learn how to leverage the Cloud Adoption Framework to identify where your organization is in the digital transformation journey.
* Identify triggers and opportunities for cloud adoption.
* Recognize the components needed to develop a digital transformation strategy around your business, people, and technology.

## What is the Microsoft Cloud Adoption Framework for Azure?
The Cloud Adoption Framework for Azure is a collection of documentation, technical guidance, best practices, and tools that aid in aligning business, organizational readiness, and technology strategies. 

This alignment enables a clear and actionable journey to the cloud that rapidly delivers on the desired business outcomes.

The cloud fundamentally changes how organizations procure and use technology resources. 

With the cloud, they can provision and consume resources only when needed. 

While the cloud offers tremendous flexibility in design choices, organizations need a proven and consistent methodology for adopting cloud technologies.

The Cloud Adoption Framework meets that need. It can help guide your decisions throughout cloud adoption to accelerate a specific business objective.

### How is it structured?
The Cloud Adoption Framework helps customers undertake a simplified cloud journey in three main stages:

* Plan
* Ready
* Adopt

These three main stages are preceded by a business strategy phase and surrounded by an operations phase that expands through the cloud adoption journey.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/wwl-mba/microsoft-cloud-adoption-framework-for-azure/media/ic-caf-2.jpg)

The Cloud Adoption Framework contains detailed information to cover an end-to-end cloud adoption journey:

It begins with setting the business strategy, which should align to actionable technology projects that deliver on the desired business outcomes.

It then describes how the organization must:

* Prepare its people with technical readiness.
* Adjust processes to drive business and technology changes.
* Enable business outcomes through implementation of the defined technology plan.

Finally, it covers cloud operations, such as governance, resources, and people and change management.


## Define strategy
Organizations adopt the cloud to help drive business transformation, such as processes and product improvement, market growth, and increased profitability. 

Across organizations of all types, sizes, and industries, the decision to invest in cloud technologies is often tightly connected to a critical business event. 

The reason for this connection is because the cloud might enable the appropriate solution for the event. 

Proper cloud technology implementation might turn a reactive response into an innovation opportunity to drive growth for the organization.

### Motivations
Organizations find different triggers to adopt new technologies like Azure. Some triggers drive the organization to migrate current applications. 

Other triggers require creation of new capabilities, products, and experiences.

Some common migration and innovation triggers include:

* Preparation for new technical capabilities
* Gaining scale to meet market or geographic demands
* Cost savings
* Reduction in vendor or technical complexity
* Optimization of internal operations
* Increased business agility
* Improvements to customer experiences or engagements
* Transformation of products or services
* Disruption of the market from new products or services

### Strategy
When you define your cloud business strategy, you should consider business impact, turnaround time, global reach, performance, and more. 

Here are key areas you need to focus on:

* Establish clear business outcomes: Drive transparency and engagement for your journey across the organization.
* Define business justification: Identify business value opportunities to then select the right technology.

Implementing the first application is key to learning and testing with confidence, as your cloud adoption journey starts. Use a two-pronged approach to select it:

* Business criteria: Identify an application currently in operation where the owner has a strong motivation to move to the cloud.
* Technical criteria: Select an application that has minimum dependencies and can be moved as a small group of assets.

### Establish clear business outcomes
The most successful cloud adoption journeys start with a business outcome in mind, backed up by financial reasoning and support. 

A business outcome is a concise, defined, and observable result or change in business performance that's captured by a specific measure. 

The cloud strategy team consists of business leaders from finance, IT infrastructure, and application groups. 

The team leads the cloud analysis and planning phase. In this phase, the cloud strategy team is responsible for:

* Reviewing business outcomes and creating the business justification plan for possible use cases for cloud adoption.
* Building or facilitating the cloud rationalization process, selecting the first application, and managing subsequent prioritized backlogs.
* Managing communications with key stakeholders and promoting the cloud adoption journey success and learnings.

Remember that the chief financial officer (CFO) can be a key player in creating and landing a cloud adoption plan and can drive the value of migration and innovation, including creating a financial plan for adoption.

Here are some tools to support you in your financial planning:

* Azure Total Cost of Ownership (TCO) Calculator: Use the TCO calculator to estimate the cost savings you can realize by migrating your application workloads to Azure.
* Azure pricing calculator: Estimate your expected monthly bill by using the pricing calculator.
* Microsoft Cost Management + Billing: Use and manage Azure and other cloud resources through a multiple-cloud cost management solution.

### Define business justification
Developing a clear business justification for cloud adoption with tangible, relevant costs and returns can be a complex process. 

First, review some common cloud computing business value areas to help justify the cloud adoption journey:

* Cost: Eliminates capital expense.
* Scale: Ability to scale elastically, delivering the right amount of IT resources
* Productivity: Removes the need for many IT management chores
* Reliability: Eases the burden of data backup, disaster recovery, and business continuity



## Plan
How the cloud can advance your business strategy depends on your situation. 

The cloud delivers fundamental technology benefits that can aid in executing multiple business strategies. 

Using cloud-based approaches can improve business agility, reduce costs, accelerate time to market, and even allow businesses to quickly expand into new markets.

As your organization moves forward in your cloud adoption journey, proper planning is key to your success. 

Your organization already has technology investments, so you must understand your current state and then develop a prioritization plan for your cloud journey.

In this stage, you focus on two main actions:

* **Rationalize your digital estate:** Understand the organization's current digital estate to maximize return and minimize risks by running a workload assessment.
* **Create your cloud adoption plan:** Develop a plan where prioritized workloads are defined and aligned with business outcomes.

### Rationalize your digital estate
A digital estate is the collection of IT assets that power business processes and supporting operations. 

To begin cloud rationalization of the digital estate, inventory all the digital assets the organization owns today. 

Then, evaluate each asset to determine the best way to migrate or modernize each component to the cloud.

During this process, we recommend that you proceed incrementally, application by application. Don't make decisions too broadly or too early across the entire application portfolio.

There are five options for cloud rationalization, sometimes referred to as the Five Rs:

* Rehost
* Refactor
* Rearchitect
* Rebuild/New
* Replace

### Create your cloud adoption plan
As you develop a business justification model for your organization's cloud journey, identify business outcomes that can be mapped to specific cloud capabilities and business strategies to reach the desired state of transformation. 

Documenting all these outcomes and business strategies serves as the foundation for your organization's cloud adoption plan.

Key steps to build this plan are to:

* Review sample business outcomes.
* Identify the leading metrics that best represent progress toward the identified business outcomes.
* Establish a financial model that aligns with the outcomes and learning metrics.



## Ready
We just looked at how a business plan aligned to a digital estate rationalization can ensure you know why you'll benefit from moving to the cloud. 

Cloud adoption is a strategic change that requires involvement from both business decision makers and end users. 

Now, let's talk about how to get your organization ready for this journey:

* Define skills and support readiness: Create and implement a skills-readiness plan to:
	* Address current gaps.
	* Ensure that IT and business people are ready for the change and the new technologies.
	* Define support needs.

* Create your landing zone: Set up a migration target in the cloud to handle prioritized applications.

The Azure readiness guide introduces features that help you organize resources, control costs, and secure and manage your organization. 

Links to sample skills-readiness learning paths on Microsoft Learn and Azure Support are available in the Summary and resources unit at the end of this module.

### Create your landing zone
Before you begin to build and deploy solutions with Azure services, make sure your environment is ready. 

The term landing zone is used to describe an environment that's provisioned and prepared to host workloads in a cloud environment, such as Azure. 

A fully functioning landing zone is the final deliverable of any iteration of the Cloud Adoption Framework for Azure methodology.

> Standards-based Azure Blueprints samples are available and ready to use.



## Adopt
At this point, you've established your business justification and defined your business outcomes. 

You've prepared your organization. Your people and your Azure environment are ready to deploy your prioritized applications. 

You're ready to adopt cloud technologies following the selected digital estate rationalization path.

### Cloud migration
Cloud migration is the process of moving existing digital assets to a cloud platform. 

Existing assets are replicated to the cloud with minimal modifications. 

After an application or workload becomes operational in the cloud, users are transitioned from the existing solution to the cloud solution.

The strategy and tools you use to migrate an application to Azure largely depend on your business motivations, technology strategies, and timelines. 

Your decisions are also based on a deep understanding of the application and the assets to be migrated. These assets include infrastructure, apps, and data. 

This decision tree serves as high-level guidance to help you select the best tools to use based on migration decisions.

Migration preparation: Establish a rough migration backlog, based largely on the current state and desired outcomes.

* Business outcomes: The key business objectives that drive this migration. They're defined in the Plan phase.
* Digital estate estimate: A rough estimate of the number and condition of workloads to be migrated. It's defined in the Plan phase.
* Roles and responsibilities: A clear definition of the team structure, separation of responsibilities, and access requirements. They're defined in the Ready phase.
* Change management requirements: The cadence, processes, and documentation required to review and approve changes. They're defined in the Ready phase.

### Cloud innovation
Cloud-native applications and data accelerate development and experimentation cycles. 

Older applications can take advantage of many of the same cloud-native benefits by modernizing the solution or components of the solution. 

Modern DevOps and software development lifecycle (SDLC) approaches that use cloud technology shorten the time from idea to product transformation. 

Combined, these tools invite the customer into the process to create shorter feedback loops and better customer experiences.

Modern approaches to infrastructure deployment, operations, and governance are rapidly bridging the gaps between development and operations.

Modernization and innovation in the IT portfolio create tighter alignment with DevOps and accelerate innovations across the digital estate and application portfolio.



## Govern and manage
The process of adopting the cloud is a journey, not a destination. 

Along the way, there are clear milestones and tangible business benefits. 

The final state of cloud adoption is unknown when an organization begins the journey. 

As your organization moves or deploys new applications to the cloud, this final state starts to form. 

It's important to consider the following aspects of managing and operating a cloud platform:

* Define governance solutions for your cloud environment that meet your organization's business needs, provide agility, and control risks.
* Manage your cloud environment based on the governance solutions to allow it to evolve, grow, and adapt to your organization's changing business needs.

### Cloud governance
Cloud governance creates guardrails that keep the organization on a safe path throughout the journey. 

The Cloud Adoption Framework for Azure governance model identifies key areas of importance. 

Each area relates to different types of risks the organization must address as it adopts more cloud services.

Because governance requirements will evolve throughout the cloud adoption journey, a flexible approach to governance is required. 

IT governance must move quickly and keep pace with business demands to stay relevant during cloud adoption.

Incremental governance relies on a small set of corporate policies, processes, and tools to establish a foundation for adoption and governance. 

That foundation is called a minimum viable product (MVP). 

An MVP allows the governance team to quickly incorporate governance into implementations throughout the adoption lifecycle. 

After this MVP is deployed, additional layers of governance can be quickly incorporated into the environment.

### Cloud management
The goal of the Manage methodology is to maximize ongoing business returns by creating balance between stability and operational costs. 

Stable business operations lead to stable revenue streams.

Controlled operational costs reduce the overhead to drive more profit from the business processes.

Cloud operations creates a maturity model that helps the team fulfill commitments to the business. 

In the early stages of maturity, customers focus on basic needs such as inventory and visibility into cloud assets and performance.

As operations in the cloud mature, the team can use cloud native or hybrid approaches to maintaining operational compliance, which reduces the likelihood of interruptions through configuration and state management. 

After compliance is achieved, protection and recovery services provide low-impact ways to reduce the duration and effect of business process interruptions. 

During platform operations, aspects of various platforms (like containers or data platforms) are adjusted and automated to improve performance.

