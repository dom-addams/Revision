# _Design a solution to log and monitor Azure resources_
Azure Architects design and recommend logging and monitoring solutions.

Learning objectives:

* Design for Azure Monitor data sources
* Design for Azure Monitor Logs (Log Analytics) workspaces
* Design for Azure Workbooks and Azure insights
* Design for Azure Data Explorer

## Design for Azure Monitor data sources
Azure Monitor is based on a [common monitoring data platform](https://learn.microsoft.com/en-us/azure/azure-monitor/data-platform) that enables you to view, analyze, and work with data gathered from your resources. 

The platform offers many features that support two primary components: Logs and Metrics.

[Azure Monitor Logs](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-platform-logs) lets you collect and organize data from resources that you monitor. 

You configure what data is gathered and how it's organized in the platform. 

Other features in Azure Monitor automatically store their data in Logs. 

You can use the stored data with your collected data to help monitor the performance of your environment.

[Azure Monitor Metrics](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/data-platform-metrics) captures numerical data from your monitored resources and stores the results in a time-organized database. 

Metrics are collected at intervals you specify. You can use metrics to check how your system is performing at a particular time or under certain circumstances.

Other sources of monitoring data are collected by Azure Monitor in addition to the data created by Azure resources.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/wwl-azure/design-solution-to-log-monitor-azure-resources/media/azure-monitor-source.png)

### Things to know about Azure Monitor
As you develop your monitoring plan, consider these characteristics of Azure Monitor.

* Data from multiple resources can be collected into Azure Monitor and analyzed together by using a common set of tools.
* Logs enable complex analysis by using log queries.
* Metrics support near-real-time scenarios like priority alerts and responding to critical issues.
* Monitoring data can be sent to other locations to support certain scenarios, such as tracking and reporting.

* Sources of monitoring data from Azure applications can be organized into tiers, and each tier can be accessed in different ways.
	* The highest tiers are for your application itself.
	* The lower tiers are components of the Azure platform.

### Things to consider when using Azure Monitor
Consider how to implement these features in your monitoring solution:

* Consider data sources and data access. 
	* Identify what Tailwind Traders resources to monitor. 
	* Consider how data from these resources is accessed by other resources or applications.
	* Azure Monitor collects data automatically from a range of components, and the data is accessed in various ways:
		* Application data relates to your custom app code.
		* Operating system data is from the Windows or Linux virtual machines that host your app.
		* Azure resource data is from the operations of an Azure resource, such as a web app or a load balancer.
		* Azure subscription data is about your subscription, including information about Azure health and availability.
		* Azure tenant data describes your Azure organization-level services, such as Microsoft Entra ID.

* Consider queries on Logs data. Write log queries to analyze your collected data.

* Consider alerts based on Logs and Metrics data. 
	* Set up alert rules based on Logs data to be proactively notified about system issues. 
	* Use Metrics data to identify when critical Tailwind Traders issues occur, such as values that exceed defined limits.

* Consider Metrics Explorer to analyze metrics interactively. 
	* Define metrics to monitor about your Tailwind Traders resources, such as peak usage rates, access information, workloads, or incident scenarios. 
	* Use the Metrics Explorer to investigate the collected data. 

> For more information about log queries, see [Advanced features of Metrics Explorer](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-charts).



## Design for Azure Monitor Logs (Log Analytics) workspaces
Azure Monitor stores [log](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-platform-logs) data in an Azure Monitor Logs (Log Analytics) workspace. 

A workspace is an Azure resource that serves as an administrative boundary or geographic location for data storage. 

The workspace is also a container where you collect and aggregate data.

While you can deploy one or more workspaces in your Azure subscription, there are several considerations you should understand to ensure your initial deployment follows Microsoft guidelines. 

The workspace should provide a cost effective, manageable, and scalable deployment that meets your organization's needs.

### Things to know about Azure Monitor Logs workspaces
Review these characteristics of Azure Monitor Logs workspaces and consider how they can contribute to your monitoring solution.

* In a workspace, you can isolate data by granting different users access rights following Microsoft recommended design strategies.
* Data in an Azure Monitor Logs workspace is organized into tables. Each table stores different kinds of data and has its own unique set of properties based on the resource that's generating the data.
* A workspace enables you to configure settings like [pricing tier](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/manage-cost-storage), [retention](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/manage-cost-storage#log-data-retention-and-archive), and [data](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/daily-cap) capping based on administrative boundaries or geographic locations.
* With Azure role-based access control (Azure RBAC), you can grant users and groups only the amount of access they need to work with monitoring data in a workspace.
* Workspaces are hosted on physical clusters. By default, the system creates and manages these clusters.


### Things to consider when using Azure Monitor Logs workspaces
Review below considerations for designing with Azure Monitor Logs workspaces:

* Consider your access control strategy. 
	* As you plan for how many workspaces to use, consider these potential requirements:
		* Is your organization a global company? Do you need log data stored in specific regions for data sovereignty or compliance reasons?
		* Does your architecture use Azure? Do you want to avoid outbound data transfer charges by having a workspace in the same region as the Azure resources it manages?
		* Does the system support multiple departments or business groups? Each group should access their data and not the data of others.

* Consider deployment model options. 
	* Most IT organizations use a centralized, decentralized, or hybrid model for their architecture. 
	* Consider these common workspace deployment models, and how they might work for an organization:

Deployment | Description
--- | ---
Centralized | All logs are stored in a central workspace and administered by a single team. Azure Monitor provides differentiated access per-team. <br /> In this scenario, it's easy to manage, search across resources, and cross-correlate logs. (This model is known as hub and spoke).
Decentralized	 | Each team has their own workspace created in a resource group they own and manage. Log data is segregated per resource <br /> In this scenario, the workspace can be kept secure and access control is consistent with resource access.
Hybrid | A hybrid approach can be complicated by security audit compliance requirements. <br /> Many organizations implement both deployment models in parallel. <br /> The hybrid design commonly results in a complex, expensive, and hard-to-maintain configuration with gaps in logs coverage.

* Consider access mode. 
	* Plan for how your users can access Azure Monitor Logs workspaces and define the scope of data they can access. 
	* Users have two options for accessing their data: Workspace-context and Resource-context

Access mode | Description
--- | ---
Workspace-context | A user can review all logs in the workspace for which they have permission. <br /> Queries are scoped to all data in all tables in the workspace. <br /> Logs are accessed with the workspace as the scope by selecting Logs from the Azure Monitor menu in the Azure portal.
Resource-context | A user accesses the workspace for a particular resource, resource group, or subscription. <br /> By selecting Logs from a resource menu in the Azure portal, they can view logs for only resources in all tables for which they have access. <br /> Queries are scoped to only data associated with that resource. This mode also enables granular Azure RBAC.

* Consider Azure RBAC and workspaces. 
	* Control which users have access to which resources according to their workspace associations.
	* You might grant access to the team responsible for infrastructure services hosted on Azure Virtual Machines. 
	* You can give the team access to only the logs generated by the Virtual Machines. 
	* This approach follows the new resource-context log model. 
	* The basis for this model is for every log record emitted by an Azure resource, it's automatically associated with this resource. 
	* Logs are forwarded to a central workspace that respects scoping and Azure RBAC based on the resources.

* Consider scale and ingestion volume rate limit. 
	* Azure Monitor is a high scale data service that serves thousands of customers sending petabytes of data each month at a growing pace. 
	* Workspaces aren't limited in their storage space and can grow to petabytes of data. 
	* There's no need to split workspaces due to scale.



## Design for Azure Workbooks and Azure insights
Azure Workbooks is a feature of Azure Monitor. 

Workbooks provide a flexible canvas for data analysis and the creation of rich visual reports within the Azure portal. 

Customers use Workbooks to explore the usage of an app, to do root cause analysis, put together an operational playbook, and many other tasks.

The real power of Workbooks is the ability to combine data from disparate sources within a single report. 

You can create composite resource views or joins across resources enabling richer data and insights that would otherwise be impossible.

### Things to know about Azure Workbooks
Review the following characteristics of Workbooks.

* Azure Workbooks lets you tap into multiple data sources from across Azure and combine them into unified interactive experiences.
* Authors of workbooks can transform ingested data to provide insights into the availability, performance, usage, and overall health of the underlying components.
* You can analyze performance logs from virtual machines to identify high CPU or low memory instances and display the results as a grid in an interactive report.

* Workbooks are currently compatible with the following data sources:
	* [Logs](https://learn.microsoft.com/en-us/azure/azure-monitor/visualize/workbooks-data-sources)
	* [Metrics](https://learn.microsoft.com/en-us/azure/azure-monitor/visualize/workbooks-data-sources)
	* [Azure Resource Graph](https://learn.microsoft.com/en-us/azure/azure-monitor/visualize/workbooks-data-sources)
	* [Alerts](https://learn.microsoft.com/en-us/azure/azure-monitor/visualize/workbooks-data-sources)
	* [Workload Health](https://learn.microsoft.com/en-us/azure/azure-monitor/visualize/workbooks-data-sources)
	* [Azure Resource Health](https://learn.microsoft.com/en-us/azure/azure-monitor/visualize/workbooks-data-sources)
	* [Azure Data Explorer](https://learn.microsoft.com/en-us/azure/azure-monitor/visualize/workbooks-data-sources)

### Azure insights and Workbooks
The reputation of your organization depends on the performance, reliability, and security of its systems. 

It's critical to monitor your systems closely to identify any performance problems or attacks before they can affect users. 

If your payment system can't process user transactions during a high-volume holiday sales period, your customers might lose confidence in your business.

For an effective monitoring solution, combine Azure insights about your resources and apps with Azure Workbooks.

### Things to know about Azure insights
 Consider these characteristics about insights:

* Azure insights provide a customized monitoring experience for particular applications and services.
* Azure insights collect and analyze both logs and metrics.
* Many insights are provided as features of Azure Monitor. 

Here are some examples:

Insight | Description
--- | ---
[Application Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview) | Monitor your live web application on any platform by using this extensible Application Performance Management (APM) service that's available in Azure Monitor.
[Container insights](https://learn.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-overview) | Check the performance of container workloads deployed to either Azure Container Instances or managed Kubernetes clusters hosted on Azure Kubernetes Service (AKS).
[Networks insights](https://learn.microsoft.com/en-us/azure/azure-monitor/insights/network-insights-overview) | Obtain comprehensive information on the health and metrics for all your network resources. <br /> Use the advanced search capability to identify resource dependencies.
[Resource group insights](https://learn.microsoft.com/en-us/azure/azure-monitor/insights/resource-group-insights) | Triage and diagnose any problems your individual resources encounter, while offering context as to the health and performance of the resource group as a whole.
[Virtual machine insights](https://learn.microsoft.com/en-us/azure/azure-monitor/vm/vminsights-overview) | Monitor your Azure Virtual Machines, Virtual Machine Scale Sets, and other virtual machines.
[Azure Cache for Redis insights](https://learn.microsoft.com/en-us/azure/azure-monitor/insights/redis-cache-insights-overview) | Review a unified, interactive report of overall performance, failures, capacity, and operational health.
[Azure Cosmos DB insights](https://learn.microsoft.com/en-us/azure/azure-monitor/insights/cosmosdb-insights-overview) | Get information on the overall performance, failures, capacity, and operational health of all your Azure Cosmos DB resources in a unified interactive experience.
[Azure Key Vault insights](https://learn.microsoft.com/en-us/azure/azure-monitor/insights/key-vault-insights-overview) | Monitor your key vaults by using a unified report of your Key Vault requests, performance, failures, and latency.
[Azure Storage insights](https://learn.microsoft.com/en-us/azure/storage/common/storage-insights-overview?toc=/azure/azure-monitor/toc.json) | Do comprehensive monitoring of your Storage accounts via a unified report of your Storage performance, capacity, and availability.


### Things to consider when using Azure insights and Workbooks
Consider these points as you prepare your plan for using Azure insights and Workbooks.

* Consider Azure Workbooks. 
	* Explore how Tailwind Traders apps can be used with Azure Workbooks. 
	* Investigate the root cause analysis of incidents, and put together an operational playbook for your team.

* Consider Azure insights and data analysis. 
	* Include Azure insights for a custom monitoring experience for apps and services. 
	* Review insights about your network, VMs, and other Azure resources. 
	* Collect Logs and Metrics data from Workbooks and analyze the data.

* Consider combined data sources and visual reporting. 
	* Combine data from Tailwind Traders sources in a single report. 
	* Create composite resource views for more robust data and greater insights. 
	* Prepare rich visual reports within the Azure portal.



## Design for Azure Data Explorer
[Azure Data Explorer](https://learn.microsoft.com/en-us/azure/data-explorer/data-explorer-overview) is a platform for big data that helps you analyze high volumes of data in near real time. 

Azure Data Explorer comes equipped with features to help you configure an end-to-end solution for ingesting and managing your data, running queries, and generating visualizations.

### Things to know about Azure Data Explorer
Consider these characteristics of Azure Data Explorer that can help enhance your monitoring solution.

* Azure Data Explorer is a fast and highly scalable data exploration service for log and telemetry data.
* Azure Data Explorer helps you handle multiple data streams, so you can collect, store, and analyze your data from all resources.
* Analyze large volumes of diverse data from any data source, such as websites, applications, IoT devices, and more.
* Use Azure Data Explorer for diagnostics, monitoring, reporting, machine learning, and other analytics tasks.


### Things to consider when using Azure Data Explorer
The following diagram shows a hybrid end-to-end monitoring solution that's integrated with Azure Sentinel and Azure Monitor. 

This configuration ingests streamed and batched logs from multiple sources, on-premises, or any cloud within an enterprise ecosystem. 

Consider how this solution could be implemented in the Tailwind Traders architecture to monitor various logs.

![DIAGRAM](https://learn.microsoft.com/en-gb/training/wwl-azure/design-solution-to-log-monitor-azure-resources/media/azure-data-explorer.png)

* Consider native capabilities in Azure Monitor. 
	* Implement the native capabilities of Azure Monitor to monitor assets. 
	* Run and monitor tasks from the dashboard, and set up alerts to ingest logs from VMs and services.

* Consider features of Microsoft Sentinel. 
	* Combine features provided by Microsoft Sentinel and Azure Monitor with Azure Data Explorer to build a flexible and cost-optimized end-to-end monitoring solution.

* Consider advantages of Azure Data Explorer. 


* Take advantage of the flexibility and control offered by Azure Data Explorer for all aspects and types of logs in the following scenarios:
	* Microsoft Sentinel and Azure Monitor SaaS solutions don't offer out-of-the-box support for certain scenarios like application trace logs.
	* Azure Data Explorer provides greater flexibility for building quick and easy near-real-time analytics dashboards, pattern recognition, and [time series analysis](https://learn.microsoft.com/en-us/azure/data-explorer/time-series-analysis).
	* Azure Data Explorer is well integrated with ML services, such as Databricks and Azure Machine Learning.
	* Azure Data Explorer supports long data retention in a cost effective manner.
	* Azure Data Explorer, as a unified big data analytics platform, allows you to build advanced analytics scenarios. You can have a centralized repository for different types of logs.

