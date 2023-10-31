az deployment mg create `
    --template-uri https://raw.githubusercontent.com/Azure/azure-monitor-baseline-alerts/main/patterns/alz/alzArm.json `
    --location 'sweden central' `
    --management-group-id 'test-id' `
    --parameters 'C:\Users\dibe\Gitnew\azure-monitor-baseline-alerts\patterns\alz\alzArm.param.json' -c

##policy remedation

#Modify the following variables to match your environment
$pseudoRootManagementGroup = "test-id"
$identityManagementGroup = "The management group id for Identity"
$managementManagementGroup = "The management group id for Management"
$connectivityManagementGroup = "The management group id for Connectivity"
$LZManagementGroup = "The management group id for Landing Zones"

#Run the following commands to initiate remediation
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $managementManagementGroup -policyName Alerting-Management
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $connectivityManagementGroup -policyName Alerting-Connectivity
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $identityManagementGroup -policyName Alerting-Identity
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $LZManagementGroup -policyName Alerting-LandingZone
.\patterns\alz\scripts\Start-AMBARemediation.ps1 -managementGroupName $pseudoRootManagementGroup -policyName Alerting-ServiceHealth