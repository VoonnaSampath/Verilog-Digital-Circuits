# 4-bit Priority Encoder – Verilog

## 🧠 Project Overview

This project implements a **4-bit priority encoder** in Verilog using gate-level modeling and behavioral modeling.  
A priority encoder outputs the binary representation of the **highest-priority active input**. If no input is active, the `valid` signal indicates that the output is invalid.  

The design is tested with a Verilog testbench and observed with waveform simulation.

---

## ✅ Key Features

- **Functionality**:
  - Encodes 4 input lines (`i3, i2, i1, i0`) into a 2-bit binary output (`y1, y0`)
  - Priority: `i3 > i2 > i1 > i0`
  - Provides a `valid` flag indicating if any input is active
- **Inputs**:
  - `i3, i2, i1, i0` – 4-bit input signals
- **Outputs**:
  - `y[1:0]` – Encoded 2-bit output
  - `valid` – High when one or more inputs are active
- **Design Style**: Gate-level modeling (using `or`, `nor`, `and`, `not`)

---

## 📂 Files Included

- `priorityencoder4bit.v` – Verilog source code of the 4-bit priority encoder in gate level
- `priorityencoder4bit_tb.v` – Testbench for the priority encoder in gate level
- `4bitpriorityencoder.v` – Verilog source code of the 4-bit priority encoder in behavioral
- `4bitpriorityencoder_tb.v` – Testbench for the priority encoder in behavioral
- `priorityencoder_waveform.png` – Screenshot of waveform  
- `README.md` – Documentation for this module  

---

## ⚙️ How It Works

1. The encoder checks the inputs from **highest priority (i3)** to **lowest (i0)**.  
2. The binary code for the highest active input is placed on outputs `y1 y0`.  
3. The `valid` signal is asserted high when any input is active.  
4. If all inputs are zero, the encoder output is `00` and `valid = 0`.  

Priority logic:
y1 = i3 + i2
y0 = i3 + (~i3·~i2·i1)
valid = i3 + i2 + i1 + i0

---

## 📊 Test Bench Simulation Output (Gate level)

From `priorityencoder4bit_tb.v`:

| i3 | i2 | i1 | i0 | y1 | y0 | valid |
|----|----|----|----|----|----|-------|
| 0  | 0  | 0  | 0  |  0 |  0 |   0   |
| 0  | 0  | 0  | 1  |  0 |  0 |   1   |
| 0  | 0  | 1  | x  |  0 |  1 |   1   |
| 0  | 1  | x  | x  |  1 |  0 |   1   |
| 1  | x  | x  | x  |  1 |  1 |   1   |

---

### 🧪 Simulated Output (Behavioral Model)

| Input D3 | D2 | D1 | D0 | → | Output Y1 | Y0 | Valid | Description |
|:---------:|:--:|:--:|:--:|:-:|:----------:|:--:|:------:|:-------------|
| 0 | 0 | 0 | 0 | → | 0 | 0 | 0 | No valid input (none active) |
| 0 | 0 | 0 | 1 | → | 0 | 0 | 1 | D0 active → Code = 00 |
| 0 | 0 | 1 | 0 | → | 0 | 1 | 1 | D1 active → Code = 01 |
| 0 | 1 | 0 | 0 | → | 1 | 0 | 1 | D2 active → Code = 10 |
| 1 | 0 | 0 | 0 | → | 1 | 1 | 1 | D3 active → Code = 11 |
| 1 | 0 | 1 | 0 | → | 1 | 1 | 1 | D3 has higher priority → Code = 11 |
| 0 | 1 | 1 | 1 | → | 1 | 0 | 1 | D2 has higher priority → Code = 10 |
| 1 | 1 | 0 | 0 | → | 1 | 1 | 1 | D3 highest priority → Code = 11 |

> ✅ The **4-to-2 Priority Encoder** correctly outputs the binary code of the **highest-priority active input** (D3 > D2 > D1 > D0) and asserts the **Valid** signal when any input is high.

---

## 🖼 Waveform

**Priority Encoder Gate level Waveform**
![Priority Encoder Gate level Waveform](priorityencoder_gatelevel.png)
**Priority Encoder Behavioral Waveform**
![Priority Encoder Behavioral Waveform](priorityencoder_behavioral.png)

---

## 🛠 Tools Used

- **Verilog** – RTL design and testbench  
- **Verdi** – Waveform visualization (`$fsdbDumpvars`)  
- **VCS** – Simulation  

---

> 💡 This project demonstrates a **priority encoder**, an essential circuit used in processors, interrupt controllers, and digital communication systems.
