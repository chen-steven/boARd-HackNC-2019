from flask import Flask, request, jsonify

app = Flask(__name__)

app.config.update(
    SECRET_KEY = 'public static void main(String[] args)'
)

#
#@app.route("/open", methods = ['POST'])
#def initialize








@app.route("/get", methods = ['GET'])
def test():
    payload = {'text': "Hello World"}
    return jsonify(payload)


