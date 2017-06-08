-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Cze 2017, 17:29
-- Wersja serwera: 10.1.21-MariaDB
-- Wersja PHP: 7.0.15

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
-- Struktura tabeli dla tabeli `cennik_podstawowy`
--

CREATE TABLE `cennik_podstawowy` (
  `id` int(7) NOT NULL,
  `nazwa` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `cena` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `cennik_podstawowy`
--

INSERT INTO `cennik_podstawowy` (`id`, `nazwa`, `cena`) VALUES
(1, 'Przegląd samochodu', '120 zł'),
(2, 'Wymiana olejów i filtrów', 'Od 249 zł'),
(3, 'Wymiana kół/opon na zimowe/letnich', 'od 49 zł'),
(4, 'Dezynfekcja/nabicie klimatyzacji', 'Od 149 zł'),
(5, 'Wymiana klocków hamulcowych', 'Od 99 zł'),
(6, 'Wymiana tłumika', 'Od 299 zł');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czesc`
--

CREATE TABLE `czesc` (
  `id` int(7) NOT NULL,
  `nazwa` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `dostepnych_w_magazynie` int(5) NOT NULL,
  `cena_za_sztuke` double(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `czesc`
--

INSERT INTO `czesc` (`id`, `nazwa`, `dostepnych_w_magazynie`, `cena_za_sztuke`) VALUES
(1, 'turbo', 20, 1460.00),
(2, 'bęben hamulcowy', 3, 640.00),
(3, 'wysprzęglik', 13, 851.00),
(4, 'amortyzator', 18, 916.00),
(5, 'akumulator', 8, 667.00),
(6, 'półoś', 10, 1069.00),
(7, 'rozrusznik', 18, 868.00),
(8, 'pompa paliwa', 12, 1314.00),
(9, 'cewka zapłonowa', 6, 537.00),
(10, 'olej', 1, 530.00),
(11, 'chłodnica', 13, 524.00),
(12, 'czujnik parkowania', 5, 850.00),
(13, 'przewody hamulcowe', 19, 1182.00),
(14, 'bęben hamulcowy', 9, 421.00),
(15, 'lampa', 20, 563.00),
(16, 'szyba tylnia', 18, 1965.00),
(17, 'miska olejowa', 17, 1907.00),
(18, 'klocki hamulcowe', 5, 1099.00),
(19, 'felga', 16, 116.00),
(20, 'tarcza hamulcowa', 5, 1639.00),
(21, 'wahacz', 12, 1842.00),
(22, 'filtr oleju', 9, 899.00),
(23, 'przewody hamulcowe', 7, 1858.00),
(24, 'filtr oleju', 18, 1426.00),
(25, 'świeca', 14, 944.00),
(26, 'sprzęgło', 14, 1018.00),
(27, 'czujnik parkowania', 12, 1761.00),
(28, 'cewka zapłonowa', 11, 792.00),
(29, 'półoś', 1, 1194.00),
(30, 'wycieraczki', 8, 581.00),
(31, 'chłodnica', 9, 605.00),
(32, 'felga', 14, 1332.00),
(33, 'wysprzęglik', 15, 1290.00),
(34, 'olej', 5, 1843.00),
(35, 'tarcza hamulcowa', 6, 1310.00),
(36, 'sprzęgło', 11, 1914.00),
(37, 'filtr oleju', 8, 1623.00),
(38, 'turbo', 17, 166.00),
(39, 'opona', 3, 688.00),
(40, 'lampa', 18, 328.00),
(41, 'tarcza hamulcowa', 1, 1170.00),
(42, 'opona', 1, 1199.00),
(43, 'amortyzator', 10, 461.00),
(44, 'lampa', 17, 222.00),
(45, 'filtr pyłkowy', 15, 644.00),
(46, 'filtr oleju', 7, 51.00),
(47, 'podnośnik szyby', 16, 209.00),
(48, 'felga', 14, 676.00),
(49, 'przewody hamulcowe', 8, 649.00),
(50, 'świeca', 16, 1793.00),
(51, 'wysprzęglik', 1, 1439.00),
(52, 'lampa', 12, 1097.00),
(53, 'czujnik parkowania', 5, 1102.00),
(54, 'szyba boczna', 12, 1600.00),
(55, 'tuleje wahacza', 2, 1105.00),
(56, 'przepustnica', 14, 1296.00),
(57, 'rozrusznik', 17, 1833.00),
(58, 'szyba boczna', 20, 533.00),
(59, 'felga', 4, 964.00),
(60, 'szyba tylnia', 3, 1511.00),
(61, 'drążki kierownicze', 1, 308.00),
(62, 'szyba tylnia', 6, 788.00),
(63, 'zestaw rozrządu', 5, 1329.00),
(64, 'wysprzęglik', 5, 1964.00),
(65, 'tarcza hamulcowa', 15, 1922.00),
(66, 'filtr oleju', 13, 891.00),
(67, 'szyba przednia', 19, 288.00),
(68, 'filtr pyłkowy', 18, 218.00),
(69, 'wahacz', 14, 1658.00),
(70, 'świeca', 12, 1477.00),
(71, 'rozrusznik', 17, 245.00),
(72, 'bęben hamulcowy', 19, 1533.00),
(73, 'półoś', 12, 82.00),
(74, 'cewka zapłonowa', 7, 627.00),
(75, 'czujnik parkowania', 10, 426.00),
(76, 'szyba boczna', 16, 1199.00),
(77, 'drążki kierownicze', 9, 337.00),
(78, 'świeca', 3, 103.00),
(79, 'rozrusznik', 20, 1798.00),
(80, 'podnośnik szyby', 10, 639.00),
(81, 'tłumik', 18, 1850.00),
(82, 'opona', 13, 1534.00),
(83, 'wycieraczki', 8, 130.00),
(84, 'wycieraczki', 3, 525.00),
(85, 'półoś', 8, 1388.00),
(86, 'czujnik parkowania', 14, 919.00),
(87, 'półoś', 6, 182.00),
(88, 'lusterko', 19, 1540.00),
(89, 'turbo', 19, 103.00),
(90, 'olej', 10, 575.00),
(91, 'opona', 13, 1054.00),
(92, 'filtr pyłkowy', 9, 1125.00),
(93, 'lampa', 17, 1496.00),
(94, 'klocki hamulcowe', 9, 491.00),
(95, 'pompa paliwa', 13, 354.00),
(96, 'przepustnica', 13, 1015.00),
(97, 'tuleje wahacza', 20, 320.00),
(98, 'cewka zapłonowa', 17, 544.00),
(99, 'amortyzator', 5, 457.00),
(100, 'lusterko', 19, 1780.00),
(101, 'przewody hamulcowe', 16, 1076.00),
(102, 'tarcza hamulcowa', 9, 1806.00),
(103, 'cewka zapłonowa', 14, 630.00),
(104, 'przepustnica', 11, 1798.00),
(105, 'półoś', 16, 501.00),
(106, 'pompa paliwa', 2, 129.00),
(107, 'cewka zapłonowa', 3, 1558.00),
(108, 'tłumik', 4, 92.00),
(109, 'lampa', 5, 643.00),
(110, 'tłumik', 10, 1467.00),
(111, 'lampa', 9, 1217.00),
(112, 'przepustnica', 5, 458.00),
(113, 'czujnik parkowania', 7, 1466.00),
(114, 'tuleje wahacza', 2, 1316.00),
(115, 'tłumik', 8, 1703.00),
(116, 'przewody hamulcowe', 14, 610.00),
(117, 'amortyzator', 5, 676.00),
(118, 'lusterko', 12, 930.00),
(119, 'wycieraczki', 11, 1245.00),
(120, 'klocki hamulcowe', 18, 959.00),
(121, 'wahacz', 20, 1384.00),
(122, 'chłodnica', 3, 390.00),
(123, 'szyba przednia', 15, 1718.00),
(124, 'chłodnica', 3, 355.00),
(125, 'zestaw rozrządu', 8, 1237.00),
(126, 'lusterko', 15, 1871.00),
(127, 'lampa', 20, 417.00),
(128, 'tarcza hamulcowa', 15, 1089.00),
(129, 'filtr pyłkowy', 10, 901.00),
(130, 'drążki kierownicze', 12, 901.00),
(131, 'bęben hamulcowy', 11, 1821.00),
(132, 'bęben hamulcowy', 4, 638.00),
(133, 'szyba przednia', 3, 1207.00),
(134, 'akumulator', 1, 1666.00),
(135, 'tuleje wahacza', 18, 962.00),
(136, 'bęben hamulcowy', 4, 1322.00),
(137, 'zestaw rozrządu', 4, 442.00),
(138, 'zestaw rozrządu', 8, 1735.00),
(139, 'świeca', 19, 1323.00),
(140, 'klocki hamulcowe', 20, 1999.00),
(141, 'kompresor', 1, 1859.00),
(142, 'przewody hamulcowe', 12, 674.00),
(143, 'wycieraczki', 13, 79.00),
(144, 'rozrusznik', 14, 966.00),
(145, 'przepustnica', 6, 464.00),
(146, 'tłumik', 16, 1831.00),
(147, 'bęben hamulcowy', 1, 858.00),
(148, 'rozrusznik', 1, 296.00),
(149, 'kompresor', 18, 1544.00),
(150, 'drążki kierownicze', 2, 1985.00),
(151, 'tuleje wahacza', 18, 1834.00),
(152, 'filtr pyłkowy', 14, 872.00),
(153, 'olej', 17, 1716.00),
(154, 'szyba przednia', 3, 463.00),
(155, 'olej', 13, 1121.00),
(156, 'tuleje wahacza', 10, 1841.00),
(157, 'turbo', 18, 587.00),
(158, 'kompresor', 14, 776.00),
(159, 'wahacz', 11, 415.00),
(160, 'przewody hamulcowe', 20, 1009.00),
(161, 'lampa', 17, 110.00),
(162, 'pompa paliwa', 1, 801.00),
(163, 'lampa', 14, 1721.00),
(164, 'akumulator', 17, 503.00),
(165, 'tłumik', 12, 180.00),
(166, 'szyba przednia', 1, 1187.00),
(167, 'miska olejowa', 9, 605.00),
(168, 'wycieraczki', 7, 421.00),
(169, 'wycieraczki', 14, 891.00),
(170, 'szyba boczna', 3, 1919.00),
(171, 'czujnik parkowania', 1, 567.00),
(172, 'piasta koła', 10, 1498.00),
(173, 'tarcza hamulcowa', 3, 1734.00),
(174, 'miska olejowa', 6, 1649.00),
(175, 'olej', 10, 513.00),
(176, 'tarcza hamulcowa', 11, 1563.00),
(177, 'zestaw rozrządu', 17, 1409.00),
(178, 'przepustnica', 16, 1549.00),
(179, 'szyba boczna', 3, 1917.00),
(180, 'tuleje wahacza', 16, 1297.00),
(181, 'wahacz', 18, 1577.00),
(182, 'tarcza hamulcowa', 3, 1993.00),
(183, 'wysprzęglik', 13, 1838.00),
(184, 'filtr oleju', 3, 710.00),
(185, 'akumulator', 15, 337.00),
(186, 'felga', 3, 1450.00),
(187, 'wycieraczki', 16, 716.00),
(188, 'pompa paliwa', 12, 499.00),
(189, 'szyba przednia', 3, 388.00),
(190, 'akumulator', 13, 1759.00),
(191, 'przewody hamulcowe', 12, 655.00),
(192, 'przepustnica', 11, 982.00),
(193, 'turbo', 16, 1875.00),
(194, 'półoś', 7, 1742.00),
(195, 'bęben hamulcowy', 5, 1300.00),
(196, 'rozrusznik', 16, 701.00),
(197, 'bęben hamulcowy', 14, 391.00),
(198, 'szyba przednia', 5, 231.00),
(199, 'zestaw rozrządu', 18, 957.00),
(200, 'miska olejowa', 19, 93.00),
(201, 'lampa', 3, 112.00),
(202, 'filtr pyłkowy', 10, 1742.00),
(203, 'szyba tylnia', 16, 981.00),
(204, 'turbo', 7, 1101.00),
(205, 'drążki kierownicze', 17, 399.00),
(206, 'drążki kierownicze', 18, 1379.00),
(207, 'amortyzator', 9, 918.00),
(208, 'cewka zapłonowa', 3, 295.00),
(209, 'bęben hamulcowy', 19, 1206.00),
(210, 'cewka zapłonowa', 7, 308.00),
(211, 'podnośnik szyby', 10, 499.00),
(212, 'sprzęgło', 11, 448.00),
(213, 'piasta koła', 16, 1502.00),
(214, 'sprzęgło', 13, 1666.00),
(215, 'bęben hamulcowy', 12, 374.00),
(216, 'miska olejowa', 5, 1135.00),
(217, 'lampa', 19, 1967.00),
(218, 'akumulator', 19, 631.00),
(219, 'półoś', 10, 868.00),
(220, 'bęben hamulcowy', 1, 1321.00),
(221, 'miska olejowa', 11, 934.00),
(222, 'szyba przednia', 1, 660.00),
(223, 'półoś', 5, 906.00),
(224, 'tłumik', 3, 726.00),
(225, 'felga', 4, 1244.00),
(226, 'rozrusznik', 7, 338.00),
(227, 'turbo', 11, 1390.00),
(228, 'podnośnik szyby', 19, 1338.00),
(229, 'amortyzator', 5, 1749.00),
(230, 'lusterko', 18, 1362.00),
(231, 'szyba boczna', 18, 317.00),
(232, 'rozrusznik', 16, 1450.00),
(233, 'filtr oleju', 20, 1279.00),
(234, 'tarcza hamulcowa', 10, 639.00),
(235, 'cewka zapłonowa', 11, 520.00),
(236, 'olej', 5, 758.00),
(237, 'kompresor', 16, 1526.00),
(238, 'filtr oleju', 18, 813.00),
(239, 'zestaw rozrządu', 17, 1018.00),
(240, 'zestaw rozrządu', 12, 1129.00),
(241, 'tłumik', 19, 1558.00),
(242, 'pompa paliwa', 6, 396.00),
(243, 'filtr pyłkowy', 17, 788.00),
(244, 'szyba tylnia', 17, 157.00),
(245, 'drążki kierownicze', 3, 637.00),
(246, 'szyba boczna', 7, 1359.00),
(247, 'sprzęgło', 9, 619.00),
(248, 'turbo', 20, 1587.00),
(249, 'rozrusznik', 3, 1056.00),
(250, 'akumulator', 4, 1827.00),
(251, 'amortyzator', 18, 143.00),
(252, 'przewody hamulcowe', 8, 1026.00),
(253, 'szyba przednia', 18, 683.00),
(254, 'sprzęgło', 9, 1306.00),
(255, 'tuleje wahacza', 19, 1258.00),
(256, 'piasta koła', 3, 1115.00),
(257, 'przepustnica', 5, 1899.00),
(258, 'bęben hamulcowy', 20, 270.00),
(259, 'wysprzęglik', 10, 284.00),
(260, 'opona', 10, 925.00),
(261, 'sprzęgło', 2, 1015.00),
(262, 'pompa paliwa', 4, 1951.00),
(263, 'tuleje wahacza', 2, 966.00),
(264, 'cewka zapłonowa', 19, 314.00),
(265, 'bęben hamulcowy', 16, 815.00),
(266, 'wysprzęglik', 15, 753.00),
(267, 'świeca', 14, 636.00),
(268, 'rozrusznik', 14, 1254.00),
(269, 'podnośnik szyby', 16, 1668.00),
(270, 'turbo', 18, 1953.00),
(271, 'zestaw rozrządu', 5, 669.00),
(272, 'cewka zapłonowa', 1, 1501.00),
(273, 'bęben hamulcowy', 6, 527.00),
(274, 'tuleje wahacza', 18, 1243.00),
(275, 'bęben hamulcowy', 9, 1164.00),
(276, 'bęben hamulcowy', 18, 542.00),
(277, 'olej', 4, 314.00),
(278, 'felga', 15, 679.00),
(279, 'przepustnica', 2, 1424.00),
(280, 'wysprzęglik', 8, 1725.00),
(281, 'podnośnik szyby', 18, 458.00),
(282, 'olej', 8, 793.00),
(283, 'zestaw rozrządu', 11, 63.00),
(284, 'podnośnik szyby', 3, 848.00),
(285, 'cewka zapłonowa', 13, 1933.00),
(286, 'opona', 6, 61.00),
(287, 'półoś', 20, 1316.00),
(288, 'felga', 17, 651.00),
(289, 'bęben hamulcowy', 15, 694.00),
(290, 'akumulator', 10, 1084.00),
(291, 'półoś', 7, 387.00),
(292, 'filtr pyłkowy', 15, 131.00),
(293, 'szyba tylnia', 4, 250.00),
(294, 'półoś', 6, 1199.00),
(295, 'tłumik', 9, 1861.00),
(296, 'sprzęgło', 3, 1619.00),
(297, 'opona', 9, 1944.00),
(298, 'akumulator', 20, 1592.00),
(299, 'przewody hamulcowe', 5, 156.00),
(300, 'piasta koła', 11, 1106.00),
(301, 'piasta koła', 9, 679.00),
(302, 'sprzęgło', 17, 1687.00),
(303, 'miska olejowa', 6, 1438.00),
(304, 'klocki hamulcowe', 8, 1777.00),
(305, 'turbo', 20, 585.00),
(306, 'szyba przednia', 19, 92.00),
(307, 'bęben hamulcowy', 12, 1779.00),
(308, 'piasta koła', 9, 1144.00),
(309, 'szyba przednia', 7, 420.00),
(310, 'lampa', 7, 926.00),
(311, 'cewka zapłonowa', 12, 1326.00),
(312, 'olej', 2, 1267.00),
(313, 'cewka zapłonowa', 4, 1539.00),
(314, 'zestaw rozrządu', 11, 969.00),
(315, 'kompresor', 16, 561.00),
(316, 'opona', 20, 733.00),
(317, 'wahacz', 3, 174.00),
(318, 'cewka zapłonowa', 14, 1536.00),
(319, 'cewka zapłonowa', 6, 70.00),
(320, 'miska olejowa', 20, 250.00),
(321, 'cewka zapłonowa', 10, 293.00),
(322, 'świeca', 9, 256.00),
(323, 'rozrusznik', 2, 1552.00),
(324, 'lusterko', 3, 1848.00),
(325, 'lusterko', 12, 1800.00),
(326, 'szyba przednia', 9, 1543.00),
(327, 'drążki kierownicze', 1, 1767.00),
(328, 'przewody hamulcowe', 7, 111.00),
(329, 'filtr oleju', 14, 835.00),
(330, 'drążki kierownicze', 14, 556.00),
(331, 'olej', 15, 1579.00),
(332, 'opona', 1, 541.00),
(333, 'szyba tylnia', 18, 1685.00),
(334, 'bęben hamulcowy', 14, 1253.00),
(335, 'amortyzator', 17, 1344.00),
(336, 'rozrusznik', 5, 1233.00),
(337, 'drążki kierownicze', 4, 1049.00),
(338, 'piasta koła', 14, 1598.00),
(339, 'świeca', 4, 1480.00),
(340, 'czujnik parkowania', 6, 1880.00),
(341, 'amortyzator', 2, 1141.00),
(342, 'półoś', 4, 1181.00),
(343, 'szyba boczna', 19, 1129.00),
(344, 'lusterko', 8, 83.00),
(345, 'wysprzęglik', 15, 1602.00),
(346, 'felga', 13, 1976.00),
(347, 'szyba boczna', 13, 997.00),
(348, 'szyba przednia', 14, 805.00),
(349, 'szyba boczna', 16, 547.00),
(350, 'zestaw rozrządu', 2, 908.00),
(351, 'przewody hamulcowe', 18, 1246.00),
(352, 'tarcza hamulcowa', 7, 280.00),
(353, 'filtr pyłkowy', 7, 932.00),
(354, 'wahacz', 13, 854.00),
(355, 'opona', 5, 184.00),
(356, 'czujnik parkowania', 18, 511.00),
(357, 'wahacz', 16, 121.00),
(358, 'piasta koła', 12, 633.00),
(359, 'bęben hamulcowy', 13, 908.00),
(360, 'wycieraczki', 3, 1989.00),
(361, 'felga', 17, 791.00),
(362, 'cewka zapłonowa', 7, 958.00),
(363, 'felga', 19, 1661.00),
(364, 'zestaw rozrządu', 8, 1421.00),
(365, 'turbo', 14, 605.00),
(366, 'czujnik parkowania', 8, 1024.00),
(367, 'olej', 11, 1473.00),
(368, 'wahacz', 12, 1909.00),
(369, 'wysprzęglik', 3, 602.00),
(370, 'półoś', 2, 258.00),
(371, 'rozrusznik', 3, 1620.00),
(372, 'filtr oleju', 20, 1081.00),
(373, 'podnośnik szyby', 10, 603.00),
(374, 'lusterko', 3, 1996.00),
(375, 'szyba boczna', 15, 272.00),
(376, 'cewka zapłonowa', 5, 76.00),
(377, 'tłumik', 16, 105.00),
(378, 'piasta koła', 1, 1528.00),
(379, 'felga', 10, 1878.00),
(380, 'lusterko', 14, 194.00),
(381, 'wahacz', 5, 1696.00),
(382, 'olej', 12, 1881.00),
(383, 'filtr pyłkowy', 5, 371.00),
(384, 'szyba przednia', 17, 756.00),
(385, 'szyba boczna', 5, 1031.00),
(386, 'zestaw rozrządu', 14, 410.00),
(387, 'tarcza hamulcowa', 10, 1600.00),
(388, 'zestaw rozrządu', 6, 865.00),
(389, 'pompa paliwa', 7, 1669.00),
(390, 'akumulator', 17, 1419.00),
(391, 'akumulator', 8, 1677.00),
(392, 'drążki kierownicze', 1, 291.00),
(393, 'klocki hamulcowe', 9, 739.00),
(394, 'filtr pyłkowy', 4, 575.00),
(395, 'przewody hamulcowe', 7, 1594.00),
(396, 'wycieraczki', 12, 1619.00),
(397, 'klocki hamulcowe', 8, 472.00),
(398, 'turbo', 9, 1147.00),
(399, 'lusterko', 11, 1509.00),
(400, 'turbo', 12, 328.00),
(401, 'piasta koła', 4, 1704.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `formularz_naprawy`
--

CREATE TABLE `formularz_naprawy` (
  `id` int(7) NOT NULL,
  `opis` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `koszt_naprawy` double(7,2) DEFAULT NULL,
  `uzytkownik_login_fk` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `warsztat_id_fk` int(7) NOT NULL,
  `vin_fk` varchar(17) COLLATE utf8_unicode_ci NOT NULL,
  `dataoddania` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataodebrania` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `przewid_czas_trwania` int(2) DEFAULT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mechanik_warsztat`
--

CREATE TABLE `mechanik_warsztat` (
  `mechanik_login_fk` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id_warsztatu_fk` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `mechanik_warsztat`
--

INSERT INTO `mechanik_warsztat` (`mechanik_login_fk`, `id_warsztatu_fk`) VALUES
('amil', 1),
('grzesiu', 2),
('krzysiu', 1);

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
(392242, 'Caddy', 2006, 'Van', '1.9'),
(392243, 'Golf', 2010, 'Kombi', '1.9'),
(392244, 'Scirocco', 2017, 'Van', '2.5'),
(392245, 'Up', 2017, 'Hatchback', '2.5'),
(392246, 'Polo', 2015, 'Van', '3.0'),
(392247, 'Fox', 2014, 'Hatchback', '2.0'),
(392248, 'Up', 2013, 'Kombi', '1.9'),
(392249, 'Golf', 2010, 'Hatchback', '1.4'),
(392250, 'Caddy', 2014, 'Van', '4.0'),
(392251, 'Jetta', 2007, 'Van', '4.0'),
(392252, 'Caddy', 2000, 'Kombi', '1.4'),
(392253, 'Golf', 2001, 'Kombi', '4.0'),
(392254, 'Lupo', 2004, 'Sedan', '4.0'),
(392255, 'Bora', 2006, 'Kombi', '2.5'),
(392256, 'Passat', 2016, 'Van', '4.0'),
(392257, 'Fox', 2011, 'Hatchback', '4.0'),
(392258, 'Up', 2016, 'Kombi', '4.0'),
(392259, 'Polo', 2012, 'Hatchback', '2.5'),
(392260, 'Touareg', 2001, 'Van', '3.0'),
(392261, 'Up', 2000, 'Van', '1.2'),
(392262, 'Passat', 2005, 'Kombi', '1.4'),
(392263, 'Caddy', 2013, 'Hatchback', '4.0'),
(392264, 'Polo', 2001, 'Hatchback', '1.4'),
(392265, 'Golf', 2012, 'Hatchback', '2.0'),
(392266, 'Beetle', 2005, 'Hatchback', '2.0'),
(392267, 'Golf', 2015, 'Sedan', '1.2'),
(392268, 'Jetta', 2017, 'Van', '1.9'),
(392269, 'Caddy', 2009, 'Van', '4.0'),
(392270, 'Fox', 2008, 'Kombi', '2.0'),
(392271, 'Jetta', 2005, 'Hatchback', '4.0'),
(392272, 'Up', 2009, 'Van', '1.4'),
(392273, 'Caddy', 2008, 'Kombi', '2.0'),
(392274, 'Scirocco', 2010, 'Sedan', '2.5'),
(392275, 'Bora', 2003, 'Kombi', '1.9'),
(392276, 'Lupo', 2001, 'Hatchback', '1.9'),
(392277, 'Bora', 2017, 'Sedan', '1.4'),
(392278, 'Touareg', 2017, 'Van', '1.2'),
(392279, 'Beetle', 2010, 'Hatchback', '4.0'),
(392280, 'Caddy', 2001, 'Van', '1.2'),
(392281, 'Jetta', 2013, 'Hatchback', '1.4'),
(392282, 'Lupo', 2006, 'Sedan', '1.0'),
(392283, 'Bora', 2002, 'Kombi', '1.4'),
(392284, 'Golf', 2006, 'Sedan', '1.4'),
(392285, 'Bora', 2008, 'Van', '2.5'),
(392286, 'Polo', 2010, 'Hatchback', '4.0'),
(392287, 'Lupo', 2003, 'Van', '1.0'),
(392288, 'Bora', 2012, 'Sedan', '1.0'),
(392289, 'Beetle', 2015, 'Kombi', '2.0'),
(392290, 'Golf', 2016, 'Van', '1.0'),
(392291, 'Passat', 2003, 'Hatchback', '4.0'),
(392292, 'Jetta', 2012, 'Van', '1.9'),
(392293, 'Caddy', 2004, 'Van', '1.2'),
(392294, 'Beetle', 2014, 'Sedan', '4.0'),
(392295, 'Golf', 2017, 'Sedan', '2.0'),
(392296, 'Golf', 2013, 'Van', '1.0'),
(392297, 'Fox', 2013, 'Van', '2.0'),
(392298, 'Jetta', 2016, 'Sedan', '1.4'),
(392299, 'Jetta', 2011, 'Sedan', '2.5'),
(392300, 'Lupo', 2006, 'Hatchback', '2.5'),
(392301, 'Lupo', 2001, 'Hatchback', '1.4'),
(392302, 'Scirocco', 2000, 'Kombi', '4.0'),
(392303, 'Up', 2012, 'Kombi', '2.0'),
(392304, 'Jetta', 2013, 'Hatchback', '1.9'),
(392305, 'Up', 2013, 'Hatchback', '1.9'),
(392306, 'Caddy', 2013, 'Sedan', '1.9'),
(392307, 'Caddy', 2002, 'Kombi', '1.2'),
(392308, 'Lupo', 2015, 'Hatchback', '2.0'),
(392309, 'Caddy', 2010, 'Sedan', '2.0'),
(392310, 'Beetle', 2015, 'Kombi', '1.4'),
(392311, 'Lupo', 2003, 'Kombi', '2.5'),
(392312, 'Caddy', 2006, 'Hatchback', '2.0'),
(392313, 'Bora', 2008, 'Van', '2.0'),
(392314, 'Fox', 2006, 'Kombi', '4.0'),
(392315, 'Caddy', 2013, 'Sedan', '3.0'),
(392316, 'Lupo', 2012, 'Sedan', '4.0'),
(392317, 'Golf', 2015, 'Kombi', '1.9'),
(392318, 'Beetle', 2003, 'Kombi', '1.4'),
(392319, 'Touareg', 2008, 'Hatchback', '1.9'),
(392320, 'Up', 2014, 'Kombi', '1.0'),
(392321, 'Jetta', 2004, 'Hatchback', '3.0'),
(392322, 'Jetta', 2014, 'Van', '1.4'),
(392323, 'Golf', 2017, 'Van', '1.0'),
(392324, 'Bora', 2013, 'Sedan', '4.0'),
(392325, 'Polo', 2004, 'Sedan', '1.0'),
(392326, 'Up', 2016, 'Kombi', '3.0'),
(392327, 'Polo', 2014, 'Sedan', '1.0'),
(392328, 'Touareg', 2008, 'Sedan', '3.0'),
(392329, 'Up', 2009, 'Hatchback', '1.2'),
(392330, 'Lupo', 2009, 'Van', '1.0'),
(392331, 'Jetta', 2008, 'Hatchback', '1.2'),
(392332, 'Passat', 2014, 'Sedan', '2.0'),
(392333, 'Up', 2001, 'Hatchback', '1.4'),
(392334, 'Lupo', 2014, 'Kombi', '1.4'),
(392335, 'Up', 2006, 'Sedan', '1.0'),
(392336, 'Caddy', 2002, 'Hatchback', '1.0'),
(392337, 'Golf', 2009, 'Kombi', '3.0'),
(392338, 'Caddy', 2012, 'Kombi', '2.0'),
(392339, 'Scirocco', 2003, 'Sedan', '2.5'),
(392340, 'Polo', 2017, 'Sedan', '1.0'),
(392341, 'Golf', 2011, 'Hatchback', '2.0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochod_czesc`
--

CREATE TABLE `samochod_czesc` (
  `czesc_id_fk` int(7) NOT NULL,
  `samochod_id_fk` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `samochod_czesc`
--

INSERT INTO `samochod_czesc` (`czesc_id_fk`, `samochod_id_fk`) VALUES
(1, 392273),
(2, 392242),
(3, 392258),
(4, 392307),
(5, 392295),
(6, 392314),
(7, 392285),
(8, 392321),
(9, 392269),
(10, 392287),
(11, 392244),
(12, 392268),
(13, 392243),
(14, 392269),
(15, 392245),
(16, 392328),
(17, 392325),
(18, 392329),
(19, 392313),
(20, 392333),
(21, 392321),
(22, 392264),
(23, 392273),
(24, 392326),
(25, 392313),
(26, 392314),
(27, 392282),
(28, 392334),
(29, 392247),
(30, 392323),
(31, 392328),
(32, 392278),
(33, 392324),
(34, 392245),
(35, 392244),
(36, 392278),
(37, 392318),
(38, 392288),
(39, 392257),
(40, 392245),
(41, 392333),
(42, 392260),
(43, 392271),
(44, 392335),
(45, 392287),
(46, 392274),
(47, 392321),
(48, 392270),
(49, 392262),
(50, 392293),
(51, 392261),
(52, 392242),
(53, 392315),
(54, 392293),
(55, 392326),
(56, 392287),
(57, 392265),
(58, 392267),
(59, 392280),
(60, 392271),
(61, 392248),
(62, 392267),
(63, 392307),
(64, 392330),
(65, 392271),
(66, 392310),
(67, 392266),
(68, 392247),
(69, 392256),
(70, 392282),
(71, 392250),
(72, 392247),
(73, 392300),
(74, 392280),
(75, 392340),
(76, 392246),
(77, 392313),
(78, 392320),
(79, 392275),
(80, 392333),
(81, 392272),
(82, 392294),
(83, 392334),
(84, 392246),
(85, 392246),
(86, 392318),
(87, 392292),
(88, 392269),
(89, 392244),
(90, 392330),
(91, 392299),
(92, 392250),
(93, 392256),
(94, 392265),
(95, 392339),
(96, 392285),
(97, 392333),
(98, 392264),
(99, 392290),
(100, 392247),
(101, 392305),
(102, 392299),
(103, 392253),
(104, 392264),
(105, 392337),
(106, 392252),
(107, 392268),
(108, 392309),
(109, 392330),
(110, 392301),
(111, 392300),
(112, 392261),
(113, 392254),
(114, 392293),
(115, 392265),
(116, 392258),
(117, 392270),
(118, 392315),
(119, 392286),
(120, 392272),
(121, 392304),
(122, 392243),
(123, 392281),
(124, 392318),
(125, 392266),
(126, 392278),
(127, 392262),
(128, 392257),
(129, 392301),
(130, 392311),
(131, 392262),
(132, 392264),
(133, 392268),
(134, 392274),
(135, 392287),
(136, 392264),
(137, 392284),
(138, 392313),
(139, 392331),
(140, 392272),
(141, 392273),
(142, 392290),
(143, 392292),
(144, 392285),
(145, 392341),
(146, 392315),
(147, 392301),
(148, 392269),
(149, 392288),
(150, 392245),
(151, 392300),
(152, 392251),
(153, 392246),
(154, 392339),
(155, 392328),
(156, 392270),
(157, 392276),
(158, 392248),
(159, 392286),
(160, 392335),
(161, 392318),
(162, 392307),
(163, 392258),
(164, 392245),
(165, 392339),
(166, 392303),
(167, 392267),
(168, 392281),
(169, 392275),
(170, 392257),
(171, 392312),
(172, 392306),
(173, 392306),
(174, 392262),
(175, 392249),
(176, 392306),
(177, 392335),
(178, 392309),
(179, 392334),
(180, 392282),
(181, 392313),
(182, 392292),
(183, 392292),
(184, 392318),
(185, 392289),
(186, 392278),
(187, 392247),
(188, 392323),
(189, 392285),
(190, 392291),
(191, 392317),
(192, 392261),
(193, 392256),
(194, 392334),
(195, 392264),
(196, 392254),
(197, 392296),
(198, 392290),
(199, 392293),
(200, 392329),
(201, 392305),
(202, 392264),
(203, 392294),
(204, 392270),
(205, 392284),
(206, 392302),
(207, 392334),
(208, 392278),
(209, 392269),
(210, 392326),
(211, 392319),
(212, 392341),
(213, 392276),
(214, 392269),
(215, 392317),
(216, 392324),
(217, 392306),
(218, 392322),
(219, 392306),
(220, 392249),
(221, 392271),
(222, 392281),
(223, 392268),
(224, 392286),
(225, 392273),
(226, 392290),
(227, 392298),
(228, 392328),
(229, 392338),
(230, 392250),
(231, 392315),
(232, 392302),
(233, 392272),
(234, 392267),
(235, 392330),
(236, 392314),
(237, 392327),
(238, 392323),
(239, 392251),
(240, 392255),
(241, 392307),
(242, 392329),
(243, 392254),
(244, 392242),
(245, 392256),
(246, 392329),
(247, 392324),
(248, 392320),
(249, 392310),
(250, 392289),
(251, 392327),
(252, 392340),
(253, 392328),
(254, 392254),
(255, 392284),
(256, 392260),
(257, 392302),
(258, 392341),
(259, 392246),
(260, 392299),
(261, 392249),
(262, 392320),
(263, 392259),
(264, 392279),
(265, 392245),
(266, 392248),
(267, 392252),
(268, 392331),
(269, 392329),
(270, 392262),
(271, 392245),
(272, 392295),
(273, 392249),
(274, 392257),
(275, 392295),
(276, 392264),
(277, 392245),
(278, 392278),
(279, 392243),
(280, 392313),
(281, 392325),
(282, 392329),
(283, 392311),
(284, 392312),
(285, 392341),
(286, 392254),
(287, 392331),
(288, 392302),
(289, 392253),
(290, 392335),
(291, 392259),
(292, 392261),
(293, 392314),
(294, 392277),
(295, 392299),
(296, 392318),
(297, 392283),
(298, 392310),
(299, 392307),
(300, 392270),
(301, 392330),
(302, 392310),
(303, 392324),
(304, 392338),
(305, 392326),
(306, 392277),
(307, 392260),
(308, 392329),
(309, 392314),
(310, 392261),
(311, 392300),
(312, 392298),
(313, 392248),
(314, 392269),
(315, 392268),
(316, 392248),
(317, 392282),
(318, 392257),
(319, 392308),
(320, 392293),
(321, 392251),
(322, 392325),
(323, 392312),
(324, 392323),
(325, 392261),
(326, 392270),
(327, 392299),
(328, 392302),
(329, 392338),
(330, 392265),
(331, 392331),
(332, 392327),
(333, 392333),
(334, 392313),
(335, 392323),
(336, 392318),
(337, 392249),
(338, 392242),
(339, 392305),
(340, 392321),
(341, 392262),
(342, 392263),
(343, 392277),
(344, 392268),
(345, 392291),
(346, 392304),
(347, 392275),
(348, 392331),
(349, 392320),
(350, 392341),
(351, 392283),
(352, 392329),
(353, 392325),
(354, 392254),
(355, 392311),
(356, 392244),
(357, 392282),
(358, 392268),
(359, 392304),
(360, 392279),
(361, 392291),
(362, 392294),
(363, 392264),
(364, 392283),
(365, 392265),
(366, 392246),
(367, 392259),
(368, 392273),
(369, 392246),
(370, 392323),
(371, 392253),
(372, 392266),
(373, 392245),
(374, 392289),
(375, 392293),
(376, 392294),
(377, 392251),
(378, 392326),
(379, 392284),
(380, 392329),
(381, 392325),
(382, 392326),
(383, 392317),
(384, 392309),
(385, 392339),
(386, 392286),
(387, 392311),
(388, 392280),
(389, 392313),
(390, 392274),
(391, 392317),
(392, 392263),
(393, 392326),
(394, 392340),
(395, 392305),
(396, 392250),
(397, 392244),
(398, 392322),
(399, 392281),
(400, 392248),
(401, 392304);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `terminarz`
--

CREATE TABLE `terminarz` (
  `id` int(7) NOT NULL,
  `id_warsztatu_fk` int(7) NOT NULL,
  `data` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `opis` int(250) NOT NULL,
  `przewid_czas_trwania` int(2) NOT NULL
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
('aga234', 'Oskaoska1', 'Agnieszka', 'Kozłowska', 'teczowymis@wp.pl', 456563256, 'Uzytkownik'),
('amil', 'Amilamil1', 'Kamil', 'Płaczek', 'amil@op.pl', 651234589, 'Mechanik'),
('buleczka', 'Oskaoska1', 'Szymon', 'Bułka', 'bulkibulki@wp.pl', 459965965, 'Uzytkownik'),
('ciastko', 'Oskaoska1', 'Faustyna', 'Przezwisko', 'faustyna.przezwisko@gmail.com', 412452412, 'Uzytkownik'),
('cium', 'Oskaoska1', 'Dorota', 'Szpiłyk', 'dorotaciumcium@op.pl', 452123659, 'Uzytkownik'),
('dzik', 'Oskaoska1', 'Ernest', 'Bździk', 'wolololo@op.pl', 745745761, 'Uzytkownik'),
('eminem', 'Oskaoska1', 'Sławomir', 'Dudacz', 'imtherealslimshady@o2.pl', 652223656, 'Uzytkownik'),
('filemon', 'Oskaoska1', 'Filip', 'Dzięcioł', 'podrozniksnow@op.pl', 745523658, 'Ksiegowy'),
('goryl', 'Oskaoska1', 'Jan', 'Kowalski', 'goryl.to.wielka@interia.pl', 555777888, 'Uzytkownik'),
('grzesiu', 'Oskaoska1', 'Grzegorz', 'Komajda', 'grzech@o2.pl', 452123326, 'Mechanik'),
('janosik', 'Oskaoska1', 'Jan', 'Teatr', 'filmjanosik@o2.pl', 452632512, 'Uzytkownik'),
('joecocemba', 'Oskaoska1', 'Joe', 'Cocemba', 'jc_46@wp.pl', 506795367, 'Uzytkownik'),
('justus', 'Oskaoska1', 'Justyna', 'Strojek', 'jstroj@op.pl', 412412412, 'Uzytkownik'),
('kasia', 'Oskaoska1', 'Katarzyna', 'Klimek', 'kasiaftw@gmail.com', 789562364, 'Administrator'),
('krzysiu', 'Oskaoska1', 'Krzysztof', 'Domagała', 'kdd@gmail.com', 123569965, 'Mechanik'),
('marloeve', 'Oskaoska1', 'Jakub', 'Bożek', 'maryn@gmail.com', 565523526, 'Uzytkownik'),
('miszcz', 'Oskaoska1', 'Przemysław', 'Gałka', 'miszczuplis@op.pl', 564236879, 'Uzytkownik'),
('niechcesz', 'Oskaoska1', 'Jan', 'Stańko', 'jedenzerojeden@o2.pl', 456456654, 'Uzytkownik'),
('oska', 'Oskaoska1', 'Piotr', 'Osiewicz', 'piotr.osie@op.pl', 985645236, 'Ksiegowy'),
('stass', 'Oskaoska1', 'Marcin', 'Stahoń', 'stssts@op.pl', 745745745, 'Uzytkownik'),
('uechy', 'Oskaoska1', 'Eustachy', 'Warzywo', 'euchy@op.pl', 745745767, 'Uzytkownik'),
('ukasz', 'Oskaoska1', 'Łukasz', 'Majcher', 'ukasz.maj@wp.pl', 654452236, 'Ksiegowy'),
('zgadnijfilm', 'Oskaoska1', 'Grzegorz', 'Brzęczyszczykiewicz', 'lalal@gmail.com', 965965854, 'Uzytkownik');

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

--
-- Zrzut danych tabeli `uzytkownik_samochod`
--

INSERT INTO `uzytkownik_samochod` (`Uzytkownik_login_fk`, `Samochod_if_fk`, `vin`, `warsztat_id_fk`) VALUES
('aga234', 392248, '123456789abcdefa', NULL),
('aga234', 392242, '123456789abcdefg', NULL);

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

--
-- Zrzut danych tabeli `warsztat`
--

INSERT INTO `warsztat` (`id`, `adres`, `miasto`, `numer_telefonu`, `email`, `ilosc_stanowisk`, `godzina_otwarcia`, `godzina_zamkniecia`) VALUES
(1, 'Pszona 16', 'Kraków', 555666777, 'pszona@koska.pl', 10, '10:00', '17:00'),
(2, 'Kurczaba 38', 'Kraków', 777888999, 'kurczaba@koska.pl', 8, '11:00', '20:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `warsztat_czesc`
--

CREATE TABLE `warsztat_czesc` (
  `warsztat_id_fk` int(7) NOT NULL,
  `czesc_id_fk` int(7) NOT NULL,
  `ilosc` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `warsztat_czesc`
--

INSERT INTO `warsztat_czesc` (`warsztat_id_fk`, `czesc_id_fk`, `ilosc`) VALUES
(1, 3, 14),
(1, 4, 16),
(1, 5, 4),
(1, 7, 4),
(1, 8, 11),
(1, 10, 20),
(1, 11, 10),
(1, 13, 15),
(1, 15, 4),
(1, 16, 3),
(1, 18, 18),
(1, 21, 11),
(1, 22, 9),
(1, 25, 5),
(1, 29, 14),
(1, 30, 8),
(1, 32, 10),
(1, 33, 11),
(1, 34, 17),
(1, 38, 5),
(1, 39, 8),
(1, 44, 13),
(1, 45, 5),
(1, 49, 19),
(1, 53, 6),
(1, 56, 6),
(1, 61, 20),
(1, 62, 12),
(1, 63, 16),
(1, 64, 10),
(1, 66, 14),
(1, 67, 1),
(1, 68, 12),
(1, 69, 17),
(1, 70, 20),
(1, 71, 10),
(1, 72, 1),
(1, 74, 7),
(1, 76, 17),
(1, 77, 12),
(1, 78, 18),
(1, 79, 15),
(1, 80, 3),
(1, 84, 19),
(1, 87, 5),
(1, 88, 15),
(1, 89, 11),
(1, 90, 19),
(1, 93, 3),
(1, 94, 10),
(1, 97, 9),
(1, 98, 18),
(1, 99, 14),
(2, 1, 11),
(2, 2, 19),
(2, 6, 7),
(2, 9, 15),
(2, 12, 5),
(2, 14, 4),
(2, 17, 19),
(2, 19, 4),
(2, 20, 20),
(2, 23, 7),
(2, 24, 12),
(2, 26, 11),
(2, 27, 7),
(2, 28, 18),
(2, 31, 6),
(2, 35, 20),
(2, 36, 2),
(2, 37, 1),
(2, 40, 9),
(2, 41, 6),
(2, 42, 7),
(2, 43, 14),
(2, 46, 3),
(2, 47, 10),
(2, 48, 15),
(2, 50, 15),
(2, 51, 7),
(2, 52, 10),
(2, 54, 15),
(2, 55, 10),
(2, 57, 3),
(2, 58, 8),
(2, 59, 17),
(2, 60, 2),
(2, 65, 18),
(2, 73, 19),
(2, 75, 9),
(2, 81, 13),
(2, 82, 17),
(2, 83, 20),
(2, 85, 14),
(2, 86, 2),
(2, 91, 10),
(2, 92, 7),
(2, 95, 13),
(2, 96, 10),
(2, 100, 4);

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie_czesc`
--

CREATE TABLE `zamowienie_czesc` (
  `zamowienie_id_fk` int(7) NOT NULL,
  `czesc_id_fk` int(7) NOT NULL,
  `ilosc` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `cennik_podstawowy`
--
ALTER TABLE `cennik_podstawowy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `czesc`
--
ALTER TABLE `czesc`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `terminarz`
--
ALTER TABLE `terminarz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_warsztatu_fk_idx` (`id_warsztatu_fk`);

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
-- Indexes for table `warsztat_czesc`
--
ALTER TABLE `warsztat_czesc`
  ADD PRIMARY KEY (`warsztat_id_fk`,`czesc_id_fk`),
  ADD KEY `czesc_id_fk` (`czesc_id_fk`);

--
-- Indexes for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rodzaj_czesci_u_idx` (`rodzaj_czesci`),
  ADD KEY `warsztat_id_fk` (`warsztat_id_fk`);

--
-- Indexes for table `zamowienie_czesc`
--
ALTER TABLE `zamowienie_czesc`
  ADD PRIMARY KEY (`zamowienie_id_fk`,`czesc_id_fk`),
  ADD KEY `czesc_id_fk` (`czesc_id_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `cennik_podstawowy`
--
ALTER TABLE `cennik_podstawowy`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT dla tabeli `czesc`
--
ALTER TABLE `czesc`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;
--
-- AUTO_INCREMENT dla tabeli `formularz_naprawy`
--
ALTER TABLE `formularz_naprawy`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `przeglad`
--
ALTER TABLE `przeglad`
  MODIFY `id_przegladu` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT dla tabeli `samochod`
--
ALTER TABLE `samochod`
  MODIFY `samochod_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392342;
--
-- AUTO_INCREMENT dla tabeli `terminarz`
--
ALTER TABLE `terminarz`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `warsztat`
--
ALTER TABLE `warsztat`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- Ograniczenia dla zrzutów tabel
--

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
  ADD CONSTRAINT `przeglad_ibfk_2` FOREIGN KEY (`id_warsztatu_fk`) REFERENCES `warsztat` (`id`),
  ADD CONSTRAINT `przeglad_ibfk_3` FOREIGN KEY (`vin_fk`) REFERENCES `uzytkownik_samochod` (`vin`);

--
-- Ograniczenia dla tabeli `samochod_czesc`
--
ALTER TABLE `samochod_czesc`
  ADD CONSTRAINT `samochod_czesc_ibfk_1` FOREIGN KEY (`czesc_id_fk`) REFERENCES `czesc` (`id`),
  ADD CONSTRAINT `samochod_czesc_ibfk_2` FOREIGN KEY (`samochod_id_fk`) REFERENCES `samochod` (`samochod_id`);

--
-- Ograniczenia dla tabeli `terminarz`
--
ALTER TABLE `terminarz`
  ADD CONSTRAINT `terminarz_ibfk_1` FOREIGN KEY (`id_warsztatu_fk`) REFERENCES `warsztat` (`id`);

--
-- Ograniczenia dla tabeli `uzytkownik_samochod`
--
ALTER TABLE `uzytkownik_samochod`
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_1` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`),
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_3` FOREIGN KEY (`Uzytkownik_login_fk`) REFERENCES `uzytkownik` (`login`),
  ADD CONSTRAINT `uzytkownik_samochod_ibfk_4` FOREIGN KEY (`Samochod_if_fk`) REFERENCES `samochod` (`samochod_id`);

--
-- Ograniczenia dla tabeli `warsztat_czesc`
--
ALTER TABLE `warsztat_czesc`
  ADD CONSTRAINT `warsztat_czesc_ibfk_1` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`),
  ADD CONSTRAINT `warsztat_czesc_ibfk_2` FOREIGN KEY (`czesc_id_fk`) REFERENCES `czesc` (`id`);

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`warsztat_id_fk`) REFERENCES `warsztat` (`id`);

--
-- Ograniczenia dla tabeli `zamowienie_czesc`
--
ALTER TABLE `zamowienie_czesc`
  ADD CONSTRAINT `zamowienie_czesc_ibfk_1` FOREIGN KEY (`czesc_id_fk`) REFERENCES `czesc` (`id`),
  ADD CONSTRAINT `zamowienie_czesc_ibfk_2` FOREIGN KEY (`zamowienie_id_fk`) REFERENCES `zamowienie` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
