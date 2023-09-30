from datetime import *
import random
from faker import Faker
fake = Faker('ru-RU')


def rand_day_between(day1, day2):
    total_days = (day2 - day1).days
    random_days = random.randint(0, total_days)
    random_day = day1 + timedelta(days=random_days)
    return random_day


def count_rows(connection, table_name):
    try:
        cursor = connection.cursor()

        query = f"SELECT COUNT(*) FROM {table_name};"
        cursor.execute(query)
        result = cursor.fetchone()
        count = result[0]
        return count
    except (Exception, psycopg2.Error) as error:
        print("Error while counting rows:", error)
    finally:
        if cursor:
            cursor.close()


def delete_all_rows(connection, table_name):
    try:
        cursor = connection.cursor()

        query = f"DELETE FROM {table_name};"
        cursor.execute(query)
        connection.commit()

        print(f"All rows deleted from table '{table_name}'.")

    except (Exception, psycopg2.Error) as error:
        connection.rollback()
        print("Error while deleting rows:", error)

    finally:
        if cursor:
            cursor.close()


def populate_cars(connection, count=1):
    cursor = connection.cursor()
    postgres_insert_query1 = """
    INSERT INTO cars (is_reanimation, date_new)
    VALUES (%s, %s);
    """
    postgres_insert_query2 = """
    INSERT INTO cars (is_reanimation, date_new, date_end)
    VALUES (%s, %s, %s);
    """
    today = date.today()
    for i in range(count):
        rand_reanim = random.choice([True, False, True])
        rand_car_new_time = rand_day_between(date(1999, 1, 1), date(2009, 1, 1))
        rand_car_end_time = rand_day_between(date(2009, 1, 2), date(2029, 1, 1))
        if rand_car_end_time > today:
            record_to_insert = (rand_reanim, rand_car_new_time)
            cursor.execute(postgres_insert_query1, record_to_insert)
        else:
            record_to_insert = (rand_reanim, rand_car_new_time, rand_car_end_time)
            cursor.execute(postgres_insert_query2, record_to_insert)
        connection.commit()

    cursor.close()
    print(f"{count} записей успешно добавлена ​​в таблицу cars")


def populate_personas(connection, count=1):
    cursor = connection.cursor()
    postgres_insert_query = """
    INSERT INTO personas (name, birthday)
    VALUES (%s, %s);
    """
    today = date.today()
    for i in range(count):
        record_to_insert = (fake.name(), rand_day_between(date(1949, 1, 1), date(2000, 1, 1)))
        cursor.execute(postgres_insert_query, record_to_insert)
    
    connection.commit()
    
    cursor.close()
    print(f"{count} записей успешно добавлено ​​в таблицу personas")


def search_by(connection, table, field, val):
    try:
        cursor = connection.cursor()

        query = f"SELECT * FROM {table} WHERE {field} = %s;"
        cursor.execute(query, (val,))

        results = cursor.fetchall()

        if results:
            return results
        else:
            return []
    except (Exception, psycopg2.Error) as error:
        print("Error while searching:", error)
    finally:
        if cursor:
            cursor.close()
