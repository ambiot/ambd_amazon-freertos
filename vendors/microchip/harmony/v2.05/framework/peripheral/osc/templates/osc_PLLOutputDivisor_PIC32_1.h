/*******************************************************************************
  OSC Peripheral Library Template Implementation

  File Name:
    osc_PLLOutputDivisor_PIC32_1.h

  Summary:
    OSC PLIB Template Implementation

  Description:
    This header file contains template implementations
    For Feature : PLLOutputDivisor
    and its Variant : PIC32_1
    For following APIs :
        PLIB_OSC_ExistsSysPLLOutputDivisor
        PLIB_OSC_SysPLLOutputDivisorSet
        PLIB_OSC_SysPLLOutputDivisorGet

*******************************************************************************/

//DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
*******************************************************************************/

//DOM-IGNORE-END

#ifndef _OSC_PLLOUTPUTDIVISOR_PIC32_1_H
#define _OSC_PLLOUTPUTDIVISOR_PIC32_1_H

//******************************************************************************
/* Function :  OSC_ExistsSysPLLOutputDivisor_PIC32_1

  Summary:
    Implements PIC32_1 variant of PLIB_OSC_ExistsSysPLLOutputDivisor

  Description:
    This template implements the PIC32_1 variant of the PLIB_OSC_ExistsSysPLLOutputDivisor function.
*/

#define PLIB_OSC_ExistsSysPLLOutputDivisor PLIB_OSC_ExistsSysPLLOutputDivisor
PLIB_TEMPLATE bool OSC_ExistsSysPLLOutputDivisor_PIC32_1( OSC_MODULE_ID index )
{
    return true;
}


//******************************************************************************
/* Function :  OSC_SysPLLOutputDivisorSet_PIC32_1

  Summary:
    Implements PIC32_1 variant of PLIB_OSC_SysPLLOutputDivisorSet 

  Description:
    This template implements the PIC32_1 variant of the PLIB_OSC_SysPLLOutputDivisorSet function.
*/

PLIB_TEMPLATE void OSC_SysPLLOutputDivisorSet_PIC32_1( OSC_MODULE_ID index , OSC_SYSPLL_OUT_DIV PLLOutDiv )
{
    OSCCONbits.PLLODIV = PLLOutDiv;
}


//******************************************************************************
/* Function :  OSC_SysPLLOutputDivisorGet_PIC32_1

  Summary:
    Implements PIC32_1 variant of PLIB_OSC_SysPLLOutputDivisorGet 

  Description:
    This template implements the PIC32_1 variant of the PLIB_OSC_SysPLLOutputDivisorGet function.
*/

PLIB_TEMPLATE uint16_t OSC_SysPLLOutputDivisorGet_PIC32_1( OSC_MODULE_ID index )
{
    uint16_t returnValue;

    if ( OSCCONbits.PLLODIV != 7u )
    {
        returnValue = ( 0x01u << (OSCCONbits.PLLODIV) );
    }
    else
    {
        returnValue = 256u;
    }

    return returnValue;
}


#endif /*_OSC_PLLOUTPUTDIVISOR_PIC32_1_H*/

/******************************************************************************
 End of File
*/

