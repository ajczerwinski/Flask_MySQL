from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector
import collections
import mysql.connector
from flask.ext.bcrypt import Bcrypt
import re
import datetime
import time
EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
app = Flask(__name__)
bcrypt = Bcrypt(app)
mysql = MySQLConnector('login_registration')
app.secret_key = "SecretKeyMePls"

@app.route('/')
def index():
	users = mysql.fetch("SELECT * FROM users")
	print users
	return render_template('index.html', users=users)

@app.route('/register', methods=['POST'])
def create():
	first_name = request.form['first_name']
	last_name = request.form['last_name']
	email = request.form['email']
	password = request.form['password']

	# run validations and if they are successful, create password hash with bcrypt
	if len(first_name) < 2 or len(last_name) < 2:
		flash("First and last name must be at least 2 letters!")
		return redirect('/')
	elif not first_name.isalpha() or not last_name.isalpha():
		flash("First and last name must contain only letters!")
		return redirect('/')
	elif not EMAIL_REGEX.match(email):
		flash("Invalid Email Address")
		return redirect('/')
	# Need to check to see if email already exists in DB
	elif len(password) < 9:
		flash("Password must have more than 8 characters!")
		return redirect('/')
	else:
		pw_hash = bcrypt.generate_password_hash(password)
		password = pw_hash
		print password
		query = "INSERT INTO users (first_name, last_name, email, password, created_at) VALUES ('{}', '{}', '{}', '{}', NOW())".format(first_name, last_name, email, password)
		print "Below me is the user query"
		mysql.run_mysql_query(query)
		user_query = "SELECT * FROM users WHERE email = '{}' LIMIT 1".format(email)
		user = mysql.fetch(user_query)
		print user
		session['user'] = user[0]
		session_user_id = session['user']
		print "Above me is the session user ID index 0!!"
		return render_template('success.html', session_user_id=session_user_id)
@app.route('/login', methods=['POST'])
def login():
	email = request.form['email']
	password = request.form['password']
	user_query = "SELECT * FROM users WHERE email = '{}' LIMIT 1".format(email)
	print user_query
	user = mysql.fetch(user_query)
	decoded_password = user[0]['password']
	if bcrypt.check_password_hash(decoded_password, str(password)):
		session['user'] = user[0]
		session_user_id = session['user']
		return render_template('success.html', session_user_id=session_user_id)
	else:
		flash("Email and password don't match. Try again!")
		return redirect('/')
@app.route('/logout', methods=['POST'])
def logout():
	session.clear()
	return redirect('/')
app.run(debug=True)