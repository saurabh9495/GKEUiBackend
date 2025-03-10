from flask import Flask, jsonify
import requests

app = Flask(__name__)

@app.route("/api/posts")
def get_posts():
    response = requests.get("https://jsonplaceholder.typicode.com/posts")
    return jsonify(response.json())

@app.route("/api/comments")
def get_comments():
    response = requests.get("https://jsonplaceholder.typicode.com/comments")
    return jsonify(response.json())

@app.route("/api/albums")
def get_albums():
    response = requests.get("https://jsonplaceholder.typicode.com/albums")
    return jsonify(response.json())

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
