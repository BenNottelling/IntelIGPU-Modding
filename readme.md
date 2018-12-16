# iGPU AutoMod
A small tool to mod iGPU graphics drivers for maximum performance. GitHub repository is a mess that will be cleaned up, instructions are on the website 

## Supported Hardware
 - Currently only Intel iGPUs are supported (CPU Generation 6-9, EG i5 6600K - i5 9600k, not limited to i5 only)
 - **PLEASE** - Only use only pre-dch driver releases! They are SHIT for modding and even at stock will result in less performance than your hardware is capable of! Download the [Latest Official Pre-DCH Driver](https://downloadcenter.intel.com/download/27199/Intel-Graphics-Driver-for-Windows-15-47-?product=126789) or [TENSOR™ Driver (Currently Pre-DCH)](https://imo32.weebly.com) or [100.6373 WHQL on Tousles Drivers](https://www.touslesdrivers.com/index.php?v_page=23&v_code=59248) <-- Best to download imo

## What Does it Change?
 - Forces maximum power configuration (Laptop users should see a difference here)
 - Changes the maximum VRAM limit to 1GB (from 512MB). Please note, this won't change anything but allow some games with VRAM limits to open
 - Disable adaptive V-SYNC to "improve performance on games" (found in IntelliModder32's [TENSOR™ Driver](https://imo32.weebly.com))
 - Hides the optimal resolution notification when you play non-native resolutions (I find this annoying)
 - Hides promotions in the graphics panel (Why do we need ads on something we paid for)
 - Can modify the device ID strings to help provide a performance improvement
Official website: http://igpumods.weebly.com/
