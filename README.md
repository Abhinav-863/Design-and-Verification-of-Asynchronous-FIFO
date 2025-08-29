# Design-and-Verification-of-Asynchronous-FIFO

1. Designed an Asynchronous FIFO (16×8) in Verilog to enable reliable data transfer between two clock domains with independent frequencies.
2. Implemented Gray code-based pointer synchronization and toggle-flag mechanism to detect full/empty conditions and handle overflow/underflow errors.
3. Built a SystemVerilog Testbench architecture using OOP concepts, including transaction classes, generator, driver (BFM), monitor, agents, environment, and scoreboard.
4. Developed stimulus generators to verify write, read, full, empty, overflow, and underflow scenarios with randomized transactions.
5. Implemented Scoreboard-based checking to validate functional correctness by comparing written and read data.
6. Automated simulation with testname plusargs to support multiple verification scenarios in a single environment.
7. Collected functional coverage and debugged waveform outputs using FSDB dumps.
