# Shoe_Store

<h3>Requirement:</h3>

``` python
$ python3 -m pip install PyMySQL
```

<h3>Libraries:</h3>
<p>- pymysql.cursor for connecting to database <br/>- randint used for generating random number</p>

```python
import pymysql.cursors
from random import randint
```
<h3>Connecting to DB</h3>

```python
connection = pymysql.connect(host='localhost', user='root', password='', database='shoe_store', cursorclass=pymysql.cursors.DictCursor)
```

<h3>Methods</h3>
<p>Generating random values with specified n digits</p>

```python
def random_with_N_digits(n):
    range_start = 10 ** (n - 1)
    range_end = (10 ** n) - 1
    return randint(range_start, range_end)


