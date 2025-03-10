from flask import Flask, jsonify
import requests

app = Flask(__name__)

@app.route("/api/data")
def get_data():
    urls = [
        "https://jsonplaceholder.typicode.com/posts",
        "https://jsonplaceholder.typicode.com/comments",
        "https://jsonplaceholder.typicode.com/albums"
    ]
    responses = [requests.get(url).json() for url in urls]
    return jsonify(responses)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)