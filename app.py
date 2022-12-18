import flask

app = flask.Flask(__name__)

@app.route("/")
def hello():
	return flask.jsonify(message="hello world!")
