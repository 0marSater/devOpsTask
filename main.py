from flask import Flask, jsonify, request
import mysql.connector
import os

app = Flask(__name__)

# Connect to the RDS MySQL database
# Suppose you export ur environment either on Windows os or Linux.
config = {
    'user': 'admin',
    'password': '321657aa',
    'host': 'task-db.c6fja1dax0aa.eu-west-2.rds.amazonaws.com',
    'database': 'ip_addresses'
}

conn = mysql.connector.connect(**config)
cur = conn.cursor()

# Create a table to store the IP addresses if it doesn't exist
cur.execute('''
    CREATE TABLE IF NOT EXISTS ip_addresses (
        id INT AUTO_INCREMENT PRIMARY KEY,
        ip_address VARCHAR(255)
    )
''')


@app.route('/', methods=['GET'])
def land_page():
    return jsonify("Hello!")


@app.route('/client-ip', methods=['GET'])
def save_client_ip():
    # get the client IP address from the request
    client_ip_address = request.remote_addr
    # insert the IP address into database
    cur.execute('INSERT INTO ip_addresses (ip_address) VALUES (%s)', (client_ip_address,))
    conn.commit()
    return jsonify("Your ip address added")


@app.route('/client-ip/list', methods=['GET'])
def get_list_ip():
    # select * IP addresses from the database and return as a JSON object
    cur.execute('SELECT ip_address FROM ip_addresses')
    rows = cur.fetchall()
    ip_list = [row[0] for row in rows]
    return jsonify(ip_list)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
