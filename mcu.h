#pragma once

#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

#include "stm32f3xx.h"

#define FREQ 16000000  // CPU frequency, 16 Mhz
#define BIT(x) (1UL << (x))
#define PIN(bank, num) ((((bank) - 'A') << 8) | (num))
#define PINNO(pin) (pin & 255)
#define PINBANK(pin) (pin >> 8)


// Enum values are per datasheet: 0, 1, 2, 3
enum { GPIO_MODE_INPUT, GPIO_MODE_OUTPUT, GPIO_MODE_AF, GPIO_MODE_ANALOG };
static inline void gpio_set_mode(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, uint8_t mode) {
    GPIOx->MODER &= ~(3U << (GPIO_Pin * 2));  // Clear existing setting
    GPIOx->MODER |= (mode & 3) << (GPIO_Pin * 2);    // Set new mode
}

enum { LOW, HIGH };
static inline void gpio_write(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, uint8_t val) {
    GPIOx->BSRR = (1U << GPIO_Pin) << (val ? 0 : 16);
}

static inline void spin(volatile uint32_t count) {
    while (count--) (void) 0;
}

