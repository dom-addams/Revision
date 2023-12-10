# Creating and enabling access to Private AKS Cluster

## AKS Cluster
- General cluster settings:
    - Name
    - Location (region)
    - Resource Group
    - SKU (Free // Standard)
    - DNS Prefix
    - Tags

- Default node settings:
    - Node Pool Name
    - Node Count
    - Node Image (VM image sku)
    - OS
    - Subnet ID

- Identity block
    - Managed Identity account type
    - SystemAssigned or UserAssinged

- IF private_cluster_enabled is true
    - automatically creates private DNS zone
    - automaitcally creates private link

- Other
    - New RG for node pool is created
    - NSG is created for node pool access

## Network Vnet & Subnet
- General Vnet Settings
    - Name
    - CIDR Range
    - Resource Group
    - Location

- Subnet Settings:
    - Name
    - CIDR Range
    - Vnet Name

- Automatically created:
    - Private Endpoint
    - Pirvate DNS Zone

- Private DNS zone is linked only to the VNet 
    - The private endpoint can only be resolved by hosts in that linked VNet.

-------
## To be configured 
- azurerm_private_dns_zone
    - Name
    - Resource Group
    - define *private_dns_zone_id* in AKS settings

- Virtual network peering
    - Select the private DNS zone.
    - select Virtual network.
    - Create a new link to add the virtual network of the nodes 
    - Browse to cluster's Vnet
    - In the left pane, select Peerings.
    - Select Add, add the virtual network of the VM, and then create the peering. For more information, see Virtual network peering.

[SETUP IMAGE](https://learn.microsoft.com/en-gb/azure/aks/media/private-clusters/aks-private-hub-spoke.png)

- Link the private DNS zone to the virtual network
    - Once the A record is created, link the private DNS zone to the virtual network that will access the private cluster:
    - Go to the private DNS zone.
    - Select Virtual network links.
    - Select Add and set up the following options:
    - Link name: Enter a name for your virtual network link.
    - Subscription: Select the subscription where your private cluster is located.
    - Virtual network: Select the virtual network of your private cluster.
    - Select OK to create the link.

-------
## Missing
- Ability to create DNS A records
- Linking A Record to Vnet
- What is the domain for the private DNS?
- How to expose Vnet

