param([string]$VMName, [string]$RGName)
Write-Output "Restarting VM: $VMName in $RGName"
Restart-AzVM -Name $VMName -ResourceGroupName $RGName