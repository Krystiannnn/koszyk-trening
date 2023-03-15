-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 15 Mar 2023, 19:44
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `pizza`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_polish_ci NOT NULL,
  `price` float NOT NULL,
  `Image` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `food`
--

INSERT INTO `food` (`id`, `name`, `price`, `Image`) VALUES
(1, 'Pizza Margheritta', 50, 'malysz.jpg'),
(2, 'Pizza Hawajska', 57, 'malysz.jpg'),
(3, 'Pizza Farmerska', 19, 'malysz.jpg'),
(4, 'lesna', 100, 'malysz.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orderedFood`
--

CREATE TABLE `orderedFood` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `orderedFood`
--

INSERT INTO `orderedFood` (`id`, `orderId`, `foodId`) VALUES
(1, 16, 1),
(2, 16, 2),
(3, 16, 3),
(4, 17, 2),
(5, 17, 3),
(6, 17, 3),
(7, 18, 1),
(8, 18, 1),
(9, 18, 3),
(10, 19, 1),
(11, 20, 1),
(12, 20, 4),
(13, 20, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `id` int(11) NOT NULL,
  `firstName` text COLLATE utf8mb4_polish_ci NOT NULL,
  `lastName` text COLLATE utf8mb4_polish_ci NOT NULL,
  `address` text COLLATE utf8mb4_polish_ci NOT NULL,
  `phone` text COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `zamowienie`
--

INSERT INTO `zamowienie` (`id`, `firstName`, `lastName`, `address`, `phone`) VALUES
(1, 'Jan', 'Kowalski', 'zielona 1', '34543535345'),
(13, 'wdwwd', 'wdww', 'wdwdw', '1111111111111111'),
(14, 'wdc', 'wcdd', 'wdd', '999999999999999'),
(15, 'qqqqqqqq', 'wwwwwwww', 'eeeeeeee', '333333333333'),
(16, 'gdgdgddg', 'sdcdc', 'qadqqwd', '1111111111111111'),
(17, 'qs', 'qs', 'ss', '543'),
(18, 'Jan', 'Jancio', 'Wiocha', '997'),
(19, 'asas', 'aasxax', 'axsax', 'axsax'),
(20, 'ddddddd', 'ddddddd', 'dddddddd', 'ddddddddd');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orderedFood`
--
ALTER TABLE `orderedFood`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `foodId` (`foodId`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `orderedFood`
--
ALTER TABLE `orderedFood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `orderedFood`
--
ALTER TABLE `orderedFood`
  ADD CONSTRAINT `orderedFood_ibfk_1` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderedFood_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `zamowienie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
