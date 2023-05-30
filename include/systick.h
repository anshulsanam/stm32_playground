#pragma once

#include "stm32f3xx.h"

// #define PLL_SOURCE_HSI       // HSI (~8MHz) used to clock the PLL, and the PLL is used as system clock source
// #define PLL_SOURCE_HSE       // HSE (8MHz) used to clock the PLL, and the PLL is used as system clock source
#define PLL_SOURCE_HSE_BYPASS   // HSE bypassed with an external clock (8MHz, coming from ST-Link) used to clock
                                // the PLL, and the PLL is used as system clock source
#define HSE_STARTUP_TIMEOUT   ((uint16_t)0x0500)


void systick_init(uint32_t sys_freq);

uint32_t millis(void);

void delay(uint32_t delay_ms);
