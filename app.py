from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <h1>Welcome to Flask Docker Application!</h1>
    <p>This is a Dockerized Python Flask application running successfully.</p>
    '''

@app.route('/health')
def health():
    return {'status': 'healthy', 'message': 'Application is running'}, 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
