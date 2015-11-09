from flask import Flask, render_template, request, redirect, session, flash
from mysqlconnection import MySQLConnector
import collections
import mysql.connector
import re
EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
app = Flask(__name__)
mysql = MySQLConnector('email_flask')
app.secret_key="SecretKeyMePls"
@app.route('/')
def index():
	email = mysql.fetch("SELECT * FROM emails")
	print email
	return render_template('index.html')
@app.route('/process', methods=["POST"])
def submit():
	if request.method == "POST":
		print request.form['email']
		if not EMAIL_REGEX.match(request.form['email']):
			flash("Email is not valid!")
			
			return redirect('/')
		query = "INSERT INTO emails (email, created_at, updated_at) VALUES ('{}', NOW(), NOW())".format(request.form['email'])
		print query
		mysql.run_mysql_query(query) 
		# email = mysql.fetch("SELECT * FROM emails")
		# print email
		return redirect('/')
app.run(debug=True)