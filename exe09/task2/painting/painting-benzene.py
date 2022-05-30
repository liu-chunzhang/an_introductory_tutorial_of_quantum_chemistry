import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

mpl.rcParams["font.sans-serif"] = ["SimHei"]

fig, ax = plt.subplots(2, 1, dpi=120)

photo1 = plt.imread("ben-Ag.png")
photo2 = plt.imread("ben-B3g.png")

ax[0].imshow(photo1)
ax[0].set_axis_off()
ax[0].set_title(r"(a) 苯的不可约表示$\mathrm{A}_g$的轨道能量分布", y=-0.13)

ax[1].imshow(photo2)
ax[1].set_axis_off()
ax[1].set_title(r"(b) 苯的不可约表示的$\mathrm{B}_{3g}$轨道能量分布", y=-0.25)

fig.suptitle(r"图9-3 苯的不可约表示$\mathrm{A}_g$和$\mathrm{B}_{3g}$的轨道能量分布", y=0.05, va="top")

plt.tight_layout(w_pad=0, h_pad=-0.5)

plt.show()