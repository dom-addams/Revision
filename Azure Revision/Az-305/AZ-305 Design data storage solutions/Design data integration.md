# _Design data integration_
Azure Architects design and recommend data integration solutions.

Learning objectives:

* Design a data integration solution with Azure Data Factory.
* Design a data integration solution with Azure Data Lake.
* Design a data integration and analytics solution with Azure Databricks.
* Design a data integration and analytics solution with Azure Synapse Analytics.
* Design strategies for hot, warm, and cold data paths.
* Design an Azure Stream Analytics solution for data analysis.

## Design a data integration solution with Azure Data Factory
[Azure Data Factory](https://azure.microsoft.com/services/data-factory/) is a cloud-based data integration service that can help you create and schedule data-driven workflows. 

You can use Azure Data Factory to orchestrate data movement and transform data at scale. 

The data-driven workflows, or pipelines, ingest data from disparate data stores. 

Azure Data Factory is an ETL data integration process, which stands for extract, transform, and load. 

This integration process combines data from multiple data sources into a single data store.

### Things to know about Azure Data Factory
There are four major steps to create and implement a data-driven workflow in the Azure Data Factory architecture:

1. Connect and collect. First, ingest the data to collect all the data from different sources into a centralized location.
2. Transform and enrich. Next, transform the data by using a compute service like Azure Databricks and Azure HDInsight Hadoop.
3. Provide continuous integration and delivery (CI/CD) and publish. Support CI/CD by using GitHub and Azure DevOps to deliver the ETL process incrementally before publishing the data to the analytics engine.
4. Monitor. Finally, use the Azure portal to monitor the pipeline for scheduled activities and for any failures.

The following diagram shows how Azure Data Factory orchestrates the ingestion of data from different data sources. 

Data is ingested into a Storage blob and stored in Azure Synapse Analytics. 

Analysis and visualization components are also connected to Azure Data Factory. 

Azure Data Factory provides a common management interface for all of your data integration needs.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-data-integration/media/azure-data-factory-overview.png)

### Components of Azure Data Factory
Azure Data Factory has the following components that work together to provide the platform for data movement and data integration.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-data-integration/media/data-factory-components.png)

* **Pipelines and activities:** Pipelines provide a logical grouping of activities that perform a task. An activity is a single processing step in a pipeline. Azure Data Factory supports data movement, data transformation, and control activities.
* **Datasets:** Datasets are data structures within your data stores.
*  **Linked services:** Linked services define the required connection information needed for Azure Data Factory to connect to external resources.
*  **Data flows:** Data flows allow data engineers to develop data transformation logic without writing code. Data flow activities can be operationalized by using existing Azure Data Factory scheduling, control, flow, and monitoring capabilities.
*  **Integration runtimes:** Integration runtimes are the bridge between the activity and linked Services objects. There are three types of integration runtime: Azure, self-hosted, and Azure-SSIS.

### Things to consider when using Azure Data Factory
Evaluate Azure Data Factory against the following decision criteria and consider how the service can benefit your data integration solution.

* Consider requirements for data integration. 
	* Azure Data Factory serves two communities: the big data community and the relational data warehousing community that uses SQL Server Integration Services (SSIS). 
	* Depending on your organization's data needs, you can set up pipelines in the cloud by using Azure Data Factory. 
	* You can access data from both cloud and on-premises data services.

* Consider coding resources. 
	* If you prefer a graphical interface to set up pipelines, then Azure Data Factory authoring and monitoring tool is the right fit for your needs. 
	* Azure Data Factory provides a low code/no code process for working with data sources. 

* Consider support for multiple data sources. 
	* Azure Data Factory supports 90+ connectors to integrate with disparate data sources.

* Consider serverless infrastructure. 
	* There are advantages to using a fully managed, serverless solution for data integration. 
	* There's no need to maintain, configure or deploy servers, and you gain the ability to scale with fluctuating workloads.



## Design a data integration solution with Azure Data Lake
A data lake is a repository of data that's stored in its natural format, usually as blobs or files. 

[Azure Data Lake](https://azure.microsoft.com/solutions/data-lake/) Storage is a comprehensive, scalable, and cost-effective data lake solution for big data analytics built into Azure. 

Azure Data Lake Storage combines a file system with a storage platform to help you quickly identify insights into your data. 

The solution builds on Azure Blob Storage capabilities to provide optimizations for analytics workloads. 

This integration enables analytics performance, high-availability, security, and durability capabilities of Azure Storage.

> The current implementation of the service is Azure Data Lake Storage Gen2.


### Things to know about Azure Data Lake Storage
To better understand Azure Data Lake Storage, examine the following characteristics.

* Azure Data Lake Storage can store any type of data by using the data's native format. With support for any data format and massive data sizes, Azure Data Lake Storage can work with structured, semi-structured, and unstructured data.
* The solution is primarily designed to work with Hadoop and all frameworks that use the Apache Hadoop Distributed File System (HDFS) as their data access layer. Data analysis frameworks that use HDFS as their data access layer can directly access.
* Azure Data Lake Storage supports high throughput for input and output–intensive analytics and data movement.
* The Azure Data Lake Storage access control model supports both Azure role-based access control (RBAC) and Portable Operating System Interface for UNIX (POSIX) access control lists (ACLs).
* Azure Data Lake Storage utilizes Azure Blob replication models. These models provide data redundancy in a single datacenter with locally redundant storage (LRS).
* Azure Data Lake Storage offers massive storage and accepts numerous data types for analytics.
* Azure Data Lake Storage is priced at Azure Blob Storage levels.

### How Azure Data Lake Storage works
There are three important steps to use Azure Data Lake Storage:

1. Ingest data. Azure Data Lake Storage offers many different data ingestion methods:

	* For unplanned data, you can use tools like AzCopy, the Azure CLI, PowerShell, and Azure Storage Explorer.
	* For relational data, the Azure Data Factory service can be used. You can transfer data from any source, such as Azure Cosmos DB, SQL Database, Azure SQL Managed instances, and more.
	* For streaming data, you can use tools like Apache Storm on Azure HDInsight, Azure Stream Analytics, and so on.

The following diagram shows how unplanned data and streaming data are bulk ingested or unplanned ingested in Azure Data Lake Storage.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-data-integration/media/data-lake.png)

2. Access stored data. 

	* The easiest way to access your data is to use Azure Storage Explorer. 
	* Storage Explorer is a standalone application with a graphical user interface (GUI) for accessing your Azure Data Lake Storage data. 
	* You can also use PowerShell, the Azure CLI, HDFS CLI, or other programming language SDKs for accessing the data.

3. Configure access control. 

	* Control who can access the data stored in Azure Data Lake Storage by implementing an authorization mechanism. You can choose Azure RBAC or ACL.


### Things to consider when choosing Azure Blob Storage or Azure Data Lake
The following table compares storage solution criteria for using Azure Blob Storage versus Azure Data Lake. 

Review the criteria and consider which solution is optimal.

Compare | Azure Data Lake | Azure Blob Storage
--- | --- | ---
Data types | Good for storing large volumes of text data | Good for storing unstructured non-text based data like photos, videos, and backups
Geographic redundancy | Must manually configure data replication | Provides geo-redundant storage by default
Namespaces | Supports hierarchical namespaces | Supports flat namespaces
Hadoop compatibility | Hadoop services can use data stored in Azure Data Lake | By using Azure Blob Filesystem Driver, applications and frameworks can access data in Azure Blob Storage
Security | Supports granular access | Granular access isn't supported



## Design a data integration and analytic solution with Azure Databricks
[Azure Databricks](https://learn.microsoft.com/en-us/azure/databricks/introduction/) is a fully managed, cloud-based Big Data and Machine Learning platform, which empowers developers to accelerate AI and innovation. 

Azure Databricks provides data science and engineering teams with a single platform for big data processing and Machine Learning. 

The Azure Databricks managed Apache Spark platform makes it simple to run large-scale Spark workloads.

### Things to know about Azure Databricks
Azure Databricks is entirely based on Apache Spark, and it's a great tool for users who are already familiar with the open-source cluster-computing framework. 

As a unified analytics engine, it's designed specifically for big data processing. 

Data scientists can take advantage of the built-in core API for core languages like SQL, Java, Python, R, and Scala.

Azure Databricks has a Control plane and a Data plane:

* **Control Plane:** 
	* Hosts Databricks jobs, notebooks with query results, and the cluster manager. 
	* The Control plane also has the web application, hive metastore, and security access control lists (ACLs), and user sessions. 
	* These components are managed by Microsoft in collaboration with Azure Databricks and don't reside within your Azure subscription.

* **Data Plane:** 
	* Contains all the Azure Databricks runtime clusters that are hosted within the workspace. 
	* All data processing and storage exists within the client subscription. 
	* No data processing ever takes place within the Microsoft/Databricks-managed subscription.

Azure Databricks offers three environments for developing data intensive applications.

* **Databricks SQL:** 
	* Azure Databricks SQL provides an easy-to-use platform for analysts who want to run SQL queries on their data lake. 
	* You can create multiple visualization types to explore query results from different perspectives, and build and share dashboards.


* **Databricks Data Science & Engineering:** 
	* Azure Databricks Data Science & Engineering is an interactive workspace that enables collaboration between data engineers, data scientists, and machine learning engineers.
	* For a big data pipeline, the data (raw or structured) is ingested into Azure through Azure Data Factory in batches, or streamed near real-time by using Apache Kafka, Azure Event Hubs, or Azure IoT Hub. 
	* The data lands in a data lake for long term persisted storage within Azure Blob Storage or Azure Data Lake Storage. 
	* As part of your analytics workflow, use Azure Databricks to read data from multiple data sources and turn it into breakthrough insights by using Spark.


* **Databricks Machine Learning:** 
	* Azure Databricks Machine Learning is an integrated end-to-end machine learning environment. 
	* It incorporates managed services for experiment tracking, model training, feature development and management, and feature and model serving.



### Things to consider when using Azure Databricks
You can use Azure Databricks as a solution for multiple scenarios. Consider how the service can benefit your data integration solution.

* Consider data science preparation of data. 
	* Create, clone, and edit clusters of complex, unstructured data. 
	* Turn the data clusters into specific jobs. 
	* Deliver the results to data scientists and data analysts for review.

* Consider insights in the data. 
	* Implement Azure Databricks to build recommendation engines, churn analysis, and intrusion detection.

* Consider productivity across data and analytics teams. 
	* Create a collaborative environment and shared workspaces for data engineers, analysts, and scientists. 
	* Teams can work together across the data science lifecycle with shared workspaces, which helps to save valuable time and resources.

* Consider big data workloads. 
	* Exercise Azure Data Lake and the engine to get the best performance and reliability for your big data workloads. 
	* Create no-fuss multi-step data pipelines.

* Consider machine learning programs. 
	* Take advantage of the integrated end-to-end machine learning environment. 
	* It incorporates managed services for experiment tracking, model training, feature development and management, and feature and model serving.



## Design a data integration and analytic solution with Azure Synapse Analytics
[Azure Synapse Analytics](https://azure.microsoft.com/products/synapse-analytics/) combines features of big data analytics, enterprise data storage, and data integration. 

The service lets you run queries on serverless data or data at scale. 

Azure Synapse supports data ingestion, exploration, transformation, and management, and supports analysis for all your BI and machine learning needs.

### Things to know about Azure Synapse Analytics
Azure Synapse Analytics implements a massively parallel processing (MPP) architecture and has the following characteristics.

The Azure Synapse Analytics architecture includes a control node and a pool of compute nodes.

![IMAGE](https://learn.microsoft.com/en-gb/training/wwl-azure/design-data-integration/media/azure-synapse.png)

* The control node is the brain of the architecture. 
* It's the front end that interacts with all applications. 
* The compute nodes provide the computational power. 
* The data to be processed is distributed evenly across the nodes.

You submit queries in the form of Transact-SQL statements, and Azure Synapse Analytics runs them.

Azure Synapse uses a technology named [PolyBase](https://learn.microsoft.com/en-us/sql/relational-databases/polybase/polybase-guide?) that enables you to retrieve and query data from relational and non-relational sources. You can save the data read in as SQL tables within the Azure Synapse service.

### Components of Azure Synapse Analytics
Azure Synapse Analytics is composed of the five elements:

* Azure Synapse SQL pool: 
	* Synapse SQL offers both serverless and dedicated resource models to work with a node-based architecture. 
	* For predictable performance and cost, you can create dedicated SQL pools. 
	* For irregular or unplanned workloads, you can use the always-available, serverless SQL endpoint.

* Azure Synapse Spark pool: 
	* This pool is a cluster of servers that run Apache Spark to process data. 
	* You write your data processing logic by using one of the four supported languages: Python, Scala, SQL, and C# (via .NET for Apache Spark). 
	* Apache Spark for Azure Synapse integrates Apache Spark (the open source big data engine used for data preparation, data engineering, ETL, and machine learning).

* Azure Synapse Pipelines: 
	* Azure Synapse Pipelines applies the capabilities of Azure Data Factory. 
	* Pipelines are the cloud-based ETL and data integration service that allows you to create data-driven workflows for orchestrating data movement and transforming data at scale. 
	* You can include activities that transform the data as it's transferred, or you can combine data from multiple sources together.

* Azure Synapse Link: 
	* This component allows you to connect to Azure Cosmos DB. 
	* You can use it to perform near real-time analytics over the operational data stored in an Azure Cosmos DB database.

* Azure Synapse Studio: 
	* This element is a web-based IDE that can be used centrally to work with all capabilities of Azure Synapse Analytics. 
	* You can use Azure Synapse Studio to create SQL and Spark pools, define and run pipelines, and configure links to external data sources.


### Analytical options
Azure Synapse Analytics supports a range of analytical scenarios. 

Analysis | Scenario | Description
--- | --- | ---
Descriptive | What is happening? | Azure Synapse applies the dedicated SQL pool capability that enables you to create a persisted data warehouse to analyze what now questions. <br /> You can make use of the serverless SQL pool to prepare data from files stored in a data lake to create a data warehouse interactively.
Diagnostic | Why is it happening? | You can use the serverless SQL pool capability within Azure Synapse to interactively explore data within a data lake. <br /> Serverless SQL pools can quickly enable a user to search for other data that might help them to understand why questions.
Predictive | What is likely to happen? | Azure Synapse Analytics uses its integrated Apache Spark engine and Azure Synapse Spark pools for predictive analytics. <br /> It combines this action with other services, such as Azure Machine Learning Services and Azure Databricks to help you answer what future questions.
Prescriptive | What needs to be done? | You can use prescriptive analytics real-time or near real-time data to help you identify solutions for your what action questions.  <br /> Azure Synapse Analytics provides this capability through Apache Spark and Azure Synapse Link, and by integrating streaming technologies like Azure Stream Analytics.


### Things to consider when choosing Azure Data Factory or Azure Synapse Analytics
The following table compares storage solution criteria for using Azure Data Factory versus Azure Synapse Analytics. 

Review the criteria and consider which solution is optimal.

Compare | Azure Data Factory | Azure Synapse Analytics
--- | --- | ---
Data sharing | Data can be shared across different data factories | Not supported
Solution templates | Solution templates are provided with the Azure Data Factory template gallery | Solution templates are provided in the Synapse Workspace Knowledge center
Integration runtime cross region flows | Cross region data flows are supported | Not supported
Monitor data | Data monitoring is integrated with Azure Monitor | Diagnostic logs are available in Azure Monitor
Monitor Spark Jobs for data flow | Not supported | Spark Jobs can be monitored for data flow by using Synapse Spark pools

Azure Synapse Analytics is an ideal solution for many other scenarios. Consider the following options:

* Consider variety of data sources. When you have various data sources that use Azure Synapse Analytics for code-free ETL and data flow activities.
* Consider Machine Learning. When you need to implement Machine Learning solutions by using Apache Spark, you can use Azure Synapse Analytics for built-in support for AzureML.
* Consider data lake integration. When you have existing data stored on a data lake and need integration with Azure Data Lake and other input sources, Azure Synapse Analytics provides seamless integration between the two components.
* Consider real-time analytics. When you require real-time analytics, you can use features like Azure Synapse Link to analyze data in real-time and offer insights.



## Design strategies for hot, warm, and cold data paths
Traditionally, data was stored on-premises. No consideration was made about how the data was to be used or its lifecycle. 

In the cloud, data can be stored based on access, lifecycle, and other compliance requirements. 

In this unit, we examine hot, warm, and cold data paths, and consider options for storing and computing the data.

### Warm data path
A warm data path supports analyzing data as it flows through the system. 

The data stream is processed in near real time. The data is saved to the warm storage, and pushed to the analytics clients.

* The Azure platform provides many options for processing the events, and [Azure Stream Analytics](https://learn.microsoft.com/en-us/azure/stream-analytics/stream-analytics-introduction) is a popular choice.
* Stream Analytics can execute complex analysis at scale for tumbling, sliding, and hopping windows. The service supports running stream aggregations and joining external data sources. For complex processing, performance can be extended by cascading multiple instances of Azure Event Hubs, Stream Analytics jobs, and Azure functions.
* Warm storage can be implemented with various services on the Azure platform, such as Azure SQL Database and Azure Cosmos DB.

### Cold data path
The warm data path is where stream processing occurs to discover patterns over time. 

However, you might need to calculate utilization over some time period in the past. 

You also might require different pivots and aggregations, and need to merge these results with the warm path results to present a unified view to the user. 

A cold data path can help accomplish these tasks.

* A cold data path consists of a batch layer and serving layers that provide a long-term view of the system.
* The batch layer creates pre-calculated aggregate views to enable fast query responses over long periods. The Azure platform provides diverse technology options for this layer.
* The cold path includes a long-term data store for the solution, and Azure Storage is a common approach. Azure Storage includes Azure Blobs (objects), Azure Data Lake Storage Gen2, Azure Files, Azure Queues, and Azure Tables.
* Cold storage can be either Blobs, Data Lake Storage Gen2, Azure Tables, or a combination.
* To store massive amounts of unstructured data, the best options are Blob Storage, Azure Files, or Azure Data Lake Storage Gen2. Cold path storage is ideal for original messages that contain unprocessed data received by IoT applications.

### Hot data path
A hot data path is typically used for processing or displaying data in real time. 

This path is employed for real-time alerting and streaming operations. 

A hot path is where latency-sensitive data results need to be ready in seconds or less, and where data flows for rapid consumption by analytics clients.

### Compare data paths
The following table compares scenarios for the three path solutions. Review the scenarios and consider which solutions are required.

Scenario | Path solution
--- | ---
Flexible support for data requirements that change frequently. Enable processing or displaying data in real time. | Hot data path
Support data that's rarely used, such as data that's stored for compliance or legal reasons. Enable consumption of data for long term analytics and batch processing. | Cold data path
Store or display a recent subset of data. Enable consumption of data for small analytical and batch processing. | Warm data path



## Design an Azure Stream Analytics solution for data analysis
The process of consuming data streams, analyzing them, and deriving actionable insights is called stream processing.

[Azure Stream Analytics](https://learn.microsoft.com/en-us/azure/stream-analytics/stream-analytics-introduction) is a fully managed (PaaS offering), real-time analytics and complex event-processing engine. 

It offers the possibility to perform real-time analytics on multiple streams of data from sources like IoT device data, sensors, clickstreams, and social media feeds.

### Things to know about Azure Stream Analytics
Azure Stream Analytics works on the following concepts:

* Data streams: 
	* Data streams are continuous data generated by applications, IoT devices, or sensors. 
	* The data streams are analyzed and actionable insights are extracted. 
	* Some examples are monitoring data streams from industrial and manufacturing equipment and monitoring water pipeline data by utility providers. 
	* Data streams help us understand change over time.

* Event processing: 
	* Event processing refers to consumption and analysis of a continuous data stream to extract actionable insights from the events happening within that stream. 
	* An example is how a car passing through a tollbooth should include temporal information like a timestamp that indicates when the event occurred.

> Azure Stream Analytics supports processing events in three data formats: CSV, JSON, and Avro.

### Key features
Stream Analytics ingests data from Azure Event Hubs (including Azure Event Hubs from Apache Kafka), Azure IoT Hub, or Azure Blob Storage. 

The query, which is based on SQL query language, can be used to easily filter, sort, aggregate, and join streaming data over a period. 

You can also extend this SQL language with JavaScript and C# user-defined functions (UDFs).

An Azure Stream Analytics job consists of an input, query, and an output. You can do the following tasks with the job output:

* Route data to storage systems like Azure Blob Storage, Azure SQL Database, Azure Data Lake Store, and Azure Cosmos DB.
* Send data to Power BI for real-time visualization.
* Store data in a Data Warehouse service like Azure Synapse Analytics to train a machine learning model based on historical data or perform batch analytics.
* Trigger custom downstream workflows by sending the data to services like Azure Functions, Azure Service Bus Topics, or Azure Queues.

### Things to consider when using Azure Stream Analytics
Azure Stream Analytics can be a valuable component in your data integration plan. Review the following benefits of the service.

* Consider provisioning requirements. 
	* Azure Stream Analytics is a fully managed service. 
	* It's offered as a PaaS (Platform as a Service) offering, so there's no overhead of provisioning any hardware or infrastructure. 
	* Azure Stream Analytics fully manages your job, so you can focus on your business logic and not on the infrastructure.

* Consider costs. Stream Analytics is low cost. 
	* Billing is done by Streaming Units (SUs) consumed that represents the amount of CPU and memory resources allocated. 
	* Scaling up and down are based on business needs, which can also lower costs. 
	* No maintenance charges are involved.

* Consider implementation. 
	* You can run Azure Stream Analytics in the cloud for large-scale analytics. 
	* For ultra-low latency analytics, run Stream Analytics on IoT Edge or Azure Stack.

* Consider performance. 
	* Stream Analytics offers reliable performance guarantees. 
	* It supports higher performance by partitioning, which allows complex queries to be parallelized and executed on multiple streaming nodes. 
	* Stream Analytics can process millions of events every second. 
	* It can deliver results with ultra-low latencies.

* Consider security. 
	* Stream Analytics encrypts all incoming and outgoing communications and supports TLS 1.2. 
	* Built-in checkpoints are also encrypted. Stream Analytics doesn't store the incoming data because all processing is done in-memory.


