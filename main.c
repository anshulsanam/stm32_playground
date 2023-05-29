#include "mcu.h"

int main(void) {
    // Enable clock for GPIO port E
    RCC->AHBENR |= RCC_AHBENR_GPIOEEN;
    gpio_set_mode(GPIOE, 9, GPIO_MODE_OUTPUT);
    for (;;) {
        gpio_write(GPIOE, 9, LOW);
        spin(999999);
        gpio_write(GPIOE, 9, HIGH);
        spin(999999);
    }
    return 0; 
}
