::#!/bin/bash

::Use the sign.sh script if you select custom code signing for OTA tests.

::openssl dgst -sha256 -sign C:/<absolute-path-to>/<privare-key-file> -out C:/<absolute-path-to>/<signature-destination> %1
::openssl base64 -A -in C:/<absolute-path-to>/<signature-destination> -out %2

set exepath="C:\Program Files\OpenSSL-Win64\bin\openssl.exe"
set ProjectRoot="C:\working\github\ambd_amazon-freertos"

set keypath="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_demos\ecdsa-sha256-signer.key.pem"
set outsha256="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_demos\Debug\Exe\km4_image\km0_km4_image2_sig.bin"
set image2="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_demos\Debug\Exe\km4_image\km0_km4_image2.bin"
set outsignature="%ProjectRoot%\projects\realtek\amebaD\IAR\aws_demos\Debug\Exe\km4_image\IDT-OTA-Signature"

@echo off

%exepath% dgst -sha256 -sign %keypath% -out %outsha256% %1
%exepath% base64 -A -in %outsha256% -out %2

ping 127.0.0.1 -n 3 -w 1000

%exepath% dgst -sha256 -sign %keypath% -out %outsha256% %image2%
%exepath% base64 -A -in %outsha256% -out %outsignature%

ping 127.0.0.1 -n 5 -w 1000

::pause