import redis
from bottle import route, run, get, post, request
from hoge import foo

r = redis.Redis(host='localhost', port=6379, db=0)

@route('/hello')
def hello():
    return foo()

@post('/csv')
def post():
    print(request.json)
    return "OK"

@route('/set')
def set():
    r.set('hoge', 'fuga')
    return "OK"

@route('/get')
def get():
    return r.get('hoge')

run(host='0.0.0.0', port=8000)

