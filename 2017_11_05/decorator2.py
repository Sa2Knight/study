def decorator(function, arg1):

  def retfunc(*args):
    print("{}を受け取りました".format(arg1))
    print("デコレートされたよ")
    return function(*args)

  return retfunc

@decorator("arg1")
def fuga():
  return "piyo"

print(fuga())
