<#--
/*******************************************************************************
  USART Driver Freemarker Template File

  Company:
    Microchip Technology Inc.

  File Name:
    drv_usart.ftl

  Summary:
    USART Driver Freemarker Template File

  Description:

*******************************************************************************/

/*******************************************************************************
Copyright (c) 2015 released Microchip Technology Inc.  All rights reserved.

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
<#if CONFIG_USE_DRV_USART == true>
// *****************************************************************************
/* USART Driver Configuration Options */
<#if CONFIG_DRV_USART_DRIVER_MODE == "DYNAMIC">
<#assign combinedQueueDepth = 0>
<#if CONFIG_DRV_USART_INTERRUPT_MODE == true>
#define DRV_USART_INTERRUPT_MODE                    true
<#else>
#define DRV_USART_INTERRUPT_MODE                    false
</#if>

<#if CONFIG_DRV_USART_BYTE_MODEL_SUPPORT == true>
#define DRV_USART_BYTE_MODEL_SUPPORT                true
<#else>
#define DRV_USART_BYTE_MODEL_SUPPORT                false
</#if>

<#if CONFIG_DRV_USART_READ_WRITE_MODEL_SUPPORT == true>
#define DRV_USART_READ_WRITE_MODEL_SUPPORT          true
<#else>
#define DRV_USART_READ_WRITE_MODEL_SUPPORT          false
</#if>

<#if CONFIG_DRV_USART_BUFFER_QUEUE_SUPPORT == true>
#define DRV_USART_BUFFER_QUEUE_SUPPORT              true
<#else>
#define DRV_USART_BUFFER_QUEUE_SUPPORT              false
</#if>

#define DRV_USART_INSTANCES_NUMBER                  ${CONFIG_DRV_USART_INSTANCES_NUMBER}

#define DRV_USART_CLIENTS_NUMBER                    ${CONFIG_DRV_USART_CLIENTS_NUMBER}

<#if CONFIG_DRV_USART_INST_IDX0 == true>
<#-- Instance 0 -->
#define DRV_USART_PERIPHERAL_ID_IDX0                ${CONFIG_DRV_USART_PERIPHERAL_ID_IDX0}
#define DRV_USART_OPER_MODE_IDX0                    ${CONFIG_DRV_USART_OPER_MODE_IDX0}
<#if CONFIG_DRV_USART_OPER_MODE_IDX0 == "DRV_USART_OPERATION_MODE_ADDRESSED">
#define DRV_USART_OPER_MODE_DATA_IDX0               ${CONFIG_DRV_USART_OPER_MODE_DATA_IDX0}
</#if>
#define DRV_USART_BRG_CLOCK_IDX0                    ${CONFIG_DRV_USART_BRG_CLOCK_IDX0}
#define DRV_USART_BAUD_RATE_IDX0                    ${CONFIG_DRV_USART_BAUD_RATE_IDX0}
#define DRV_USART_LINE_CNTRL_IDX0                   ${CONFIG_DRV_USART_LINE_CNTRL_IDX0}
#define DRV_USART_INT_SRC_IDX0                      ${CONFIG_DRV_USART_INT_SRC_IDX0}
<#if CONFIG_DRV_USART_INTERRUPT_MODE == true>
#define DRV_USART_INT_PRIORITY_IDX0                 ${CONFIG_DRV_USART_INT_PRIORITY_IDX0}
</#if>
<#if CONFIG_DRV_USART_BUFFER_QUEUE_SUPPORT == true>
#define DRV_USART_XMIT_QUEUE_SIZE_IDX0              ${CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX0}
#define DRV_USART_RCV_QUEUE_SIZE_IDX0               ${CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX0}
<#assign combinedQueueDepth = combinedQueueDepth + CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX0?number>
<#assign combinedQueueDepth = combinedQueueDepth + CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX0?number>
</#if>
<#if CONFIG_DRV_USART_SUPPORT_TRANSMIT_DMA_IDX0 == true || CONFIG_DRV_USART_SUPPORT_RECEIVE_DMA_IDX0 == true>
<#if CONFIG_DRV_USART_SUPPORT_TRANSMIT_DMA_IDX0 == true>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "0">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX0}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "1">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX1}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "2">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX2}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "3">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX3}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "4">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX4}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "5">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX5} 
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "6">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX6}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "7">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX7}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "8">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX8}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "9">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX9}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "10">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX10}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "11">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX11}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "12">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX12}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "13">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX13}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "14">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX14}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "15">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX15} 
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "16">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX16}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "17">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX17}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "18">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX18}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "19">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX19}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "20">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX20}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "21">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX21}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "22">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX22}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX0 == "23">
#define DRV_USART_XMIT_DMA_CH_IDX0                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX23}
</#if>
#define DRV_USART_XMIT_DMA_CH_TRIG_IDX0             ${CONFIG_DRV_USART_XMIT_DMA_CH_TRIG_IDX0}
</#if>
<#if CONFIG_DRV_USART_SUPPORT_RECEIVE_DMA_IDX0 == true>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "0">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX0}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "1">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX1}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "2">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX2}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "3">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX3}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "4">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX4}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "5">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX5} 
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "6">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX6}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "7">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX7}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "8">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX8}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "9">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX9}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "10">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX10}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "11">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX11}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "12">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX12}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "13">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX13}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "14">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX14}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "15">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX15} 
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "16">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX16}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "17">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX17}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "18">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX18}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "19">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX19}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "20">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX20}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "21">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX21}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "22">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX22}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX0 == "23">
#define DRV_USART_RCV_DMA_CH_IDX0                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX23}
</#if>
#define DRV_USART_RCV_DMA_CH_TRIG_IDX0              ${CONFIG_DRV_USART_RCV_DMA_CH_TRIG_IDX0}
</#if>
#define DRV_USART_DMA_INT_SRC_IDX0                  XDMAC_IRQn
</#if>
</#if>
<#if CONFIG_DRV_USART_INST_IDX1 == true>

<#-- Instance 1 -->
#define DRV_USART_PERIPHERAL_ID_IDX1                ${CONFIG_DRV_USART_PERIPHERAL_ID_IDX1}
#define DRV_USART_OPER_MODE_IDX1                    ${CONFIG_DRV_USART_OPER_MODE_IDX1}
<#if CONFIG_DRV_USART_OPER_MODE_IDX1 == "DRV_USART_OPERATION_MODE_ADDRESSED">
#define DRV_USART_OPER_MODE_DATA_IDX1               ${CONFIG_DRV_USART_OPER_MODE_DATA_IDX1}
</#if>
#define DRV_USART_BRG_CLOCK_IDX1                    ${CONFIG_DRV_USART_BRG_CLOCK_IDX1}
#define DRV_USART_BAUD_RATE_IDX1                    ${CONFIG_DRV_USART_BAUD_RATE_IDX1}
#define DRV_USART_LINE_CNTRL_IDX1                   ${CONFIG_DRV_USART_LINE_CNTRL_IDX1}
#define DRV_USART_INT_SRC_IDX1                 ${CONFIG_DRV_USART_INT_SRC_IDX1}
<#if CONFIG_DRV_USART_INTERRUPT_MODE == true>
#define DRV_USART_INT_PRIORITY_IDX1                 ${CONFIG_DRV_USART_INT_PRIORITY_IDX1}
</#if>
<#if CONFIG_DRV_USART_BUFFER_QUEUE_SUPPORT == true>
#define DRV_USART_XMIT_QUEUE_SIZE_IDX1              ${CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX1}
#define DRV_USART_RCV_QUEUE_SIZE_IDX1               ${CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX1}
<#assign combinedQueueDepth = combinedQueueDepth + CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX1?number>
<#assign combinedQueueDepth = combinedQueueDepth + CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX1?number>
</#if>
<#if CONFIG_DRV_USART_SUPPORT_TRANSMIT_DMA_IDX1 == true || CONFIG_DRV_USART_SUPPORT_RECEIVE_DMA_IDX1 == true>
<#if CONFIG_DRV_USART_SUPPORT_TRANSMIT_DMA_IDX1 == true>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "0">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX0}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "1">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX1}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "2">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX2}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "3">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX3}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "4">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX4}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "5">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX5} 
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "6">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX6}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "7">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX7}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "8">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX8}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "9">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX9}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "10">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX10}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "11">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX11}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "12">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX12}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "13">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX13}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "14">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX14}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "15">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX15} 
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "16">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX16}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "17">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX17}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "18">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX18}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "19">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX19}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "20">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX20}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "21">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX21}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "22">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX22}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX1 == "23">
#define DRV_USART_XMIT_DMA_CH_IDX1                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX23}
</#if>
#define DRV_USART_XMIT_DMA_CH_TRIG_IDX1             ${CONFIG_DRV_USART_XMIT_DMA_CH_TRIG_IDX1}
</#if>
<#if CONFIG_DRV_USART_SUPPORT_RECEIVE_DMA_IDX1 == true>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "0">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX0}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "1">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX1}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "2">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX2}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "3">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX3}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "4">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX4}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "5">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX5} 
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "6">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX6}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "7">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX7}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "8">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX8}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "9">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX9}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "10">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX10}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "11">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX11}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "12">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX12}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "13">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX13}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "14">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX14}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "15">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX15} 
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "16">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX16}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "17">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX17}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "18">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX18}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "19">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX19}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "20">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX20}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "21">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX21}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "22">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX22}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX1 == "23">
#define DRV_USART_RCV_DMA_CH_IDX1                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX23}
</#if>
#define DRV_USART_RCV_DMA_CH_TRIG_IDX1              ${CONFIG_DRV_USART_RCV_DMA_CH_TRIG_IDX1}
</#if>
#define DRV_USART_DMA_INT_SRC_IDX1                  XDMAC_IRQn
</#if>
</#if>
<#if CONFIG_DRV_USART_INST_IDX2 == true>

<#-- Instance 2 -->
#define DRV_USART_PERIPHERAL_ID_IDX2                ${CONFIG_DRV_USART_PERIPHERAL_ID_IDX2}
#define DRV_USART_OPER_MODE_IDX2                    ${CONFIG_DRV_USART_OPER_MODE_IDX2}
<#if CONFIG_DRV_USART_OPER_MODE_IDX2 == "DRV_USART_OPERATION_MODE_ADDRESSED">
#define DRV_USART_OPER_MODE_DATA_IDX2               ${CONFIG_DRV_USART_OPER_MODE_DATA_IDX2}
</#if>
#define DRV_USART_BRG_CLOCK_IDX2                    ${CONFIG_DRV_USART_BRG_CLOCK_IDX2}
#define DRV_USART_BAUD_RATE_IDX2                    ${CONFIG_DRV_USART_BAUD_RATE_IDX2}
#define DRV_USART_LINE_CNTRL_IDX2                   ${CONFIG_DRV_USART_LINE_CNTRL_IDX2}
#define DRV_USART_INT_SRC_IDX2                      ${CONFIG_DRV_USART_INT_SRC_IDX2}
<#if CONFIG_DRV_USART_INTERRUPT_MODE == true>
#define DRV_USART_INT_PRIORITY_IDX2                 ${CONFIG_DRV_USART_INT_PRIORITY_IDX2}
</#if>
<#if CONFIG_DRV_USART_BUFFER_QUEUE_SUPPORT == true>
#define DRV_USART_XMIT_QUEUE_SIZE_IDX2              ${CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX2}
#define DRV_USART_RCV_QUEUE_SIZE_IDX2               ${CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX2}
<#assign combinedQueueDepth = combinedQueueDepth + CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX2?number>
<#assign combinedQueueDepth = combinedQueueDepth + CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX2?number>
</#if>
<#if CONFIG_DRV_USART_SUPPORT_TRANSMIT_DMA_IDX2 == true || CONFIG_DRV_USART_SUPPORT_RECEIVE_DMA_IDX2 == true>
<#if CONFIG_DRV_USART_SUPPORT_TRANSMIT_DMA_IDX2 == true>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "0">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX0}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "1">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX1}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "2">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX2}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "3">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX3}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "4">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX4}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "5">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX5} 
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "6">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX6}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "7">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX7}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "8">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX8}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "9">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX9}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "10">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX10}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "11">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX11}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "12">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX12}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "13">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX13}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "14">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX14}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "15">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX15} 
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "16">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX16}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "17">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX17}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "18">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX18}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "19">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX19}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "20">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX20}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "21">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX21}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "22">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX22}
</#if>
<#if CONFIG_DRV_USART_XMIT_DMA_CH_IDX2 == "23">
#define DRV_USART_XMIT_DMA_CH_IDX2                  ${CONFIG_SYS_DMA_CHANNEL_ID_IDX23}
</#if>
#define DRV_USART_XMIT_DMA_CH_TRIG_IDX2             ${CONFIG_DRV_USART_XMIT_DMA_CH_TRIG_IDX2}
</#if>
<#if CONFIG_DRV_USART_SUPPORT_RECEIVE_DMA_IDX2 == true>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "0">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX0}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "1">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX1}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "2">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX2}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "3">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX3}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "4">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX4}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "5">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX5} 
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "6">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX6}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "7">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX7}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "8">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX8}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "9">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX9}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "10">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX10}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "11">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX11}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "12">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX12}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "13">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX13}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "14">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX14}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "15">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX15} 
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "16">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX16}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "17">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX17}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "18">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX18}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "19">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX19}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "20">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX20}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "21">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX21}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "22">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX22}
</#if>
<#if CONFIG_DRV_USART_RCV_DMA_CH_IDX2 == "23">
#define DRV_USART_RCV_DMA_CH_IDX2                   ${CONFIG_SYS_DMA_CHANNEL_ID_IDX23}
</#if>
#define DRV_USART_RCV_DMA_CH_TRIG_IDX2              ${CONFIG_DRV_USART_RCV_DMA_CH_TRIG_IDX2}
</#if>
#define DRV_USART_DMA_INT_SRC_IDX2                  XDMAC_IRQn
</#if>
</#if>

<#if CONFIG_DRV_USART_BUFFER_QUEUE_SUPPORT == true>
#define DRV_USART_QUEUE_DEPTH_COMBINED              ${combinedQueueDepth}
</#if>
</#if>

<#if CONFIG_DRV_USART_DRIVER_MODE == "STATIC">
#define DRV_USART_INSTANCES_NUMBER                  ${CONFIG_DRV_USART_INSTANCES_NUMBER}
#define DRV_USART_CLIENTS_NUMBER                    ${CONFIG_DRV_USART_CLIENTS_NUMBER}
<#if CONFIG_DRV_USART_INTERRUPT_MODE == true>
#define DRV_USART_INTERRUPT_MODE                    true
<#else>
#define DRV_USART_INTERRUPT_MODE                    false
</#if>
<#if CONFIG_DRV_USART_BYTE_MODEL_SUPPORT == true>
#define DRV_USART_BYTE_MODEL_SUPPORT                true
<#else>
#define DRV_USART_BYTE_MODEL_SUPPORT                false
</#if>
<#if CONFIG_DRV_USART_READ_WRITE_MODEL_SUPPORT == true>
#define DRV_USART_READ_WRITE_MODEL_SUPPORT          true
<#else>
#define DRV_USART_READ_WRITE_MODEL_SUPPORT          false
</#if>
<#if CONFIG_DRV_USART_BUFFER_QUEUE_SUPPORT == true>
#define DRV_USART_BUFFER_QUEUE_SUPPORT              true
<#else>
#define DRV_USART_BUFFER_QUEUE_SUPPORT              false
</#if>
<#if CONFIG_DRV_USART_BUFFER_QUEUE_SUPPORT == true>
<#assign totalQueueDepth = 0>
<#if CONFIG_DRV_USART_INST_IDX0 == true>
<#assign totalQueueDepth = totalQueueDepth + CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX0?number + CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX0?number>
</#if>
<#if CONFIG_DRV_USART_INST_IDX1 == true>
<#assign totalQueueDepth = totalQueueDepth + CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX1?number + CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX1?number>
</#if>
<#if CONFIG_DRV_USART_INST_IDX2 == true>
<#assign totalQueueDepth = totalQueueDepth + CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX2?number + CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX2?number>
</#if>
<#if CONFIG_DRV_USART_INST_IDX3 == true>
<#assign totalQueueDepth = totalQueueDepth + CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX3?number + CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX3?number>
</#if>
<#if CONFIG_DRV_USART_INST_IDX4 == true>
<#assign totalQueueDepth = totalQueueDepth + CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX4?number + CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX4?number>
</#if>
<#if CONFIG_DRV_USART_INST_IDX5 == true>
<#assign totalQueueDepth = totalQueueDepth + CONFIG_DRV_USART_XMIT_QUEUE_SIZE_IDX5?number + CONFIG_DRV_USART_RCV_QUEUE_SIZE_IDX5?number>
</#if>
#define DRV_USART_QUEUE_DEPTH_COMBINED              ${totalQueueDepth}
</#if>
</#if>
</#if>
<#--
/*******************************************************************************
 End of File
*/
-->

