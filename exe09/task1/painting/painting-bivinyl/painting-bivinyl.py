import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

mpl.rcParams["font.sans-serif"] = ["SimHei"]

fig, ax = plt.subplots(2, 2, dpi=120, figsize=(8, 8))

photo14 = plt.imread("000014.png")
photo15 = plt.imread("000015.png")
photo16 = plt.imread("000016.png")
photo20 = plt.imread("000020.png")

ax[0, 0].imshow(photo14)
ax[0, 0].set_axis_off()
ax[0, 0].set_title("(a) 标号为14的轨道", y=-0.30)

ax[0, 1].imshow(photo15)
ax[0, 1].set_axis_off()
ax[0, 1].set_title("(b) 标号为15的轨道", y=-0.185)

ax[1, 0].imshow(photo16)
ax[1, 0].set_axis_off()
ax[1, 0].set_title("(c) 标号为16的轨道", y=-0.13)

ax[1, 1].imshow(photo20)
ax[1, 1].set_axis_off()
ax[1, 1].set_title("(d) 标号为20的轨道", y=-0.15)

fig.suptitle("图9-1 选取构成反式-1,3-丁二烯的活性空间的RHF轨道图像", y=0.05, va="top")

plt.tight_layout(w_pad=0, h_pad=0)

plt.show()