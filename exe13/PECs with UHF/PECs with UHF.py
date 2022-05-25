import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
#from matplotlib import rc, rcParams
from matplotlib.ticker import AutoMinorLocator, MultipleLocator, FuncFormatter

# some total settings
fig, ax = plt.subplots(1, 1, figsize=(10, 6.4), dpi=120)

mpl.rc("font", **{"family": "sans-serif", "sans-serif":["Times New Roman"], "size":8})
mpl.rc("mathtext", **{"fontset":"cm", "it":"italic", "rm":"times"})
mpl.rcParams["axes.unicode_minus"] = False

# data resource
filename = "PECs with UHF Data.txt"

# vectors for containing data
UHF, UMP2, UCCSD, UCCSD_T, FCI = [], [], [], [], []
vectors = [UHF, UMP2, UCCSD, UCCSD_T, FCI]

with open(filename) as file_object:
	cnt1 = -1
	cnt2 = 0
	for line in file_object:
		if cnt2 % 31 != 0 :
			vectors[cnt1].append(float(line.strip()))
		else:
			cnt1 = cnt1 + 1
		cnt2 = cnt2 + 1

# vectors for containing bondlength
BondLength = []
for i in range(7):
	BondLength.append( ( i + 8 ) / 10  )
for i in range(23):
	BondLength.append( ( 2 * i + 16 ) / 10 )

# plot curves and their details
plt.plot(BondLength, UHF, ls="-", marker='D', markersize=3, fillstyle="none", lw=1, label="UHF")
plt.plot(BondLength, UMP2, ls="-", marker='s', markersize=4, fillstyle="none", lw=1, label="UMP2")
plt.plot(BondLength, UCCSD, ls="-", marker='8', markersize=4, fillstyle="none", lw=1, label="UCCSD")
plt.plot(BondLength, UCCSD_T, ls="-", marker='^', markersize=4, fillstyle="none", lw=1, label="UCCSD(T)")
plt.plot(BondLength, FCI, ls="-", marker='x', markersize=4, fillstyle="none", lw=1, label="FCI")

# detail settings for the whole photo
plt.xlim(0.5, 6)
ax.xaxis.set_major_locator(MultipleLocator(0.5))		# 设置在x轴长为0.5时，设置主刻度
plt.ylim(-25.25, -25.00)
ax.yaxis.set_major_locator(MultipleLocator(0.05))		# 设置在y轴长为0.05时，设置主刻度


plt.xlabel(r"$R_\mathrm{BH}$(Angstrom)")
plt.ylabel("Energy(hartree)")
plt.grid(axis='y', linestyle="-", color="grey")
plt.legend(loc=4)

plt.title("Figure.13-2. Potential energy curves for BH in an aug-cc-pVQZ basis using full configuration interaction and various approximate correlation methods with an UHF reference", y=-0.10, va="top")
# show the whole photo
plt.tight_layout()

plt.show()