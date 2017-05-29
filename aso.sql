-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Maj 2017, 16:23
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
-- Struktura tabeli dla tabeli `mechanik_warsztat`
--

CREATE TABLE `mechanik_warsztat` (
  `mechanik_login_fk` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id_warsztatu_fk` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przeglad`
--

CREATE TABLE `przeglad` (
  `id_przegladu` int(7) NOT NULL,
  `id_warsztatu_fk` int(7) NOT NULL,
  `vin_fk` varchar(17) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `godzina` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochod`
--

CREATE TABLE `samochod` (
  `samochod_id` int(7) NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rocznik` int(4) NOT NULL,
  `typ` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `silnik` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `samochod`
--

INSERT INTO `samochod` (`samochod_id`, `model`, `rocznik`, `typ`, `silnik`) VALUES
(0, 'lupo', 1999, 'hatchback', '1.4'),
(100, 'lupo', 2000, 'hasback', '4.4'),
(200, 'garbus', 1999, 'hasback', '4.4'),
(20102, 'lupo', 1999, 'hashback', '4.5'),
(34832, 'lupo', 1999, 'hatchback', '3.0'),
(392039, 'lupo', 1999, 'hashback', '4.6');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochod_czesc`
--

CREATE TABLE `samochod_czesc` (
  `czesc_id_fk` int(7) NOT NULL,
  `samochod_id_fk` int(7) NOT NULL
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

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`login`, `haslo`, `imie`, `nazwisko`, `email`, `numer_telefonu`, `rodzaj_konta`) VALUES
('aaa', 'aaa', 'aaa', 'aaa', 'aaa', 123, 'admin'),
('kasia', 'kasiakasia', 'kasia', 'klimek', 'katha.ftw@gmail.com', 883431798, 'uzytkownik'),
('kasiakasia2', 'Kasiakasia1!', 'Kasia', 'Klimek', 'op2@op.pl', 789789788, 'admin'),
('ookaa', 'Ooskaaooskaa1', 'ŁukaszŁukaszNiePoruchasz', 'MożeJednakPoruchaszĘĄŻŹĆ', 'ooskaa@ooskaa.pl', 789456123, 'uzytkownik'),
('ooskaa', 'Asdfghjkl1', 'fvrleknbouibwiln', 'kupkowski', 'przyklad@przyplad.pl', 999999999, 'uzytkownik'),
('oskaoska', 'Oskaoska1!', 'Piotr', 'Osiewicz', 'opop2@op.pl', 789789787, 'uzytkownik');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik_samochod`
--

CREATE TABLE `uzytkownik_samochod` (
  `Uzytkownik_login_fk` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Samochod_if_fk` int(7) NOT NULL,
  `vin` varchar(17) COLLATE utf8_unicode_ci NOT NULL,
  `warsztat_id_fk` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

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
  `ilosc_stanowisk` int(2) NOT NULL,
  `godzina_otwarcia` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `godzina_zamkniecia` varchar(5) COLLATE utf8_unicode_ci NOT NULL
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
-- Indexes for table `mechanik_warsztat`
--
ALTER TABLE `mechanik_warsztat`
  ADD PRIMARY KEY (`mechanik_login_fk`,`id_warsztatu_fk`),
  ADD KEY `id_warsztatu_fk` (`id_warsztatu_fk`);

--
-- Indexes for table `przeglad`
--
ALTER TABLE `przeglad`
  ADD PRIMARY KEY (`id_przegladu`),
  ADD KEY `id_warsztatu_fk_idx` (`id_warsztatu_fk`),
  ADD KEY `vin_fk_idx` (`vin_fk`);

--
-- Indexes for table `samochod`
--
ALTER TABLE `samochod`
  ADD PRIMARY KEY (`samochod_id`);

--
-- Indexes for table `samochod_czesc`
--
ALTER TABLE `samochod_czesc`
  ADD PRIMARY KEY (`czesc_id_fk`,`samochod_id_fk`),
  ADD KEY `samochod_id_fk` (`samochod_id_fk`);

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
  ADD PRIMARY KEY (`vin`),
  ADD KEY `Uzytkownik_login_fk_idx` (`Uzytkownik_login_fk`),
  ADD KEY `Samochod_if_fk_idx` (`Samochod_if_fk`),
  ADD KEY `warsztat_id_fk_idx` (`warsztat_id_fk`);

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
-- AUTO_INCREMENT dla tabeli `przeglad`
--
ALTER TABLE `przeglad`
  MODIFY `id_przegladu` int(7) NOT NULL AUTO_INCREMENT;
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
-- Ograniczenia dla tabeli `mechanik_warsztat`
--
ALTER TABLE `mechanik_warsztat`
  ADD CONSTRAINT `mechanik_warsztat_ibfk_1` FOREIGN KEY (`id_warsztatu_fk`) REFERENCES `warsztat` (`id`),
  ADD CONSTRAINT `mechanik_warsztat_ibfk_2` FOREIGN KEY (`mechanik_login_fk`) REFERENCES `uzytkownik` (`login`);

--
-- Ograniczenia dla tabeli `przeglad`
--
ALTER TABLE `przeglad`
  ADD CONSTRAINT `przeglad_ibfk_1` FOREIGN KEY (`vin_fk`) REFERENCES `uzytkownik_samochod` (`Uzytkownik_login_fk`),
  ADD CONSTRAINT `przeglad_ibfk_2` FOREIGN KEY (`id_warsztatu_fk`) REFERENCES `warsztat` (`id`);

--
-- Ograniczenia dla tabeli `samochod_czesc`
--
ALTER TABLE `samochod_czesc`
  ADD CONSTRAINT `samochod_czesc_ibfk_1` FOREIGN KEY (`czesc_id_fk`) REFERENCES `czesc` (`id`),
  ADD CONSTRAINT `samochod_czesc_ibfk_2` FOREIGN KEY (`samochod_id_fk`) REFERENCES `samochod` (`samochod_id`);

--
-- Ograniczenia dla tabeli `uzytkownik_samochod`
--
ALTER TABLE `uzytkownik_samochod`
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_1` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`),
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_2` FOREIGN KEY (`Samochod_if_fk`) REFERENCES `samochod` (`samochod_id`),
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_3` FOREIGN KEY (`Uzytkownik_login_fk`) REFERENCES `uzytkownik` (`login`);

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
