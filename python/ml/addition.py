#
# ２つの整数の足し算を機械学習し、任意の足し算を回答させる
#
from pandas import DataFrame
from sklearn import linear_model

# 足し算の例とその答えを用意する
formulas = DataFrame([
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 0],
    [1, 1],
    [1, 2],
    [2, 0],
    [2, 1],
    [2, 2]
])
answers = DataFrame([0, 1, 2, 1, 2, 3, 2, 3, 4])

# 式と答えを線形回帰学習させる
model = linear_model.LinearRegression()
model.fit(formulas, answers)
print('学習完了')

while True:

    # 標準入力から計算式を取得
    print('> ', end='')
    x, y = list(map(lambda x: int(x), input().split(' ')))

    # 学習モデルを用いて回答を取得し、標準出力
    predected_answer = model.predict([[x, y]])
    print("{0} + {1} = {2}".format(x, y, int(predected_answer[0][0])))
