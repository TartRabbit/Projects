<#

I made this when I was like 16... and it "works"

We're gonna take the mindset of: "If it's stupid but it works, it ain't stupid" for now.

Maybe project later?

#>




$userExpac = whoami

$user = $userExpac -replace ".*\\"

Get-Disk

Start-Sleep -Seconds 1

do {

    $driveNumber = Read-Host -Prompt "Please input singular drive number: "

} until ($driveNumber.Length -gt 0 -and $driveNumber.Length -lt 2)
Write-Output "`n"
 

do {

    $driveName = Read-Host -Prompt "Please input a drive name: "

} until ($driveName.Length -gt 0)
Write-Output "`n"

 

do {

    $driveLetter = Read-Host -Prompt "Please input singular drive letter: "

} until ($driveNumber.Length -gt 0 -and $driveNumber.Length -lt 2)
Write-Output "`n"

do {

    $driveWipe = Read-Host -Prompt "Would you like to wipe the drive before backing up? Y/N: "
 } until ($driveWipe.Length -gt 0 -and $driveWipe.Length -lt 2)
 Write-Output "`n"

If($driveWipe -eq "Y") {
Clear-Disk -Number $driveNumber -RemoveData -RemoveOEM -Confirm:$false
Initialize-Disk -Number $driveNumber -PassThru | New-Partition -DriveLetter $driveLetter -UseMaximumSize | Format-Volume -FileSystem NTFS -NewFileSystemLabel $driveName -Force -Confirm:$false
} Else {}

$driveLetter = $driveLetter.ToUpper()

$driveDesktop = $driveLetter + ":\$user Desktop" 

$driveDocuments = $driveLetter + ":\$user Documents"

$driveMusic = $driveLetter + ":\$user Music"

$driveVideos = $driveLetter + ":\$user Videos"

$drivePictures = $driveLetter + ":\$user Pictures"

Write-Output "Repositories will be located at: `n"
Write-Output $driveDesktop $driveDocuments $driveMusic $driveVideos
Write-Output "`n"

Copy-Item -Path "C:\Users\$user\Desktop\" -Destination "$driveDesktop" -Recurse
Write-Output "$user Desktop Copied"

Copy-Item -Path "C:\Users\$user\Documents\" -Destination "$driveDocuments" -Recurse
Write-Output "$user Documents Copied" 

Copy-Item -Path "C:\Users\$user\Music\" -Destination "$driveMusic" -Recurse
Write-Output "$user Music Copied"

Copy-Item -Path "C:\Users\$user\Videos\" -Destination "$driveVideos" -Recurse
Write-Output "$user Videos Copied" 

Copy-Item -Path "C:\Users\$user\Pictures\" -Destination "$drivePictures" -Recurse
Write-Output "$user Videos Pictures" 