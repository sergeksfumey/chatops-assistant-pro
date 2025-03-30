param([string]$vmName, [string]$resourceGroup)
Restart-AzVM -Name $vmName -ResourceGroupName $resourceGroup