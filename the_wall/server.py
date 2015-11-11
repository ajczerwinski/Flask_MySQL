from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector
from flask.ext.bcrypt import Bcrypt
import re

app = Flask(__name__)
bcrypt = Bcrypt(app)
mysql = MySQLConnector('the_wall')
app.secret_key = "SecretKeyMePls"
NAME_REGEX = re.compile(r'^[a-zA-z]{2,}$')
EMAIL_REGEX = re.compile(r'^[a-za-z0-9\.\+_-]+@[a-za-z0-9\._-]+\.[a-za-z]*$')

def validate_email(email):
	query = mysql.fetch("SELECT * FROM users WHERE email='{}'".format(email))
	return query

def getMessages():
	query = mysql.fetch("SELECT user_id, first_name, last_name, DATE_FORMAT(messages.created_at, '%b %D %Y') as timestamp, message, messages.id FROM messages JOIN users ON users.id = messages.user_id ORDER BY messages.created_at DESC")
	return query

def getComments():
	query = mysql.fetch("SELECT comment, messages.id, first_name, last_name, DATE_FORMAT(comments.created_at, '%b %D %Y') as timestamp FROM comments JOIN messages ON messages.id = comments.message_id JOIN users on users.id = comments.user_id ORDER BY comments.created_at DESC")
	return query

def post_message(user_id, message):
	message = str(message).replace("'", "\\'")
	insert = "INSERT INTO messages (user_id, message, created_at, updated_at) VALUES ('{}', '{}', NOW(), NOW())"
	query = insert.format(user_id, message)
	mysql.run_mysql_query(query)

def post_comment(message_id, user_id, comment):
	comment = str(comment).replace("'", "\\'")
	insert = "INSERT INTO comments (message_id, user_id, comment, created_at, updated_at) VALUES ('{}', '{}', '{}', NOW(), NOW())"
	query = insert.format(message_id, user_id, comment)
	mysql.run_mysql_query(query)

@app.route('/', methods=['GET'])
def index():
	if 'user_id' in session:
		return render_template('wall.html')
	else:
		return render_template('index.html')

@app.route('/register', methods=['POST'])
def create():
	first_name = request.form['first_name']
	last_name = request.form['last_name']
	email = request.form['email']
	email_check = validate_email(email)
	password = request.form['password']
	if password:
		pw_hash = bcrypt.generate_password_hash(password)
		password = pw_hash
	error = False

	if not email or not first_name or not last_name or not password:
		flash("Please make sure you have all fields filled out")
		error = True
	if not NAME_REGEX.match(first_name) or not NAME_REGEX.match(last_name):
		flash("Name fields must contain only letters")
		error = True
	if not EMAIL_REGEX.match(email) and email:
		flash("Your email is invalid. Please try again")
		error = True
	for user in email_check:
		if email == user['email']:
			flash("That email already exists. Please use another one or sign in below")
			error = True
	if len(password) < 9:
		flash("Password must contain at least 9 characters!")
		error = True
	if error == True:
		return redirect('/')

	insertInto = "INSERT INTO users (first_name, last_name, email, password, created_at, updated_at) VALUES ('{}', '{}', '{}', '{}', NOW(), NOW())"
	query = insertInto.format(first_name, last_name, email, password)
	mysql.run_mysql_query(query)

	session['email'] = email
	return redirect('/wall')

@app.route('/login', methods=['POST'])
def login():
	session['email'] = request.form['loginEmail']
	password = request.form['loginPassword']
	user_info = validate_email(session['email'])

	for user in user_info:
		if bcrypt.check_password_hash(user['password'], password):
			return redirect('/wall')
		flash("Email and Password did not match")
		return redirect('/')

@app.route('/wall')
def homepage():
	email = session['email']
	user_info = validate_email(email)
	first_name = user_info[0]['first_name']
	last_name = user_info[0]['last_name']
	session['user_id'] = user_info[0]['id']
	messagedb = getMessages()
	commentdb = getComments()
	return render_template('/wall.html', first_name=first_name, last_name=last_name, messagedb=messagedb, commentdb=commentdb)

@app.route('/message', methods=['POST'])
def message():
	user_id = session['user_id']
	msg = request.form['message']
	post_message(user_id, msg)
	return redirect('/wall')

@app.route('/comment', methods=['POST'])
def comment():
	message_id = request.form['message_id']
	user_id = session['user_id']
	comment = request.form['comment']
	post_comment(message_id, user_id, comment)
	return redirect('/wall')

@app.route('/logout')
def logoff():
	session.clear()
	flash("You have successfully logged out. Come back to The Wall soon!")
	return redirect('/')

app.run(debug=True)
