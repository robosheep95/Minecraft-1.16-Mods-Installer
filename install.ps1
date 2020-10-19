# Minecraft Installer Script

$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

Write-host "My directory is $dir"

Push-Location $dir

Write-Host Complete fabric install and close fabric window to continue
java -jar fabric-installer.jar

if (-Not (Test-Path $env:APPDATA\.minecraft\mods)) 
{
  mkdir $env:APPDATA\.minecraft\mods
  Write-Host Adding mods folder.
}
else {
  Write-Host Mods folder already exsists.
}

if (-Not (Test-Path $env:APPDATA\.minecraft\shaderpacks)) 
{
  mkdir $env:APPDATA\.minecraft\shaderpacks
  Write-Host Adding shaderpacks folder.
}
else{
  Write-Host Shaderpacks folder already exsists.
}

Write-Host Copying mods...
Copy-Item .\mods\* -Destination $env:APPDATA\.minecraft\mods
Write-Host Done copying mods.

Write-Host Copying shaderpacks...
Copy-Item .\shaderpacks\* -Destination $env:APPDATA\.minecraft\shaderpacks
Write-Host Done copying shaderpacks.

Write-Host Done.