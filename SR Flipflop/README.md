# SR Flip-Flop – Verilog

## 🧠 Project Overview
This project implements an **SR (Set-Reset) flip-flop** in Verilog.  
The SR flip-flop is a clocked memory element built from SR latches.  
It stores **1 (Set)**, **0 (Reset)**, or **retains its state (Hold)** depending on inputs, but has an **invalid condition** when both `S` and `R` are active simultaneously.

---

## ✅ Key Features
- **Functionality**:
  - S=0, R=0 → Hold (retain state)
  - S=1, R=0 → Set (Q=1)
  - S=0, R=1 → Reset (Q=0)
  - S=1, R=1 → Invalid condition (both outputs forced LOW)
- **Inputs**:
  - `S` – Set input  
  - `R` – Reset input  
  - `CLK` – (if clocked version) clock signal  
- **Outputs**:
  - `Q` – Stored value  
  - `Qn` – Complement of Q  

---

## 📂 Files Included
- `srff.v` – Verilog design of SR flip-flop  
- `srff_tb.v` – Testbench for SR flip-flop  
- `srff_waveform.fsdb` – Waveform dump file  
- `srff_waveform.png` – Screenshot of simulation waveform  
- `README.md` – Documentation for this module  

---

## ⚙️ How It Works
1. When **S=1 and R=0**, the output is **Set (Q=1)**.  
2. When **S=0 and R=1**, the output is **Reset (Q=0)**.  
3. When **S=0 and R=0**, the flip-flop **retains its previous state**.  
4. When **S=1 and R=1**, the condition is **invalid** (for NAND implementation, outputs forced LOW).  

---

## 📊 Testbench Simulation Output

From `srff_tb.v`:

| S | R | Q | Qn |
|---|---|---|----|
| 0 | 0 | Hold | Hold |
| 1 | 0 | 1    | 0    |
| 0 | 1 | 0    | 1    |
| 0 | 0 | Hold | Hold |
| 1 | 1 | 0    | 0 (Invalid) |

---

## 🖼 Waveform
![SR Flip-Flop Waveform](srff_waveform.png)

---

## 🛠 Tools Used
- **Verilog** – RTL design and testbench  
- **Verdi** – Waveform visualization (`$fsdbDumpvars`)  
- **Icarus Verilog / VCS / ModelSim** – Simulation  

---

> 💡 The **SR flip-flop** is the foundation of all sequential circuits but is rarely used alone because of the **invalid condition**. Instead, D and JK flip-flops are preferred in modern designs.