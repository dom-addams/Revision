# _Migrate to Azure through repeatable processes and common tools_
The Migrate methodology in the Cloud Adoption Framework guides you through migration to Azure by using repeatable processes and common tools.

Learning objectives:

* Understand the tools commonly used in migration
* Learn about the migration processes required to migrate effectively
* Demonstrate a migration (hands-on if possible)
* Understand options for properly migrating various platforms and workloads
* Choose the best learning path to continue on with migrating a specific platform or workload

## Migration process
Migration is a highly repeatable process. 

Today, you have a collection of binary assets (virtual machines, applications, and data) in a local datacenter. 

Tomorrow, you want to replicate those binary assets to the cloud and shift your production traffic to use the new copy of the same assets.

Like most repeatable processes, most of the work can be automated to reduce repetitive human tasks. 

But, as most migration teams quickly discover, the repeatable process is the easy part. 

Hidden within this process is a change-management effort that requires decisions and human intervention.

The following disciplines of migration outline how the Azure Migrate tool and the Cloud Adoption Framework work together to shape the required human intervention into a repeatable process.

### Mass migration versus iterative migration
The binary assets moving to the cloud can theoretically be migrated in one large batch. 

Some organizations have been successful in mass migrations of all assets by using Azure Migrate. 

Doing so requires a planned effort of analysis and remediation to ensure that all assets are compatible with the cloud. 

It also requires a detailed plan to test and certify performance for each of the workloads that run on those assets.

The degree of planning and the impact on business users make the mass-migration approach unattractive for most organizations. 

An alternative approach is to apply the principles of agile methodologies, such as Scrum, to break down the mass migration into waves: migrating a smaller collection of workloads on a regular cadence.

The iterative approach to migration allows the business to absorb the changes in smaller units and produces less business disruption. 

It also allows the team to measure and learn from each iteration. 

The team can gain speed and expertise progressively from one iteration to the next.

### Disciplines
In any iterative migration process, the team completes three sets of tasks or disciplines to migrate each workload to Azure successfully:

* **Assess workloads:** 
	* While assessing the workloads in each wave, the architects primarily look for cloud compatibility and dependencies between assets. 
	* They also look for compatibility with modernization and optimization opportunities. 
	* At times, they get close to the architecture of individual workloads to perform advanced optimization tasks using the Azure Well-Architected Review.

* **Deploy workloads:** 
	* During migration, or deployment, of workloads, the team uses a migration tool to complete the replication of assets (virtual machines, applications, and data) to the cloud. 
	* In this step, the team is mainly directing and supervising the repeatable process to ensure accurate replication of the assets for the selected workloads.

* **Release workloads:** 
	* After each technology platform and workload is migrated to the cloud, the team needs to test, optimize, and release production traffic to its newly migrated workloads. 
	* Testing might also require an evaluation of user routing and optimization of the network path to the newly deployed workloads.

Repeating these three disciplines for each workload in the migration plan helps ensure a successful migration to the cloud.

### Sprint planning
When planning migration efforts, one of the first steps is to break down the list of workloads to be migrated into smaller groups.

As you learn about your team's velocity (how many workloads they can move in a sprint), we suggest starting with the [Power of 10](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/digital-estate/rationalize#release-planning) approach. 

In that approach, you consistently define groups of 10 common workloads in each wave. 

Then, you map those groups of 10 workloads to two-week iterations or sprints by using your cloud-adoption plan in Azure DevOps. 

Reference the [Planning module](https://learn.microsoft.com/en-us/training/modules/cloud-adoption-framework-plan/) for step-by-step guidance.

Before each sprint, the migration team should evaluate the next wave of workloads to be migrated. 

The objective of this evaluation is to ensure that the team has all of the necessary information and access to be successful in the current sprint. 

It also gives the team a chance to adjust the next 10 workloads based on what it's learned from past sprints. 

After the team is committed to the sprint, the actual work can begin.

### Team organization
You can apply basic organizing principles to your team structure to maximize the output of each sprint based on available velocity. 

The two most common forms of team organization are:

* **Self-organizing teams:** 
	* This type of organization aligns with agile methodologies. 
	* Self-organizing teams ensure that the members of the migration team can collectively deliver on each of the disciplines. 
	* In each sprint, the team identifies who performs the tasks associated with each discipline across each workload in the wave.

* **Migration factory:** 
	* The repetitive nature of the migration disciplines lends them to a division of labor across highly specialized teams. 
	* In this approach, one team is dedicated to each migration discipline. 
	* The assessment team is always one to two waves ahead of the migration team. 
	* The release team is always one to two sprints behind the migration team.

This approach can be effective in large migration efforts that include thousands of assets and hundreds of workloads.

### Common blockers
Technology seldom blocks the migration process. 

Most of the blockers to migration come from steps missed in upstream or downstream dependencies on the migration process. 

The following blockers are listed from most common to least common:

* **Strategy and planning:** 
	* The most common blocker to a successful migration stems from missed steps during strategy or planning efforts. 
	* Failure to set the right expectations with executives, project managers, or technical staff can create blockers, even when all of the technical disciplines are running as planned.
	* Before beginning any migration effort at scale, ensure that you've created a [cloud-adoption strategy](https://learn.microsoft.com/en-us/training/modules/cloud-adoption-framework-strategy/) and [cloud-adoption plan](https://learn.microsoft.com/en-us/training/modules/cloud-adoption-framework-plan/), and that stakeholders have reviewed them.

* **Environmental:** 
	* Improperly configured environments are the next most common blocker to migration success. 
	* Specifically, the migration effort requires a minimum of networking and identity configuration for proper connectivity and access requirements.
	* For most migration efforts, governance and operations considerations should be addressed early, if not before the migration process. 
	* To ensure proper environmental configuration, reference the Cloud Adoption Framework Learn module on [preparing your environment](https://learn.microsoft.com/en-us/training/modules/cloud-adoption-framework-ready/).

* **Governance**: 
	* Most organizations have requirements for cost, security, consistency, and identity management that go beyond basic environment configuration.
	* Many organizations don't understand those requirements until they try to migrate production traffic to the cloud.
	* It's recommended that all migration teams review the Learn module for the [Govern methodology](https://learn.microsoft.com/en-us/training/modules/cloud-adoption-framework-govern/) in the Cloud Adoption Framework before beginning a scale migration effort. 
	* Reviewing this information can help avoid late-bound surprises.

* **Operations:** 
	* Most organizations have set operations requirements for their production workloads in the current datacenter. 
	* It's often assumed that those operations requirements work when the production traffic is moved to the cloud. 
	* Before the migration team begins any scale migration effort, it should review the Learn module about developing a clear strategy to understand basic expectations about operations management in the cloud.

* **Technical:** 
	* Occasionally, workloads might be blocked because of increased needs in remediation, modernization, or changes to the rationalization strategy. 
	* When individual workloads are blocked, you can address them by technical spikes, which remove problematic workloads from the standard flow.
	* Usually, a separate team addresses technical spikes in a parallel sprint.
	* A migration team can address many technical issues around remediation and modernization. 
	* The Cloud Adoption Framework migration scenarios shared at the end of this module cover these issues.

When a workload requires comprehensive changes that affect the application architecture, workload teams should review the [Well-Architected Framework](https://learn.microsoft.com/en-us/training/modules/azure-well-architected-introduction/) Learn module for more guidance.



## Migration tools
Azure includes tools to facilitate the disciplines or phases of the migration process: assess workloads, migrate workloads, and release workloads ("cut over"). 

Those tools start with Azure Migrate, but they also include integrated Microsoft and partner tools.

### Azure Migrate
Azure Migrate provides a unified migration platform: a single portal to start, run, and track your migration to Azure. 

In the Azure Migrate hub, you can assess and migrate:

* Servers, databases and web apps: Assess on-premises servers including web apps and SQL Server instances and migrate them to Azure.
* Databases: Assess on-premises SQL Server instances and databases to migrate them to an SQL Server on an Azure VM or an Azure SQL Managed Instance or to an Azure SQL Database.
* Web applications: Assess on-premises web applications and migrate them to Azure App Service and Azure Kubernetes Service.
* Virtual desktops: Assess your on-premises virtual desktop infrastructure (VDI) and migrate it to Azure Virtual Desktop.
* Data: Migrate large amounts of data to Azure quickly and cost-effectively using Azure Data Box products.

### Integrated tools
The Azure Migrate hub includes the following tools. These tools help facilitate the technical aspects of each discipline or phase of the migration.

Tool | Assess and migrate | Details
--- | --- | ---
Azure Migrate: Discovery and assessment | Discover and assess servers including SQL and web apps | Discover and assess on-premises servers running on VMware, Hyper-V, and physical servers in preparation for migration to Azure.
Migration and modernization | Migrate servers | Migrate VMware VMs, Hyper-V VMs, physical servers, other virtualized servers, and public cloud VMs to Azure.
Data Migration Assistant | Assess SQL Server databases for migration to Azure SQL Database, Azure SQL Managed Instance, or Azure VMs running SQL Server. | Data Migration Assistant is a stand-alone tool to assess SQL Servers. <br /> <br /> It helps pinpoint potential problems blocking migration. <br /> <br /> It identifies unsupported features, new features that can benefit you after migration, and the right path for database migration.
Azure Database Migration Service | Migrate on-premises databases to Azure VMs running SQL Server, Azure SQL Database, or SQL Managed Instances | This tool enables a seamless migration from multiple database sources to Azure data platforms with minimal downtime.
Movere | Assess servers | This tool provides data and insights for planning cloud migrations.
Web app migration assistant | Assess on-premises web apps and migrate them to Azure. | Azure App Service Migration Assistant is a standalone tool to assess on-premises websites for migration to Azure App Service. Use Migration Assistant to migrate .NET and PHP web apps to Azure.
Azure Data Box | Migrate offline data | Use Azure Data Box products to move large amounts of offline data to Azure.

> If you're in Azure Government, external integrated tools and independent software vendor (ISV) offerings can't send data to Azure Migrate projects. You can use tools independently.

### Discovery and Assessment
Here are more details about what the Discovery and Assessment tool in Azure Migrate does:

* **Azure readiness:** Assesses whether on-premises machines are ready for migration to Azure.
* **Azure sizing:** Estimates the size of Azure VMs or the number of Azure VMware nodes after migration.
* **Azure cost estimation:** Estimates costs for running on-premises servers in Azure.
* **Dependency analysis:** Identifies cross-server dependencies and optimization strategies for moving interdependent servers to Azure.

The Discovery and Assessment tool uses a lightweight Azure Migrate appliance that you deploy on-premises. 

The appliance runs on a VM or physical server. 

You can install it easily by using a downloaded template.

The appliance discovers on-premises machines. 

It also continually sends machine metadata and performance data to Azure Migrate. 

The discovery is agentless. Nothing is installed on discovered machines.

After appliance discovery, you can gather discovered machines into groups and run assessments for each group.

### ISV integration
Azure Migrate also integrates with these ISV offerings:

ISV | Feature
--- | ---
Carbonite <br /><br /> Cloudamize <br /><br /> CloudSphere <br /><br /> Corent Technology <br /><br /> Device42 <br /><br /> Lakeside <br /><br /> RackWare <br /><br /> Turbonomic <br /><br /> UnifyCloud <br /><br /> Zerto | Migrate servers. <br /><br /> Assess servers. <br /><br /> Assess servers. <br /><br /> Assess and migrate servers. <br /><br /> Assess servers. <br /><br /> Assess VDI. <br /><br /> Migrate servers. <br /><br /> Assess servers. <br /><br /> Assess servers and databases.  <br /><br /> Migrate servers.



## Common tech platforms
During any organization's migration, you need to be prepared for various technology platforms. 

Most migrations start with Windows and SQL Server assets, but most datacenters in operation today also have several non-Windows-based platforms.

This unit outlines Microsoft's unified migration approach. 

This approach ensures that all workloads have a clear path to cloud migration, regardless of the underlying technology platform.

### Unified migration focus
Most migration teams are aware of the capabilities of Azure Migrate and the Azure Migrate hub to facilitate migration of Windows and SQL Server assets. 

But before you begin a migration, it's important to familiarize yourself with the other technology platforms that can use the same migration factory approach or the same migration process.

The following diagram and table outline several scenarios that follow the same iterative Migrate methodology for migration and modernization. 

The summary at the end of this module includes links for continued learning on each of these technology platforms.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/cloud-adoption-framework-migrate/media/one-migrate.png)

Virtual machines	| Applications | Data | Hybrid | Technology platforms | Additional scenarios
--- | --- | --- | --- | --- | ---
Servers running Windows Server | ASP.NET | SQL Server | Azure Stack | SAP (classic and HANA) | Secure workloads
Linux servers | Java | Open-source systems (OSS) databases | VMware | Kubernetes | Multitenant environments
Virtual desktops | PHP | Analytics | Mainframes | NetApp

### Preparing for common tech platforms
Each technology platform might have subtle differences in how the migration should be executed. 

This unit can help you understand the ways a technology platform might affect your migration at a high level.

Here are a few examples to illustrate the impact:

* Assess workloads: 
	* During assessment of the workloads in each wave, the architects are looking primarily for Azure compatibility and dependencies between assets. 
	* However, they should also look for compatibility with modernization and optimization opportunities.

* Deploy workloads:
	* During migration, or deployment as it's also known, the team primarily uses the Azure Migrate tool to migrate the assets such as VMs, applications, and data to Azure. 
	* Some technology platforms might require complimentary tooling.

* Release workloads: 
	* After each technology platform and workload is migrated to Azure, the team will need to test, optimize, and release production traffic to its newly migrated workloads. 
	* Some platforms might require a bit of diversity in the monitoring tools to help the team gain clarity and get visibility into workload operations.

### Preparing for diverse tech platforms in your sprint plan
The same methodology applies to each of these technology platforms. 

During initial cloud-adoption planning, little effort is applied to prepare for these differences. 

The individual technology platforms typically don't materially affect that level of planning.

However, there are subtle differences in the underlying tasks required to be successful with some of these platforms. 

Those differences are addressed in the following critical planning activities, which aid in sprint planning:

* **Priority alignment:** The overall cloud-adoption plan outlines the sequence of workloads to be migrated based on the business impact, but the priority must also consider the team's ability to execute.

* **Modernization review:** If your migration groups all three task areas (assess, deploy, and release) into a single migration team and single migration sprint, then you should include a modernization review into each sprint plan.



## Migration and modernization
In this unit, you review Azure Migrate and how to use it to migrate specific workloads to Azure.

### Virtual machine replication
You can add migration and modernization to your Azure Migrate dashboard, which carries over machines and insights from the assessment completed during the Cloud Adoption Framework planning module. 

You can begin your replication by selecting Replicate in the tool window.

Azure Migrate performs concurrent replication for up to 500 virtual machines (VMs) and can manage up to 200 concurrent migrations. 

If you need to do more, we recommend that you create multiple batches. 

Times for replication vary based on the number and size of VMs, along with connection speeds between your datacenter and Azure.

During the replication setup phase, you can use the migration settings for Azure Virtual Machines sizes that your Azure Migrate assessment suggested. 

Or, you can specify the settings yourself. 

This step gives you the option to configure the VM size and storage-disk settings that you feel are appropriate to the workload being migrated.

Also at this stage, you're asked to specify the subscription, resource group, and virtual network where your VMs will reside after migration. 

You can also configure availability options such as Availability Zones or availability sets, which help to protect your applications and data from datacenter outages and maintenance events.

After you start the replication, you can track and monitor the replication of each of your VMs.

### Testing migrated virtual machines
After all your targeted VMs are replicated and migrated into Azure, and before you migrate them into production, you can test them to ensure that everything works. 

The process runs a prerequisite check, prepares for the test, creates a new test VM, and starts the test. 

This process takes a few minutes.

The test migration functionality in Azure Migrate runs without affecting on-premises machines. 

It allows you to test the migration process, perform any app testing, and address any issues before a full migration.

Testing your migration is a great feature that helps you become comfortable with the migration process. 

It also helps you understand any tasks that should happen after migration. 

You can carry out this test migration as many times as you need in order to refine the process and confirm the steps.

> After the test migration, clean up the test resources to ensure that you don't incur any additional costs.

### Migrating the virtual machines into production
When you're ready for the production migration, select Migrate from the Replicating machines page of the Azure admin center.

The process prompts you to shut down the machine before migration, which is an optional stage. 

If you shut down the machine, Azure Migrate performs a planned migration with zero data loss (minimum data loss if you're using agent-based replication for the machine). 

If you choose not to shut down the machine, a final sync will be performed before the migration, but any changes that happen on the machine after the final sync is started aren't replicated.

Terminating the source machine is an important step, but you should evaluate which option is best suited to each workload.

Because this step might affect production systems, migration should be completed during off-peak hours to minimize disruption to the business.

Now, Azure Migrate runs through the production migration process. 

You can check the status as it validates the prerequisites, prepares for migration, creates the Azure VM, and starts the Azure VM.

### Release tasks
After the migration, you can release production traffic to the VM by rerouting network traffic to it. 

Before you reroute traffic, evaluate the workloads to ensure that each has a completed business-change plan, technical validation, and business validation.

**Business change plan:** Ensure that the following aspects of the business change plan are properly communicated to avoid business disruption:

* Complete (or at least plan) user training.
* Communicate about any outage windows and get approval.
* Synchronize production data and have users validate it.
* Validate promotion and adoption timing. Ensure that timelines and changes have been communicated to users.

**Technical validation:** In addition to the business change plan, consider validation of the technical readiness for your workloads. Here are a few suggested tests to complete:

* Network isolation testing. 
	* Test and monitor network traffic to ensure proper isolation and no unexpected network vulnerabilities. 
	* Validate that any network routing to be severed during cutover isn't experiencing unexpected traffic.

* Dependency testing. Ensure that all workload application dependencies have been migrated and are accessible from the migrated assets.

* Business continuity and disaster recovery (BCDR) testing. 
	* Validate that any service-level agreements (SLAs) for backup and recovery are established. 
	* If possible, perform a full recovery of the assets from the BCDR solution. 
	* At minimum, you should add a backup schedule by using Azure Backup. 
	* For more advanced SLAs, you might also want to consider replication to a second region by using Azure Site Recovery.

* User route testing. Validate traffic patterns and routing for user traffic. Ensure that network performance aligns with expectations.

* Final performance check. Ensure that users have completed and approved performance testing. Execute any automated performance testing.

* Additional technical readiness.
	* Restrict network access for unused services by using network security groups. 
	* Deploy Azure Disk Encryption to secure the disks from data theft and unauthorized access.

**Final business validation:** After the business change plan and technical readiness have been validated, the following final tasks can complete the business validation:

* **Cost validation (plan versus actual).** Testing is likely to produce changes in sizing and architecture. Ensure that deployment pricing still aligns with the original plan.

* **Communicate and execute cutover plan.** Prior to cutover, communicate the cutover and execute accordingly.

Complete cleanup tasks for the remaining on-premises servers. 

Such tasks might include removing the servers from local backups and removing their raw disk files from storage-area network (SAN) storage to free up space. 

Update documentation related to the migrated servers to reflect their new IP addresses and locations in Azure.

After the final task in the preceding list is completed, the VM and supported workload are considered released. 

The final phase or discipline of migration is now finished for that workload.

