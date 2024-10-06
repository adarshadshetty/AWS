from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, world!'

if __name__ == '__main__':
    # Bind to 0.0.0.0 to make it externally accessible
    app.run(host='0.0.0.0')
