$host.ui.RawUI.WindowTitle = "AutoMod for Intel iGPU"
(gc iigd_dch.inf).replace('INF for the Intel Corporation graphics adapter.', 'INF for the Intel Corporation graphics adapter, modded by iGPU AutoMod') | Set-Content iigd_dch.inf


#Change max mem config
(gc iigd_dch.inf) -replace 'MaximumDeviceMemoryConfiguration = 512', 'MaximumDeviceMemoryConfiguration = 2048' | Out-File iigd_dch.inf
echo 'MaximumDeviceMemoryConfiguration = 512 --> 2048'

#Maximium Power Plan
(gc iigd_dch.inf) -replace '%AC%, 1', '%AC%, 2' | Out-File iigd_dch.inf
(gc iigd_dch.inf) -replace '%AC%, 0', '%AC%, 2' | Out-File iigd_dch.inf
(gc iigd_dch.inf) -replace '%DC%, 1', '%DC%, 2' | Out-File iigd_dch.inf
(gc iigd_dch.inf) -replace '%DC%, 0', '%DC%, 2' | Out-File iigd_dch.inf
echo 'Maximum power configuration'

#Stolen from a PHDGD drivers
(gc iigd_dch.inf) -replace 'HKR,, IncreaseFixedSegment,%REG_DWORD%, 0', 'HKR,, IncreaseFixedSegment,%REG_DWORD%, 1' | Out-File iigd_dch.inf
(gc iigd_dch.inf) -replace 'HKR,, TotalStaticModes, %REG_DWORD%, 2', 'HKR,, TotalStaticModes, %REG_DWORD%,0' | Out-File iigd_dch.inf

echo 'Made changes from PHDGD drivers'
pause
