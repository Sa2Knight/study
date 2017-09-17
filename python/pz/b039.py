N = int(input())
S = int(input())

puddles = []
routes  = {}

# 入力
for i in range(N):
  x1, y1, x2, y2 = list(map(lambda x: int(x), input().rstrip().split(' ')))
  puddles.append({
    'y1': y1,
    'x1': x1,
    'y2': y2,
    'x2': x2,
  })

# 水たまり間がつながっているかを検証
num = len(puddles)
for i in range(num):
  for s in range(num):
    if i == s:
      continue
    if not (puddles[i]['x1'] <= puddles[s]['x1'] <= puddles[i]['x2'] or puddles[i]['x1'] <= puddles[s]['x2'] <= puddles[i]['x2']):
      continue
    if not (puddles[i]['y1'] <= puddles[s]['y1'] <= puddles[i]['y2'] or puddles[i]['y1'] <= puddles[s]['y2'] <= puddles[i]['y2']):
      continue
    if i not in routes:
      routes[i] = []
    routes[i].append(s)

footprints = {}

def can_move(routes, p, g):
  if p == g:
    return True
  if p not in routes:
    return False
  for r in routes[p]:
    if (p, r) not in footprints:
      footprints[(p, r)] = True
      if can_move(routes, r, g):
        return True
  return False

for i in range(N):
  footprints = {}
  if can_move(routes, S - 1, i):
    print(i + 1)
