import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

mpl.rcParams["font.sans-serif"] = ["SimHei"]
mpl.rcParams["axes.unicode_minus"] = False

fig, ax = plt.subplots(1, 3, dpi=120, figsize=(12, 4.5))

outfile1 = plt.imread("N.png")
outfile2 = plt.imread("HOMO.png")
outfile3 = plt.imread("LUMO.png")


ax[0].imshow(outfile1)
ax[0].set_axis_off()
ax[0].set_title("(a) N原子上的孤对电子轨道", y=-0.20)

ax[1].imshow(outfile2)
ax[1].set_axis_off()
ax[1].set_title("(b) 碳碳双键的π键的成键轨道", y=-0.14)

ax[2].imshow(outfile3)
ax[2].set_axis_off()
ax[2].set_title("(c) 碳碳双键的π键的反键轨道", y=-0.22)

fig.suptitle("图4-1 N上的孤对电子轨道、碳碳双键的π键的成键轨道与反键轨道的自然轨道图像", y=0.05, va="top")

#plt.subplots_adjust()
plt.tight_layout()

plt.show()
