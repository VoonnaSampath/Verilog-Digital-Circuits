# BCD to 7-Segment Display Decoder – Verilog

## 🧠 Project Overview

This project implements a **BCD (Binary Coded Decimal) to 7-Segment Display Decoder** using **behavioral modeling** in Verilog.  
The circuit converts a 4-bit BCD input (representing decimal digits 0–9) into a 7-bit output pattern that drives a **common-cathode 7-segment display** to show corresponding numbers (0–9).  
For invalid BCD inputs (A–F), a dash (`-`) pattern is displayed.

---

## ✅ Key Features

- **Functionality**: Converts 4-bit BCD input into 7-segment display encoding.
- **Modeling Style**: Behavioral (using `case` statement)
- **Inputs**:
  - `bcd[3:0]` – 4-bit BCD input representing decimal digits (0–9)
- **Outputs**:
  - `seg[6:0]` – 7-bit output controlling segments `{a, b, c, d, e, f, g}`

---

## 📂 Files Included

- `bcd_to_7seg.v` – Verilog design for BCD to 7-segment decoder  
- `bcd_to_7seg_tb.v` – Testbench for the decoder  
- `bcd_to_7seg_waveform.png` – Simulation waveform screenshot  
- `README.md` – Documentation for this module  

---

## ⚙️ How It Works

Each 4-bit BCD input corresponds to one decimal digit.  
The decoder drives the 7 output segments to light up the respective number on the display.

| BCD Input | Decimal | Output Segments (abcdefg) | Display |
|------------|----------|---------------------------|----------|
| 0000 | 0 | 1111110 | 0 |
| 0001 | 1 | 0110000 | 1 |
| 0010 | 2 | 1101101 | 2 |
| 0011 | 3 | 1111001 | 3 |
| 0100 | 4 | 0110011 | 4 |
| 0101 | 5 | 1011011 | 5 |
| 0110 | 6 | 1011111 | 6 |
| 0111 | 7 | 1110000 | 7 |
| 1000 | 8 | 1111111 | 8 |
| 1001 | 9 | 1111011 | 9 |
| 1010–1111 | Invalid | 0000001 | – |

---

## 📊 Testbench Simulation Output

From `tb_bcd_to_7seg.v`:

| BCD Input | Segment Output | Comment |
|------------|----------------|----------|
| 0000 | 1111110 | Displays **0** |
| 0001 | 0110000 | Displays **1** |
| 0010 | 1101101 | Displays **2** |
| 0011 | 1111001 | Displays **3** |
| 0100 | 0110011 | Displays **4** |
| 0101 | 1011011 | Displays **5** |
| 0110 | 1011111 | Displays **6** |
| 0111 | 1110000 | Displays **7** |
| 1000 | 1111111 | Displays **8** |
| 1001 | 1111011 | Displays **9** |
| 1010 | 0000001 | Displays **– (invalid input)** |

---

## 🖼 Waveform

![BCD to 7-Segment Decoder Waveform](bcd_to_7seg_waveform.png)

---

## 🛠 Tools Used

- **Verilog** – RTL design and testbench  
- **Verdi** – Waveform visualization (`$fsdbDumpvars`)  
- **VCS** – Simulation  

---

> 💡 This project demonstrates **digital decoding logic** for display systems — a fundamental circuit in embedded and display interface design.  
It shows how a simple behavioral model can accurately simulate **BCD-to-display conversion logic** used in microcontrollers and 7-segment indicators.
