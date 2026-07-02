import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Load FPGA CSV output
data = pd.read_csv("ecg_final.csv")

ecg = data["ECG"].values
peak = data["Peak"].values
arrhythmia = data["Arrhythmia"].values


# -----------------------------
# Remove duplicate peaks
# -----------------------------
refractory = 30
clean_peaks = []
last_peak = -refractory

for i in range(len(peak)):
    if peak[i] == 1 and (i - last_peak) > refractory:
        clean_peaks.append(i)
        last_peak = i

clean_peaks = np.array(clean_peaks)


# -----------------------------
# Arrhythmia only at R-peaks
# -----------------------------
arrhythmia_peaks = []

for i in clean_peaks:
    if arrhythmia[i] == 1:
        arrhythmia_peaks.append(i)

arrhythmia_peaks = np.array(arrhythmia_peaks)


# -----------------------------
# Create figure with subplots
# -----------------------------
fig, axs = plt.subplots(3,1,figsize=(12,8))


# --------------------------------
# 1️⃣ ECG waveform
# --------------------------------
axs[0].plot(ecg)
axs[0].set_title("ECG Waveform")
axs[0].set_xlabel("Sample")
axs[0].set_ylabel("Amplitude")
axs[0].grid(True)


# --------------------------------
# 2️⃣ R Peak Detection
# --------------------------------
axs[1].plot(ecg,label="ECG")

axs[1].scatter(
    clean_peaks,
    ecg[clean_peaks],
    color="red",
    label="Detected R Peaks"
)

axs[1].set_title("R Peak Detection")
axs[1].set_xlabel("Sample")
axs[1].set_ylabel("Amplitude")
axs[1].legend()
axs[1].grid(True)


# --------------------------------
# 3️⃣ Arrhythmia Detection
# --------------------------------
axs[2].plot(ecg,label="ECG")

axs[2].scatter(
    arrhythmia_peaks,
    ecg[arrhythmia_peaks],
    color="orange",
    label="Arrhythmia"
)

axs[2].set_title("Arrhythmia Detection")
axs[2].set_xlabel("Sample")
axs[2].set_ylabel("Amplitude")
axs[2].legend()
axs[2].grid(True)


plt.tight_layout()
plt.show()


# -----------------------------
# Summary
# -----------------------------
print("Total R Peaks detected:", len(clean_peaks))
print("Arrhythmia beats detected:", len(arrhythmia_peaks))