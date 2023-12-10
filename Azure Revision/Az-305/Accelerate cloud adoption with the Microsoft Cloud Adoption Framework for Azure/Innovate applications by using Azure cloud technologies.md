# _Innovate applications by using Azure cloud technologies_
Innovation is a complex subject that encompasses many disciplines. 

The agility of the public cloud allows to quicker innovation cycles and quicker hypothesis verification. 

Learn how to use Azure cloud technologies to sustain your organization's innovation requirements.

Learning objectives:

* Understand the innovation cycle
* Map Azure services to the phases of the innovation cycle
* Correlate technologies to business outcomes of innovation

## Follow the innovation lifecycle
If processes are established to introduce changes frequently, those changes are smaller in size and risk. 

However, this process doesn't just involve adopting certain tools or technologies. It requires a culture that fosters change and accepts failures.

The concept of accepting failures might seem counterintuitive, but it's vital to the innovation cycle. 

If people are afraid to fail because errors put them at the center of blame games, they're not likely to pursue new approaches to problem solving because of the fear of failure. 

The whole organization then becomes a prisoner of its established practices.

It's possible to establish a "fail fast" culture where people are encouraged to try out new methods. 

They're empowered to quickly change direction if they don't get the expected outcome, helping to create a richer innovation culture.

### Hypothesis-based innovation
You could describe innovation as a hypothesis-based, iterative cycle. 

When you identify the existence of a problem, one or more hypotheses can be formulated to potentially explain the root cause and lead to the solution. 

The definition of the problem itself can be challenging, because it needs to be measurable.

For example, the problem definition "Customers aren't happy with our payment platform choices" isn't measurable, so it's difficult to solve. 

If you can define the problem as "23 percent of customers leave their shopping session at the step of choosing the payment platform," you're in a better position to measure the success of any possible solution.

After you define a problem in a measurable way, you can formulate hypotheses that are candidates for explaining and solving the problem. 

Now an idea is on the table, acting on it is a matter of verifying its validity.

Hypotheses should focus on adding value to customers and improving their experience in their interactions with your organization. 

This idea is known as customer empathy: placing your customer at the center of your innovation, and focusing on increasing value for them and for you.

There are many ways to validate a hypothesis without touching application code. 

Customer surveys and market research are two examples of valuable information sources that can help to decide the validity of a hypothesis. 

Checking these sources allow you to qualify your hypothesis, and to build hypotheses with the highest likelihood of accuracy and added business value.

### Build
After a hypothesis has enough value potential to be built into your application, the build process starts. Here again, speed is crucial.

Your development sprints should be as short as possible. 

Keeping sprints short allows quick verification or rejection of the hypothesis. 

It also potentially allows you to fine-tune the way in which the required functionality is integrated into the application. 

The result is quicker innovation cycles.

### Measure
You want to verify the accuracy of your hypothesis as soon as possible. 

A minimum viable product (MVP) is a preliminary version of the new functionality that gathers feedback and helps confirm whether you're moving in the right direction.

The goal of the MVP is verifying not only your hypothesis, but any assumptions you might have made, too. 

The MVP should be designed to confirm or reject these assumptions and the hypothesis.

### Learn
The learn phase is similar to the start of the process. 

After you learn more about your assumptions and hypothesis, you might find out that they were right, partially right, or wrong. 

Having a growth mindset and enough humility to admit failures allows you to either:

* Quickly pivot if you need to continue working on your MVP.
* Refocus your efforts in other areas and formulate an alternative hypothesis.

It's important to realize that even if your assumptions and hypothesis were wrong, the process has allowed you to learn something new about your customers and your business. 

Don't think of it as wasted time. 

The key is gaining that knowledge as soon as possible and applying it to a future hypothesis. 

This idea is the core of the fail-fast culture.



## Azure technologies for the build process
In this unit, you learn the relationship between the innovation process and some of the technologies in the industry that can help you to build new functionality into applications.

### DevOps
After you've started the build phase to validate your innovation hypothesis, the required development, integration, and deployment cycles should be as streamlined as possible. 

This phase is where DevOps comes in. 

You can define DevOps as "processes and tools to deliver software features quickly and reliably." 

Here are details about this definition:

* Processes and tools: 
	* DevOps, and the innovation process as a whole, is based on culture patterns that encourage change. 
	* Azure and GitHub offer great tooling around DevOps, but purchasing a license isn't enough. 
	* Your processes and organizational culture need to evolve to embrace change and innovation.

* Quick delivery of software features: 
	* DevOps processes and tools embrace the concept of failing fast. 
	* Building MVPs or prototypes to quickly validate whether the feature on which you're working goes in the right direction is core to the concept of DevOps.

* Reliable delivery of software features: 
	* Change-averse organizations often associate quick changes with downtime. 
	* However, DevOps promises exactly the opposite: a quick change rate and a high level of reliability. 
	* This reliability is made possible by integrating testing in early stages of the development cycle, in a process called "shift to the left."

If the development of a feature across time is seen as a line from left to right.

Then, a legacy development process would perform user validation and quality control at the end of the development cycle. 

At the "right" end of that line. DevOps advises you to test and validate as early as possible, at the "left" of that time line.

DevOps embodies the same core concepts of a healthy innovation culture. Adopting its methodology is key to get to an agile innovation cycle.



### Microservices architectures
Modularity is a well-known technique to reduce complexity in architecting complex systems. 

If a system is a complex interaction of many pieces that can't be taken apart (often called a "monolith"), tight component interdependencies make system improvements difficult. 

Every change needs to be validated with the rest of the system, so the test process is complex.

If the system is modular, you can separate it into smaller subsystems that interact with each other via well-defined interfaces. 

Introducing changes in one of these subsystems is easier, because as long as its interface with the other modules stays constant, the overall system continues working.

Microservices architectures are application patterns that exploit modularity. 

Applications are subdivided into separate, small components that can be developed independently from each other, potentially even using different programming languages. 

Each component, or microservice, can operate on its own. 

You can scale it as required, you can troubleshoot it as a single unit, you can modify it independently from the other microservices.

A question that organizations often ask is what to do if an application is monolithic. 

Should the organization redesign the application into a microservices architecture before introducing innovation, or can the innovation and redesign processes run in parallel? There's no single answer to this question. 

It depends on the complexity and business relevance of the application under consideration.

The projects are to interact with each other, guided by the business value of innovations. 

The redesign efforts are to focus on the most critical application areas, where the need for modification to improve customer experience is highest.

### Containers
The technology of containerization isn't exclusive to microservices architectures, but the concepts work together. 

Containers are a way to encapsulate application code and its dependencies so that they can be deployed effortlessly in any platform.

Traditional application deployments require the organization to install software first, such as the application runtime, programming libraries, or external components. 

This approach often results in the "it works on my machine" problem: it's difficult to replicate the same environment across development, test, staging, and production. 

Small differences in the way that the application dependencies are installed can cause the application to work fine while being tested, but fail when it's deployed into production.

Containers change the rules of the game. 

The application dependencies are packed along with the application code in an autonomous deployment unit called the container image. 

Whether the application container is deployed on a developer's laptop or in a production cluster with hundreds of nodes, the dependency handling is the same. 

The container works exactly the same way, so application testing is more reliable and trustworthy.

Containers have come a long way since Docker released their code as open source in 2013. 

Containers now support both Linux and Windows, and different CPU architectures. 

There are many offers in Azure that allow container-based workloads to run. In this unit, you learn about some of them.

### Kubernetes and Red Hat OpenShift
A container runtime is the technology that starts containers on a computer, but more logic is required in a production environment. 

Who deploys more containers if more performance is required? 

Who restarts the containers if they have a problem? 

If multiple computers are available, who decides on which of them a certain container should be started? 

These and other tasks are the responsibility of a container orchestration platform.

The first version of Kubernetes was released in 2015, and it soon became the de facto standard for container orchestration. 

Kubernetes clusters consist of several worker nodes. 

Each worker node has a container runtime, so it can run containers where the Kubernetes control plane schedules the deployment of containerized applications. 

This control plane typically runs in a set of core nodes. 

It's responsible for keeping the application running correctly, scaling the application up or down, and carrying out any required updates.

One of the main reasons for Kubernetes' popularity is the hardware independence that containers provide. 

Because container-based applications can be reliably deployed to any container runtime, you can run Kubernetes in clouds that use various hypervisors. 

The deployed applications should behave in a similar way (assuming that the underlying hardware resources are similar too). 

Many organizations have adopted Kubernetes as an abstraction layer that allows consistent application deployment processes both on-premises and in public clouds.

Running Kubernetes in Azure is easy. 

[Azure Kubernetes Service](https://learn.microsoft.com/en-us/azure/aks/intro-kubernetes) is simple to deploy and cost efficient, because the customer is only charged for the cost of the worker nodes. 

Microsoft carries the cost and operation of the control plane that contains the core components. 

Microsoft patches and updates the operating system of the worker nodes, further reducing the operational complexity of managing a Kubernetes cluster to run Linux and Windows containers.

[OpenShift](https://www.openshift.com/) is an application-deployment platform based on Kubernetes, developed and supported by [Red Hat](https://www.redhat.com/). 

It incorporates many other functionalities. 

Some of the organizations that choose to run their applications on OpenShift do so because of these extra features and the support that Red Hat provides. 

Running OpenShift on Azure is again simple.

[Azure Red Hat OpenShift](https://learn.microsoft.com/en-us/azure/openshift/intro-openshift) consists of an OpenShift cluster where Microsoft manages many of its aspects, including the whole lifecycle of the cluster.

### Azure App Service
Azure App Service is a platform where organizations can run their web-based workloads without having to manage any orchestrator or underlying operating system. 

The only requirement is uploading the application code to the service through one of many available deployment methods. 

Azure does the rest: scaling the application in and out, patching and maintaining the underlying virtual machines, and much more, without requiring the learning curve of Kubernetes.

Azure App Service supports container-based workloads, so you can upload your container image instead of the application code. 

It also supports Linux and Windows workloads and many different application runtimes.

Azure App Service supports various pricing models, including a serverless option called [Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview). 

In Azure Functions, only application usage is charged. There are no fixed costs.

The serverless model is interesting for innovating, because it lets you deploy new microservices without incurring high monthly bills if the market doesn't accept them. 

This model is another example of the fail-fast strategy, where innovation doesn't necessarily mean high expenses.

Azure App Service also offers features that support DevOps-oriented deployments, such as web app slots. 

Slots are staging areas where you can deploy new features without affecting the production environment. 

Slots are great from an innovation perspective, because you can redirect a small selection of your customers to this new version of the application. 

Then, you can validate whether your innovation hypothesis is correct. 

Eventually, if you want to promote the new code to production, you can "swap" slots so that the staging environment becomes the production version.



## Infuse your applications with AI
In this unit, you learn the importance of machine learning and AI technologies in the innovation process and customer experience.

### Machine learning and AI to create value
Machine learning and AI are great assets for improving interaction with your customers and partners. 

Organisations are evaluating these application features as a way to enhance the user experience and increase business value.

Four possibilities for using AI are:

* Embedding a recommendation engine to increase cross-sales.
* Including a support chat to improve the user experience when problems arise.
* Redesigning the search engine to shorten the time it takes for customers to find products.
* Analyzing product reviews to better understand customers' sentiments.

### Machine Learning and AI in Azure
Azure offers tools and services that can help organizations build machine learning and AI functionality in applications quicker and at a lower cost.

#### Azure AI services
[Azure AI services](https://learn.microsoft.com/en-us/azure/ai-services/what-are-ai-services) contains prebuilt models that don't require machine-learning expertise to introduce AI functionality to an application. 

Azure AI services encompasses many areas, such as vision, speech, language, decision, and search. 

It's easy to use, so organizations can use the power of AI without extensive machine-learning skills.

A company might be evaluating these features to innovate the e-commerce application:

* Personalizer: 
	* Organizations can use this feature to learn which users prefer which products, and to make fine-tuned, individual recommendations. 
	* Some customers prefer products with quick delivery, whereas other customers prefer products on sale. 
	* Personalizer uses a type of machine-learning algorithm called reinforcement learning, which doesn't require huge amounts of data to be trained. 

* Text Analytics: 
	* Many users write product reviews.
	* Organizations can analyze reviews to find customers who express negative sentiments. 
	* Focusing on these customers can reduce customer churn and increase loyalty.

* Translator: 
	* Product reviews can be an effective sales tool, but they're useful only to customers who understand the language they're written in. 
	* Using real-time translation services would allow a company to show product reviews to any user regardless of their native language.

### Knowledge mining and Azure Cognitive Search
[Azure Cognitive Search](https://learn.microsoft.com/en-us/azure/search/search-what-is-azure-search) helps introduce knowledge mining and flexible search engines into applications with little coding effort. 

Not only can the service index massive amounts of data, it can also add enrichments to augment the information available to search.

One of the areas where application may need to be improved is the product search. 

Customers might spend too much time trying to find the product they're looking for. 

Replacing the existing search engine with Azure Cognitive Search could allow the company to expose rich search controls such as faceted navigation (multiple-category filters), relevance tuning, and autocomplete.

Azure Cognitive Search is offered as a set of APIs that enable the quick creation of MVPs.

### Azure Bot Service
The next area where surveys have surfaced user dissatisfaction is customer support. 

Long resolution times and congested phone lines are common complaints.

An organisation is considering [Azure Bot Service](https://learn.microsoft.com/en-us/azure/bot-service) to implement a chat-based support system where users can resolve their issues quicker at a lower cost. 

Azure Bot Service can be implemented in various languages, like C#, JavaScript, and Python. 

The variety of languages makes it easier to find developers in the organization who can use a familiar programming language to create the chat functionality.

Azure Bot Service can be implemented in various channels, a company is mostly commonly interested in offering it as a web-based chat for users who visit the e-commerce website.

### Azure Machine Learning
[Azure Machine Learning](https://learn.microsoft.com/en-us/azure/machine-learning/overview-what-is-azure-ml) facilitates the process of creating custom machine-learning models, deploying those models to production, and managing versions of all deployed models across the organization.

Azure Machine Learning makes the job of data scientists easier by helping them to share experiment results and manage different models at scale. 

It can refine models with hyperparameter tuning, and even create new ones with automated learning. 

It can then deploy the selected models to Kubernetes clusters to offer highly scalable, enterprise-grade APIs that can run the organization's machine-learning models in production.



## Azure technologies for measuring business impact
After an organization builds an MVP, it needs to validate the innovation hypothesis. 

In this unit, you learn how Azure tools can help in this crucial part of the innovation process.

### Measuring effectiveness
Measuring whether a hypothesis was right or wrong can be tricky, because multiple factors might be influencing key performance indicators. 

These factors might give hints about the expected success, because establishing causality can be complex. 

For example, even if sales increase after the introduction of a certain feature, whether the new feature was the main factor responsible for the sales increase is hard to prove.

However, the way in which features are released to application users can help to assess the validity of a hypothesis:

* Controlled deployments with feature flags, feature rings, and canary deployments allow you to release a feature to a limited set of users to prevent disrupting the experience of the whole customer base. Additionally, you can directly compare the performance of the customers with and without the feature to each other.

* Portal options for users to decide if they want to be exposed to new functionality puts the users in control of their own experience. The fact that many users opt for a new feature might already be a confirmation that the previous functionality had room for improvement. If customers that opt for the new feature go back to the previous experience, it might be an indicator that the deployed MVP is missing the mark.

* Customer surveys are a powerful feedback mechanism if they're implemented correctly. Customers provide information about their satisfaction if it's simple to give. One-click "traffic light" satisfaction surveys or single questions about new functionality might provide insights to help in evaluating whether the innovation hypothesis was correct. In general, only a few users answer longer surveys, and take the time to fill them in thoroughly and truthfully.


### Understanding your application
[Azure Application Insights](https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview) is an application performance management (APM) platform with a rich set of tools to gather application telemetry. 

You can use these insights for multiple purposes, such as performance monitoring, problem troubleshooting, or understanding how users move through applications. 

The last item is critical for the innovation lifecycle. 

You can use it to validate an innovation hypothesis and to judge whether a certain innovation is improving the customer experience.

#### Detect problems before users do
A crucial element that affects the user experience is the performance and availability of an application. 

If an application isn't working correctly and running into errors, or if it's not responsive enough, some users abandon it out of frustration. 

Those frustrated users might also damage your organization's reputation if they share their experience on social media.

Detecting those problematic situations before they affect users is of the highest importance. 

To meet that goal, you need to proactively monitor the application and start working on potential problems before they affect the business. 

For example, you can enable notifications to automatically open incidents so that they're investigated before customers report them.

[Smart Detection](https://learn.microsoft.com/en-us/azure/azure-monitor/app/proactive-failure-diagnostics) is a useful feature of Azure Application Insights. 

It can raise alerts when the application behavior is unusual. 

It detects anomalies by using machine learning, and the alerts are richer than traditional error notifications.

Notifications typically report that there might be a problem without context about the potential business impact. 

Smart Detection alerts include information like the number of affected users, the pattern associated with the failures, or the failure rate compared to normal behavior. 

You can then focus on the most critical issue from a business perspective.

#### Monitor user activity
[Usage analysis](https://learn.microsoft.com/en-us/azure/azure-monitor/app/usage-overview) in Azure Application Insights can help you evaluate which application areas need improvement. 

For example, usage analysis can identify the most popular application features or specific points at which users leave the web portal. 

You can explore, for example, whether your application works better in certain geographic areas than others, to get valuable information about where the application gaps might be.

After you formulate a hypothesis with the data provided by Azure Application Insights, you can analyze telemetry to measure whether the situation is now better or worse. 

You can embed custom business events in the application so that telemetry data contains additional information that helps in the measure process.

[Funnels](https://learn.microsoft.com/en-us/azure/azure-monitor/app/usage-funnels) can be an insightful tool. 

With funnels, you can predefine the flows that you expect users to follow when they use the application. 

Then you can monitor which patterns users follow, and identify problems in the applications if users behave in unexpected ways.

#### Retain users
The Application Insights [retention tool](https://learn.microsoft.com/en-us/azure/azure-monitor/app/usage-retention#the-retention-tool?azure-portal=true) offers specific functionality around user churn. 

It contains valuable learning data when combined with business events. 

For example, understanding which actions that customers who left the application unexpectedly took, allows you to formulate hypotheses with maximum business impact.

Alternatively, if most users who abandoned your website did so from the payment method page, you'd suspect a business problem there. 

Maybe the payment options are insufficient or not clearly displayed, or another problem is preventing users from moving forward in their shopping process.

#### Impact analysis
[Impact analysis](https://learn.microsoft.com/en-us/azure/azure-monitor/app/usage-impact) is a feature in Azure Application Insights that correlates technical aspects of the application to tangible business metrics.

For example, how fast should the product page load so that most users continue with their shopping process? 

With impact analysis, you can show the relationship between page load time and the rate of users who purchase the product shown. 

This information can help you to validate or reject an innovation hypothesis, and to convert business requirements into technical specifications.



## Azure technologies for the learn process
In this unit, you learn how to apply the results of the measure step in the innovation lifecycle. 

You also learn about the importance of data democratization.

### Data democratization
As you've learned in previous units, you can collect data from your customers by using multiple sources.

These sources include micro surveys, utilization data derived by Azure Application Insights, and feature flags that customers can decide on their own to enable or disable. 
 
The more data you have, the better your decisions are, but you need a way to handle this ever-increasing flow of data.

An organization can make pervasive data decisions only if those decisions are based on a solid, accessible data platform. 

This effort involves four areas:

* Collect data:
	* The first step to data-driven decision making is always having data. 
	* Data collection can take multiple forms: migration from existing data repositories, data generation from sources like Azure Application Insights, or data ingestion from other sources.

* Share data: 
	* Collected data needs to be available to everybody who needs it, not only to data experts. 
	* All individuals in an organization should be able to use data to make their decisions.

* Centralize data: Centralized data platforms can help to simplify data sharing and governance.

* Govern data: 
	* Data sharing doesn't mean that all data needs to be available to everybody. 
	* Ensure that any sensitive data is secured, tracked, and governed before sharing it.


### Azure data platform
The Azure platform covers the whole data lifecycle, which is fundamental for data-driven decision making and data democratization. 

From lightweight, on-demand databases to massive data warehouses or flexible NoSQL systems, the Azure data platform allows you to cover the four data activity areas.

#### Data collection
The Azure data ecosystem includes services and tools to migrate, ingest, store, and analyze data. 

The following list shows only a few of the mechanisms that you can use to process data and make it available for later sharing in order to facilitate data-driven decision making:

* Data analytics: 
	* [Azure Synapse Analytics](https://learn.microsoft.com/en-us/azure/synapse-analytics/overview-what-is) is an enterprise analytics service that accelerates time-to-insight across data warehouses and big-data systems. 
	* Azure Synapse Analytics brings together the best of:
	* SQL technologies used in enterprise data warehousing.
	* Spark technologies used for big data.
	* Pipelines for data integration and ETL (extract, transform, load) and ELT (extract, load, transform).
	* Deep integration with other Microsoft services such as Power BI, Azure Cosmos DB, and Azure Machine Learning.

* Data migration: 
	* Data might be already stored in existing sources, but it needs to be migrated to a modern platform before it can be converted into actionable insights. 
	* [Azure Database Migration Service](https://learn.microsoft.com/en-us/azure/dms) contains tooling that helps with data migrations from systems such as SQL Server, PostgreSQL, Oracle, and MongoDB.

* Data processing: 
	* Azure includes services to analyze and transform data streams with [Azure Stream Analytics](https://learn.microsoft.com/en-us/azure/stream-analytics/stream-analytics-introduction), and to run ETL processes at large scale with [Azure Data Factory](https://learn.microsoft.com/en-us/azure/data-factory).

#### Data sharing
[Microsoft Power BI](https://learn.microsoft.com/en-us/power-bi/fundamentals/power-bi-overview) is a set of tools that consolidate data coming from disparate sources into integrated, interactive visualizations. 

Users can dive into the data just by operating intuitive controls. 

The power of insights is available to everybody in an organization, not just to data professionals.

Area owners can create reports and dashboards that contain the relevant information around specific aspects of the application. 

After new functionality is introduced to validate a hypothesis, data is readily available to either validate or reject the hypothesis based on real customer usage.

Microsoft Power BI can help with data sharing from multiple perspectives. Here are some examples:

* Share data with coworkers and partners: 
	* Power BI dashboards simplify consuming data. 
	* Visualizations allow for people who aren't data experts to drill down into data without having to be familiar with its underlying structure.

* Quickly generate data insights: 
	* Power BI can automatically generate visualizations of data sets with its Quick Insights functionality. 
	* You can create dashboards quickly and find data correlations that might not have been obvious at first.

* Embed reports in a website or portal: 
	* With Power BI, not only can you access visualizations in the native Power BI portal, but you can embed reports and dashboards in other web applications too. 
	* This way, users don't need to leave their familiar corporate websites to find the data that they need for their decision-making process.

#### Data centralization
The main problem of data centralization is scale at different levels. At the risk of oversimplifying, we can reduce it to the 3 V's of big data:

* Volume: 
	* [Azure Data Lake Storage Gen2](https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-introduction) is a cost-effective and scalable Azure platform for data storage. 
	* Based on the massive scalability provided by Azure Storage, Azure Data Lake Storage has been designed to service multiple petabytes of information while sustaining hundreds of gigabits of throughput.

* Variety: 
	* This term often refers to the fact that data isn't always structured. 
	* You might have semi-structured and even unstructured data, too. 
	* [Azure Synapse](https://learn.microsoft.com/en-us/azure/synapse-analytics/overview-what-is) shines in this area, because it brings together the best of SQL technologies used in enterprise data warehousing with Spark, which is often used for big data.

* Velocity: 
	* A problem often found in older data architectures is the interdependency between storage capacity, analysis speed, and ingestion rates. 
	* In Azure data solutions, an organization can scale different dimensions of the platform independently by decoupling them. 
	* Data can be ingested, processed, and shared through data pipelines that use the required Azure data services, as the [enterprise business intelligence architecture](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/data/enterprise-bi-synapse) shows.

#### Data governance
In today's world, data represents both a critical asset and a significant responsibility. 

Stored data often includes confidential information that can result in financial or personal damage if it's leaked or shared inappropriately. 

Storing and processing data implicitly means that an organization accepts that responsibility. 

Legal regulations can result in penalties for organizations that mishandle personal or confidential data.

As a consequence, data governance is critical for any organization that has a goal of data democratization. 

The first step toward data governance is classifying data that needs to be treated in specific ways. 

As an example, Microsoft uses these data categories internally for data classification:

* **Non-business:** Data from your personal life that doesn't belong to Microsoft.
* **Public:** Business data that's freely available and approved for public consumption.
* **General:** Business data that isn't meant for a public audience.
* **Confidential:** Business data that can cause harm to Microsoft if overshared.
* **Highly confidential:** Business data that would cause extensive harm to Microsoft if overshared.

The next step after data classification is ensuring that each data category is protected from unauthorized access. 

Azure supports these technologies that enforce confidentiality:

* Encryption of data at rest: All Azure data is encrypted when stored in Microsoft datacenters. Some Azure services offer specific encryption features, such as [transparent data encryption](https://learn.microsoft.com/en-us/azure/azure-sql/database/transparent-data-encryption-tde-overview) in Azure Synapse and Azure SQL Database.

* Encryption of data in flight: All Azure data services encrypt data with TLS/SSL before sending it through the network. Some services, such as Azure Storage, can optionally allow unencrypted traffic. Organizations should disable any unencrypted communication for any type of sensitive data.

* Data access control: Azure offers sophisticated authentication and authorization mechanisms both for access to the Azure platform and for access to data itself. [Azure role-based access control](https://learn.microsoft.com/en-us/azure/role-based-access-control/overview), [Conditional Access](https://learn.microsoft.com/en-us/azure/active-directory/conditional-access/overview), and [Privileged Identity Management](https://learn.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-configure) are three examples of essential services that can help to ensure that only authorized people have access to sensitive information.

* Data auditing: 
	* Many regulatory compliance standards demand evidence of data protection mechanisms by documenting who has done certain operations and accessed certain data. 
	* As described in [Auditing for Azure SQL Database and Azure Synapse Analytics](https://learn.microsoft.com/en-us/azure/azure-sql/database/auditing-overview), data auditing in Azure contemplates three aspects of auditing:
		* Retain an audit trail of selected events, where you can define categories of data actions to be audited.
		* Report on database activity, optionally with preconfigured reports and dashboards to get started quickly.
		* Analyze reports to uncover suspicious events, unusual activity, and trends


### Growth mindset
The learn phase sometimes delivers bad news. 

Hypotheses that you thought were right might turn out to be wrong. 

Being open to alternative ideas is key for the innovation process to flow smoothly. 

Maybe the whole hypothesis was wrong, or maybe the problem was only the way in which the prototype was developed.

In any case, conclusions should always be supported with data. 

The team should move on to formulating the next hypothesis, possibly some kind of revision or iteration of the initial one.

Existing data might not allow you to unequivocally conclude whether the hypothesis was right or wrong. 

In this case, the data set that's helping the decision process should be enhanced.

Either introduce new telemetry points in the application or figure out new ways of getting information about the customer experience.

A growth mindset is fundamental at this stage. 

Think of hypotheses proven wrong or partially wrong as learning opportunities.

Organizations shouldn't waste time on an innovation that doesn't generate the expected business outcomes.


