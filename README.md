## Digital Systems Design Lecture

This repository contains VHDL and Verilog implementations developed for the **Digital Systems Design** course in Fall 2023. The materials cover fundamental digital logic concepts with both hardware description languages.

## Repository Contents

### Core Components
- **Combinational Logic**  
  - Arithmetic circuits (Adders, Multipliers)  
  - Data routing (MUXs, Decoders)  
- **Sequential Logic**  
  - Storage elements (Flip-flops, Registers)  
  - Finite State Machines (Moore/Mealy)  

### Language-Specific Implementations
- **VHDL**  
  - All core components  
  - Testbenches with clock-cycle accuracy  
- **Verilog**  
  - Basic arithmetic and sequential circuits  
  - Behavioral modeling examples  

## Technologies and Tools

### Dependencies
- **Simulation**:
  - GHDL ≥ 3.0 (or ModelSim/QuestaSim)
  - Verilog: Icarus Verilog ≥ 11.0 (or Verilator)
  - GTKWave ≥ 3.3.0 for waveform viewing
- **Synthesis** (optional):
  - Xilinx Vivado ≥ 2022.2
  - Quartus Prime ≥ 22.0 (for Intel FPGA targets)
- **Supporting Packages**:
  - Python 3.8+ (for test automation scripts)
  - make ≥ 4.0 (for build automation)

### Key Features
- Dual-Language Support*: Compare VHDL/Verilog implementations
- Verification-Centric: Includes testbenches for all major components
- Tool-Agnostic: Compatible with both open-source and commercial EDA tools

## License

This repository is intended for educational purposes. Refer to the `LICENSE` file for details.
