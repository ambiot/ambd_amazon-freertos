::User set constant
set IARDir=C:\Program Files (x86)\IAR Systems\Embedded Workbench 8.1
set IARProjectDir=C:\working\github\ambd_amazon-freertos\projects\realtek\amebaD\IAR\aws_tests

::build command
"%IARDir%\common\bin\IarBuild.exe" %IARProjectDir%\km0_bootloader.ewp Debug

ping 127.0.0.1 -n 5 -w 1000

"%IARDir%\common\bin\IarBuild.exe" %IARProjectDir%\km0_application.ewp Debug

ping 127.0.0.1 -n 5 -w 1000

"%IARDir%\common\bin\IarBuild.exe" %IARProjectDir%\km4_bootloader.ewp is

ping 127.0.0.1 -n 5 -w 1000

"%IARDir%\common\bin\IarBuild.exe" %IARProjectDir%\km4_application.ewp is

ping 127.0.0.1 -n 5 -w 1000

