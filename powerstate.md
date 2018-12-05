# This is the default powerstate config as seen within the graphics INF file.

Value = 0, %Maximum_Battery_Life%, %Maximum_Battery%, %REG_DWORD%, 0
Value = 1, %Balanced%, %Balanced%, %REG_DWORD%, 1
Value = 2, %Maximum_Performance%, %Maximum_Performance%, %REG_DWORD%, 2

Default = %GUID_MAX_POWER_SAVINGS%, %AC%, 0
Default = %GUID_MAX_POWER_SAVINGS%, %DC%, 0
Default = %GUID_TYPICAL_POWER_SAVINGS%, %AC%, 1
Default = %GUID_TYPICAL_POWER_SAVINGS%, %DC%, 1
Default = %GUID_MIN_POWER_SAVINGS%, %AC%, 2
Default = %GUID_MIN_POWER_SAVINGS%, %DC%, 2

Value **0** is going to be your worst perfoming setting, **1** is in the middle, and **2** should perform best, so, this change should give the best performance at all levels:

Default = %GUID_MAX_POWER_SAVINGS%, %AC%, 2
Default = %GUID_MAX_POWER_SAVINGS%, %DC%, 2
Default = %GUID_TYPICAL_POWER_SAVINGS%, %AC%, 2
Default = %GUID_TYPICAL_POWER_SAVINGS%, %DC%, 2
Default = %GUID_MIN_POWER_SAVINGS%, %AC%, 2
Default = %GUID_MIN_POWER_SAVINGS%, %DC%, 2
