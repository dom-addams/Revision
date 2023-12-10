# _Choose the best Azure landing zone to support your requirements for cloud operations_
Azure landing zones can accelerate configuration of your cloud environment. 

This module will help you choose and get started with the best landing zone option for your needs.

Learning objectives:

* Compare your management, governance, and security requirements for operations to common operating models.
* Evaluate options for implementing Azure landing zones against your short-term and long-term requirements.
* Choose the best Azure landing zone and Learn modules to support your needs for cloud adoption.

## Common operating models
The following four operating models show up across cloud adoption efforts. 

Examining these common operating models can shape conversations about environmental design and configuration. 

Each operating model maps to one or more Azure landing zones to accelerate initial deployment.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-ready/media/operating-model-complexity.png)

The following characteristics aid in aligning to one of the common operating models:

* **Strategic priority:** 
	* Innovation, control (optimized operations), democratization (autonomy), and integration are all important strategic priorities for adopting the cloud. 
	* When you're speaking to the executive stakeholders, which will be the most important factor for your company in the next three to five years?

* **Organization:** 
	* Organization of people drives some operations decisions. 
	* Do you have a small IT team that covers all of your portfolio? 
	* Are separate teams dedicated to functions like security, governance, and operations? 
	* Are teams organized around individual workloads? 
	* Are you bound by rigid third-party compliance standards that are reviewed by an auditor or other compliance bodies?

* **Portfolio scope:** 
	* The size of your portfolio and where you focus operations are important considerations for each operating model. 
	* Do you manage a large, complex, multicloud workload portfolio? 
	* Can a single cloud platform support the portfolio? 
	* Do all of your workloads need to live in a single production subscription? 
	* Do you focus on workload-specific operations with no central support? 
	* Learn more about these terms in the [portfolio hierarchy article](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/reference/fundamental-concepts/hosting-hierarchy).

* **Accountability (separation of duties):** 
	* When it comes to technology, there's always something that can go wrong. 
	* That's why few teams sign up for an uptime SLA of 100 percent. 
	* When things break or aren't performing as expected, who's accountable for taking the call? 
	* Who's accountable for proactive fixes to minimize outages? 
	* Who's accountable for cloud economics and ongoing budgets? 
	* Accountability and associated access requirements drive some environmental design decisions.

* **Standardization:** 
	* Standardizing foundational utilities like network, identity, and security can produce tangible cost savings and reduce the amount of people power that's dedicated to various efforts. 
	* How important is standardization of utilities or shared resources?

* **Operations priority:** 
	* In modernizing operations, it's common for an operations team to choose cloud-first services as the primary form of operations support. 
	* Alternatively, when existing on-premises tooling is the primary operations tooling that the team wants, the cloud can be an extension or a secondary operating model.
	* Looking forward, do you prefer a cloud-first view of operations and supporting tools? 
	* Will you carry forward existing tools to extend into the cloud? 
	* Are you looking for a unified operations approach that can seamlessly blend public and private cloud operations?

* **Platform development velocity:** 
	* Workloads require their own assets, which create the direct workload environment. 
	* Beyond those directly supporting assets, there are various degrees of upfront investment. 
	* How much effort do you want to invest in foundational utilities that will be shared across workloads (such as network and identity)? 
	* How much upfront effort should go into a centralized cloud foundation that will share those utilities across multiple landing zones?

### Decentralized operations
The least complex operating model is a fully decentralized model. 

This model is highly focused on independent workloads with minimal dependency on centralized operations. 

This model is also called bimodal IT or decentralized IT.

* **Strategic priority:** 
	* Organizations often use decentralization when they prioritize innovation over control. 
	* This model is common in startup organizations, but it's also an increasing trend in larger organizations.

* **Organization:** Teams are organized around workloads or business processes, which contrasts with the other three operating models.

* **Portfolio scope:** 
	* The portfolio's scope is also isolated to workload levels. 
	* When an organization is entirely decentralized, the organization is unlikely to invest much time in management of portfolio alignment.

* **Accountability (separation of duties):** 
	* The workload team is entirely accountable for operations, governance, and security decisions. 
	* There is no shared accountability model in decentralized operations.

* **Standardization:** 
	* Best practices and deployment automation (continuous integration/continuous delivery pipelines) are critical to create any degree of standardization across workloads. 
	* Without centralized functions, standardization probably won't last long.

* **Operations priority:** A decentralized operations team is more likely to prioritize cloud-first operations by using software as a service (SaaS) or platform as a service (PaaS) tools to automate operations.

* **Platform development velocity:** Decentralized operations might share deployment scripts across workloads, but there are few or no central resources shared across workloads.

[Compare more pros, cons, and characteristics of decentralized operations in the Cloud Adoption Framework.](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/operating-model/compare)

### Centralized operations
A centralized model is the most common operations model in IT. 

This model is highly focused on a controlled production environment that's managed solely by centralized operations. 

Centralized operations focus on a smaller number of landing zones with embedded foundational utilities.

Management of nonproduction environments varies from organization to organization. 

But in a centralized operations model, even the nonproduction environments are likely to be constrained by governance and security requirements.

* **Strategic priority:** 
	* When control and stability in the business are more important than innovation, this model tends to be the highest trend.
	* Larger organizations or stable organizations often use centralized operations. 
	* This model is common when third-party compliance requirements drive environmental decisions.

* **Organization:** 
	* Teams are organized around functions or processes first. 
	* In smaller organizations, central IT is home for team members who focus on security, governance, operations, and infrastructure. 
	* As organizations grow, those functions might spin out into teams that are dedicated to each function.

* **Portfolio scope:** 
	* Centralized operations teams tend to focus on one landing zone or a small number of landing zones. 
	* Within those landing zones, the organization deploys foundational utilities to support a combination of workloads in each landing zone. 
	* This operations model tends to create scale challenges when the organization supports robust cloud foundations and multicloud portfolios.

* **Accountability (separation of duties):** 
	* In this operations model, central IT or central operations teams are typically accountable for all assets in production. 
	* Separation of duties tends to focus on environment isolation, which prevents workload-specific teams from interacting with production assets.

* **Standardization:** 
	* Standardization across workloads is likely high. 
	* However, as the portfolio grows to span multiple landing zones or multiple cloud platforms, that standardization might break down and require significant modifications to the environment.

* **Operations priority:** 
	* Organizations commonly use centralized operations when they consider their cloud operating model to be a secondary operating model. 
	* Because the existing on-premises or private cloud operations are the primary model, these organizations tend to carry forward existing operations tools and limit primary usage of modern cloud-first operations tools.

* **Platform development velocity:** 
	* Central operations teams typically need a start-small approach to address common utilities. 
	* Over time, the teams will focus on building best-of-breed solutions into the environment.

### Enterprise operations
An enterprise model is appropriate for customers who are migrating entire datacenters or large portfolios to the cloud.

Enterprise operations focus on a larger number of landing zones with foundational utilities centralized into a platform foundation.

* **Strategic priority:** 
	* The enterprise model focuses on democratizing decisions and delegated responsibilities to balance the need for innovation in some landing zones and tighter control in others. 
	* This is a strategic priority for large organizations that need to protect existing interests while empowering innovation to keep pace with market changes.

* **Organization:** 
	* Enterprise operations empower build-and-operate capabilities in each workload team. 
	* Workload teams are aligned by function, such as governance, security, and operations. 
	* A dedicated cloud center of excellence (CCoE) team unites the workload and supporting teams to coordinate activities and help ensure operational excellence across the cloud foundation.

* **Portfolio scope:** 
	* The scope of enterprise operations focuses on the holistic cloud foundation to ensure that foundational utilities are centralized and available to all landing zones. 
	* Landing zones and dedicated workload environments can then be deployed in a self-service capacity, with the cloud foundation providing all the required dependencies.

* **Accountability (separation of duties):** 
	* The CCoE team is responsible for maintaining the necessary centralized resources and creating visibility across the portfolio. 
	* Central operations or workload-specific operations teams are then accountable for the day-to-day support of the individual workloads.

* **Standardization:** 
	* Standardization is highest in this operating model. 
	* The centralized cloud foundation ensures consistency in the configuration of all areas of landing zone design. 
	* Sound best practices favor automated deployment for all workloads. 
	* This automation allows for further standardization at the workload and asset levels.

* **Operations priority:** 
	* An enterprise operating model requires a cloud-first approach to operations. 
	* First-party cloud-based tools are essential to maintaining centralized operations in the cloud. 
	* This type of model must look to the cloud as the primary operating model to be effective. 
	* The organization views existing on-premises operations as secondary operations and should include them in a long-term transition plan.

* **Platform development velocity:** To encourage centralization of governance, security, and operations across a fast-growing portfolio of workloads, the enterprise operations teams will require the implementation of an enterprise solution before adoption.

### Distributed operations
The distributed model is the most complex form of operations. It blends the other models.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-ready/media/complex-operations.png)

Companies commonly take this approach when they grow through rapid acquisition, resulting in a distributed mixture of the previous three operating models. 

Companies can exist in this state for extended periods. 

But to minimize redundancy and promote more efficient operations, they should consider developing a plan to transition to one of the less complex models.

* **Strategic priority:** 
	* Organizations use this model when they favor integration of acquired business units over innovation or control. 
	* This is often a temporary or bridge strategy that's required to move to a more efficient operating model in the future. 
	* This model tends to persist when the organization wants to maintain autonomy and is considering a near-term exit strategy, as is commonly seen in private equity or holding companies.

* **Organization:** 
	* A centralized structure for the organization is challenging to maintain in this operating model. 
	* It's wise for organizations to start with the formation of a CCoE virtual team early in the process to create visibility and awareness of operations around the organization.

* **Portfolio scope:** Distributed operations focus on a complex portfolio. Over time, that focus can narrow down to more granular levels of the portfolio.

* **Accountability (separation of duties):** Accountability will vary among business units. Separation of duties from a central perspective is hard to achieve.

* **Standardization:** 
	* The first step toward standardization in a distributed operations model is to gain a clear view of the digital estate for the full portfolio. 
	* A data-driven approach will start to identify commonalities in the portfolio that lean toward a centralized or enterprise operations model.

* **Operations priority:** 
	* Operations priority in this model is around data. 
	* Centralizing data by using tools designed for unified operations will allow a CCoE team to coach and mentor the various business units during transitions or maturity efforts. 
	* Before you force a consistent operations priority, evaluate the portfolio of workload operations to ensure proper tooling and baselines.

* **Platform development velocity:** 
	* Evaluation of the portfolio of workload operations should identify an acceptable velocity for platform development that aligns to start-small or enterprise-scale approaches. 
	* The primary data point to determine direction will depend on the most common approach to operations management across the portfolio.



## Design areas for Azure landing zones
Before you deploy an Azure landing zone, it's important to understand what you'll need from your cloud environment to support your chosen operating model.

### Design areas
Each implementation option for Azure landing zones provides a deployment approach and defined design principles. 

Before you choose an implementation option, you should carefully consider each design area. 

Your decisions affect the platform foundation on which each landing zone depends.

Design area | Objective | Relevant methodology
--- | --- | ---
[Azure billing and Active Directory tenant](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/azure-billing-ad-tenant) | Proper tenant creation, enrollment, and billing setup are important early steps. | Ready
[Identity and access management](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/identity-access) | Identity and access management is a primary security boundary in the public cloud. It's the foundation for any secure and fully compliant architecture. | Ready
Network topology and connectivity | Networking and connectivity decisions are an important foundational aspect of any cloud architecture. | Ready
[Resource organization](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org) | As cloud adoption scales, considerations for subscription design and management group hierarchy affect governance, operations management, and adoption patterns. | Govern

### Compliance design areas
Security, governance, and compliance are key topics when you're designing and building an Azure environment. 

These topics help you start from strong foundations and ensure that solid ongoing processes and controls are in place.

The tools and processes that you implement for managing environments play an important role in detecting and responding to issues. 

These tools work alongside the controls that help maintain and demonstrate compliance.

As the organization's cloud environment develops, these compliance design areas will be the focus for iterative refinement. 

This refinement might be due to new applications that introduce specific new requirements or to changing business requirements. 

For example, refinement might be in response to a new compliance standard.

Design area | Objective | Relevant methodology
--- | --- | ---
[Security](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/security) | Implement controls and processes to help protect your cloud environments. | Secure
[Management](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/management) | For stable, ongoing operations in the cloud, develop a management baseline to provide visibility and operations compliance, and to help protect and recover capabilities. | Manage
[Governance](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/governance) | Automate auditing and enforcement of governance policies. | Govern
[Platform automation and DevOps](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/platform-automation-devops) | Align the best tools and templates to deploy your landing zones and supporting resources. | Ready

### Process for design areas
The design areas describe what to consider before you deploy a landing zone. 

Together, they establish a process to aid in exploring otherwise complex topics. 

These topics are typically involved in making critical decisions about your environment. 

Evaluate each design area to help you understand any changes that you might need to make to the implementation options for Azure landing zones.

Evaluating each design area sequentially provides a process that simplifies the design of any complex environment. 

If you've already addressed one or more of the design areas to your satisfaction, move on to the next area.

In this process, you'll get a list of roles or functions that are typically required to make design decisions. 

You'll also see a series of considerations, recommendations, and scope boundaries to help shape the discussion and decision-making process.

You can implement these design areas over time so that you can grow into your cloud operating model. 

Review the methodologies related to each design area to understand in more detail the considerations and decisions involved with implementing a landing zone. 

These considerations include guidance to help align your journey to the conceptual architecture of Azure landing zones.

With an understanding of the modular design areas, your next step is to choose a landing zone implementation that best aligns with your cloud adoption plan and requirements.



## Design principles for Azure landing zones
The conceptual architecture for Azure landing zones is universally applied to any process or implementation of landing zones. 

At the foundation of the architecture is a set of core design principles that serve as a compass for subsequent design decisions across critical technical domains.

The principles help you strive for an optimum design of the target architecture. 

If you choose to deploy an Azure landing zone accelerator or any version of the enterprise-scale landing zone code base, build on the architecture by applying the design principles described here.

Using these principles as part of your implementation will serve as a useful guide for realizing the benefits of cloud technologies. 

This cloud-oriented perspective, often called cloud native, represents ways of working and technical options for your organization that legacy technology approaches typically don't offer.

### Impact of design deviations
There might be valid reasons to deviate from the principles. 

Organizational requirements might dictate specific outcomes or approaches in designing an Azure environment. 

In these cases, it's important to understand the impact that the deviation will have on the design and future operations. 

Carefully consider the tradeoffs outlined for each principle.

As a general rule, be prepared to balance requirements and functionality. 

Your journey to the conceptual architecture will evolve over time as requirements change and you learn from your implementation. 

For example, using preview services and taking dependencies on service roadmaps can remove technical blockers during adoption.

### Subscription democratization
Use subscriptions as a unit of management and scale to accelerate application migrations and new application development. 

Align subscriptions with business needs and priorities to support business areas and portfolio owners. 

Provide subscriptions to business units to support the design, development, and testing of new workloads and the migration of existing workloads.

To enable the organization to operate effectively at scale, support a subscription with a suitable [management group hierarchy](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-management-groups). 

This support will allow the subscription to be managed and organized efficiently.

#### Impact of deviation
One approach for implementing this principle is [decentralizing operations](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/operating-model/compare) by transitioning them to business units and workload teams. 

This approach allows workload owners to have more control and autonomy over their workloads within the guardrails that the platform foundation has established.

Customers who need [centralized operations](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/operating-model/compare), and who don't want to delegate control of production environments to workload teams or business units, might need to modify their [resource organization](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org) design and deviate from this principle.

The design of the conceptual architecture for Azure landing zones assumes a specific management group and subscription hierarchy for all operations management subscriptions. This assumption might not align with your [operating model](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/operating-model/define).

With this deviation, as your organization grows and evolves, your operational model might change. 

This change can lead to a migration of resources into separate subscriptions again, followed by complicated technical migrations. 

Before you commit to an approach, review the [Align](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/transition) guidance.

### Policy-driven governance
Use Azure Policy to provide guardrails and ensure continued compliance with your organization's platform and the applications deployed onto it. 

Azure Policy also provides application owners with independence and a secure path to the cloud.

### Impact of deviation
By not using Azure Policy to create guardrails within your environment, you increase the operation and management overhead of maintaining compliance. 

Azure Policy helps you restrict and automate your desired compliance state within your environment.

As part of your design considerations, review [how to use Azure Policy inside a landing zone implementation](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/dine-guidance).

### Single control and management plane
Avoid dependency on abstraction layers, such as customer-developed portals or tooling. 

We highly recommend having a consistent experience for both central operations and workload operations.

Azure provides a unified and consistent control plane that's subject to role-based access and policy-driven controls. 

This applies across all Azure resources and provisioning channels. 

You can use Azure to establish a standardized set of policies and controls for governing the entire enterprise estate.

### Impact of deviation
Choosing a multiple-vendor approach to operate control and management planes might introduce complexity of integration and feature support. 

Replacing individual components to achieve a "best of breed" design or multiple-vendor operations tooling might have limitations and cause unintended errors due to inherent dependencies.

For customers who are bringing an existing tooling investment to operations, security, or governance, we recommend a review of the Azure services and any dependencies.

### Application-centric service model
Focus on application-centric migrations and development rather than pure infrastructure lift-and-shift migrations, such as moving virtual machines. 

The design choices shouldn't differentiate between old and new applications, infrastructure as a service (IaaS) applications, or platform as a service (PaaS) applications.

Regardless of the service model, strive to provide a secure environment for all applications deployed on the Azure platform.

#### Impact of deviation
Segmenting workloads in a way that differs from the [implementation options](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/implementation-options) for management group hierarchy can create a complex policy and access control structure to govern your environment. 

Examples include deviation from the organizational hierarchy structure or grouping by Azure service. 

This tradeoff introduces the risk of unintentional policy duplication and exceptions, which add to operational and management overhead.

Another common approach that customers consider is the use of landing zones for dev/test/production workloads. 

For more information, see the FAQ question [How do we handle "dev/test/production" workload landing zones in enterprise-scale architecture?](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/faq#how-do-we-handle-devtestproduction-workload-landing-zones-in-enterprise-scale-architecture).

### Alignment with Azure-native design and roadmaps
Use Azure-native platform services and capabilities whenever possible. 

Align this approach with Azure platform roadmaps to ensure that new capabilities are available within your environments. 

Azure platform roadmaps should help inform the migration strategy and the conceptual trajectory of Azure landing zones.

#### Impact of deviation
Introducing third-party solutions into your Azure environment can create a dependency upon those solutions to provide feature support and integration with Azure services.

Sometimes, bringing existing third-party solution investments into an environment is inevitable. 

Consider this principle and its tradeoffs carefully, in alignment with your requirements.

### Recommendations
Be prepared to trade off functionality, because it's unlikely that everything will be required on day one. 

Use preview services and take dependencies on service roadmaps to remove technical blockers.

Keep in mind that not all aspects of the desired operating model will be in general availability when you're using this approach.



## Journey to the target architecture
Adopting cloud technologies is a journey. 

Business priorities and the need to bring new technologies online to unlock capabilities or features influence the speed at which an organization deploys and scales out a cloud environment.

Over time, the organization iterates and matures the deployed technologies, processes, and skills needed to progress toward that destination. 

The time for the journey depends on the size of the organization, the current technical footprint, and the maturity of skills within technical teams.

### On-ramps
Consider an analogy of a trip along a freeway. 

There might be multiple on-ramps that you can use to join the freeway, but the destination is the same. 

The following on-ramps represent where organizations are today in their cloud adoption plans. 

They also represent the specific guidance that you need to continue to develop the cloud environment.

On-ramp | Description | Further guidance
--- | --- | ---
Start | For organizations that are at the beginning of their cloud adoption journey (called greenfield) and want to implement a new cloud environment, based on best practices and proven architectural patterns. <br /> <br /> Start with the conceptual architecture of Azure landing zones to understand the recommended end state.  <br /> <br /> Next, explore each of the design areas. Use the areas to understand the considerations and decisions that you need to design and implement the landing zone that best fits your requirements. | [What is an Azure landing zone?](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/) <br /> <br /> [Azure landing zone design areas](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-areas)
Align | For organizations that have an existing environment that needs modification to align to the target architecture and best practices for an Azure landing zone (called brownfield). <br /> <br /> Use the transition from brownfield guidance to understand the decision points and technical approach to refactoring environments to align with the guidance in the Ready methodology. | [Refactor a landing zone](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/refactor) <br /> <br /> [Transition existing Azure environments to the Azure landing zone conceptual architecture](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/enterprise-scale/transition) <br /> <br /> [Scenarios: Transitioning existing Azure environments to the Azure landing zone conceptual architecture](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/align-scenarios)
Enhance | For environments that are already in line with best practices but the organization wants to add more controls or features. | Explore articles about enhancing the key ongoing processes for cloud environments, such as management, governance, and security. | [Enhance guidance for management](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/considerations/landing-zone-operations) <br /> <br /> [Enhance guidance for governance](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/considerations/landing-zone-governance) <br /> <br /> [Enhance guidance for security](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/considerations/landing-zone-security)

### Landing zone review
The [landing zone review](https://aka.ms/LandingZoneReview) helps you assess your current Azure environment. 

It also helps you get customized recommendations for remediating the current state to align with the conceptual architecture of Azure landing zones.

You can use the transition guidance from the output of the assessment, best practices, and automation guidance, export via Excel, and import to Azure DevOps.



## Choose an Azure landing zone option
Azure landing zones provide cloud adoption teams with a well-managed environment for their workloads. 

Each of the following options applies a predetermined set of design considerations for landing zones to provide an implementation and architecture to guide your environment configuration.

### Basic implementation option
For organizations where the conceptual architecture fits with the operating model and resource structure that they plan to use, there's a ready-made deployment experience called the Azure landing zone accelerator.

The accelerator is a deployment from the Azure portal that provides a full implementation of the conceptual architecture. 

It also provides opinionated configurations for key components such as management groups, policies. and management functions.

For each section of the deployment, the accelerator provides options for modifying the implementation to include or exclude specific capabilities, depending on what the business needs. 

This can enable organizations to start with a smaller footprint and add capabilities over time, in line with the methodologies in the Cloud Adoption Framework.

### Customized implementation options
Although the accelerator is the suggested starting point for all customers, it does assume full alignment with the conceptual architecture, adherence to the design principles, and tooling for cloud-native operations. 

For customers who need to customize their experience with Azure landing zones, the following implementation options might be a better fit:

* Azure landing zone Terraform modules are a third-party path for multicloud operating models. 
	* This path can limit Azure-first operating models. 
	* Review the [design principles](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/terraform-landing-zone#design-decisions?azure-portal=true) or [deploy](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/terraform-landing-zone#customize-and-deploy-your-first-landing-zone?azure-portal=true) this solution to your Azure environment.

* [Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep) is a domain-specific language (DSL) that uses declarative syntax to deploy Azure resources. 
	* In a Bicep file, you define the infrastructure that you want to deploy to Azure. 
	* You then use that file throughout the development lifecycle to repeatedly deploy your infrastructure. 
	* Your resources are deployed in a consistent way.
	* Bicep provides concise syntax, reliable type safety, and support for code reuse. 
	* It also offers an efficient authoring experience for your infrastructure-as-code solutions in Azure.

* Enterprise-scale Azure Resource Manager (ARM) templates can be deployed and customized by infrastructure teams as part of infrastructure-as-code pipelines to deliver the full conceptual architecture.

For more detail, see [Interactive guide: Prepare your cloud environments with Cloud Adoption Framework](https://mslabs.cloudguides.com/en-us/guides/Cloud%20Adoption%20Framework).

### Partner implementation options
Configuration of your cloud environment can be one of the biggest enablers for cloud success. 

It can also be one of the biggest blockers if the configuration is misaligned with how you want to operate workloads in the cloud. 

If the success of your adoption project is critical and your team isn't sure how to proceed, [consult with a Microsoft partner](https://www.microsoft.com/azure/partners/adopt?filters=ready).

Many of the top Microsoft partners provide offerings aligned to the Ready methodology of the Cloud Adoption Framework. 

Those offerings typically include a partner's own customized implementation of an Azure landing zone.

Before you engage a partner, review the [guide to evaluating partner implementation options for Azure landing zones](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/partner-landing-zone).



## Enhance your landing zone
No single implementation option for an Azure landing zone can meet all of your needs. 

To reach true scale in the cloud, you'll need to keep investing in your Azure landing zones to reach operating model requirements for governance, security, and operations management.

This unit builds on the principles of landing zone refactoring. 

As outlined in the article [Refactor landing zones](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/refactor), a refactoring approach to infrastructure as code removes blockers to business success while minimizing risk. 

That article assumes you've deployed your first landing zone and now want to expand that landing zone to meet enterprise requirements.

### Shared architecture principles
Expanding your landing zone provides a code-first approach to embedding the following principles into the landing zone and more broadly into your overall cloud environment:

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-ready/media/shared-architecture-principals.png)

[Azure Advisor](https://learn.microsoft.com/en-us/azure/advisor/advisor-overview), the [Microsoft Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/architecture/framework/), and the solutions in the [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/) share these same principles.

### Applying these principles to your landing zone improvements
To better align with the methodologies of the Cloud Adoption Framework, the preceding principles can be grouped into actionable improvements for landing zones:

* **Basic considerations:** Refactor a landing zone to refine hosting, fundamentals, and other foundational elements.
* **Operations expansions:** Add operations management configurations to improve performance, reliability, and operational excellence.
* **Governance expansions:** Add governance configurations to improve cost, reliability, security, and consistency.
* **Security expansions:** Add security configurations to improve protection of sensitive data and critical systems.

The Cloud Adoption Framework and its associated Learn modules for [Govern](https://learn.microsoft.com/en-us/training/modules/cloud-adoption-framework-govern/), [Manage](https://learn.microsoft.com/en-us/training/modules/cloud-adoption-framework-manage/), and [Secure](https://learn.microsoft.com/en-us/training/modules/cloud-adoption-framework-security/) address each of these requirements in parallel methodologies. 

For more information, see the [Journey toward the target architecture](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/landing-zone-journey) article.

