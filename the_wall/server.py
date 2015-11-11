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
mysql = MySQLConnector('the_wall')
app.secret_key = "SecretKeyMePls"

@app.route('/')
def index():
	if 'user_id' in session:
			return render_template('wall.html')
	else: 
		users = mysql.fetch("SELECT * FROM users")
		messages = mysql.fetch("SELECT * FROM messages")
		comments = mysql.fetch("SELECT * FROM comments")
	return render_template('index.html')

@app.route('/register', methods=['POST'])
def create():
	first_name = request.form['first_name']
	last_name = request.form['last_name']
	email = request.form['email']
	password = request.form['password']
	confirm_password = request.form['confirm_password']

	if len(first_name) < 2 or len(last_name) < 2:
		flash("First and last name must be at least 2 letters!")
		return redirect('/')
	elif not first_name.isalpha() or not last_name.isalpha():
		flash("First and last name must contain only letters!")
		return redirect('/')
	elif not EMAIL_REGEX.match(email):
		flash("Invalid Email Address")
		return redirect('/')
	# TODO - add logic to check if email already exists in database
	elif len(password) < 9:
		flash("Password must have more than 8 characters!")
		return redirect('/')
	elif password != confirm_password:
		flash("Password doesn't match the password confirmation, try again!")
		return redirect('/')
	else:
		pw_hash = bcrypt.generate_password_hash(password)
		password = pw_hash
		query = "INSERT INTO users (first_name, last_name, email, password, created_at, updated_at) VALUES ('{}', '{}', '{}', '{}', NOW(), NOW())".format(first_name, last_name, email, password)
		mysql.run_mysql_query(query)
		user_query = "SELECT * FROM users WHERE email = '{}' LIMIT 1".format(email)
		user = mysql.fetch(user_query)
		print user
		session['user'] = user[0]
		session_user_id = session['user']
		return render_template('wall.html', session_user_id=session_user_id)

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
		return render_template('wall.html', session_user_id=session_user_id)
	else:
		flash("Email and password don't match. Try again!")
		return redirect('/')

@app.route('/wall', methods=['POST'])
def wall():
	message = mysql.fetch("SELECT * FROM messages")
	return render_template('wall.html', messages=messages)

@app.route('/message', methods=['POST'])
def post_message():
	user_id = request.form['user_id']
	post_message = request.form['messages']
	query = "INSERT INTO messages (user_id, message, created_at, updated_at) VALUES ('{}', '{}', NOW(), NOW())".format(user_id, post_message)
	mysql.run_mysql_query(query)
	user_query = "SELECT users.first_name, users.last_name, messages.created_at, messages.message FROM users LEFT JOIN messages ON users.id = messages.user_id ORDER BY messages.created_at DESC"
	messages = mysql.fetch(user_query)
	print messages
	return redirect('/wall', messages=messages)

@app.route('/comment', methods=['POST'])
def comment():
	message_id = request.form['message_id']
	user_id = request.form['user_id']
	comment = request.form['comments']
	query = "INSERT INTO comments (message_id, user_id, comment, created_at, updated_at) VALUES ('{}', '{}', '{}', NOW(), NOW())".format(message_id, user_id, comment)
	mysql.run_mysql_query(query)
	user_query = "SELECT users.first_name, users.last_name, comments.created_at, comments.comment FROM users LEFT JOIN comments ON users.id = comments.user_id LEFT JOIN messages ON messages.id = comments.message_id ORDER BY comments.id ASC"
	comments = mysql.fetch(user_query)
	print users
	return render_template('wall.html', comments=comments)
@app.route('/logout', methods=['POST'])
def logout():
	session.clear()
	return redirect('/')

app.run(debug=True)