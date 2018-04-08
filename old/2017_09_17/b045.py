M, N = map(lambda x: int(x), input().rstrip().split(' '))

# 足し算を順に出力
a = 99
b = 0
for i in range(M):
  print("{0} + {1} =".format(a, b))
  b -= 1
  if b < 0:
    a -= 1
    b = 99 - a

# 引き算を順に出力
a = 99
b = 99
for i in range(N):
  print("{0} - {1} =".format(a, b))
  b -= 1
  if b < 0:
    a -= 1
    b = a
