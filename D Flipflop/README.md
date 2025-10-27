# D Flip-Flop – Verilog

## 🧠 Project Overview
This project implements a **D flip-flop** in Verilog.  
The D (Data/Delay) flip-flop is a clocked memory element that captures the value of the input `D` on the rising edge of the clock and stores it until the next clock edge.

---

## ✅ Key Features
- **Functionality**:
  - `Q` follows `D` on clock edge
  - Holds the stored value between clock events
- **Inputs**:
  - `D` – Data input
  - `CLK` – Clock signal
- **Outputs**:
  - `Q` – Stored value
  - `Qn` – Complement of Q

---

## 📂 Files Included
- `dff.v` – Verilog design of D flip-flop  
- `dff_tb.v` – Testbench for D flip-flop  
- `dff_waveform.fsdb` – Waveform dump file  
- `dff_waveform.png` – Screenshot of simulation waveform  
- `README.md` – Documentation for this module  

---

## ⚙️ How It Works
1. On the **positive clock edge**, `Q` takes the value of `D`.  
2. Between clock edges, `Q` retains its stored value.  
3. `Qn` always represents the inverted value of `Q`.  

---

## 📊 Testbench Simulation Output

| CLK | D | Q | Qn |
|-----|---|---|----|
| ↑   | 0 | 0 | 1 |
| ↑   | 1 | 1 | 0 |
| ↑   | 0 | 0 | 1 |
| ↑   | 1 | 1 | 0 |

---

## 🖼 Waveform
![D Flip-Flop Gate level Waveform](dff_gatelevel.png)
![D Flip-Flop Behavioral Waveform](dff_behav.png)

---

## 🛠 Tools Used
- **Verilog** – RTL design and testbench  
- **Verdi** – Waveform visualization (`$fsdbDumpvars`)  
- **VCS** – Simulation  

---

> 💡 The **D flip-flop** is the foundation of registers, shift registers, and counters.