rem Disable Error Reporting
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f

rem Disable automatic TCG/Opal disk locking on supported SSD drives with PSID
rem reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\EnhancedStorageDevices" /v TCGSecurityActivationDisabled /t REG_DWORD /d 1 /f

rem Disable "Consumer Features" (aka downloading apps from the internet automatically)
reg add HKLM\Software\Policies\Microsoft\Windows\CloudContent /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f

rem Disable the "how to use Windows" contextual popups
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f

rem Disable Hibernate (frees space)
powercfg -h off

rem Make sure junk apps like Candy Crush don't get installed when we login first time with our Administrator account
reg load HKLM\DEFAULT c:\users\default\ntuser.dat
reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f 
reg add "HKLM\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f 
reg unload HKLM\DEFAULT

rem Remove useless Windows components
rem dism /online /norestart /disable-feature /featurename:Printing-PrintToPDFServices-Features
rem dism /online /norestart /disable-feature /featurename:Printing-XPSServices-Features
rem dism /online /norestart /disable-feature /featurename:Xps-Foundation-Xps-Viewer
rem dism /online /norestart /disable-feature /featurename:WorkFolders-Client
rem dism /online /norestart /disable-feature /featurename:WindowsMediaPlayer
rem dism /online /norestart /disable-feature /featurename:Printing-Foundation-Features
rem dism /online /norestart /disable-feature /featurename:Printing-Foundation-InternetPrinting-Client
rem dism /online /norestart /disable-feature /featurename:FaxServicesClientPackage
rem dism /online /norestart /disable-feature /featurename:MSRDC-Infrastructure
rem dism /online /norestart /disable-feature /featurename:Internet-Explorer-Optional-amd64

rem Enable Ultimate Performance Plan
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61