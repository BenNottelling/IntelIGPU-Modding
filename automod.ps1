$host.ui.RawUI.WindowTitle = "AutoMod for Intel iGPU"
#Check if we can find the inf file (I.E, are we in a driver folder?)
if(Test-Path '\Graphics\iigd_dch.inf' -PathType Leaf) { $inffile = '\Graphics\iigd_dch.inf'}
if(Test-Path '\Graphics\igdlh64.inf' -PathType Leaf) { $inffile = '\Graphics\igdlh64.inf'}

#If we can't find the inf file then promt for it
if(!$inffile) {$inffile = Read-Host -Prompt 'Please drag your driver INF file here and press enter'}

#Mark this file as modded by iGPU AutoMod
(gc $inffile).replace('INF for the Intel Corporation graphics adapter.', 'INF for the Intel Corporation graphics adapter, modded by iGPU AutoMod') | Set-Content $inffile

#Change max mem config
(gc $inffile) -replace 'MaximumDeviceMemoryConfiguration = 512', 'MaximumDeviceMemoryConfiguration = 2048' | Out-File $inffile
echo 'MaximumDeviceMemoryConfiguration = 512 --> 2048'

#Maximium Power Plan
(gc $inffile) -replace '%AC%, 1', '%AC%, 2' | Out-File $inffile
(gc $inffile) -replace '%AC%, 0', '%AC%, 2' | Out-File $inffile
(gc $inffile) -replace '%DC%, 1', '%DC%, 2' | Out-File $inffile
(gc $inffile) -replace '%DC%, 0', '%DC%, 2' | Out-File $inffile
echo 'Changed to maximum power configuration'

#Optimizations Found in Drivers
#(gc iigd_dch.inf) -replace 'HKR,, DisplayOptimizations, %REG_DWORD%, 0x1d', 'HKR,, DisplayOptimizations, %REG_DWORD%, 0x0d' | Out-File iigd_dch.inf
#echo 'Enabled optimizations found in drivers'

#Stolen from PHDGD drivers
(gc $inffile) -replace 'HKR,, IncreaseFixedSegment,%REG_DWORD%, 0', 'HKR,, IncreaseFixedSegment,%REG_DWORD%, 1' | Out-File $inffile
(gc $inffile) -replace 'HKR,, TotalStaticModes, %REG_DWORD%, 2', 'HKR,, TotalStaticModes, %REG_DWORD%,0' | Out-File $inffile
(gc $inffile) -replace 'HKR,, AdaptiveVsyncEnable,%REG_DWORD%, 1', 'HKR,, AdaptiveVsyncEnable,%REG_DWORD%, 0' | Out-File $inffile

echo 'Made changes from PHDGD drivers'

echo 'Completed all mods, exit this window and install the new drivers'
pause
