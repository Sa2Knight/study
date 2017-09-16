import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn import preprocessing
from sklearn.externals import joblib

# CSVファイルを読み込む
df = pd.read_csv('cars.csv')

# 学習に不要な行、列を削除
del df['normalized-losses']
for col in ['num-of-doors', 'price', 'bore', 'stroke', 'horsepower', 'peak-rpm']:
 df = df[df[col] != '?']

# 説明変数列と目的変数列に分割
label = df['price']
data  = df.drop('price', axis=1)

# 文字列データを数値化
le = preprocessing.LabelEncoder()
for col in ['make', 'fuel-type', 'aspiration', 'num-of-doors', 'body-style', 'drive-wheels', 'engine-location', 'engine-type', 'num-of-cylinders', 'fuel-system']:
  data[col] = le.fit_transform(data[col])

# 学習モデルをデシリアライズ
clf = joblib.load('cars.pkl');

# 評価する
predict = clf.predict(data)
rate_sum = 0
for i in range(len(label)):
  t = int(label.iloc[i])
  p = int(predict[i])
  rate_sum += int(min(t, p) / max(t, p) * 100)
print(rate_sum / len(label))
