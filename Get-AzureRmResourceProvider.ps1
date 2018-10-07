# List up resource type
Get-AzureRmResourceProvider | `
    Select-Object ProviderNameSpace,ResourceTypes | `
    Sort-Object ProviderNameSpace

# Check the API version
((Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute).ResourceTypes | `
    Where-Object {$_.ResourceTypeName -eq "virtualMachines"}).ApiVersions