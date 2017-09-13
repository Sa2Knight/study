#
# ２つの整数の足し算を機械学習し、任意の足し算を回答させる
#
from pandas import DataFrame
from sklearn import linear_model, metrics
from sklearn.model_selection import train_test_split
import random

# ランダムに足し算データを生成する
def get_rand_data():
    max = 10
    a = random.randint(1, max)
    b = random.randint(1, max)
    return [a, b, a + b]

# 足し算の例とその答えを用意する
rand_data = DataFrame([get_rand_data() for i in range(100)])
data  = rand_data[[0, 1]]
label = rand_data[2]

# 学習用データとテスト用データに分割
train_data, test_data, train_label, test_label = train_test_split(data, label)

# 式と答えを線形回帰学習させる
model = linear_model.LinearRegression()
model.fit(train_data, train_label)

# ランダムな足し算を100個与えて、回答を予測させる
pre = model.predict(test_data)

# 予測された偏回帰係数と切片
print("偏回帰係数1: ", float(model.coef_[0]))
print("偏回帰係数2: ", float(model.coef_[0]))
print("切片: ", float(model.intercept_))

# 正解率を計算
correct_num = 0
for i in range(len(test_label)):
  if test_label.iloc[i] == int(pre[i]):
    correct_num += 1

print("正解率 = ", correct_num / len(test_label))
