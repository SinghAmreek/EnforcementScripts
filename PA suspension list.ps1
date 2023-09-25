# Following modules are required to run suspension list scripts
Install-Module -Name Microsoft.PowerApps.Administration.PowerShell -Force
Install-Module -Name Microsoft.PowerApps.PowerShell -AllowClobber -Force 

# Display the suspension list for a specific environment in the console window
Get-AdminFlowAtRiskOfSuspension -EnvironmentName cfd05356-f25c-4d53-a36f-eeabd47a63a2 -ApiVersion '2016-11-01'

# Add the suspension list for a specific environment in the console window
Get-AdminFlowAtRiskOfSuspension -EnvironmentName cfd05356-f25c-4d53-a36f-eeabd47a63a2 -ApiVersion '2016-11-01' | Export-Csv -Path suspensionList.csv -NoTypeInformation

Add-PowerAppsAccount
$environments = Get-PowerAppEnvironment
ForEach($environment in $environments){
    $flowlist=Get-AdminFlowAtRiskOfSuspension -EnvironmentName $environment.EnvironmentName  -ApiVersion '2016-11-01' ##| Export-Csv -Path suspensionList.csv -NoTypeInformation
    
    if ( $flowlist.Length -gt 0)
    {
        
        $filename= $environment.DisplayName + '.csv'
        $flowlist| Export-Csv -Path $filename -NoTypeInformation
    }

#write-host $flowlist
}

