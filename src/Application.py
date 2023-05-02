import sys

from PyQt5.QtWidgets import QApplication
from PyQt5.QtSql import QSqlDatabase
import settings as st


class Application(QApplication):

    def __init__(self, argv):
        super().__init__(argv)
        
        db = QSqlDatabase.addDatabase('QPSQL') # for PostgreSQL
        db.setHostName(st.db_params['host'])
        db.setDatabaseName(st.db_params['dbname'])
        db.setPort(st.db_params['port'])
        db.setUserName(st.db_params['user'])
        db.setPassword(st.db_params['password'])
        
        if db.open():
            print(f"Connected to database {db.databaseName()}!", file = sys.stderr)
        else:
            print("Connection FAILED", file = sys.stderr)