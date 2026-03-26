# Nios V Application (Smoke Test)

## Description

This application verifies that the Nios V processor system is correctly configured and operational.

## Functionality

- Prints initialization message
- Executes a simple loop with output
- Confirms runtime stability and UART communication

## Source File

main.c

## Expected Output

Hello World

and LED fading in and out

## Build Instructions

1. Build BSP  
2. Configure toolchain (if required)  
3. Build application  
4. Download to target  
5. Open JTAG UART terminal  

## Notes

- Ensure correct `.sopcinfo` is referenced
- Verify BSP paths are valid
- Confirm JTAG connection before running