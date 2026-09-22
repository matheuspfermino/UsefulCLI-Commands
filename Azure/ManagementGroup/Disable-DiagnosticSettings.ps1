
# This topic contains the exaclty command to disable DiagosticSettings of ManagementGroup.

# Before runing substitute <diagnosticSettings-name> | Line 6

Invoke-AzRestMethod ` -Method DELETE ` -Path "/providers/microsoft.management/managementGroups/<ManagementGroupID>/providers/microsoft.insights/diagnosticSettings/<diagnosticSettings-name>?api-version=2020-01-01-preview" 