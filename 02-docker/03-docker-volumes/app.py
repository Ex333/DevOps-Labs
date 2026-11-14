
from flask import Flask, jsonify
import os

app = Flask(__name__)

DATA_DIR = "/data"
FILE_PATH = os.path.join(DATA_DIR, "visits.txt")

os.makedirs(DATA_DIR, exist_ok=True)

def get_visits():
    if os.path.exists(FILE_PATH):
        with open(FILE_PATH, "r") as file:
            content = file.read().strip()
            return int(content) if content else 0
    return 0

@app.route("/")
def home():
    visits = get_visits() + 1

    with open(FILE_PATH, "w") as file:
        file.write(str(visits))

    return jsonify({
        "application": "Docker Volume Lab",
        "total_visits": visits,
        "status": "running"
    })

@app.route("/health")
def health():
    return jsonify({"status": "healthy"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
