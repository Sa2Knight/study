class Maschine:

  def __init__(self):
    self.prices = [500, 100, 50, 10]
    self.moneys = [0, 0, 0, 0]

  def add(self, moneys):
    for i in range(4):
      self.moneys[i] += moneys[i]

  def sub(self, moneys):
    for i in range(4):
      self.moneys[i] -= moneys[i]

  def out_put_change(self, inputs, price):
    change = self.total_amount(inputs) - price
    tmp = [0, 0, 0, 0]
    i = 0
    while 0 < change and i < 4:
      if self.prices[i] <= change and 0 < self.moneys[i]:
        tmp[i] += 1
        self.moneys[i] -= 1
        change -= self.prices[i]
      else:
        i += 1
    if change == 0 and not (100 <= tmp[2] * self.prices[2] + tmp[3] * self.prices[3]):
      self.add(inputs)
      return tmp
    else:
      self.add(tmp)
      return False

  def total_amount(self, moneys):
    total = 0
    for i in range(4):
      total += moneys[i] * self.prices[i]
    return total

maschine = Maschine()

# [入力] 初期段階の小銭の枚数
inputs = list(map(lambda x: int(x), input().rstrip().split(' ')))
maschine.add(inputs)

# [入力] ユーザ数
users = int(input())

for i in range(users):

  # [入力] ジュースの金額と支払い
  inputs = list(map(lambda x: int(x), input().rstrip().split(' ')))
  price  = inputs[0]
  del inputs[0]

  # お釣り計算
  result = maschine.out_put_change(inputs, price)
  if result:
    print(result[0], result[1], result[2], result[3])
  else:
    print("impossible")
