from flask import Flask, render_template, request, redirect, session, flash
import re
EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
app = Flask(__name__)
app.secret_key="SecretKeyMePls"
@app.route('/')
def index():
	return render_template('index.html')
@app.route('/process', methods=["POST"])
def submit():
	return redirect('/')
app.run(debug=True)