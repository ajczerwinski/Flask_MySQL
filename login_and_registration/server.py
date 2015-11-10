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
	elif len(password) < 9:
		flash("Password must have more than 8 characters!")
		return redirect('/')
	else:
		pw_hash = bcrypt.generate_password_hash(password)
		password = pw_hash
		query = "INSERT INTO users (first_name, last_name, email, password, created_at) VALUES ('{}', '{}', '{}', '{}', NOW())".format(first_name, last_name, email, password)
		print query
		mysql.run_mysql_query(query)
	return render_template('success.html')
app.run(debug=True)