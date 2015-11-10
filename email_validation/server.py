from flask import Flask, render_template, request, redirect, session, flash
from mysqlconnection import MySQLConnector
import collections
import mysql.connector
import re
import datetime
import time
EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
app = Flask(__name__)
mysql = MySQLConnector('email_flask')
app.secret_key="SecretKeyMePls"
@app.route('/')
def index():
	return render_template('index.html')
@app.route('/process', methods=["POST"])
def submit():
	if request.method == "POST":
		emails = mysql.fetch("SELECT * FROM emails")
		print emails
		print request.form['email']
		if not EMAIL_REGEX.match(request.form['email']):
			flash("Email is not valid!")
			
			return redirect('/')
		query = "INSERT INTO emails (email, created_at, updated_at) VALUES ('{}', NOW(), NOW())".format(request.form['email'])
		print query
		mysql.run_mysql_query(query)
		# format_time = datetime.datetime.now().strftime("%d %m %Y %H %M")
		# format_time1 = time.strftime("%m %d %Y", email['created_at'])
		# print format_time
		# email = mysql.fetch("SELECT * FROM emails")
		# print email
		return render_template("success.html", emails=emails)
app.run(debug=True)