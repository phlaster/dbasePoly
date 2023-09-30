import psycopg2
import time as t
from psycopg2 import Error
from manipulations import *

dbname = 'skoraya'
user='postgres'
password='123'
port=5432
host='localhost'

def search_by_NOT_unique_time():
    tic = t.perf_counter()
    search_by(connection, "personas", "birthday", date(2000, 1, 1))
    toc = t.perf_counter()-tic
    print(f"Поиск по неключевому полю занял {toc} секунд")

def search_by_unique_time():
    tic = t.perf_counter()
    search_by(connection, "personas", "id", 300000)
    toc = t.perf_counter()-tic
    print(f"Поиск по ключевому полю занял {toc} секунд")


if __name__ == "__main__":

    connection = None

    try:
        connection = psycopg2.connect(
            dbname=dbname,
            user=user,
            password=password,
            port=port,
            host=host
        )
    except (Exception, Error) as error:
        print(f"Ошибка при подключении к PostgreSQL: {dbname}", error)
        exit()

    print(f"Соединение с PostgreSQL: {dbname}...")

    delete_all_rows(connection, "personas")
    
    populate_personas(connection, 1000)
    print("В таблице", count_rows(connection, "personas"), "строк.")
    search_by_unique_time()
    search_by_NOT_unique_time()


    populate_personas(connection, 9000)
    print("В таблице", count_rows(connection, "personas"), "строк.")
    search_by_unique_time()
    search_by_NOT_unique_time()


    populate_personas(connection, 90000)
    print("В таблице", count_rows(connection, "personas"), "строк.")
    search_by_unique_time()
    search_by_NOT_unique_time()


    connection.close()
    print(f"Соединение с PostgreSQL: {dbname} закрыто")



