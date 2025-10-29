# Verilog HDL Projects Repository

## 📘 Overview

This repository contains a collection of **Verilog HDL design and testbench files** developed for various **digital logic, sequential circuits, and arithmetic modules**.  
Each folder represents an independent module or experiment with its own `README.md`, design file(s), testbench, and waveform outputs.

---

## 📂 Repository Structure

| Folder / File             | Description                                                                                  |
|--------------------------|----------------------------------------------------------------------------------------------|
| **1bit_Full_Adder/**       | Contains 1-bit full adder design and testbench files.                                        |
| **4bit_Adder/**            | Ripple-carry 4-bit adder built using 1-bit adders.                                          |
| **4bit_Subtractor/**       | 4-bit full subtractor implementation using cascaded 1-bit subtractors.                      |
| **4bit_ALU/**              | Complete 4-bit ALU supporting AND, OR, XOR, and ADD operations.                             |
| **MUX_2x1/**               | 2-to-1 Multiplexer using if-else, case, and gate-level modeling.                            |
| **MUX_4x1/**               | 4-to-1 Multiplexer implemented and verified using behavioral modeling.                      |
| **4bit_Parity_Generator_Checker/** | Even/Odd parity generator and checker for 4-bit data.                                   |
| **4bit_CLA/**              | 4-bit Carry Lookahead Adder implementation and testbench.                                  |
| **Priority_Encoder_4to2/** | 4-to-2 Priority Encoder design and waveform results.                                       |
| **SR_Latch_NOR/**          | SR Latch using NOR gates with gate-level modeling.                                         |
| **SR_Latch_NAND/**         | SR Latch using NAND gates with complementary behavior.                                     |
| **SR_FlipFlop/**           | Edge-triggered SR Flip-Flop derived from SR latch.                                         |
| **JK_FlipFlop/**           | JK Flip-Flop using behavioral modeling and testbench.                                      |
| **D_FlipFlop/**            | D Flip-Flop with asynchronous reset (behavioral + gate-level).                             |
| **T_FlipFlop/**            | T (Toggle) Flip-Flop using behavioral modeling.                                            |
| **Mealy_Moore_1101_Sequence_Detector/** | FSM-based 1101 sequence detector (Mealy & Moore versions).                          |
| **Shift_Register_SISO/**   | 4-bit Serial-In Serial-Out shift register.                                                 |
| **Shift_Register_Universal/** | 4-bit Universal Shift Register supporting Hold, Shift, and Load operations.             |
| **Ring_Counter/**          | 4-bit ring counter with circular rotation.                                                |
| **Johnson_Counter/**       | 4-bit Johnson counter implementation.                                                     |
| **Barrel_Shifter_4bit/**   | 4-bit barrel shifter using multiplexers.                                                  |
| **BCD_to_7Segment/**       | BCD to 7-segment decoder using behavioral modeling.                                       |
| **Array_Multiplier_4x4/** | 4x4 array multiplier built using full adders.                                             |
| **Register_4bit/**         | 4-bit register with enable and asynchronous reset.                                        |
| **4bit_Logic_Gates/**      | AND, OR, XOR 4-bit gate implementations.                                                  |
| **LICENSE**                | Licensing information (MIT License).                                                      |
| **.gitignore**             | Git ignore configuration for simulation and temporary files.                             |
| **README.md**              | Repository documentation (this file).                                                    |

---

## 🛠 Tools Used

- **Verilog HDL** – Design & Testbench development  
- **Synopsys VCS** – Simulation and verification  
- **Verdi** – Waveform viewing  
- **Git & GitHub** – Version control and documentation  

---

## 📑 Notes

- Each module folder includes:
  - `Design file (.v)`  
  - `Testbench file "_tb" (.v)`  
  - `Waveform/Result image (.png)`
  - `README.md` for module-specific explanation  

---

> 🧩 *This repository serves as a complete collection of Verilog-based digital system designs covering combinational, sequential, arithmetic, and FSM circuits.*
