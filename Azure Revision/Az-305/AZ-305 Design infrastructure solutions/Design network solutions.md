# _Design network solutions_
Azure Architects design and recommend network solutions.

Learning objectives:

* Recommend a network architecture solution based on workload requirements
* Design for on-premises connectivity to Azure Virtual Network
* Design for Azure network connectivity services
* Design for application delivery services
* Design for application protection services

## Recommend a network architecture solution based on workload requirements
Azure offers several networking services with capabilities that can be used together or separately to support workload requirements. 

You can [connect Azure resources and on-premises resources](https://learn.microsoft.com/en-us/azure/networking/fundamentals/networking-overview#connect), [protect your applications](https://learn.microsoft.com/en-us/azure/networking/fundamentals/networking-overview#protect), and [deliver your applications](https://learn.microsoft.com/en-us/azure/networking/fundamentals/networking-overview#deliver).


### Things to know about network requirements
As you plan your networking solution, there are several requirements you need to consider.

* Naming: Define a naming convention that you can use consistently when naming resources to make it easier to manage several network resources over time.

* Regions: Determine the Azure regions for your resources according to the physical locations of the consumers of your resources. A virtual network is scoped to a single region/location.

* Subscriptions: Plan out how many Azure subscriptions are required to meet your workload requirements, considering you can implement multiple virtual networks within each Azure subscription and Azure region.

* IP addresses: Specify a custom private IP address space by using public and private (RFC 1918) addresses. Azure assigns resources in a virtual network a private IP address from the address space that you assign.

* Segmentation: Segment your virtual networks with subnets based on workload and security requirements.

* Filtering: Define your network security and traffic filtering strategy for your workloads.

### Things to consider when defining workload requirements
There are many considerations to review as you plan your network according to the workload requirements.

* Consider segmentation options for your virtual networks. 
	* Each subnet must have a unique address range, specified in CIDR format, within the address space of the virtual network. 
	* The address range can't overlap with other subnets in the virtual network.

* Subnets segmented based on application layer. 
	* The following table shows how to segment a virtual network with an address space of 10.245.16.0/20 into subnets based on a three-tiered application.

Subnet | CIDR | Addresses | Usage
--- | --- | --- | ---
DEV-FE-EUS2 | 10.245.16.0/22 | 1019 | Front-end or web-tier virtual machines
DEV-APP-EUS2 | 10.245.20.0/22 | 1019 | Application-tier virtual machines
DEV-DB-EUS2 | 10.245.24.0/23 | 507 | Database virtual machines

* Consider required interfaces and IP addresses. 
	* Identify how many network interfaces and private IP addresses you require in your virtual network. 
	* There are limits to the number of network interfaces and private IP addresses that you can have within a virtual network.

* Consider network security groups. 
	* You can filter network traffic to and from resources in a virtual network by using network security groups and network virtual appliances. 
	* You can control how Azure routes traffic from subnets.

* Consider network traffic routing. 
	* Azure routes network traffic between all subnets in a virtual network, by default. 
	* You can override some of Azure's system routes with custom routes.


### Best practices
Review the following recommended best practices for working with virtual networks and subnets.

#### Plan IP addressing for virtual networks
When you create virtual networks as part of your migration, plan out your virtual network IP address space. 

Virtual networks allow for the use of 65,536 IP addresses.

* Assign an address space that isn't larger than a CIDR range of /16 for each virtual network. 
	* If you assign a smaller prefix than /16, such as a /15, which has 131,072 addresses, the excess IP addresses become unusable elsewhere. 
	* It's important not to waste IP addresses, even if they're in the private ranges defined by RFC 1918.

* Don't overlap the virtual network address space with on-premises network ranges. 
	* Overlapping addresses can cause networks that can't be connected, and routing that doesn't work properly.

* If networks overlap, you'll need to redesign the network.
	* If you absolutely can't redesign the network, network address translation (NAT) can help, but should be avoided or limited as much as possible.

#### Implement hub-spoke network topology
A hub and spoke network topology isolates workloads while sharing services, such as identity and security. 

The hub is an Azure virtual network that acts as a central point of connectivity. 

The spokes are virtual networks that connect to the hub virtual network by using peering. 

Shared services are deployed in the hub, while individual workloads are deployed as spokes.

* Implement a hub-spoke topology in Azure to centralize common services
	* Examples are connections to on-premises networks, firewalls, and isolation between virtual networks. 
	* The hub virtual network provides a central point of connectivity to on-premises networks.
	* It also provides a place to host services used by workloads hosted in spoke virtual networks.

* Use spoke virtual networks to isolate workloads with each spoke managed separately from other spokes. 
	* Each workload can include multiple tiers, and multiple subnets that are connected with Azure load balancers.

* Configure hub and spoke virtual networks in different resource groups, and even in different subscriptions. 
	* When you peer virtual networks in different subscriptions, the subscriptions can be associated to the same, or different, Microsoft Entra tenants. 
	* You gain decentralized management of each workload, while sharing services maintained in the hub network.



## Design patterns for Azure network connectivity services
Now we'll examine three common networking patterns for organizing workloads in Azure:

* Single virtual network
* Multiple virtual networks with peering
* Multiple virtual networks in a hub-spoke topology

Each pattern provides a different type of isolation and connectivity.

### Segmentation and Azure Firewall
For all patterns, the recommended Azure cloud native segmentation control is Azure Firewall. 

Azure Firewall works across both Azure Virtual Network and subscriptions to govern traffic flows by using layer 3 to layer 7 controls. 

You can define your communication rules and apply them consistently, such as network X can't talk with network Y and network Z can't access the internet. 

With Azure Firewall Manager, you can centrally manage policies across multiple Azure firewalls and enable DevOps teams to further customize local policies.


### Pattern 1: Single virtual network
In the first pattern, all components of your workload (or in some cases your entire IT footprint) are placed in a single virtual network. 

This option is possible if you're operating solely in a single region because a virtual network can't span multiple regions.

The entities you would most likely use to create segments in the virtual network are network security groups (NSGs). 

You could also use application security groups (ASGs) to simplify administration.

Here's how you might implement a single virtual network pattern:

* One subnet (`Subnet 1`) can contain your database workloads.
* Another subnet (`Subnet 2`) can contain your web workloads.
* To govern subnet traffic, you can implement NSGs to specify that `Subnet 1` can talk only with `Subnet 2`, and `Subnet 2` can talk to the internet.
* You can enforce segmentation by using an NVA from Azure Marketplace or Azure Firewall.
* You can modify the pattern to support many workloads. You might carve out subnets that won't allow one workload to communicate to the backend of another workload.

### Pattern 2: Multiple virtual networks with peering
The second pattern extends the single virtual network pattern to support multiple virtual networks with potential peering connections. 

This option lets you group applications into separate virtual networks, or implement a presence in multiple Azure regions.

This pattern provides built-in segmentation through virtual networks because you must explicitly peer one virtual network to another for them to communicate. 

(Keep in mind that [Azure Virtual Network peering](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview) connectivity isn't transitive.) 

You can add more segmentation within a virtual network in a manner similar to pattern 1 by using NSGs in the virtual networks.

### Pattern 3: Multiple virtual networks in hub-spoke topology
The third pattern is a more advanced virtual network organization, where you choose a virtual network in a given region as the hub for all the other virtual networks in that region.

The connectivity between the hub virtual network and its spoke virtual networks is achieved by using Virtual Network peering. 

All traffic passes through the hub virtual network, and it can act as a gateway to other hubs in different regions. 

You set up your security posture at the hubs, so they get to segment and govern the traffic between the virtual networks in a scalable way.

One benefit of this pattern is that as your network topology grows, the security posture overhead doesn't grow (except when you expand to new regions).

### Compare patterns
The following table compares capabilities of the three networking patterns. 

Review the details, and think about which patterns are applicable to the network topology.

Compare | Single virtual network | Multiple networks with peering | Multiple networks in hub-spoke topology
--- | --- | --- | ---
onnectivity/Routing (how segments communicate) | System routing provides default connectivity to any workload in any subnet. | System routing provides default connectivity to any workload in any subnet. | No default connectivity between spoke virtual networks. <br /> <br /> A layer 3 router (such as Azure Firewall) in the hub virtual network is required to enable connectivity.
Network-level traffic filtering | Traffic is allowed by default. NSG can be used for filtering. | Traffic is allowed by default. NSG can be used for filtering. | Traffic between spoke virtual networks is denied by default. Azure Firewall configuration can enable selected traffic, such as `windowsupdate.com`.
Centralized logging | NSG logs for the virtual network. | Aggregate NSG logs across all virtual networks. | Azure Firewall logs to Azure Monitor all accepted/denied traffic sent via a hub.
Unintended open public endpoints | DevOps can accidentally open a public endpoint via incorrect NSG rules. | DevOps can accidentally open a public endpoint via incorrect NSG rules. | An accidentally opened public endpoint in a spoke virtual network won't enable access. The return packet is dropped via stateful firewall (asymmetric routing).
Application level protection | NSG provides network layer support only. | NSG provides network layer support only. | Azure Firewall supports FQDN filtering for HTTP/S and MSSQL for outbound traffic and across virtual networks.



## Design outbound connectivity and routing
Part of the planning for your Azure network solution includes exploring how to support outbound network connectivity and traffic communication routing.

Around the globe, IPv4 address ranges are in short supply. 

Trying to purchase an IP address in the v4 range can be an expensive way to grant access to your internet resources. 

To address this issue, architects use Network Address Translation (NAT) to enable internal resources on a private network to share routable IPv4 addresses. 

The internal resources use the routable IPv4 addresses to access external resources on a public network. 

Instead of buying an IPv4 address for each resource that needs internet access. 

You can use a NAT service to map outgoing requests from your internal resources to external IP addresses. 

Azure provides this technology via the Azure Virtual Network NAT service.

Azure [routes communication traffic](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-udr-overview) between your on-premises internal resources and external internet resources by using route tables. 

When you create a virtual network, Azure automatically creates a routing table for each subnet in the network. 

A routing table contains many different types of routes, including system, service endpoints, and subnet defaults. 

The table also has route entries for the Border Gateway Protocol (BGP), user-defined routes (UDRs), and routes from other virtual networks.


### Azure Virtual Network NAT
Azure Virtual Network NAT simplifies outbound-only internet connectivity for virtual networks. 

When you configure this service on a subnet, all outbound connectivity uses your specified static public IP addresses. 

Outbound connectivity is possible without load balancer or public IP addresses directly attached to virtual machines. 

Virtual Network NAT is fully managed and highly resilient.

### Business scenarios
* Support on-demand outbound-to-internet connectivity without pre-allocation
* Configure one or more static public IP addresses for scale
* Enable configurable idle timeout
* Allow TCP reset for unrecognized connections

### Things to know about routing tables and routes
Let's take a closer look at the characteristics of routing tables and the route types.

* System routes: 
	* When you create a virtual network for the first time without defining any subnets, Azure creates system route entries in the routing table. 
	* System routes are defined for a specific location when they're created. 
	* System routes can't be modified after they're created, but you can override these routes by configuring UDRs.

* User-defined routes (custom): 
	* When you create one or multiple subnets inside a virtual network, Azure creates default entries in the routing table to enable communication between these subnets within a virtual network. 
	* These routes can be modified by using static routes, which are stored as UDRs. UDRs are also called custom routes. 
	* You create UDRs in Azure to override Azure's default system routes, or to add more routes to a subnet's route table.

* Routes from other virtual networks: 
	* When you create a virtual network peering between two virtual networks, a route is added for each address range within the address space of each peered virtual network.

* Border Gateway Protocol routes: 
	* If your on-premises network gateway exchanges BGP routes with an Azure Virtual Network gateway, a route is added for each route propagated from the on-premises network gateway. 
	* These routes appear in the routing table as BGP routes.

* Service endpoint routes: 
	* The public IP addresses for certain services are added to the route table by Azure when you enable a service endpoint to the service. 
	* Service endpoints are enabled for individual subnets within a virtual network. 
	* When you enable a service endpoint, a route is only added to the route table for the subnet that belongs to this service. 
	* Azure manages the addresses in the route table automatically when the addresses change.

* Routing order: 
	* When you have competing entries in a routing table, Azure selects the next hop based on the longest prefix match similar to traditional routers. 
	* If there are multiple next hop entries with the same address prefix, Azure selects routes in a specific order: UDRs, then BGP routes, and then system routes.


### Things to consider when using routing tables and routes
There are many networking scenarios where defining and overriding routes can be an advantage.

Review the following suggestions and consider the routes required to support a solution.

* Consider system routes. Define system routes for specific locations and scenarios that you don't expect to modify.
	* Route traffic between virtual machines in the same virtual network or between peered virtual networks
	* Support communication between virtual machines by using a virtual network-to-network VPN
	* Enable site-to-site communication through Azure ExpressRoute or an Azure VPN gateway

* Consider user defined routes. Create custom UDRs to override Azure's default system routes, or to add more routes to a subnet's route table.
	* Enable filtering of internet traffic by using Azure Firewall or forced tunneling
	* Flow traffic between subnets through an NVA
	* Define routes to specify how packets should be routed in a virtual network
	* Define routes that control network traffic and specify the next hop in the traffic flow

* Consider overriding routes. Plan for route overrides to control traffic flow.
	* Flow through NVA: [Configure route tables to force traffic between subnets to flow through an NVA](https://learn.microsoft.com/en-us/azure/virtual-network/tutorial-create-route-table-portal)
	* Forced tunneling: [Force all internet-bound traffic through an NVA, or on-premises, through an Azure VPN gateway](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-forced-tunneling-rm)



## Design for on-premises connectivity to Azure Virtual Network
For a successful migration, it's critical to connect on-premises corporate networks to Azure.

This method creates an always-on connection known as a hybrid-cloud network, where services are provided from the Azure cloud to corporate users.

Let's examine Azure services that provide connectivity between Azure resources, connectivity from an on-premises network to Azure resources, and branch to branch connectivity in Azure. 

We'll compare options for connecting an on-premises network to an Azure virtual network.

### Azure VPN Gateway
An [Azure VPN Gateway](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways) connection is a type of virtual network gateway that sends encrypted traffic between an Azure virtual network and an on-premises location. 

The encrypted traffic goes over the public internet. 

There are different configurations available for VPN Gateway connections, such as, site-to-site, point-to-site, or virtual network-to-network.

Reference architecture: [Hybrid network with Azure VPN Gateway](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/#vpn-connection)

### Azure ExpressRoute
[Azure ExpressRoute](https://learn.microsoft.com/en-us/azure/expressroute/expressroute-introduction) uses a private, dedicated connection through a third-party connectivity provider. 

This connection is private. Traffic doesn't go over the internet. 

The private connection extends your on-premises network into Azure.

Reference architecture: [Hybrid network with Azure ExpressRoute](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/expressroute)

### Azure ExpressRoute with VPN failover
Combine Azure ExpressRoute and Azure VPN Gateway to create a failover to a VPN connection if there's a loss of connectivity in the ExpressRoute circuit.

Reference architecture: [Hybrid network with Azure ExpressRoute and VPN failover](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/expressroute-vpn-failover)

### Azure Virtual WAN and hub-spoke networks
A hub-spoke network topology is a way to isolate workloads while sharing services such as identity and security. 

The hub is a virtual network in Azure that acts as a central point of connectivity to your on-premises network. 

Spokes are virtual networks that peer with the hub. 

Shared services are deployed in the hub, while individual workloads are deployed as spokes.

A hub-spoke architecture can be achieved via a customer-managed hub infrastructure or a Microsoft-managed hub infrastructure. 

In both cases, spokes are connected to the hub by using virtual network peering. 

Traffic flows between the on-premises data center(s) and the hub through an ExpressRoute or VPN gateway connection. 

The main differentiator of this approach is the use of Azure Virtual WAN to replace hubs as a managed service.

Azure Virtual WAN is a networking service that provides optimized and automated branch connectivity to, and through, Azure. 

Azure regions serve as hubs that you can choose to connect your branches to. 

You can apply the Azure backbone to also connect branches and enjoy branch-to-VNet connectivity.

Azure Virtual WAN brings together many Azure cloud connectivity services such as site-to-site VPN, ExpressRoute, point-to-site user VPN into a single operational interface. 

Connectivity to Azure VNets is established by using virtual network connections.

Reference architecture: [Hub-spoke topology with Azure Virtual WAN](https://learn.microsoft.com/en-us/azure/architecture/networking/hub-spoke-vwan-architecture)

The Azure Virtual WAN architecture includes the benefits of standard hub-spoke network topology and introduces several advantages:

* Full meshed hub among Azure virtual networks
* Branch-to-Azure connectivity
* Branch-to-branch connectivity
* Mixed use of VPN Gateway and ExpressRoute connections
* Mixed use of user VPN to the site
* Virtual network-to-network connectivity


### Compare services
The following table compares the benefits and challenges of the network connectivity options. 

Review the scenarios, and think about which services can enhance your network solution.

Compare | Azure VPN Gateway | Azure ExpressRoute | ExpressRoute + VPN failover | Azure Virtual WAN + hub-spoke
--- | --- | --- | --- | ---
Benefits | - Simple to configure <br /> - High bandwidth available (up to 10 Gbps depending on VPN Gateway SKU) | - High bandwidth available (up to 10 Gbps depending on connectivity provider) <br /> - Supports dynamic scaling of bandwidth to help reduce costs during periods of lower demand (not supported by all connectivity providers) <br /> - Enables direct organizational access to national clouds (depends on connectivity provider) | - High availability if ExpressRoute circuit fails (fallback connection on lower bandwidth network | - Reduced operational overhead by replacing existing hubs with fully managed service <br /> - Cost savings by using managed service, which removes need for NVA <br /> - Improved security via centrally managed secured hubs with Azure Firewall and Virtual WAN <br /> - Separates concerns between central IT (SecOps, InfraOps) and workloads (DevOps)
Challenges | - Requires on-premises VPN device | - Can be complex to set up <br /> - Requires working with third-party connectivity provider <br /> - Provider responsible for provisioning network connection <br /> - Requires high-bandwidth routers on-premises | - Complex to configure <br /> - Must set up both VPN connection and ExpressRoute circuit <br /> - Requires redundant hardware (VPN appliances) <br /> - Requires redundant Azure VPN Gateway connection for which you pay charges | Note: Azure Virtual WAN is designed to reduce previously listed connectivity challenges.
Scenarios | Hybrid apps with light traffic between on-premises hardware and the cloud <br /> <br /> Able to trade slightly extended latency for flexibility and processing power of the cloud | Hybrid apps running large-scale, mission-critical workloads that require high degree of scalability | Hybrid apps that require higher bandwidth of ExpressRoute and highly available network connectivity | Connectivity among workloads requires central control and access to shared services <br /> <br /> Enterprise requires central control over security aspects like a firewall and segregated management for workloads in each spoke



## Choose an application delivery service
Azure offers several load-balancing services for distributing your workloads across multiple computing resources. 

As you review the options, there are several factors to consider in your planning.

### Things to know about load balancing
Azure load-balancing services can be categorized along two dimensions:

* Global or Regional
* HTTP(S) or non-HTTP(S)

In the Azure portal, the Help me choose default tab highlights other configuration characteristics:

* **Traffic type:** Are you designing a web (HTTP/HTTPS) application? Is the app public facing or is it private?
 
* **Global versus regional:** Do you need to load balance virtual machines or containers within a virtual network, or load balance scale unit/deployments across regions, or both?
 
* **Availability:** Does the service [SLA](https://azure.microsoft.com/support/legal/sla/) meet your requirements?
 
* **Cost:** Have you outlined your cost expectations? You can review the Azure pricing options. In addition to the cost of the service itself, consider the operations cost for managing a solution built on that service.
 
* **Features and limits:** What are the overall limitations of each service? You can review the service limits.
 
In the next unit, we examine features of several load-balancing services, including Azure Front Door, Traffic Manager, Load Balancer, and Application Gateway.

### Things to consider when choosing load balancing
As you review the descriptions of the Azure load-balancing services in the next unit, you can use the following flowchart to help you to find the ideal solution for your application. 

The flowchart guides you through a set of key decision criteria to reach a recommendation.

> Treat this flowchart as a starting point. Every application has unique requirements, so use these recommendations as a starting point in your planning.

After you identify possible solutions for your requirements, apply the options to your scenarios and do a detailed evaluation. 

If your application consists of multiple workloads, evaluate each workload separately.

A complete solution might incorporate two or more load-balancing solutions.

![FLOWCHART](https://learn.microsoft.com/en-gb/training/wwl-azure/design-network-solutions/media/load-balancer-decision-tree.png#lightbox)



## Design for application delivery services
Azure offers several networking services to help deliver applications. 

In this unit, we examine Azure Content Delivery Network, Front Door, Traffic Manager, Load Balancer, and Application Gateway.

### Azure Content Delivery Network
Azure Content Delivery Network offers a global solution for rapidly delivering high-bandwidth content to users. 

Content Delivery Network lets you cache your content at strategically placed physical nodes across the world.

#### Business scenarios
* Implement point-of-presence locations that are close to large clusters of users
* Reduce latency, both the transmission delay and the number of router hops
* Support Microsoft, Akamai, and Verizon content delivery networks
* Use custom domains, file compression, caching, and geo-filtering

### Azure Front Door
Azure Front Door lets you define, manage, and monitor the global routing for your web traffic by optimizing for best performance and instant global failover for high availability. 

With Front Door, you can transform your global (multi-region) consumer and enterprise applications into robust, high-performance personalized modern applications, APIs, and content that reaches a global audience with Azure.

#### Business scenarios
* Low latency: Ensure requests are sent to the lowest latency backends
* Priority: Support primary and secondary backends
* Weighted: Distribute traffic by using weight coefficients
* Affinity: Ensure requests from the same end user are sent to the same backend
* Support WAF and CDN integration for HTTP(S) traffic

### Azure Traffic Manager
Azure Traffic Manager is a DNS-based traffic load balancer that enables you to distribute traffic optimally to services across global Azure regions, while providing high availability and responsiveness. 

Traffic Manager provides a range of traffic-routing methods to distribute traffic such as priority, weighted, performance, geographic, multi-value, and subnet.

#### Business scenarios
* Increase application availability
* Improve application performance
* Combine hybrid applications
* Distribute traffic for complex deployments

### Azure Load Balancer
Azure Load Balancer provides high-performance, low-latency Layer 4 load-balancing for all UDP and TCP protocols.

#### Business scenarios
* Manage inbound and outbound connections
* Configure public and internal load-balanced endpoints
* Manage service availability by mapping inbound connections to back-end pool destinations (via TCP and HTTP health-probe rules)

### Azure Application Gateway
Azure Application Gateway is a web traffic load balancer that enables you to manage traffic to your web applications. 

Application Gateway is an Application Delivery Controller (ADC) as a service, offering various layer 7 load-balancing capabilities for your applications. 

There are two primary methods of routing traffic: 

* Path-based routing 
* Multiple-site routing.

#### Business scenarios
* **Path-based routing:** Send requests with different URL paths to a different pool of back-end servers
* **Multiple-site routing:** Support tenants with virtual machines or other resources that host a web application



## Design for application protection services
Azure offers several networking services to help protect your network resources. 

You can protect your applications by using one service or a combination of services. 

In this unit, we examine Azure DDoS Protection, Azure Firewall, Private Link, Web Application Firewall, and Virtual Network security groups and service endpoints.

### Azure DDoS Protection (distributed denial of service protection)
[Azure DDoS Protection](https://learn.microsoft.com/en-us/azure/ddos-protection/manage-ddos-protection) provides countermeasures against the most sophisticated DDoS threats. 

The service provides enhanced DDoS mitigation capabilities for your application and resources deployed in your virtual networks. 

Additionally, customers who use Azure DDoS Protection have access to DDoS Rapid Response support to engage DDoS experts during an active attack.

#### Business scenarios
* Implement always-on traffic monitoring, adaptive tuning, and mitigation scale
* Access multi-layered protection, including attack analytics, metrics, and alerting
* Receive support from the DDoS rapid response team

### Azure Private Link
[Azure Private Link](https://learn.microsoft.com/en-us/azure/private-link/private-link-overview) enables you to access Azure PaaS services (such as Azure Storage and SQL Database) and Azure hosted customer-owned/partner services over a private endpoint in your virtual network. 

Traffic between your virtual network and the service travels the Microsoft backbone network. 

Exposing your service to the public internet is no longer necessary. 

You can create your own private link service in your virtual network and deliver it to your customers. 

Private Link is used to access PaaS services, such as Azure Storage, Azure SQL, App Services, and more.

#### Business scenarios
* Enable private connectivity to services on Azure
* Integrate with on-premises and peered networks
* Restrict traffic to the Microsoft network with no public internet access

### Azure Firewall
Azure Firewall is a managed, cloud-based network security service that protects your Azure Virtual Network resources. 

It's a fully stateful firewall as a service with built-in high availability and unrestricted cloud scalability. 

Azure Firewall uses a static public IP address for your virtual network resources, which allows outside firewalls to identify traffic originating from your virtual network. 

Azure Firewall provides inbound protection for non-HTTP/S protocols (such as RDP, SSH, and FTP), outbound network-level protection for all ports and protocols, and application-level protection for outbound HTTP/S.

### Business scenarios
* Implement centralized creation, enforcement, and logging of application and network connectivity policies
* Apply connectivity policies across subscriptions and virtual networks
* Combine Azure Firewall rules with just in time (JIT) access to restrict access to your virtual machine management ports


### Azure Web Application Firewall
[Azure Web Application Firewall](https://learn.microsoft.com/en-us/azure/web-application-firewall/overview) provides protection to your web applications from common web exploits and vulnerabilities such as SQL injection, and cross-site scripting. 

Web Application Firewall provides out of box protection from OWASP top 10 vulnerabilities via managed rules. 

Configure customer-managed rules for extra protection based on source IP range and request attributes (headers, cookies, form data fields, query string parameters). 

Preventing similar attacks in your application code can be challenging. 

The process can require rigorous maintenance, patching, and monitoring at multiple layers of the application topology. 

A centralized web application firewall helps to simplify security management. 

A web application firewall gives application administrators better assurance of protection against threats and intrusions.

#### Business scenarios
* React faster to security threats by centrally patching known vulnerabilities instead of securing individual web apps
* Deploy Web Application Firewall with Application Gateway, Front Door, and Content Delivery Network

### Azure virtual network security groups
You can filter network traffic to and from Azure resources in an Azure virtual network with [Azure network security group (NSGs)](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview). 

You can use a network virtual appliance (NVA) such as Azure Firewall or firewalls from other vendors.

An NSG contains a list of access control list (ACL) rules that allow or deny network traffic to subnets, network interface cards (NICs), or both. 

NSGs can be associated with either subnets or individual NICs connected to a subnet. 

When an NSG is associated with a subnet, the ACL rules apply to all the virtual machines in that subnet.

NSGs contain two sets of rules: inbound and outbound. The priority for a rule must be unique within each set. 

Each rule has properties of protocol, source and destination port ranges, address prefixes, direction of traffic, priority, and access type. 

All NSGs contain a set of default rules. The default rules can't be deleted, but because they're assigned the lowest priority, you can override them with custom rules.

#### Business scenarios
* Control how Azure routes traffic from subnets
* Limit the users in an organization who can work with resources in virtual networks
* Restrict traffic to an individual NIC by associating an NSG directly to a NIC
* Combine NSGs with JIT access to restrict access to your virtual machine management ports

### Azure Virtual Network - Service endpoints
Azure Virtual Network service endpoints extend your virtual network private address space and the identity of your virtual network to the Azure services over a direct connection. 

You can use endpoints to secure your critical Azure service resources to have access to only your virtual networks. 

Traffic from your virtual network to the Azure service always remains on the Microsoft Azure backbone network. 

Service endpoints are easy to set up and have less management overhead than other strategies.

#### Business scenarios
* Secure your critical Azure service resources to only your virtual networks
* Increase security for your Azure service resources
* Implement optimal routing for Azure service traffic from your virtual network

### Azure Bastion
Azure Bastion is a fully platform-managed PaaS service that you implement inside your virtual network. 

Azure Bastion provides secure and seamless RDP/SSH connectivity to your virtual machines directly in the Azure portal over TLS. 

Azure Bastion helps protect against port scanning. 

RDP ports, SSH ports, and public IP addresses aren't publicly exposed for your virtual machines.

When you connect via Azure Bastion, your virtual machines don't need a public IP address. 

Traffic initiated from Azure Bastion to target virtual machines stays within the virtual network or between peered virtual networks.

Azure Bastion sits at the perimeter of your virtual network and helps protect against zero-day exploits. 

You don't need to worry about hardening each of the virtual machines in your virtual network. The Azure platform keeps Azure Bastion up to date.

There's no need to apply NSGs to the Azure Bastion subnet because it's hardened internally. 

For more security, you can configure NSGs to allow only remote connections to the target virtual machines from the Azure Bastion host.

#### Business scenarios
* Secure remote connections from the Azure portal to Azure virtual machines
* Eliminate exposing RDP ports, SSH ports, or public IP addresses for your internal virtual machines
* Integrate with native security appliances for an Azure virtual network, like Azure Firewall
* Monitor and manage remote connections.

### Things to know about JIT network access
JIT network access lets you lock down inbound traffic to your virtual machines. 

You can implement JIT to reduce exposure to attacks while providing easy access to connect to your virtual machines when needed.

* When you enable JIT virtual machine access, you select the ports on the virtual machines to which inbound traffic is blocked. 
	* This configuration ensures "deny all inbound traffic" rules exist for your selected ports in the NSG and [Azure Firewall rules](https://learn.microsoft.com/en-us/azure/firewall/rule-processing). 
	* These rules restrict access to your Azure virtual machine's management ports and defend them from attack.

* If other rules already exist for the selected ports, the existing rules take priority over the new "deny all inbound traffic" rules.
	* If there are no existing rules on the selected ports, the new rules take top priority in the NSG and Azure Firewall.

* When a user requests access to a virtual machine, Security Center checks if the user has [Azure role-based access control (Azure RBAC)](https://learn.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal) permissions for that virtual machine. 
	* If the request is approved, NSGs and Azure Firewall allow inbound traffic to the selected ports from the relevant IP address (or range) for the amount of time specified. 
	* After the time has expired, the NSGs are returned to their previous states. 
	* Connections that are already established aren't interrupted.


