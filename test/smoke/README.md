# Smoke Test Procedure

## Purpose

The smoke test validates basic system functionality after hardware and software integration.

## Scope

- Processor execution
- Memory access
- JTAG UART communication

## Procedure

1. Program FPGA using Quartus
2. Build BSP and application
3. Download application to target memory
4. Open JTAG UART terminal
5. Observe output

## Expected Behavior

The system should print a sequence of messages and LED intensity changing.

## Failure Modes

- No UART output
- LED not changing brightness
- Incorrect or partial output
- Application fails to start

## Common Causes

- Incorrect memory initialization
- Invalid `.sopcinfo` path
- BSP misconfiguration
- Toolchain issues
- Debugger connection failure
- Misconenction on Platform Designer

## Verification Criteria

- Output matches expected sequence
- System runs continuously without reset or hang