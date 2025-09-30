# JK Flip-Flop – Verilog

## 🧠 Project Overview
This project implements a **JK flip-flop** in Verilog.  
The JK flip-flop is a clocked memory device with two inputs (J and K) that can perform **set, reset, toggle, and hold** functions depending on the input combination.

---

## ✅ Key Features
- **Functionality**:
  - J=0, K=0 → Hold state
  - J=0, K=1 → Reset (Q=0)
  - J=1, K=0 → Set (Q=1)
  - J=1, K=1 → Toggle (Q flips state)
- **Inputs**:
  - `J` – Set input
  - `K` – Reset input
  - `CLK` – Clock signal
- **Outputs**:
  - `Q` – Stored value
  - `Qn` – Complement of Q

---

## 📂 Files Included
- `jkff.v` – Verilog design of JK flip-flop  
- `jkff_tb.v` – Testbench for JK flip-flop  
- `jkff_waveform.fsdb` – Waveform dump file  
- `jkff_waveform.png` – Screenshot of simulation waveform  
- `README.md` – Documentation for this module  

---

## ⚙️ How It Works
1. The JK flip-flop operates like an SR latch but resolves the invalid condition.  
2. When J=K=1, it **toggles** output `Q` at every clock edge.  
3. Used in counters, shift registers, and FSMs.  

---

## 📊 Testbench Simulation Output

| CLK | J | K | Q | Qn |
|-----|---|---|---|----|
| ↑   | 0 | 0 | Hold | Hold |
| ↑   | 0 | 1 | 0    | 1    |
| ↑   | 1 | 0 | 1    | 0    |
| ↑   | 1 | 1 | Toggle | Toggle |

---

## 🖼 Waveform
![JK Flip-Flop Waveform](jkff_waveform.png)

---

## 🛠 Tools Used
- **Verilog** – RTL design and testbench  
- **Verdi** – Waveform visualization (`$fsdbDumpvars`)  
- **Icarus Verilog / VCS / ModelSim** – Simulation  

---

> 💡 The **JK flip-flop** is widely used in **counters and sequence detectors**.