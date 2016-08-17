import matplotlib.pyplot as plt
import numpy as np


with open("naive.txt", "r") as f:
    s = f.read()
    s = s.split("\n")
    s = [x.split("\t") for x in s[3:-1]]
    xs = [int(x[0]) for x in s]
    y1s = [float(x[5]) for x in s]
with open("avx.txt", "r") as f:
    t = f.read()
    t = t.split("\n")
    t = [x.split("\t") for x in t[3:-1]]
    y2s = [float(x[5]) for x in t]

plt.plot(xs, y1s, 'r--',  y2s, 'b--')
plt.plot([4,1], [800,1], 'k-')
plt.savefig("comparison.png")
