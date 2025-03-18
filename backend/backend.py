from flask import Flask, jsonify
from flask_cors import CORS
import requests

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

@app.route("/")
def get_home():
    return jsonify({
        "message": "Welcome to the API",
        "version": "1.0",
        "status": "running"
    })
    
@app.route("/api/home")
def get_api_home():
    return jsonify({
        "message": "Welcome to the API",
        "version": "1.0",
        "status": "running"
    })

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