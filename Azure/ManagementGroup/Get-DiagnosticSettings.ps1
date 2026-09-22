
# The object here is to check if Diagnostic Settings was already configured for a specific Management Group.

# Before runing substitute <managementGroupID>

# After the execution take a look into Content: { "value": [] } for your answer. If there is no info, were not a previous configuration. Otherwise a "name" field should appear.

Invoke-AzRestMethod ` -Method GET ` -Path "/providers/microsoft.management/managementGroups/<managementGroupID>/providers/microsoft.insights/diagnosticSettings?api-version=2020-01-01-preview" 