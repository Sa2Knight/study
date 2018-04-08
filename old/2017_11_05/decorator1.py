def decorator(function): # functionはfuga関数本体

  def retfunc(*args):
    print("デコレートされたよ")
    return function(*args)

  return retfunc

@decorator
def fuga():
  return "piyo"
