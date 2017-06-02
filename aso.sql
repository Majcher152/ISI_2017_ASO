-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 02 Cze 2017, 20:32
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
  `warsztat_id_fk` int(7) NOT NULL,
  `vin_fk` varchar(17) COLLATE utf8_unicode_ci NOT NULL
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
(392041, ' Lupo ', 2004, ' Van', ' 1.4 '),
(392042, ' Fox ', 2015, ' Van', ' 1.2 '),
(392043, ' Up ', 2001, 'Sedan ', ' 2.5 '),
(392044, ' Touareg ', 2011, ' Hatchback ', '1.0 '),
(392045, ' Beetle', 2013, 'Sedan ', ' 2.0 '),
(392046, ' Scirocco ', 2006, ' Van', ' 3.0'),
(392047, ' Beetle', 2011, ' Kombi ', ' 2.0 '),
(392048, ' Bora ', 2005, 'Sedan ', ' 1.9 '),
(392049, ' Scirocco ', 2011, ' Kombi ', ' 1.9 '),
(392050, ' Up ', 2014, ' Van', ' 1.9 '),
(392051, ' Touareg ', 2006, ' Kombi ', ' 1.2 '),
(392052, ' Passat ', 2007, 'Sedan ', '1.0 '),
(392053, ' Beetle', 2014, ' Kombi ', ' 1.4 '),
(392054, ' Passat ', 2015, ' Kombi ', ' 1.4 '),
(392055, ' Touareg ', 2002, ' Van', ' 1.9 '),
(392056, 'Caddy ', 2017, ' Van', '1.0 '),
(392057, ' Up ', 2000, ' Van', '1.0 '),
(392058, ' Beetle', 2004, ' Hatchback ', ' 1.4 '),
(392059, 'Caddy ', 2016, 'Sedan ', ' 3.0'),
(392060, ' Lupo ', 2016, 'Sedan ', ' 2.0 '),
(392061, ' Bora ', 2000, 'Sedan ', ' 1.4 '),
(392062, ' Up ', 2017, 'Sedan ', ' 1.4 '),
(392063, ' Polo ', 2004, 'Sedan ', ' 1.2 '),
(392064, ' Passat ', 2005, ' Hatchback ', ' 1.2 '),
(392065, 'Caddy ', 2009, ' Van', '1.0 '),
(392066, ' Up ', 2000, 'Sedan ', ' 3.0'),
(392067, ' Up ', 2016, ' Kombi ', ' 1.2 '),
(392068, ' Fox ', 2016, ' Van', ' 1.4 '),
(392069, ' Beetle', 2012, ' Hatchback ', ' 1.4 '),
(392070, ' Beetle', 2001, 'Sedan ', ' 2.0 '),
(392071, ' Fox ', 2007, ' Van', ' 2.0 '),
(392072, ' Passat ', 2004, ' Kombi ', '1.0 '),
(392073, ' Bora ', 2011, 'Sedan ', ' 2.0 '),
(392074, ' Scirocco ', 2007, 'Sedan ', '1.0 '),
(392075, ' Fox ', 2011, ' Van', '1.0 '),
(392076, ' Polo ', 2003, ' Kombi ', ' 1.9 '),
(392077, ' Touareg ', 2004, ' Van', ' 1.9 '),
(392078, ' Jetta ', 2007, ' Van', ' 2.5 '),
(392079, ' Touareg ', 2010, ' Van', '1.0 '),
(392080, ' Jetta ', 2010, ' Van', '1.0 '),
(392081, ' Scirocco ', 2009, ' Van', ' 2.0 '),
(392082, ' Fox ', 2002, ' Hatchback ', ' 2.0 '),
(392083, ' Up ', 2010, 'Sedan ', ' 2.5 '),
(392084, ' Fox ', 2017, ' Van', ' 1.4 '),
(392085, ' Lupo ', 2011, ' Hatchback ', ' 1.4 '),
(392086, ' Beetle', 2014, ' Van', ' 3.0'),
(392087, 'Caddy ', 2013, 'Sedan ', ' 1.4 '),
(392088, ' Up ', 2002, ' Hatchback ', ' 1.4 '),
(392089, ' Up ', 2005, ' Hatchback ', ' 1.2 '),
(392090, ' Lupo ', 2009, 'Sedan ', ' 2.5 '),
(392091, ' Polo ', 2007, ' Hatchback ', ' 3.0'),
(392092, ' Jetta ', 2008, 'Sedan ', '1.0 '),
(392093, ' Jetta ', 2014, ' Van', ' 1.9 '),
(392094, 'Caddy ', 2004, ' Hatchback ', ' 1.2 '),
(392095, ' Polo ', 2016, ' Van', ' 1.2 '),
(392096, 'Caddy ', 2005, ' Hatchback ', ' 3.0'),
(392097, ' Jetta ', 2006, ' Kombi ', ' 1.9 '),
(392098, ' Passat ', 2004, ' Van', ' 1.9 '),
(392099, ' Touareg ', 2006, ' Kombi ', ' 3.0'),
(392100, ' Lupo ', 2017, ' Kombi ', ' 2.5 '),
(392101, ' Touareg ', 2015, 'Sedan ', ' 1.2 '),
(392102, ' Jetta ', 2002, ' Van', '1.0 '),
(392103, ' Touareg ', 2003, ' Van', ' 2.5 '),
(392104, ' Fox ', 2007, ' Kombi ', ' 1.2 '),
(392105, ' Polo ', 2015, 'Sedan ', ' 2.5 '),
(392106, ' Jetta ', 2005, ' Kombi ', ' 1.2 '),
(392107, ' Lupo ', 2004, ' Kombi ', ' 3.0'),
(392108, ' Polo ', 2002, ' Van', ' 1.4 '),
(392109, ' Polo ', 2015, 'Sedan ', ' 2.5 '),
(392110, ' Passat ', 2016, ' Kombi ', ' 2.5 '),
(392111, ' Jetta ', 2015, ' Kombi ', ' 2.0 '),
(392112, ' Scirocco ', 2011, ' Kombi ', '1.0 '),
(392113, ' Lupo ', 2002, ' Kombi ', ' 2.5 '),
(392114, ' Up ', 2008, ' Kombi ', ' 1.2 '),
(392115, ' Touareg ', 2008, ' Van', ' 1.4 '),
(392116, ' Lupo ', 2004, 'Sedan ', '1.0 '),
(392117, ' Fox ', 2008, ' Kombi ', ' 2.0 '),
(392118, ' Touareg ', 2006, 'Sedan ', ' 2.5 '),
(392119, ' Fox ', 2007, 'Sedan ', ' 3.0'),
(392120, ' Scirocco ', 2011, ' Hatchback ', '1.0 '),
(392121, ' Beetle', 2001, ' Van', '1.0 '),
(392122, 'Caddy ', 2000, ' Kombi ', ' 1.9 '),
(392123, ' Up ', 2010, ' Hatchback ', ' 2.5 '),
(392124, ' Lupo ', 2008, ' Hatchback ', ' 3.0'),
(392125, ' Polo ', 2012, ' Kombi ', ' 1.9 '),
(392126, ' Up ', 2011, ' Kombi ', ' 2.5 '),
(392127, ' Polo ', 2008, ' Van', ' 2.0 '),
(392128, ' Beetle', 2010, ' Kombi ', ' 3.0'),
(392129, 'Caddy ', 2001, ' Kombi ', ' 1.2 '),
(392130, ' Polo ', 2003, ' Van', ' 1.9 '),
(392131, ' Up ', 2003, 'Sedan ', ' 1.2 '),
(392132, ' Scirocco ', 2016, ' Kombi ', ' 3.0'),
(392133, 'Caddy ', 2017, ' Van', '1.0 '),
(392134, ' Scirocco ', 2002, 'Sedan ', ' 3.0'),
(392135, ' Bora ', 2010, ' Hatchback ', ' 2.0 '),
(392136, ' Polo ', 2014, ' Kombi ', ' 3.0'),
(392137, ' Fox ', 2011, ' Kombi ', ' 2.5 '),
(392138, ' Passat ', 2005, ' Hatchback ', ' 3.0'),
(392139, ' Passat ', 2012, ' Hatchback ', ' 1.9 '),
(392140, ' Scirocco ', 2000, ' Van', ' 2.0 ');

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
('bbb', 'bbb', 'bbb', 'bbb', 'bbb@bbb.pl', 456789123, 'uzytkownik'),
('ccc', 'ccc', 'ccc', 'ccc', 'ccc@ccc.pl', 789456143, 'ksiegowy'),
('ddd', 'ddd', 'ddd', 'ddd', 'ddd@ddd.pl', 987456321, 'mechanik'),
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
  ADD KEY `warsztat_id_fk` (`warsztat_id_fk`),
  ADD KEY `vin_fk_idx` (`vin_fk`);

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
-- AUTO_INCREMENT dla tabeli `samochod`
--
ALTER TABLE `samochod`
  MODIFY `samochod_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392141;
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
  ADD CONSTRAINT `formularz_naprawy_ibfk_2` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`),
  ADD CONSTRAINT `formularz_naprawy_ibfk_3` FOREIGN KEY (`vin_fk`) REFERENCES `uzytkownik_samochod` (`vin`);

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
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_3` FOREIGN KEY (`Uzytkownik_login_fk`) REFERENCES `uzytkownik` (`login`),
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_4` FOREIGN KEY (`Samochod_if_fk`) REFERENCES `samochod` (`samochod_id`);

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
