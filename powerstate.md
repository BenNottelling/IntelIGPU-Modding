# These are the powerstate ID's as seen within the graphics INF file.

GUID_MAX_POWER_SAVINGS = "{a1841308-3541-4fab-bc81-f71556f20b4a}"

GUID_TYPICAL_POWER_SAVINGS = "{381b4222-f694-41f0-9685-ff5bb260df2e}"

GUID_MIN_POWER_SAVINGS = "{8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c}"


These names sugest that **{8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c}** would be ideal for the highest performance (minimum power saving)
So, it's untested, but this would likely be ideal for performance (sets the drivers in maximum performace out of the box):

GUID_MAX_POWER_SAVINGS = "{8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c}"

GUID_TYPICAL_POWER_SAVINGS = "{8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c}"

GUID_MIN_POWER_SAVINGS = "{8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c}"
