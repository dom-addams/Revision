# _Address tangible risks with the Govern methodology of the Cloud Adoption Framework for Azure_
Without proper governance, it can be difficult and laborious to maintain consistent control across a portfolio of workloads. 

Fortunately, cloud-native tools like Azure Policy and Azure Blueprints provide convenient means to establish those controls. 

The Govern methodology helps you evaluate and establish corporate policies and disciplines to mitigate tangible risks.

Learning objectives:

* Establish processes to properly govern cloud adoption.
* Classify tangible risks based on the reference cloud adoption plan.
* Integrate corporate policies to mitigate tangible risks.
* List implementation strategies to mitigate risks.
* Demonstrate Azure Policy additions that implement risk mitigation strategies.
* Prioritize future governance investments.

## Govern methodology
Implementing proper cloud governance requires proper business policy, protective guardrails, and skilled people taking a consistent, disciplined approach to governance.

### Build governance maturity
This unit explains the four-step process in the Cloud Adoption Framework to build a mature cloud-governance solution:

1. Methodology: Understand the underlying methodology
1. Governance benchmark: Assess your current-state and future-state needs
1. Governance foundation: Establish your governance foundation by using a set of governance tools
1. Mature governance disciplines: Iteratively add governance controls to address risks

These steps get you started using the Govern methodology in the cloud. 

They also set you on a path to mature governance discipline as your cloud adoption plan progresses.

### Govern methodology
The Govern methodology provides a structured approach to building the governance maturity that's required for confidence in cloud adoption.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/methodology.png)

### Corporate policy
Governance is a large subject, and it might be intimidating at first. 

Governance seeks to establish the proper scope of corporate actions by mitigating tangible risks through corporate policy.

Corporate policies drive cloud governance. Proper corporate policy consists of three components:

* **Business risk:** Identify and understand tangible corporate risks and the organization's tolerance for risk.
* **Policy and compliance:** Convert risks into clear policy statements that support compliance requirements without defining specific technical dependencies.
* **Process:** Establish processes to monitor violations and ensure adherence to policy statements.

A focus on these components helps develop clear and actionable corporate policies. 

### Governance disciplines
Governance disciplines support corporate policies through a mixture of tools and human processes. 

Each of the following disciplines protects the organization from specific, defined potential pitfalls:

* **Cost Management discipline:** Optimize costs across a broad portfolio of workloads through the application of budgets, reports, and automated enforcement.
* **Security Baseline discipline:** Apply well-defined security requirements to all supported environments and underlying workloads.
* **Resource Consistency discipline:** Manage resource configuration at scale to ensure that all deployed assets are discoverable, recoverable, and onboarded into operation management processes.
* **Identity Baseline discipline:** Ensure proper authentication and access by applying roles and assignments to each environment.
* **Deployment Acceleration discipline:** Standardize and centralize deployment templates to ensure consistency across all environments and workloads.

Each discipline accelerates the application of corporate policies and ensures consistent governance. 


### Governance benchmark tool
The Cloud Adoption Framework provides a [governance benchmark tool](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/benchmark#governance-benchmark-tool?azure-portal=true) to help you identify gaps in the governance disciplines and corporate policy in your organization.

You can use the governance benchmark tool for a personalized report that outlines the difference between your current state and business priorities. 

The governance benchmark tool also includes tailored resources to help you start assessing your current state and future state, and establish a vision for applying the framework.

### Governance foundation
Azure includes a suite of governance tools that are built on top of the Azure Resource Manager platform. 

The initial governance foundation demonstrates how you can apply these tools to demonstrate cloud governance. 

As you progress through the units of this module, you learn how to apply these tools to solve governance challenges. 

First, start with a governance foundation to familiarize yourself with the tools.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/3-tdd-in-azure.png)

The Cloud Adoption Framework contains two ways to apply a sound foundation for governance to new or existing deployments. 

Each provides a different approach to support your business needs when you get started:

* **[Standard governance guide](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/standard/):** 
	* A guide for most organizations that's based on the recommended initial two-subscription model. 
	* The guide is designed for deployments in multiple regions while not spanning public and sovereign/government clouds.

* **[Governance guide for complex enterprises](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/):** 
	* A guide for enterprises that require multiple layers of governance. 
	* For example, multiple independent IT business units or enterprises that span public and sovereign/government clouds.


### Mature governance disciplines
A governance foundation introduces you to tools that are needed to implement proper governance. 

To achieve sustainable governance, you need to apply guardrails for each governance discipline. 

To be more precise and more effective, teams should start with a single discipline and expand over time. 

The following table can help mature the disciplines that are needed to meet specific business objectives:

Risk/need | Standard enterprise | Complex enterprise
--- | --- | ---
Sensitive data in the cloud | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/standard/security-baseline-improvement) | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/security-baseline-improvement)
Mission-critical applications in the cloud | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/standard/resource-consistency-improvement) | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/resource-consistency-improvement)
Cloud cost management | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/standard/cost-management-improvement) | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/cost-management-improvement)
Multicloud | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/standard/multicloud-improvement) | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/multicloud-improvement)
Complex/legacy identity management | N/A | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/identity-baseline-improvement)
Multiple layers of governance | N/A | [Discipline improvement](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/multiple-layers-of-governance)



## Corporate policies
Poor governance policies create unnecessary constraints, and they might not protect the company. 

This unit evaluates ways to create proper, actionable corporate policies.

### Evaluate existing corporate policy
When you evaluate existing corporate policies to apply them to the cloud or to any other new technology, you should be able to answer the following questions:

* What risk does this policy attempt to mitigate?
* Why is that risk not within organizational risk tolerance?
* Who determined that the risk isn't tolerable?
* When should this policy be applied (workload classification, situational, and so on)? When should exceptions be reviewed?
* How is this process enforced? How often should the policy be reviewed for applicability?
* For technology-focused processes, does this policy add risk by creating a dependency on a specific technology solution or technology vendor?

### Define corporate policy
Defining corporate policy requires a focus on identifying and mitigating business risks, regardless of the cloud platform the organization uses. 

Healthy cloud-governance strategy begins with sound corporate policy. 

The following three-step process guides the iterative development of sound corporate policies:

* [Business risk:](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/policy-compliance/business-risk) Investigate current cloud adoption plans and data classification to identify risks to the business. Work with the business to balance risk tolerance and mitigation costs.
* [Policy and compliance:](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/policy-compliance/policy-definition?policy-definition=true) Evaluate risk tolerance to inform policies that govern cloud adoption and manage risks. In some industries, third-party compliance affects initial policy creation.
* [Processes:](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/policy-compliance/processes?Azure-portal=true) The pace of adoption and innovation activities are naturally going to create policy violations. Executing relevant processes helps to monitor and enforce adherence to policies.

### Business risk
During cloud adoption, you encounter various risks. 

Here are some examples of risks that might evolve at different points of your adoption effort:

* During early experimentation, a few assets with little to no relevant data are deployed. The risk is small.
* When the first workload is deployed, risk increases a little. This risk is easily remediated by choosing an inherently low-risk application that has a small user base.
* As more workloads come online, risks change at each release. New applications go live, and risks change.
* When a company brings the first 10 or 20 applications online, the risk profile is much different than when the thousandth application goes into production in the cloud.

Risk is relative. A small company with a few IT assets in a building that's offline has little risk. 

Add users and an internet connection with access to those assets, and the risk intensifies. 

When that small company grows to Fortune 500 status, the risks are exponentially greater. 

As revenue, business processes, employee counts, and IT assets accumulate, risks increase and coalesce. 

IT assets that help generate revenue are at tangible risk of stopping that revenue stream if an outage occurs. 

Every moment of downtime equates to loss. Likewise, as data accumulates, the risk of harm to customers grows.

According to the outline from the Tailwind Traders customer narrative unit, here are the risks the Tailwind CIO is most concerned about:

* Overspending in the cloud
* The organization not meeting security or compliance requirements
* Asset configuration creating operations-management issues or oversights
* Unauthorized access compromising systems or data
* Inconsistent governance due to immature processes and lack of skills on the team

To create sound governance policies that scale to the cloud, let's look at the tangible risks that are captured in the current policy versus the current-state solution.

### Policy and compliance
Corporate policies establish the requirements, standards, and goals that your IT staff and automated systems need to support. 

Individual policy statements are guidelines for addressing specific risks that are identified during your risk assessment process. 

Here are a few examples of proper corporate policies that guide adoption in public and private cloud deployments, and which avoid locking in a specific vendor:

* **Avoid overspending:** 
	* Cloud deployments involve a risk for overspending, especially for self-service deployments. 
	* Any deployment must be allocated to a billing unit, with an approved budget and with a mechanism for applying budgetary limits.
	* Design consideration: 
		* In Azure, you can control budget with [Microsoft Cost Management](https://learn.microsoft.com/en-us/azure/cost-management-billing/). 
		* While [Azure Advisor](https://learn.microsoft.com/en-us/azure/advisor/advisor-cost-recommendations) can provide optimization recommendations to reduce spending per asset.

* **Secure sensitive data:** 
	* Assets that interact with sensitive data might not receive sufficient protections, leading to potential data leaks or business disruptions. 
	* The security team must identify and review all assets that interact with sensitive data, to ensure that proper levels of protection are in place.
	* Design consideration: 
		* In Azure, all deployed assets must be tagged with proper data-classification levels. 
		* The cloud governance team and the application owner must review the classifications before deployment to the cloud.

### Process
The cloud provides guardrails to help reduce the human overhead of recurring processes by providing validation triggers based on implementation configuration. 

The following table outlines a few triggers and actions that can address the risks:

Risk | Sample trigger | Sample action
--- | --- | ---
Overspending in the cloud | Monthly cloud spending is 20 percent higher than expected. | Notify the billing unit leader, to start reviewing resource usage.
Overspending in the cloud | Deployed assets aren't using the allocated CPU or memory. | Notify the billing unit leader and automatically resize to fit actual usage, when possible.
The organization not meeting security or compliance requirements | Detect any deviation from defined security or compliance. | Notify the IT security team and automate remediation, when possible.
Asset configurations creating operations management issues or oversights | CPU utilization for a workload is greater than 90 percent. | Notify the IT operations team and scale out more resources to handle the load.
Asset configurations creating operations management issues or oversights | Assets that fail to meet patching or business continuity and disaster requirements trigger operational compliance warning. | Notify the IT security team and automatically resolve the deviation, when possible.
Unauthorized access compromising systems or data | Traffic patterns deviate from approved network topologies. | Notify the IT security team and automatically close attack vectors, when possible.
Unauthorized access compromising systems or data | Assets are configured without proper role assignments or elevated privileges. | Notify the IT security team and automatically resolve the deviation, when possible.
Inconsistent governance due to immature processes and lack of skills on the team | Assets identified that aren't included in required governance processes. | Notify the IT governance team and automatically resolve the deviation, when possible.


You can automate each of these triggers and actions by using Azure governance tools. 

Other cloud providers might require a more manual approach, but the defined policies would still be applicable. 

Take care to avoid defining policies that would lock you into using a specific vendor to avoid having to repeat this process again in the future.

After establishing your cloud policy statements and drafting a design guide, you need to create a strategy to ensure that your cloud deployment stays in compliance with your policy requirements. 

This strategy must encompass your cloud-governance team's ongoing review and communication processes. 

This strategy must encompass your cloud-governance team's ongoing review and communication processes and establish criteria for when policy violations require action. 

It must also define the requirements for automated monitoring and compliance systems that detect violations and trigger remediation actions.



## Governance disciplines
Common governance disciplines within cloud platforms inform policies, align toolchains, and help organizations determine how best to automate and enforce corporate policies across their unique cloud platforms.

The following information summarizes each discipline from the Govern methodology in the Cloud Adoption Framework:

* [Cost Management discipline](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/cost-management/): Cost is a primary concern for cloud users. Develop policies for cost control for all cloud platforms.

* [Security Baseline discipline](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/security-baseline/): Security is a complex subject that's unique to each company. Once security requirements are established, cloud-governance policies and enforcement apply those requirements across network, data, and asset configurations.

* [Identity Baseline discipline](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/identity-baseline/): Inconsistencies in the application of identity requirements can increase the risk of breach. The Identity Baseline discipline focuses on ensuring that identity is consistently applied across cloud-adoption efforts.

* [Resource Consistency discipline](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/resource-consistency/): Cloud operations depend on consistent resource configuration. Through governance tooling, resources can be configured consistently to manage risks related to onboarding, drift, discoverability, and recovery.

* [Deployment Acceleration discipline](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/deployment-acceleration/): Centralization, standardization, and consistency in approaches to deployment and configuration improve governance practices. When provided through cloud-based governance tooling, they create a cloud factor that can accelerate deployment activities.

### Cost Management discipline
This discipline focuses on scaling the operational best practices for cost management across all workloads and assets in your portfolio.

This discipline would help Tailwind Traders address the following risk:

* Overspending in the cloud

### Security Baseline discipline
This discipline focuses on automating the application of security principles to ensure consistency across your environment.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/security-baseline.png)

This discipline would help address the following risks:

* The organization not meeting security or compliance requirements
* Unauthorized access compromising systems or data

### Identity Baseline discipline
After you've established identity and access requirements for your cloud environment, this discipline ensures that those requirements are consistently applied to all workloads and assets.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/identity-baseline.png)

This discipline would help to address the following risk:

* Unauthorized access compromising systems or data

### Resource Consistency discipline
Resource consistency focuses on the initial organization of the resources that are required to establish a foundation for governance. 

In the long term, this discipline focuses on proper onboarding processes to ensure that all assets meet any operational support requirements.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/resource-consistency.png)

This discipline would help address the following risks:

* Operations management issues or oversights

### Deployment Acceleration discipline
Automating governance leads to automation in adoption. 

Providing infrastructure as code (IaC) templates to the various adoption teams helps them quickly deploy workloads into compliant, well-managed environments.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/deployment-acceleration.png)

This discipline would help to address the following risk:

* Inconsistent governance due to immature processes and lack of skills on the team


The five disciplines of the Govern methodology in the Cloud Adoption Framework help establish the right collection of processes, tools, and automation to address common risks and concerns. 

Understanding these disciplines can help Tailwind Traders discover and address tangible risks and concerns, and then address them against a prioritized backlog.

In the next units, we'll explore technical solutions to help you get started with a cloud-governance foundation to support each discipline. 

We also look at some technical solutions that address risks related to managing costs.



## Deploy a cloud governance foundation
Deploying a cloud-governance foundation accelerates your ability to govern your entire Azure environment. 

This unit outlines the considerations and implementations that are required to deploy a foundation that can achieve resource consistency and prepare you for other governance disciplines.

### What will you configure?
This unit assumes that you've already deployed assets to Azure. 

Now, you want to configure the environment to better organize, track, and govern those assets. 

When you finish this unit, you understand why and how to configure management groups, subscription design, resource groups, and tagging.

### Strategic considerations
Resource organization is based on what's important to your organization. 

Before you define a management group or subscription design, it's important to understand the priority of these competing priorities:

* **Cost transparency:** Every cloud adoption should be aligned to departments, business units, projects, or other cost-allocation mechanisms for chargeback and showback accounting requirements.

* **Compliance and security:** Every cloud adoption should map to specific compliance requirements that map cloud adoption to specific risk, security, and compliance organization structures.

* **Democratization (delegated responsibility):** Every cloud adoption should map to teams, product groups, or projects for easier segmentation of responsibility by teams.

Understanding these strategic priorities can help you identify the best starting point for your management and subscription design.


### Resource organization in Azure
The basic foundation of all governance is consistent resource organization.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/resource-consistency.png)

The three main components of resource organization are:

* Management groups, which reflect security, operations, and business or accounting hierarchies.
* Subscriptions, which group similar resources into logical boundaries.
* Resource groups, which further group applications or workloads into deployment and operations units.

### Governance design consideration
To accommodate long-term governance needs, design a high-level hierarchy, but implement only what you need. 

Add new nodes to the hierarchy as requirements dictate.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/management-group-hierarchy.png)

The following components are in descending levels in the management group hierarchy shown in the above diagram:

* **Management group:** Business unit, geography, and environment
* **Subscription:** Per application category, preproduction, development environments, and production
* **Resource groups:** Per application

### Subscription design
A subscription is a logical container for all deployed assets. 

Subscriptions are used to group together common workloads based on billing, compliance, security, or access requirements. 

To maximize the effectiveness of governance, you should use as few subscriptions as possible.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/initial-subscription-model.png)

#### Scaling with subscriptions
There are several technical and nontechnical reasons to scale with multiple subscriptions. 

Check out the [fundamental concepts article](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/scale-subscriptions) for an overview of common reasons to scale.

The following questions might help illustrate reasons for you to scale your subscriptions:

* Are there capacity or technical limitations?

* Do you need to clearly separate concerns? For example:
	* Separation of duties
	* Dev/test versus generic nonproduction
	* Different customers
	* Different departments or business units
	* Different projects

* Are you able to spread the cost of a shared infrastructure across application owners? (Often, a dedicated subscription is used for shared infrastructure, like Microsoft Entra ID, monitoring, or patching tools.)

* Do you need to create clearer separation of duties through shared service subscriptions for operations management, security, identity sync, connectivity, or DevOps teams?

### Tagging
Management groups reflect your highest-priority organization structure. 

Tagging reflects various organizing principles that also are reflected in metadata. 

Here are suggested tags for all workloads:

* Workload (and/or application)
* Data sensitivity; reference [Data classification](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/policy-compliance/data-classification) for examples
* Mission criticality; reference [Workload criticality](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/manage/considerations/criticality) for examples
* Owner
* Department (cost center)
* Environment

### Deployment acceleration
Packaging all the governance change in a blueprint accelerates deployments and creates consistent governance application. 

When we assign a blueprint in the next exercise, governance is consistently applied to all subscriptions in the assigned management group. 

It's also applied to all resource groups and assets in those subscriptions.

The Cloud Adoption Framework for Azure (CAF) Foundation blueprint provides an example and a starting point for using blueprints in cloud governance to:

* Deploy Azure Key Vault
* Deploy Log Analytics in Azure Monitor Logs
* Deploy Microsoft Defender for Cloud (standard version)

The CAF Foundation blueprint also defines and deploys policies to:

* Apply `cost center` tags to resource groups
* Append resources in resource group with the `cost center` tag
* Permit an Azure region for resources and resource groups
* Permit storage account SKUs (choose when deploying)
* Permit Azure Virtual Machines SKUs (choose when deploying)
* Require Azure Network Watcher to be deployed
* Require secure transfer encryption for Azure Storage accounts
* Deny resource types (choose when deploying)
* Create an initiative to enable monitoring in Microsoft Defender for Cloud (89 policies)

Follow the prescribed steps to [publish and assign this sample blueprint to your management group](https://learn.microsoft.com/en-us/azure/governance/blueprints/samples/caf-foundation/deploy).



## The Cost Management discipline
Cost management often is the first discipline that customers choose to mature in any governance engagement. 

This unit outlines the outcomes, tools, processes, and a reference implementation to mature your cost discipline.

### Objective
The Cost Management discipline builds confidence in your ability to control costs and respond to the following triggers:

* Address concerns about budgets
* Define cost allocation across business units
* Implement cost guardrails
* Analyze workload costs
* Apply operational best practices across your portfolio
* Create accountability for cost best practices with each workload team

### Cost management best practices
The objective of this discipline is to apply these cost-management best practices:

* Align teams and accountability
* Manage best practices centrally
* Establish best practices for workload levels

#### Best practices by team and accountability
Cost management across the enterprise is a function of cloud governance and cloud operations. 

All cost-management decisions change the assets that support a workload. 

When those changes affect a workload's architecture, other considerations are required to minimize the impact on users and business functions. 

It's likely that the cloud-adoption team that configured or developed that workload is accountable for following through with those changes.

* **Tagging is critical to all governance:** Make sure that all workloads and resources follow [proper naming and tagging conventions](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging) and that you [enforce tagging conventions by using Azure Policy](https://learn.microsoft.com/en-us/azure/governance/policy/tutorials/govern-tags).
* **Identify right-size opportunities:** Review your current resource utilization and performance requirements across the environment.
* **Resize:** Modify each resource to use the smallest instance or SKU that can support the performance requirements of each resource.
* **Horizontal versus vertical scale:** Using multiple small instances can give you an easier scaling path than a single larger instance. Using multiple smaller instances supports scale automation, which creates cost optimization.

#### Operational cost management best practices
The following best practices typically are achieved by a member of the cloud-governance or cloud-operations team in accordance with patching and other scheduled maintenance processes. 

These best practices map to actionable guidance we describe later in this unit.

* Tagging is critical to all governance: 
	* Ensure that all workloads and resources follow proper naming and tagging conventions and that you enforce tagging conventions by using Azure Policy.

* Identify right-size opportunities: 
	* Review your current resource utilization and performance requirements across the environment to identify resources that have remained underutilized for more than 90 days.

* Right-size provisioned SKUs: 
	* Modify underutilized resources to use the smallest instance or SKU that can support the performance requirements of each resource.

* Autoshutdown for virtual machines (VMs): 
	* When a VM isn't used constantly, consider automated shutdown. 
	* The VM isn't deleted or decommissioned, but it does stop consuming compute and memory costs until it's turned back on.

* Autoshutdown for all nonproduction assets: 
	* If a VM is part of a nonproduction environment, specifically in a development environment, establish an autoshutdown policy to reduce the cost of nonuse. 
	* Whenever possible, use Azure DevTest Labs as a self-service option to help developers hold themselves accountable for cost.

* Shut down and decommission unused resources: 
	* Yes, we said it twice. If a resource hasn't been used in more than 90 days and doesn't have a clear uptime requirement, turn it off. 
	* More importantly, if a machine has been stopped or shut down for more than 90 days, deprovision and delete that resource. 
	* Validate that any data-retention policies are met through backup or other mechanisms.

* Clean up orphaned disks: Delete unused storage, especially VM storage that's no longer attached to a VM.

* Right-size redundancy: If the resource doesn't require a high degree of redundancy, remove geo-redundant storage.

* Adjust autoscale parameters: 
	* Operational monitoring is likely to uncover usage patterns for various assets. 
	* When those usage patterns map to the parameters that are used to drive autoscale behaviors, it's common for the operations team to adjust autoscale parameters to meet seasonal demand or changes to budget allocations. 
	* Review workload cost management best practices for important precautions.

#### Workload cost management best practices
Before making architectural changes, consult the technical lead for the workload. 

Facilitate a review of the workload by using the [Azure Well-Architected Framework overview](https://learn.microsoft.com/en-us/azure/architecture/framework/) and [introduction](https://learn.microsoft.com/en-us/training/modules/azure-well-architected-introduction/) to guide decisions about the following architectural changes:

* **Azure App Service:** 
	* Verify production requirements for any Premium tier App Service plan. 
	* Without an understanding of the business requirements for a workload and the underlying assets configuration, it's difficult to determine whether a Premium tier plan is required.

* **Horizontal versus vertical scale:** 
	* Using multiple small instances can give you an easier scaling path than a single larger instance. 
	* Using small instances supports scale automation, which creates cost optimization. 
	* Before a workload can scale horizontally, the technical team must verify that the application is idempotent. 
	* Achieving horizontal scale might first require changes to the code and configuring various layers of the application.

* **Autoscale:** 
	* Enable autoscale on all app services for a burstable number of smaller VMs. 
	* Enabling autoscale has the same idempotent requirement, which requires an understanding of the workload architecture. 
	* The workload and supporting assets must be approved for horizontal scaling and autoscaling by the cloud-adoption team before any operational changes are made.

* **Implement serverless technologies:** 
	* VM workloads often are migrated as-is to avoid downtime. 
	* Often, VMs host tasks that are intermittent, tasks that take a short period to run, or tasks that run for many hours. 
	* Examples are VMs that run scheduled tasks, like Windows task scheduler or PowerShell scripts. 
	* When these tasks aren't running, you're still paying for the VMs and disk storage. 
	* After migration, consider rearchitecting layers of the workload as serverless technologies like Azure Functions or Azure Batch jobs.

### Cost management process
The best practices described here are actionable, but how and when do you apply them? 

The Cost Management discipline is a continuous effort that involves multiple processes and roles.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-govern/media/cost-management-process.png)

Work with the central operations and workload teams to ensure proper ownership of each Cost Management discipline best practice that's shown in the above figure.

Depending on how you manage workloads in your environment, some best practices might move between teams. 

Although some organizations place all the cost-management burden on central IT and neglect accountability for the workload team, other organizations place all the cost management burden on the workload team. 

Most organizations fall somewhere between these two extremes.

After you align roles, establish recurring processes to meet and hold each other accountable for this important recurring task.

### Microsoft Cost Management
Microsoft Cost Management is your default tool in Azure to bring together all the data for managing your cost strategy.

Microsoft Cost Management brings together resource organization, Azure Advisor alerts, and your governance foundation to meet your cost management needs.

### EXTRA
Move forward with your governance journey by following the most suitable Govern methodology guide in the Cloud Adoption Framework.

For standard enterprises:

* [Improve the Security Baseline discipline (standard enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/standard/security-baseline-improvement)
* [Improve the Resource Consistency discipline (standard enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/standard/resource-consistency-improvement)
* [Improve the Cost Management discipline (standard enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/standard/cost-management-improvement)
* [Multicloud improvement (standard enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/standard/multicloud-improvement)

For complex enterprises:

* [Improve the Security Baseline discipline (complex enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/security-baseline-improvement)
* [Improve the Resource Consistency discipline (complex enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/resource-consistency-improvement)
* [Improve the Cost Management discipline (complex enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/cost-management-improvement)
* [Multicloud improvement (complex enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/multicloud-improvement).
* [Improve the Identity Baseline discipline (complex enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/identity-baseline-improvement)
* [Multiple layers of governance (complex enterprise)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/govern/guides/complex/multiple-layers-of-governance)

