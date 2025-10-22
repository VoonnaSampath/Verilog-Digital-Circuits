# 4x1 Multiplexer – Verilog

## 🧠 Project Overview
This project demonstrates the implementation of a **4-to-1 Multiplexer (MUX)** using Verilog in **gate-level modeling**. A multiplexer selects one of several input signals and forwards it to a single output line based on select inputs. The design is verified using a Verilog testbench and simulated with waveform generation.

## ✅ Key Features
- **Functionality**: Implements a 4x1 multiplexer
- **Inputs**:
  - `I[3:0]` – 4 data inputs
  - `S[1:0]` – 2-bit select input
- **Output**:
  - `OUT` – Selected data line
- **Design Style**: Gate-level modeling (`and`, `or`, `not`)
- **Simulation**:
  - Testbench applies different `S` values while `I` is fixed
  - Waveform observed using `$fsdbDumpvars` for Verdi

## 📂 Files Included
- `mux.v` – Verilog source code for 4x1 MUX
- `mux_tb.v` – Verilog testbench for the MUX
- `mux_waveform.fsdb` – Simulation waveform file (Verdi format)
- `mux_waveform.png` – Exported waveform screenshot
- `README.md` – Documentation for this module

## 🔗 Simulation
The testbench cycles through all select inputs:
S = 00 → OUT = I[0]
S = 01 → OUT = I[1]
S = 10 → OUT = I[2]
S = 11 → OUT = I[3]
---

## ⚙️ How the Multiplexer Works
The logic equation for a 4x1 multiplexer is:
OUT = (~S1 · ~S0 · I0) + (~S1 · S0 · I1) + (S1 · ~S0 · I2) + (S1 · S0 · I3)
This is implemented using `not`, `and`, and `or` gates in Verilog.

---

## 📊 Example Simulation
With `I = 1010`:

| Select Inputs (S1 S0) | Output (OUT) |
|------------------------|--------------|
| 00                     | 1 (I0)       |
| 01                     | 0 (I1)       |
| 10                     | 1 (I2)       |
| 11                     | 0 (I3)       |

---

## 🖼 Waveform
![MUX Waveform](mux_waveform.png)

---

## 🛠 Tools Used
- **Verilog** – Design & testbench
- **Verdi** – Waveform visualization (`fsdbDumpvars`)
- **VCS** – For simulation

---

> 💡 This project is part of the Verilog portfolio, showcasing **gate-level digital design** and testbench-based verification, fundamental for VLSI design and hardware modeling.