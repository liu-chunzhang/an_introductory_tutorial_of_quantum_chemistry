import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

mpl.rcParams["font.sans-serif"] = ["SimHei"]
mpl.rcParams["axes.unicode_minus"] = False

outfile1 = plt.imread("C7H14.png")
outfile2 = plt.imread("000028.png")
outfile3 = plt.imread("000029.png")

fig = plt.figure(dpi=100,figsize=(8,8))

ax1 = fig.add_subplot(121)						# 绘制左边的子图
ax1.imshow(outfile1)
ax1.set_axis_off()
ax1.set_title("(a) 分子骨架中标号为0和18的C原子的位置", y=-0.105)

ax2 = fig.add_subplot(222)						# 绘制右上角子图
ax2.imshow(outfile2)
ax2.set_axis_off()
ax2.set_title("(b) 标号为28的SOMO", y=-0.20)

ax3 = fig.add_subplot(224)						# 绘制右下角子图
ax3.imshow(outfile3)
ax3.set_axis_off()
ax3.set_title("(c) 标号为29的SOMO", y=-0.15)

fig.suptitle("图7-1 分子骨架中标号为0和18的C原子的位置及其上SOMO轨道", y=0.05, va="top")

#plt.subplots_adjust()
plt.tight_layout(h_pad=0, w_pad=0)

plt.show()