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
ax1.set_title("(a) 标号为27的局域化SOMO", y=-0.16)

ax2 = fig.add_subplot(122)						# 绘制右上角子图
ax2.imshow(outfile2)
ax2.set_axis_off()
ax2.set_title("(b) 标号为28的局域化SOMO", y=-0.09)

fig.suptitle("图7-3 ORCA进行局域化得到的的SOMOs", y=0.20, va="top")

#plt.subplots_adjust()
plt.tight_layout(h_pad=0,w_pad=0)

plt.show()