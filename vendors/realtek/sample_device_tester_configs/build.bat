::User set constant
set IARDir=C:\Program Files (x86)\IAR Systems\Embedded Workbench 8.1
set ProjectRoot="C:\working\github\ambd_amazon-freertos"

set testProjectDir="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_tests"
set demoProjectDir="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_demos"

set tooldir="%ProjectRoot%\vendors\realtek\sdk\amebaD\component\soc\realtek\amebad\misc\iar_utility\common\tools"
set currentDir=%CD%

@echo off

for /f "delims=" %%i in ('cmd /c "%tooldir%\grep CONFIG_OTA_UPDATE_DEMO_ENABLED %ProjectRoot%\vendors\realtek\boards\amebaD\aws_demos\config_files\aws_demo_config.h | %tooldir%\grep -v "//" | %tooldir%\grep define | %tooldir%\gawk -F " " '{print $NF}'"') do set OTA=%%i

if "%OTA%"=="CONFIG_OTA_UPDATE_DEMO_ENABLED" (
    ::km0_boot.bin
    "%IARDir%\common\bin\IarBuild.exe" %demoProjectDir%\km0_bootloader.ewp Debug
    ping 127.0.0.1 -n 8 -w 1000

    ::km0_image2_all.bin
    "%IARDir%\common\bin\IarBuild.exe" %demoProjectDir%\km0_application.ewp Debug
    ping 127.0.0.1 -n 8 -w 1000

    ::km4_boot.bin
    "%IARDir%\common\bin\IarBuild.exe" %demoProjectDir%\km4_bootloader.ewp is
    ping 127.0.0.1 -n 8 -w 1000

    ::km4_image2_all.bin
    "%IARDir%\common\bin\IarBuild.exe" %demoProjectDir%\km4_application.ewp is
    
    ::wait combine km0_km4_image2.bin
    ping 127.0.0.1 -n 15 -w 1000

    ::output OTA_ALL_sig.bin
    cd %demoProjectDir%
    python python_custom_ecdsa_D.py
    cd %currentDir%
) else (
    ::km0_boot.bin
    "%IARDir%\common\bin\IarBuild.exe" %testProjectDir%\km0_bootloader.ewp Debug
    ping 127.0.0.1 -n 5 -w 1000

    ::km0_image2_all.bin
    "%IARDir%\common\bin\IarBuild.exe" %testProjectDir%\km0_application.ewp Debug
    ping 127.0.0.1 -n 5 -w 1000

    ::km4_boot.bin
    "%IARDir%\common\bin\IarBuild.exe" %testProjectDir%\km4_bootloader.ewp is
    ping 127.0.0.1 -n 5 -w 1000

    ::km4_image2_all.bin
    "%IARDir%\common\bin\IarBuild.exe" %testProjectDir%\km4_application.ewp is

    ::wait combine km0_km4_image2.bin
    ping 127.0.0.1 -n 15 -w 1000
)


