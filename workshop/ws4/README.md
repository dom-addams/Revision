# Mapping Blob Storage to kubernetes POD in AKS
This folder contains various methods for creating StorageClass to connect with Blob Storage.

There are various methods of achieving this and several extra parmaters that can be set in the Persistent Volume.

The links below provide more information on how to create and connect to Blob Storage in AKS.

## Information Links
https://learn.microsoft.com/en-us/azure/aks/concepts-storage
https://learn.microsoft.com/en-us/azure/aks/azure-blob-csi?tabs=NFS
https://learn.microsoft.com/en-us/azure/aks/azure-csi-blob-storage-provision?tabs=mount-nfs%2Csecret
https://learn.microsoft.com/en-us/azure/storage/blobs/network-file-system-protocol-support-how-to
https://learn.microsoft.com/en-us/azure/storage/blobs/network-file-system-protocol-support
https://learn.microsoft.com/en-us/azure/aks/azure-csi-files-storage-provision
https://learn.microsoft.com/en-us/azure/aks/azure-csi-blob-storage-provision?tabs=mount-nfs%2Csecret#static-provisioning-parameters:~:text=Static%20provisioning%20parameters
https://github.com/kubernetes-sigs/blob-csi-driver/blob/master/deploy/example/e2e_usage.md
https://www.kasten.io/kubernetes/resources/blog/aks-and-storage-how-to-design-storage-for-cloud-native-applications

## Using custom Storage Account
- Details for Dynamic Provisioning

- skuName
    > Specify an Azure storage account type (alias: storageAccountType).
    > Standard_LRS, Premium_LRS, Standard_GRS, Standard_RAGRS
    > default = Standard_LRS

- storageAccount
    > Specify an Azure storage account name.
    > storageAccountName
    > No for blobfuse mount // Yes for NFSv3 mount.
    > For blobfuse mount: if empty, driver finds a suitable storage account that matches skuName in the same resource group. 
    >> If a storage account name is provided, storage account must exist.
    > For NFSv3 mount, storage account name must be provided.

- server
    > Specify Azure storage account domain name
    > Existing storage account DNS domain name, for example <storage-account>.privatelink.blob.core.windows.net.
    > If empty, driver uses default <storage-account>.blob.core.windows.net or other sovereign cloud storage account DNS domain name.

- Details for Static provisioning parameters
    > This section provides guidance for cluster administrators who want to create one or more persistent volumes that include details of Blob storage for use by a workload.

- volumeAttributes.storageAccount
    > Specify an existing Azure storage account name.
    > storageAccountName
    > Mandatory field

- volumeAttributes.containerName
    > Specify existing (blob) container name.
    > container
    > Mandatory field

- nodeStageSecretRef.name
    > Specify secret name that stores one of the following:azurestorageaccountkey, azurestorageaccountsastoken, msisecret, azurestoragespnclientsecret.
    > Existing Kubernetes secret name

- StorageClass ProvisionersL
    > storageclass.storage.k8s.io/blob-fuse-premium created
    > storageclass.storage.k8s.io/blob-nfs-premium created
    > kubernetes.io/azure-file
    > blob.csi.azure.com