import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

mpl.rcParams["font.sans-serif"] = ["SimHei"]

fig, ax = plt.subplots(2, 3, dpi=100, figsize=(8, 8))

photo17 = plt.imread("000017.png")
photo20 = plt.imread("000020.png")
photo21 = plt.imread("000021.png")
photo22 = plt.imread("000022.png")
photo23 = plt.imread("000023.png")
photo30 = plt.imread("000030.png")


ax[0, 0].imshow(photo17)
ax[0, 0].set_axis_off()
ax[0, 0].set_title("(a) 标号为17的轨道", y=-0.18)

ax[0, 1].imshow(photo20)
ax[0, 1].set_axis_off()
ax[0, 1].set_title("(b) 标号为20的轨道", y=-0.18)

ax[0, 2].imshow(photo21)
ax[0, 2].set_axis_off()
ax[0, 2].set_title("(c) 标号为21的轨道", y=-0.19)

ax[1, 0].imshow(photo22)
ax[1, 0].set_axis_off()
ax[1, 0].set_title("(d) 标号为22的轨道", y=-0.18)

ax[1, 1].imshow(photo23)
ax[1, 1].set_axis_off()
ax[1, 1].set_title("(e) 标号为23的轨道", y=-0.15)

ax[1, 2].imshow(photo30)
ax[1, 2].set_axis_off()
ax[1, 2].set_title("(f) 标号为30的轨道", y=-0.15)

fig.suptitle("图9-2 选取构成苯的活性空间的RHF轨道图像", y=0.05, va="top")

plt.tight_layout(w_pad=0, h_pad=0)

plt.show()
