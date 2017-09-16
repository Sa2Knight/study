import numpy as np

a = np.array([[i % 100 for i in range(1000)] for j in range(10000)])
scores = [20, 50, 70, 90]

print(a[1])
