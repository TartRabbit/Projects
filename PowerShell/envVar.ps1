function Get-Input{
    
    [CmdletBinding()]
    param (
        [parameter(Mandatory)]
        [string[]]$P,
        [string[]]$Q
    )
    do {
        if (![string]::IsNullOrEmpty($Q)) {
            do {
                $ResponseQ = Read-Host -Prompt $Q
            } until ($ResponseQ.Length -gt 0)} else {
                
        }

        $ResponseP = Read-Host -Prompt $P
        

    } until ($ResponseP.Length -gt 0)

}

Get-Input("Chum chum")
#[Environment]::SetEnvironmentVariable('PG', 'C:\Program Files')

