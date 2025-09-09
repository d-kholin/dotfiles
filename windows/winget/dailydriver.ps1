# This script requires winget to be installed. install it from the Microsoft Store if it doesn't work.  https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1

# It's best to run this script as an administrator

# Edit the app list to fit your needs before running the script.

Write-Host "The script will now install and update all your apps. Feel free to grab a coffee or keep working on something else!" -ForegroundColor Blue

$apps = @(
    @{name = "7zip.7zip" },
    @{name = "Microsoft.PowerToys" },
    @{name = "Bambulab.Bambustudio" },
    @{name = "Tailscale.Tailscale" },
    @{name = "Nextcloud.NextcloudDesktop" },
    @{name = "Git.Git" },
    @{name = "Balena.Etcher" },
    @{name = "Parsec.ParsecVDD" },
    @{name = "Mozilla.Firefox" },
    @{name = "7zip.7zip" },
    @{name = "NordSecurity.NordVPN" },
    @{name = "Logitech.OptionsPlus" },
    @{name = "calibre.calibre" },
    @{name = "HandBrake.HandBrake" },
    @{name = "Google.Chrome.EXE" },
    @{name = "WiresharkFoundation.Wireshark" },
    @{name = "Valve.Steam" },
    @{name = "WinSCP.WinSCP" },
    @{name = "mRemoteNG.mRemoteNG" },
    @{name = "Cryptomator.Cryptomator" },
    @{name = "Bitwarden.Bitwarden" },
    @{name = "Discord.Discord" },
    @{name = "Kubernetes.kubectl" },
    @{name = "Mozilla.SOPS" },
    @{name = "Postman.Postman" },
    @{name = "zyedidia.micro" },
    @{name = "Element.Element" },
    @{name = "GnuPG.Gpg4win" }
);

Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing" $app.name -ForegroundColor Green
        winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name
    }
    else {
        Write-host "Checking for updates for" $app.name -ForegroundColor Cyan
        # Run the upgrade command and capture its output
        $upgradeResult = winget upgrade --id $app.name --exact --accept-source-agreements --accept-package-agreements 2>&1
        $upgradeOutput = $upgradeResult -join " "
        
        # Check if the output indicates no updates are available
        if ($upgradeOutput -match "No available upgrade found" -or $upgradeOutput -match "No newer package versions are available" -or $upgradeOutput -match "No applicable update found") {
            Write-host "No updates available for" $app.name -ForegroundColor Yellow
        } else {
            # If we get here, an update was found and applied
            Write-host "Updated" $app.name -ForegroundColor Green
        }
    }
}

Write-Host "All apps have been installed and updated!" -ForegroundColor Green