#
# ２つの整数の足し算を機械学習し、任意の足し算を回答させる
#
# 車の製品情報と価格を学習し、価格を予測させる
#
import pandas as pd
from sklearn import linear_model, metrics
from sklearn.model_selection import train_test_split

# CSVファイルを読み込む
df = pd.read_csv('cars.csv')

# 学習に不要な行、列を削除
del df['normalized-losses']
for col in ['num-of-doors', 'price', 'bore', 'stroke', 'horsepower', 'peak-rpm']:
 df = df[df[col] != '?']

# 説明変数列と目的変数列に分割
label = df['price']
data  = df.drop('price', axis=1)

# 学習用データとテストデータにわける
train_data, test_data, train_label, test_label = train_test_split(data, label)

# 学習する


