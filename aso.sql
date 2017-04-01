-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 01 Kwi 2017, 19:13
-- Wersja serwera: 10.1.21-MariaDB
-- Wersja PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `aso`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czesc`
--

CREATE TABLE `czesc` (
  `id` int(7) NOT NULL,
  `nazwa` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `dostepnych_w_warsztacie` int(5) NOT NULL,
  `cena_za_sztuke` double(7,2) NOT NULL,
  `zamowienie_id_fk` int(7) DEFAULT NULL,
  `warsztat_id_fk` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `formularz_naprawy`
--

CREATE TABLE `formularz_naprawy` (
  `id` int(7) NOT NULL,
  `opis` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `koszt_naprawy` double(7,2) NOT NULL,
  `uzytkownik_login_fk` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `warsztat_id_fk` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochod`
--

CREATE TABLE `samochod` (
  `vin` varchar(17) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rocznik` int(4) NOT NULL,
  `typ` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `silnik` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `warsztat_id_fk` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochod_czesc`
--

CREATE TABLE `samochod_czesc` (
  `czesc_id_fk` int(7) NOT NULL,
  `samochod_vin_fk` varchar(17) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `login` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `haslo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `imie` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nazwisko` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `numer_telefonu` int(9) NOT NULL,
  `rodzaj_konta` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik_samochod`
--

CREATE TABLE `uzytkownik_samochod` (
  `uzytkownik_login_fk` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `samochod_vin_fk` varchar(17) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `warsztat`
--

CREATE TABLE `warsztat` (
  `id` int(7) NOT NULL,
  `adres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `miasto` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `numer_telefonu` int(9) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `max_liczba_aut` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `id` int(7) NOT NULL,
  `ilosc_czesci` int(7) NOT NULL,
  `rodzaj_czesci` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `koszt` double(7,2) NOT NULL,
  `warsztat_id_fk` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `czesc`
--
ALTER TABLE `czesc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nazwa` (`nazwa`),
  ADD KEY `zamowienie_id_fk` (`zamowienie_id_fk`),
  ADD KEY `warsztat_id_fk` (`warsztat_id_fk`);

--
-- Indexes for table `formularz_naprawy`
--
ALTER TABLE `formularz_naprawy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uzytkownik_login_fk` (`uzytkownik_login_fk`),
  ADD KEY `warsztat_id_fk` (`warsztat_id_fk`);

--
-- Indexes for table `samochod`
--
ALTER TABLE `samochod`
  ADD PRIMARY KEY (`vin`),
  ADD KEY `warsztat_id_fk` (`warsztat_id_fk`);

--
-- Indexes for table `samochod_czesc`
--
ALTER TABLE `samochod_czesc`
  ADD PRIMARY KEY (`czesc_id_fk`,`samochod_vin_fk`),
  ADD KEY `samochod_vin_fk` (`samochod_vin_fk`);

--
-- Indexes for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`login`),
  ADD UNIQUE KEY `email_u_idx` (`email`),
  ADD UNIQUE KEY `numer_telefonu` (`numer_telefonu`);

--
-- Indexes for table `uzytkownik_samochod`
--
ALTER TABLE `uzytkownik_samochod`
  ADD PRIMARY KEY (`uzytkownik_login_fk`,`samochod_vin_fk`),
  ADD KEY `samochod_vin_fk` (`samochod_vin_fk`);

--
-- Indexes for table `warsztat`
--
ALTER TABLE `warsztat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numer_telefonu_u_idx` (`numer_telefonu`),
  ADD UNIQUE KEY `email_u_idx` (`email`);

--
-- Indexes for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rodzaj_czesci_u_idx` (`rodzaj_czesci`),
  ADD KEY `warsztat_id_fk` (`warsztat_id_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `czesc`
--
ALTER TABLE `czesc`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `formularz_naprawy`
--
ALTER TABLE `formularz_naprawy`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `warsztat`
--
ALTER TABLE `warsztat`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `czesc`
--
ALTER TABLE `czesc`
  ADD CONSTRAINT `czesc_ibfk_1` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`),
  ADD CONSTRAINT `czesc_ibfk_2` FOREIGN KEY (`zamowienie_id_fk`) REFERENCES `zamowienie` (`id`);

--
-- Ograniczenia dla tabeli `formularz_naprawy`
--
ALTER TABLE `formularz_naprawy`
  ADD CONSTRAINT `formularz_naprawy_ibfk_1` FOREIGN KEY (`uzytkownik_login_fk`) REFERENCES `uzytkownik` (`login`),
  ADD CONSTRAINT `formularz_naprawy_ibfk_2` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`);

--
-- Ograniczenia dla tabeli `samochod`
--
ALTER TABLE `samochod`
  ADD CONSTRAINT `samochod_ibfk_1` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`);

--
-- Ograniczenia dla tabeli `samochod_czesc`
--
ALTER TABLE `samochod_czesc`
  ADD CONSTRAINT `samochod_czesc_ibfk_1` FOREIGN KEY (`czesc_id_fk`) REFERENCES `czesc` (`id`),
  ADD CONSTRAINT `samochod_czesc_ibfk_2` FOREIGN KEY (`samochod_vin_fk`) REFERENCES `samochod` (`vin`);

--
-- Ograniczenia dla tabeli `uzytkownik_samochod`
--
ALTER TABLE `uzytkownik_samochod`
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_1` FOREIGN KEY (`uzytkownik_login_fk`) REFERENCES `uzytkownik` (`login`),
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_2` FOREIGN KEY (`samochod_vin_fk`) REFERENCES `samochod` (`vin`);

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
