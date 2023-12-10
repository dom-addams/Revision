# _Design an application architectur_
Azure Architects design and recommend application architectures.

Learning objectives:

* Describe message and event scenarios.
* Design a messaging solution.
* Design an Azure Event Hubs messaging solution.
* Design an event-driven solution.
* Design an automated app deployment solution.
* Design API integration.
* Design an application configuration management solution.
* Design a caching solution.

## Describe message and event scenarios
Your first decision in your application architecture design is to plan how the application components will communicate. 

Defining your component strategy helps you choose the appropriate Azure service.

Suppose you're designing the architecture for a home improvement video-sharing application for Tailwind Traders. 

You want your application to be as reliable and scalable as possible. 

You're planning to use Azure technologies to build a robust communication infrastructure. 

Before you can choose the appropriate Azure services, you need to design how each application component will communicate with the other components. 

For each type of communication, you might choose a different Azure technology.

### Things to know about messages and events
Most application components communicate by sending messages or events. 

Azure offers various services to support the different communication strategies.

#### Messages
Let's examine the characteristics of [messages](https://learn.microsoft.com/en-us/azure/event-grid/compare-messaging-services#message).

* Messages contain raw data that's produced by one component and consumed by another component.

* A message contains the data itself, not just a reference to that data.

In a message communication, the sending component expects the message data to be processed in a certain way by the destination component. 

The integrity of the overall system might depend on both the sender and receiver doing a specific job.

Suppose a user uploads a new video by using your mobile video-sharing app. 

Your mobile app must send the video to the web API that runs in Azure. 

The video file must be sent, not just an alert that indicates a new video has been added. 

The mobile app expects that the web API stores the new video in the database and makes the video available to other users.

#### Events
Now let's take a closer look at [events](https://learn.microsoft.com/en-us/azure/event-grid/compare-messaging-services#event).

Events are lighter weight than messages and are most often used for broadcast communications.

An event has two components, a publisher and subscribers. The event publisher sends the event. The event subscribers receive events.

With events, receiving components generally decide the communications in which they're interested and then subscribe to those events. 

The subscription is managed by an intermediary. 

The intermediary can be provided by services like Azure Event Grid or Azure Event Hubs. 

When publishers send an event, the intermediary routes that event to any interested parties. 

This pattern is known as a publish-subscribe architecture and is the most used.

Events have the following characteristics:

* An event is a lightweight notification that indicates something occurred.
* An event can be sent to multiple receivers or to none.
* An event publisher has no expectations about actions by a receiving component.
* An event is often intended to "fan out" or have many subscribers for each publisher.
* An event is a discrete unit that's unrelated to other events, but an event might be part of a related and ordered series.

### Things to consider when choosing messages or events
Review the following scenarios regarding when to choose message or event communication for your application architecture.

* Consider messages and events. 
	* It's not uncommon for an application to implement both events and messages. 
	* An app can use events for some components and functions and messages for other components. 
	* Choose each Azure service to meet the specific needs of each component of your app.

* Consider sender expectations. 
	* If the sending component in your application expects communication to be processed in a specific way by the destination component, consider implementing messages. 
	* If the sender component in your application has no requirements for the destination component, you might implement events rather than messages.

* Consider guaranteed communication. 
	* If you're building a distributed application and want to guarantee all communication is processed, consider using messages. 
	* In a message communication, there's an expectation that both the message sender and receiver complete their tasks.

* Consider ephemeral communication. 
	* Ephemeral means the communication might not be handled by any receiver if none is currently subscribing. 
	* If your application doesn't require subscribers or actions from any receiver, consider using events.



## Design a messaging solution
Azure offers two message-based solutions, Azure Queue Storage and Azure Service Bus. 

Queue Storage stores large numbers of messages in Azure Storage. 

Service Bus is a message broker that decouples applications and services. 

We'll examine the different features and capabilities of these services and consider how to choose which service to implement.

### Things to know about Azure Queue Storage
[Azure Queue Storage](https://learn.microsoft.com/en-us/azure/storage/queues/storage-queues-introduction) is a service that uses Azure Storage to store large numbers of messages. 

Examine the following characteristics of the service.

* Queues in Azure Queue Storage can contain millions of messages.
* The number and size of queues is limited only by the capacity of the Azure storage account that owns the Queue Storage.
* Messages in Queue Storage can be securely accessed from anywhere in the world by using a simple REST-based interface.
* Queues generally provide increased reliability, guaranteed message delivery, and transactional support.

### Things to know about Azure Service Bus
[Azure Service Bus](https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview) is a fully managed enterprise message broker. 

Service Bus is used to decouple applications and services from each other. 

Review the following benefits characteristics of the service.

* Azure Service Bus supports message queues and publish-subscribe topics.
* Azure Service Bus lets you load-balance work across competing workers.
* You can use Service Bus to safely route and transfer data and control across service and application boundaries.
* Service Bus helps you coordinate transactional work that requires a high degree of reliability.

#### Message queues
[Azure Service Bus message queues](https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-queues-topics-subscriptions#queues) is a message broker system built on top of a dedicated messaging infrastructure. 

Like Azure queues, Service Bus holds messages until the target is ready to receive them.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-application-architecture/media/service-bus-queue.png)

Azure Service Bus message queues are intended for enterprise applications, such as an app that uses communication protocols and different data contracts.

#### Publish-subscribe topics
[Azure Service Bus publish-subscribe topics](https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-queues-topics-subscriptions#topics-and-subscriptions) are like queues but can have multiple subscribers. 

When a message is sent to a topic, multiple components can be triggered to perform a task.

### Business scenario
Consider the scenario where a customer is watching a video on an app. 

The app supports both user history and fan lists. 

You can support both actions by using publish-subscribe topic attributes:

* The mobile app sends a message to the `Watched` topic.
* The topic has two subscriptions. The first subscription completes the `UpdateUserWatchHistory` action. A second subscription completes the `UpdateProductFanList` action.
* Each subscription for the Watched topic receives its own copy of the message.

### Things to consider when choosing messaging services
Each Azure messaging solution has a slightly different set of features and capabilities. 

You can choose one solution or use both to fulfill your design requirements. 

Review the following scenarios, and think about which messaging solutions can benefit your architecture.

Messaging solution | Example scenarios
--- | ---
Azure Queue Storage | You want a simple queue to organize messages. <br /> <br /> You need an audit trail of all messages that pass through the queue. <br /> <br /> You expect the queue storage to exceed 80 GB. <br /> <br /> You'd like to track progress for processing a message inside of the queue.
Azure Service Bus <br /> (message queues) | You require an at-most-once delivery guarantee. <br /> <br /> You require at-least-once message processing (PeekLock receive mode). <br /> <br /> You require at-most-once message processing (ReceiveAndDelete receive mode). <br /> <br /> You want to group messages into transactions. <br /> <br /> You want to receive messages without polling the queue. <br /> <br /> You need to handle messages larger than 64 KB. <br /> <br /> You expect the queue storage won't exceed 80 GB. <br /> <br /> You'd like to publish and consume batches of messages.
Azure Service Bus <br /> (publish-subscribe topics) | You need multiple receivers to handle each message. <br /> <br /> You expect multiple destinations for a single message but need queue-like behavior.



## Design an Azure Event Hubs messaging solution
Certain applications produce a massive number of events from almost as many sources. 

These application scenarios are often referred to as Big Data. 

Big Data can require extensive infrastructure.

### Things to know about Azure Event Hubs
[Azure Event Hubs](https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-about) is a fully managed, big data streaming platform and event ingestion service. 

Let's review the characteristics of the service:

* Azure Event Hubs supports real time data ingestion and microservices batching on the same stream.

* You can send and receive events in many different languages. Messages can also be received from Azure Event Hubs by using Apache Storm.

* Events received by Azure Event Hubs are added to the end of its data stream.
	* The data stream orders events according to the time they event is received.
	* Consumers can seek along the data stream by using time offsets.

* Event Hubs implements a pull model that differentiates it from other messaging services like Azure Service Bus queues.
	* Event Hubs holds each message in its cache and allows it to be read.
	* When a message is read from Event Hubs, it's not deleted. The message remains for other consumers.

* Event Hubs doesn't have a built-in mechanism to handle messages that aren't processed as expected.

* Azure Event Hubs scales according to the number of [purchased throughput (processing) units](https://azure.microsoft.com/pricing/details/event-hubs/). Performance features vary for each pricing tier, such as Basic, Standard, or Premium.

### Things to consider when using Azure Event Hubs
As you plan for how Azure Event Hubs can be a part of your messaging solution, consider the following points.

* Consider common implementations. 
	* Identify whether your application scenario is suited for event-hubs messaging. 
	* There are several common scenarios where Azure Event Hubs is a great messaging solution. 
	* Event hubs are ideal for live dashboarding, supporting analytics pipelines like clickstreams, and detecting anomalies like fraud or outlier actions. 
	* Event hubs are also a good solution for processing transactions with real-time analysis and archiving data.

* Consider language and framework integration. 
	* Azure Event Hubs supports sending and receiving events in many different languages. 
	* The robust language and framework support makes it easy to integrate Event Hubs with other Azure and non-Azure services.

* Consider pricing tier and throughput units. 
	* Choose the pricing tier that offers the features and capabilities required by your application. 
	* Control how your Azure Event Hubs implementation scales by purchasing the necessary throughput or processing units. 
	* A single throughput unit equates to:
		* **Ingress:** Up to 1 MB per second or 1,000 events per second (whichever comes first)
		* **Egress:** Up to 2 MB per second or 4,096 events per second

* Consider pull model benefits. 
	* Investigate how the pull model implemented by Event Hubs can benefit your application communication. 
	* Event Hubs holds a message in its cache and allows it to be read. When a message is read, it isn't deleted. 
	* The message remains for other consumers.

* Consider message failures. 
	* Remember Azure Event Hubs doesn't handle messages that aren't processed as expected. 
	* Suppose a message consumer malfunctions because of data format. 
	* Event Hubs won't detect this issue. 
	* The message remains until its time-to-live setting has expired.

* Consider data stream access. 
	* Event Hubs adds received events to the end of its data stream, and the events are ordered according to the time they're received. 
	* Event consumers can seek along the data stream by using time offsets.



## Design an event-driven solution
An event-driven architecture enables you to connect to the core application without needing to modify the existing code. 

When an event occurs, you can react with specific code to respond to the event. 

An event-driven application uses the send and forget principle. 

An event is sent toward the next system, which can be another service, an event hub, a stream, or a message broker.

### Things to know about Azure Event Grid
[Azure Event Grid](https://learn.microsoft.com/en-us/azure/event-grid/overview) is a fully managed event routing service that runs on [Azure Service Fabric](https://learn.microsoft.com/en-us/azure/service-fabric/service-fabric-overview). 

Event Grid exists to make it easier to build event-based and serverless applications on Azure. 

Examine the following characteristics of the service.

* Azure Event Grid aggregates all your events and provides routing from any source to any destination.
* Event Grid distributes events from sources like Azure Blob Storage accounts and Azure Media Services.
* Events are distributed to handlers like Azure Functions and Azure DevOps Webhooks.
* The service manages the routing and delivery of events from many sources. The management helps to minimize cost and latency by eliminating the need for polling.

### How Azure Event Grid works
The following illustration shows how Azure Event Grid manages the event process from multiple event sources to multiple event handlers.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-application-architecture/media/event-grid.png)

* An event source such as Azure Blob Storage tags events with one or more topics, and sends events to Azure Event Grid.
* An event handler such as Azure Functions subscribes to topics they're interested in.
* Event Grid examines topic tags to decide which events to send to which handlers.
* Event Grid forwards relevant events to subscribers.
* Event Grid sends an event to indicate something has happened or changed. However, the actual object that was changed (text file, video, audio, and so on) isn't part of the event data. Instead, Event Grid passes a URL or identifier to reference the changed object.


### Things to consider when using Azure Event Grid
Azure Event Grid can be an ideal solution for an event-driven application architecture. 

As you review the following considerations, think about how Event Grid can benefit the application architecture.

* Consider multiple services. Choose one or multiple Azure services to fulfill your design requirements.

Azure service | Purpose | Message or Event | Usage scenario
--- | --- | ---
Azure Event Grid | Reactive programming | Event distribution (discrete) | React to status changes
Azure Event Hubs | Big data pipeline | Event streaming (series) | Conduct telemetry and distributed data streaming
Azure Service Bus | High-value enterprise messaging | Message | Fulfill order processing and financial transactions

* Consider distinct roles for services. 
	* Investigate using Azure services side by side to fulfill distinct roles. 
	* An e-commerce site can use Azure Service Bus to process an order, Azure Event Hubs to capture site telemetry, and Azure Event Grid to respond to events like an item being shipped.

* Consider linking services. 
	* Link Azure services together to form an event and data pipeline stream. 
	* In this scenario, Azure Event Grid responds to events in other services. 
	* The following illustration demonstrates how several Azure services can be linked together as an event and data pipeline to stream data.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-application-architecture/media/services-integration.png)



## Design a caching solution
Caching is a common technique that aims to improve the performance and scalability of a system. 

Caching temporarily copies frequently accessed data to fast storage located close to the application. 

When the fast data storage is located closer to an application than its original data store, caching can significantly improve response times for client applications by serving data more quickly.

Caching is most effective when a client instance repeatedly reads the same data, especially when the following conditions apply to the original data store:

* The original data store remains relatively static.
* It's slow compared to the speed of the cache.
* It's subject to a high level of contention.
* It's far away, and network latency can result in slow access to the store.

### Things to know about Azure Cache for Redis
[Azure Cache for Redis](https://learn.microsoft.com/en-us/azure/azure-cache-for-redis/cache-overview) provides an in-memory data store based on the Redis software. 

Redis improves the performance and scalability of an application that uses back-end data stores heavily. 

It's able to process large volumes of application requests by keeping frequently accessed data in the server memory, which can be written to and read from quickly.

Redis brings a critical low-latency and high-throughput data storage solution to modern applications.

Let's review the characteristics of the service:

* Azure Cache for Redis offers two implementation options for developers:
	* The Redis open source (OSS Redis)
	* A commercial product from Redis Labs (Redis Enterprise) as a managed service

* Azure Cache for Redis provides secure and dedicated Redis server instances and full Redis API compatibility.

* You can use Azure Cache for Redis as a distributed data or content cache, session store, or message broker.

* Deploy Azure Cache for Redis as a standalone or with other Azure database services, such as Azure SQL or Azure Cosmos DB.

### How Azure Cache for Redis works
Azure Cache for Redis is operated by Microsoft, hosted on Azure, and usable by any application within or outside of Azure. 

The following illustration shows how Azure Cache for Redis works in applications.

### Things to consider when using Azure Cache for Redis
Azure Cache for Redis improves application performance by supporting common application architecture patterns. 

As you review the following patterns, consider patterns that might be exhibited in the application architecture. 

Think about how Azure Cache for Redis can supply the pattern requirements.

Pattern | Scenario | Solution
--- | --- | ---
Data cache | Databases are often too large to load directly into a cache. | It's common to use the cache-aside pattern to only load data into the cache as needed. <br /> <br /> When the system makes changes to the data, the system can also update the cache, which is then distributed to other clients. <br /> <br /> Additionally, the system can set an expiration on data, or use an eviction policy to trigger data updates into the cache.
Content cache | Many web pages are generated from templates that use static content such as headers, footers, banners. These static items shouldn't change often. | Using an in-memory cache provides quick access to static content compared to back-end datastores. <br /> <br /> This pattern reduces processing time and server load and allows web servers to be more responsive. <br /> <br /> A content cache can allow you to reduce the number of servers needed to handle loads. <br /> <br /> Azure Cache for Redis provides the Redis Output Cache Provider to support this pattern with ASP.NET.
Session store | A session store is commonly used with shopping carts and other user history data that a web application might associate with user cookies. <br /> <br /> Storing too much in a cookie can have a negative effect on performance as the cookie size grows and is passed and validated with every request. | A typical solution uses the cookie as a key to query the data in a database. <br /> <br /> It's faster to use an in-memory cache like Azure Cache for Redis to associate information with a user than interacting with a full relational database.
Job and message queuing | Some application operations take significant time to complete, which might prevent other unrelated jobs or messages from starting. | Applications often add tasks to a queue when the operations associated with the request take time to execute. <br /> <br /> Longer running operations are queued to be processed in sequence, often by another server. This method of deferring work is called task queuing. <br /> <br /> Azure Cache for Redis provides a distributed queue to enable this pattern in your application.
Distributed transactions | Applications sometimes require a series of commands against a back-end datastore to execute as a single atomic operation. <br /> <br /> All commands must succeed, or all commands must be rolled back to the initial state. | Azure Cache for Redis supports executing a batch of commands as a single transaction.



## Design API integration
Publishing an API is a great way to increase market share, generate revenue, and foster innovation. 

However, maintaining even one API brings significant challenges, such as onboarding users, managing revisions, and implementing security.

Developers need a way to reduce the complexity involved in supporting numerous APIs and their management. 

They require an API Management technology that can serve as a front door for all their APIs. 

They need tools to implement security, manage revisions, and perform analytics.

### Things to know about Azure API Management
[Azure API Management](https://learn.microsoft.com/en-us/azure/api-management/api-management-key-concepts) is a cloud service platform that lets you publish, secure, maintain, and analyze all your APIs. 

The following diagram shows how Azure API Management serves as a front door for an organization's APIs, and routes to the server where the APIs are deployed.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-application-architecture/media/api-management.png)

> Azure API Management doesn't host your actual APIs. Your APIs remain where they were originally deployed.

Azure API Management serves as a front door for your APIs. 

In this way, Azure API Management is said to decouple your APIs. 

You set API policies and other management options in Azure, while leaving your deployed back-end APIs untouched.

### Things to consider when using Azure API Management
To determine whether Azure API Management is a suitable choice for managing and publishing your organization's inventory of APIs, there are three essential criteria to consider: 

* Number of APIs
* Rate of API changes
* API administration load. 

If you have a large number of deployed APIs that you revise frequently and require significant administrative overhead, Azure API Management is a strong solution. 

But for scenarios that involve small, static, or simple API deployments, Azure API Management might not be the correct choice.

Review the following criteria, and think about what APIs and API management are required to support your applications.

* Consider number of APIs. 
	* Identify how many APIs you need to manage. 
	* The more APIs you deploy, the greater the need for deployment standardization, and centralization of API control.

* Consider rate of API changes. 
	* Determine the rate at which your organization plans to implement API revisions and versions. 
	* The faster you create API revisions and publish new API versions, the greater the need for a robust, and flexible versioning control system.

* Consider API administration load. 
	* Define how much policy overhead you need to apply to your APIs. 
	* Policies include usage quotas, call rate limits, request transformations, and request validation. 
	* The more configurations and options your APIs require, the greater the need for standardized, and centralized policy implementations.

* Consider standardizing disparate APIs. 
	* Use an API management solution to standardize API specs, generate documentation, and create a consistent base URL for ease of use. 
	* Azure API Management can provide consistent analytics across multiple APIs and ensure compliance across all APIs.

* Consider centralized API management. 
	* Bring multiple APIs under a single administrative umbrella with Azure API Management and centralize all API operations. 
	* Without an API management service, each API is on its own in terms of administration, deployment, and developer access. 
	* A centralized model results in less duplicated effort and increases efficiency.

* Consider enhanced API security. 
	* Azure API Management was designed with API security in mind. 
	* Use the service to manage permissions and access, and protect your APIs from malicious usage. 
	* Azure API Management helps to achieve all corporate and government-related compliance.



## Design an automated app deployment solution
With the move to the cloud, many teams have adopted agile development methods. 

These teams must iterate quickly and repeatedly deploy their solutions to the cloud. 

Teams must be assured their infrastructure is in a reliable state. 

Application code must be managed through a unified process.

To meet these challenges in your design for the example organisation, you're investigating how to automate deployments by using the practice of infrastructure as code. 

Let's explore two Azure solutions for deployment and automation of your applications: 

* Azure Resource Manager templates.
* Azure Automation.

### Things to know about Azure Resource Manager templates
[Azure Resource Manager (ARM) templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/overview) are files that define the infrastructure and configuration for your deployment. 

When you write an ARM template, you take a declarative approach to your resource provisioning. 

ARM templates describe each resource in the deployment, but they don't describe how to deploy the resources.

There are many benefits to using ARM templates for your resource provisioning. 

As you review the benefits, think about how ARM templates can be used in the architecture solution.

* ARM templates are idempotent, which means you can repeatedly deploy the same template and get the same result.
 
* When an ARM template deployment is submitted to Azure Resource Manager, the resources in the ARM template are deployed in parallel. This orchestration feature process allows deployments to finish faster.
 
* The `WhatIf` parameter available in PowerShell and the Azure CLI allows you to preview changes to your environment before deploying the ARM template. This parameter details any creations, modifications, and deletions that will be made by your template.
 
* ARM templates submitted to Resource Manager are validated before the deployment process. This validation alerts you to any errors in your template before resource provisioning.
 
* You can break up your ARM templates into smaller components and link them together at deployment.
 
* Your ARM templates can be integrated into multiple CI/CD tools like Azure DevOps and GitHub Actions.
 
* With deployment scripts, you can run Bash or PowerShell scripts from within your ARM templates. Through extensibility, you can use a single template to deploy a complete solution.


### ARM template formats
There are two formats available for ARM templates and Azure resource deployments, JSON and Bicep. 

JavaScript Object Notation (JSON) is an open-standard file format that multiple languages can use. 

Bicep is a new domain-specific language that was recently developed for authoring templates by using an easier syntax. 

You can use the Bicep CLI to decompile any JSON template into a Bicep template.

### Things to know about Azure Bicep templates
[Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview) is an ARM template language that's used to declaratively deploy Azure resources. 

Bicep is a domain-specific language, which means that it's designed for a specific scenario or domain. 

Bicep is used to create ARM templates.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-application-architecture/media/bicep-to-json.png)

There are many reasons to choose Bicep as the main tool set for your infrastructure as code deployments.

* Bicep is native to the Azure ecosystem. When new Azure resources are released or updated, Bicep will support those features on day one.

* JSON and Bicep templates are fully integrated within the Azure platform. With Resource Manager-based deployments, you can monitor the progress of your deployment in the Azure portal.

* Bicep is a fully supported product with Microsoft Support.

* All state is stored in Azure. Users can collaborate and have confidence their updates are handled as expected.

* If you're already using JSON templates as your declarative template language, it isn't difficult to transition to Bicep. You can use the Bicep CLI to decompile any template into a Bicep template.


### Things to know about Azure Automation
[Azure Automation](https://learn.microsoft.com/en-us/azure/automation/automation-intro) delivers a cloud-based automation and configuration service that supports consistent management across your Azure and non-Azure environments. 

Azure Automation gives you complete control in three service areas: process automation, configuration management, and update management. 

Let's examine the details of this service, and consider how it can be implemented an application architecture.

Service | Description
--- | ---
Process automation | Process automation enables you to automate frequent, time-consuming, and error-prone cloud management tasks. <br /> <br /> This service helps you focus on work that adds business value. <br /> <br /> By reducing errors and boosting efficiency, it also helps to lower your operational costs. <br /> <br /> The service allows you to author runbooks graphically in PowerShell or by using Python.
Configuration management | Configuration management enables access to two features, Change Tracking and Inventory and Azure Automation State Configuration. <br /> <br /> The service supports change tracking across services, daemons, software, registry, and files in your environment. <br /> <br /> The change tracking helps you diagnose unwanted changes and raise alerts.
Update management | The update management service includes the Update Management feature for Windows and Linux systems across hybrid environments. <br /> <br /> The feature allows you to create scheduled deployments that orchestrate the installation of updates within a defined maintenance window.



## Design an app configuration management solution
Traditionally, shipping a new application feature requires a complete redeployment of the application itself. 

Testing or deployment of a feature often requires multiple versions of the application. 

Each deployment might require different configurations, credentials, changing settings or parameters for testing.

Configuration management is a modern software-development practice that decouples configuration from code deployment and enables quick changes to feature availability on demand. 

Decoupling configuration as a service enables systems to dynamically administer the deployment lifecycle.

### Things to know about Azure App Configuration
[Azure App Configuration](https://learn.microsoft.com/en-us/azure/azure-app-configuration/overview) provides a service to centrally manage application settings and feature flags. 

You can use App Configuration to store all the settings for your application and secure their accesses in one place.

App Configuration offers many benefits for an application architecture. 

As you review the features, consider how Azure App Configuration can support deployment for applications.

* Azure App Configuration is a fully managed service that can be set up in minutes, and supports native integration with popular frameworks.
 
* App Configuration offers flexible key representations and mappings, and point-in-time replay of settings.
 
* App Configuration has a dedicated UI for feature flag management, and supports resource tagging with labels.
 
* You can compare two sets of configurations on custom-defined dimensions.
 
* App Configuration provides enhanced security through Microsoft Entra managed identities for Azure resources.
 
* Sensitive information can be encrypted at rest and in transit.
 
* Azure App Configuration works in both development and production environments.
 

### Development
An Azure App Configuration development environment consists of Visual Studio, Visual Studio Code, and the Azure CLI. 

These components are linked to Microsoft Entra ID, App Configuration, and Azure Key Vault.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-application-architecture/media/app-config-development.png)

### Production
An Azure App Configuration production environment consists of Azure and Microsoft Entra managed identities for Azure resources with related Azure services. 

These components are linked to Microsoft Entra ID, App Configuration, and Key Vault.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-application-architecture/media/app-config-production.png)


> Azure Automation gives you complete control of update management.

> Azure Event Hubs can handle millions of events with low latency. Azure Event Hubs can stream events to Azure Blob Storage.

