# _AZ-104: Configure and manage virtual networks for Azure administrators_
Learn how to configure and manage Azure network capabilities like connectivity services, application protection, application delivery, and network monitoring services.

## Configure virtual networks
Learn to configure virtual networks and subnets, including IP addressing.

Learning objectives:

* Describe Azure Virtual Network features and components.
* Identify features and usage cases for subnets and subnetting.
* Identify usage cases for private and public IP addresses.
* Create and determine which resources require public IP addresses.
* Create and determine which resources require private IP addresses.
* Create virtual networks.

Virtual networks are a fundamental component of private networks that enable resources to communicate securely.

Communication can happen between resources, over the internet, and with on-premises networks.

### _Plan virtual networks_
A major incentive for adopting cloud solutions like Azure is to enable information technology departments to transition server resources to the cloud.

Moving resources to the cloud can save money and simplify administrative operations.

For small and medium-sized companies, which might not have the expertise to maintain their own robust infrastructure, moving to the cloud is particularly appealing.

Azure network services offer a range of network components with functionalities and capabilities.

#### Things to know about Azure virtual networks
You can implement Azure Virtual Network to create a virtual representation of your network in the cloud.

* An Azure virtual network is a logical isolation of the Azure cloud that's dedicated to your subscription.
* You can use virtual networks to provision and manage virtual private networks (VPNs) in Azure.
* Each virtual network has its own Classless Inter-Domain Routing (CIDR) block and can be linked to other virtual networks and on-premises networks.
* You can link virtual networks with an on-premises IT infrastructure to create hybrid or cross-premises solutions, when the CIDR blocks of the connecting networks don't overlap.
* You control the DNS server settings for virtual networks, and segmentation of the virtual network into subnets.

#### Things to consider when using virtual networks
Virtual networks can be used in many ways. As you think about the configuration plan for your virtual networks and subnets, consider the following scenarios.

Scenario | Description
--- | ---
Create a dedicated private cloud-only virtual network | Sometimes you don't require a cross-premises configuration for your solution. When you create a virtual network, your services and virtual machines within your virtual network can communicate directly and securely with each other in the cloud. You can still configure endpoint connections for the virtual machines and services that require internet communication, as part of your solution.
Securely extend your data center with virtual networks | You can build traditional site-to-site VPNs to securely scale your datacenter capacity. Site-to-site VPNs use IPSEC to provide a secure connection between your corporate VPN gateway and Azure.
Enable hybrid cloud scenarios | Virtual networks give you the flexibility to support a range of hybrid cloud scenarios. You can securely connect cloud-based applications to any type of on-premises system, such as mainframes and Unix systems.


### _Create subnets_
Subnets provide a way for you to implement logical divisions within your virtual network. 

Your network can be segmented into subnets to help improve security, increase performance, and make it easier to manage.

#### Things to know about subnets
There are certain conditions for the IP addresses in a virtual network when you apply segmentation with subnets.

* Each subnet contains a range of IP addresses that fall within the virtual network address space.
* The address range for a subnet must be unique within the address space for the virtual network.
* The range for one subnet can't overlap with other subnet IP address ranges in the same virtual network.
* The IP address space for a subnet must be specified by using CIDR notation.
* You can segment a virtual network into one or more subnets in the Azure portal. Characteristics about the IP addresses for the subnets are listed.

#### Reserved addresses
For each subnet, Azure reserves five IP addresses. The first four addresses and the last address are reserved.

Let's examine the reserved addresses in an IP address range of `192.168.1.0/24`.

Reserved address | Reason
--- | ---
192.168.1.0 | This value identifies the virtual network address.
192.168.1.1 | Azure configures this address as the default gateway.
192.168.1.2 and 192.168.1.3 | Azure maps these Azure DNS IP addresses to the virtual network space.
192.168.1.255 | This value supplies the virtual network broadcast address.

#### Things to consider when using subnets
When you plan for adding subnet segments within your virtual network, there are several factors to consider.

- **Consider service requirements** - Each service directly deployed into a virtual network has specific requirements for routing and the types of traffic that must be allowed into and out of associated subnets.
- **Consider network virtual appliances** - Azure routes network traffic between all subnets in a virtual network, by default. You can override Azure's default routing to prevent Azure routing between subnets. You can also override the default to route traffic between subnets through a network virtual appliance.
- **Consider service endpoints** - You can limit access to Azure resources like an Azure storage account or Azure SQL database to specific subnets with a virtual network service endpoint. You can also deny access to the resources from the internet.
- **Consider network security groups** - You can associate zero or one network security group to each subnet in a virtual network. You can associate the same or a different network security group to each subnet.
- **Consider private links** - Azure Private Link provides private connectivity from a virtual network to Azure platform as a service (PaaS), customer-owned, or Microsoft partner services. Private Link simplifies the network architecture and secures the connection between endpoints in Azure. The service eliminates data exposure to the public internet.

### _Create virtual networks_
You can create new virtual networks at any time. You can also add virtual networks when you create a virtual machine.

#### Things to know about creating virtual networks
Review the following requirements for creating a virtual network.

* When you create a virtual network, you need to define the IP address space for the network.* 

* Plan to use an IP address space that's not already in use in your organization.* 
	* The address space for the network can be either on-premises or in the cloud, but not both.* 
	* You can't redefine the IP address space for a network after it's created. If you plan your address space for cloud-only virtual networks, you might later decide to connect an on-premises site.
 
* To create a virtual network, you need to define at least one subnet.
	* Each subnet contains a range of IP addresses that fall within the virtual network address space.
	* The address range for each subnet must be unique within the address space for the virtual network.
	* The range for one subnet can't overlap with other subnet IP address ranges in the same virtual network.

* You can create a virtual network in the Azure portal. Provide the Azure subscription, resource group, virtual network name, and service region for the network.


### _Plan IP addressing_
You can assign IP addresses to Azure resources to communicate with other Azure resources, your on-premises network, and the internet. 

There are two types of Azure IP addresses: private and public.

**Private IP addresses** enable communication within an Azure virtual network and your on-premises network. You create a private IP address for your resource when you use a VPN gateway or Azure ExpressRoute circuit to extend your network to Azure.

**Public IP addresses** allow your resource to communicate with the internet. You can create a public IP address to connect with Azure public-facing services.

#### Things to know about IP addresses
Let's take a closer look at the characteristics of IP addresses.

* IP addresses can be statically assigned or dynamically assigned.
 
* You can separate dynamically and statically assigned IP resources into different subnets.
 
* Static IP addresses don't change and are best for certain situations, such as:
	* DNS name resolution, where a change in the IP address requires updating host records.
	* IP address-based security models that require apps or services to have a static IP address.
	* TLS/SSL certificates linked to an IP address.
	* Firewall rules that allow or deny traffic by using IP address ranges.
	* Role-based virtual machines such as Domain Controllers and DNS servers.


### _Create public IP addressing_
You can create a public IP address for your resource in the Azure portal.

#### Things to consider when creating a public IP address
To create a public IP address, configure the following settings:

- **IP Version:** Select to create an IPv4 or IPv6 address, or Both addresses. The Both option creates two public IP addresses: an IPv4 address and an IPv6 address.
- **SKU:** Select the SKU for the public IP address, including Basic or Standard. The value must match the SKU of the Azure load balancer with which the address is used.
- **Name:** Enter a name to identify the IP address. The name must be unique within the resource group you select.
- **IP address assignment:** Identify the type of IP address assignment to use.
	- Dynamic addresses are assigned after a public IP address is associated to an Azure resource and is started for the first time.
	- Static addresses are assigned when a public IP address is created.

> If you select IPv6 for the IP version, the assignment method must be Dynamic for the Basic SKU. Standard SKU addresses are Static for both IPv4 and IPv6 addresses.

### _Associate public IP addresses_
A public IP address resource can be associated with virtual machine network interfaces, internet-facing load balancers, VPN gateways, and application gateways. 

You can associate your resource with both dynamic and static public IP addresses.

The following table summarizes how you can associate public IP addresses for different types of resources.

Resource | Public IP address association | Dynamic IP address | Static IP address
--- | --- | :---: | :---:
Virtual machine | NIC | Yes | Yes
Load balancer | Front-end configuration | Yes | Yes
VPN gateway | VPN gateway IP configuration | Yes | Yes *
Application gateway | Front-end configuration | Yes | Yes *

> Static IP addresses are available on certain SKUs only.

#### Public IP address SKUs
When you create a public IP address, you select the Basic or Standard SKU. 

Your SKU choice affects the IP assignment method, security, available resources, and redundancy options.

The following table summarizes the differences between the SKU types for public IP addresses.

Feature | Basic SKU | Standard SKU
--- | --- | ---
IP assignment | Static or Dynamic	 | Static
Security | Open by default | Secure by default, closed to inbound traffic
Resources | Network interfaces, VPN gateways, Application gateways, and internet-facing load balancers | Network interfaces or public standard load balancers
Redundancy | 	Not zone redundant | Zone redundant by default

### _Allocate or assign private IP addresses_
A private IP address resource can be associated with virtual machine network interfaces, internal load balancers, and application gateways. 

Azure can provide an IP address (dynamic assignment) or you can assign the IP address (static assignment).

The following table summarizes how you can associate private IP addresses for different types of resources.

Resource | Private IP address association | Dynamic IP address | Static IP address
--- | --- | :---: | :---:
Virtual machine | NIC | Yes | Yes
Internal load balancer | Front-end configuration | Yes | Yes
Application gateway | Front-end configuration | Yes | Yes

#### Private IP address assignment
A private IP address is allocated from the address range of the virtual network subnet that a resource is deployed in. 

There are two options: dynamic and static.

* Dynamic: Azure assigns the next available unassigned or unreserved IP address in the subnet's address range. Dynamic assignment is the default allocation method.
* Static: You select and assign any unassigned or unreserved IP address in the subnet's address range.


## Configure network security groups
Learn how to implement network security groups, and ensure network security group rules are correctly applied.

Learning objectives:

* Determine when to use network security groups.
* Implement network security group rules.
* Evaluate network security group effective rules.
* Examine advantages of application security groups

### Implement network security groups
You can limit network traffic to resources in your virtual network by using a network security group. 

You can assign a network security group to a subnet or a network interface, and define security rules in the group to control network traffic.

#### Things to know about network security groups
Characteristics of network security groups.

* A network security group contains a list of security rules that allow or deny inbound or outbound network traffic.
* A network security group can be associated to a subnet or a network interface.
* A network security group can be associated multiple times.
* You create a network security group and define security rules in the Azure portal.

Network security groups are defined for your virtual machines in the Azure portal. 

The Overview page for a virtual machine provides information about the associated network security groups. 

You can see details such as the assigned subnets, assigned network interfaces, and the defined security rules.

#### Network security groups and subnets
You can assign network security groups to a subnet and create a protected screened subnet (also referred to as a demilitarized zone or DMZ). 

A DMZ acts as a buffer between resources within your virtual network and the internet.

* Use the network security group to restrict traffic flow to all machines that reside within the subnet.
* Each subnet can have a maximum of one associated network security group.

#### Network security groups and network interfaces
You can assign network security groups to a network interface card (NIC).

* Define network security group rules to control all traffic that flows through a NIC.
* Each network interface that exists in a subnet can have zero, or one, associated network security groups.


### _Determine network security group rules_
Security rules in network security groups enable you to filter network traffic. 

You can define rules to control the traffic flow in and out of virtual network subnets and network interfaces.

#### Things to know about security rules
Review the below characteristics of security rules in network security groups.

* Azure creates several default security rules within each network security group, including inbound traffic and outbound traffic. Examples of default rules include `DenyAllInbound` traffic and `AllowInternetOutbound` traffic.

* Azure creates the default security rules in each network security group that you create.

* You can add more security rules to a network security group by specifying conditions for any of the following settings:
	* Name
	* Priority
	* Port
	* Protocol (Any, TCP, UDP)
	* Source (Any, IP addresses, Service tag)
	* Destination (Any, IP addresses, Virtual network)
	* Action (Allow or Deny)

* Each security rule is assigned a Priority value. All security rules for a network security group are processed in priority order.

* You can't remove the default security rules.

* You can override a default security rule by creating another security rule that has a higher Priority setting for your network security group.

#### Inbound traffic rules
Azure defines three default inbound security rules for your network security group. 

These rules deny all inbound traffic except traffic from your virtual network and Azure load balancers.

#### Outbound traffic rules
Azure defines three default outbound security rules for your network security group. 

These rules only allow outbound traffic to the internet and your virtual network.


### _Determine network security group effective rules_
Each network security group and its defined security rules are evaluated independently. 

Azure processes the conditions in each rule defined for each virtual machine in your configuration.

* For inbound traffic, Azure first processes network security group security rules for any associated subnets and then any associated network interfaces.
* For outbound traffic, the process is reversed. Azure first evaluates network security group security rules for any associated network interfaces followed by any associated subnets.
* For both the inbound and outbound evaluation process, Azure also checks how to apply the rules for intra-subnet traffic.

How Azure ends up applying your defined security rules for a virtual machine determines the overall effectiveness of your rules.

#### Things to know about effective security rules
Let's explore how network security group rules are defined and processed within a virtual network to yield the effective rules.

Consider the following virtual network configuration that shows network security groups (NSGs) controlling traffic to virtual machines (VMs). 

The configuration requires security rules to manage network traffic to and from the internet over TCP port 80 via the network interface.

#### Inbound traffic effective rules
Azure processes rules for inbound traffic for all VMs in the configuration. 

Azure identifies if the VMs are members of an NSG, and if they have an associated subnet or NIC.

* When an NSG is created, Azure creates the default security rule DenyAllInbound for the group. 
* The default behavior is to deny all inbound traffic from the internet. 
* If an NSG has a subnet or NIC, the rules for the subnet or NIC can override the default Azure security rules.
* NSG inbound rules for a subnet in a VM take precedence over NSG inbound rules for a NIC in the same VM.

#### Outbound traffic effective rules
Azure processes rules for outbound traffic by first examining NSG associations for NICs in all VMs.

* When an NSG is created, Azure creates the default security rule `AllowInternetOutbound` for the group. 
* The default behavior is to allow all outbound traffic to the internet. 
* If an NSG has a subnet or NIC, the rules for the subnet or NIC can override the default Azure security rules.
* NSG outbound rules for a NIC in a VM take precedence over NSG outbound rules for a subnet in the same VM.

#### Things to consider when creating effective rules
Review the following considerations regarding creating effective security rules for machines in your virtual network.

- **Consider allowing all traffic** - If you place your virtual machine within a subnet or utilize a network interface, you don't have to associate the subnet or NIC with a network security group
- **Consider importance of allow rules** - When you create a network security group, you must define an allow rule for both the subnet and network interface in the group to ensure traffic can get through.
- **Consider intra-subnet traffic** - The security rules for a network security group that's associated to a subnet can affect traffic between all virtual machines in the subnet. By default, Azure allows virtual machines in the same subnet to send traffic to each other (referred to as intra-subnet traffic).
- **Consider rule priority** - The security rules for a network security group are processed in priority order. To ensure a particular security rule is always processed, assign the lowest possible priority value to the rule.

#### View effective security rules
If you have several network security groups and aren't sure which security rules are being applied, you can use the Effective security rules link in the Azure portal. 

You can use the link to verify which security rules are applied to your machines, subnets, and network interfaces.


### _Create network security group rules_
It's easy to add security rules to control inbound and outbound traffic in the Azure portal. 

You can configure your virtual network security group rule settings, and select from a large variety of communication services, including HTTPS, RDP, FTP, and DNS.

#### Things to know about configuring security rules
Let's look at some of the properties you need to specify to create your security rules. 

As you review these settings, think about the traffic rules you need to create and what services can fulfill your network requirements.

* **Source:** 
	* Identifies how the security rule controls inbound traffic. 
	* The value specifies a specific source IP address range that's allowed or denied. 
	* The source filter can be any resource, an IP address range, an application security group, or a default tag.

* **Destination:**
	* Identifies how the security rule controls outbound traffic. 
	* The value specifies a specific destination IP address range that's allowed or denied. 
	* The value can be any resource, an IP address range, an application security group, or a default tag.

* **Service:** 
	* Specifies the destination protocol and port range for the security rule. 
	* You can choose a predefined service like RDP or SSH or provide a custom port range. There are a large number of services to select from.

* **Priority:** 
	* Assigns the priority order value for the security rule. 
	* Rules are processed according to the priority order of all rules for a network security group, including a subnet and network interface. 
	* The lower the priority value, the higher priority for the rule.


### _Implement application security groups_
You can implement [application security groups](https://learn.microsoft.com/en-us/azure/virtual-network/application-security-groups) in your Azure virtual network to logically group your virtual machines by workload. 

You can then define your network security group rules based on your application security groups.

#### Things to know about using application security groups
Application security groups work in the same way as network security groups, but they provide an application-centric way of looking at your infrastructure. 

You join your virtual machines to an application security group.

Then you use the application security group as a source or destination in the network security group rules.

#### Things to consider when using application security groups
There are several advantages to implementing application security groups in your virtual networks.

- **Consider IP address maintenance** - When you control network traffic by using application security groups, you don't need to configure inbound and outbound traffic for specific IP addresses.
- **Consider no subnets** - By organizing your virtual machines into application security groups, you don't need to also distribute your servers across specific subnets.
- **Consider simplified rules** - Application security groups help to eliminate the need for multiple rule sets. You don't need to create a separate rule for each virtual machine.
- **Consider workload support** - A configuration that implements application security groups is easy to maintain and understand because the organization is based on workload usage. 


## Configure Azure Firewall
Learn how to configure Azure Firewall including firewall rules.

Learning objectives

* Determine when to use Azure Firewall.
* Implement Azure Firewall including firewall rules.

Azure Firewall helps to secure an Azure Virtual Network implementation for allowed traffic and deny threatening or unknown traffic from the internet.

### _Determine use cases for Azure Firewall_
Azure Firewall is a managed, cloud-based network security service that protects your Azure Virtual Network resources. 

It's a fully stateful firewall as a service with built-in high availability and unrestricted cloud scalability. 

You can centrally create, enforce, and log application and network connectivity policies across subscriptions and virtual networks.

#### Things to know about Azure Firewall
As you review these items, start to think about how Azure Firewall can support your virtual network configuration.

Feature | Description
--- | ---
Public IP address | Azure Firewall uses a static public IP address for your virtual network resources. External firewalls identify traffic originating from your virtual network by the IP address.
Built-in high availability | With Azure Firewall, you gain built-in high availability without any extra configuration requirements. You don't need to implement other load balancers.
Availability zones | Configure Azure Firewall during deployment to span multiple availability zones for increased availability.
Unrestricted cloud scalability | Azure Firewall offers unrestricted cloud scalability to scale as needed to accommodate changing network traffic flows. You don't need to budget for your peak traffic.
Application FQDN filtering rules | Azure Firewall lets you limit outbound HTTP/S traffic or Azure SQL traffic to a specified list of fully qualified domain names (FQDN) including wild cards.
Network traffic filtering rules | Create network filtering rules in Azure Firewall to allow or deny traffic by source and destination IP address, port, and protocol.
Threat intelligence | Azure Firewall supports threat intelligence-based filtering. Configure your firewall to alert and deny traffic from/to known malicious IP addresses and domains. 
Azure Monitor integration | Azure Firewall is fully integrated with Azure Monitor for logging and analytics.

> Azure Firewall is fully stateful. The service can distinguish legitimate packets for different types of connections. Rules are enforced and logged across multiple subscriptions and virtual networks.


### Create an Azure Firewall implementation
When you deploy a firewall, the recommended approach is to implement a hub-spoke network topology.

The hub is a virtual network in Azure that acts as a central point of connectivity to your on-premises network.

Spokes are virtual networks that peer with the hub, and can be used to isolate workloads.

Traffic flows between an on-premises datacenter and the hub network through an Azure connection, such as Azure ExpressRoute, Azure VPN Gateway, or Azure Bastion.

#### Things to consider when using a hub-spoke network
There are several benefits to using a hub-spoke network for your Azure Firewall implementation.

- **Consider cost savings** - Implement a hub-spoke network and reduce your costs by centralizing services that can be shared by multiple workloads in a single location.
- **Consider subscription limits** - Overcome subscription limits by peering your virtual networks from different subscriptions to the central hub network.
- **Consider role separation** - Use a hub-spoke network configuration to support separation of responsibilities. The hub-spoke firewall topology lets you distribute maintenance tasks between central IT (SecOps, InfraOps) and workloads (DevOps).
- **Consider shared services** - Support workloads in different environments that require shared services, but not connectivity to each other.
- **Consider centralized control** - Apply the hub-spoke network for enterprises that require central control over security aspects. A common example is a firewall located in the hub and workloads placed in each spoke.


### _Create Azure Firewall rules_
By default, Azure Firewall denies all traffic through your virtual network. 

The purpose of the default behavior is to provide the highest level of protection against malicious or unknown access. 

To allow traffic for a particular resource or service, you need to define rules to control the specific traffic.

There are three kinds of rules you can configure for Azure Firewall: NAT, network, and application. The rules are defined in the Azure portal.

#### How rules are processed by Azure Firewall
When a packet arrives on a designated port in your network, the packet is inspected to determine if it's allowed. 

Azure Firewall processes the packet by evaluating it against your rules in the following order:

1. Network rules
2. Application rules (for the network and applications)

If a rule is found that allows the packet through, no remaining network or application rules are checked against the packet.

After a packet is allowed, Azure Firewall checks for NAT rules that define how to route the allowed traffic.

#### Things to know about NAT rules
You can configure NAT or Azure Firewall destination network address translation (DNAT) rules to translate and filter inbound traffic to your subnets. 

Each rule in your NAT rule collection is used to translate your firewall public IP and port to a private IP and port. 

A NAT rule that routes traffic must be accompanied by a matching network rule to allow the traffic.

Scenarios where NAT rules can be helpful are publishing SSH, RDP, or non-HTTP/S applications to the internet.

The configuration settings for a NAT rule include:

* Name: Provide a label for the rule.
* Protocol: Choose the TCP or UDP protocol.
* Source Address: Identify the address as * (internet), a specific internet address, or a classless inter-domain routing (CIDR) block.
* Destination Address: Specify the external address of the firewall for the rule to inspect.
* Destination Ports: Provide the TCP or UDP ports that the rule listens to on the external IP address of the firewall.
* Translated Address: Specify the IP address of the service (virtual machine, internal load balancer, and so on) that privately hosts or presents the service.
* Translated Port: Identify the port that the inbound traffic is routed to by Azure Firewall.

#### Things to know about Network rules
Any non-HTTP/S traffic that's allowed to flow through your firewall must have a network rule. 

Consider a scenario where resources in one subnet must communicate with resources in another subnet. In this case, you can configure a network rule from the source to the destination.

A network rule has the following configuration settings:

* Name: Provide a friendly label for the rule.
* Protocol: Choose the protocol for the rule, including TCP, UDP, ICMP (ping and traceroute), or Any.
* Source Address: Identify the address or CIDR block of the source.
* Destination Addresses: Specify the addresses or CIDR blocks of the destination(s).
* Destination Ports: Provide the destination port of the traffic.

#### Things to know about Application rules
Application rules define fully qualified domain names (FQDNs) that can be accessed from a subnet. 

An example is when you need to allow Windows Update network traffic through the firewall.

Here are the configuration settings for an application rule:

* Name: Provide a friendly label for the rule.
* Source Addresses: Identify the IP address of the source.
* Protocol:Port: Specify `HTTP` or `HTTPS` and the port that the web server is listening on.
* Target FQDNs: Provide the domain name of the service, such as `www.contoso.com`. Wildcards (*) can be used. An FQDN tag represents a group of FQDNs associated with well known Microsoft services. Example FQDN tags include `Windows Update`, `App Service Environment`, and `Azure Backup`.

> SNAT is used to translate internal private IP addresses to the public IP address of Azure Firewall.

## Configure Azure DNS
Learn how to configure Azure DNS including custom domain names and record sets.

Learning objectives:

* Identify features and usage cases for domains, custom domains, and private zones.
* Verify custom domain names by using DNS records.
* Implement DNS zones, DNS delegation, and DNS record sets.

A domain name system (DNS) is used to translate (or resolve) a service name to an IP address. 

Azure DNS is a service that lets you host the DNS records for your domains on Azure infrastructure. 

By implementing Azure DNS, you can use the same credentials, APIs, tools, and billing as your other Azure services.

### _Identify domains and custom domains_
Azure DNS enables you to host your DNS domains in Azure and access name resolution for your domains by using Microsoft Azure infrastructure.

You can configure and manage your custom domains with Azure DNS in the Azure portal. 

By accessing your domains in Azure, you can use your same credentials, support agreements, and billing preferences as for your other Azure services.

#### Things to know about domain names in Azure
Let's examine how an initial domain name and custom domain names are implemented in Azure.

* When you create an Azure subscription, Azure automatically creates an Azure Active Directory (Azure AD) domain for your subscription.
* Azure applies an initial domain name to your initial domain instance.
* The initial domain name follows the form `<Your Domain Name>` followed by `.onmicrosoft.com.` For example, `yourdomainname.onmicrosoft.com`.
* The purpose of a custom domain name is to provide a simplified form of your domain name to support specific users or tasks.
* The initial domain name is intended to be used until your custom domain name is verified.
* Before a custom domain name can be used by Azure AD, the custom domain name must be added to your directory and verified.
* The initial domain name can't be changed or deleted, but you can add a routable custom domain name that you control.
* In Azure AD, domain names must be globally unique. When one Azure AD directory has verified a specific domain name, other Azure AD directories can't use that same domain name.

### _Verify custom domain names_
When an administrator adds a custom domain name to an Azure Active Directory instance, the custom domain name is initially in an unverified state.

Azure AD won't allow any directory resources to use a custom domain name that's unverified.

Before you can use a custom domain name for your Azure AD instance, your custom domain name must be verified.

#### How to verify your custom domain name
After you add a custom domain name for your Azure AD instance in the Azure portal, you must verify ownership of your custom domain name.

You initiate the verification process by adding a DNS record for your custom domain name. The DNS record type can be `MX` or `TXT`.

* The MX (or Mail exchange) record lists mail exchange servers that accept email for your domain. 
* The TXT (or Text) record indicates human-readable text or machine-readable data about your domain. These record types are defined in RFC 1035.


After you add a DNS record to your custom domain name, Azure queries the DNS domain for the presence of the DNS record.

After Azure verifies the presence of the DNS record for your custom domain name, Azure adds your new custom domain name to your subscription for the Azure AD instance.

### _Create Azure DNS zones_
Azure DNS provides a reliable, secure DNS service to manage and resolve domain names in a virtual network without needing to add a custom DNS solution.

An Azure DNS zone hosts the DNS records for a domain. 

To begin hosting your domain in Azure DNS, you need to create a DNS zone for your domain name. Each DNS record for your domain is then created inside your DNS zone.

#### Things to know about DNS zones
You can add a DNS zone in the Azure portal, as shown in the following image. 

Several configuration settings are required to create a DNS zone.

In the portal, you specify the DNS zone name, number of records, resource group, zone location, associated subscription, and DNS name servers.

#### Characteristics about DNS zones
* Within a resource group, the name of a DNS zone must be unique.
* By providing a unique name when you create a new DNS zone, Azure ensures that the DNS zone doesn't already exist in the resource group.
* Multiple DNS zones can have the same name, but the DNS zones must exist in different resource groups or in different Azure subscriptions.
* When multiple DNS zones share the same name, each DNS zone instance is assigned to a different DNS name server address.
* The Root/Parent domain is registered at the registrar and then pointed to Azure DNS.
* Child domains are registered directly in Azure DNS.

> You don't have to own a domain name to create a DNS zone with that domain name in Azure DNS. However, you do need to own the domain to configure the domain.

### _Delegate DNS domains_
To delegate your domain to Azure DNS, you need to identify the DNS name servers for your DNS zone.

Each time a DNS zone is created, Azure DNS allocates DNS name servers from a pool. 

After the DNS name servers are assigned, Azure DNS automatically creates authoritative NS (or Name server) records in your DNS zone.

The delegation process for your domain involves several steps:

1. Identify your DNS name servers
2. Update your parent domain
3. Delegate subdomains (optional)

#### How to update your parent domain
After your DNS zone is created, and you can identify your DNS name servers, you need to update your parent domain.

Each registrar has their own DNS management tools to manage the DNS name server records for a domain. 

The term registrar refers to the third-party domain registrar, which is the company where you registered your domain.

Here's a basic process you can follow to update your parent domain information with your registrar:

1. Go to your registrar's DNS management page.
2. Find the existing NS records for your parent domain.
3. Replace the existing NS records with the NS records created for your domain by Azure DNS.

#### Things to consider when working with NS records
There are several important considerations to keep in mind when working with NS records and name servers for a DNS zone.

* When you copy an `NS` record (a DNS name server address), be sure to include the trailing period (.) at the end of the address. 
* The trailing period indicates the end of a fully qualified domain name, such as` ns1-02.azure-dns.com.` and `ns3-02.azure-dns.org.`.

* To delegate your domain to Azure DNS, you must use the exact names of the DNS name servers as created by Azure DNS.

* Microsoft recommends that you always copy all DNS name server NS records for your domain to the parent domain, regardless of the actual domain name.

#### How to delegate subdomains
You can delegate a subdomain for your domain in Azure DNS by setting up a separate child DNS zone.

The configuration steps for delegating a child DNS zone are similar to the typical delegation process. 

The key difference is you don't work with your registrar to delegate a subdomain. You delegate the child DNS zone in the Azure portal.

The steps to delegate a subdomain are:

1. Go to the parent DNS zone for your domain in the Azure portal.
1. Find the existing NS records for your parent domain.
1. Create new NS records for your child DNS zone (subdomain).

### _Add DNS record sets_
It's important to understand the difference between DNS record sets and individual DNS records.

A DNS record set (also known as a resource record set) is a collection of records in a DNS zone.

You define record sets in the Azure portal. The configuration settings depend on the record type for the set to create.

* Suppose you choose to create a set of A records (or Address record) to identify IP addresses associated with your domain. 
* To create the A records, you need to provide the TTL (time to live) and the IP addresses. 
* The TTL value specifies how long each record is cached by clients.

#### Things to know about DNS record sets
Let's examine some characteristics of DNS record sets.

* All records in a DNS record set must have the same name and the same record type.

Consider the following example where we have two records in a record set. 
All records have the same name, `www.contoso.com.`. 
All records have the same record type, A. Each record in the set has a different value. In this case, each record provides a different IP address.

```
www.contoso.com.        3600    IN    A     134.170.185.46
www.contoso.com.        3600    IN    A     134.170.188.221
```

* A DNS record set can't contain two identical records.
* A record set of type `CNAME` can contain only one record.
* A `CNAME` record (or Canonical name record) provides an alias of one domain name to another.
* You can create a record set that doesn't have any records. This set is called an empty record set.
* If you have an empty record set for your domain, this set doesn't appear on your Azure DNS name servers.

### _Plan for Azure Private DNS zones_
Azure Private DNS zones can be created by using your own custom domain names rather than the names provided by Azure.

With your own custom domain names, you can tailor your virtual network architecture to best suit your organization's needs.

You gain name resolution for virtual machines within your virtual network and between virtual networks.

You can configure DNS zone names with a split-horizon view, which allows a private and a public DNS zone to share the same domain name.

#### Things to know about Azure Private DNS benefits
There are many benefits to implementing Azure Private DNS for your domain.

Benefit | Description
--- | ---
No custom DNS solution required | You can now perform DNS zone management by using the native Azure infrastructure. Azure Private DNS removes the burden of creating and managing custom DNS solutions.
Support for common DNS records types | Azure Private DNS supports all common DNS record types, including `A`, `AAAA`, `CNAME`, `MX`, `PTR`, `SOA`, `SRV`, and `TXT`.
Automatic hostname record management | Along with hosting your custom DNS records, Azure Private DNS automatically maintains hostname records for the virtual machines in the specified virtual networks.
Hostname resolution between virtual networks | Unlike Azure-provided host names, Azure Private DNS zones can be shared between virtual networks.
Familiar tools and user experience | To reduce the learning curve, Azure Private DNS uses well-established Azure DNS tools, including PowerShell, Azure Resource Manager (ARM) templates, and the REST API.
Split-horizon DNS support | With Azure Private DNS, you can create zones with the same name that resolve to different answers from within a virtual network and from the public internet. A typical scenario for a split-horizon DNS is to provide a dedicated version of a service for use inside your virtual network.
Azure region support | Azure Private DNS zones are available in all Azure regions in the Azure public cloud.

### _Review Azure Private DNS zone scenarios_
Review below common scenarios for implementing Azure Private DNS zone records.

#### Scenario 1: Name resolution scoped to a single virtual network
The first scenario consists of virtual networks and resources in Azure that include virtual machines. 

The resources need to be resolved from within the virtual network by using a specific domain name (or DNS zone).

The name resolution needs to be private and not accessible from the internet. 

The scenario requires that Azure should automatically register the virtual machines within the virtual network into the DNS zone.

Scenario details:

* Virtual network 1 contains two virtual machines: VM1 and VM2. VM1 and VM2 each have a private IP address.
* When an Azure Private DNS zone address is created (such as `contoso.lab`) and linked to Virtual network 1, Azure DNS automatically creates two `A` records in the DNS zone if Auto registration is enabled in the link configuration.
* In this scenario, Azure DNS uses only Virtual network 2 to resolve domain name (or DNS zone) queries.
* A reverse DNS query (PTR) for the private IP address of VM1 (10.0.0.4) issued from VM2 receive an Azure DNS response that contains the FQDN of VM1, as expected.

#### Scenario 2: Name resolution for multiple networks
The second scenario involves name resolution across multiple virtual networks, which is probably the most common usage for Azure Private DNS zones.

This scenario consists of two virtual networks. 

One network is focused on registration for Azure Private DNS zone records and the other supports name resolution.

Scenario details:

* Virtual network 1 is designated for registration. Virtual network 2 is designated for name resolution.
* The design strategy is for both virtual networks to share the common DNS zone address, contoso.lab.
* The resolution and registration virtual networks are linked to the common DNS zone.
* Azure Private DNS zone records for virtual machines in Virtual network 1 (registration) are created automatically.
* For virtual machines in Virtual network 2 (resolution), Azure Private DNS zone records can be created manually.
* In this scenario, Azure DNS uses both virtual networks to resolve domain name queries.
	* An Azure DNS query from a virtual machine in Virtual network 2 (resolution) for a virtual machine in Virtual network 1 (registration) receives an Azure DNS response containing the private IP address of the virtual machine.
* Reverse DNS queries are scoped to the same virtual network.
	* A reverse DNS (PTR) query from a virtual machine in Virtual network 2 (resolution) for a virtual machine in Virtual network 1 (registration) receives an Azure DNS response containing the `NXDOMAIN` of the virtual machine.
	* `NXDOMAIN` is an error message that indicates the queried domain doesn't exist.
	* A reverse DNS (PTR) query from a virtual machine in Virtual network 1 (registration) for a virtual machine also in Virtual network 1 receives the FQDN for the virtual machine.


> Azure DNS hosts the registered domains. Administrators can control and configure domain records like A, CNAME, and MX, and set up alias records.
> Azure Private DNS manages and resolves domain names in a virtual network without adding a custom DNS solution.


## Configure Azure Virtual Network peering
Learn to configure an Azure Virtual Network peering connection and address transit and connectivity concerns.

Learning objectives:

* Identify usage cases and product features of Azure Virtual Network peering.
* Configure your network to implement Azure VPN Gateway for transit connectivity.
* Extend peering by using a hub and spoke network with user-defined routes and service chaining.

Azure Virtual Network peering lets you connect virtual networks in the same or different regions, so resources in both networks can communicate with each other.

### _Determine Azure Virtual Network peering uses_
Perhaps the simplest and quickest way to connect your virtual networks is to use Azure Virtual Network peering.

Virtual Network peering enables you to seamlessly connect two Azure virtual networks.

After the networks are peered, the two virtual networks operate as a single network, for connectivity purposes.

#### Things to know about Azure Virtual Network peering
* There are two types of Azure Virtual Network peering: regional and global.
* **Regional virtual network peering** connects Azure virtual networks that exist in the same region.
* **Global virtual network peering** connects Azure virtual networks that exist in different regions.
* You can create a regional peering of virtual networks in the same Azure public cloud region, or in the same China cloud region, or in the same Microsoft Azure Government cloud region.
* You can create a global peering of virtual networks in any Azure public cloud region, or in any China cloud region.
* Global peering of virtual networks in different Azure Government cloud regions isn't permitted.
* After you create a peering between virtual networks, the individual virtual networks are still managed as separate resources.

#### Things to consider when using Azure Virtual Network peering
Consider the following benefits of using Azure Virtual Network peering.

Benefit | Description
--- | ---
Private network connections | When you implement Azure Virtual Network peering, network traffic between peered virtual networks is private. Traffic between the virtual networks is kept on the Microsoft Azure backbone network.
Strong performance | Because Azure Virtual Network peering utilizes the Azure infrastructure, you gain a low-latency, high-bandwidth connection between resources in different virtual networks.
Simplified communication | Azure Virtual Network peering lets resources in one virtual network communicate with resources in a different virtual network, after the virtual networks are peered.
Seamless data transfer | You can create an Azure Virtual Network peering configuration to transfer data across Azure subscriptions, deployment models, and across Azure regions.
No resource disruptions | Azure Virtual Network peering doesn't require downtime for resources in either virtual network when creating the peering, or after the peering is created.

### _Determine gateway transit and connectivity_
When virtual networks are peered, you can configure Azure VPN Gateway in the peered virtual network as a transit point. 

In this scenario, a peered virtual network uses the remote VPN gateway to gain access to other resources.

#### Things to know about Azure VPN Gateway
Let's take a closer look at how Azure VPN Gateway is implemented with Azure Virtual Network peering.

* A virtual network can have only one VPN gateway.
* Gateway transit is supported for both regional and global virtual network peering.
* When you allow VPN gateway transit, the virtual network can communicate to resources outside the peering. 
* Gateway transit allows peered virtual networks to share the gateway and get access to resources.
* You can apply network security groups in a virtual network to block or allow access to other virtual networks or subnets.
* When you configure virtual network peering, you can choose to open or close the network security group rules between the virtual networks.

### _Create virtual network peering_
Azure Virtual Network peering can be configured for virtual networks by using PowerShell, the Azure CLI, and in the Azure portal.

This module, covers the steps needed to create the peering in the Azure portal for virtual networks deployed through Azure Resource Manager.

#### Things to know about creating virtual network peering
There are a few points to review before we look at how to create the peering in the Azure portal.

* To implement virtual network peering, your Azure account must be assigned to the `Network Contributor` or `Classic Network Contributor` role. 
* To create a peering, you need two virtual networks.
* The second virtual network in the peering is referred to as the *remote network*.
* Initially, the virtual machines in your virtual networks can't communicate with each other. 
* After the peering is established, virtual machines can communicate within the peered network based on your configuration settings.

#### How to create a virtual network peering
Sign into your Azure account in the Azure portal, and choose the subscription to use for your peering configuration.

1. Create two virtual networks to include in the peering. (at least one must be deployed by using the Azure Resource Manager)
2. Choose the first virtual network to use in the peering, and select **Settings** > **Add** (peering).
3. Configure the peering parameters for the first virtual network.
	4. Peering link name
	5. Traffic to remote virtual network: Allow or Block
	6. Traffic forwarded from remote virtual network: Allow or Block
	7. Virtual network gateway or Route Server = (Specify whether your virtual network peering should use an Azure VPN gateway)
8. Configure the peering parameters for your remote virtual network.
9. Create at least one virtual machine in each virtual network.
10. Test communication between the virtual machines within your peered network. 

#### How to check your peering status
In the Azure portal, you can check the connectivity status of the virtual networks in your virtual network peering.

The status conditions depend on how your virtual networks are deployed.

* For deployment with the Azure Resource Manager, the two primary status conditions are **Initiated** and **Connected**.
* For the classic deployment model, the Updating status condition is also used.
* When you create the initial peering to the second (remote) virtual network from the first virtual network, the peering status for the first virtual network is Initiated.
* When you create the subsequent peering from the second virtual network to the first virtual network, the peering status for both the first and remote virtual networks is Connected.

### _Extend peering with user-defined routes and service chaining_
Virtual network peering is nontransitive. The communication capabilities in a peering are available to only the virtual networks and resources in the peering.

Other mechanisms have to be used to enable traffic to and from resources and networks outside the private peering network.

#### Things to know about extending peering
There are a few ways to extend the capabilities of your peering for resources and virtual networks outside your peering network:

* Hub and spoke networks
* User-defined routes
* Service chaining

You can implement these mechanisms and create a multi-level hub and spoke architecture.

These options can help overcome the limit on the number of virtual network peerings per virtual network.

The following diagram shows a hub and spoke virtual network with an NVA and VPN gateway. 

The hub and spoke network is accessible to other virtual networks via user-defined routes and service chaining.

Mechanism | Description
--- | ---
Hub and spoke network | When you deploy a hub-and-spoke network, the hub virtual network can host infrastructure components like a network virtual appliance (NVA) or Azure VPN gateway. 
User-defined route (UDR) | Virtual network peering enables the next hop in a user-defined route to be the IP address of a virtual machine in the peered virtual network, or a VPN gateway.
Service chaining | Service chaining lets you define UDRs. These routes direct traffic from one virtual network to an NVA or VPN gateway.


## Configure Azure VPN Gateway
Learn how to create VPN gateways and securely connect your company sites to Azure.

Learning objectives:

* Identify features and usage cases for Azure VPN Gateway.
* Implement high availability scenarios.
* Configure site-to-site VPN connections by using a VPN gateway.

Organizations use a virtual private network (VPN) to create a private, encrypted connection for their resources and users to the internet.

A VPN enables a true IP address to be changed or hidden to help prevent against unwanted access and malicious attacks.

Azure VPN Gateway supports encrypted traffic between Azure virtual networks and on-premises locations over the internet, or between Azure virtual networks over the Microsoft network.

### _Determine Azure VPN Gateway uses_
A VPN gateway is a specific type of virtual network gateway that's used to send encrypted traffic between your Azure virtual network and an on-premises location over the public internet.

A VPN gateway can also be used to send encrypted traffic between your Azure virtual networks over the Microsoft network.

Azure VPN Gateway is a service that uses this specific type of virtual network gateway to support encrypted traffic.

#### Things to know about VPN gateways
* When you implement a VPN gateway, the VPN service intercepts your data and applies encryption before it reaches the internet.
* The VPN service uses a secure pathway (called a VPN tunnel) for movement of your data between your device and the internet. 
* A virtual network can have only one VPN gateway.
* Multiple connections can be created to the same VPN gateway.
* When you create multiple connections to the same VPN gateway, all VPN tunnels share the available gateway bandwidth.
* A VPN gateway can be deployed in Azure availability zones to gain resiliency, scalability, and higher availability to virtual network gateways.
* Availability zones physically and logically separate gateways within a region, while protecting your on-premises network connectivity to Azure from zone-level failures.

#### Virtual network gateway
A virtual network gateway is composed of two or more virtual machines that are deployed to a specific subnet that you create called the gateway subnet.

* The virtual machines are created when you create the virtual network gateway.
* The virtual machines contain routing tables and run specific gateway services.
* You can't directly configure the virtual machines that are part of a virtual network gateway.

#### Things to consider when using VPN gateways
VPN gateway connections are available in different configurations.

Microsoft provides a [planning table](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways#planningtable) to help your planning.

Configuration | Scenarios
--- | ---
Site-to-site (S2S) | - Connect your on-premises datacenters to your Azure virtual networks through an IPsec/IKE (IKEv1 or IKEv2) VPN tunnel  <br /> - Connect your on-premises datacenters to your Azure virtual networks through an IPsec/IKE (IKEv1 or IKEv2) VPN tunnel <br /> - Configure S2S VPN and Azure ExpressRoute for the same virtual network <br /> - Configure S2S VPN as a secure failover path for ExpressRoute <br /> - Use S2S VPNs to connect to sites outside your network that are connected through ExpressRoute
Point-to-site (P2S or User VPN) | - Connect individual devices to your Azure virtual networks <br /> - Create a secure connection to your virtual network from an individual client computer <br /> - Useful for remote or traveling workers who want to connect to Azure virtual networks from their current location <br /> - Support a few clients that need to connect to a virtual network
Virtual network to virtual network (VNet-to-VNet) | - Connect one virtual network to another virtual network through an IPsec/IKE VPN tunnel <br /> - Build a network that integrates cross-premises connectivity with inter-virtual network connectivity by combining VNet-to-VNet communication with multi-site connection configurations <br /> - Connect virtual networks in the same or different regions <br /> - Connect virtual networks in the same or different subscriptions <br /> - Connect virtual networks that have the same or different deployment models
Highly available | - Support high availability for cross-premises and VNet-to-VNet connections <br /> - Implement high availability for multiple on-premises VPN devices <br /> - Implement high availability for an active-active Azure VPN gateway <br /> - Implement high availability for a combination of multiple on-premises VPN devices and an active-active Azure VPN gateway


### _Create site-to-site connections_
The following flowchart highlights the seven high-level steps for this configuration. 

Six of the seven steps are completed in Azure and one is completed on-premises.

[Image](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-vpn-gateway/media/gateway-steps-aebd935e.png)

The complete process to create a VPN gateway for a site-to-site connection can take up to 45 minutes.

#### Things to know about site-to-site configuration
Before we start looking at the configuration details, there are few notes to review.

* In this module, we don't review the details for Steps 1 and 2. You can review how to create these resources in other training modules:
	* Configure virtual networks
	* Configure virtual networks: Create subnets
	* Configure Azure DNS

* Step 1: Create virtual networks and subnets
* Step 2: Specify the DNS server (optional)
* Step 6: Configure the VPN device

### _Create the gateway subnet_
Before you create a virtual network gateway for your virtual network, you first need to create the gateway subnet.

The gateway subnet is part of the virtual network IP address range that you specify when you configure your virtual network. 

There are a few requirements for creating the gateway subnet, including identifying your virtual network gateway IP addresses before you start the creation process.

#### Things to know about the gateway subnet
Take a few minutes to review the following important details about the gateway subnet.

* You deploy a gateway in your virtual network by adding a gateway subnet.
* Your gateway subnet must be named GatewaySubnet.
* The gateway subnet contains the IP addresses that are used by your virtual network gateway resources and services.
* When you create your gateway subnet, gateway virtual machines are deployed to the gateway subnet and configured with the required VPN gateway settings.

#### Things to consider when creating the gateway subnet
When you create the gateway subnet in the Azure portal, there are several configuration parameters. 

There are also a few items to consider when planning your parameter values.

- **Consider gateway subnet size** - Some configurations require a larger gateway subnet than others
- **Consider no extra resources** - Identify your required virtual network gateway resources, including virtual machines.
- **Consider network security groups** - Network security groups (NSGs) can't be used to create the gateway subnet.

### _Create the VPN gateway_
The VPN gateway settings that you chose are critical to creating a successful connection for your virtual network. 

There are several parameters to specify for a VPN gateway in the Azure portal.

#### Things to consider when creating a VPN gateway
Let's take a closer look at considerations for configuring the VPN gateway settings.

* Project details
	* Subscription
	* Resource group

* Instance details
	* Name
	* Region
	* Gateway type = VPN (Azure VPN gateway) or ExpressRoute (Azure ExpressRoute).
	* VPN type = Route-based or Policy-based. (Route-based VPN gateways are the most common. Policy-based VPN gateways support only the IKEv1 protocol)
	* SKU = Use the drop-down menu to select a gateway SKU. [SKU Options](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways#gwsku)
	* Generation = Generation1 or Generation2. (Generation1 supports Basic and VpnGw1 SKU. Generation2 supports most SKUs available in Generation1, along with VpnGw4 and VpnGw5)
	* Virtual network = Use the drop-down menu to select an existing virtual network for the VPN gateway, or select Create virtual network to cofigure a new virtual network.

* IP address
	* In the Azure portal, you can view the IP address assigned to the VPN gateway. 
	* Your gateway should appear as a connected device.

### _Determine the VPN gateway type_
When you configure a virtual network gateway, you need to specify the type VPN to create. 

There are two options: route-based or policy-based.

The VPN type you choose depends on the connection topology you want to create. 

To create a point-to-site (P2S) connection, you would create a route-based VPN. 

The VPN type can also depend on your hardware. 

For a site-to-site (S2S) configuration, you need a VPN device. Some VPN devices only support a certain VPN type.

> After a virtual network gateway is created, you can't change the VPN type.

#### Things to know about the VPN gateway type
Review the below details about choices for the VPN gateway type.

* Route-based VPNs
	* Use routes in the IP forwarding or routing table to direct packets into their corresponding tunnel interfaces.
	* The tunnel interfaces then encrypt or decrypt the packets in and out of the VPN tunnels. 
	* The policy (or traffic selector) for route-based VPNs are configured as any-to-any (or wild cards).
	* Most VPN gateway configurations require a route-based VPN.
	* Use a route-based VPN when your virtual network coexists with an Azure ExpressRoute gateway, or if you need to use the IKEv2 protocol.

* Policy-based VPNs
	* Encrypt and direct packets through IPsec tunnels based on the IPsec policies.
	* The policies are configured with the combinations of address prefixes between your on-premises network and the Azure virtual network.
	* The policy (or traffic selector) is defined as an access list in the VPN device configuration.
	* A policy-based VPN can be used on the Basic gateway SKU only. The policy-based VPN type isn't compatible with other gateway SKUs.
	* When you use a policy-based VPN, you can have only one VPN tunnel.
	* You can only use policy-based VPNs for S2S connections, and only for certain configurations.


### _Determine gateway SKU and generation_
When you create a virtual network gateway, you need to specify the gateway SKU to use.

Select a SKU that meets your business requirements. 

Consider criteria such as the types of workloads you need to support, your expected throughputs, the necessary features, and your desired SLAs.

The following tables provide sample gateway SKUs that are available for implementation. (Because the Basic SKU is considered a legacy SKU, samples aren't shown for this option)

The tables identify the following information for each SKU type and generation:

* **Tunnels:** The maximum number of site-to-site (S2S) and Net-to-VNet tunnels that can be created for the SKU.
* **Connections:** The maximum number of point-to-site (P2S) IKEv2 connections that can be created for the SKU.
* **Aggregate Throughput Benchmark:** The benchmark is based on measurements of multiple VPN tunnels aggregated through a single gateway.

> For the most current SKU information, consult the [Azure VPN Gateway documentation](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways).


#### Generation1
SKU | Tunnels | Connections | Benchmark
:---: |:---: | :---: | :---:
VpnGw1/Az | Max. 30 | Max. 250 | 650 Mbps
VpnGw2/Az | Max. 30 | Max. 500 | 1.0 Gbps
VPNGw3/Az | Max. 30 | Max. 1000 | 1.25 Gbps

#### Generation2
SKU | Tunnels | Connections | Benchmark
:---: |:---: | :---: | :---:
VpnGw2/Az | Max. 30 | Max. 500 | 1.25 Gbps
VPNGw3/Az | Max. 30 | Max. 1000 | 2.5 Gbps
VPNGw4/Az | Max. 100 | Max. 5000 | 5.0 Gbps
VPNGw5/Az | Max. 100 | Max. 10000 | 10.0 Gbps


### _Create the local network gateway_
The local network gateway typically refers to the on-premises location. 

To create a local gateway, you provide a name for the site, along with the IP address or FQDN of the on-premises VPN device for the connection. 

You also specify the IP address prefixes to route through the VPN gateway to the VPN device. 

The address prefixes you specify are the prefixes located in the on-premises network.

#### Things to know about creating a local network gateway
Examine the details about the configuration parameters for a local network gateway.

* Name: Provide a name for your site. Azure uses this name to refer to your local network gateway.
* Endpoint: Specify the IP address or FQDN of the on-premises VPN device for the connection.
* IP address: Identify the public IP address of your local network gateway.
* Address space: Provide one or more IP address ranges (in CIDR notation) to define your local network's address space.
* Configure BGP settings: As needed, select this box to configure BGP settings for the local network gateway.

### _Configure the on-premises VPN device_
A validated list of standard VPN devices that work well with the VPN gateway is available for developers. 

The list was created in partnership with device manufacturers like Cisco, Juniper, Ubiquiti, and Barracuda Networks.

#### Things to know about configuring your VPN device
Let's explore how to complete the on-premises configuration of your VPN device.

* Check the list of validated devices to find your device. To view the list, see [Validated VPN devices and device configuration guides](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpn-devices#devicetable).

* To configure your VPN device, you need the following information:
	* A shared key. This key is the same shared key that you specify when you create the VPN connection.
	* The public IP address of your VPN gateway. The IP address can be new or existing.

* Configuration scripts are available for some devices. Review the [Download VPN device configuration scripts for S2S VPN connections](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-download-vpndevicescript) to find a downloadable script for your VPN device.


### _Create the VPN connection_
The last step in the site-to-site connection process is to establish the connection between your VPN gateways. 

If your virtual networks are in the same subscription, you can use the Azure portal to create the connection. 

Several parameters need to be configured to create the connection.

#### Things to know about creating your VPN connection
Review how to configure the connection for your VPN gateways in the Azure portal.

* Name: Enter a name for your VPN connection.
* Connection type: Use the drop-down menu to select a site-to-site (IPSec) connection.
* Virtual network gateway: The value for this parameter is provided by Azure. The value is set to the virtual network gateway for which you're establishing the VPN connection.
* Local network gateway: Set this value to the local network gateway that you created in Step 5 of the site-to-site connection process.
* Shared key (PSK). Provide a shared key to use for your connection.

#### Verify your VPN connection
After you configure all the site-to-site components, it's time to confirm your configuration is working as expected. 

You can verify the VPN connections in the Azure portal or by using PowerShell.

### _Determine high availability scenarios_
You can implement a highly available VPN gateway to support cross-premises and VNet-to-VNet connections and configurations with multiple on-premises VPN devices. 

In these scenarios, the Azure VPN gateway consists of two instances in an active-standby configuration.

You can also create an Azure VPN gateway in an active-active configuration. 

Both instances of the gateway virtual machines establish site-to-site VPN tunnels to your on-premises VPN device. 

You can support an active-active configuration for Azure VPN gateways only, or in combination with multiple on-premises VPN devices.

#### Things to know about active-standby
In a highly available scenario, every Azure VPN gateway has two instances in an active-standby configuration.

For any planned maintenance or unplanned disruption that happens to the active instance, the standby instance takes over (failover) automatically, and resumes the site-to-site VPN or VNet-to-VNet connections.

* The switch over causes a brief interruption.
* For planned maintenance, connectivity is commonly restored within 10 to 15 seconds.
* For unplanned issues, the connection recovery can be longer, taking from 1 minute to 1 and a half minutes in the worst case.
* For point-to-site VPN client connections to the gateway, the P2S connections are disconnected and users need to reconnect from the client machines.

#### Things to know about active-active
A highly available scenario can also be configured for an Azure VPN gateway in an active-active configuration. 

The virtual machines in both gateway instances establish site-to-site VPN tunnels to your on-premises VPN device.

* Each Azure VPN gateway instance has a unique public IP address.
* Each instance establishes an IPsec/IKE S2S VPN tunnel to your on-premises VPN device specified in your local network gateway and connection, but both VPN tunnels are part of the same connection.
* You still need to configure your on-premises VPN device to accept or establish two S2S VPN tunnels to the two Azure VPN gateway public IP addresses.

The traffic from your Azure virtual network to your on-premises network is routed through both VPN tunnels simultaneously. 

The same TCP or UDP flow always traverses the same VPN tunnel or path, unless a maintenance event happens on one of the instances.

When a planned maintenance or unplanned event happens to one gateway instance, the IPsec tunnel from that instance to your on-premises VPN device is disconnected. 

The corresponding routes on your VPN devices should be removed or withdrawn automatically so traffic is switched over to the other active IPsec tunnel. 

On the Azure side, the switch happens automatically from the affected instance to the active instance.


## Configure Azure ExpressRoute and Azure Virtual WAN
Learn how to configure Azure ExpressRoute and Virtual WAN to provide connection services.

Learning objectives:

* Identify features and usage cases for Azure ExpressRoute.
* Coexist site-to-site and Azure ExpressRoute networks.
* Identify features and usage cases for Azure Virtual WAN.

Azure ExpressRoute provides a high-speed private connection to connect your on-premises networks to Microsoft cloud services.

The Azure Virtual WAN networking service combines networking, security, and routing functionalities into a single operational interface.

### _Determine Azure ExpressRoute uses_
Azure ExpressRoute lets you extend your on-premises networks into the Microsoft cloud. 

The connection is facilitated by a connectivity provider. 

With ExpressRoute, you can establish connections to Microsoft cloud services, such as Microsoft Azure, Microsoft 365, and Microsoft Dynamics CRM applications.

Microsoft network operates the primary and secondary connections of Azure ExpressRoute circuits in active-active mode. 

Administrators can force their redundant connections of an ExpressRoute circuit to operate in active-passive mode.

#### Things to consider when using Azure ExpressRoute
The following table summarizes the many benefits of using Azure ExpressRoute to extend your on-premises networks into the Microsoft cloud.

Benefit | Description | Scenarios
--- | --- | ---
Gain fast, reliable, private connections | Azure ExpressRoute connections don't go over the public internet, and they offer more reliability, faster speeds, and lower latencies than typical internet connections. | - Create private connections between Azure datacenters and infrastructure for your on-premises resources or in a colocation environment <br /> - Establish connections to Azure at an ExpressRoute location, such as an exchange provider facility <br /> - Directly connect to Azure from your existing WAN network, such as a multiprotocol label switching (MPLS) VPN provided by a network service provider
Access a virtual private cloud for storage, backup, and recovery | Azure ExpressRoute gives you a fast and reliable connection to Azure with bandwidths up to 100 Gbps. The high connection speeds make it excellent for scenarios that require data integrity and availability. | - Support periodic data migration, disaster recovery, and replication for business continuity <br /> -Transfer large amounts of data like datasets for high-performance computing applications <br /> Move large virtual machines between your development and test environments
Extend and connect your datacenters | Azure ExpressRoute offers high throughput and low latencies. An ExpressRoute implementation operates as a natural extension to or between your datacenters. | -Connect and add compute and storage capacity to your existing datacenters <br /> -Enjoy the scale and economics of the public cloud without having to compromise on network performance
Build hybrid applications | Azure ExpressRoute provides the functionality to help you build applications that span on-premises infrastructure and Azure without compromising privacy or performance. | -Run a corporate intranet application in Azure that authenticates your customers with an on-premises Azure Active Directory service <br /> -Serve all of your corporate customers without traffic ever routing through the public internet

### _Determine Azure ExpressRoute capabilities_
Azure ExpressRoute is supported across all Azure regions and locations. 

The following map provides a list of Azure regions and ExpressRoute locations. ExpressRoute locations are where Microsoft peers with several service providers.

[MAP](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-expressroute-virtual-wan/media/expressroute-map-425634b0.png)

#### Things to know about Azure ExpressRoute
Let's take a closer look at how Azure ExpressRoute supports your network and site connections.

* Microsoft uses the Border Gateway Protocol (BGP) to exchange routes between your on-premises network, your instances in Azure, and Microsoft public addresses to provide Layer 3 connectivity.
* Each ExpressRoute circuit consists of two connections to two Microsoft Enterprise edge routers (MSEEs) from the connectivity provider or your network edge.
* ExpressRoute connections enable access to Microsoft Azure services, Microsoft 365 services, and Microsoft Dynamics CRM.
* Microsoft 365 is intended to be accessed securely and reliably via the internet, so ExpressRoute requires Microsoft authorization.
* You connect to Microsoft in one of our peering locations and access regions within the geopolitical region.
* The ExpressRoute premium add-on feature lets you extend connectivity across geopolitical boundaries.
* **ExpressRoute Global Reach** lets you exchange data across your on-premises sites by connecting your ExpressRoute circuits.
* ExpressRoute circuits can be purchased for a wide range of bandwidths. Check with your connectivity provider to determine their supported bandwidths.
* Microsoft offers several [pricing options](https://azure.microsoft.com/pricing/details/expressroute/) for ExpressRoute.


### _Coexist site-to-site and Azure ExpressRoute_
Azure ExpressRoute is a direct, private connection from your WAN (not over the public internet) to Microsoft services, including Azure.

Site-to-site VPN traffic travels encrypted over the public internet. 

Being able to configure site-to-site VPN and ExpressRoute connections for the same virtual network has several advantages.

You configure a site-to-site VPN as a secure failover path for ExpressRoute. 

You can also use site-to-site VPNs to connect to sites that aren't part of your network, but are connected through ExpressRoute.

#### Things to know about ExpressRoute connection models
You create a connection between your on-premises network and the Microsoft cloud in three different ways: colocated at a cloud exchange, point-to-point Ethernet connection, and any-to-any (IPVPN) connection. 

Connectivity providers offer one or more connectivity models. You work with your connectivity provider to pick the model that works best for you.

Connection model | How it works | Layer support
--- | --- | ---
Colocated at cloud exchange | If you're colocated in a facility with a cloud exchange, you order virtual cross-connections to the Microsoft cloud through the colocation provider's Ethernet exchange. | Colocation providers offer either Layer 2 cross-connections, or managed Layer 3 cross-connections between your infrastructure in the colocation facility and the Microsoft cloud.
Point-to-point Ethernet connections | You connect your on-premises datacenters and offices to the Microsoft cloud through point-to-point Ethernet links. | Point-to-point Ethernet providers offer Layer 2 connections, or managed Layer 3 connections between your site and the Microsoft cloud.
Any-to-any (IPVPN) networks | You integrate your WAN with the Microsoft cloud. IPVPN providers, typically Multiprotocol Label Switching (MPLS) VPN, offer any-to-any connectivity between your branch offices and datacenters. The Microsoft cloud can be interconnected to your WAN to make it appear just like any other branch office. | WAN providers typically offer managed Layer 3 connectivity.

> Currently, the deployment options for site-to-site (S2S) and ExpressRoute coexisting connections are only possible through PowerShell, and not the Azure portal.

### _Compare intersite connection options_
Microsoft network operates the primary and secondary connections of Azure ExpressRoute circuits in active-active mode.

Administrators can force their redundant connections of an ExpressRoute circuit to operate in active-passive mode. 

To improve high availability, we recommend that you operate both connections of an ExpressRoute circuit in active-active mode. 

When you allow the connections to operate in active-active mode, Microsoft network load balances the traffic across the connections on a per-flow basis.

#### Things to know about intersite connections
There are multiple Azure services that can support various intersite connection configurations. 

The following table highlights some common scenarios. As you review these details, think about what solution can fulfill your business requirements.

Connection | Azure services | Bandwidth | Protocols | Scenarios
--- | --- | --- | --- | ---
Virtual network and Point-to-site (User VPN) | Azure IaaS services <br /> Azure Virtual Machines | Based on the gateway SKU | active-passive | Development, test, and lab environments for cloud services <br /> Development, test, and lab environments for virtual machines
Virtual network and Site-to-site | Azure IaaS services <br /> Azure Virtual Machines | Typically < 1 Gbps aggregate | active-passive <br /> active-active | Development, test, and lab environments <br /> Small-scale production workloads and virtual machines
ExpressRoute circuit | Azure IaaS and PaaS services <br /> Microsoft 365 services | 50 Mbps up to 100 Gbps | active-active (recommended) <br /> active-passive (manually forced) | Enterprise-class and mission-critical workloads <br /> Big data solutions

### _Determine Azure Virtual WAN uses_
Azure Virtual WAN (wide-area network) is a networking service that provides optimized and automated branch connectivity to, and through, Azure. 

Azure regions serve as hubs that you can choose to connect your branches to. 

You use the Azure backbone to connect branches and enjoy branch-to-virtual network connectivity.

#### Things to know about Azure Virtual WAN
Let's take a closer look at the characteristics of Azure Virtual WAN.

* Azure Virtual WAN brings together many Azure cloud connectivity services, such as S2S VPN, User VPN (P2S), and Azure ExpressRoute into a single operational interface.
* Connectivity to Azure virtual networks is established by using virtual network connections.
* The global transit network architecture is based on a hub-and-spoke connectivity model. 
* The cloud hosted network hub enables transitive connectivity between endpoints that can be distributed across different types of spokes.
* There are two types of virtual WANs: Basic and Standard
* **Basic:** A Basic Virtual WAN can be implemented only in an S2S VPN connection.
* **Standard:** A Standard Virtual WAN can be implemented with Azure ExpressRoute and a User VPN (P2S). 
* You can find partners that support connectivity automation with Azure Virtual WAN VPN. For more information, see [Virtual WAN partners, regions, and virtual hub locations](https://learn.microsoft.com/en-us/azure/virtual-wan/virtual-wan-locations-partners).

#### Things to consider when using Azure Virtual WAN
As you plan your Azure ExpressRoute configuration, consider the following benefits of using Azure Virtual WAN in your solution.

* Consider integrated connectivity for hub and spoke solutions. 
	* Gain integrated connectivity for your hub and spoke network topology by using Azure Virtual WAN. 
	* Automate the site-to-site configuration and connectivity between your on-premises sites (spokes) and an Azure hub.

* Consider automated spoke setup and configuration.
	* Implement Azure Virtual WAN to connect your virtual networks and workloads to the Azure hub seamlessly.

* Consider intuitive troubleshooting. 
	* Azure Virtual WAN combines networking, security, and routing functionalities into a single operational interface. 
	* Monitor and troubleshoot the end-to-end flow within Azure, and then use this information to take required actions.

	
## Configure network routing and endpoints
Learn how to configure network routes, including endpoints and private links.

Learning objectives:

* Implement system routes and user-defined routes.
* Configure a custom route.
* Implement service endpoints.
* Identify features and usage cases for Azure Private Link and endpoint services.

Administrators use network routes to control the flow of traffic through a network. 

Azure virtual networking provides capabilities to help you customize your network routes, establish service endpoints, and access private links.

### _Review system routes_
Azure uses system routes to direct network traffic between virtual machines, on-premises networks, and the internet. 

Information about the system routes is recorded in a route table.

#### Things to know about system routes
Let's take a closer look at how Azure implements system routes.

* Azure uses system routes to control traffic for virtual machines in several scenarios:
	* Traffic between virtual machines in the same subnet
	* Traffic between virtual machines in different subnets in the same virtual network
	* Traffic from virtual machines to the internet
	
* A route table contains a set of rules (called routes) that specifies how packets should be routed in a virtual network.
* Route tables record information about the system routes, where the tables are associated to subnets.
* Each packet leaving a subnet is handled based on the associated route table.
* Packets are matched to routes by using the destination. The destination can be an IP address, a virtual network gateway, a virtual appliance, or the internet.
* When a matching route can't be found, the packet is dropped.

#### Business scenario
Suppose you have a virtual network with two subnets. 

In this configuration, you can use Azure system routes to control communication between the subnets and between subnets and the internet. 

A front-end subnet can use a system route to access the internet. A back-end subnet can use a system route to access the front-end subnet. 

Both subnets access a route table. The following illustration highlights this scenario:

### _Identify user-defined routes_
Azure automatically handles all network traffic routing, but in some cases, a custom configuration is preferable. 

In these situations, you can configure user-defined routes (UDRs) and next hop targets.

#### Things to know about user-defined routes
Let's examine the characteristics of user-defined routes.

* UDRs control network traffic by defining routes that specify the next hop of the traffic flow.

* The next hop can be one of the following targets:
	* Virtual network gateway
	* Virtual network
	* Internet
	* Network virtual appliance (NVA)

* Similar to system routes, UDRs also access route tables.
* Each route table can be associated to multiple subnets.
* Each subnet can be associated to one route table only.
* There are no charges for creating route tables in Microsoft Azure.

#### Business scenario
Suppose you have a virtual machine that performs a network function like routing, firewalling, or WAN optimization. 

You want to direct certain subnet traffic to the NVA. 

To accomplish this configuration, you can place an NVA between subnets or between one subnet and the internet.

The subnet can use a UDR to access the NVA and then the internet.

The subnet can use another UDR and NVA to access the back-end subnet.

### _Determine service endpoint uses_
A virtual network service endpoint provides the identity of your virtual network to the Azure service.

After service endpoints are enabled in your virtual network, you can secure Azure service resources to your virtual network by adding a virtual network rule to the resources.

Today, Azure service traffic from a virtual network uses public IP addresses as source IP addresses. 

With service endpoints, service traffic switches to use virtual network private addresses as the source IP addresses when accessing the Azure service from a virtual network. 

This switch allows you to access the services without the need for reserved public IP addresses that are typically used in IP firewalls.

#### Things to know about service endpoints
Review the following characteristics of service endpoints.

* Service endpoints can extend your virtual network identity to your Azure services to secure your service resources.
* You secure your Azure service resources to your virtual network by using virtual network rules.
* Virtual network rules can remove public internet access to resources, and allow traffic only from your virtual network.
* Service endpoints always take service traffic directly from your virtual network to the service on the Microsoft Azure backbone network.
* Service endpoints are configured through the subnet. No extra overhead is required to maintain the endpoints.

#### Things to consider when using service endpoints
There are several scenarios where using service endpoints can be advantageous. 

Review the following points and think about how you can implement service endpoints in your configuration.

* Consider improved security for resources. 
	* Implement service endpoints to improve the security of your Azure service resources. 
	* When service endpoints are enabled in your virtual network, you secure Azure service resources to your virtual network with virtual network rules. 
	* The rule improves security by fully removing public internet access to resources, and allowing traffic only from your virtual network.

* Consider optimal routing for service traffic. 
	* Routes in your virtual network that force internet traffic to your on-premises or network virtual appliances also typically force Azure service traffic to take the same route as the internet traffic. 
	* This traffic control process is known as forced-tunneling. Service endpoints provide optimal routing for Azure service traffic to allow you to circumvent forced tunneling.

* Consider direct traffic to the Microsoft network. 
	* Use service endpoints to keep traffic on the Azure backbone network. 
	* This approach allows you to continue auditing and monitoring outbound internet traffic from your virtual networks, through forced-tunneling, without impacting service traffic. 
	* Learn more about [user-defined routes and forced-tunneling](https://learn.microsoft.com/en-us/azure/firewall/forced-tunneling).

* Consider easy configuration and maintenance. 
	* Configure service endpoints in your subnets for simple setup and low maintenance. 
	* You no longer need reserved public IP addresses in your virtual networks to secure Azure resources through an IP firewall. 
	* There are no NAT or gateway devices required to set up the service endpoints.


### _Determine service endpoint services_
It's easy to add a service endpoint to the virtual network. 

In the Azure portal, you select the Azure service for which to create the endpoint. 

In this unit, we examine several services, including Azure Cosmos DB, Event Hubs, Key Vault, and SQL Database.


Service | Availability | Description
--- | --- | ---
Azure Storage | Generally available in all Azure regions | This endpoint gives traffic an optimal route to the Azure Storage service. Each Storage account supports up to 100 virtual network rules.
Azure SQL Database and Azure SQL Data Warehouse | Generally available in all Azure regions | A firewall security feature controls whether your database accepts communication from particular subnets in virtual networks. This feature applies to the database server for your single databases and elastic pool in SQL Database or your databases in SQL Data Warehouse.
Azure Cosmos DB | Generally available in all Azure regions | You can configure the Azure Cosmos DB account to allow access only from a specific subnet of virtual network. Enable service endpoints to access Azure Cosmos DB on the subnet within a virtual network. <br /> Traffic from the subnet is sent to Azure Cosmos DB with the identity of the subnet and virtual network. <br /> After the Azure Cosmos DB service endpoint is enabled, you can limit access to the subnet by adding it to your Azure Cosmos DB account.
Azure Key Vault | Generally available in all Azure regions | The virtual network service endpoints for Key Vault allow you to restrict access to a specified virtual network.
Azure Service Bus and Azure Event Hubs | Generally available in all Azure regions | The integration of Service Bus with virtual network service endpoints enables secure access to messaging capabilities from workloads like virtual machines that are bound to virtual networks. The network traffic path is secured on both ends.

### _Identify private link uses_
Azure Private Link provides private connectivity from a virtual network to Azure platform as a service (PaaS), customer-owned, or Microsoft partner services. 

It simplifies the network architecture and secures the connection between endpoints in Azure by eliminating data exposure to the public internet.

#### Things to know about Azure Private Link
Let's examine the characteristics of Azure Private Link and network routing configurations.

* Azure Private Link keeps all traffic on the Microsoft global network. There's no public internet access.
* Private Link is global and there are no regional restrictions. You can connect privately to services running in other Azure regions.
* Services delivered on Azure can be brought into your private virtual network by mapping your network to a private endpoint.
* Private Link can privately deliver your own services in your customer's virtual networks.
* All traffic to the service can be routed through the private endpoint. No gateways, NAT devices, Azure ExpressRoute or VPN connections, or public IP addresses are required.

#### Things to consider when using Azure Private Link
There are many benefits to working with Azure Private Link. 

Review the following points and consider how you can implement the service for your scenarios.

* Consider private connectivity to services on Azure. 
	* Connect privately to services running in other Azure regions. 
	* Traffic remains on the Microsoft network with no public internet access.

* Consider integration with on-premises and peered networks. 
	* Access private endpoints over private peering or VPN tunnels from on-premises or peered virtual networks. 
	* Microsoft hosts the traffic, so you don't need to set up public peering or use the internet to migrate your workloads to the cloud.

* Consider protection against data exfiltration for Azure resources. 
	* Map private endpoints to Azure PaaS resources. 
	* When there's a security incident within your network, only the mapped resources are accessible. 
	* This implementation eliminates the threat of data exfiltration.

* Consider services delivered directly to customer virtual networks. 
	* Privately consume Azure PaaS, Microsoft partner, and your own services in your virtual networks on Azure. 
	* Private Link works across Azure Active Directory (Azure AD) tenants to help unify your experience across services. 
	* Send, approve, or reject requests directly without permissions or role-based access controls.


## Configure Azure Load Balancer
Learn how to configure an internal or public load balancer.

Learning objectives:

* Identify features and usage cases for Azure Load Balancer.
* Implement public and internal Azure load balancers.
* Compare features of load balancer SKUs and configuration differences.
* Configure back-end pools, load-balancing rules, session persistence, and health probes.

Many applications need to be resilient to failure and scale easily when demand increases. 

Administrators can address these requirements by using Azure Load Balancer.

### _Determine Azure Load Balancer uses_
Azure Load Balancer delivers high availability and network performance to your applications. 

Administrators use load balancing to efficiently distribute incoming network traffic across back-end servers and resources. 

A load balancer is implemented by using load-balancing rules and health probes.

The following diagram shows how Azure Load Balancer works. 

The frontend exchanges information with a load balancer. The load balancer uses rules and health probes to communicate with the backend.

![DIA](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-load-balancer/media/load-balancer-4caf947b.png)

#### Things to know about Azure Load Balancer
Let's take a closer look at how Azure Load Balancer operates.

* Azure Load Balancer can be used for inbound and outbound scenarios.
* You can implement a public or internal load balancer, or use both types in a combination configuration.

* To implement a load balancer, you configure four components:
	* Front-end IP configuration
	* Back-end pools
	* Health probes
	* Load-balancing rules
	* The front-end configuration specifies the public IP or internal IP that your load balancer responds to.

* The back-end pools are your services and resources, including Azure Virtual Machines or instances in Azure Virtual Machine Scale Sets.
* Load-balancing rules determine how traffic is distributed to back-end resources.
* Health probes ensure the resources in the backend are healthy.
* Load Balancer scales up to millions of TCP and UDP application flows.

### _Implement a public load balancer_
Administrators use public load balancers to map the public IP addresses and port numbers of incoming traffic to the private IP addresses and port numbers of virtual machines. 

The mapping can also be configured for response traffic from the virtual machines.

Load-balancing rules are used to specify how to distribute specific types of traffic across multiple virtual machines or services. 

You can use this approach to share the load of incoming web request traffic across multiple web servers.

#### Business scenario
Consider a scenario where internet traffic attempts to reach virtual machines in a web tier subnet that implements a public load balancer. 

Internet clients send webpage requests to the public IP address of a web app on TCP port 80. 

Azure Load Balancer intercepts the traffic and distributes the requests across the virtual machines in the load-balanced set according to the defined load-balancing rules. 

The following illustration highlights this scenario:

![DIA](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-load-balancer/media/public-load-balancer-46d5d9fe.png)

### _Implement an internal load balancer_
Administrators use internal load balancers to direct traffic to resources that reside in a virtual network, or to resources that use a VPN to access Azure infrastructure. 

In this configuration, front-end IP addresses and virtual networks are never directly exposed to an internet endpoint. 

Internal line-of-business applications run in Azure and are accessed from within Azure or from on-premises resources.

#### Business scenario
Suppose you have an Azure SQL Database tier subnet with several virtual machines, and you implement an internal load balancer. 

Database requests need to be distributed to the backend. 

The internal load balancer receives the database requests and uses the load-balancing rules to determine how to distribute the requests to the back-end SQL servers. The SQL servers respond on port 1433. 

The following illustration highlights this scenario:

![DIA](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-load-balancer/media/internal-load-balancer-5ae85589.png)

#### Things to consider when using an internal load balancer
You can implement an internal load balancer to achieve several types of load balancing.

* **Within virtual network:** Establish load balancing from your virtual machines in the virtual network to a set of virtual machines that reside within the same virtual network.
* **For cross-premises virtual network:** Apply load balancing from your on-premises computers to a set of virtual machines that reside within the same virtual network.
* **For multi-tier applications:** Implement load balancing for your internet-facing multi-tier applications when the back-end tiers aren't internet-facing. The back-end tiers require traffic load-balancing from the internet-facing tier.
* **For line-of-business applications:** Add load balancing for your line-of-business applications hosted in Azure without having to add other load balancer hardware or software. This scenario includes on-premises servers that are in the set of computers whose traffic is load-balanced.
* **With public load balancer:** Configure a public load balancer in front of your internal load balancer to create a multi-tier application.

### _Determine load balancer SKUs_
When you create an Azure load balancer in the Azure portal, you select the type of load balancer to create (internal or public) and the SKU. 

Azure Load Balancer supports three SKU options: Basic, Standard, and Gateway. 

Each SKU provides different features, scenario scaling, and pricing.

#### Things to know about Azure Load Balancer SKUs
Let's review some points to consider when choosing the SKU type for your load balancer.

* Standard Load Balancer is the newest product. It's essentially a superset of Basic Load Balancer.
* The Standard SKU offers an expanded and more granular feature set than the Basic SKU.
* The Basic SKU can be upgraded to the Standard SKU. But, new designs and architectures should use the Standard SKU.
* The Gateway SKU supports high performance and high availability scenarios with third-party network virtual appliances (NVAs).

#### Compare Basic and Standard SKU features
The following table provides a brief comparison of how features are implemented in the Standard and Basic SKUs.

Feature | Basic SKU | Standard SKU
--- | --- | ---
Health probes | HTTP, TCP | HTTPS, HTTP, TCP
Availability zones | Not available | Zone-redundant and zonal frontends for inbound and outbound traffic
Multiple frontends | Inbound only | Inbound and outbound
Security | - Open by default <br /> - (Optional) Control through network security groups (NSGs) | - Closed to inbound flows unless allowed by an NSG <br /> - Internal traffic from the virtual network to the internal load balancer is allowed

### _Create back-end pools_
Each load balancer has one or more back-end pools that are used for distributing traffic. 

The back-end pools contain the IP addresses of the virtual NICs that are connected to your load balancer. 

You configure these pool settings in the Azure portal.

![portal](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-load-balancer/media/backend-pools-1984adb4.png)

#### Things to know about back-end pools
The SKU type that you select determines which endpoint configurations are supported for the pool along with the number of pool instances allowed.

* The Basic SKU allows up to 300 pools, and the Standard SKU allows up to 1,000 pools.
* When you configure the back-end pools, you can connect to availability sets, virtual machines, or Azure Virtual Machine Scale Sets.
* For the Basic SKU, you can select virtual machines in a single availability set or virtual machines in an instance of Azure Virtual Machine Scale Sets.
* For the Standard SKU, you can select virtual machines or Virtual Machine Scale Sets in a single virtual network. 
* Your configuration can include a combination of virtual machines, availability sets, and Virtual Machine Scale Sets.

### _Create health probes_
A health probe allows your load balancer to monitor the status of your application. 

The probe dynamically adds or removes virtual machines from your load balancer rotation based on the machine response to health checks.

When a probe fails to respond, the load balancer stops sending new connections to the unhealthy instance.

The following image shows how to create a health probe in the Azure portal. A custom HTTP health probe is configured to run on TCP port 80. 

The probe is defined to check the health of the virtual machine instances at 5-second intervals.

![illustration](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-load-balancer/media/add-health-probe-1d86fb2b.png)

#### Things to know about health probes
There are two main ways to configure a custom health probe: HTTP and TCP.

* HTTP Probe
	* The load balancer probes your back-end pool endpoints every 15 seconds. 
	* A virtual machine instance is considered healthy if it responds with an HTTP 200 message within the specified timeout period (default is 31 seconds). 
	* If any status other than HTTP 200 is returned, the instance is considered unhealthy, and the probe fails.

* TCP probe 
	* Relies on establishing a successful TCP session to a defined probe port. 
	* If the specified listener on the virtual machine exists, the probe succeeds. 
	* If the connection is refused, the probe fails.

* To configure a probe, you specify values for the following settings:
	* Port: Back-end port
	* URI: URI for requesting the health status from the backend
	* Interval: Amount of time between probe attempts (default is 15 seconds)
	* Unhealthy threshold: Number of failures that must occur for the instance to be considered unhealthy

* Guest agent probe
	* Is a third option that uses the guest agent inside the virtual machine. 
	* This option isn't recommended when an HTTP or TCP custom probe configuration is possible.

### _Create load balancer rules_
You can define load-balancing rules to specify how traffic is distributed to your back-end pools. 

Each rule maps a front-end IP address and port combination to a set of back-end IP address and port combinations.

#### Things to know about load-balancing rules
Let's take a closer look at how to configure load-balancing rules for your back-end pools.

* To configure a load-balancing rule, you need to have a frontend, backend, and health probe for your load balancer.

* To define a rule in the Azure portal, you configure several settings:
	* IP version (IPv4 or IPv6)
	* Front-end IP address, *Port, and Protocol (TCP or UDP)
	* Back-end pool and Back-end port
	* Health probe
	* Session persistence

* By default, Azure Load Balancer distributes network traffic equally among multiple virtual machines.

* Session persistence specifies how to handle traffic from a client. By default, successive requests from a client are handled by any virtual machine in your pool.
	* None (default): Any virtual machine can handle the request.
	* Client IP: Successive requests from the same client IP address are handled by the same virtual machine.
	* Client IP and protocol: Successive requests from the same client IP address and protocol combination are handled by the same virtual machine.

* Load-balancing rules can be used in combination with NAT rules.

> Five-tuple-hash = The load balancer uses a five-tuple (source IP, source port, destination IP, destination port, and protocol type) hash to map traffic to available servers.


## Configure Azure Application Gateway
Learn how to configure Azure Application Gateway.

Learning objectives:

* Identify features and usage cases for Azure Application Gateway.
* Implement an Azure application gateway, including selecting a routing method.
* Configure gateway components, such as listeners, health probes, and routing rules.

Azure Application Gateway is a load balancer for web traffic. 

Administrators implement an application gateway to manage traffic to their web apps.

### _Implement Azure Application Gateway_
Administrators use Azure Application Gateway to manage requests from client applications to their web apps.  

An application gateway listens for incoming traffic to web apps and checks for messages sent via protocols like HTTP. 

Gateway rules direct the traffic to resources in a back-end pool.

#### Business scenario
Consider a scenario where internet client applications request access to resources in a load-balanced back-end pool. 

The requests can be managed by implementing Azure Application Gateway to listen for HTTP(S) messages. 

Messages can be handled by load-balancing rules to direct client request traffic to the appropriate resources in the pool. 

The following diagram illustrates this scenario:

![DIA](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-application-gateway/media/application-gateway-cb3392f4.png)

#### Things to know about Azure Application Gateway
Let's examine some of the benefits of using Azure Application Gateway to manage internet traffic to your web applications.

Benefit | Description
--- | ---
Application layer routing | Use application layer routing to direct traffic to a back-end pool of web servers based on the URL of a request.
Round-robin load balancing | Employ round-robin load balancing to distribute incoming traffic across multiple servers. <br /> Send load-balance requests to the servers in each back-end pool. <br /> Client requests are forwarded in a cycle through a group of servers to create an effective balance for the server load.
Session stickiness | Apply session stickiness to your application gateway to ensure client requests in the same session are routed to the same back-end server.
Supported protocols | Build an application gateway to support the HTTP, HTTPS, HTTP/2, or WebSocket protocols.
Firewall protection	| Implement a web application firewall to protect against web application vulnerabilities.
Encryption | Support end-to-end request encryption for your web applications.
Load autoscaling | Dynamically adjust capacity as your web traffic load changes.

### _Determine Azure Application Gateway routing_
Clients send requests to your web apps by specifying the IP address or DNS name of your application gateway. 

Your gateway directs the requests to a selected web server in your back-end pool according to a set of rules. 

You define the rules for your gateway to identify the allowable routes for the request traffic.

#### Things to know about traffic routing
Let's take a closer look at your routing options for Azure Application Gateway.

* Azure Application Gateway offers two primary methods for routing traffic:
	* **Path-based routing** sends requests with different URL paths to different pools of back-end servers.
	* **Multi-site routing** configures more than one web application on the same application gateway instance.

* You can configure your application gateway to redirect traffic.
	* Application Gateway can redirect traffic received at one listener to another listener, or to an external site. 
	* This approach is commonly used by web apps to automatically redirect HTTP requests to communicate via HTTPS. 
	* The redirection ensures all communication between your web app and clients occurs over an encrypted path.

* You can implement Application Gateway to rewrite HTTP headers.
	* HTTP headers allow the client and server to pass parameter information with the request or the response. 
	* In this scenario, you can translate URLs or query string parameters, and modify request and response headers. 
	* Add conditions to ensure URLs or headers are rewritten only for certain conditions.

* Application Gateway allows you to create custom error pages instead of displaying default error pages. You can use your own branding and layout by using a custom error page.

#### Path-based routing
You can implement path-based routing to direct requests for specific URL paths to the appropriate back-end pool. 

Consider a scenario where your web app receives requests for videos or images. 

You can use path-based routing to direct requests for the `/video/\*` path to a back-end pool of servers that are optimized to handle video streaming. 

Image requests for the `/images/\*` path can be directed to a pool of servers that handle image retrieval. 

The following illustration demonstrates this routing method:

![DIA](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-application-gateway/media/path-based-routing-15bcef5f.png)

#### Multi-site routing
When you need to support multiple web apps on the same application gateway instance, multi-site routing is the best option. 

Multi-site configurations are useful for supporting multi-tenant applications, where each tenant has its own set of virtual machines or other resources hosting a web application.

In this configuration, you register multiple DNS names (CNAMEs) for the IP address of your application gateway and specify the name of each site. 

Application Gateway uses separate listeners to wait for requests for each site. 

Each listener passes the request to a different rule, which can route the requests to servers in a different back-end pool.

Consider a scenario where you need to support traffic to two sites on the same gateway. 

You can direct all requests for the http://contoso.com site to servers in one back-end pool, and requests for the http://fabrikam.com site to another back-end pool. 

The following illustration demonstrates this routing method.

![DIA](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-application-gateway/media/site-based-routing-e686b605.png)

### _Configure Azure Application Gateway components_
Azure Application Gateway has a series of components that combine to route requests to a pool of web servers and to check the health of these web servers. 

These components include the frontend IP address, back-end pools, routing rules, health probes, and listeners. 

As an option, the gateway can also implement a firewall.

#### Things to know about Application Gateway components
Let's explore how the components of an application gateway work together.

* The front-end IP address receives the client requests.
* An optional firewall checks incoming traffic for common threats before the requests reach the listeners.
* One or more listeners receive the traffic and route the requests to the back-end pool.
* Routing rules define how to analyze the request to direct the request to the appropriate back-end pool.
* A back-end pool contains web servers for resources like virtual machines or Virtual Machine Scale Sets. 
* Each pool has a load balancer to distribute the workload across the resources.
* Health probes determine which back-end pool servers are available for load-balancing.

The following flowchart demonstrates how the Application Gateway components work together to direct traffic requests between the frontend and back-end pools in your configuration.

![illustration](https://learn.microsoft.com/en-gb/training/wwl-azure/configure-azure-application-gateway/media/configure-app-gateway-0193dbd6.png)

#### Front-end IP address
Client requests are received through your front-end IP address. 

Your application gateway can have a public or private IP address, or both. 

You can have only one public IP address and only one private IP address.

#### Listeners
Listeners accept traffic arriving on a specified combination of protocol, port, host, and IP address. 

Each listener routes requests to a back-end pool of servers according to your routing rules. 

A listener can be Basic or Multi-site. 

A Basic listener only routes a request based on the path in the URL. 

A Multi-site listener can also route requests by using the hostname element of the URL. 

Listeners also handle TLS/SSL certificates for securing your application between the user and Application Gateway.

#### Routing rules
A routing rule binds your listeners to the back-end pools. 

A rule specifies how to interpret the hostname and path elements in the URL of a request, and then direct the request to the appropriate back-end pool. 

A routing rule also has an associated set of HTTP settings. 

The HTTP settings indicate whether (and how) traffic is encrypted between Application Gateway and the back-end servers. 

Other configuration information includes protocol, session stickiness, connection draining, request timeout period, and health probes.

#### Back-end pools
A back-end pool references a collection of web servers. 

You provide the IP address of each web server and the port on which it listens for requests when configuring the pool. 

Each pool can specify a fixed set of virtual machines, Virtual Machine Scale Sets, an app hosted by Azure App Services, or a collection of on-premises servers. 

Each back-end pool has an associated load balancer that distributes work across the pool.

#### Health probes
Health probes determine which servers in your back-end pool are available for load-balancing. 

Application Gateway uses a health probe to send a request to a server. 

When the server returns an HTTP response with a status code between 200 and 399, the server is considered healthy. 

If you don't configure a health probe, Application Gateway creates a default probe that waits for 30 seconds before identifying a server as unavailable (unhealthy).

#### Firewall (optional)
You can enable Azure Web Application Firewall for Azure Application Gateway to handle incoming requests before they reach your listener. 

The firewall checks each request for threats based on the Open Web Application Security Project (OWASP). 

Common threats include SQL-injection, cross-site scripting, command injection, HTTP request smuggling and response splitting, and remote file inclusion. 

Other threats can come from bots, crawlers, scanners, and HTTP protocol violations and anomalies.

OWASP defines a set of generic rules for detecting attacks. 

These rules are referred to as the Core Rule Set (CRS). 

The rule sets are under continuous review as attacks evolve in sophistication. 

Azure Web Application Firewall supports two rule sets: CRS 2.2.9 and CRS 3.0. CRS 3.0 is the default and more recent of these rule sets. 

If necessary, you can opt to select only specific rules in a rule set to target certain threats. 

Additionally, you can customize the firewall to specify which elements in a request to examine, and limit the size of messages to prevent massive uploads from overwhelming your servers.

> Azure Web Application Firewall is an optional component that handles incoming requests before they reach a listener. 
> Web Application Firewall checks each request for many common threats, based on the Open Web Application Security Project.


## Design an IP addressing schema for your Azure deployment
A good Azure IP addressing schema provides flexibility, room for growth, and integration with on-premises networks.

The schema ensures that communication works for deployed resources, minimizes public exposure of systems, and gives the organization flexibility in its network. 

If not properly designed, systems might not be able to communicate, and additional work will be required to remediate.

Learning objectives:

* Identify the private IP addressing capabilities of Azure virtual networks.
* Identify the public IP addressing capabilities of Azure.
* Identify the requirements for IP addressing when integrating with on-premises networks.

### _Network IP addressing and integration_
To integrate resources in an Azure virtual network with resources in your on-premises network, you must understand how you can connect those resources and how to configure IP addresses.

Your manufacturing company wants to migrate a business-critical database to Azure. 

Client applications on desktop computers, laptops, and mobile devices need constant access to the database as if the database remained in the on-premises network.

You want to move the database server without affecting users.

#### On-premises IP addressing
A typical on-premises network design includes these components:

* Routers
* Firewalls
* Switches
* Network segmentation

The diagram shows a simplified version of a typical on-premises network. 

On the routers facing the internet service provider (ISP), you have public IP addresses that are used by your outbound internet traffic as their source. 

These addresses also are used for inbound traffic across the internet. 

The ISP might issue you a block of IP addresses to assign to your devices, or you might have your own block of public IP addresses that your organization owns and controls. 

You can assign these addresses to systems that you would like to make accessible from the internet, such as web servers.

The perimeter network and internal zone have private IP addresses. 

In the perimeter network and internal zone, the IP addresses that are assigned to these devices aren't accessible over the internet. 

The administrator has full control over the IP address assignment, name resolution, security settings, and security rules. 

There are three ranges of non-routable IP addresses that are designed for internal networks that won't be sent over internet routers:

* 10.0.0.0 to 10.255.255.255
* 172.16.0.0 to 172.31.255.255
* 192.168.0.0 to 192.168.255.255

The administrator can add or remove on-premises subnets to accommodate network devices and services. 

The number of subnets and IP addresses you can have in your on-premises network depends on the Classless Inter-Domain Routing (CIDR) for the IP address block.

#### Azure IP addressing
Azure virtual networks use private IP addresses. 

The ranges of private IP addresses are the same as for on-premises IP addressing. 

Like on-premises networks, the administrator has full control over the IP address assignment, name resolution, security settings, and security rules in an Azure virtual network. 

The administrator can add or remove subnets depending on the CIDR for the IP address block.

In a typical Azure network design, we usually have these components:

* Virtual networks
* Subnets
* Network security groups
* Firewalls
* Load balancers

In Azure, the network design has features and functions that are similar to an on-premises network, but the network's structure is different. 

The Azure network does not follow the typical on-premises hierarchical network design. 

The Azure network provides the ability to scale up and scale down infrastructure based on demand. 

Provisioning in the Azure network happens in a matter of seconds. 

There are no hardware devices, like routers or switches. The entire infrastructure is virtual, and you can slice it into chunks that suit your requirements.

In Azure, you typically would implement a network security group and a firewall. 

You'd use subnets to isolate front-end services, including web servers and DNS, and back-end services like databases and storage systems. 

Network security groups filter internal and external traffic at the network layer. 

A firewall has more extensive capabilities for network layer filtering and application layer filtering. 

By deploying both network security groups and a firewall, you get improved isolation of resources for a secure network architecture.

#### Basic properties of Azure virtual networks
A virtual network is your network in the cloud. 

You can divide your virtual network into multiple subnets. 

Each subnet has a portion of the IP address space that is assigned to your virtual network. 

You can add, remove, expand, or shrink a subnet if there are no VMs or services deployed in it.

By default, all subnets in an Azure virtual network can communicate with each other. 

However, you can use a network security group to deny communication between subnets. 

The smallest subnet that is supported uses a /29 subnet mask. The largest supported subnet uses a /2 subnet mask.

#### Integrate Azure with on-premises networks
Before you start integrating Azure with on-premises networks, it's important to identify the current private IP address scheme used in the on-premises network. 

There can be no IP address overlap for interconnected networks.

For example, you can't use 192.168.0.0/16 on your on-premises network and use 192.168.10.0/24 on your Azure virtual network. 

These ranges both contain the same IP addresses, and won't be able to route traffic between each other.

You can, however, have the same class range for multiple networks. 

For example, you can use the 10.10.0.0/16 address space for your on-premises network and the 10.20.0.0/16 address space for your Azure network because they don't overlap.

It is vital to check for overlaps when you're planning an IP address scheme. 

If there's an overlap of IP addresses, you can't integrate your on-premises network with your Azure network.


### _Public and private IP addressing in Azure_
You work for a manufacturing company and are moving resources into Azure. 

The database server must be accessible for clients in your on-premises network. 

Public resources, like web servers, must be accessible from the internet. 

You want to ensure that you plan IP addresses that support both these requirements.

#### IP address types
In Azure, you can use two types of IP addresses:

* Public IP addresses
* Private IP addresses

Both types of IP addresses can be allocated in one of two ways:

* Dynamic
* Static

Let's take a closer look at how the IP address types work together.

#### Public IP addresses
Use a public IP address for public-facing services. 

A public address can be either static or dynamic.

A public IP address can be assigned to a VM, an internet-facing load balancer, a VPN gateway, or an application gateway.

* Dynamic public IP addresses 
	* These are assigned addresses that can change over the lifespan of the Azure resource. 
	* The dynamic IP address is allocated when you create or start a VM. 
	* The IP address is released when you stop or delete the VM. 
	* In each Azure region, public IP addresses are assigned from a unique pool of addresses. 
	* The default allocation method is dynamic.

* Static public IP addresses 
	* These are assigned addresses that won't change over the lifespan of the Azure resource. 
	* To ensure that the IP address for the resource remains the same, you can set the allocation method to static. 
	* In this case, an IP address is assigned immediately, and is released only when you delete the resource or change the IP allocation method to dynamic.

#### SKUs for public IP addresses
For public IP addresses, there are two SKUs to choose from: Basic and Standard. 

All public IP addresses created before the introduction of SKUs are Basic SKU public IP addresses. 

With the introduction of SKUs, you can choose the scale, features, and pricing for load balancing internet traffic.

Both Basic and Standard SKUs:

- Have a default inbound originated flow idle timeout of 4 minutes, which is adjustable to up to 30 minutes.
- Have a fixed outbound originated flow idle timeout of 4 minutes.

#### Basic SKU
Basic public IPs can be assigned by using static or dynamic allocation methods. 

Basic public IPs can be assigned to any Azure resource that can be assigned a public IP address, including network interfaces, VPN gateways, application gateways, and internet-facing load balancers.

By default, Basic SKU IP addresses:

* Are open. Network security groups are recommended but optional for restricting inbound or outbound traffic.
* Are available for inbound only traffic.
* Are available when using instance meta data service (IMDS).
* Don't support Availability Zones.
* Don't support routing preferences.

#### Standard SKU
By default, Standard SKU IP addresses:

* Always use static allocation.
* Are secure, and thus closed to inbound traffic. You must enable inbound traffic by using a network security group.
* Are zone-redundant; and optionally zonal (they can be created as zonal and guaranteed in a specific availability zone).
* Can be assigned to network interfaces, Standard public load balancers, application gateways, or VPN gateways.
* Can be utilized with the routing preference to enable more granular control of how traffic is routed between Azure and the Internet.
* Can be used as anycast frontend IPs for cross-region load balancers.

#### Public IP address prefix
In Azure, a public IP address prefix is a reserved, static range of public IP addresses. 

Azure assigns an IP address from a pool of available addresses that's unique to each region in each Azure cloud. 

When you define a Public IP address prefix, associated public IP addresses are assigned from a pool for an Azure region.

In a region with Availability Zones, Public IP address prefixes can be created as zone-redundant or associated with a specific availability zone.

The benefit of a public IP address prefix is that you can specify firewall rules for a known range of IP addresses. 

If your business needs to have datacenters in different regions, you need a different public IP address range for each region. 

You can assign the addresses from a public IP address prefix to any Azure resource that supports public IP addresses.

You can create a public IP address prefix by specifying a name and prefix size. The prefix size is the number of reserved addresses available for use.

* Public IP address prefixes consist of IPv4 or IPv6 addresses.
* You can use technology like Azure Traffic Manager to balance region-specific instances.
* You can't bring your own public IP addresses from on-premises networks into Azure.
* You can't specify addresses when you create a prefix; they're assigned by Azure. After a prefix is created, the IP addresses are fixed in a contiguous range.
* Public IP addresses can't be moved between regions; all IP addresses are region-specific.

#### Private IP addresses
Private IP addresses are used for communication within an Azure Virtual Network, including virtual networks and your on-premises networks. 

Private IP addresses can be set to dynamic (DHCP lease) or static (DHCP reservation).

Dynamic private IP addresses are assigned through a DHCP lease and can change over the lifespan of the Azure resource.

Static private IP addresses are assigned through a DHCP reservation and don't change throughout the lifespan of the Azure resource. 

Static private IP addresses persist if a resource is stopped or deallocated.

#### IP addressing for Azure virtual networks
In Azure, a virtual network is a fundamental component that acts as an organization's network. 

The administrator has full control over IP address assignment, security settings, and security rules. 

When you create a virtual network, you define a scope of IP addresses. 

Private IP addressing works the same way as it does in an on-premises network. 

You choose the private IP addresses that are reserved by Internet Assigned Numbers Authority (IANA) based on your network requirements:

* 10.0.0.0/8
* 172.16.0.0/12
* 192.168.0.0/16

A subnet is a range of IP address within the virtual network. 

You can divide a virtual network into multiple subnets. 

Each subnet must have a unique address range, which is specified in classless interdomain routing (CIDR) format. 

CIDR is a way to represent a block of network IP addresses. 

An IPv4 CIDR, specified as part of the IP address, shows the length of the network prefix.

Consider, for example, CIDR 192.168.10.0/24. "192.168.10.0" is the network address, and "24" indicates that the first 24 bits are part of the network address, leaving the last 8 bits for specific host addresses. 

The address range of a subnet can't overlap with other subnets in the virtual network or with the on-premises network.

For all subnets in Azure, the first three IP addresses are reserved by default. 

For protocol conformance, the first and last IP addresses of all subnets also are reserved. 

In Azure, an internal DHCP service assigns and maintains the lease of IP addresses. 

The `.1, .2, .3`, and last IP addresses are not visible or configurable by the Azure customer. These addresses are reserved and used by internal Azure services.

In Azure virtual networks, IP addresses can be allocated to the following types of resources:

* Virtual machine network interfaces
* Load balancers
* Application gateways


### _Plan IP addressing for your networks_
In this unit, you'll explore the requirements for a network IP address scheme. 

You'll learn about classless inter-domain routing (CIDR) and how you use it to slice an IP block to meet your addressing needs. 

At the end of the module, there's an exercise that shows how to plan IP addressing for Azure virtual networks.

#### Gather your requirements
Before planning your network IP address scheme, you must gather the requirements for your infrastructure. 

These requirements also will help you prepare for future growth by reserving extra IP addresses and subnets.

Here are two of the questions you might ask to discover the requirements:

* How many devices do you have on the network?
* How many devices are you planning to add to the network in the future?

When your network expands, you don't want to redesign the IP address scheme. Here are some other questions you could ask:

* Based on the services running on the infrastructure, what devices do you need to separate?
* How many subnets do you need?
* How many devices per subnet will you have?
* How many devices are you planning to add to the subnets in future?
* Are all subnets going to be the same size?
* How many subnets do you want or plan to add in future?


You'll need to isolate some services. 

Isolation of services provides an additional layer of security, but also requires good planning. 

For example, your front-end servers can be accessed by public devices, but the back-end servers need to be isolated. Subnets help isolate the network in Azure. 

By default, all subnets within a virtual network can communicate with each other in Azure. 

To provide further isolation, you can use a network security group. 

You might isolate services depending on the data and its security requirements. For example, you might choose to isolate HR data and the company's financial data from customer databases.

When you know the requirements, you'll have a greater understanding of the total number of devices on the network per subnet and how many subnets you'll need. 

CIDR allows more flexible allocation of IP addresses than was possible with the original system of IP address classes. 

Depending on your requirements, you'll slice the IP block into the required subnets and hosts.

Remember that Azure uses the first three addresses on each subnet. 

The first and last IP addresses of the subnets also are reserved for protocol conformance. 

Therefore, the number of possible addresses on an Azure subnet is (2^n)-5, where n represents the number of host bits.


## Distribute your services across Azure virtual networks and integrate them by using virtual network peering
Use virtual network peering to enable communication across virtual networks in a way that's secure and minimally complex.

Learning objectives:

* Identify use cases for virtual network peering.
* Identify the features and limitations of virtual network peering.
* Configure peering connections between virtual networks.

In this module, you'll learn about virtual network connection options and why virtual network peering is suited for this scenario. 

### Connect services by using virtual network peering
You can use virtual network peering to directly connect Azure virtual networks together. 

When you use peering to connect virtual networks, virtual machines (VMs) in these networks can communicate with each other as if they're in the same network.

With peered virtual networks, traffic between virtual machines is routed through the Azure network. 

The traffic uses only private IP addresses. It doesn't rely on internet connectivity, gateways, or encrypted connections. 

The traffic is always private, and it takes advantage of the high bandwidth and low latency of the Azure backbone network.

![Peering Image](https://learn.microsoft.com/en-gb/training/modules/integrate-vnets-with-vnet-peering/media/2-vnet-peering.svg)

The two types of peering connections are created in the same way:

* **Virtual network peering** connects virtual networks in the same Azure region, such as two virtual networks in North Europe.
* **Global virtual network peering** connects virtual networks that are in different Azure regions, such as a virtual network in North Europe and a virtual network in West Europe.

Virtual network peering doesn't affect or disrupt any resources that you've already deployed to the virtual networks. 

When you use virtual network peering, consider the key features defined in the following sections.

#### Reciprocal connections
When you create a virtual network peering connection with Azure PowerShell or Azure CLI, only one side of the peering gets created. 

To complete the virtual network peering configuration, you'll need to configure the peering in reverse direction to establish connectivity. 

When you create the virtual network peering connection through the Azure portal, the configuration for both side is completed at the same time.

Think of how you'd connect two network switches together. 

You'd connect a cable to each switch and maybe configure some settings so that the switches can communicate. 

Virtual network peering requires similar connections in each virtual network. Reciprocal connections provide this functionality.

#### Cross-subscription virtual network peering
You can use virtual network peering even when both virtual networks are in different subscriptions. 

This setup might be necessary for mergers and acquisitions, or to connect virtual networks in subscriptions that different departments manage.

Virtual networks can be in different subscriptions, and the subscriptions can use the same or different Azure Active Directory tenants.

When you use virtual network peering across subscriptions, you might find that an administrator of one subscription doesn't administer the peer network's subscription. 

The administrator might not be able to configure both ends of the connection. 

To peer the virtual networks when both subscriptions are in different Azure Active Directory tenants, the administrators of each subscription must grant the peer subscription's administrator the Network Contributor role on their virtual network.

#### Transitivity
Virtual network peering is nontransitive. 

Only virtual networks that are directly peered can communicate with each other. 

Virtual networks can't communicate with peers of their peers.

Suppose, for example, that your three virtual networks (A, B, C) are peered like this: A <-> B <-> C. 

Resources in A can't communicate with resources in C because that traffic can't transit through virtual network B. 

If you need communication between virtual network A and virtual network C, you must explicitly peer these two virtual networks.

#### Gateway transit
You can connect to your on-premises network from a peered virtual network if you enable gateways transit from a virtual network that has a VPN gateway. 

Using gateway transit, you can enable on-premises connectivity without deploying virtual network gateways to all your virtual networks. 

This method can reduce the overall cost and complexity of your network. 

By using virtual network peering with gateway transit, you can configure a single virtual network as a hub network. 

Connect this hub network to your on-premises datacenter and share its virtual network gateway with peers.

To enable gateway transit, configure the **Allow gateway transit** option in the hub virtual network where you deployed the gateway connection to your on-premises network. 

Also configure the **Use remote gateways** option in any spoke virtual networks.

> If you want to enable the Use remote gateways option in a spoke network peering, you can't deploy a virtual network gateway in the spoke virtual network.

#### Overlapping address spaces
IP address spaces of connected networks within Azure, between Azure and your on-premises network can't overlap. 

This is also true for peered virtual networks. Keep this rule in mind when you're planning your network design.

In any networks you connect through virtual network peering, VPN, or ExpressRoute, assign different address spaces that don't overlap.

![DIA](https://learn.microsoft.com/en-gb/training/modules/integrate-vnets-with-vnet-peering/media/2-non-overlapping-networks.svg)

#### Alternative connectivity methods
Virtual network peering is the least complex way to connect virtual networks together. 

Other methods focus primarily on connectivity between on-premises and Azure networks rather than connections between virtual networks.

You can also connect virtual networks together through an ExpressRoute circuit. 

ExpressRoute is a dedicated, private connection between an on-premises datacenter and the Azure backbone network. 

The virtual networks that connect to an ExpressRoute circuit are part of the same routing domain and can communicate with each other. 

ExpressRoute connections don't go over the public internet, so your communications with Azure services are as secure as possible.

VPNs use the internet to connect your on-premises datacenter to the Azure backbone through an encrypted tunnel. 

You can use a site-to-site configuration to connect virtual networks together through VPN gateways. 

VPN gateways have higher latency than virtual network peering setups. They're more complex and can cost more to manage.

When virtual networks are connected through both a gateway and virtual network peering, traffic flows through the peering configuration.

#### When to choose virtual network peering
Virtual network peering can be a great way to enable network connectivity between services that are in different virtual networks. 

Because it's easy to implement and deploy, and it works well across regions and subscriptions, virtual network peering should be your first choice when you need to integrate Azure virtual networks.

Peering might not be your best option if you have [existing VPN or ExpressRoute](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview#service-chaining) connections or services behind Azure Basic Load Balancers that would be accessed from a peered virtual network. In these cases, you should research alternatives.


## Host your domain on Azure DNS
Create a DNS zone for your domain name. Create DNS records to map the URL to an IP address. Test that the domain name resolves to your web server.

Learning objectives:

- Configure Azure DNS to host your domain

Azure DNS lets you host your DNS records for your domains on Azure infrastructure. 

With Azure DNS, you can use the same credentials, APIs, tools, and billing as your other Azure services.

### _What is Azure DNS?_
Azure DNS is a hosting service for DNS domains that provides name resolution by using Microsoft Azure infrastructure.

In this unit, you'll learn what DNS is and how it works. You will also learn about Azure DNS, and why you would use it.

#### What is DNS?
DNS, or the Domain Name System, is a protocol within the TCP/IP standard. DNS serves an essential role of translating the human-readable domain names.

IP addresses enable computers and network devices to identify and route requests between themselves.

DNS uses a global directory hosted on servers around the world. Microsoft is part of that network that provides a DNS service through Azure DNS.

A DNS server is also known as a DNS name server, or just a name server.

#### How does DNS work?
A DNS server carries out one of two primary functions:

* Maintains a local cache of recently accessed or used domain names and their IP addresses. 
	* This cache provides a faster response to a local domain lookup request. 
	* If the DNS server can't find the requested domain, it passes the request to another DNS server. 
	* This process repeats at each DNS server until either a match is made or the search times out.

* Maintains the key-value pair database of IP addresses and any host or subdomain over which the DNS server has authority. 
	* This function is often associated with mail, web, and other internet domain services.

#### DNS server assignment
In order for a computer, server, or other network-enabled device to access web-based resources, it must reference a DNS server.

When you connect by using your on-premises network, the DNS settings come from your server. 

When you connect by using an external location, like a hotel, the DNS settings come from the internet service provider (ISP).

#### Domain lookup requests
Here's a simplified overview of the process a DNS server uses when it resolves a domain name lookup request:

* Checks to see if the domain name is stored in the short-term cache. If so, the DNS server resolves the domain request.
* If the domain isn't in the cache, it contacts one or more DNS servers on the web to see if they have a match. When a match is found, the DNS server updates the local cache and resolves the request.
* If the domain isn't found after a reasonable number of DNS checks, the DNS server responds with a domain cannot be found error.

#### IPv4 and IPv6
Every computer, server, or network-enabled device on your network has an IP address. 

An IP address is unique within your domain. 

There are two standards of IP address: IPv4 and IPv6.

* IPv4 
	* Composed of four sets of numbers, in the range 0 to 255, each separated by a dot for example: 127.0.0.1. 
	* Today, IPv4 is the most commonly used standard. 
	* Yet, with the increase in IoT devices, the IPv4 standard will eventually be unable to keep up.

* IPv6 
	* Relatively new standard and will eventually replace IPv4. 
	* It's made up of eight groups of hexadecimal numbers, each separated by a colon. 
	* Example: fe80:11a1:ac15:e9gf:e884:edb0:ddee:fea3.

Many network devices are now provisioned with both an IPv4 and an IPv6 address. 

The DNS name server can resolve domain names to both IPv4 and IPv6 addresses.

#### DNS settings for your domain
Whether the DNS server for your domain is hosted by a third party or managed in-house, you'll need to configure it for each host type you're using. 

Host types include web, email, or other services you're using.

As the administrator for your company, you want to set up a DNS server by using Azure DNS. 

In this instance, the DNS server will act as a start of authority (SOA) for your domain.

#### DNS record types
Configuration information for your DNS server is stored as a file within a zone on your DNS server. 

Each file is called a record. 

The following record types are the most commonly created and used:

* **A** - is the host record, and is the most common type of DNS record. It maps the domain or host name to the IP address.
* **CNAME** - is a Canonical Name record that's used to create an alias from one domain name to another domain name. If you had different domain names that all accessed the same website, you would use CNAME.
* **MX** - is the mail exchange record. It maps mail requests to your mail server, whether hosted on-premises or in the cloud.
* **TXT** - is the text record. It's used to associate text strings with a domain name. Azure and Microsoft 365 use TXT records to verify domain ownership.

Additionally, there are the following record types:

* Wildcards
* CAA (certificate authority)
* NS (name server)
* SOA (start of authority)
* SPF (sender policy framework)
* SRV (server locations)

The SOA and NS records are created automatically when you create a DNS zone by using Azure DNS.

#### Record sets
Some record types support the concept of record sets, or resource record sets. 

A record set allows for multiple resources to be defined in a single record. 

For example, here is an A record that has one domain with two IP addresses:

```
www.wideworldimports.com.     3600    IN    A    127.0.0.1
www.wideworldimports.com.     3600    IN    A    127.0.0.2
```

SOA and CNAME records can't contain record sets.

#### What is Azure DNS?
Azure DNS allows you to host and manage your domains by using a globally distributed name server infrastructure. 

It allows you to manage all of your domains by using your existing Azure credentials.

Azure DNS acts as the SOA for the domain.

You can't use Azure DNS to register a domain name. You use a third-party domain registrar to register your domain.

#### Why use Azure DNS to host your domain?
Azure DNS is built on the Azure Resource Manager service, which offers the following benefits:

* Improved security
* Ease of use
* Private DNS domains
* Alias record sets


At this time, Azure DNS doesn't support Domain Name System Security Extensions. 

If you require this security extension, you should host those portions of your domain with a third-party provider.

#### Security features
Azure DNS provides the following security features:

* Role-based access control
	* Gives you fine-grained control over users' access to Azure resources. 
	* You can monitor their usage and control the resources and services to which they have access.

* Activity logs
	* Lets you track changes to a resource and pinpoint where faults occurred.

* Resource locking
	* Gives a greater level of control to restrict or remove access to resource groups, subscriptions, or any Azure resources.

#### Ease of use
Azure DNS can manage DNS records for your Azure services, and provide DNS for your external resources. 

Azure DNS uses the same Azure credentials, support contract, and billing as your other Azure services.

You can manage your domains and records by using the Azure portal, Azure PowerShell cmdlets, or the Azure CLI. 

Applications that require automated DNS management can integrate with the service by using the REST API and SDKs.

#### Private domains
Azure DNS handles the translation of external domain names to an IP address. 

Azure DNS lets you create private zones. 

These provide name resolution for virtual machines (VMs) within a virtual network, and between virtual networks, without having to create a custom DNS solution. 

This allows you to use your own custom domain names rather than the Azure-provided names.

To publish a private DNS zone to your virtual network, you'll specify the list of virtual networks that are allowed to resolve records within the zone.

Private DNS zones have the following benefits:

* There's no need to invest in a DNS solution. DNS zones are supported as part of the Azure infrastructure.
* All DNS record types are supported: A, CNAME, TXT, MX, SOA, AAAA, PTR, and SRV.
* Host names for VMs in your virtual network are automatically maintained.
* Split-horizon DNS support allows the same domain name to exist in both private and public zones. It resolves to the correct one based on the originating request location.

#### Alias record sets
Alias records sets can point to an Azure resource. 

For example, you can set up an alias record to direct traffic to an Azure public IP address, an Azure Traffic Manager profile, or an Azure Content Delivery Network endpoint.

The alias record set is supported in the following DNS record types:

* A
* AAAA
* CNAME


### _Configure Azure DNS to host your domain_
In this unit, you'll learn how to:

* Create and configure a DNS zone for your domain by using Azure DNS.
* Understand how to link your domain to an Azure DNS zone.
* Create and configure a private DNS zone.

#### Configure a public DNS zone
You'll use a DNS zone to host the DNS records for a domain, such as wideworldimports.com.

#### Step 1: Create a DNS zone in Azure
To host the domain name with Azure DNS, you first need to create a DNS zone for that domain. 

A DNS zone holds all the DNS entries for your domain.

When creating a DNS zone, you need to supply the following details:

* **Subscription:** The subscription to be used.
* **Resource group:** The name of the resource group to hold your domains. If one doesn't exist, create one to allow for better control and management.
* **Name:** The name of your domain, which in this case is wideworldimports.com.
* **Resource group location:** The location defaults to the location of the resource group.

#### Step 2: Get your Azure DNS name servers
After you create a DNS zone for the domain, you need to get the name server details from the name servers (NS) record. 

You'll use these details to update your domain registrar's information and point to the Azure DNS zone.

#### Step 3: Update the domain registrar setting
As the domain owner, you need to sign in to the domain-management application provided by your domain registrar. 

In the management application, edit the NS record, and change the NS details to match your Azure DNS name server details.

Changing the NS details is called domain delegation. When you delegate the domain, you must use all four name servers provided by Azure DNS.

#### Step 4: Verify delegation of domain name services
The next step is to verify that the delegated domain now points to the Azure DNS zone you created for the domain. (This can take as few as 10 minutes, but might take longer)

To verify the success of the domain delegation, query the start of authority (SOA) record. 

The SOA record was automatically created when the Azure DNS zone was set up. You can do this by using a third-party tool like nslookup.

The SOA record represents your domain and will become the reference point when other DNS servers are searching for your domain on the internet.

To verify the delegation, use nslookup like this:

```
nslookup -type=SOA wideworldimports.com
```

#### Step 5: Configure your custom DNS settings
The domain name is wideworldimports.com. When it's used in a browser, the domain resolves to your website. 

But what if you want to add in web servers or load balancers? These resources need to have their own custom settings in the DNS zone, either as an A record or a CNAME.

##### A record
Each A record requires the following details:

* Name: The name of the custom domain, for example webserver1.
* Type: In this instance, it's A.
* TTL: Represents the "time-to-live" as a whole unit, where 1 is one second. This value indicates how long the A record lives in a DNS cache before it expires.
* IP address: The IP address of the server to which this A record should resolve.

##### CNAME record
The CNAME is the canonical name, or the alias for an A record. 

Use CNAME when you have different domain names that all access the same website. 

For example, you might need a CNAME in the wideworldimports zone, if you want both www.wideworldimports.com and wideworldimports.com to resolve to the same IP address.

You would create the CNAME record in the wideworldimports zone with the following information:

* NAME: www
* TTL: 600 seconds
* Record type: CNAME

If you exposed a web function, you would create a CNAME record that resolves to the Azure function.

#### Configure private DNS zone
To provide name resolution for virtual machines (VMs) within a virtual network and between virtual networks, create a private DNS zone.

##### Step 1: Create private DNS zone
In the Azure portal, search for private dns zones. 

To create the private zone, you need enter a resource group and the name of the zone. 

For example, the name might be something like private.wideworldimports.com.

##### Step 2: Identify virtual networks
Let's assume that your organization has already created your VMs and virtual networks in a production environment. 

Identify the virtual networks associated with VMs that need name resolution support. 

To link the virtual networks to the private zone, you need the virtual network names.

##### Step 3: Link your virtual network to a private DNS zone
To link the private DNS zone to a virtual network, you'll create a virtual network link. In the Azure portal, go to the private zone, and select Virtual network links.

Select Add to pick the virtual network you want to link to the private zone.

You add a virtual network link record for each virtual network that needs private name resolution support.


### _Dynamically resolve resource name by using alias record_
The next phase of the deployment is to improve resiliency by using a load balancer. 

Load balancers distribute inbound data requests and traffic across one or more servers. 

They reduce the load on any one server and improve performance. 

#### What is an apex domain?
The apex domain is the highest level of your domain. 

The apex domain is also sometimes referred to as the zone apex or root apex. 

It's often represented by the @ symbol in your DNS zone records.

If you check the DNS zone for wideworldimports.com, you'll see there are two apex domain records: NS and SOA. 

The NS and SOA records are automatically created when you created the DNS zone.

CNAME records that you might need for an Azure Traffic Manager profile or Azure Content Delivery Network endpoints aren't supported at the zone apex level.

However, other alias records are supported at the zone apex level.

#### What are alias records?
Azure alias records enable a zone apex domain to reference other Azure resources from the DNS zone. 

You don't need to create complex redirection policies. 

You can also use an Azure alias to route all traffic through Traffic Manager.

The Azure alias record can point to the following Azure resources:

* A Traffic Manager profile
* Azure Content Delivery Network endpoints
* A public IP resource
* A front door profile

Alias records provide lifecycle tracking of target resources, ensuring that changes to any target resource are automatically applied to the DNS zone. 

Alias records also provide support for load-balanced applications in the zone apex.

The alias record set supports the following DNS zone record types:

* A: The IPv4 domain name-mapping record.
* AAAA: The IPv6 domain name-mapping record.
* CNAME: The alias for your domain, which links to the A record.

#### Uses for alias records
The following are some of the advantages of using alias records:

* **Prevents dangling DNS records:** 
	* A dangling DNS record occurs when the DNS zone records aren't up to date with changes to IP addresses. 
	* Alias records prevent dangling references by tightly coupling the lifecycle of a DNS record with an Azure resource.

* **Updates DNS record set automatically when IP addresses change:**
	* When the underlying IP address of a resource, service, or application is changed, the alias record ensures that any associated DNS records are automatically refreshed.

* **Hosts load-balanced applications at the zone apex:**
	* Alias records allow for zone apex resource routing to Traffic Manager.

* **Points zone apex to Azure Content Delivery Network endpoints:** 
	* With alias records, you can now directly reference your Azure Content Delivery Network instance.

An alias record allows you to link the zone apex (wideworldimports.com) to a load balancer. 

It creates a link to the Azure resource, rather than a direct IP-based connection. 

So, if the IP address of your load balancer changes, the zone apex record continues to work.


## Manage and control traffic flow in your Azure deployment with routes
Learn how to control Azure virtual network traffic by implementing custom routes.

Learning objectives:

* Identify the routing capabilities of an Azure virtual network
* Configure routing within a virtual network
* Deploy a basic network virtual appliance
* Configure routing to send traffic through a network virtual appliance

A virtual network lets you implement a security perimeter around your resources in the cloud. 

You can control the information that flows in and out of a virtual network. You can also restrict access to allow only the traffic that originates from trusted sources.

### _Identify routing capabilities of an Azure virtual network_
To control traffic flow within your virtual network, you must learn the purpose and benefits of custom routes. 

You must also learn how to configure the routes to direct traffic flow through a network virtual appliance (NVA).

#### Azure routing
Network traffic in Azure is automatically routed across Azure subnets, virtual networks, and on-premises networks. 

This routing is controlled by system routes, which are assigned by default to each subnet in a virtual network. 

With these system routes, any Azure virtual machine that gets deployed into a virtual network can communicate with any other in the network. 

These virtual machines are also potentially accessible from on-premises through a hybrid network or the internet.

You can't create or delete system routes, but you can override the system routes by adding custom routes to control traffic flow to the next hop.

Every subnet has the following default system routes:

Address prefix | Next hop type
--- | :---:
Unique to the virtual network | Virtual network
0.0.0.0/0 | Internet
10.0.0.0/8 | None
172.16.0.0/12 | None
192.168.0.0/16 | None
100.64.0.0/10 | None

The Next hop type column shows the network path taken by traffic sent to each address prefix. 

The path can be one of the following hop types:

* Virtual network: 
	* A route is created in the address prefix. 
	* The prefix represents each address range created at the virtual-network level. 
	* If multiple address ranges are specified, multiple routes are created for each address range.

* Internet: The default system route 0.0.0.0/0 routes any address range to the internet, unless you override Azure's default route with a custom route.

* None: 
	* Any traffic routed to this hop type is dropped and doesn't get routed outside the subnet. 
	* By default, the following IPv4 private-address prefixes are created: 10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16. 
	* The prefix 100.64.0.0/10 for a shared address space is also added. None of these address ranges are globally routable.

Within Azure, there are other system routes. Azure will create these routes if the following capabilities are enabled:

* Virtual network peering
* Service chaining
* Virtual network gateway
* Virtual network service endpoint

#### Virtual network peering and service chaining
Virtual network peering and service chaining let virtual networks within Azure be connected to one another. 

With this connection, virtual machines can communicate with each other within the same region or across regions. 

This communication in turn creates more routes within the default route table. 

Service chaining lets you override these routes by creating user-defined routes between peered networks.

#### Virtual network gateway
Use a virtual network gateway to send encrypted traffic between Azure and on-premises over the internet and to send encrypted traffic between Azure networks. 

A virtual network gateway contains routing tables and gateway services.

#### Virtual network service endpoint
Virtual network endpoints extend your private address space in Azure by providing a direct connection to your Azure resources. 

This connection restricts the flow of traffic: your Azure virtual machines can access your storage account directly from the private address space and deny access from a public virtual machine. 

As you enable service endpoints, Azure creates routes in the route table to direct this traffic.

#### Custom routes
System routes might make it easy for you to quickly get your environment up and running, but there are many scenarios in which you'll want to more closely control the traffic flow within your network. 

For example, you might want to route traffic through an NVA or through a firewall. This control is possible with custom routes.

You have two options for implementing custom routes: create a user-defined route, or use Border Gateway Protocol (BGP) to exchange routes between Azure and on-premises networks.

#### User-defined routes
You can use a user-defined route to override the default system routes so traffic can be routed through firewalls or NVAs.

For example, you might have a network with two subnets and want to add a virtual machine in the perimeter network to be used as a firewall. 

You can create a user-defined route so that traffic passes through the firewall and doesn't go directly between the subnets.

When creating user-defined routes, you can specify these next hop types:

* Virtual appliance: 
	* A virtual appliance is typically a firewall device used to analyze or filter traffic that is entering or leaving your network. 
	* You can specify the private IP address of a NIC attached to a virtual machine so that IP forwarding can be enabled. 
	* Or you can provide the private IP address of an internal load balancer.

* Virtual network gateway: 
	* Use to indicate when you want routes for a specific address to be routed to a virtual network gateway. 
	* The virtual network gateway is specified as a VPN for the next hop type.

* Virtual network: Use to override the default system route within a virtual network.

* Internet: Use to route traffic to a specified address prefix that is routed to the internet.

* None: Use to drop traffic sent to a specified address prefix.

With user-defined routes, you can't specify the next hop type **VirtualNetworkServiceEndpoint**, which indicates virtual network peering.

#### Border gateway protocol
A network gateway in your on-premises network can exchange routes with a virtual network gateway in Azure by using BGP. 

BGP is the standard routing protocol that is normally used to exchange routing and information among two or more networks. 

BGP is used to transfer data and information between different host gateways like on the internet or between autonomous systems.

You'll typically use BGP to advertise on-premises routes to Azure when you're connected to an Azure datacenter through Azure ExpressRoute. 

You can also configure BGP if you connect to an Azure virtual network by using a VPN site-to-site connection.

BGP offers network stability, because routers can quickly change connections to send packets if a connection path goes down.

#### Route selection and priority
If multiple routes are available in a route table, Azure uses the route with the longest prefix match. 

For example, if a message gets sent to the IP address 10.0.0.2, but two routes are available with the 10.0.0.0/16 and 10.0.0.0/24 prefixes, Azure selects the route with the 10.0.0.0/24 prefix because it's more specific.

The longer the route prefix, the shorter the list of IP addresses available through that prefix. 

When you use longer prefixes, the routing algorithm can select the intended address more quickly.

You can't configure multiple user-defined routes with the same address prefix.

If there are multiple routes with the same address prefix, Azure selects the route based on the type in the following order of priority:

1. User-defined routes
2. BGP routes
3. System routes


### _What is an NVA?_
A network virtual appliance (NVA) is a virtual appliance that consists of various layers like:

* a firewall
* a WAN optimizer
* application-delivery controllers
* routers
* load balancers
* IDS/IPS
* proxies

You can deploy NVAs chosen from providers in Azure Marketplace. 

Such providers include Cisco, Check Point, Barracuda, Sophos, WatchGuard, and SonicWall. 

You can use an NVA to filter traffic inbound to a virtual network, to block malicious requests, and to block requests made from unexpected resources.

As part of the network-security strategy, you must control the flow of traffic within your virtual network. 

You also must learn the role of an NVA and the benefit of using an NVA to control traffic flow through an Azure network.

#### Network virtual appliance
Network virtual appliances (NVAs) are virtual machines that control the flow of network traffic by controlling routing. 

You'll typically use them to manage traffic flowing from a perimeter-network environment to other networks or subnets.

You can deploy firewall appliances into a virtual network in different configurations. 

You can put a firewall appliance in a perimeter-network subnet in the virtual network or if you want more control of security, implement a microsegmentation approach.

With the microsegmentation approach, you can create dedicated subnets for the firewall and then deploy web applications and other services in other subnets. 

All traffic is routed through the firewall and inspected by the NVAs. 

You'll enable forwarding on the virtual-appliance network interfaces to pass traffic that is accepted by the appropriate subnet.

Microsegmentation lets the firewall inspect all packets at OSI Layer 4 and, for application-aware appliances, Layer 7. 

When you deploy an NVA to Azure, it acts as a router that forwards requests between subnets on the virtual network.

Some NVAs require multiple network interfaces. 

One network interface is dedicated to the management network for the appliance. 

Additional network interfaces manage and control the traffic processing. 

After you’ve deployed the NVA, you can then configure the appliance to route the traffic through the proper interface.

#### User-defined routes
For most environments, the default system routes already defined by Azure are enough to get the environments up and running. 

In certain cases, you should create a routing table and add custom routes. 

Examples include:

* Access to the internet via on-premises network using forced tunneling
* Using virtual appliances to control traffic flow

There are several methods of achieving high availability when using NVAs. 

### _Learn more_
For more information on using routes in your network infrastructure, see the following articles:

* [Virtual network traffic routing](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-udr-overview)
* [Tutorial: Route network traffic with a route table using the Azure portal](https://learn.microsoft.com/en-us/azure/virtual-network/tutorial-create-route-table-portal)
* [Deploy highly available network virtual appliances](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/dmz/nva-ha)
* [Implement a DMZ between Azure and the Internet](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/dmz/secure-vnet-dmz)


## Improve application scalability and resiliency by using Azure Load Balancer
Discuss the different load balancers in Azure and how to choose the right Azure load balancer solution to meet your requirements.

Learning objectives:

* Identify the features and capabilities of Azure Load Balancer
* Deploy and configure an Azure load balancer

Many apps need to be resilient to failure and scale easily when demand increases. You can address those needs by using Azure Load Balancer.

### _Azure Load Balancer features and capabilities_
With Azure Load Balancer, you can spread user requests across multiple virtual machines or other services.

This allows you to scale the app to larger sizes than a single virtual machine can support, and ensuring that users get service even when a virtual machine fails.

#### Distribute traffic with Azure Load Balancer
Azure Load Balancer is a service you can use to distribute traffic across multiple virtual machines. 

Use Load Balancer to scale applications and create high availability for your virtual machines and services. 

Load balancers use a hash-based distribution algorithm. 

By default, a five-tuple hash is used to map traffic to available servers. 

The hash is made from the following elements:

* **Source IP:** The IP address of the requesting client.
* **Source port:** The port of the requesting client.
* **Destination IP:** The destination IP of the request.
* **Destination port:** The destination port of the request.
* **Protocol type:** The specified protocol type, TCP or UDP.

Load Balancer supports inbound and outbound scenarios, provides low latency and high throughput, and scales up to millions of flows for TCP and UDP applications.

Load balancers aren't physical instances. 

Load balancer objects are used to express how Azure configures its infrastructure to meet your requirements.

With Load Balancer, you can use availability sets and availability zones to ensure that virtual machines are always available:

Configuration | Service level agreement (SLA) | Information
:---: | :---: | ---
Availability set | 99.95% | Protection from hardware failures within datacenters
Availability zone | 99.99% | Protection from entire datacenter failure

#### Availability sets
An availability set is a logical grouping that you use to isolate virtual machine resources from each other when they're deployed. 

Azure ensures that the virtual machines you put in an availability set run across multiple physical servers, compute racks, storage units, and network switches. 

If there's a hardware or software failure, only a subset of your virtual machines is affected. 

Your overall solution stays operational. 

Availability sets are essential for building reliable cloud solutions.

#### Availability zones
An availability zone offers groups of one or more datacenters that have independent power, cooling, and networking. 

The virtual machines in an availability zone are placed in different physical locations within the same region. 

Use this architecture when you want to ensure that, when an entire datacenter fails, you can continue to serve users.

Availability zones don't support all virtual machine sizes and aren't available in all Azure regions. 

Check that they're supported in your region before you use them in your architecture.

#### Select the right Load Balancer product
Two products are available when you create a load balancer in Azure: basic load balancers and standard load balancers.

Basic load balancers allow:

* Port forwarding
* Automatic reconfiguration
* Health probes
* Outbound connections through source network address translation (SNAT)
* Diagnostics through Azure Log Analytics for public-facing load balancers

Basic load balancers can be used only with a single availability set or scale set.

Standard load balancers support all of the basic load balancer features. They also allow:

* HTTPS health probes
* Availability zones
* Diagnostics through Azure Monitor, for multidimensional metrics
* High availability (HA) ports
* Outbound rules
* A guaranteed SLA (99.99% for two or more virtual machines)

#### Internal and external load balancers
An external load balancer operates by distributing client traffic across multiple virtual machines. 

An external load balancer permits traffic from the internet. 

The traffic might come from browsers, mobile apps, or other sources.

In a healthcare organization, the balancer distributes the load of all the browsers that run the client healthcare application.

An internal load balancer distributes a load from internal Azure resources to other Azure resources. 

For example, if you have front-end web servers that need to call business logic that's hosted on multiple middle-tier servers, you can distribute that load evenly by using an internal load balancer. 

No traffic is allowed from internet sources. 

In a healthcare organization, a load balancer distributes a load across the internal application tier.


### _Configure a public load balancer_
A public load balancer maps the public IP address and port number of incoming traffic to the private IP address and port number of a virtual machine in the back-end pool. 

The responses are then returned to the client. 

By applying load-balancing rules, you distribute specific types of traffic across multiple virtual machines or services.

#### Distribution modes
By default, Azure Load Balancer distributes network traffic equally among virtual machine instances. 

The following distribution modes are also possible if a different behavior is required:

* Five-tuple hash. 
	* The default distribution mode for Load Balancer is a five-tuple hash. 
	* The tuple is composed of source IP, source port, destination IP, destination port, and protocol type. 
	* Because the source port is included in the hash and the source port changes for each session, clients might be directed to a different virtual machine for each session.

* Source IP affinity. 
	* This distribution mode is also known as session affinity or client IP affinity. 
	* To map traffic to the available servers, the source IP affinity mode uses a two-tuple hash (from the source IP address and destination IP address) 
	* Or it uses a three-tuple hash (from the source IP address, destination IP address, and protocol type). 
	* The hash ensures that requests from a specific client are always sent to the same virtual machine behind the load balancer.

#### Load Balancer and Remote Desktop Gateway
Remote Desktop Gateway is a Windows service that you can use to enable clients on the internet to make Remote Desktop Protocol (RDP) connections through firewalls to Remote Desktop servers on your private network. 

The default five-tuple hash in Load Balancer is incompatible with this service. 

If you want to use Load Balancer with your Remote Desktop servers, use source IP affinity.

#### Load Balancer and media upload
Another use case for source IP affinity is media upload. 

In many implementations, a client initiates a session through a TCP protocol and connects to a destination IP address. 

This connection remains open throughout the upload to monitor progress, but the file is uploaded through a separate UDP protocol.

With the five-tuple hash, the load balancer likely will send the TCP and UDP connections to different destination IP addresses and the upload won't finish successfully. 

Use source IP affinity to resolve this issue.

### _Internal load balancer_
In addition to balancing requests from users to front-end servers, you can use Azure Load Balancer to distribute traffic from front-end servers evenly among back-end servers.

#### Configure an internal load balancer
You can configure an internal load balancer in almost the same way as an external load balancer, but with these differences:

* When you create the load balancer, select Internal for the Type value. When you select this setting, the front-end IP address of the load balancer isn't exposed to the internet.
* Assign a private IP address instead of a public IP address for the front end of the load balancer.
* Place the load balancer in the protected virtual network that contains the virtual machines you want to handle the requests.

The internal load balancer should be visible only to the web tier. 

All the virtual machines that host the databases are in one subnet. 

You can use an internal load balancer to distribute traffic to those virtual machines.

![DIA](https://learn.microsoft.com/en-gb/training/modules/improve-app-scalability-resiliency-with-load-balancer/media/5-internal-load-balancer.svg)

#### Choose the distribution mode
In the healthcare portal, the application tier is stateless, so you don't need to use source IP affinity. 

You can use the default distribution mode of a five-tuple hash. 

This mode offers the greatest scalability and resilience. 

The load balancer routes traffic to any healthy server.

