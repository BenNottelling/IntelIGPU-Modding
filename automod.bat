@echo off
title AutoMod for Intel iGPU
::Change max mem config
powershell -Command "(gc iigd_dch.inf) -replace 'MaximumDeviceMemoryConfiguration = 512', 'MaximumDeviceMemoryConfiguration = 2048' | Out-File iigd_dch.inf"
echo MaximumDeviceMemoryConfiguration = 512 --> 2048

::Maximium Power Plan
powershell -Command "(gc iigd_dch.inf) -replace '%AC%, 0', '%AC%, 2' | Out-File iigd_dch.inf"
powershell -Command "(gc iigd_dch.inf) -replace '%AC%, 2', '%AC%, 2' | Out-File iigd_dch.inf"
powershell -Command "(gc iigd_dch.inf) -replace '%DC%, 0', '%AC%, 2' | Out-File iigd_dch.inf"
powershell -Command "(gc iigd_dch.inf) -replace '%DC%, 2', '%AC%, 2' | Out-File iigd_dch.inf"
echo Maximum power configuration

::Stolen from a PHDGD skylake driver
powershell -Command "(gc iigd_dch.inf) -replace 'HKR,, IncreaseFixedSegment,%REG_DWORD%, 0', 'HKR,, IncreaseFixedSegment,%REG_DWORD%, 1' | Out-File iigd_dch.inf"
echo Made changes from PHDGD drivers
pause
