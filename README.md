# ❤️ ECG Signal Analysis and QRS Detection System

A Python and Verilog-based ECG signal processing system designed to analyze Electrocardiogram (ECG) signals, detect QRS complexes, estimate heart rate, and visualize ECG waveforms using the MIT-BIH Arrhythmia Dataset. The project combines Digital Signal Processing (DSP) techniques with FPGA-oriented hardware design to demonstrate efficient ECG analysis.

---

## 📌 Project Overview

Electrocardiogram (ECG) signals play a vital role in diagnosing cardiovascular diseases. This project implements a complete ECG signal processing pipeline that filters noisy ECG signals, detects QRS complexes, estimates heart rate, and visualizes the processed signals.

The software implementation is developed in **Python**, while the hardware modules are implemented in **Verilog HDL** and simulated using **Xilinx Vivado**.

---

## ✨ Features

- ECG signal preprocessing
- Bandpass filtering
- Derivative filtering
- Signal squaring
- Moving Window Integration
- Adaptive threshold detection
- QRS complex detection
- Heart-rate estimation
- ECG waveform visualization
- Hardware implementation using Verilog

---

## 🛠️ Technologies Used

- Python
- Verilog HDL
- Xilinx Vivado
- NumPy
- Matplotlib
- MIT-BIH Arrhythmia Dataset

---

## 📂 Project Structure

```
ECG-Signal-Analysis/
│
├── ecg_analysis.py
├── ecg_analysis2.py
├── ecg_final.csv
│
├── bandpass_filter.v
├── derivative_filter.v
├── moving_window.v
├── squaring.v
├── threshold_detector.v
├── heart_rate.v
├── arrhythmia_detector.v
├── ecg_system.v
├── ecg_tb.v
│
├── README.md
```

---

## 🔄 Project Workflow

```
MIT-BIH ECG Dataset
        │
        ▼
Signal Preprocessing
        │
        ▼
Bandpass Filter
        │
        ▼
Derivative Filter
        │
        ▼
Squaring
        │
        ▼
Moving Window Integration
        │
        ▼
Adaptive Threshold Detection
        │
        ▼
QRS Complex Detection
        │
        ▼
Heart Rate Calculation
        │
        ▼
ECG Waveform Visualization
```

---

## ⚙️ Modules

### Python Modules

- ECG Signal Processing
- Signal Visualization
- Heart Rate Estimation
- Data Analysis

### Verilog Modules

- Bandpass Filter
- Derivative Filter
- Squaring Unit
- Moving Window Integrator
- Threshold Detector
- Heart Rate Module
- Arrhythmia Detector
- Top-Level ECG System
- Testbench

---

## 📊 Output

The system provides:

- Filtered ECG Signal
- Detected QRS Peaks
- Heart Rate (BPM)
- ECG Waveform Visualization
- Simulation Results using Vivado

---

## 🚀 How to Run

### Python

1. Install the required libraries

```bash
pip install numpy matplotlib
```

2. Run the ECG analysis

```bash
python ecg_analysis.py
```

---

### Verilog Simulation

1. Open **Xilinx Vivado**
2. Create a new RTL Project
3. Add all `.v` source files
4. Set `ecg_tb.v` as the simulation top module
5. Run Behavioral Simulation
6. View the generated waveforms

---

## 📈 Applications

- Cardiac Health Monitoring
- Biomedical Signal Processing
- Arrhythmia Detection
- Medical Device Development
- FPGA-Based Healthcare Systems
- Wearable Health Monitoring Devices

---

## 🎯 Learning Outcomes

This project helped in gaining practical knowledge of:

- Digital Signal Processing (DSP)
- ECG Signal Analysis
- Biomedical Signal Processing
- Verilog HDL Design
- FPGA Simulation using Vivado
- Python Programming
- Data Visualization
- Heart Rate Estimation
- QRS Detection Algorithms

---

## 🔮 Future Enhancements

- FPGA implementation on hardware
- Real-time ECG monitoring
- Machine Learning-based Arrhythmia Classification
- Deep Learning for ECG Disease Prediction
- FastAPI-based Web Dashboard
- Cloud-based ECG Monitoring System

---

## 👩‍💻 Author

**Kothapalli Sonali**

B.Tech – Electronics and Communication Engineering

Python | Verilog | FPGA | Signal Processing | Machine Learning Enthusiast

---
