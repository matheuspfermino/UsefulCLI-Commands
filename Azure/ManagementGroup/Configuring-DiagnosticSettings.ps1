
# With this topic you will be able to configure your Management Group Diagnostic Settings.

# Before runing substitute <workspaceId> | Line 17
# Before runing substitute <diagnosticSettings-name> | Line 33
# Before runing substitute <managementGroupID> | Line 33

# If you don't know your <workspaceId> try run:
# Don't forget to substitute <RG> and <WORKSPACE> fields

az monitor log-analytics workspace show --resource-group <RG> --workspace-name <WORKSPACE> --query id -o tsv

# In lines 21 and 25 you can set Logs Category by switching between $true or $false.

$body = @{
    properties = @{
        workspaceId = "<workspaceId>"
        logs = @(
            @{
                category = "Administrative"
                enabled  = $true
            },
            @{
                category = "Policy"
                enabled  = $true
            }
        )
    }
} | ConvertTo-Json -Depth 10

Invoke-AzRestMethod `
    -Method PUT `
    -Path "/providers/microsoft.management/managementGroups/<managementGroupID>/providers/microsoft.insights/diagnosticSettings/<diagnosticSettings-name>?api-version=2020-01-01-preview" `
    -Payload $body