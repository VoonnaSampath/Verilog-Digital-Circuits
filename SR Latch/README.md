# SR Latch (NAND-based) – Verilog

## 🧠 Project Overview
This project implements an **SR latch** using **NAND gates** in Verilog.  
The SR (Set-Reset) latch is a fundamental memory element that stores 1 bit of data.  
It has two inputs: **Set (S)** and **Reset (R)**, and two outputs: **Q** and **Qn (complement)**.  

The design is tested with a Verilog testbench and verified using waveform simulation.

---

## ✅ Key Features
- **Functionality**:
  - Stores 1 bit of state
  - Set (`S=1, R=0`) → `Q=1, Qn=0`
  - Reset (`S=0, R=1`) → `Q=0, Qn=1`
  - Hold (`S=0, R=0`) → retains last state
  - Invalid (`S=1, R=1`) → both outputs forced to 0 (for NAND SR latch)
- **Inputs**:
  - `S` – Set input
  - `R` – Reset input
- **Outputs**:
  - `Q` – Normal output
  - `Qn` – Complement output

---

## 📂 Files Included
- `srlatch.v` – Verilog design of NAND SR latch  
- `srlatch_tb.v` – Testbench for SR latch  
- `srlatch_waveform.fsdb` – Waveform dump file  
- `srlatch_waveform.png` – Screenshot of simulation waveform  
- `README.md` – Documentation for this module  

---

## ⚙️ How It Works
1. Two **cross-coupled NAND gates** are used.  
2. The latch maintains its state until inputs change.  
3. The **feedback loop** ensures memory storage.  
4. The output behavior depends on the combination of `S` and `R`.  

---

## 📊 Testbench Simulation Output
From `srlatch_tb.v`:

| S | R | Q | Qn |
|---|---|---|----|
| 0 | 0 | 0 | 1 |
| 1 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 |
| 0 | 0 | 0 | 1 |
| 1 | 1 | 0 | 0 |

---

## 🖼 Waveform
![SR Latch Waveform](srlatch_waveform.png)

---

## 🛠 Tools Used
- **Verilog** – RTL design and testbench  
- **Verdi** – Waveform visualization (`$fsdbDumpvars`)  
- **Icarus Verilog / VCS / ModelSim** – Simulation  

---

> 💡 The **SR latch** is the building block for flip-flops and sequential logic. Understanding its working is essential for designing FSMs and memory circuits.