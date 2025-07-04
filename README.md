# dff-verification-systemverilog

This repository contains a modular SystemVerilog testbench to verify a D Flip-Flop (DFF) design. It uses mailboxes, events, and class-based components like generators, drivers, monitors, and a scoreboard

dff-verification-systemverilog/
├── src/
│   ├── dff.sv
│  
├── tb/
│   ├── transaction.sv
│   ├── generator.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── scoreboard.sv
│   ├── env.sv
│   └── tb.svd
├── README.md

 Modular testbench with:
  - `transaction` class for input/output abstraction
  - `generator` to randomize and send inputs
  - `driver` to drive DUT
  - `monitor` to capture DUT output
  - `scoreboard` to check correctness
  - `environment` to integrate all components
- Uses `mailbox` for inter-component communication
- Uses `event` to synchronize generator and scoreboard
- Clock and reset generation included
- VCD dump for waveform analysis
