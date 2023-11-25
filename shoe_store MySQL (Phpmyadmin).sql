-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2023 at 06:24 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

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
  `Color_name` varchar(40) DEFAULT NULL,
  `created_Id` timestamp NULL DEFAULT NULL,
  `updated_Id` timestamp NULL DEFAULT NULL
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
  `SNumber` varchar(10) DEFAULT NULL,
  `details` text,
  `created_date` timestamp NULL DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL
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
  MODIFY `Color_ID` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `Size_ID` int(11) NOT NULL AUTO_INCREMENT;
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
  ADD CONSTRAINT `shoe_size_ibfk_1` FOREIGN KEY (`Shoes_ID`) REFERENCES `specific_shoe` (`Spec_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_ibfk_1` FOREIGN KEY (`Size_ID`) REFERENCES `shoe_size` (`Size_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `specific_shoe`
--
ALTER TABLE `specific_shoe`
  ADD CONSTRAINT `specific_shoe_ibfk_1` FOREIGN KEY (`Shoes_ID`) REFERENCES `shoes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
