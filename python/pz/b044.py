# [入力] フィールドサイズ
H, W = list(map(lambda x: int(x), input().rstrip().split(' ')))

def get_new_direction(current_direction, to_right):
    if current_direction == 1:
        return 2 if to_right else 4
    elif current_direction == 2:
        return 3 if to_right else 1
    elif current_direction == 3:
        return 4 if to_right else 2
    elif current_direction == 4:
        return 1 if to_right else 3

def get_moving_distance(direction):
    if direction == 1:
        return -1, 0
    elif direction == 2:
        return 0, 1
    elif direction == 3:
        return 1, 0
    elif direction == 4:
        return 0, -1

def is_inner(map, y, x):
    if 0 <= y < H and 0 <= x < W:
        return True
    else:
        return False

# [入力] 初期位置
py, px = list(map(lambda x: int(x) - 1, input().rstrip().split(' ')))

# [入力] マップ
map = [['*' for x in range(W)] for y in range(H)]
for y in range(H):
    map[y] = list(input().rstrip())

# 向き
direction = 1

# 移動を繰り返す
while is_inner(map, py, px):
    if map[py][px] == '.':
        direction = get_new_direction(direction, True)
        map[py][px] = '*'
    else:
        direction = get_new_direction(direction, False)
        map[py][px] = '.'
    my, mx = get_moving_distance(direction)
    py = py + my
    px = px + mx

for y in range(H):
    print(''.join(map[y]))
