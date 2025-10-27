# ➕ 1-Bit Full Adder – Verilog

## 🧠 Project Overview

This project implements a **1-bit Full Adder** using Verilog.  
A full adder adds three 1-bit inputs: `A`, `B`, and `Cin` (carry-in), and produces a 1-bit `Sum` and a `Cout` (carry-out).  
This is a basic building block for multi-bit binary adders and arithmetic circuits.

---

## ✅ Key Features

- **Functionality**:
  - A=0, B=0, Cin=0 → Sum=0, Cout=0  
  - A=1, B=0, Cin=0 → Sum=1, Cout=0  
  - A=1, B=0, Cin=1 → Sum=0, Cout=1  
  - (All combinations can be tested similarly)
- **Inputs**:
  - `A` – First input  
  - `B` – Second input  
  - `Cin` – Carry-in  
- **Outputs**:
  - `Sum` – Sum output  
  - `Cout` – Carry-out  

---

## 📂 Files Included

- `fa.v` – Verilog design of 1-bit full adder  
- `fa_tb.v` – Testbench for full adder  
- `fa_waveform.png` – Screenshot of simulation waveform (optional)  
- `README.md` – Documentation for this module  

---

## ⚙️ How It Works

1. `Sum` is calculated using two XOR gates: `(A ^ B) ^ Cin`  
2. `Cout` is calculated using: `(A & B) | ((A ^ B) & Cin)`  
3. Implemented structurally using logic gates: XOR, AND, and OR  

---

## 📊 Testbench Simulation Output

From `fa_tb.v`:

| A | B | Cin | Sum | Cout |
|---|---|-----|-----|------|
| 1 | 0 |  0  |  1  |  0   |
| 1 | 0 |  1  |  0  |  1   |

---

## 🖼 Waveform

**1-Bit Full Adder Waveform**
![1-Bit Full Adder Waveform](fa_waveform.png)

---

## 🛠 Tools Used

- **Verilog** – RTL design and testbench  
- **Verdi** – Waveform visualization (`$fsdbDumpvars`)  
- **VCS** – Simulation  

---

> 💡 The full adder is a fundamental digital building block and is commonly used to build multi-bit adders, ALUs, and arithmetic logic circuits.
