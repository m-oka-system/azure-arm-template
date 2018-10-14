# Variable
$resourceGroupName = "w-arm-rg"
$location = "Japan West"
$deploymentName = "SampleDeploy"
$templatePath = "C:\OneDrive\DS218j\cloud\azure\azure-arm-template\virtual-machine\"
$templateFile = "azuredeploy.json"
$templateParameterFile = "azuredeploy.parameters.json"
$template = $templatePath + $templateFile
$templateParameter = $templatePath + $templateParameterFile

# Create resource group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location -Verbose -Force

# Test template deployment
Test-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -TemplateParameterFile $templateParameter -Verbose

# Adds an Azure deployment to a resource group
New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -Name $deploymentName `
    -TemplateFile $template `
    -TemplateParameterFile $templateParameter -Verbose -Force


# Show History
Get-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName

# Delete all resources
$deploymentName = "AllDelete"
$templatePath = "C:\OneDrive\DS218j\cloud\azure\azure-arm-template\"
$templateFile = "azuredeploy.json"
$template = $templatePath + $templateFile
New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -Name $deploymentName `
    -TemplateFile $template -Verbose -Force `
    -Mode Complete

# Stop deployment
Stop-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName `
    -Name $deploymentName