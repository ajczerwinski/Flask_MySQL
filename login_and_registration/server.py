from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector
import collections
import mysql.connector
from flask.ext.bcrypt import bcrypt
import re
import datetime
import time
EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')
app = Flask(__name__)
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

	# query = "INSERT INTO users (first_name, last_name, email, password, created_at, updated_at) VALUES ('{}', '{}', '{}', '{}', NOW(), NOW()".format(request.form['first_name'], request.form['last_name'], request.form['email'], request.form['password'])
	# print query
	# mysql.run_mysql_query(query)
	return redirect('/')
app.run(debug=True)