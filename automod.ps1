$host.ui.RawUI.WindowTitle = "AutoMod for Intel iGPU"
#Check if we can find the inf file (I.E, are we in a driver folder?)
if (Test-Path '.\Graphics\iigd_dch.inf' -PathType Leaf) { $inffile = '.\Graphics\iigd_dch.inf'}
if (Test-Path '.\Graphics\igdlh64.inf' -PathType Leaf) { $inffile = '.\Graphics\igdlh64.inf'}

#If we can't find the inf file then promt for it
if (!$inffile) {$inffile = Read-Host -Prompt 'Please drag your driver INF file here and press enter'}
$inffile = $inffile.Replace('"',"")

#Ask if the user is happy with a power plan override
$message  = 'User input needed'
$question = 'Force change power plan to maximum performace?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
  #Maximium Power Plan
(gc $inffile) -replace '%AC%, 1', '%AC%, 2' | Out-File $inffile
(gc $inffile) -replace '%AC%, 0', '%AC%, 2' | Out-File $inffile
(gc $inffile) -replace '%DC%, 1', '%DC%, 2' | Out-File $inffile
(gc $inffile) -replace '%DC%, 0', '%DC%, 2' | Out-File $inffile
echo "`n `nChanged to maximum power configuration"
} else {
  echo "`n `nKept default power configuration"
}

#Mark this file as modded by iGPU AutoMod
(gc $inffile).replace('INF for the Intel Corporation graphics adapter.', 'INF for the Intel Corporation graphics adapter, modified by iGPU AutoMod') | Set-Content $inffile

#Change max mem config
(gc $inffile) -replace 'MaximumDeviceMemoryConfiguration = 512', 'MaximumDeviceMemoryConfiguration = 1024' | Out-File $inffile
echo "`nMaximumDeviceMemoryConfiguration = 512 --> 1024"

#Optimizations Found in Drivers
#(gc $inffile) -replace 'HKR,, ForcePLLDisableEnableForFreqChange, %REG_DWORD%, 0x0', 'HKR,, ForcePLLDisableEnableForFreqChange, %REG_DWORD%, 0x1' | Out-File $inffile #Causes a failed driver install on my laptop. Desktop needs testing
#(gc $inffile) -replace 'HKR,, NoFastLinkTrainingForeDP, %REG_DWORD%, 1', 'HKR,, NoFastLinkTrainingForeDP, %REG_DWORD%, 0' | Out-File $inffile #I don't have DisplayPort on any of my deviced with an Intel iGPU to test this, if someone does, please do.
echo "`nEnabled optimizations found in drivers"

#Stolen from PHDGD drivers
#(gc $inffile) -replace 'HKR,, IncreaseFixedSegment,%REG_DWORD%, 0', 'HKR,, IncreaseFixedSegment,%REG_DWORD%, 1' | Out-File $inffile
#(gc $inffile) -replace 'HKR,, TotalStaticModes, %REG_DWORD%, 2', 'HKR,, TotalStaticModes, %REG_DWORD%,0' | Out-File $inffile
(gc $inffile) -replace 'HKR,, AdaptiveVsyncEnable,%REG_DWORD%, 1', 'HKR,, AdaptiveVsyncEnable,%REG_DWORD%, 0' | Out-File $inffile

echo "`nMade changes from PHDGD drivers"

#Check if we can find the inf file for the CUI (Common User Interface)
if (Test-Path '.\Graphics\cui_dch.inf' -PathType Leaf) {

#Ask the user if they are okay with user-interface mods
$message  = 'Enable CUI Mods?'
$question = 'There are some CUI (Common User-Interface) mods we can perfom, would you like to use them?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
  #Modify the CUI
  $string = ('HKR,,"ShowOptimalBalloon",%REG_DWORD%,0' + "`n" + 'HKR,,"ShowPromotions",%REG_DWORD%,0')
  (gc '.\Graphics\cui_dch.inf') -replace 'HKR,,"ShowOptimalBalloon",%REG_DWORD%,1', $string | Out-File '.\Graphics\cui_dch.inf'
  echo "`n `nModified the CUI"
} else {
  echo "`n `nSkipped CUI mods"
}
}

#Check if the user is OK with device ID modifications
if (Test-Path '.\Graphics\cui_dch.inf' -PathType Leaf) {

#Ask the user if they are okay with user-interface mods
$message  = 'Modify device IDs?'
$question = 'We can modify the device ID strings to help provide a FPS boost on some devices, would you like to continue? Note: This change may reset your graphics settings'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
  #Change IDs
  (gc $inffile) -replace ' HD Graphics', ' UHD Graphics' | Out-File $inffile
  (gc $inffile) -replace '520', '630' | Out-File $inffile
  (gc $inffile) -replace '530', '630' | Out-File $inffile
  (gc $inffile) -replace '620', '630' | Out-File $inffile
  echo "`n `nModified the device ID strings modifications"
} else {
  echo "`n `nSkipped the device ID strings modifications"
}
}

echo "`nCompleted all modification. Feel free to close this and install the drivers"
pause