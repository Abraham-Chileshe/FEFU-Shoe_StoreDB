import pymysql.cursors
from random import randint

# Connect to the database

connection = pymysql.connect(host='localhost', user='root', password='', database='shoe_store', cursorclass=pymysql.cursors.DictCursor)
def random_with_N_digits(n):
    range_start = 10 ** (n - 1)
    range_end = (10 ** n) - 1
    return randint(range_start, range_end)

def customers(n):
    for x in range(n):
        sql = "INSERT INTO `customer` (`Name`, `Contact`,`email`) VALUES (%s, %s, %s)"
        cursor.execute(sql, ('customer-{}'.format(x), '+{}'.format(random_with_N_digits(10)), 'user{}@yandex.ru'.format(x)))

def colors():
    a_file = open("colors.txt")
    lines = a_file.readlines()

    for line in lines:
        sql = "INSERT INTO `color` (`Color_name`) VALUES (%s)"
        cursor.execute(sql, ('{}'.format(line)))
def Size():
    a_file = open("sizes.txt")
    lines = a_file.readlines()

    for line in lines:
        sql = "INSERT INTO `sizes` (`SNumber`) VALUES (%s)"
        cursor.execute(sql, ('size: {}'.format(line)))

with connection:
    with connection.cursor() as cursor:

        # reseting auto_increment to 0;
        altercustomer = "ALTER TABLE customer AUTO_INCREMENT = 1"
        altercolor = "ALTER TABLE color AUTO_INCREMENT = 1"
        altersizes = "ALTER TABLE sizes AUTO_INCREMENT = 1"

        cursor.execute(altercustomer)
        cursor.execute(altercolor)
        cursor.execute(altersizes)

        customers(500000)
        colors()
        Size()


    connection.commit()



