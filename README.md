# Shoe_Store

<h3>Requirement:</h3>

``` python
$ python3 -m pip install PyMySQL
```
<br/><br/>
<h3>Libraries:</h3>
<p>- pymysql.cursor for connecting to database <br/>- randint used for generating random number</p>

```python
import pymysql.cursors
from random import randint
```

<br/><br/>
<h3>Connecting to DB</h3>

```python
connection = pymysql.connect(host='localhost', user='root', password='', database='shoe_store', cursorclass=pymysql.cursors.DictCursor)
```
<br/><br/>
<h3>Methods</h3>
<p>Generating random values with specified n digits</p>

```python
def random_with_N_digits(n):
    range_start = 10 ** (n - 1)
    range_end = (10 ** n) - 1
    return randint(range_start, range_end)
```

<p>Inserting <code>n</code> rows into the customers table</p>

```python
def customers(n):
    for x in range(n):
        sql = "INSERT INTO `customer` (`Name`, `Contact`,`email`) VALUES (%s, %s, %s)"
        cursor.execute(sql, ('customer-{}'.format(x), '+{}'.format(random_with_N_digits(10)), 'user{}@yandex.ru'.format(x)))
```

<p>Inserting colors into the <code>color_table</code> using colors from the colors.txt file</p>

```python
def colors():
    a_file = open("colors.txt")
    lines = a_file.readlines()

    for line in lines:
        sql = "INSERT INTO `color` (`Color_name`) VALUES (%s)"
        cursor.execute(sql, ('{}'.format(line)))
```
<p>Inserting sizes into the <code>sizes_table</code> using sizes from the sizes.txt file</p>

```python
def Size():
    a_file = open("sizes.txt")
    lines = a_file.readlines()

    for line in lines:
        sql = "INSERT INTO `sizes` (`SNumber`) VALUES (%s)"
        cursor.execute(sql, ('size: {}'.format(line)))
```

<br/><br/>
<h3>Main Method</h3>

```python
with connection:
    with connection.cursor() as cursor:

        # reseting auto_increment to 0;
        altercustomer = "ALTER TABLE customer AUTO_INCREMENT = 1"
        altercolor = "ALTER TABLE color AUTO_INCREMENT = 1"
        altersizes = "ALTER TABLE sizes AUTO_INCREMENT = 1"

        cursor.execute(altercustomer)
        cursor.execute(altercolor)
        cursor.execute(altersizes)

        #customers(500000)
        #colors()
        #Size()

        print(Size())

    connection.commit()
```

<h2>SQL SCRIPT</h2>

```sql
-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2023 at 11:57 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoe_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Cat_ID` int(11) NOT NULL,
  `Cname` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category_shoe`
--

CREATE TABLE `category_shoe` (
  `CS_ID` int(11) NOT NULL,
  `shoe_id` int(11) DEFAULT NULL,
  `Cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `Color_ID` int(11) NOT NULL,
  `Color_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Contact` text NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_Id` int(11) NOT NULL,
  `Customer_Id` int(11) NOT NULL,
  `Shoe_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shoes`
--

CREATE TABLE `shoes` (
  `ID` int(11) NOT NULL,
  `Sname` varchar(30) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `details` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shoe_color`
--

CREATE TABLE `shoe_color` (
  `SC_Id` int(11) NOT NULL,
  `Shoe_ID` int(11) NOT NULL,
  `Color_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shoe_image`
--

CREATE TABLE `shoe_image` (
  `Img_ID` int(11) NOT NULL,
  `Shoes_ID` int(11) NOT NULL,
  `img_url` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shoe_size`
--

CREATE TABLE `shoe_size` (
  `SS_ID` int(11) NOT NULL,
  `Shoes_ID` int(11) NOT NULL,
  `Size_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `Size_ID` int(11) NOT NULL,
  `SNumber` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `specific_shoe`
--

CREATE TABLE `specific_shoe` (
  `Spec_ID` int(11) NOT NULL,
  `Shoes_ID` int(11) NOT NULL,
  `Price` varchar(30) DEFAULT NULL,
  `order_type` varchar(30) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Cat_ID`);

--
-- Indexes for table `category_shoe`
--
ALTER TABLE `category_shoe`
  ADD PRIMARY KEY (`CS_ID`),
  ADD KEY `shoe_id` (`shoe_id`),
  ADD KEY `Cat_id` (`Cat_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`Color_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_Id`),
  ADD KEY `orders_ibfk_1` (`Customer_Id`),
  ADD KEY `orders_ibfk_2` (`Shoe_Id`);

--
-- Indexes for table `shoes`
--
ALTER TABLE `shoes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shoe_color`
--
ALTER TABLE `shoe_color`
  ADD PRIMARY KEY (`SC_Id`),
  ADD KEY `Color_ID` (`Color_ID`),
  ADD KEY `Shoe_ID` (`Shoe_ID`);

--
-- Indexes for table `shoe_image`
--
ALTER TABLE `shoe_image`
  ADD PRIMARY KEY (`Img_ID`),
  ADD KEY `Shoes_ID` (`Shoes_ID`);

--
-- Indexes for table `shoe_size`
--
ALTER TABLE `shoe_size`
  ADD PRIMARY KEY (`SS_ID`),
  ADD KEY `Size_ID` (`Size_ID`),
  ADD KEY `Shoes_ID` (`Shoes_ID`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`Size_ID`);

--
-- Indexes for table `specific_shoe`
--
ALTER TABLE `specific_shoe`
  ADD PRIMARY KEY (`Spec_ID`),
  ADD KEY `Shoes_ID` (`Shoes_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Cat_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category_shoe`
--
ALTER TABLE `category_shoe`
  MODIFY `CS_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `Color_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shoes`
--
ALTER TABLE `shoes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shoe_color`
--
ALTER TABLE `shoe_color`
  MODIFY `SC_Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shoe_image`
--
ALTER TABLE `shoe_image`
  MODIFY `Img_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shoe_size`
--
ALTER TABLE `shoe_size`
  MODIFY `SS_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `Size_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `specific_shoe`
--
ALTER TABLE `specific_shoe`
  MODIFY `Spec_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_shoe`
--
ALTER TABLE `category_shoe`
  ADD CONSTRAINT `category_shoe_ibfk_1` FOREIGN KEY (`shoe_id`) REFERENCES `shoes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_shoe_ibfk_2` FOREIGN KEY (`Cat_id`) REFERENCES `category` (`Cat_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Shoe_Id`) REFERENCES `shoes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shoe_color`
--
ALTER TABLE `shoe_color`
  ADD CONSTRAINT `shoe_color_ibfk_1` FOREIGN KEY (`Color_ID`) REFERENCES `color` (`Color_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shoe_color_ibfk_2` FOREIGN KEY (`Shoe_ID`) REFERENCES `specific_shoe` (`Spec_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shoe_image`
--
ALTER TABLE `shoe_image`
  ADD CONSTRAINT `shoe_image_ibfk_1` FOREIGN KEY (`Shoes_ID`) REFERENCES `specific_shoe` (`Spec_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shoe_size`
--
ALTER TABLE `shoe_size`
  ADD CONSTRAINT `shoe_size_ibfk_1` FOREIGN KEY (`Shoes_ID`) REFERENCES `specific_shoe` (`Spec_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shoe_size_ibfk_2` FOREIGN KEY (`Size_ID`) REFERENCES `sizes` (`Size_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `specific_shoe`
--
ALTER TABLE `specific_shoe`
  ADD CONSTRAINT `specific_shoe_ibfk_1` FOREIGN KEY (`Shoes_ID`) REFERENCES `shoes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
```
