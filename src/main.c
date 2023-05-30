#include "mcu.h"

int main(void) {
    // Set up clock and stuff
    SystemInit();
    // Start ticking at 1ms
    systick_init(MCU_FREQ);


    // Enable clock for GPIO port E
    SET_BIT(RCC->AHBENR, RCC_AHBENR_GPIOEEN);
    gpio_set_mode(GPIOE, 9, GPIO_MODE_OUTPUT);
    for (;;) {
        gpio_write(GPIOE, 9, HIGH);
        delay(1000);
        gpio_write(GPIOE, 9, LOW);
        delay(1000);
    }
    return 0; 
}

