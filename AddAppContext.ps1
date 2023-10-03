## Associate flow with an app - Change the parrameters to match your EnvironmentName, FlowName and AppName. 
Add-AdminFlowPowerAppContext -EnvironmentName fc56583f-c243-6565-95bb-2f2d8437b3ca -FlowName 1063c97f-44f8-6272-893c-91b0cec27e9b -AppName ft_FRP


## This scripts read the EnvironmentName, FlowName and AppName from the file and run the  Add-AdminFlowPowerAppContex for every row in the csv file.
$contextflows = Import-Csv -Path suspensionlist1.csv
ForEach($contextflow in $contextflows)
{
    Add-AdminFlowPowerAppContext -EnvironmentName $contextflow.EnvironmentName -FlowName $contextflow.FlowName -AppName $contextflow.AppName
}


##  Remove the Associate of flow with an app - Change the parrameters to match your EnvironmentName, FlowName and AppName. 
remove-AdminFlowPowerAppContext -EnvironmentName cfd05356-dddd-4d53-a36f-eeabd47a63a2 -FlowName 8f873703-d369-47c2-a4cf-8088bbf3091d -AppName ft_FRP
