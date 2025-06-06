@ECHO OFF

sc config OVRService start= demand
net start "OVRService"
if %errorlevel% == 2 net stop "OVRService"

taskkill /f /im OVRServiceLauncher.exe
taskkill /f /im OVRServer_x64.exe
taskkill /f /im OVRRedir.exe
taskkill /f /im AdobeUpdateService.exe
taskkill /f /im Adobe*
taskkill /f /im AGMService.exe