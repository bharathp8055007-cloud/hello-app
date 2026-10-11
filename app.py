import os
from flask import Flask

app = Flask(__name__)
GREETING = os.environ.get("GREETING", "Hello")

@app.route("/")
def home():
    return f"{GREETING} from my first app! Version 5"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
