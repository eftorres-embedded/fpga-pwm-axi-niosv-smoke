# FPGA Nios V Bring-Up (Smoke Test)

This project demonstrates a complete hardware/software bring-up using a Nios V RISC-V soft processor on the DE10-Lite FPGA.

## Overview

The objective is to establish a repeatable workflow for:
- Instantiating a processor system in Platform Designer
- Building and programming the FPGA using Quartus
- Running software on hardware through a JTAG UART interface

This project serves as a foundation for integrating custom peripherals such as PWM, SPI, and I2C.

## System Components

- Nios V/m processor    (Provided by Platform Designer)
- On-chip memory        (Provided by Platform Designer)
- JTAG UART             (Provided by Platform Designer)
- Clock and reset logic (Provided by Platform Designer)
- PWM module (AXI4lite) (Provided by the user)

## Project Structure

rtl/       Hardware design (PWM, AXI interface, top-level)  
pd/        Platform Designer system (.qsys, .sopcinfo)  
quartus/   Quartus project files (.qpf, .qsf, .sdc)  
sw/        Software application and BSP  
test/      Smoke test documentation  
docs/      Images and supporting documentation  

## Smoke Test

The software application verifies:
- Processor execution
- BSP configuration
- JTAG UART communication

### Expected Output

For intial test (sanity check):
Hello World

## Build Flow Summary

1. Generate system in Platform Designer  
2. Compile design in Quartus  
3. Program FPGA  
4. Build BSP and application  
5. Run application and verify UART output  

## Notes

- Do not modify generated files under `pd/system/`
- Quartus build artifacts are excluded via `.gitignore`
- Source RTL is maintained under `rtl/`

## Future Work

- Integration of custom SPI and I2C peripherals
- AXI-lite register interface validation
- Software-controlled hardware peripherals