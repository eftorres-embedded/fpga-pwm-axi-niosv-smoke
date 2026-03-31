# PWM Subsystem

## Description

This directory contains the RTL implementation of a parameterizable PWM subsystem.

## Modules

- pwm_timebase.sv: Generates the PWM counter and timing signals  
- pwm_compare.sv: Compares counter value with duty cycle  
- pwm_core_ip.sv: Integrates timebase and compare logic  
- pwm_regs.sv: MMIO register interface  
- pwm_subsystem.sv: Top-level PWM integration  

## Features

- Configurable period and duty cycle
- Shadow and active register model
- Optional synchronization on period boundary

## Memory Map

The PWM subsystem is controlled through memory-mapped registers. The base address is assigned by the interconnect or Platform Designer system.

| Offset | Register   | Access | Description |
|--------|------------|--------|-------------|
| 0x00   | REG_CTRL   | R/W    | Control register |
| 0x04   | REG_PERIOD | R/W    | PWM period register |
| 0x08   | REG_DUTY   | R/W    | PWM duty-cycle register |
| 0x0C   | REG_APPLY  | W      | Apply shadow register values to active registers |
| 0x10   | REG_STATUS | R      | Status register |
| 0x14   | REG_CNT    | R      | Current PWM counter value |

### REG_CTRL

| Bit | Name            | Description |
|-----|-----------------|-------------|
| 0   | ENABLE          | Enables PWM output when set |
| 1   | USE_DEFAULT     | Selects default duty-cycle behavior when set |
| 2   | APPLY           | Write-one-to-apply control bit |
| 31:3| Reserved        | Reserved |

### REG_PERIOD

- Stores the shadow period value written by software.
- Applied to the active period register when `APPLY` is triggered.

### REG_DUTY

- Stores the shadow duty-cycle value written by software.
- Applied to the active duty register when `APPLY` is triggered.

### REG_APPLY

- Write `1` to request transfer of shadow register values into the active registers.
- When `APPLY_ON_PERIOD_END = 1`, the update occurs at the period boundary.
- When `APPLY_ON_PERIOD_END = 0`, the update occurs immediately.

### REG_STATUS

| Bit | Name           | Description |
|-----|----------------|-------------|
| 0   | PERIOD_END     | Indicates end-of-period event |
| 1   | APPLY_PENDING  | Indicates an apply request is pending |
| 31:2| Reserved       | Reserved |

### REG_CNT

- Returns the current counter value from the PWM timebase.

## Software Contract

Recommended register write sequence:

1. Write `REG_PERIOD`
2. Write `REG_DUTY`
3. Update `REG_CTRL` bits `[1:0]` as needed
4. Trigger `APPLY` by writing `1`

## Notes

- Designed for integration with AXI-lite or generic MMIO interface
- Controlled via software through register writes
- Base address is system-dependent and defined by the SoPC address map