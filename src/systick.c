#include "systick.h"

static void set_sys_clock(void);

static volatile uint32_t s_ticks;

void systick_handler(void) {
    s_ticks++;
}

void systick_init(uint32_t sys_freq) {
	SysTick->LOAD = (sys_freq / 1000U) - 1U; // 1ms tick
	SysTick->VAL = 0x00; // Explicitly set start value (undefined on reset)
	SysTick->CTRL |= (1U << SysTick_CTRL_TICKINT_Pos) | (1U << SysTick_CTRL_CLKSOURCE_Pos); // Enable systick interrupt, source processor clock
	SCB->SHP[8] = 0U; // Set SysTick interrupt priority (default: 0, the highest)
	SysTick->CTRL |= (1U << SysTick_CTRL_ENABLE_Pos); // Enable SysTick
    SET_BIT(RCC->APB2ENR, RCC_APB2ENR_SYSCFGEN);  // Enable SYSCFG
}

uint32_t millis(void) {
    return s_ticks;
}

void delay(uint32_t delay_ms) {
    uint32_t until = s_ticks + delay_ms;      // Time in a future when we need to stop
    while (s_ticks < until) (void) 0;   // Loop until then
}

void SystemInit(void) {
	// Enable FPU set CP10 and CP11 Full Access
	SCB->CPACR |= ((3UL << 10 * 2) | (3UL << 11 * 2));  

	// Reset the RCC clock configuration to the default reset state
	SET_BIT(RCC->CR, RCC_CR_HSION);

	// Reset CFGR register
	MODIFY_REG(RCC->CFGR, RCC_CFGR_SW_Msk, RCC_CFGR_SW_HSI);
	MODIFY_REG(RCC->CFGR, RCC_CFGR_HPRE_Msk, RCC_CFGR_HPRE_DIV1);
	MODIFY_REG(RCC->CFGR, RCC_CFGR_PPRE1_Msk, RCC_CFGR_PPRE1_DIV1);
	MODIFY_REG(RCC->CFGR, RCC_CFGR_PPRE2_Msk, RCC_CFGR_PPRE2_DIV1);
	MODIFY_REG(RCC->CFGR, RCC_CFGR_I2SSRC_Msk, RCC_CFGR_I2SSRC_SYSCLK);
	MODIFY_REG(RCC->CFGR, RCC_CFGR_MCO_Msk, RCC_CFGR_MCO_NOCLOCK);

	// Reset HSEON, CSSON and PLLON bits
	MODIFY_REG(RCC->CR, RCC_CR_HSEON_Msk, 0);
	MODIFY_REG(RCC->CR, RCC_CR_CSSON_Msk, 0);
	MODIFY_REG(RCC->CR, RCC_CR_PLLON_Msk, 0);

	// Reset HSEBYP bit 
	RCC->CR &= (uint32_t)0xFFFBFFFF;

	// Reset PLLSRC, PLLXTPRE, PLLMUL and USBPRE bits 
	RCC->CFGR &= (uint32_t)0xFF80FFFF;

	// Reset PREDIV1[3:0] bits 
	RCC->CFGR2 &= (uint32_t)0xFFFFFFF0;

	// Reset USARTSW[1:0], I2CSW and TIMs bits 
	RCC->CFGR3 &= (uint32_t)0xFF00FCCC;

	// Disable all interrupts 
	RCC->CIR = 0x00000000;

	// Configure the System clock source, PLL Multiplier and Divider factors, 
	// AHB/APBx prescalers and Flash settings
	set_sys_clock();
}

/**
  * @brief  Configures the System clock source, PLL Multiplier and Divider factors, 
  *         AHB/APBx prescalers and Flash settings
  * @Note   This function should be called only once the RCC clock configuration  
  *         is reset to the default reset state (done in SystemInit() function).   
  * @param  None
  * @retval None
  */
static void set_sys_clock(void) {
  volatile uint32_t StartUpCounter = 0, HSEStatus = 0;
  
  /* SYSCLK, HCLK, PCLK2 and PCLK1 configuration ---------------------------*/    
#if defined (PLL_SOURCE_HSI)
  /* At this stage the HSI is already enabled */

  /* Enable Prefetch Buffer and set Flash Latency */
  FLASH->ACR = FLASH_ACR_PRFTBE | FLASH_ACR_LATENCY_1;
 
  /* HCLK = SYSCLK */
  RCC->CFGR |= (uint32_t)RCC_CFGR_HPRE_DIV1;
      
  /* PCLK = HCLK */
  RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE1_DIV2 | (uint32_t)RCC_CFGR_PPRE2_DIV1;

  /* PLL configuration */
  RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_PLLSRC | RCC_CFGR_PLLXTPRE | RCC_CFGR_PLLMULL));
  RCC->CFGR |= (uint32_t)(RCC_CFGR_PLLSRC_HSI_Div2 | RCC_CFGR_PLLXTPRE_PREDIV1 | RCC_CFGR_PLLMULL16);
            
  /* Enable PLL */
  RCC->CR |= RCC_CR_PLLON;

  /* Wait till PLL is ready */
  while((RCC->CR & RCC_CR_PLLRDY) == 0)
  {
  }

  /* Select PLL as system clock source */
  RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
  RCC->CFGR |= (uint32_t)RCC_CFGR_SW_PLL;    

  /* Wait till PLL is used as system clock source */
  while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS) != (uint32_t)RCC_CFGR_SWS_PLL)
  {
  }  
#else
 #if defined (PLL_SOURCE_HSE)
  /* Enable HSE */    
  RCC->CR |= ((uint32_t)RCC_CR_HSEON);
 #elif defined (PLL_SOURCE_HSE_BYPASS)
  /* HSE oscillator bypassed with external clock */    
  SET_BIT(RCC->CR, RCC_CR_HSEON);
  SET_BIT(RCC->CR, RCC_CR_HSEBYP);
 #endif /* PLL_SOURCE_HSE */
   
  /* Wait till HSE is ready and if Time out is reached exit */
  do
  {
    StartUpCounter++;  
  } while((READ_BIT(RCC->CR, RCC_CR_HSERDY) == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));

  if (READ_BIT(RCC->CR, RCC_CR_HSERDY) != RESET)
  {
    HSEStatus = (uint32_t)0x01;
  }
  else
  {
    HSEStatus = (uint32_t)0x00;
  }  

  if (HSEStatus == (uint32_t)0x01)
  {
    /* Enable Prefetch Buffer and set Flash Latency */
    FLASH->ACR = FLASH_ACR_PRFTBE | FLASH_ACR_LATENCY_1;
 
    /* HCLK = SYSCLK */
    SET_BIT(RCC->CFGR, RCC_CFGR_HPRE_DIV1);
      
    /* PCLK2 = HCLK */
    SET_BIT(RCC->CFGR, RCC_CFGR_PPRE2_DIV1);
    
    /* PCLK1 = HCLK */
    SET_BIT(RCC->CFGR, RCC_CFGR_PPRE1_DIV2);
    
   
    /*  PLL configuration: PLLCLK = HSE * 9 = 72 MHz */
    RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_PLLSRC | RCC_CFGR_PLLXTPRE | RCC_CFGR_PLLMUL));
    RCC->CFGR |= (uint32_t)(RCC_CFGR_PLLSRC_HSE_PREDIV | RCC_CFGR_PLLMUL9);
    /* Enable PLL */
    RCC->CR |= RCC_CR_PLLON;

    /* Wait till PLL is ready */
    while((RCC->CR & RCC_CR_PLLRDY) == 0) { }

    /* Select PLL as system clock source */
    RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
    RCC->CFGR |= (uint32_t)RCC_CFGR_SW_PLL;    

    /* Wait till PLL is used as system clock source */
    while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS) != (uint32_t)RCC_CFGR_SWS_PLL) { }
  }
  else
  { /* If HSE fails to start-up, the application will have wrong clock 
       configuration. User can add here some code to deal with this error */
  } 
#endif /* PLL_SOURCE_HSI */  
}

