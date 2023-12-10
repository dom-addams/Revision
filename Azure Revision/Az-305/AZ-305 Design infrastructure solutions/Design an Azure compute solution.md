# _AZ-305: Design infrastructure solutions_

Design Infrastructure Solutions including compute, applications, networking and migrations.

# _Design an Azure compute solution_
Azure Architects design and recommend Azure compute solutions.

Learning objectives:

* Choose an Azure compute service.
* Design for Azure Virtual Machines solutions.
* Design for Azure Batch solutions.
* Design for Azure App Service solutions.
* Design for Azure Container Instances solutions.
* Design for Azure Kubernetes Service solutions.
* Design for Azure Functions solutions.
* Design for Azure Logic Apps solutions.


## Choose an Azure compute service
Azure offers several compute services. Compute refers to the hosting model for the computing resources that your applications run on.

### Things to know about Azure compute services
Below services will be covered in this unit:

* Azure Virtual Machines: Deploy and manage virtual machines inside an Azure virtual network.
* Azure Batch: Apply this managed service to run large-scale parallel and high-performance computing (HPC) applications.
* Azure App Service: Host web apps, mobile app backends, RESTful APIs, or automated business processes with this managed service.
* Azure Functions: Use this managed service to run code in the cloud, without worrying about the infrastructure.
* Azure Logic Apps: Configure this cloud-based platform to create and run automated workflows similar to capabilities in Azure Functions.
* Azure Container Instances: Run containers in Azure in a fast and simple manner without creating virtual machines or relying on a higher-level service.
* Azure Kubernetes Service (AKS): Run containerized applications with this managed Kubernetes service.


### Things to consider when choosing Azure compute services
As you begin to compare Azure compute services to choose your infrastructure solution, there are several implementation points to think about.

* Architecture and infrastructure requirements
* Support for new workload scenarios, like HPC applications
* Required hosting options, including platform, infrastructure, and functions
* Support for migrations, such as cloud-optimized or lift and shift

#### Workloads and architecture
When you plan for new instances of Azure services and new workloads, consider the following scenarios.

* Control: Determine if you require full control over installed software and applications.
* Workloads: Consider the workloads you need to support, such as HPC workloads or event-driven workloads.
* Architecture: Think about what architecture best supports your infrastructure, including microservice, full-fledged orchestration, and serverless.

#### Migrations
An important consideration for your compute service involves analyzing the migration capabilities.

* Cloud optimized: To migrate to the cloud and refactor applications to access cloud-native features, consider compute services that are cloud-optimized.
* Lift and shift: For lift and shift workload migrations, consider compute services that don't require application redesigns or code changes.
* Containerized: In your migration planning, consider whether your compute service needs to support containerized applications, or commercial off the shelf (COTS) apps.

#### Hosting
The [hosting option](https://learn.microsoft.com/en-us/azure/security/fundamentals/shared-responsibility) of your compute solution determines the developer and cloud provider responsibilities. 

Azure offers three hosting options across the compute services.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/host-infrastructures.png)

* [Infrastructure-as-a-Service (IaaS) ](https://azure.microsoft.com/overview/what-is-iaas/)
	* Lets you create individual virtual machines along with the associated networking and storage components.
	* Then you deploy the software and applications you want onto those virtual machines. 
	* This model is the closest to a traditional on-premises environment, except that Microsoft manages the infrastructure. 
	* You still manage the individual virtual machines. Azure Virtual Machines offers IaaS hosting.

* Platform-as-a-Service (PaaS) 
	* Provides a managed hosting environment, where you can deploy your application without needing to manage virtual machines or networking resources. 
	* Azure compute services that offer PaaS hosting include Azure Batch, App Service, Container Instances, and Azure Kubernetes Service.

* Function-as-a-Service (FaaS) 
	* Goes further in removing the need to worry about the hosting environment. 
	* In a FaaS model, you deploy your code, and the service automatically runs it. 
	* Azure Functions and Logic Apps offer FaaS hosting.


### Azure compute service decision flowchart
Azure provides a decision [flowchart](https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/compute-decision-tree) with high-level guidance for how to select the appropriate Azure compute service for your scenario.


The output from this decision flowchart is a starting point for your planning. 

You'll need to do a detailed evaluation of the services to determine exactly which solution meets your requirements. 

As you work through this module, refer to this diagram to become familiar with the considerations and options.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/compute-flowchart.png)



## Design for Azure Virtual Machines solutions
[Azure Virtual Machines](https://learn.microsoft.com/en-us/azure/virtual-machines/) is the basis of the Azure Infrastructure-as-a-Service (IaaS) model. 

Virtual Machines can be used for developing, testing, and deploying applications in the cloud, or to extend your datacenter. 

Virtual Machines offers a fast, scalable, flexible way to add more compute power to your enterprise.

### Things to know about Azure Virtual Machines
There are two main scenarios where Azure Virtual Machines can be an ideal compute solution for an infrastructure. 

Virtual Machines can be used to build new workloads and migrate data by using the lift and shift pattern.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/select-virtual-machines.png)

* Build new workloads: 
	* Azure Virtual Machines is ideal when you're building new workloads and demand for your applications can fluctuate. 
	* It's economical to run your applications on a virtual machine in Azure.

* Lift and shift migration: 
	* If you're using lift and shift (rehosting) migration to move data and applications from an on-premises location, targeting Azure Virtual Machines in the cloud is an effective strategy.

### Things to consider when using Azure Virtual Machines
Let's walk through a checklist of things to consider when using Azure Virtual Machines as a compute solution. 

As you review these points, think about what configuration is needed for your requirements.

* Start with your network.
* Name your virtual machine, and decide the location.
* Determine the size of your virtual machine.
* Review the pricing model, and Azure Storage options.
* Select an operating system.

#### Network configuration
The first thing to think about isn't your virtual machines at all - it's the network. 

Spend some time thinking about your network configuration for Tailwind Traders. 

Network addresses and subnets aren't trivial to change after they're configured. 

If you have an on-premises network, you'll want to carefully consider the network topology before you create any virtual machines.

#### Virtual machine name
Some developers don't give much thought about the name for a virtual machine. 

However, the virtual machine name defines a manageable Azure resource, and the value isn't easy to change. 

Choose machine names that are meaningful and consistent, so you can easily identify what each virtual machine does.

#### Virtual machine location
Azure has datacenters all over the world filled with servers and disks. 

These datacenters are grouped into geographic regions like West US, North Europe, Southeast Asia, and so on. The datacenters provide redundancy and availability.

Each virtual machine is in a region where you want the resources like CPU and storage to be allocated. 

The regional location lets you place your virtual machines as close as possible to your users. 

The location of the machine can improve performance and ensure you meet any legal, compliance, or tax requirements.

There are two other points to consider about the virtual machine location.

* The machine location can limit your available options. Each region has different hardware available, and some configurations aren't available in all regions.
* There are price differences between locations. To find the most cost-effective choice, check for your required configuration in different regions.


### Virtual machine size
After you choose the virtual machine name and location, you need to decide on the size of your machine. 

Azure offers different memory and storage options for different [virtual machine sizes](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes).

The best way to determine the appropriate machine size is to consider the type of workload your machine needs to run. 

Based on the workload, you can choose from a subset of available virtual machine sizes. 

The following table shows size classifications for Azure Virtual Machines workloads and recommended usage scenarios.

Classification | Description | Scenarios
--- | --- | ---
General purpose | General-purpose virtual machines are designed to have a balanced CPU-to-memory ratio. | - Testing and development <br /> - Small to medium databases <br /> - Low to medium traffic web servers
Compute optimized | Compute optimized virtual machines are designed to have a high CPU-to-memory ratio. | - Medium traffic web servers <br /> - Network appliances <br /> - Batch processes <br /> - Application servers
Memory optimized | Memory optimized virtual machines are designed to have a high memory-to-CPU ratio. | - Relational database servers <br /> - Medium to large caches <br /> - In-memory analytics
Storage optimized | Storage optimized virtual machines are designed to have high disk throughput and I/O. | - Virtual machines running databases
GPU | GPU virtual machines are specialized virtual machines targeted for heavy graphics rendering and video editing. | - Model training and inferencing with deep learning
High performance computes | High performance compute offers the fastest and most powerful CPU virtual machines with optional high-throughput network interfaces. | - Workloads that require fast performance <br /> - High traffic networks


### Virtual machine pricing
A subscription is billed two separate costs for every virtual machine: compute and storage. 

By separating these costs, you can scale them independently and only pay for what you need.

* Compute costs: 
	* Compute expenses are priced on a per-hour basis but billed on a per-minute basis. 
	* If the virtual machine is deployed for 55 minutes, you're charged for only 55 minutes of usage. 
	* You're not charged for compute capacity if you stop and deallocate the virtual machine. 
	* The hourly price varies based on the virtual machine size and operating system you select.

* Storage costs: 
	* You're charged separately for the Azure Storage the virtual machine uses. 
	* The status of the virtual machine has no relation to the Azure Storage charges that are incurred. 
	* You're always charged for any Azure Storage used by the disks.

### Azure Storage
[Azure Managed Disks](https://learn.microsoft.com/en-us/azure/virtual-machines/managed-disks-overview) handle Azure storage account creation and management in the background for you. 

You specify the disk size and the performance tier (Standard or Premium). Azure creates and manages the disk. 

As you add disks or scale the virtual machine up and down, you don't have to worry about the storage being used.

#### Operating system
Azure provides various operating system images that you can install into the virtual machine, including several versions of Windows and flavors of Linux. 

Azure bundles the cost of the operating system license into the price.

* If you're looking for more than just base operating system images, you can search [Azure Marketplace](https://azuremarketplace.microsoft.com/marketplace/apps/category/compute). 
	* There are various install images that include not only the operating system but popular software tools, such as WordPress. 
	* The image stack consists of a Linux server, Apache web server, a MySQL database, and PHP. 
	* Instead of setting up and configuring each component, you can install an Azure Marketplace image and get the entire stack all at once.

* If you don't find a suitable operating system image, you can create your own disk image. 
	* Your disk image can be uploaded to Azure Storage and used to create an Azure virtual machine.
	* Keep in mind that Azure only supports 64-bit operating systems.



## Design for Azure Batch solutions
[Azure Batch](https://learn.microsoft.com/en-us/azure/batch/batch-technical-overview) runs large-scale applications efficiently in the cloud. 

You can schedule compute-intensive tasks and dynamically adjust resources for your solution without managing infrastructure. 

Azure Batch can create and manage a pool of compute nodes (virtual machines). 

Azure Batch can also install the application you want to run, and schedule jobs to run on the compute nodes.


### Things to know about Azure Batch
There are many scenarios where Azure Batch can be an ideal compute solution for your infrastructure. 

Azure Batch is similar to Azure Virtual Machines and can be used to build new workloads and migrate data.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/select-azure-batch.png)

* Azure Batch works well with applications that run independently (parallel workloads).

* Azure Batch is effective for applications that need to communicate with each other (tightly coupled workloads). You can use Batch to build a service that runs a Monte Carlo simulation for a financial services company or a service to process images.

*  Azure Batch enables large-scale parallel and high-performance computing (HPC) batch jobs with the ability to scale to tens, hundreds, or thousands of virtual machines. When you're ready to run a job, Azure Batch:
	* Starts a pool of compute virtual machines for you.
	* Installs applications and staging data.
	* Runs jobs with as many tasks as you have.
	* Identifies failures, requeues work, and scales down the pool as work completes.



### How Azure Batch works
A typical real-world scenario for Azure Batch requires data and application files. 

The Batch workflow begins with uploading the data and application files to an Azure storage account. 

Based on the demand, you create a Batch pool with as many Windows or Linux virtual compute nodes as needed. 

If the demand increases, compute nodes can be automatically scaled.

As you plan for your own configuration, you can separate aspects of the scenario into two parts: your service and the Azure Batch compute.

* Your service uses Azure as the platform. 
	* The platform is used for completing computationally intensive work and retrieving results. 
	* You can also monitor jobs and task progress.
 
* Azure Batch operates as the compute platform behind your service. 
	* Batch uses Azure Storage to fetch applications or data needed to complete a task. 
	* Azure Batch writes output to Azure Storage. Behind the scenes, there are collections (pools) of virtual machines. 
	* Pools are the resources that jobs and tasks are executed on.


### Things to consider when using Azure Batch
Let's look at some best practices for using Azure Batch. 

As you review the suggestions, think about what scenarios can be accomplished by integrating Azure Batch in the infrastructure.

* Consider pools. 
	* If your jobs consist of short-running tasks, don't create a new pool for each job.
	* The overhead to create new pools diminishes the run time of the job. 
	* Also, it's best to have your jobs use pools dynamically. 
	* If your jobs use the same pool for everything, there's a chance that jobs won't run if something goes wrong with the pool.

* Consider nodes. 
	* Individual nodes aren't guaranteed to always be available. 
	* If your Azure Batch workload requires deterministic, guaranteed progress, you should allocate pools with multiple nodes. 
	* Consider using isolated virtual machine sizes for workloads with compliance or regulatory requirements.

* Consider jobs. 
	* Uniquely name your jobs so you can accurately monitor and log the activity. 
	* Consider grouping your tasks into efficiently sized jobs. 
	* It's more efficient to use a single job that contains 1,000 tasks rather than creating 100 jobs that have 10 tasks each.



## Design for Azure App Service solutions
[Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/overview) is an HTTP-based service that lets you build and host web apps, background jobs, mobile backends, and RESTful APIs. 

You can use the programming language of your choice and build automated deployments from GitHub, Azure DevOps, or any Git repo. 

App Service offers automatic scaling and high availability.

### Things to know about Azure App Service
With Azure App Service, all your apps share [common benefits](https://learn.microsoft.com/en-us/azure/app-service/overview). 

These benefits make App Service the ideal compute solution for any hosted web application to support new workloads and migrate data.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/select-azure-app-service.png)

* Azure App Service is a platform as a service (PaaS) environment. 
	* You focus on the website development and API logic. 
	* Azure handles the infrastructure to run and scale your web apps.

* App Service supports development in multiple languages and frameworks, and offers integrated deployment and management with secured endpoints.

* App Service offers built-in load balancing and traffic management at global scale with high availability.

* App Service provides [built-in authentication and authorization capabilities](https://learn.microsoft.com/en-us/azure/app-service/overview-authentication-authorization) (sometimes referred to as Easy Auth). You can sign in users and access data by writing minimal or no code.


### Continuous deployment
Azure App Service enables continuous deployment. 

[Azure DevOps](https://learn.microsoft.com/en-us/azure/devops/user-guide/what-is-azure-devops) provides developer services for support teams to plan work, collaborate on code development, and build and deploy applications. 

Whenever possible when continuously deploying your code, use [deployment slots](https://learn.microsoft.com/en-us/azure/app-service/deploy-staging-slots) for a new production build.

When you choose a Standard App Service Plan tier or better, you can deploy your app to a staging environment, validate your changes, and do performance tests. 

When you're ready, you can swap your staging and production slots. 

The swap operation triggers the necessary worker instances to match your production scale.

### Azure App Service costs
You pay for the Azure compute resources your app uses while it processes requests. 

The cost is based on the [Azure App Service plan](https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans) you choose. 

The App Service plan determines how much hardware is devoted to your host. 

The plan specifies whether you're using dedicated or shared hardware and how much memory is reserved. 

You can have different app service plans for different apps, and your plan can be scaled up and down at any time.


### Things to consider when using Azure App Service
Let's look at some scenarios for using Azure App Service. 

As you review these options, think about how you can integrate Azure App Service in the infrastructure.

* Consider web apps. 
	* Create web apps with App Service by using ASP.NET, ASP.NET Core, Java, Ruby, Node.js, PHP, or Python. 
	* You can choose either Windows or Linux as the host operating system.

* Consider API apps. 
	* Build API apps similar to REST-based web APIs with your choice of language and framework. 
	* Azure App Service offers full Swagger support, and the ability to package and publish your API in Azure Marketplace. 
	* The apps can be consumed from any HTTP or HTTPS client.

* Consider WebJobs. 
	* Use the App Service WebJobs feature to run a program or script. 
	* Program examples include Java, PHP, Python, or Node.js. 
	* Script examples include cmd, bat, PowerShell, or Bash. 
	* WebJobs can be scheduled or run by a trigger. 
	* WebJobs are often used to run background tasks as part of your application logic.

* Consider Mobile apps. 
	* Exercise the Mobile Apps feature of Azure App Service to quickly build a backend for iOS and Android apps. 
	* On the mobile app side, App Service provides SDK support for native iOS and Android, Xamarin, and React native apps.
	* With just a few steps in the Azure portal, you can:
		* Store mobile app data in a cloud-based SQL database.
		* Authenticate customers against common social providers, such as MSA, Google, Twitter, and Facebook.
		* Send push notifications.
		* Execute custom back-end logic in C# or Node.js.

* Consider continuous deployment. 
	* Choose the Standard App Service Plan tier or better to enable continuous deployment of your code. 
	* Deploy your app to a staging slot and validate your app with test runs. 
	* When the app is ready for release, swap your staging and production slots. 
	* The swap operation warms up the necessary worker instances to match your production scale, which eliminates downtime.

* Consider authentication and authorization. 
	* Take advantage of the built-in authentication capabilities in Azure App Service. 
	* You don't need any language, SDK, security expertise, or even any code to use the functionality in your web app or API. 
	* You can integrate with multiple sign-in providers, such as Microsoft Entra ID, Facebook, Google, and Twitter. 
	* Azure Functions offers the same built-in authentication features that are available in App Service.

* Consider multiple plans to reduce costs. 
	* Configure different Azure App Service plans for different apps. 
	* Scale your plan up and down at any time. Start testing your web app in a Free App Service plan and pay nothing. 
	* When you want to add your custom DNS name to the web app, just scale your plan up to the Shared tier.



## Design for Azure Container Instances solutions
Virtual machines are an excellent way to reduce costs versus the investments that are necessary for physical hardware. 

However, each virtual machine is still limited to a single operating system. 

If you want to run multiple instances of an application on a single host machine, containers are an excellent choice.

[Azure Container Instances](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-overview) are a fast and simple way to run a container on Azure. 

Scenarios for using Azure Container Instance include simple applications, task automation, and build jobs.

### Things to know about Azure Container Instances
Azure Container Instances offers many benefits, including fast startup, per second billing, and persistent storage. 

These benefits make Azure Container Instances a great compute solution to support new workloads and migrate data by using the lift and shift pattern.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/select-azure-container-instances.png)

* Azure Container Instances enables fast startup. You can launch containers in seconds for immediate access to applications.
 
* Azure Container Instances implements per second billing. You incur costs only while your container is running.
 
* Azure Container Instances supports custom sizes for your containers. You can specify exact values for CPU cores and memory and avoid costs for unused resources.
 
* Container Instances offers persistent storage. Azure Files shares can be mounted directly to a container to retrieve and persist state.
 
* Container Instances can be used with Linux and Windows. Schedule both Windows and Linux containers using the same API.

### Container groups
The top-level resource in Azure Container Instances is the container group. 

A container group is a collection of containers that get scheduled on the same host machine. 

The containers in a container group share a lifecycle, resources, local network, and storage volumes.

Multi-container groups are useful when you want to divide a single functional task into several container images. 

These images can then be delivered by different teams and have separate resource requirements. Some example scenarios include:

* A container serving a web application and a container pulling the latest content from source control.
* An application container and a logging container. The logging container collects the logs and metrics output by the main application and writes them to long-term storage.
* An application container and a monitoring container. The monitoring container periodically makes a request to the application to ensure it's running and responding correctly, and raises alerts as needed.
* A front-end container and a back-end container. The frontend might serve a web application with the backend running a service to retrieve data.

### Things to consider when using Azure Container Instances
When you work with Azure Container Instances, there are several recommended security practices.

* Use a private registry. 
	* Containers are built from images that are stored in one or more repositories. 
	* These repositories can belong to a public registry or to a private registry. 
	* An example of a private registry is the [Docker Trusted Registry](https://docs.docker.com/datacenter/dtr/), which can be installed on-premises or in a virtual private cloud. 
	* Another example is [Azure Container Registry](https://learn.microsoft.com/en-us/azure/container-registry/) that can be used to build, store, and manage container images and artifacts.

* Ensure image integrity throughout the lifecycle. 
	* Part of managing security throughout the container lifecycle is to ensure the integrity of the container images. 
	* Images with vulnerabilities, even minor, shouldn't be allowed to run in a production environment. 
	* Keep the number of production images small to ensure they can be managed effectively.

* Monitor container resource activity. 
	* Monitor your resource activity, like files, network, and other resources that your containers access. 
	* Monitoring resource activity and consumption are useful both for performance monitoring and as a security measure.

### Compare Azure Container Instances to Azure Virtual Machines
The following table compares how important features are supported in Azure Container Instances and Azure Virtual Machines. 

As you review the following features, consider what features and support are required for the compute solution.

Compare | Azure Container Instances | Azure Virtual Machines
--- | --- | ---
Isolation | Container Instances typically provide lightweight isolation from the host and other containers, but doesn't provide as strong a security boundary as a virtual machine. | A virtual machine provides complete isolation from the host operating system and other virtual machines. <br /> <br /> Isolation is useful when a strong security boundary is critical, such as hosting apps from competing companies on the same server or cluster.
Operating system | Container Instances runs the user mode portion of an operating system and can be tailored to contain just the needed services for your application. | Each virtual machine runs a complete operating system. <br /> <br /> Azure Virtual Machines typically requires more system resources than Container Instances, such as CPU, memory, and storage.
Deployment | Container Instances deploy individual containers by using Docker via the command line. <br /> <br /> Multiple containers are deployed by using an orchestrator such as Azure Kubernetes Service. | You can deploy individual virtual machines by using Windows Admin Center or Hyper-V Manager. <br /> <br /> Multiple virtual machines can be deployed by using PowerShell or System Center Virtual Machine Manager.
Persistent storage | Container Instances use Azure Disks for local storage for a single node, or Azure Files (SMB shares) for storage shared by multiple nodes or servers. | With Azure Virtual Machines, you can use a virtual hard disk (VHD) for local storage for a single virtual machine, or an SMB file share for storage shared by multiple servers.
Fault tolerance | If a cluster node fails in Azure Container Instances, any containers running on it are rapidly recreated by the orchestrator on another cluster node. | A virtual machine can fail over to another server in a cluster with the operating system of the virtual machine restarting on the new server.



## Design for Azure Kubernetes Service solutions
[Kubernetes](https://azure.microsoft.com/topic/what-is-kubernetes/) is a portable, extensible open-source platform for automating deployment, scaling, and the management of containerized workloads. 

This orchestration platform provides the same ease of use and flexibility as with Platform as a Service (PaaS) and Infrastructure as a Service (IaaS) offerings. 

Kubernetes provides both container management and container orchestration.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/container-scaling.png)

Container management is the process of organizing, adding, removing, or updating a significant number of containers. Most of these tasks are manual and error prone. 

Container orchestration is a system that automatically deploys and manages containerized applications. 

The orchestrator can dynamically increase or decrease the deployed instances of the managed application. 

The orchestrator can also ensure all deployed container instances get updated if a new version of a service is released.

[Azure Kubernetes Service (AKS)](https://learn.microsoft.com/en-us/azure/aks/intro-kubernetes) manages your hosted Kubernetes environment and makes it simple to deploy and manage containerized applications in Azure.

### Things to know about Azure Kubernetes Service
The Azure Kubernetes Service environment is enabled with many features, such as automated updates, self-healing, and easy scaling. 

Review the following characteristics that make AKS an appealing compute option to build new workloads and support lift and shift migrations.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/select-azure-kubernetes-service.png)

* The Kubernetes cluster is managed by Azure and is free. You manage the agent nodes in the cluster and only pay for the virtual machines on which your nodes run.

* When you create the cluster, you can use Azure Resource Manager (ARM) templates to automate cluster creation. With ARM templates, you specify features like as advanced networking, Microsoft Entra integration, and monitoring.

* AKS gives you the benefits of open-source Kubernetes. You don't have the complexity or operational overhead of running your own custom Kubernetes cluster.

### Things to consider when using Azure Kubernetes Service
There are several factors to consider when deciding whether Azure Kubernetes Service is the right compute solution for your infrastructure. 

A good approach is to plan your strategy from two points of view. 

Consider the features from the approach of a green field new project, and also from the perspective of a lift-and-shift migration. 

The following features are configurable when you create a new cluster and also after you deploy.

Feature | Consideration | Solution
--- | --- | ---
Identity and security management | Do you already use existing Azure resources and make use of Microsoft Entra ID? | You can configure an Azure Kubernetes Service cluster to integrate with Microsoft Entra ID and reuse existing identities and group membership.
Integrated logging and monitoring | Are you using Azure Monitor? | Azure Monitor provides performance visibility of the cluster.
Automatic cluster node and pod scaling | Do you need to scale up or down a large containerization environment? | AKS supports two auto cluster scaling options. <br /> <br /> The horizontal pod autoscaler watches the resource demand of pods and increases pods to meet demand. <br /> <br /> The cluster autoscaler component watches for pods that can't be scheduled because of node constraints.
Cluster node upgrades | Do you want to reduce the number of cluster management tasks? | AKS manages Kubernetes software upgrades and the process of cordoning off nodes and draining them.
Storage volume support | Does your application require persisted storage? | AKS supports both static and dynamic storage volumes. Pods can attach and reattach to these storage volumes as they're created or rescheduled on different nodes.
Virtual network support | Do you need pod-to-pod network communication or access to on-premises networks from your AKS cluster? | An AKS cluster can be deployed into an existing virtual network with ease.
Ingress with HTTP application routing support | Do you need to make your deployed applications publicly available? | The HTTP application routing add-on makes it easy to access AKS cluster deployed applications.
Docker image support | Do you already use Docker images for your containers? | By default, AKS supports the Docker file image format.
Private container registry | Do you need a private container registry? | AKS integrates with Azure Container Registry (ACR). You aren't limited to ACR though, you can use other container repositories, public, or private.



## Design for Azure Functions solutions
[Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview) is a serverless application platform. 

Functions are used when you want to run a small piece of code in the cloud, without worrying about the infrastructure.

### Things to know about Azure Functions
Let's review some benefits and scenarios of Azure Functions that make it a great compute solution for building new workloads.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/select-azure-functions.png)

* Azure Functions provides intrinsic scalability. You're charged only for the resources you use.

* With Azure Functions, you can write your function code in the language of your choice.

* Azure Functions supports compute on demand in two significant ways:
	* Azure Functions lets you implement your system's logic into readily available blocks of code. These code blocks (functions) can run anytime you need to respond to critical events.
	* As requests increase, Azure Functions meets the demand with as many resources and function instances as necessary. As requests complete, any extra resources and application instances drop off automatically.

* Azure Functions is an ideal solution for handling specific definable actions triggered by an event. A function can process an API call and store the processed data in Azure Cosmos DB. After the data transfer happens, another function can trigger a notification.

### Things to consider when using Azure Functions
As you consider these suggestions, think about the advantages to using Azure Functions in infrastructure.

* Consider long running functions. 
	* Avoid large, long-running functions that can cause unexpected timeout issues.
	* Whenever possible, refactor large functions into smaller function sets that work together and return responses faster. 
	* The default timeout is 300 seconds for Consumption Plan functions, and 30 minutes for any other plan.

* Consider durable functions. 
	* Overcome timeout issues in your configuration with durable functions and smaller function sets. 
	* [Durable functions](https://learn.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-overview?tabs=csharp) let you write stateful functions. 
	* Behind the scenes, the function manages the application state, checkpoints, and restarts. 
	* An example application pattern for durable functions is function chaining. 
	* Function chaining executes a sequence of functions in a specific order. 
	* The output of one function is applied to the input of another function.

* Consider performance and scaling. 
	* Plan how to group functions with different load profiles. 
	* Consider a scenario where you have two functions. 
	* One function processes many thousands of queued messages and has low memory requirements. 
	* The other function is called only occasionally but has high memory requirements. 
	* In this scenario, you might want to deploy separate function applications, where each function has its own set of resources. 
	* Separate resources means you can independently scale the functions.

* Consider defensive functions. 
	* Design your functions to handle exceptions. 
	* Downstream services, network outages, or memory limits can cause a function to fail. 
	* Write your functions so they can continue if a failure occurs.

* Consider not sharing storage accounts. 
	* Maximize performance by using a separate storage account for each function application. 
	* When you create a function app, associate it with a unique storage account. 
	* Using a unique storage account is important if your function generates a high volume of storage transactions.



## Design for Azure Logic Apps solutions
[Azure Logic Apps](https://azure.microsoft.com/services/logic-apps) is another type of serverless compute solution that offers a cloud-based platform for creating and running automated workflows. 

Workflows are step-by-step processes that integrate your applications, data, services, and systems. 

With Azure Logic Apps, you can quickly develop highly scalable integration solutions for your enterprise and business-to-business (B2B) scenarios.

### Things to know about Azure Logic Apps
Let's review some characteristics of Azure Logic Apps and scenarios for using the compute solution to build new workloads.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/select-azure-logic-apps.png)

* Azure Logic Apps is a component of [Azure Integration Services](https://azure.microsoft.com/product-categories/integration/). Logic Apps simplifies the way you connect legacy, modern, and cutting-edge systems across cloud, on-premises, and hybrid environments.
 
* With Logic Apps, you can schedule and send email notifications by using Office 365 when a specific event happens, such as a new file uploaded.
 
* Use Logic Apps to route and process customer orders across on-premises systems and cloud services.
 
* Implement Logic Apps to move uploaded files from an SFTP or FTP server to Azure Storage.
 
* Monitor tweets and analyze sentiment with Logic Apps, and create alerts or tasks for items that need review.


### Compare Azure Logic Apps and Azure Functions
Azure Logic Apps is similar to Azure Functions as a compute service, but there are basic differences. 

Azure Functions is a code-first technology that uses durable functions. Azure Logic Apps is a design-first technology. 

Review the following flowchart and table to compare the two solutions.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-compute-solution/media/select-logic-apps.png)

Compare | Azure Functions | Azure Logic Apps
--- | --- | ---
Development | Code-first | Design-first
Method | Write code and use the durable functions extension | Create orchestrations with a GUI or by editing configuration files
Connectivity | - [Large selection of built-in binding types](https://learn.microsoft.com/en-us/azure/azure-functions/functions-triggers-bindings) <br /> - Write code for custom bindings | - [Large collection of connectors](https://learn.microsoft.com/en-us/azure/connectors/apis-list) <br /> - [Enterprise Integration Pack for B2B scenarios](https://learn.microsoft.com/en-us/azure/logic-apps/logic-apps-enterprise-integration-overview) <br /> - [Build custom connectors](https://learn.microsoft.com/en-us/azure/logic-apps/custom-connector-overview)
Monitoring | Azure Application Insights | Azure portal, Azure Monitor Logs (Log Analytics)

### Things to consider when using Azure Logic Apps
There are several points to consider when deciding whether Azure Logic Apps is the ideal compute solution for your infrastructure. 

Review the following considerations, and think about how Azure Logic Apps can enhance the compute strategy.

* Consider integration. 
	* Use Logic Apps to provide the critical infrastructure component of integration with services. 
	* Logic Apps is a good option when you need to get multiple applications and systems to work together. 
	* If you're building an app with no external connections, Logic Apps is probably not the best option.

* Consider performance. 
	* Scale your apps automatically with the Logic Apps execution engine. 
	* Logic Apps can process large datasets in parallel to let you achieve high throughput. 
	* However, fast activation time isn't always guaranteed, nor enforcement of real-time constraints on execution time.

* Consider conditional expressions. 
	* Build highly complex and deeply nested conditionals into your Logic Apps. 
	* Logic Apps provides control constructs like Boolean expressions, switch statements, and loops so your apps can make decisions based on your data.

* Consider connectors. 
	* Investigate whether pre-built connectors are available for all the services you need to access. 
	* You might need to create custom connectors. 
	* If a service has an existing REST or SOAP API, you can make the custom connector in a few hours without writing any code. 
	* Otherwise, you need to create the API first before making the connector.

* Consider mixing compute solutions. 
	* Take advantage of diverse features by mixing and matching services when you build an orchestration. 
	* You can call functions from Logic Apps, and call logic apps from an Azure function. 
	* Build each orchestration based on the service capabilities or your personal preference.

* Consider other options. 
	* Know when not to use Azure Logic Apps. 
	* There are cases where Logic Apps might not be the best option. 
	* Logic Apps isn't an ideal solution for real-time requirements, complex business rules, or if you're using non-standard services.


