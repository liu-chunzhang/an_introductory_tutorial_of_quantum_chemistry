import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

mpl.rcParams["font.sans-serif"] = ["SimHei"]
mpl.rcParams["axes.unicode_minus"] = False

outfile1 = plt.imread("000028.png")
outfile2 = plt.imread("000029.png")

fig = plt.figure(dpi=120)

ax1 = fig.add_subplot(121)						# 绘制左边的子图
ax1.imshow(outfile1)
ax1.set_axis_off()
ax1.set_title("(a) SOMO1", y=-0.22)

ax2 = fig.add_subplot(122)						# 绘制右上角子图
ax2.imshow(outfile2)
ax2.set_axis_off()
ax2.set_title("(b) SOMO2", y=-0.11)

fig.suptitle("图7-5 闭壳层单重态下两个SOMOs的图像", y=0.16, va="top")

#plt.subplots_adjust()
plt.tight_layout(h_pad=0, w_pad=0)

plt.show()