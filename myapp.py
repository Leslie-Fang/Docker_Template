from flask import Flask
from redis import Redis, RedisError,StrictRedis
import os
import socket
import json

# Connect to Redis
redis = StrictRedis(host="localhost",port=6379, db=0)

app = Flask(__name__)

@app.route("/")
def hello():
    try:
        visits = redis.incr("counter")
    except RedisError:
        visits = "<i>cannot connect to Redis, counter disabled</i>"

    html = "<h3>Hello Main {name}!</h3>" \
           "<b>Hostname:</b> {hostname}<br/>" \
           "<b>Visits:</b> {visits}"
    return html.format(name=os.getenv("NAME", "world"), hostname=socket.gethostname(), visits=visits)

@app.route('/helloworld')
def helloworld():
	ret = json.dumps({'state':'ok'})
	return ret

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000)
