<#--
/*******************************************************************************
  I2C Driver Freemarker Template File

  Company:
    Microchip Technology Inc.

  File Name:
    drv_i2c.h.ftl

  Summary:
    I2C Driver Freemarker Template File

  Description:

*******************************************************************************/

/*******************************************************************************
Copyright (c) 2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED AS IS  WITHOUT  WARRANTY  OF  ANY  KIND,
EITHER EXPRESS  OR  IMPLIED,  INCLUDING  WITHOUT  LIMITATION,  ANY  WARRANTY  OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A  PARTICULAR  PURPOSE.
IN NO EVENT SHALL MICROCHIP OR  ITS  LICENSORS  BE  LIABLE  OR  OBLIGATED  UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION,  BREACH  OF  WARRANTY,  OR
OTHER LEGAL  EQUITABLE  THEORY  ANY  DIRECT  OR  INDIRECT  DAMAGES  OR  EXPENSES
INCLUDING BUT NOT LIMITED TO ANY  INCIDENTAL,  SPECIAL,  INDIRECT,  PUNITIVE  OR
CONSEQUENTIAL DAMAGES, LOST  PROFITS  OR  LOST  DATA,  COST  OF  PROCUREMENT  OF
SUBSTITUTE  GOODS,  TECHNOLOGY,  SERVICES,  OR  ANY  CLAIMS  BY  THIRD   PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE  THEREOF),  OR  OTHER  SIMILAR  COSTS.
*******************************************************************************/
-->
<#if CONFIG_USE_DRV_I2C == true>
<#if CONFIG_DRV_I2C_DRIVER_MODE == "DYNAMIC">
// *****************************************************************************
/* I2C Driver Configuration Options
*/
<#-- includes bit-bang code only if Bit-bang was selected -->
<#-- selection included so that older non bit-bang projects neednt be regenerated -->
<#if CONFIG_DRV_I2C_BB_USED == true>
#define BB_ENABLED
</#if>
<#-- include scl and sda ports and pin position  -->
<#--  if older version of errata to reset module is selected port and pin selections not used -->
<#if CONFIG_DRV_I2C_MZEC_ERRATA_CHOICE == "MZ_EC_ERRATA_25_BIT_BANG_STOP">
#define MZ_EC_ERRATA_25_BB_STOP
</#if>
<#if CONFIG_DRV_I2C_INTERRUPT_MODE == true>
#define DRV_I2C_INTERRUPT_MODE                    		true
<#else>
#define DRV_I2C_INTERRUPT_MODE                    		false
</#if>
#define DRV_I2C_CLIENTS_NUMBER                    		${CONFIG_DRV_I2C_CLIENTS_NUMBER}
#define DRV_I2C_INSTANCES_NUMBER                  		${CONFIG_DRV_I2C_INSTANCES_NUMBER}
<#-- Instance 0 -->
<#if CONFIG_DRV_I2C_INST_IDX0 == true>

#define DRV_I2C_PERIPHERAL_ID_IDX0                		${CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0}
#define DRV_I2C_OPERATION_MODE_IDX0               		${CONFIG_DRV_I2C_OPERATION_MODE_IDX0}
<#if CONFIG_DEVICE == "PIC32MZ0512ECE064" || CONFIG_DEVICE == "PIC32MZ0512ECF064" || CONFIG_DEVICE == "PIC32MZ0512ECK064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECG064" || CONFIG_DEVICE == "PIC32MZ1024ECH064" || CONFIG_DEVICE == "PIC32MZ1024ECM064"
	|| CONFIG_DEVICE == "PIC32MZ2048ECG064" || CONFIG_DEVICE == "PIC32MZ2048ECH064" || CONFIG_DEVICE == "PIC32MZ2048ECM064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECE064" || CONFIG_DEVICE == "PIC32MZ1024ECF064" || CONFIG_DEVICE == "PIC32MZ1024ECK064"
	|| CONFIG_DEVICE == "PIC32MZ0512EFE064" || CONFIG_DEVICE == "PIC32MZ0512EFF064" || CONFIG_DEVICE == "PIC32MZ0512EFK064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFG064" || CONFIG_DEVICE == "PIC32MZ1024EFH064" || CONFIG_DEVICE == "PIC32MZ1024EFM064"
	|| CONFIG_DEVICE == "PIC32MZ2048EFG064" || CONFIG_DEVICE == "PIC32MZ2048EFH064" || CONFIG_DEVICE == "PIC32MZ2048EFM064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFE064" || CONFIG_DEVICE == "PIC32MZ1024EFF064" || CONFIG_DEVICE == "PIC32MZ1024EFK064" >
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_10
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_9
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_3">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_3
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_2
</#if>
<#elseif CONFIG_DEVICE == "PIC32WK2057GPB132" || CONFIG_DEVICE == "PIC32WK2057GPB132">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_6
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_7
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_4
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_5
</#if>
<#elseif CONFIG_DEVICE == "PIC32MX330F064H" || CONFIG_DEVICE == "PIC32MX350F128H" ||
         CONFIG_DEVICE == "PIC32MX350F256H" || CONFIG_DEVICE == "PIC32MX370F512H">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_2
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_3
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_F
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_5
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_F
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_4
</#if>
<#elseif CONFIG_DEVICE == "PIC32MX430F064H" || CONFIG_DEVICE == "PIC32MX450F128H" ||
         CONFIG_DEVICE == "PIC32MX450F256H" || CONFIG_DEVICE == "PIC32MX470F512H">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_9
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_10
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_F
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_5
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_F
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_4
</#if>
<#elseif CONFIG_DEVICE == "PIC32MX330F064L" || CONFIG_DEVICE == "PIC32MX350F128L" ||
         CONFIG_DEVICE == "PIC32MX350F256L" || CONFIG_DEVICE == "PIC32MX370F512L">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_2
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_3
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_2
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_3
</#if>
<#elseif CONFIG_DEVICE == "PIC32MX430F064L" || CONFIG_DEVICE == "PIC32MX450F128L" ||
         CONFIG_DEVICE == "PIC32MX450F256L" || CONFIG_DEVICE == "PIC32MX470F512L">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_14
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_15
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_2
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_3
</#if>
<#elseif CONFIG_DEVICE == "PIC32MK1024GPE100" || CONFIG_DEVICE == "PIC32MK1024GPD100" ||
         CONFIG_DEVICE == "PIC32MK0512GPE100" || CONFIG_DEVICE == "PIC32MK0512GPD100" ||
         CONFIG_DEVICE == "PIC32MK1024MCF100" || CONFIG_DEVICE == "PIC32MK0512MCF100" ||
         CONFIG_DEVICE == "PIC32MK1024MCF64"  || CONFIG_DEVICE == "PIC32MK0512MCF64"  ||
         CONFIG_DEVICE == "PIC32MK1024GPE64"  || CONFIG_DEVICE == "PIC32MK1024GPD64"  ||
         CONFIG_DEVICE == "PIC32MK0512GPE64"  || CONFIG_DEVICE == "PIC32MK0512GPD64">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_7
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_8
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_E
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_13
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_E
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_12
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_3">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_B
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_4
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_8
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX0 == "I2C_ID_4">
#define DRV_SCL_PORT_IDX0                               PORT_CHANNEL_B
#define DRV_SCL_PIN_POSITION_IDX0                       PORTS_BIT_POS_6
#define DRV_SDA_PORT_IDX0                               PORT_CHANNEL_B
#define DRV_SDA_PIN_POSITION_IDX0                       PORTS_BIT_POS_5
</#if>
<#else>
#define DRV_SCL_PORT_IDX0                               ${CONFIG_DRV_SCL_PORT_IDX0}
#define DRV_SCL_PIN_POSITION_IDX0                       ${CONFIG_DRV_SCL_PIN_POSITION_IDX0}
#define DRV_SDA_PORT_IDX0                               ${CONFIG_DRV_SDA_PORT_IDX0}
#define DRV_SDA_PIN_POSITION_IDX0                       ${CONFIG_DRV_SDA_PIN_POSITION_IDX0}
</#if>
<#if CONFIG_DRV_I2C_BIT_BANG_IDX0 == true>
#define DRV_I2C_BIT_BANG_IDX0                           true
#define DRV_I2C_BIT_BANG_BAUD_RATE_IDX0                 ${CONFIG_DRV_I2C_BIT_BANG_BAUD_RATE_IDX0}
#define DRV_I2C_BIT_BANG_TMR_MODULE_IDX0                ${CONFIG_DRV_I2C_BIT_BANG_TMR_MODULE_IDX0}
#define DRV_I2C_BIT_BANG_INT_SRC_IDX0                   ${CONFIG_DRV_I2C_BIT_BANG_INT_SRC_IDX0}
<#else>
#define DRV_I2C_BIT_BANG_IDX0                           false
</#if>
<#if CONFIG_DRV_I2C_STOP_IN_IDLE_IDX0 == true>
#define DRV_I2C_STOP_IN_IDLE_IDX0                       true
<#else>
#define DRV_I2C_STOP_IN_IDLE_IDX0                       false
</#if>
<#if CONFIG_DRV_I2C_SMBus_SPECIFICATION_IDX0 == true>
#define DRV_I2C_SMBus_SPECIFICATION_IDX0                true
<#else>
#define DRV_I2C_SMBus_SPECIFICATION_IDX0			    false
</#if>
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX0 == "DRV_I2C_MODE_MASTER">
#define DRV_I2C_BAUD_RATE_IDX0                    		${CONFIG_DRV_I2C_BAUD_RATE_IDX0}
#define DRV_I2C_BRG_CLOCK_IDX0	                  		${CONFIG_DRV_I2C_BRG_CLOCK_IDX0}
<#if CONFIG_DRV_I2C_SLEW_RATE_CONTROL_IDX0 == true>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX0      			true
<#else>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX0      			false
</#if>
<#else>
#define DRV_I2C_ADDRESS_WIDTH_IDX0                      ${CONFIG_DRV_I2C_ADDRESS_WIDTH_IDX0}
<#if CONFIG_DRV_I2C_STRICT_ADDRESS_RULE_IDX0 == true>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX0                true
<#else>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX0     			false
</#if>
<#if CONFIG_DRV_I2C_GENERAL_CALL_ADDRESS_IDX0 == true>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX0   			true
<#else>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX0   			false
</#if>
<#if CONFIG_DRV_I2C_CLOCK_STRETCH_IDX0 == true>
#define DRV_I2C_CLOCK_STRETCH_IDX0                      true
<#else>
#define DRV_I2C_CLOCK_STRETCH_IDX0                      false
</#if>
#define DRV_I2C_SLAVE_ADDRESS_MASK_IDX0                 ${CONFIG_DRV_I2C_SLAVE_ADDRESS_MASK_IDX0}
#define DRV_I2C_SLAVE_ADDRESS_VALUE_IDX0                ${CONFIG_DRV_I2C_SLAVE_ADDRESS_VALUE_IDX0}
</#if>
<#if CONFIG_DRV_I2C_BIT_BANG_IDX0 == false>
#define DRV_I2C_MASTER_INT_SRC_IDX0               		${CONFIG_DRV_I2C_MASTER_INT_SRC_IDX0}
#define DRV_I2C_SLAVE_INT_SRC_IDX0                		${CONFIG_DRV_I2C_SLAVE_INT_SRC_IDX0}
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_ERR_MX_INT_SRC_IDX0               		${CONFIG_DRV_I2C_ERR_MX_INT_SRC_IDX0}
<#else>
#define DRV_I2C_ERR_MZ_INT_SRC_IDX0               		${CONFIG_DRV_I2C_ERR_MZ_INT_SRC_IDX0}
</#if>
<#if CONFIG_DRV_I2C_INTERRUPT_MODE == true>
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_INT_VECTOR_IDX0                         ${CONFIG_DRV_I2C_INT_VECTOR_IDX0}
#define DRV_I2C_ISR_VECTOR_IDX0                         ${CONFIG_DRV_I2C_ISR_VECTOR_IDX0}
#define DRV_I2C_INT_PRIORITY_IDX0                 		${CONFIG_DRV_I2C_INT_PRIORITY_IDX0}
#define DRV_I2C_INT_SUB_PRIORITY_IDX0             		${CONFIG_DRV_I2C_INT_SUB_PRIORITY_IDX0}
<#else>
#define DRV_I2C_MASTER_INT_VECTOR_IDX0            		${CONFIG_DRV_I2C_MASTER_INT_VECTOR_IDX0}
#define DRV_I2C_MASTER_ISR_VECTOR_IDX0                  ${CONFIG_DRV_I2C_MASTER_ISR_VECTOR_IDX0}
#define DRV_I2C_MASTER_INT_PRIORITY_IDX0          		${CONFIG_DRV_I2C_MASTER_INT_PRIORITY_IDX0}
#define DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX0      		${CONFIG_DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX0}
#define DRV_I2C_SLAVE_INT_VECTOR_IDX0             		${CONFIG_DRV_I2C_SLAVE_INT_VECTOR_IDX0}
#define DRV_I2C_SLAVE_ISR_VECTOR_IDX0			  	    ${CONFIG_DRV_I2C_SLAVE_ISR_VECTOR_IDX0}
#define DRV_I2C_SLAVE_INT_PRIORITY_IDX0           		${CONFIG_DRV_I2C_SLAVE_INT_PRIORITY_IDX0}
#define DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX0       		${CONFIG_DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX0}
#define DRV_I2C_ERR_INT_VECTOR_IDX0               		${CONFIG_DRV_I2C_ERR_INT_VECTOR_IDX0}
#define DRV_I2C_ERR_ISR_VECTOR_IDX0                     ${CONFIG_DRV_I2C_ERR_ISR_VECTOR_IDX0}
#define DRV_I2C_ERR_INT_PRIORITY_IDX0             		${CONFIG_DRV_I2C_ERR_INT_PRIORITY_IDX0}
#define DRV_I2C_ERR_INT_SUB_PRIORITY_IDX0         		${CONFIG_DRV_I2C_ERR_INT_SUB_PRIORITY_IDX0}
</#if>
</#if>
</#if>
#define DRV_I2C_POWER_STATE_IDX0                  		${CONFIG_DRV_I2C_POWER_STATE_IDX0}
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX0 == "DRV_I2C_MODE_SLAVE">
#define DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX0            ${CONFIG_DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX0}
</#if>
</#if>
<#-- Instance 1 -->
<#if CONFIG_DRV_I2C_INST_IDX1 == true>

#define DRV_I2C_PERIPHERAL_ID_IDX1                      ${CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1}
#define DRV_I2C_OPERATION_MODE_IDX1                     ${CONFIG_DRV_I2C_OPERATION_MODE_IDX1}
<#if CONFIG_DEVICE == "PIC32MZ0512ECE064" || CONFIG_DEVICE == "PIC32MZ0512ECF064" || CONFIG_DEVICE == "PIC32MZ0512ECK064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECG064" || CONFIG_DEVICE == "PIC32MZ1024ECH064" || CONFIG_DEVICE == "PIC32MZ1024ECM064"
	|| CONFIG_DEVICE == "PIC32MZ2048ECG064" || CONFIG_DEVICE == "PIC32MZ2048ECH064" || CONFIG_DEVICE == "PIC32MZ2048ECM064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECE064" || CONFIG_DEVICE == "PIC32MZ1024ECF064" || CONFIG_DEVICE == "PIC32MZ1024ECK064"
	|| CONFIG_DEVICE == "PIC32MZ0512EFE064" || CONFIG_DEVICE == "PIC32MZ0512EFF064" || CONFIG_DEVICE == "PIC32MZ0512EFK064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFG064" || CONFIG_DEVICE == "PIC32MZ1024EFH064" || CONFIG_DEVICE == "PIC32MZ1024EFM064"
	|| CONFIG_DEVICE == "PIC32MZ2048EFG064" || CONFIG_DEVICE == "PIC32MZ2048EFH064" || CONFIG_DEVICE == "PIC32MZ2048EFM064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFE064" || CONFIG_DEVICE == "PIC32MZ1024EFF064" || CONFIG_DEVICE == "PIC32MZ1024EFK064" >
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_10
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_9
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_3">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_3
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_2
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_4">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_8
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_7
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_5">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_F
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_5
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_F
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_4
</#if>
<#elseif CONFIG_DEVICE == "PIC32WK2057GPB132" || CONFIG_DEVICE == "PIC32WK2057GPB132">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_6
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_7
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_4
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_5
</#if>
<#elseif CONFIG_DEVICE == "PIC32MX330F064H" || CONFIG_DEVICE == "PIC32MX350F128H" ||
         CONFIG_DEVICE == "PIC32MX350F256H" || CONFIG_DEVICE == "PIC32MX370F512H">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_2
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_3
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_F
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_5
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_F
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_4
</#if>
<#elseif CONFIG_DEVICE == "PIC32MX430F064H" || CONFIG_DEVICE == "PIC32MX450F128H" ||
         CONFIG_DEVICE == "PIC32MX450F256H" || CONFIG_DEVICE == "PIC32MX470F512H">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_9
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_10
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_F
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_5
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_F
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_4
</#if>
<#elseif CONFIG_DEVICE == "PIC32MX330F064L" || CONFIG_DEVICE == "PIC32MX350F128L" ||
         CONFIG_DEVICE == "PIC32MX350F256L" || CONFIG_DEVICE == "PIC32MX370F512L">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_2
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_3
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_2
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_3
</#if>
<#elseif CONFIG_DEVICE == "PIC32MX430F064L" || CONFIG_DEVICE == "PIC32MX450F128L" ||
         CONFIG_DEVICE == "PIC32MX450F256L" || CONFIG_DEVICE == "PIC32MX470F512L">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_14
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_15
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_2
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_3
</#if>
<#elseif CONFIG_DEVICE == "PIC32MK1024GPE100" || CONFIG_DEVICE == "PIC32MK1024GPD100" ||
         CONFIG_DEVICE == "PIC32MK0512GPE100" || CONFIG_DEVICE == "PIC32MK0512GPD100" ||
         CONFIG_DEVICE == "PIC32MK1024MCF100" || CONFIG_DEVICE == "PIC32MK0512MCF100" ||
         CONFIG_DEVICE == "PIC32MK1024MCF64"  || CONFIG_DEVICE == "PIC32MK0512MCF64"  ||
         CONFIG_DEVICE == "PIC32MK1024GPE64"  || CONFIG_DEVICE == "PIC32MK1024GPD64"  ||
         CONFIG_DEVICE == "PIC32MK0512GPE64"  || CONFIG_DEVICE == "PIC32MK0512GPD64">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_7
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_8
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_E
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_13
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_E
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_12
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_3">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_B
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_4
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_8
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX1 == "I2C_ID_4">
#define DRV_SCL_PORT_IDX1                               PORT_CHANNEL_B
#define DRV_SCL_PIN_POSITION_IDX1                       PORTS_BIT_POS_6
#define DRV_SDA_PORT_IDX1                               PORT_CHANNEL_B
#define DRV_SDA_PIN_POSITION_IDX1                       PORTS_BIT_POS_5
</#if>
<#else>
#define DRV_SCL_PORT_IDX1                               ${CONFIG_DRV_SCL_PORT_IDX1}
#define DRV_SCL_PIN_POSITION_IDX1                       ${CONFIG_DRV_SCL_PIN_POSITION_IDX1}
#define DRV_SDA_PORT_IDX1                               ${CONFIG_DRV_SDA_PORT_IDX1}
#define DRV_SDA_PIN_POSITION_IDX1                       ${CONFIG_DRV_SDA_PIN_POSITION_IDX1}
</#if>
<#if CONFIG_DRV_I2C_BIT_BANG_IDX1 == true>
#define DRV_I2C_BIT_BANG_IDX1                           true
#define DRV_I2C_BIT_BANG_BAUD_RATE_IDX1                 ${CONFIG_DRV_I2C_BIT_BANG_BAUD_RATE_IDX1}
#define DRV_I2C_BIT_BANG_TMR_MODULE_IDX1                ${CONFIG_DRV_I2C_BIT_BANG_TMR_MODULE_IDX1}
#define DRV_I2C_BIT_BANG_INT_SRC_IDX1                   ${CONFIG_DRV_I2C_BIT_BANG_INT_SRC_IDX1}
<#else>
#define DRV_I2C_BIT_BANG_IDX1                           false
</#if>
<#if CONFIG_DRV_I2C_STOP_IN_IDLE_IDX1 == true>
#define DRV_I2C_STOP_IN_IDLE_IDX1                       true
<#else>
#define DRV_I2C_STOP_IN_IDLE_IDX1                       false
</#if>
<#if CONFIG_DRV_I2C_SMBus_SPECIFICATION_IDX1 == true>
#define DRV_I2C_SMBus_SPECIFICATION_IDX1                true
<#else>
#define DRV_I2C_SMBus_SPECIFICATION_IDX1                false
</#if>
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX1 == "DRV_I2C_MODE_MASTER">
#define DRV_I2C_BAUD_RATE_IDX1                    		${CONFIG_DRV_I2C_BAUD_RATE_IDX1}
#define DRV_I2C_BRG_CLOCK_IDX1	                  		${CONFIG_DRV_I2C_BRG_CLOCK_IDX1}
<#if CONFIG_DRV_I2C_SLEW_RATE_CONTROL_IDX1 == true>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX1                  true
<#else>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX1                  false
</#if>
<#else>
#define DRV_I2C_ADDRESS_WIDTH_IDX1                      ${CONFIG_DRV_I2C_ADDRESS_WIDTH_IDX1}
<#if CONFIG_DRV_I2C_STRICT_ADDRESS_RULE_IDX1 == true>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX1                true
<#else>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX1                false
</#if>
<#if CONFIG_DRV_I2C_GENERAL_CALL_ADDRESS_IDX1 == true>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX1               true
<#else>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX1               false
</#if>
<#if CONFIG_DRV_I2C_CLOCK_STRETCH_IDX1 == true>
#define DRV_I2C_CLOCK_STRETCH_IDX1                      true
<#else>
#define DRV_I2C_CLOCK_STRETCH_IDX1                      false
</#if>
#define DRV_I2C_SLAVE_ADDRESS_MASK_IDX1                 ${CONFIG_DRV_I2C_SLAVE_ADDRESS_MASK_IDX1}
#define DRV_I2C_SLAVE_ADDRESS_VALUE_IDX1                ${CONFIG_DRV_I2C_SLAVE_ADDRESS_VALUE_IDX1}
</#if>

<#if CONFIG_DRV_I2C_BIT_BANG_IDX1 == false>
#define DRV_I2C_MASTER_INT_SRC_IDX1                     ${CONFIG_DRV_I2C_MASTER_INT_SRC_IDX1}
#define DRV_I2C_SLAVE_INT_SRC_IDX1                      ${CONFIG_DRV_I2C_SLAVE_INT_SRC_IDX1}
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_ERR_MX_INT_SRC_IDX1                     ${CONFIG_DRV_I2C_ERR_MX_INT_SRC_IDX1}
<#else>
#define DRV_I2C_ERR_MZ_INT_SRC_IDX1                     ${CONFIG_DRV_I2C_ERR_MZ_INT_SRC_IDX1}
</#if>
<#if CONFIG_DRV_I2C_INTERRUPT_MODE == true>
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_INT_VECTOR_IDX1                         ${CONFIG_DRV_I2C_INT_VECTOR_IDX1}
#define DRV_I2C_ISR_VECTOR_IDX1                         ${CONFIG_DRV_I2C_ISR_VECTOR_IDX1}
#define DRV_I2C_INT_PRIORITY_IDX1                       ${CONFIG_DRV_I2C_INT_PRIORITY_IDX1}
#define DRV_I2C_INT_SUB_PRIORITY_IDX1                   ${CONFIG_DRV_I2C_INT_SUB_PRIORITY_IDX1}
<#else>
#define DRV_I2C_MASTER_INT_VECTOR_IDX1                  ${CONFIG_DRV_I2C_MASTER_INT_VECTOR_IDX1}
#define DRV_I2C_MASTER_ISR_VECTOR_IDX1                  ${CONFIG_DRV_I2C_MASTER_ISR_VECTOR_IDX1}
#define DRV_I2C_MASTER_INT_PRIORITY_IDX1                ${CONFIG_DRV_I2C_MASTER_INT_PRIORITY_IDX1}
#define DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX1            ${CONFIG_DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX1}
#define DRV_I2C_SLAVE_INT_VECTOR_IDX1                   ${CONFIG_DRV_I2C_SLAVE_INT_VECTOR_IDX1}
#define DRV_I2C_SLAVE_ISR_VECTOR_IDX1                   ${CONFIG_DRV_I2C_SLAVE_ISR_VECTOR_IDX1}
#define DRV_I2C_SLAVE_INT_PRIORITY_IDX1           		${CONFIG_DRV_I2C_SLAVE_INT_PRIORITY_IDX1}
#define DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX1       		${CONFIG_DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX1}
#define DRV_I2C_ERR_INT_VECTOR_IDX1               		${CONFIG_DRV_I2C_ERR_INT_VECTOR_IDX1}
#define DRV_I2C_ERR_ISR_VECTOR_IDX1                     ${CONFIG_DRV_I2C_ERR_ISR_VECTOR_IDX1}
#define DRV_I2C_ERR_INT_PRIORITY_IDX1                   ${CONFIG_DRV_I2C_ERR_INT_PRIORITY_IDX1}
#define DRV_I2C_ERR_INT_SUB_PRIORITY_IDX1               ${CONFIG_DRV_I2C_ERR_INT_SUB_PRIORITY_IDX1}
</#if>
</#if>
</#if>
#define DRV_I2C_POWER_STATE_IDX1                        ${CONFIG_DRV_I2C_POWER_STATE_IDX1}
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX1 == "DRV_I2C_MODE_SLAVE">
#define DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX1            ${CONFIG_DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX1}
</#if>
</#if>
<#-- Instance 2 -->
<#if CONFIG_DRV_I2C_INST_IDX2 == true>

#define DRV_I2C_PERIPHERAL_ID_IDX2                      ${CONFIG_DRV_I2C_PERIPHERAL_ID_IDX2}
#define DRV_I2C_OPERATION_MODE_IDX2                     ${CONFIG_DRV_I2C_OPERATION_MODE_IDX2}
<#if CONFIG_DEVICE == "PIC32MZ0512ECE064" || CONFIG_DEVICE == "PIC32MZ0512ECF064" || CONFIG_DEVICE == "PIC32MZ0512ECK064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECG064" || CONFIG_DEVICE == "PIC32MZ1024ECH064" || CONFIG_DEVICE == "PIC32MZ1024ECM064"
	|| CONFIG_DEVICE == "PIC32MZ2048ECG064" || CONFIG_DEVICE == "PIC32MZ2048ECH064" || CONFIG_DEVICE == "PIC32MZ2048ECM064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECE064" || CONFIG_DEVICE == "PIC32MZ1024ECF064" || CONFIG_DEVICE == "PIC32MZ1024ECK064"
	|| CONFIG_DEVICE == "PIC32MZ0512EFE064" || CONFIG_DEVICE == "PIC32MZ0512EFF064" || CONFIG_DEVICE == "PIC32MZ0512EFK064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFG064" || CONFIG_DEVICE == "PIC32MZ1024EFH064" || CONFIG_DEVICE == "PIC32MZ1024EFM064"
	|| CONFIG_DEVICE == "PIC32MZ2048EFG064" || CONFIG_DEVICE == "PIC32MZ2048EFH064" || CONFIG_DEVICE == "PIC32MZ2048EFM064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFE064" || CONFIG_DEVICE == "PIC32MZ1024EFF064" || CONFIG_DEVICE == "PIC32MZ1024EFK064" >
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX2 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX2                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX2                       PORTS_BIT_POS_10
#define DRV_SDA_PORT_IDX2                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX2                       PORTS_BIT_POS_9
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX2 == "I2C_ID_3">
#define DRV_SCL_PORT_IDX2                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX2                       PORTS_BIT_POS_3
#define DRV_SDA_PORT_IDX2                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX2                       PORTS_BIT_POS_2
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX2 == "I2C_ID_4">
#define DRV_SCL_PORT_IDX2                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX2                       PORTS_BIT_POS_8
#define DRV_SDA_PORT_IDX2                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX2                       PORTS_BIT_POS_7
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX2 == "I2C_ID_5">
#define DRV_SCL_PORT_IDX2                               PORT_CHANNEL_F
#define DRV_SCL_PIN_POSITION_IDX2                       PORTS_BIT_POS_5
#define DRV_SDA_PORT_IDX2                               PORT_CHANNEL_F
#define DRV_SDA_PIN_POSITION_IDX2                       PORTS_BIT_POS_4
</#if>
<#elseif CONFIG_DEVICE == "PIC32MK1024GPE100" || CONFIG_DEVICE == "PIC32MK1024GPD100" ||
         CONFIG_DEVICE == "PIC32MK0512GPE100" || CONFIG_DEVICE == "PIC32MK0512GPD100" ||
         CONFIG_DEVICE == "PIC32MK1024MCF100" || CONFIG_DEVICE == "PIC32MK0512MCF100" ||
         CONFIG_DEVICE == "PIC32MK1024MCF64"  || CONFIG_DEVICE == "PIC32MK0512MCF64"  ||
         CONFIG_DEVICE == "PIC32MK1024GPE64"  || CONFIG_DEVICE == "PIC32MK1024GPD64"  ||
         CONFIG_DEVICE == "PIC32MK0512GPE64"  || CONFIG_DEVICE == "PIC32MK0512GPD64">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX2 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX2                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX2                       PORTS_BIT_POS_7
#define DRV_SDA_PORT_IDX2                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX2                       PORTS_BIT_POS_8
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX2 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX2                               PORT_CHANNEL_E
#define DRV_SCL_PIN_POSITION_IDX2                       PORTS_BIT_POS_13
#define DRV_SDA_PORT_IDX2                               PORT_CHANNEL_E
#define DRV_SDA_PIN_POSITION_IDX2                       PORTS_BIT_POS_12
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX2 == "I2C_ID_3">
#define DRV_SCL_PORT_IDX2                               PORT_CHANNEL_B
#define DRV_SCL_PIN_POSITION_IDX2                       PORTS_BIT_POS_4
#define DRV_SDA_PORT_IDX2                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX2                       PORTS_BIT_POS_8
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX2 == "I2C_ID_4">
#define DRV_SCL_PORT_IDX2                               PORT_CHANNEL_B
#define DRV_SCL_PIN_POSITION_IDX2                       PORTS_BIT_POS_6
#define DRV_SDA_PORT_IDX2                               PORT_CHANNEL_B
#define DRV_SDA_PIN_POSITION_IDX2                       PORTS_BIT_POS_5
</#if>
<#else>
#define DRV_SCL_PORT_IDX2                               ${CONFIG_DRV_SCL_PORT_IDX2}
#define DRV_SCL_PIN_POSITION_IDX2                       ${CONFIG_DRV_SCL_PIN_POSITION_IDX2}
#define DRV_SDA_PORT_IDX2                               ${CONFIG_DRV_SDA_PORT_IDX2}
#define DRV_SDA_PIN_POSITION_IDX2                       ${CONFIG_DRV_SDA_PIN_POSITION_IDX2}
</#if>
<#if CONFIG_DRV_I2C_BIT_BANG_IDX2 == true>
#define DRV_I2C_BIT_BANG_IDX2                           true
#define DRV_I2C_BIT_BANG_BAUD_RATE_IDX2                 ${CONFIG_DRV_I2C_BIT_BANG_BAUD_RATE_IDX2}
#define DRV_I2C_BIT_BANG_TMR_MODULE_IDX2                ${CONFIG_DRV_I2C_BIT_BANG_TMR_MODULE_IDX2}
#define DRV_I2C_BIT_BANG_INT_SRC_IDX2                   ${CONFIG_DRV_I2C_BIT_BANG_INT_SRC_IDX2}
<#else>
#define DRV_I2C_BIT_BANG_IDX2                           false
</#if>
<#if CONFIG_DRV_I2C_STOP_IN_IDLE_IDX2 == true>
#define DRV_I2C_STOP_IN_IDLE_IDX2                       true
<#else>
#define DRV_I2C_STOP_IN_IDLE_IDX2                       false
</#if>
<#if CONFIG_DRV_I2C_SMBus_SPECIFICATION_IDX2 == true>
#define DRV_I2C_SMBus_SPECIFICATION_IDX2                true
<#else>
#define DRV_I2C_SMBus_SPECIFICATION_IDX2                false
</#if>
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX2 == "DRV_I2C_MODE_MASTER">
#define DRV_I2C_BAUD_RATE_IDX2                          ${CONFIG_DRV_I2C_BAUD_RATE_IDX2}
#define DRV_I2C_BRG_CLOCK_IDX2                          ${CONFIG_DRV_I2C_BRG_CLOCK_IDX2}
<#if CONFIG_DRV_I2C_SLEW_RATE_CONTROL_IDX2 == true>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX2                  true
<#else>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX2                  false
</#if>
<#else>
#define DRV_I2C_ADDRESS_WIDTH_IDX2                      ${CONFIG_DRV_I2C_ADDRESS_WIDTH_IDX2}
<#if CONFIG_DRV_I2C_STRICT_ADDRESS_RULE_IDX2 == true>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX2                true
<#else>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX2                false
</#if>
<#if CONFIG_DRV_I2C_GENERAL_CALL_ADDRESS_IDX2 == true>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX2               true
<#else>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX2               false
</#if>
<#if CONFIG_DRV_I2C_CLOCK_STRETCH_IDX2 == true>
#define DRV_I2C_CLOCK_STRETCH_IDX2                      true
<#else>
#define DRV_I2C_CLOCK_STRETCH_IDX2                      false
</#if>
#define DRV_I2C_SLAVE_ADDRESS_MASK_IDX2                 ${CONFIG_DRV_I2C_SLAVE_ADDRESS_MASK_IDX2}
#define DRV_I2C_SLAVE_ADDRESS_VALUE_IDX2                ${CONFIG_DRV_I2C_SLAVE_ADDRESS_VALUE_IDX2}
</#if>

<#if CONFIG_DRV_I2C_BIT_BANG_IDX2 == false>
#define DRV_I2C_MASTER_INT_SRC_IDX2                     ${CONFIG_DRV_I2C_MASTER_INT_SRC_IDX2}
#define DRV_I2C_SLAVE_INT_SRC_IDX2                      ${CONFIG_DRV_I2C_SLAVE_INT_SRC_IDX2}
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_ERR_MX_INT_SRC_IDX2                     ${CONFIG_DRV_I2C_ERR_MX_INT_SRC_IDX2}
<#else>
#define DRV_I2C_ERR_MZ_INT_SRC_IDX2                     ${CONFIG_DRV_I2C_ERR_MZ_INT_SRC_IDX2}
</#if>
<#if CONFIG_DRV_I2C_INTERRUPT_MODE == true>
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_INT_VECTOR_IDX2                         ${CONFIG_DRV_I2C_INT_VECTOR_IDX2}
#define DRV_I2C_ISR_VECTOR_IDX2                         ${CONFIG_DRV_I2C_ISR_VECTOR_IDX2}
#define DRV_I2C_INT_PRIORITY_IDX2                       ${CONFIG_DRV_I2C_INT_PRIORITY_IDX2}
#define DRV_I2C_INT_SUB_PRIORITY_IDX2                   ${CONFIG_DRV_I2C_INT_SUB_PRIORITY_IDX2}
<#else>
#define DRV_I2C_MASTER_INT_VECTOR_IDX2                  ${CONFIG_DRV_I2C_MASTER_INT_VECTOR_IDX2}
#define DRV_I2C_MASTER_ISR_VECTOR_IDX2                  ${CONFIG_DRV_I2C_MASTER_ISR_VECTOR_IDX2}
#define DRV_I2C_MASTER_INT_PRIORITY_IDX2                ${CONFIG_DRV_I2C_MASTER_INT_PRIORITY_IDX2}
#define DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX2            ${CONFIG_DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX2}
#define DRV_I2C_SLAVE_INT_VECTOR_IDX2                   ${CONFIG_DRV_I2C_SLAVE_INT_VECTOR_IDX2}
#define DRV_I2C_SLAVE_ISR_VECTOR_IDX2                   ${CONFIG_DRV_I2C_SLAVE_ISR_VECTOR_IDX2}
#define DRV_I2C_SLAVE_INT_PRIORITY_IDX2           		${CONFIG_DRV_I2C_SLAVE_INT_PRIORITY_IDX2}
#define DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX2             ${CONFIG_DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX2}
#define DRV_I2C_ERR_INT_VECTOR_IDX2                     ${CONFIG_DRV_I2C_ERR_INT_VECTOR_IDX2}
#define DRV_I2C_ERR_ISR_VECTOR_IDX2                     ${CONFIG_DRV_I2C_ERR_ISR_VECTOR_IDX2}
#define DRV_I2C_ERR_INT_PRIORITY_IDX2                   ${CONFIG_DRV_I2C_ERR_INT_PRIORITY_IDX2}
#define DRV_I2C_ERR_INT_SUB_PRIORITY_IDX2               ${CONFIG_DRV_I2C_ERR_INT_SUB_PRIORITY_IDX2}
</#if>
</#if>
</#if>
#define DRV_I2C_POWER_STATE_IDX2                        ${CONFIG_DRV_I2C_POWER_STATE_IDX2}
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX2 == "DRV_I2C_MODE_SLAVE">
#define DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX2            ${CONFIG_DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX2}
</#if>
</#if>
<#-- Instance 3 -->
<#if CONFIG_DRV_I2C_INST_IDX3 == true>

#define DRV_I2C_PERIPHERAL_ID_IDX3                      ${CONFIG_DRV_I2C_PERIPHERAL_ID_IDX3}
#define DRV_I2C_OPERATION_MODE_IDX3                     ${CONFIG_DRV_I2C_OPERATION_MODE_IDX3}
<#if CONFIG_DEVICE == "PIC32MZ0512ECE064" || CONFIG_DEVICE == "PIC32MZ0512ECF064" || CONFIG_DEVICE == "PIC32MZ0512ECK064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECG064" || CONFIG_DEVICE == "PIC32MZ1024ECH064" || CONFIG_DEVICE == "PIC32MZ1024ECM064"
	|| CONFIG_DEVICE == "PIC32MZ2048ECG064" || CONFIG_DEVICE == "PIC32MZ2048ECH064" || CONFIG_DEVICE == "PIC32MZ2048ECM064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECE064" || CONFIG_DEVICE == "PIC32MZ1024ECF064" || CONFIG_DEVICE == "PIC32MZ1024ECK064"
	|| CONFIG_DEVICE == "PIC32MZ0512EFE064" || CONFIG_DEVICE == "PIC32MZ0512EFF064" || CONFIG_DEVICE == "PIC32MZ0512EFK064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFG064" || CONFIG_DEVICE == "PIC32MZ1024EFH064" || CONFIG_DEVICE == "PIC32MZ1024EFM064"
	|| CONFIG_DEVICE == "PIC32MZ2048EFG064" || CONFIG_DEVICE == "PIC32MZ2048EFH064" || CONFIG_DEVICE == "PIC32MZ2048EFM064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFE064" || CONFIG_DEVICE == "PIC32MZ1024EFF064" || CONFIG_DEVICE == "PIC32MZ1024EFK064" >
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX3 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX3                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX3                       PORTS_BIT_POS_10
#define DRV_SDA_PORT_IDX3                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX3                       PORTS_BIT_POS_9
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX3 == "I2C_ID_3">
#define DRV_SCL_PORT_IDX3                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX3                       PORTS_BIT_POS_3
#define DRV_SDA_PORT_IDX3                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX3                       PORTS_BIT_POS_2
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX3 == "I2C_ID_4">
#define DRV_SCL_PORT_IDX3                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX3                       PORTS_BIT_POS_8
#define DRV_SDA_PORT_IDX3                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX3                       PORTS_BIT_POS_7
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX3 == "I2C_ID_5">
#define DRV_SCL_PORT_IDX3                               PORT_CHANNEL_F
#define DRV_SCL_PIN_POSITION_IDX3                       PORTS_BIT_POS_5
#define DRV_SDA_PORT_IDX3                               PORT_CHANNEL_F
#define DRV_SDA_PIN_POSITION_IDX3                       PORTS_BIT_POS_4
</#if>
<#elseif CONFIG_DEVICE == "PIC32MK1024GPE100" || CONFIG_DEVICE == "PIC32MK1024GPD100" ||
         CONFIG_DEVICE == "PIC32MK0512GPE100" || CONFIG_DEVICE == "PIC32MK0512GPD100" ||
         CONFIG_DEVICE == "PIC32MK1024MCF100" || CONFIG_DEVICE == "PIC32MK0512MCF100" ||
         CONFIG_DEVICE == "PIC32MK1024MCF64"  || CONFIG_DEVICE == "PIC32MK0512MCF64"  ||
         CONFIG_DEVICE == "PIC32MK1024GPE64"  || CONFIG_DEVICE == "PIC32MK1024GPD64"  ||
         CONFIG_DEVICE == "PIC32MK0512GPE64"  || CONFIG_DEVICE == "PIC32MK0512GPD64">
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX3 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX3                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX3                       PORTS_BIT_POS_7
#define DRV_SDA_PORT_IDX3                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX3                       PORTS_BIT_POS_8
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX3 == "I2C_ID_2">
#define DRV_SCL_PORT_IDX3                               PORT_CHANNEL_E
#define DRV_SCL_PIN_POSITION_IDX3                       PORTS_BIT_POS_13
#define DRV_SDA_PORT_IDX3                               PORT_CHANNEL_E
#define DRV_SDA_PIN_POSITION_IDX3                       PORTS_BIT_POS_12
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX3 == "I2C_ID_3">
#define DRV_SCL_PORT_IDX3                               PORT_CHANNEL_B
#define DRV_SCL_PIN_POSITION_IDX3                       PORTS_BIT_POS_4
#define DRV_SDA_PORT_IDX3                               PORT_CHANNEL_A
#define DRV_SDA_PIN_POSITION_IDX3                       PORTS_BIT_POS_8
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX3 == "I2C_ID_4">
#define DRV_SCL_PORT_IDX3                               PORT_CHANNEL_B
#define DRV_SCL_PIN_POSITION_IDX3                       PORTS_BIT_POS_6
#define DRV_SDA_PORT_IDX3                               PORT_CHANNEL_B
#define DRV_SDA_PIN_POSITION_IDX3                       PORTS_BIT_POS_5
</#if>
<#else>
#define DRV_SCL_PORT_IDX3                               ${CONFIG_DRV_SCL_PORT_IDX1}
#define DRV_SCL_PIN_POSITION_IDX3                       ${CONFIG_DRV_SCL_PIN_POSITION_IDX1}
#define DRV_SDA_PORT_IDX3                               ${CONFIG_DRV_SDA_PORT_IDX1}
#define DRV_SDA_PIN_POSITION_IDX3                       ${CONFIG_DRV_SDA_PIN_POSITION_IDX1}
</#if>

<#if CONFIG_DRV_I2C_BIT_BANG_IDX3 == true>
#define DRV_I2C_BIT_BANG_IDX3                           true
#define DRV_I2C_BIT_BANG_BAUD_RATE_IDX3                 ${CONFIG_DRV_I2C_BIT_BANG_BAUD_RATE_IDX3}
#define DRV_I2C_BIT_BANG_TMR_MODULE_IDX3                ${CONFIG_DRV_I2C_BIT_BANG_TMR_MODULE_IDX3}
#define DRV_I2C_BIT_BANG_INT_SRC_IDX3                   ${CONFIG_DRV_I2C_BIT_BANG_INT_SRC_IDX3}
<#else>
#define DRV_I2C_BIT_BANG_IDX3                           false
</#if>
<#if CONFIG_DRV_I2C_STOP_IN_IDLE_IDX3 == true>
#define DRV_I2C_STOP_IN_IDLE_IDX3                       true
<#else>
#define DRV_I2C_STOP_IN_IDLE_IDX3                       false
</#if>
<#if CONFIG_DRV_I2C_SMBus_SPECIFICATION_IDX3 == true>
#define DRV_I2C_SMBus_SPECIFICATION_IDX3                true
<#else>
#define DRV_I2C_SMBus_SPECIFICATION_IDX3                false
</#if>
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX3 == "DRV_I2C_MODE_MASTER">
#define DRV_I2C_BAUD_RATE_IDX3                          ${CONFIG_DRV_I2C_BAUD_RATE_IDX3}
#define DRV_I2C_BRG_CLOCK_IDX3                          ${CONFIG_DRV_I2C_BRG_CLOCK_IDX3}
<#if CONFIG_DRV_I2C_SLEW_RATE_CONTROL_IDX3 == true>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX3                  true
<#else>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX3                  false
</#if>
<#else>
#define DRV_I2C_ADDRESS_WIDTH_IDX3                      ${CONFIG_DRV_I2C_ADDRESS_WIDTH_IDX3}
<#if CONFIG_DRV_I2C_STRICT_ADDRESS_RULE_IDX3 == true>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX3                true
<#else>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX3                false
</#if>
<#if CONFIG_DRV_I2C_GENERAL_CALL_ADDRESS_IDX3 == true>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX3               true
<#else>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX3               false
</#if>
<#if CONFIG_DRV_I2C_CLOCK_STRETCH_IDX3 == true>
#define DRV_I2C_CLOCK_STRETCH_IDX3                      true
<#else>
#define DRV_I2C_CLOCK_STRETCH_IDX3                      false
</#if>
#define DRV_I2C_SLAVE_ADDRESS_MASK_IDX3                 ${CONFIG_DRV_I2C_SLAVE_ADDRESS_MASK_IDX3}
#define DRV_I2C_SLAVE_ADDRESS_VALUE_IDX3                ${CONFIG_DRV_I2C_SLAVE_ADDRESS_VALUE_IDX3}
</#if>

<#if CONFIG_DRV_I2C_BIT_BANG_IDX3 == false>
#define DRV_I2C_MASTER_INT_SRC_IDX3                     ${CONFIG_DRV_I2C_MASTER_INT_SRC_IDX3}
#define DRV_I2C_SLAVE_INT_SRC_IDX3                      ${CONFIG_DRV_I2C_SLAVE_INT_SRC_IDX3}
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_ERR_MX_INT_SRC_IDX3                     ${CONFIG_DRV_I2C_ERR_MX_INT_SRC_IDX3}
<#else>
#define DRV_I2C_ERR_MZ_INT_SRC_IDX3                     ${CONFIG_DRV_I2C_ERR_MZ_INT_SRC_IDX3}
</#if>
<#if CONFIG_DRV_I2C_INTERRUPT_MODE == true>
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_INT_VECTOR_IDX3                         ${CONFIG_DRV_I2C_INT_VECTOR_IDX3}
#define DRV_I2C_ISR_VECTOR_IDX3                         ${CONFIG_DRV_I2C_ISR_VECTOR_IDX3}
#define DRV_I2C_INT_PRIORITY_IDX3                       ${CONFIG_DRV_I2C_INT_PRIORITY_IDX3}
#define DRV_I2C_INT_SUB_PRIORITY_IDX3                   ${CONFIG_DRV_I2C_INT_SUB_PRIORITY_IDX3}
<#else>
#define DRV_I2C_MASTER_INT_VECTOR_IDX3                  ${CONFIG_DRV_I2C_MASTER_INT_VECTOR_IDX3}
#define DRV_I2C_MASTER_ISR_VECTOR_IDX3                  ${CONFIG_DRV_I2C_MASTER_ISR_VECTOR_IDX3}
#define DRV_I2C_MASTER_INT_PRIORITY_IDX3                ${CONFIG_DRV_I2C_MASTER_INT_PRIORITY_IDX3}
#define DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX3            ${CONFIG_DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX3}
#define DRV_I2C_SLAVE_INT_VECTOR_IDX3                   ${CONFIG_DRV_I2C_SLAVE_INT_VECTOR_IDX3}
#define DRV_I2C_SLAVE_ISR_VECTOR_IDX3                   ${CONFIG_DRV_I2C_SLAVE_ISR_VECTOR_IDX3}
#define DRV_I2C_SLAVE_INT_PRIORITY_IDX3                 ${CONFIG_DRV_I2C_SLAVE_INT_PRIORITY_IDX3}
#define DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX3             ${CONFIG_DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX3}
#define DRV_I2C_ERR_INT_VECTOR_IDX3                     ${CONFIG_DRV_I2C_ERR_INT_VECTOR_IDX3}
#define DRV_I2C_ERR_ISR_VECTOR_IDX3                     ${CONFIG_DRV_I2C_ERR_ISR_VECTOR_IDX3}
#define DRV_I2C_ERR_INT_PRIORITY_IDX3                   ${CONFIG_DRV_I2C_ERR_INT_PRIORITY_IDX3}
#define DRV_I2C_ERR_INT_SUB_PRIORITY_IDX3               ${CONFIG_DRV_I2C_ERR_INT_SUB_PRIORITY_IDX3}
</#if>
</#if>
</#if>
#define DRV_I2C_POWER_STATE_IDX3                        ${CONFIG_DRV_I2C_POWER_STATE_IDX3}
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX3 == "DRV_I2C_MODE_SLAVE">
#define DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX3            ${CONFIG_DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX3}
</#if>
</#if>
<#-- Instance 4 -->
<#if CONFIG_DRV_I2C_INST_IDX4 == true>

#define DRV_I2C_PERIPHERAL_ID_IDX4                      ${CONFIG_DRV_I2C_PERIPHERAL_ID_IDX4}
#define DRV_I2C_OPERATION_MODE_IDX4                     ${CONFIG_DRV_I2C_OPERATION_MODE_IDX4}
<#if CONFIG_DEVICE == "PIC32MZ0512ECE064" || CONFIG_DEVICE == "PIC32MZ0512ECF064" || CONFIG_DEVICE == "PIC32MZ0512ECK064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECG064" || CONFIG_DEVICE == "PIC32MZ1024ECH064" || CONFIG_DEVICE == "PIC32MZ1024ECM064"
	|| CONFIG_DEVICE == "PIC32MZ2048ECG064" || CONFIG_DEVICE == "PIC32MZ2048ECH064" || CONFIG_DEVICE == "PIC32MZ2048ECM064"
	|| CONFIG_DEVICE == "PIC32MZ1024ECE064" || CONFIG_DEVICE == "PIC32MZ1024ECF064" || CONFIG_DEVICE == "PIC32MZ1024ECK064"
	|| CONFIG_DEVICE == "PIC32MZ0512EFE064" || CONFIG_DEVICE == "PIC32MZ0512EFF064" || CONFIG_DEVICE == "PIC32MZ0512EFK064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFG064" || CONFIG_DEVICE == "PIC32MZ1024EFH064" || CONFIG_DEVICE == "PIC32MZ1024EFM064"
	|| CONFIG_DEVICE == "PIC32MZ2048EFG064" || CONFIG_DEVICE == "PIC32MZ2048EFH064" || CONFIG_DEVICE == "PIC32MZ2048EFM064"
	|| CONFIG_DEVICE == "PIC32MZ1024EFE064" || CONFIG_DEVICE == "PIC32MZ1024EFF064" || CONFIG_DEVICE == "PIC32MZ1024EFK064" >
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX4 == "I2C_ID_1">
#define DRV_SCL_PORT_IDX4                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX4                       PORTS_BIT_POS_10
#define DRV_SDA_PORT_IDX4                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX4                       PORTS_BIT_POS_9
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX4 == "I2C_ID_3">
#define DRV_SCL_PORT_IDX4                               PORT_CHANNEL_D
#define DRV_SCL_PIN_POSITION_IDX4                       PORTS_BIT_POS_3
#define DRV_SDA_PORT_IDX4                               PORT_CHANNEL_D
#define DRV_SDA_PIN_POSITION_IDX4                       PORTS_BIT_POS_2
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX4 == "I2C_ID_4">
#define DRV_SCL_PORT_IDX4                               PORT_CHANNEL_G
#define DRV_SCL_PIN_POSITION_IDX4                       PORTS_BIT_POS_8
#define DRV_SDA_PORT_IDX4                               PORT_CHANNEL_G
#define DRV_SDA_PIN_POSITION_IDX4                       PORTS_BIT_POS_7
</#if>
<#if CONFIG_DRV_I2C_PERIPHERAL_ID_IDX4 == "I2C_ID_5">
#define DRV_SCL_PORT_IDX4                               PORT_CHANNEL_F
#define DRV_SCL_PIN_POSITION_IDX4                       PORTS_BIT_POS_5
#define DRV_SDA_PORT_IDX4                               PORT_CHANNEL_F
#define DRV_SDA_PIN_POSITION_IDX4                       PORTS_BIT_POS_4
</#if>
<#else>
#define DRV_SCL_PORT_IDX4                               ${CONFIG_DRV_SCL_PORT_IDX4}
#define DRV_SCL_PIN_POSITION_IDX4                       ${CONFIG_DRV_SCL_PIN_POSITION_IDX4}
#define DRV_SDA_PORT_IDX4                               ${CONFIG_DRV_SDA_PORT_IDX4}
#define DRV_SDA_PIN_POSITION_IDX4                       ${CONFIG_DRV_SDA_PIN_POSITION_IDX4}
</#if>

<#if CONFIG_DRV_I2C_BIT_BANG_IDX4 == true>
#define DRV_I2C_BIT_BANG_IDX4                           true
#define DRV_I2C_BIT_BANG_BAUD_RATE_IDX4                 ${CONFIG_DRV_I2C_BIT_BANG_BAUD_RATE_IDX4}
#define DRV_I2C_BIT_BANG_TMR_MODULE_IDX4                ${CONFIG_DRV_I2C_BIT_BANG_TMR_MODULE_IDX4}
#define DRV_I2C_BIT_BANG_INT_SRC_IDX4                   ${CONFIG_DRV_I2C_BIT_BANG_INT_SRC_IDX4}
<#else>
#define DRV_I2C_BIT_BANG_IDX4                           false
</#if>
<#if CONFIG_DRV_I2C_STOP_IN_IDLE_IDX4 == true>
#define DRV_I2C_STOP_IN_IDLE_IDX4                       true
<#else>
#define DRV_I2C_STOP_IN_IDLE_IDX4                       false
</#if>
<#if CONFIG_DRV_I2C_SMBus_SPECIFICATION_IDX4 == true>
#define DRV_I2C_SMBus_SPECIFICATION_IDX4                true
<#else>
#define DRV_I2C_SMBus_SPECIFICATION_IDX4                false
</#if>
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX4 == "DRV_I2C_MODE_MASTER">
#define DRV_I2C_BAUD_RATE_IDX4                          ${CONFIG_DRV_I2C_BAUD_RATE_IDX4}
#define DRV_I2C_BRG_CLOCK_IDX4                          ${CONFIG_DRV_I2C_BRG_CLOCK_IDX4}
<#if CONFIG_DRV_I2C_SLEW_RATE_CONTROL_IDX4 == true>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX4                  true
<#else>
#define DRV_I2C_SLEW_RATE_CONTROL_IDX4                  false
</#if>
<#else>
#define DRV_I2C_ADDRESS_WIDTH_IDX4                      ${CONFIG_DRV_I2C_ADDRESS_WIDTH_IDX4}
<#if CONFIG_DRV_I2C_STRICT_ADDRESS_RULE_IDX4 == true>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX4                true
<#else>
#define DRV_I2C_STRICT_ADDRESS_RULE_IDX4                false
</#if>
<#if CONFIG_DRV_I2C_GENERAL_CALL_ADDRESS_IDX4 == true>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX4               true
<#else>
#define DRV_I2C_GENERAL_CALL_ADDRESS_IDX4               false
</#if>
<#if CONFIG_DRV_I2C_CLOCK_STRETCH_IDX4 == true>
#define DRV_I2C_CLOCK_STRETCH_IDX4                      true
<#else>
#define DRV_I2C_CLOCK_STRETCH_IDX4                      false
</#if>
#define DRV_I2C_SLAVE_ADDRESS_MASK_IDX4                 ${CONFIG_DRV_I2C_SLAVE_ADDRESS_MASK_IDX4}
#define DRV_I2C_SLAVE_ADDRESS_VALUE_IDX4                ${CONFIG_DRV_I2C_SLAVE_ADDRESS_VALUE_IDX4}
</#if>

<#if CONFIG_DRV_I2C_BIT_BANG_IDX4 == false>
#define DRV_I2C_MASTER_INT_SRC_IDX4                     ${CONFIG_DRV_I2C_MASTER_INT_SRC_IDX4}
#define DRV_I2C_SLAVE_INT_SRC_IDX4                      ${CONFIG_DRV_I2C_SLAVE_INT_SRC_IDX4}
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_ERR_MX_INT_SRC_IDX4                     ${CONFIG_DRV_I2C_ERR_MX_INT_SRC_IDX4}
<#else>
#define DRV_I2C_ERR_MZ_INT_SRC_IDX4                     ${CONFIG_DRV_I2C_ERR_MZ_INT_SRC_IDX4}
</#if>
<#if CONFIG_DRV_I2C_INTERRUPT_MODE == true>
<#if CONFIG_PIC32MX == true>
#define DRV_I2C_INT_VECTOR_IDX4                         ${CONFIG_DRV_I2C_INT_VECTOR_IDX4}
#define DRV_I2C_ISR_VECTOR_IDX4                         ${CONFIG_DRV_I2C_ISR_VECTOR_IDX4}
#define DRV_I2C_INT_PRIORITY_IDX4                       ${CONFIG_DRV_I2C_INT_PRIORITY_IDX4}
#define DRV_I2C_INT_SUB_PRIORITY_IDX4                   ${CONFIG_DRV_I2C_INT_SUB_PRIORITY_IDX4}
<#else>
#define DRV_I2C_MASTER_INT_VECTOR_IDX4                  ${CONFIG_DRV_I2C_MASTER_INT_VECTOR_IDX4}
#define DRV_I2C_MASTER_ISR_VECTOR_IDX4                  ${CONFIG_DRV_I2C_MASTER_ISR_VECTOR_IDX4}
#define DRV_I2C_MASTER_INT_PRIORITY_IDX4                ${CONFIG_DRV_I2C_MASTER_INT_PRIORITY_IDX4}
#define DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX4            ${CONFIG_DRV_I2C_MASTER_INT_SUB_PRIORITY_IDX4}
#define DRV_I2C_SLAVE_INT_VECTOR_IDX4                   ${CONFIG_DRV_I2C_SLAVE_INT_VECTOR_IDX4}
#define DRV_I2C_SLAVE_ISR_VECTOR_IDX4                   ${CONFIG_DRV_I2C_SLAVE_ISR_VECTOR_IDX4}
#define DRV_I2C_SLAVE_INT_PRIORITY_IDX4                 ${CONFIG_DRV_I2C_SLAVE_INT_PRIORITY_IDX4}
#define DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX4             ${CONFIG_DRV_I2C_SLAVE_INT_SUB_PRIORITY_IDX4}
#define DRV_I2C_ERR_INT_VECTOR_IDX4                     ${CONFIG_DRV_I2C_ERR_INT_VECTOR_IDX4}
#define DRV_I2C_ERR_ISR_VECTOR_IDX4                     ${CONFIG_DRV_I2C_ERR_ISR_VECTOR_IDX4}
#define DRV_I2C_ERR_INT_PRIORITY_IDX4                   ${CONFIG_DRV_I2C_ERR_INT_PRIORITY_IDX4}
#define DRV_I2C_ERR_INT_SUB_PRIORITY_IDX4               ${CONFIG_DRV_I2C_ERR_INT_SUB_PRIORITY_IDX4}
</#if>
</#if>
</#if>
#define DRV_I2C_POWER_STATE_IDX4                        ${CONFIG_DRV_I2C_POWER_STATE_IDX4}
<#if CONFIG_DRV_I2C_OPERATION_MODE_IDX4 == "DRV_I2C_MODE_SLAVE">
#define DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX4            ${CONFIG_DRV_I2C_SLAVE_CALLBACK_FUNCTION_IDX4}
</#if>
</#if>
</#if>
<#if CONFIG_DRV_I2C_INTERRUPT_MODE == true>
#define DRV_I2C_INTERRUPT_MODE                    		true
<#else>
#define DRV_I2C_INTERRUPT_MODE                    		false
</#if>
</#if>

<#--
/*******************************************************************************
 End of File
*/
-->
