# Directory Navigation (Assumes backed up to onedrive)
function docs { Set-Location "$env:USERPROFILE\OneDrive\Documents" }
function desktop { Set-Location "$env:USERPROFILE\OneDrive\Desktop" }
function dl { Set-Location "$env:USERPROFILE\Downloads" }
function git-local { Set-location 'c:\git' }

function ll {
	    Get-ChildItem -Force | Select-Object Name,
	            @{Name="Size";Expression={"{0:N2} MB" -f ($_.Length / 1MB)}},
	                    LastWriteTime | Format-Table -AutoSize
	                    }

