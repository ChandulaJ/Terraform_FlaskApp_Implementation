import os

DB_CONFIG = {
    'host': os.getenv('DB_HOST', 'flask-mysql'),
    'user': os.getenv('DB_USER', 'admin'),
    'password': os.getenv('DB_PASSWORD', 'password'),
    'database': os.getenv('DB_NAME', 'mylistdb')
}
