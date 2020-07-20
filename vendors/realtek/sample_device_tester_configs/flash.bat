::User set constant
set ProjectRoot="C:\working\github\ambd_amazon-freertos"
set FlashToolDir="%ProjectRoot%\vendors\realtek\tools\1-10_MP_Image_Tool_Release"
set tooldir="%ProjectRoot%\vendors\realtek\sdk\amebaD\component\soc\realtek\amebad\misc\iar_utility\common\tools"
set RootDir=%CD%

@echo off

for /f "delims=" %%i in ('cmd /c "%tooldir%\grep CONFIG_OTA_UPDATE_DEMO_ENABLED %ProjectRoot%\vendors\realtek\boards\amebaD\aws_demos\config_files\aws_demo_config.h | %tooldir%\grep -v "//" | %tooldir%\grep define | %tooldir%\gawk -F " " '{print $NF}'"') do set OTA=%%i

if "%OTA%"=="CONFIG_OTA_UPDATE_DEMO_ENABLED" (
    set ImagePath_km0="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_demos\Debug\Exe\km0_image"
    set ImagePath_km4="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_demos\Debug\Exe\km4_image"
) else (
    set ImagePath_km0="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_tests\Debug\Exe\km0_image"
    set ImagePath_km4="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_tests\Debug\Exe\km4_image"
)

::Delay 3 seconds
ping 127.0.0.1 -n 3 -w 1000

cd %FlashToolDir%

%FlashToolDir%\1-10_MP_Image_Tool.exe -scan device
%FlashToolDir%\1-10_MP_Image_Tool.exe -add device COM4
%FlashToolDir%\1-10_MP_Image_Tool.exe -set chip amebad
%FlashToolDir%\1-10_MP_Image_Tool.exe -set skipsys true
%FlashToolDir%\1-10_MP_Image_Tool.exe -set verify true
%FlashToolDir%\1-10_MP_Image_Tool.exe -set baudrate 1500000
%FlashToolDir%\1-10_MP_Image_Tool.exe -set boot false

:: km0 bootloader
%FlashToolDir%\1-10_MP_Image_Tool.exe -set image %ImagePath_km0%\km0_boot_all.bin
%FlashToolDir%\1-10_MP_Image_Tool.exe -erase 0x08000000 4 COM4
%FlashToolDir%\1-10_MP_Image_Tool.exe -set address 0x08000000
%FlashToolDir%\1-10_MP_Image_Tool.exe -set length 0x0
%FlashToolDir%\1-10_MP_Image_Tool.exe -download COM4

ping 127.0.0.1 -n 5 -w 1000

:: km4_bootloader
%FlashToolDir%\1-10_MP_Image_Tool.exe -set image %ImagePath_km4%\km4_boot_all.bin
%FlashToolDir%\1-10_MP_Image_Tool.exe -erase 0x08004000 8 COM4
%FlashToolDir%\1-10_MP_Image_Tool.exe -set address 0x08004000
%FlashToolDir%\1-10_MP_Image_Tool.exe -set length 0x0
%FlashToolDir%\1-10_MP_Image_Tool.exe -download COM4

ping 127.0.0.1 -n 5 -w 1000

if "%OTA%"=="CONFIG_OTA_UPDATE_DEMO_ENABLED" (
    :: Clean user setting, avoid aws ota in unexpect state
    %FlashToolDir%\1-10_MP_Image_Tool.exe -erase 0x08101000 4 COM4
    ping 127.0.0.1 -n 3 -w 1000
)

:: FW1
::%FlashToolDir%\1-10_MP_Image_Tool.exe -set boot true
::%FlashToolDir%\1-10_MP_Image_Tool.exe -erase 0x08006000 778 COM4
::%FlashToolDir%\1-10_MP_Image_Tool.exe -set image %ImagePath_km4%\km0_km4_image2.bin
::%FlashToolDir%\1-10_MP_Image_Tool.exe -set address 0x08006000
::%FlashToolDir%\1-10_MP_Image_Tool.exe -set length 0x0
::%FlashToolDir%\1-10_MP_Image_Tool.exe -download COM4

ping 127.0.0.1 -n 5 -w 1000

:: FW2
%FlashToolDir%\1-10_MP_Image_Tool.exe -set boot true
%FlashToolDir%\1-10_MP_Image_Tool.exe -erase 0x08106000 778 COM4
%FlashToolDir%\1-10_MP_Image_Tool.exe -set image %ImagePath_km4%\km0_km4_image2.bin
%FlashToolDir%\1-10_MP_Image_Tool.exe -set address 0x08106000
%FlashToolDir%\1-10_MP_Image_Tool.exe -set length 0x0
%FlashToolDir%\1-10_MP_Image_Tool.exe -download COM4

cd %RootDir%

::Delay 1 seconds
ping 127.0.0.1 -n 1 -w 1000
