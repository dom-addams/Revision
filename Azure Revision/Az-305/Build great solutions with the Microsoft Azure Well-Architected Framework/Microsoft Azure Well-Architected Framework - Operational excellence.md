# Microsoft Azure Well-Architected Framework - Operational excellence
Learn how to design an Azure architecture that uses modern practices and gives you full visibility into what's happening in your environment.

Learning objectives:

* Apply modern practices to design, build, and orchestrate resources on Azure
* Gain operational insights by using monitoring and analytics
* Reduce effort and error by using automation
* Identify issues and improve quality in your application by using tests

## Design, build, and orchestrate with modern practices
Development and operational practices have evolved over the years to become more seamless and integrated. 

Modern practices involve organizational shifts and adopting new tooling in order to improve an organization's operational agility. 

In this unit, you learn some of the key concepts to improving your organization's ability to build and deploy applications.

### DevOps
DevOps is the union of people, processes, and products to enable continuous delivery of value to end users. 

DevOps focuses on bringing the development and operations functions together and breaking down the existing barriers between them. 

This combination creates multidisciplinary teams that work together with shared and efficient practices and tools. 

Essential DevOps practices include agile planning, continuous integration, continuous delivery, and monitoring of applications.

The DevOps culture stresses small, multidisciplinary teams that work autonomously and take collective accountability for how end users experience their software. 

DevOps teams apply agile practices and include operations in each team's responsibilities. 

Teams work in small batches that focus on improving the end-to-end delivery of customer value, and they strive to eliminate waste and impediments along the way. 

There are no silos and no blame games, because each team is mutually accountable.

There are several services and tools available from Microsoft to help an organization adopt and develop DevOps practices. 

Azure DevOps is a suite of products and tools that teams adopting DevOps practices can use to plan, develop, deliver, and operate their solutions.

Azure Boards is a part of Azure DevOps that helps teams plan and track work. 

Azure Boards has modern agile tools like Kanban boards, backlogs, dashboards, and scrum boards. 

These tools help your team get greater visibility into the work that's planned and work that's been delivered.

GitHub is the most widely used platform to build, deliver, and share software. 

At its core, GitHub is a version-control platform that allows a global community of individuals and teams to collaborate on software-development projects. 

These projects can be kept private within an organization or shared through public communities of disparate software developers. 

GitHub also includes features to build and test deployments, track issues, and create custom workflows in your repositories.

Azure DevOps and GitHub integrate together, and organizations that are operating or adopting a DevOps model often use these services together.

### Continuous Integration and Continuous Delivery (CI/CD)
Continuous Integration (CI) is the practice of building and testing code every time a team member commits changes to version control. 

CI encourages developers to share their code and unit tests by merging their changes into a shared version-control repository after every small task completion. 

Committing code triggers an automated build system to grab the latest code from the shared repository, and then build, test, and validate the full main branch.

CI helps developers to identify bugs earlier, and it improves software quality since code is checked in, built, and verified more frequently. 

Instead of working on code for a month and discovering numerous issues when changes are eventually checked in. 

Developers can check in smaller sets of changes and be confident that their code doesn't introduce large volumes of issues into the main branch.

Continuous Delivery (CD) is the process to build, test, configure and deploy from a build environment to a production environment. 

Multiple testing or staging environments create a release pipeline to automate the creation of a new build's infrastructure and deployment. 

Successive environments support progressively longer-running activities of integration, load, and user-acceptance testing.

Continuous integration and continuous delivery are often combined into a single pipeline known as CI/CD. 

Continuous integration starts the continuous delivery process. 

The CI/CD pipeline stages changes from each successive environment to the next upon successful completion of the tests that are defined at each stage. 

As a developer, you can check in code and validate that it passes all tests and introduces no new issues into the main branch. 

Then, you can roll it out to production with the confidence that it doesn't affect the operation of your production environment.

Azure Pipelines is a cloud service you can use to automatically build and test your code project and make it available to others. 

It works with just about any language or project type, and integrates with GitHub, GitHub Enterprise, Azure Repos, and other version-control systems. 

Azure Pipelines combines continuous integration (CI) and continuous delivery (CD) to constantly and consistently test and build your code and ship it to any target.

You can also use GitHub Actions to build CI/CD capabilities in your GitHub repositories. With GitHub Actions, you can build workflows that are custom automated processes to build, test, package, release, and deploy code.

### Microservices
A microservices architecture consists of services that are small, independent, and loosely coupled. 

You can deploy and scale each service independently. Microservice architectures are often adopted for new applications that are adopting DevOps practices.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-operational-excellence/media/2-microservices-logical.svg)

A microservice is small enough that a single, small team of developers can write and maintain it. 

Because services can be deployed independently, a team can update an existing service without rebuilding and redeploying the entire application.

Each service is typically responsible for its own data. 

Its data structure is isolated, so upgrades or changes to schema aren't dependent on other services. 

Requests for data are typically handled through APIs and provide a well-defined and consistent access model. 

Internal implementation details are hidden from service consumers.

Because each service is independent, services can use different technology stacks, frameworks, and SDKs. 

It's common to see services rely on REST calls for service-to-service communication by using well-defined APIs instead of RPC or other custom communication methods.

Microservice architectures are technology agnostic, but you often see containers or serverless technologies used for their implementation. 

Continuous deployment and continuous integration (CI/CD) is frequently used to increase the speed and quality of development activities.

### Environment consistency
A key piece of ensuring that you can develop and deploy applications with confidence is making sure that your environments are consistent between development, test, and production.

As your CI/CD processes move your code through your environments, any variation risks introducing areas where testing can fail or overlook defects. 

Through automation, you can spin up and tear down environments as needed, which you can include as part of your CI/CD processes.

Imagine an environment where you're building a .NET Core application, and your test and production environments are running different versions. 

Your deployment may succeed in your test environment but cause issues in your production environment because it's running a different version of your application.

Including your environment definitions as part of your deployment helps ensure that your code is built and deployed on a consistent, end-to-end infrastructure.



## Use monitoring and analytics to gain operational insights
Let's say that you run an operations team that's responsible for resources running on Azure. 

What would you do to ensure you have visibility into the health of your systems? If something happens, who finds out first? Your team or your end users?

Monitoring is the act of collecting and analyzing data from your systems. 

You then use that data to determine the performance, health, and availability of your business applications and the resources on which they depend. 

An effective monitoring strategy helps you focus on the health of your application. 

It also helps you increase your uptime by proactively notifying you of critical issues so that you can resolve them before they become problems.

When it comes to monitoring and analytics on Azure, we can bundle services into three specific areas of focus:

* Core monitoring
* Deep infrastructure monitoring
* Deep application monitoring

In this unit, we examine each of these bundles, and you learn how Azure services enable these capabilities for your architecture. 

Even though we've grouped these services together, there are several integration points between them, which allows you to share important monitoring data points among them. 

The following illustration shows the available monitoring services assembled into logical groups.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-operational-excellence/media/3-monitoring-products-overview.png)

### Core monitoring
Core monitoring provides fundamental, required monitoring across Azure resources. 

When we talk about fundamental monitoring, you can think of it as monitoring what's happening with your resources at the Azure platform level. 

This area of focus gives you insight into things like the health of the Azure platform, changes being made to your resources, and performance metrics. 

Using services from this area lets you monitor the basic pieces you need to keep your application running.

Azure provides services to give you visibility into four key core monitoring areas: activity logging, the health of services, metrics and diagnostics, and recommendations on best practices.

These services are built into Azure and take little to no configuration to enable and set up. Let's take a closer look at each of these services.

#### Activity logging
Activity logging is an incredibly important source of information about what's happening with your resources at the Azure platform level. 

Every change submitted to the Azure platform is tracked in the Azure Activity Log, which gives you the ability to trace any action taken on your resources. 

The Activity Log contains detailed information on activities to help you answer questions like:

* Who attached a disk to this virtual machine?
* When was this machine shut down?
* Who changed the load balancer configuration?
* Why did the autoscale operation on my Virtual Machine Scale Set fail?

Using Activity Log to answer these types of questions helps you troubleshoot issues, track changes, and provide auditing of what's happening in your Azure environment. 

Activity Log data is only retained for 90 days, although you can archive your data to a storage account, or you can send your data to Azure Log Analytics for longer retention and further analysis.

#### Health of cloud services
Any system can have issues at some point, and that's true for Azure services as well. 

Staying informed of the health of Azure services helps you understand if and when an issue that's impacting an Azure service is impacting your environment. 

What may seem like a localized issue could be the result of a more widespread issue, and Azure Service Health provides this insight. 

Azure Service Health identifies any issues with Azure services that might affect your application. 

Service Health also helps you plan for scheduled maintenance.

#### Metrics and diagnostics
For issues that are more localized in nature, it's important to have visibility into what's happening on your system or service instance. 

The ability to view metrics and diagnostic information is critical for troubleshooting performance issues and staying notified when something goes wrong. 

To provide this visibility, Azure services have a common way of showing health, metric, or diagnostic information. 

Azure Monitor enables core monitoring for Azure services by allowing the collection, aggregation, and visualization of metrics, activity logs, and diagnostic logs.

Metrics are available that provide performance statistics for different resources, and even the operating system inside a virtual machine. 

You can view this data with one of the explorers in the Azure portal, and create alerts based on these metrics. 

Azure Monitor provides a fast metrics pipeline, so you should use it for time-critical alerts and notifications.

#### Recommendations on best practices
When we think of monitoring, we typically think of the current health of a resource. 

But even when a resource is healthy, there could be adjustments that would result in greater availability, reduced cost, or improved security. 

Azure Advisor can help by keeping an eye out for potential performance, cost, high availability, or security issues within your resources. 

Advisor makes personalized recommendations based on resource configuration and telemetry and provides you with guidance that most traditional monitoring platforms don't provide.

### Deep infrastructure monitoring
While the monitoring components we've covered thus far are great at offering insights, they only give visibility to the Azure platform. 

For typical IaaS workloads, there's more diagnostic information and metrics to gather from the network or the actual operating systems. 

For example: Log Analytics can provide deep insights by pulling information from SQL Server to ensure it's properly configured, analyzing free disk space across all the servers in your environment, or visualizing the network dependencies between your systems and services.

When you're designing a monitoring strategy, it's important to include every component in the application chain so you can correlate events across services and resources. 

You can easily configure services that support Azure Monitor to send their data to a Log Analytics workspace. 

Virtual machines (both in the cloud and on-premises) can have an agent installed to send data to Log Analytics. 

You can submit custom data to Log Analytics through the Log Analytics API. 

The following illustration shows how Log Analytics acts as a central hub for monitoring data. 

Log Analytics receives monitoring data from your Azure resources and makes that data available to consumers for analysis or visualization.

![IMAGE](https://learn.microsoft.com/en-gb/training/modules/azure-well-architected-operational-excellence/media/3-collecting-data.png)

With this data in Log Analytics, you can query the raw data for troubleshooting, root-cause identification, and auditing purposes. 

For several known services, like SQL Server and Windows Server Active Directory, there are readily available management solutions that visualize monitoring data and uncover compliance with best practices.

Log Analytics allows you to create queries and interact with other systems based on those queries. 

The most common example is an alert. 

Maybe you want to receive an email when a system runs out of disk space, or when a best practice on your SQL Servers is no longer being followed. 

Log Analytics can send alerts, kick off automation, and even hook into custom APIs.

### Deep application monitoring
It's important to understand how core services and infrastructure are performing, but you can take your monitoring capabilities even further. 

By using an application performance-management tool to look deep into your applications, you can identify performance issues, usage trends, and the overall availability of services you develop and depend on. 

Allowing you to better detect and diagnose issues that occur within your web apps and services.

Azure Application Insights allows you to do exactly that. 

Application Insights provides telemetry collection, query, and visualization capabilities. 

Instrumenting this level of monitoring requires little to no code changes; you only have to install a small instrumentation package into your application. 

Application Insights is cross platform, supporting .NET, Node.js, or Java.

For instance, the response time for one of your applications might be complex to troubleshoot. 

Application performance monitoring solutions can help uncover the underlying issues that basic metric monitoring can't expose.

An application performance-monitoring solution helps you monitor usage, performance, and availability, allowing you to respond to failure faster, and should be included in any monitoring strategy.



## Use automation to reduce effort and error
Managing the infrastructure for any type of workload involves configuration tasks. 

You can do this configuration manually, but manual steps don't scale well; in addition, they can be labor-intensive, prone to error, and inefficient. 

What if you're assigned to lead a project that requires the deployment of hundreds of systems on Azure? How would you build and configure these resources? How long would this take? Could you ensure that each system is configured properly, with no variance between systems?

By using automation in your architecture design, you can work past these challenges. In this unit, you learn about some of the ways you can automate on Azure.

### Infrastructure as code
Infrastructure as code (IaC) is the management of infrastructure in a descriptive model. 

IaC uses a versioning system, similar to what's used for source code. 

The code in an IaC model describes infrastructure such as networks, virtual machines, load balancers, and connection topology. 

When you're creating an application, the same source code generates the same binary every time it's compiled. 

In a similar manner, an IaC model generates the same environment every time it's applied. 

IaC is a key DevOps practice, and it's often used with continuous delivery.

IaC evolved to solve the problem of environment drift. 

Without IaC, teams must maintain the settings of individual deployment environments. 

Over time, each environment becomes a snowflake that is increasingly unique and can't be reproduced automatically. 

The administration and infrastructure maintenance of these snowflake environments involves manual processes that are hard to track and that contribute to errors. 

The resulting inconsistencies between these snowflake environments lead to issues during deployments.

There are two different approaches you can take When automating the deployment of services and infrastructure: imperative and declarative.

* With an **imperative** approach, you explicitly state the commands that are executed to produce the outcome you're looking for.
* With a **declarative** approach, you specify what you want the outcome to be instead of specifying how you want it done.

Both approaches are valuable, so there's no wrong choice. What do these different approaches look like on Azure, and how do you use them?

### Imperative automation
Let's start with imperative automation. 

With imperative automation, we're specifying how things are to be done. 

This specification is typically done programmatically through a scripting language or SDK. 

For Azure resources, we could use the Azure CLI or Azure PowerShell. 

Let's take a look at an example that uses the Azure CLI to create a storage account:

```
az group create --name storage-resource-group --location eastus

az storage account create --name mystorageaccount --resource-group storage-resource-group --kind BlobStorage --access-tier hot
```

In this example, we're specifying how to create these resources: execute a command to create a resource group, then execute another command to create a storage account. 

We're explicitly telling Azure which commands to run in order to produce the output we need.

With this approach, we're able to fully automate our infrastructure. 

We can provide areas for input and output, and can ensure that the same commands are executed every time. 

By automating our resources, we've taken the manual steps out of the process, making resource administration operationally more efficient.

However, there are some downsides to this approach. 

Scripts to create resources can quickly become complex as the architecture becomes more complex. 

Error handling and input validation may need to be added to ensure full execution. 

Commands may change, requiring ongoing maintenance of the scripts.

### Declarative automation
With declarative automation, we're specifying what we want our result to be, leaving the details of how it's done to the system we're using. 

On Azure, you can accomplish declarative automation by using Azure Resource Manager (ARM) templates, which are JSON-structured files that specify what we want created. 

ARM templates have four sections: parameters, variables, resources, and outputs.

* Parameters handle input to be used within the template.
* Variables provide a way to store values for use throughout the template.
* Resources are the things that are being created.
* Outputs provide details to the user of what was created.

In the following example, we're telling Azure to create a storage account with the names and properties that we specify. 

The actual steps that are executed behind the scenes to create this storage account are left for Azure to decide.

```
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "name": {
            "type": "string"
        },
        "location": {
            "type": "string"
        },
        "accountType": {
            "type": "string",
            "defaultValue": "Standard_RAGRS"
        },
        "kind": {
            "type": "string"
        },
        "accessTier": {
            "type": "string"
        },
        "httpsTrafficOnlyEnabled": {
            "type": "bool",
            "defaultValue": true
        }
    },
    "variables": {
    },
    "resources": [
        {
            "apiVersion": "2018-02-01",
            "name": "[parameters('name')]",
            "location": "[parameters('location')]",
            "type": "Microsoft.Storage/storageAccounts",
            "sku": {
                "name": "[parameters('accountType')]"
            },
            "kind": "[parameters('kind')]",
            "properties": {
                "supportsHttpsTrafficOnly": "[parameters('httpsTrafficOnlyEnabled')]",
                "accessTier": "[parameters('accessTier')]",
                "encryption": {
                    "services": {
                        "blob": {
                            "enabled": true
                        },
                        "file": {
                            "enabled": true
                        }
                    },
                    "keySource": "Microsoft.Storage"
                }
            },
            "dependsOn": []
        }
    ],
    "outputs": {
        "storageAccountName": {
            "type": "string",
            "value": "[parameters('name')]"
        }
    }
}
```

You can use ARM templates to create and manipulate most services on Azure. 

You can store your templates in code repositories and inherit all the benefits of using a source-control system. 

You can also share your templates across environments to ensure that the infrastructure you use for your development environment matches your production environment. 

ARM templates are a great way to automate deployments, and they help ensure consistency, eliminate deployment misconfigurations, and can increase operational speed.

Automating your infrastructure deployment is a great first step, but when you're deploying virtual machines, there's still more work to do. 

Let's take a look at a couple of approaches to automating configuration post deployment.


### VM images vs. post-deployment configuration
For many virtual machine deployments, your job isn't done when a VM is simply up and running. 

In many situations, more configuration is needed before the VM can serve its intended purpose. 

For example, more disks might need formatting, the VM might need to be joined to a domain, or the workload for a management software package might need to be installed and configured.

There are two common strategies that you can use for the configuration work, which for all intents and purposes are considered to be part of the configuration process for the VM itself. 

Each of these strategies has its advantages and disadvantages.

* Custom images 
	* Generated by deploying a virtual machine, then configuring or installing software on that running instance. 
	* When everything is configured correctly, the virtual machine can be shut down, and an image is created from the VM. 
	* You can then use this image as a base for deploying other new virtual machines. 
	* Working with custom images can speed up your overall deployment time. 
	* Because as soon as the virtual machine is deployed and running, no extra configuration is needed. 
	* If deployment speed is an important factor, custom images are definitely worth exploring.

* Post-deployment scripting 
	* Typically applies a basic base image, then relies on scripting or a configuration-management platform to perform the necessary configuration after the VM is deployed. 
	* The post-deployment scripting could be done by executing a script on the VM through the Azure Script Extension, or by using a more robust solution such as Azure Automation Desired State Configuration (DSC).

Each of these approaches has a few specific and some shared considerations to keep in mind.

* When using images, you need to ensure there's a process to handle image updates, security patches, and inventory management of the images themselves.

* With post-deployment scripting, build times can be extended since the VM can't be added to live workloads until the build is complete. For standalone systems, a longer build time may not be a significant issue. But for services that autoscale, such as Virtual Machine Scale Sets, this extended build time can impact how quickly you can scale.

* With both approaches, you want to ensure that you address configuration drift. As new configurations are rolled out, you need to ensure that existing systems are updated accordingly.

Automating resource deployment can be a massive benefit to your environment. 

The amount of time saved and the number of errors reduced can move your operational capabilities to another level.

### Automation of operational tasks
Once your solutions are up and running, there are ongoing operational activities that you can also automate. 

Automating these tasks with Azure Automation and other Azure services reduces manual workloads, enables configuration and update management of compute resources, provides a framework for running any type of Azure task, and centralizes shared resources such as schedules, credentials, and certificates.

Examples of this automation might include:

* Periodically searching for orphaned disks
* Installing the latest security patches on VMs
* Searching for and shutting down virtual machines in off hours
* Running daily reports and producing a dashboard to report to senior management

As an example, let's suppose that you want to reduce your compute costs by configuring one of your development virtual machines to run only during your organization's business hours. 

You can use the Start/Stop VMs v2 feature, which relies on [Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview) to handle the VM start and stop execution.

### Automate development environments
At the other end of your cloud infrastructure pipeline are a collection of development machines, which your developers use to write the applications and services that are the core of your business. 

You can use Azure DevTest Labs to deploy VMs with all of the correct tools and repositories that your developers need. 

Developers working on multiple services can switch between development environments without having to provision a new VM themselves. 

These development environments can be shut down when they're not in use, and then restarted when they're required again.



## Testing strategies for your application
Testing is one of the fundamental components of DevOps and agile development in general. 

If automation gives DevOps the required speed and agility to deploy software quickly, only through extensive testing can those deployments achieve the required reliability that customers demand.

A main tenet of a DevOps practice to achieve system reliability is the shift left principle. 

If you depict your process for developing and deploying an application as a series of steps moving from left to right. 

Then, your testing should be shifted as much as possible toward the beginning of your process (the left), and not placed at the very end of your process (the right). 

Errors are far cheaper to repair when they're caught early, and issues can be expensive or impossible to fix later in your application's lifecycle.

Testing should occur on both application code and infrastructure code, and they should both be subject to the same quality controls. 

The environment where applications are running should be version-controlled and deployed through the same mechanisms as application code. 

As a result, you can test and validate both application code and infrastructure code using DevOps testing paradigms.

You can use your favorite testing tool to run your tests, including Azure Pipelines for automated testing and Azure Testing Plans for manual testing.

There are multiple stages at which you can perform tests in the code's lifecycle, and each type of testing has several considerations that are important for you to understand. 

In this unit, you can find a summary from several of the different tests that you should consider when you're developing and deploying applications.

### Automated Testing
Automating tests is the best way to make sure that they're executed. 

Depending on how frequently your automated tests are performed, they're typically limited in duration and scope. 

The following descriptions list some of the things you need to consider when creating your test strategy.

#### Unit Testing
Unit tests are tests typically run by each new version of code that's committed into your version-control system. 

Unit tests should be extensive (they should ideally cover 100% of the code), and quick (typically under 30 seconds, although this number isn't a rule set in stone). 

Unit testing can verify things like the syntax correctness of application code, Resource Manager templates, or Terraform configurations. 

It can also verify that your code is following best practices, or that the code produces the expected results when provided with certain inputs.

Unit tests should be applied both to application code and infrastructure code.

#### Smoke Testing
Smoke tests are more exhaustive than unit tests, but still not as much as integration tests. 

Smoke tests normally run in less than 15 minutes. 

While smoke tests don't verify the interoperability of your different components with each other, they verify that each component can be correctly built, and each component meets your criteria for expected functionality and performance.

Smoke tests usually involve building the application code. 

If you're deploying infrastructure as part of your process, then smoke tests can possibly involve testing the deployment in a test environment.

#### Integration Testing
After making sure that your different application components operate correctly individually, integration testing determines whether your components can interact with each other as they should. 

Integration tests usually take longer than smoke tests, so they're sometimes executed less frequently. 

For example, running integration tests every night still offers a good compromise between the different types of automated testing; your integration testing will detect interoperability issues between application components no later than one day after they were introduced.

### Manual Testing
Manual testing is much more expensive than automated testing, so it's used less frequently than automated testing. 

However, manual testing is fundamental for the correct functioning of the DevOps feedback loop; manual testing is used to correct errors before they become too expensive to repair, or before they cause customer dissatisfaction.

#### Acceptance Testing
There are many different ways of confirming that the application is doing what it should.

* Blue/Green deployments: 
	* When deploying a new application version, you can deploy it in parallel to the existing one. 
	* This way, you can start redirecting your clients to the new version. 
	* If everything goes well, you decommission the old version. 
	* If there's any problem with the new deployment, you can always redirect your clients back to the older deployment.

* Canary releases: 
	* You can expose new functionality of your application (ideally using feature flags) to a select group of users. 
	* If these users are satisfied with the new functionality, you can extend it to the rest of your user community. 
	* In this scenario, we're talking about releasing functionality, and not necessarily about deploying a new version of the application.

* A/B testing: 
	* A/B testing is similar to canary release testing. 
	* Canary releases focus on mitigating risk, while A/B testing focuses on evaluating the effectiveness of two similar ways of achieving the same goal. 
	* For example, if you have two versions of a layout for a certain area of your application, you could send half of your users to version A, and the other half of your users to version B. 
	* Then, you could use some metrics to see which layout works better for your application goals.

An important aspect to consider is how to measure the effectiveness of new features in an application. 

One way to measure that is through the Application Insights User Behavior Analytic, which you can use to determine how people are using your application. 

By analyzing the results, you can decide whether a new feature has increased or decreased your application's usability.

Certain services in Azure offer functionality that can help you implement these kinds of tests. 

For example: the deployment slot functionality in the Azure App Service allows you to have two different versions of the same application running at the same time, and you can redirect your users to one version or the other.

### Stress tests
As other sections of this framework have explained, designing your application code and infrastructure for scalability is of paramount importance. 

With scalability in mind, it's critical that you test whether your application and infrastructure code are able to adapt to changing load conditions. 

For example, if there's a spike in user activity, you need to be confident that your application and infrastructure can scale automatically to meet the increased demand.

During your stress tests, it's critical that you monitor all the components of the system in order to identify whether there are any scale limitations. 

Every component of the system that's not able to scale out can turn into a bottleneck (such as active/passive network components or databases). 

It's important for you to know the limits for each of your components so you can mitigate their impact into your application scale. 

As you learn more about the performance characteristics for each of your components, the discoveries that you make along the way might motivate you to replace some of your components with more scalable counterparts.

After the stress test is concluded, it's equally important to verify that your infrastructure scales back down to its normal condition in order to keep your costs under control.

### Fault injection
Your application should be resilient to infrastructure failures, and introducing faults in the underlying infrastructure and observing how your application behaves is fundamental for increasing the trust in your redundancy mechanisms. 

Examples of fault injection tests include, ungracefully shutting down infrastructure components, or degrading the performance of certain elements such as network equipment. 

These tests give you a way to verify that your application is going to continue to behave or react as expected, if these situations occur in real life.

Most companies use a controlled way of injecting faults into the system, although if you're confident with your application resiliency, you could use automated frameworks. 

Chaos engineering is a practice adopted by some organizations to identify areas where faults may occur by purposefully making key pieces of infrastructure unavailable.

### Security tests
Another critical component of your test strategy should be routinely testing your application for security vulnerabilities. 

You should regularly perform security tests against your application to identify any application vulnerabilities that are introduced through code defects or through software dependencies. 

These tests can include automated security scans to test against common vulnerabilities, such as cross-site scripting or SQL injection. 

Your security tests can also include red team exercises, where security teams attempt to compromise your application.

Use the results from these tests to provide feedback through your entire development process and resolve any security issues that you find in your code or software dependencies.


