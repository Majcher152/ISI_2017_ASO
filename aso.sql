-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Cze 2017, 15:56
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
(1, ' półoś ', 10, 203.00),
(2, ' felga', 10, 166.00),
(3, ' bęben hamulcowy ', 2, 565.00),
(4, ' lusterko ', 4, 619.00),
(5, ' tuleje wahacza ', 8, 780.00),
(6, ' szyba przednia ', 3, 521.00),
(7, ' felga', 2, 280.00),
(8, ' wahacz ', 2, 671.00),
(9, ' przewody hamulcowe ', 9, 995.00),
(10, ' tuleje wahacza ', 8, 892.00),
(11, ' filtr oleju ', 2, 427.00),
(12, ' przepustnica ', 10, 159.00),
(13, ' felga', 4, 141.00),
(14, ' chłodnica ', 8, 713.00),
(15, ' piasta koła ', 5, 235.00),
(16, ' rozrusznik ', 8, 457.00),
(17, ' miska olejowa ', 5, 838.00),
(18, ' amortyzator ', 10, 521.00),
(19, ' świeca ', 5, 146.00),
(20, ' zestaw rozrządu ', 7, 94.00),
(21, ' półoś ', 4, 478.00),
(22, ' amortyzator ', 5, 639.00),
(23, ' kompresor ', 4, 964.00),
(24, ' tuleje wahacza ', 1, 391.00),
(25, ' klocki hamulcowe ', 4, 167.00),
(26, ' chłodnica ', 10, 945.00),
(27, ' rozrusznik ', 8, 737.00),
(28, ' tarcza hamulcowa ', 4, 489.00),
(29, ' akumulator ', 6, 446.00),
(30, ' podnośnik szyby ', 2, 683.00),
(31, ' wysprzęglik ', 1, 319.00),
(32, ' klocki hamulcowe ', 8, 852.00),
(33, ' klocki hamulcowe ', 8, 259.00),
(34, ' półoś ', 4, 61.00),
(35, ' szyba przednia ', 7, 153.00),
(36, ' turbo ', 3, 248.00),
(37, ' szyba tylnia ', 3, 62.00),
(38, ' akumulator ', 3, 337.00),
(39, ' piasta koła ', 10, 684.00),
(40, ' amortyzator ', 9, 893.00),
(41, ' wycieraczki ', 2, 777.00),
(42, ' turbo ', 4, 607.00),
(43, ' filtr pyłkowy ', 8, 794.00),
(44, ' wahacz ', 4, 208.00),
(45, ' świeca ', 2, 859.00),
(46, ' akumulator ', 3, 620.00),
(47, ' szyba boczna ', 9, 219.00),
(48, ' filtr pyłkowy ', 6, 209.00),
(49, ' szyba przednia ', 7, 221.00),
(50, ' szyba boczna ', 8, 228.00),
(51, ' opona ', 5, 266.00),
(52, ' rozrusznik ', 5, 1000.00),
(53, ' olej ', 7, 728.00),
(54, ' wycieraczki ', 5, 909.00),
(55, ' tłumik ', 4, 402.00),
(56, ' wycieraczki ', 2, 321.00),
(57, ' klocki hamulcowe ', 4, 396.00),
(58, ' przepustnica ', 6, 131.00),
(59, ' amortyzator ', 9, 580.00),
(60, ' amortyzator ', 3, 157.00),
(61, ' czujnik parkowania ', 10, 300.00),
(62, ' przewody hamulcowe ', 6, 149.00),
(63, ' miska olejowa ', 8, 152.00),
(64, ' turbo ', 2, 540.00),
(65, ' olej ', 5, 352.00),
(66, ' lusterko ', 7, 290.00),
(67, ' bęben hamulcowy ', 2, 699.00),
(68, ' miska olejowa ', 2, 354.00),
(69, ' czujnik parkowania ', 3, 925.00),
(70, ' wysprzęglik ', 9, 327.00),
(71, ' szyba boczna ', 8, 714.00),
(72, ' świeca ', 5, 463.00),
(73, ' filtr oleju ', 5, 983.00),
(74, ' olej ', 2, 498.00),
(75, ' czujnik parkowania ', 9, 446.00),
(76, ' przewody hamulcowe ', 5, 227.00),
(77, ' olej ', 10, 271.00),
(78, ' podnośnik szyby ', 9, 422.00),
(79, ' sprzęgło ', 6, 733.00),
(80, ' turbo ', 8, 56.00),
(81, ' wycieraczki ', 5, 183.00),
(82, ' półoś ', 2, 579.00),
(83, ' wahacz ', 7, 849.00),
(84, ' półoś ', 5, 872.00),
(85, ' czujnik parkowania ', 5, 634.00),
(86, ' tarcza hamulcowa ', 10, 457.00),
(87, ' świeca ', 9, 162.00),
(88, ' filtr oleju ', 7, 351.00),
(89, ' przewody hamulcowe ', 5, 281.00),
(90, ' przepustnica ', 6, 744.00),
(91, ' zestaw rozrządu ', 8, 798.00),
(92, ' opona ', 5, 50.00),
(93, 'drążki kierownicze ', 6, 359.00),
(94, ' opona ', 7, 618.00),
(95, ' filtr oleju ', 1, 803.00),
(96, ' wycieraczki ', 2, 233.00),
(97, ' cewka zapłonowa ', 1, 964.00),
(98, ' przepustnica ', 2, 55.00),
(99, ' półoś ', 7, 751.00),
(100, ' klocki hamulcowe ', 10, 541.00),
(101, ' szyba boczna ', 6, 987.00),
(102, 'drążki kierownicze ', 1, 919.00),
(103, ' szyba boczna ', 9, 780.00),
(104, ' tuleje wahacza ', 9, 172.00),
(105, ' zestaw rozrządu ', 5, 126.00),
(106, ' wycieraczki ', 4, 256.00),
(107, ' filtr oleju ', 7, 444.00),
(108, ' szyba boczna ', 10, 537.00),
(109, ' świeca ', 2, 377.00),
(110, ' cewka zapłonowa ', 3, 63.00),
(111, ' felga', 5, 618.00),
(112, ' sprzęgło ', 8, 464.00),
(113, ' rozrusznik ', 3, 476.00),
(114, ' akumulator ', 1, 489.00),
(115, ' szyba boczna ', 6, 778.00),
(116, ' wycieraczki ', 5, 151.00),
(117, ' tarcza hamulcowa ', 6, 843.00),
(118, ' czujnik parkowania ', 1, 658.00),
(119, ' lampa ', 5, 959.00),
(120, ' czujnik parkowania ', 5, 737.00),
(121, ' akumulator ', 7, 447.00),
(122, ' pompa paliwa ', 2, 872.00),
(123, ' szyba przednia ', 6, 628.00),
(124, ' wycieraczki ', 8, 664.00),
(125, ' filtr oleju ', 4, 88.00),
(126, ' półoś ', 5, 563.00),
(127, ' lampa ', 1, 349.00),
(128, ' piasta koła ', 8, 853.00),
(129, ' świeca ', 2, 522.00),
(130, ' przewody hamulcowe ', 5, 275.00),
(131, ' podnośnik szyby ', 3, 711.00),
(132, ' olej ', 4, 998.00),
(133, ' czujnik parkowania ', 8, 260.00),
(134, ' bęben hamulcowy ', 3, 899.00),
(135, ' przepustnica ', 3, 383.00),
(136, ' akumulator ', 6, 563.00),
(137, ' kompresor ', 10, 618.00),
(138, ' wahacz ', 5, 777.00),
(139, ' lusterko ', 9, 407.00),
(140, ' tuleje wahacza ', 2, 471.00),
(141, ' klocki hamulcowe ', 8, 835.00),
(142, ' felga', 3, 429.00),
(143, ' filtr pyłkowy ', 1, 292.00),
(144, ' turbo ', 6, 314.00),
(145, ' tarcza hamulcowa ', 3, 473.00),
(146, ' lampa ', 2, 803.00),
(147, 'drążki kierownicze ', 6, 159.00),
(148, ' zestaw rozrządu ', 7, 694.00),
(149, ' czujnik parkowania ', 10, 974.00),
(150, ' szyba boczna ', 1, 546.00),
(151, ' lusterko ', 4, 452.00),
(152, ' olej ', 10, 556.00),
(153, ' piasta koła ', 3, 812.00),
(154, ' szyba tylnia ', 7, 329.00),
(155, ' czujnik parkowania ', 6, 841.00),
(156, ' tłumik ', 4, 419.00),
(157, ' miska olejowa ', 7, 947.00),
(158, ' klocki hamulcowe ', 5, 705.00),
(159, ' tarcza hamulcowa ', 5, 595.00),
(160, ' wysprzęglik ', 10, 472.00),
(161, ' szyba tylnia ', 3, 176.00),
(162, ' tarcza hamulcowa ', 10, 779.00),
(163, ' szyba boczna ', 2, 641.00),
(164, ' piasta koła ', 7, 514.00),
(165, ' sprzęgło ', 6, 862.00),
(166, ' kompresor ', 4, 566.00),
(167, ' akumulator ', 4, 166.00),
(168, ' wahacz ', 1, 910.00),
(169, ' lampa ', 9, 312.00),
(170, ' opona ', 9, 67.00),
(171, ' szyba przednia ', 5, 520.00),
(172, ' wysprzęglik ', 5, 541.00),
(173, 'drążki kierownicze ', 4, 355.00),
(174, ' cewka zapłonowa ', 10, 441.00),
(175, ' olej ', 2, 209.00),
(176, ' wysprzęglik ', 1, 593.00),
(177, ' przepustnica ', 3, 840.00),
(178, ' podnośnik szyby ', 9, 293.00),
(179, ' tłumik ', 8, 740.00),
(180, ' olej ', 9, 701.00),
(181, ' turbo ', 4, 88.00),
(182, ' szyba boczna ', 3, 220.00),
(183, ' pompa paliwa ', 6, 837.00),
(184, ' akumulator ', 4, 377.00),
(185, ' tarcza hamulcowa ', 7, 939.00),
(186, ' sprzęgło ', 9, 398.00),
(187, ' bęben hamulcowy ', 5, 575.00),
(188, ' szyba tylnia ', 1, 589.00),
(189, ' zestaw rozrządu ', 4, 163.00),
(190, ' rozrusznik ', 6, 500.00),
(191, ' przewody hamulcowe ', 4, 112.00),
(192, ' wycieraczki ', 8, 60.00),
(193, ' lusterko ', 5, 146.00),
(194, ' turbo ', 3, 521.00),
(195, 'drążki kierownicze ', 4, 771.00),
(196, ' filtr oleju ', 8, 59.00),
(197, ' zestaw rozrządu ', 6, 768.00),
(198, ' wysprzęglik ', 2, 995.00),
(199, ' kompresor ', 2, 686.00),
(200, ' klocki hamulcowe ', 6, 917.00),
(201, ' wysprzęglik ', 8, 260.00),
(202, ' tarcza hamulcowa ', 6, 84.00),
(203, ' tuleje wahacza ', 8, 280.00),
(204, ' zestaw rozrządu ', 2, 483.00),
(205, ' cewka zapłonowa ', 7, 390.00),
(206, ' tuleje wahacza ', 10, 173.00),
(207, ' miska olejowa ', 6, 977.00),
(208, ' rozrusznik ', 9, 209.00),
(209, ' półoś ', 4, 671.00),
(210, ' cewka zapłonowa ', 5, 56.00),
(211, ' bęben hamulcowy ', 1, 407.00),
(212, ' felga', 4, 646.00),
(213, ' wahacz ', 6, 598.00),
(214, ' turbo ', 3, 852.00),
(215, ' cewka zapłonowa ', 6, 409.00),
(216, ' podnośnik szyby ', 8, 433.00),
(217, ' amortyzator ', 2, 162.00),
(218, ' miska olejowa ', 4, 78.00),
(219, ' wysprzęglik ', 6, 501.00),
(220, ' opona ', 7, 67.00),
(221, ' rozrusznik ', 4, 349.00),
(222, ' turbo ', 6, 470.00),
(223, ' olej ', 6, 156.00),
(224, ' turbo ', 9, 984.00),
(225, ' przepustnica ', 4, 61.00),
(226, ' chłodnica ', 3, 699.00),
(227, ' filtr pyłkowy ', 1, 466.00),
(228, ' felga', 6, 198.00),
(229, ' czujnik parkowania ', 10, 757.00),
(230, ' sprzęgło ', 7, 540.00),
(231, ' podnośnik szyby ', 2, 518.00),
(232, ' czujnik parkowania ', 8, 488.00),
(233, ' pompa paliwa ', 2, 610.00),
(234, ' akumulator ', 6, 225.00),
(235, ' szyba boczna ', 10, 661.00),
(236, ' bęben hamulcowy ', 10, 668.00),
(237, ' miska olejowa ', 1, 234.00),
(238, ' amortyzator ', 6, 772.00),
(239, ' wahacz ', 1, 91.00),
(240, ' wahacz ', 3, 483.00),
(241, ' bęben hamulcowy ', 2, 307.00),
(242, ' czujnik parkowania ', 7, 566.00),
(243, ' bęben hamulcowy ', 3, 467.00),
(244, ' lusterko ', 6, 384.00),
(245, ' filtr pyłkowy ', 7, 113.00),
(246, ' zestaw rozrządu ', 2, 829.00),
(247, ' szyba tylnia ', 8, 460.00),
(248, ' miska olejowa ', 2, 788.00),
(249, ' miska olejowa ', 3, 824.00),
(250, ' czujnik parkowania ', 1, 158.00),
(251, ' filtr pyłkowy ', 3, 819.00),
(252, ' filtr pyłkowy ', 7, 328.00),
(253, ' podnośnik szyby ', 7, 743.00),
(254, ' przepustnica ', 6, 362.00),
(255, ' szyba boczna ', 1, 965.00),
(256, ' kompresor ', 3, 184.00),
(257, ' tuleje wahacza ', 6, 881.00),
(258, ' felga', 10, 346.00),
(259, ' lusterko ', 6, 636.00),
(260, ' akumulator ', 2, 563.00),
(261, ' szyba przednia ', 3, 441.00),
(262, ' cewka zapłonowa ', 5, 409.00),
(263, ' szyba przednia ', 7, 527.00),
(264, ' amortyzator ', 4, 876.00),
(265, ' rozrusznik ', 7, 868.00),
(266, ' podnośnik szyby ', 10, 195.00),
(267, ' szyba tylnia ', 10, 614.00),
(268, ' półoś ', 9, 807.00),
(269, ' piasta koła ', 3, 422.00),
(270, ' sprzęgło ', 10, 916.00),
(271, ' klocki hamulcowe ', 8, 472.00),
(272, ' szyba boczna ', 2, 987.00),
(273, ' tuleje wahacza ', 4, 647.00),
(274, ' amortyzator ', 2, 688.00),
(275, ' olej ', 10, 537.00),
(276, ' lusterko ', 5, 726.00),
(277, ' tarcza hamulcowa ', 3, 696.00),
(278, ' tarcza hamulcowa ', 4, 438.00),
(279, ' szyba tylnia ', 4, 90.00),
(280, ' olej ', 4, 431.00),
(281, ' półoś ', 3, 651.00),
(282, ' czujnik parkowania ', 3, 804.00),
(283, ' chłodnica ', 2, 365.00),
(284, ' opona ', 3, 272.00),
(285, ' klocki hamulcowe ', 9, 239.00),
(286, ' olej ', 2, 309.00),
(287, ' wycieraczki ', 1, 926.00),
(288, ' tuleje wahacza ', 8, 363.00),
(289, ' pompa paliwa ', 5, 186.00),
(290, ' filtr oleju ', 6, 535.00),
(291, ' czujnik parkowania ', 4, 834.00),
(292, ' wahacz ', 6, 328.00),
(293, ' filtr oleju ', 5, 285.00),
(294, ' sprzęgło ', 2, 654.00),
(295, ' bęben hamulcowy ', 8, 988.00),
(296, ' tuleje wahacza ', 7, 778.00),
(297, ' przewody hamulcowe ', 6, 177.00),
(298, ' sprzęgło ', 1, 915.00),
(299, ' przewody hamulcowe ', 2, 594.00),
(300, ' amortyzator ', 10, 134.00),
(301, ' rozrusznik ', 10, 714.00),
(302, ' piasta koła ', 2, 178.00),
(303, ' zestaw rozrządu ', 4, 252.00),
(304, ' tarcza hamulcowa ', 8, 218.00),
(305, ' podnośnik szyby ', 4, 361.00),
(306, ' przewody hamulcowe ', 4, 573.00),
(307, ' kompresor ', 10, 205.00),
(308, ' sprzęgło ', 4, 444.00),
(309, ' lusterko ', 4, 784.00),
(310, ' amortyzator ', 3, 647.00),
(311, ' tłumik ', 10, 133.00),
(312, ' opona ', 2, 930.00),
(313, ' świeca ', 1, 960.00),
(314, ' amortyzator ', 8, 148.00),
(315, ' szyba tylnia ', 9, 210.00),
(316, ' szyba przednia ', 6, 803.00),
(317, ' sprzęgło ', 5, 722.00),
(318, ' filtr pyłkowy ', 2, 323.00),
(319, ' wycieraczki ', 3, 370.00),
(320, ' amortyzator ', 9, 195.00),
(321, ' przepustnica ', 1, 515.00),
(322, ' szyba przednia ', 9, 970.00),
(323, ' zestaw rozrządu ', 8, 626.00),
(324, ' wahacz ', 2, 981.00),
(325, ' klocki hamulcowe ', 4, 764.00),
(326, ' przewody hamulcowe ', 5, 431.00),
(327, ' chłodnica ', 9, 123.00),
(328, ' lusterko ', 8, 894.00),
(329, ' pompa paliwa ', 5, 279.00),
(330, ' tarcza hamulcowa ', 4, 92.00),
(331, ' kompresor ', 2, 227.00),
(332, ' miska olejowa ', 4, 94.00),
(333, ' podnośnik szyby ', 10, 478.00),
(334, ' lusterko ', 4, 155.00),
(335, ' cewka zapłonowa ', 8, 167.00),
(336, ' olej ', 2, 215.00),
(337, ' wahacz ', 4, 82.00),
(338, ' przepustnica ', 4, 252.00),
(339, ' lampa ', 6, 706.00),
(340, ' półoś ', 10, 179.00),
(341, ' filtr pyłkowy ', 9, 481.00),
(342, ' filtr oleju ', 7, 255.00),
(343, ' świeca ', 7, 422.00),
(344, ' miska olejowa ', 4, 717.00),
(345, ' szyba boczna ', 2, 950.00),
(346, ' podnośnik szyby ', 9, 934.00),
(347, ' szyba boczna ', 10, 686.00),
(348, ' akumulator ', 2, 799.00),
(349, ' miska olejowa ', 7, 270.00),
(350, ' szyba tylnia ', 2, 496.00),
(351, ' szyba boczna ', 7, 127.00),
(352, ' świeca ', 5, 736.00),
(353, ' akumulator ', 8, 664.00),
(354, ' tuleje wahacza ', 9, 837.00),
(355, ' wycieraczki ', 7, 168.00),
(356, ' zestaw rozrządu ', 2, 101.00),
(357, ' akumulator ', 2, 370.00),
(358, ' tłumik ', 1, 569.00),
(359, ' turbo ', 4, 928.00),
(360, ' filtr oleju ', 3, 425.00),
(361, ' rozrusznik ', 9, 288.00),
(362, ' filtr pyłkowy ', 7, 458.00),
(363, ' kompresor ', 10, 64.00),
(364, ' czujnik parkowania ', 6, 598.00),
(365, ' wysprzęglik ', 8, 625.00),
(366, ' olej ', 10, 888.00),
(367, ' lampa ', 4, 440.00),
(368, ' świeca ', 3, 226.00),
(369, ' amortyzator ', 4, 746.00),
(370, ' wysprzęglik ', 5, 216.00),
(371, ' półoś ', 8, 751.00),
(372, ' zestaw rozrządu ', 9, 994.00),
(373, ' amortyzator ', 5, 506.00),
(374, ' szyba tylnia ', 10, 881.00),
(375, ' szyba boczna ', 1, 452.00),
(376, ' akumulator ', 1, 334.00),
(377, ' miska olejowa ', 2, 468.00),
(378, 'drążki kierownicze ', 4, 95.00),
(379, 'drążki kierownicze ', 5, 397.00),
(380, ' miska olejowa ', 2, 381.00),
(381, ' świeca ', 4, 916.00),
(382, ' podnośnik szyby ', 1, 338.00),
(383, ' felga', 2, 57.00),
(384, ' wysprzęglik ', 9, 145.00),
(385, ' pompa paliwa ', 7, 348.00),
(386, ' olej ', 1, 197.00),
(387, ' kompresor ', 7, 673.00),
(388, ' pompa paliwa ', 8, 161.00),
(389, ' zestaw rozrządu ', 4, 122.00),
(390, ' piasta koła ', 10, 380.00),
(391, ' pompa paliwa ', 2, 745.00),
(392, ' klocki hamulcowe ', 2, 53.00),
(393, ' szyba boczna ', 8, 668.00),
(394, ' tłumik ', 3, 895.00),
(395, 'drążki kierownicze ', 5, 390.00),
(396, ' kompresor ', 5, 272.00),
(397, ' przewody hamulcowe ', 5, 817.00),
(398, ' półoś ', 8, 839.00),
(399, ' wahacz ', 4, 742.00),
(400, ' tuleje wahacza ', 10, 442.00);

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

--
-- Zrzut danych tabeli `przeglad`
--

INSERT INTO `przeglad` (`id_przegladu`, `id_warsztatu_fk`, `vin_fk`, `data`, `godzina`) VALUES
(1, 1, '0123456789ABCDEFG', '2017/06/05', '10:00');

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

--
-- Zrzut danych tabeli `samochod_czesc`
--

INSERT INTO `samochod_czesc` (`czesc_id_fk`, `samochod_id_fk`) VALUES
(1, 392126),
(2, 392088),
(3, 392136),
(4, 392138),
(5, 392117),
(6, 392074),
(7, 392139),
(8, 392055),
(9, 392125),
(10, 392093),
(11, 392123),
(12, 392070),
(13, 392068),
(14, 392119),
(15, 392046),
(16, 392107),
(17, 392084),
(18, 392063),
(19, 392110),
(20, 392096),
(21, 392073),
(22, 392089),
(23, 392057),
(24, 392103),
(25, 392055),
(26, 392134),
(27, 392064),
(28, 392124),
(29, 392075),
(30, 392117),
(31, 392131),
(32, 392060),
(33, 392065),
(34, 392127),
(35, 392058),
(36, 392042),
(37, 392060),
(38, 392056),
(39, 392056),
(40, 392045),
(41, 392109),
(42, 392139),
(43, 392075),
(44, 392136),
(45, 392118),
(46, 392080),
(47, 392102),
(48, 392062),
(49, 392103),
(50, 392072),
(51, 392118),
(52, 392136),
(53, 392121),
(54, 392135),
(55, 392098),
(56, 392136),
(57, 392128),
(58, 392122),
(59, 392119),
(60, 392063),
(61, 392098),
(62, 392110),
(63, 392082),
(64, 392123),
(65, 392096),
(66, 392100),
(67, 392124),
(68, 392116),
(69, 392116),
(70, 392140),
(71, 392120),
(72, 392084),
(73, 392139),
(74, 392054),
(75, 392079),
(76, 392116),
(77, 392094),
(78, 392041),
(79, 392138),
(80, 392056),
(81, 392073),
(82, 392115),
(83, 392051),
(84, 392054),
(85, 392109),
(86, 392109),
(87, 392049),
(88, 392097),
(89, 392090),
(90, 392128),
(91, 392119),
(92, 392048),
(93, 392097),
(94, 392061),
(95, 392130),
(96, 392053),
(97, 392120),
(98, 392114),
(99, 392128),
(100, 392095),
(101, 392113),
(102, 392108),
(103, 392139),
(104, 392112),
(105, 392122),
(106, 392077),
(107, 392087),
(108, 392075),
(109, 392078),
(110, 392085),
(111, 392091),
(112, 392111),
(113, 392059),
(114, 392102),
(115, 392124),
(116, 392128),
(117, 392070),
(118, 392132),
(119, 392085),
(120, 392120),
(121, 392120),
(122, 392063),
(123, 392127),
(124, 392077),
(125, 392084),
(126, 392117),
(127, 392089),
(128, 392064),
(129, 392090),
(130, 392077),
(131, 392118),
(132, 392063),
(133, 392044),
(134, 392117),
(135, 392134),
(136, 392126),
(137, 392053),
(138, 392081),
(139, 392060),
(140, 392091),
(141, 392126),
(142, 392111),
(143, 392061),
(144, 392045),
(145, 392073),
(146, 392045),
(147, 392132),
(148, 392103),
(149, 392137),
(150, 392076),
(151, 392082),
(152, 392116),
(153, 392099),
(154, 392069),
(155, 392052),
(156, 392042),
(157, 392046),
(158, 392101),
(159, 392065),
(160, 392096),
(161, 392137),
(162, 392043),
(163, 392119),
(164, 392041),
(165, 392119),
(166, 392112),
(167, 392126),
(168, 392132),
(169, 392053),
(170, 392046),
(171, 392083),
(172, 392138),
(173, 392117),
(174, 392104),
(175, 392042),
(176, 392049),
(177, 392108),
(178, 392134),
(179, 392111),
(180, 392104),
(181, 392070),
(182, 392053),
(183, 392079),
(184, 392128),
(185, 392081),
(186, 392091),
(187, 392130),
(188, 392087),
(189, 392051),
(190, 392055),
(191, 392042),
(192, 392048),
(193, 392057),
(194, 392120),
(195, 392048),
(196, 392136),
(197, 392092),
(198, 392133),
(199, 392128),
(200, 392104),
(201, 392139),
(202, 392070),
(203, 392102),
(204, 392115),
(205, 392133),
(206, 392104),
(207, 392123),
(208, 392101),
(209, 392097),
(210, 392094),
(211, 392064),
(212, 392126),
(213, 392106),
(214, 392103),
(215, 392114),
(216, 392047),
(217, 392053),
(218, 392103),
(219, 392093),
(220, 392064),
(221, 392118),
(222, 392094),
(223, 392071),
(224, 392135),
(225, 392074),
(226, 392079),
(227, 392130),
(228, 392125),
(229, 392071),
(230, 392118),
(231, 392089),
(232, 392070),
(233, 392048),
(234, 392050),
(235, 392044),
(236, 392041),
(237, 392113),
(238, 392127),
(239, 392101),
(240, 392070),
(241, 392080),
(242, 392124),
(243, 392056),
(244, 392046),
(245, 392087),
(246, 392129),
(247, 392052),
(248, 392099),
(249, 392092),
(250, 392105),
(251, 392123),
(252, 392069),
(253, 392058),
(254, 392053),
(255, 392063),
(256, 392092),
(257, 392091),
(258, 392053),
(259, 392076),
(260, 392122),
(261, 392130),
(262, 392124),
(263, 392051),
(264, 392138),
(265, 392134),
(266, 392055),
(267, 392138),
(268, 392107),
(269, 392041),
(270, 392098),
(271, 392137),
(272, 392081),
(273, 392082),
(274, 392052),
(275, 392086),
(276, 392128),
(277, 392041),
(278, 392098),
(279, 392087),
(280, 392092),
(281, 392062),
(282, 392069),
(283, 392121),
(284, 392080),
(285, 392082),
(286, 392044),
(287, 392131),
(288, 392132),
(289, 392056),
(290, 392066),
(291, 392114),
(292, 392046),
(293, 392050),
(294, 392125),
(295, 392043),
(296, 392044),
(297, 392140),
(298, 392140),
(299, 392110),
(300, 392041),
(301, 392098),
(302, 392106),
(303, 392081),
(304, 392139),
(305, 392118),
(306, 392127),
(307, 392127),
(308, 392118),
(309, 392084),
(310, 392073),
(311, 392069),
(312, 392105),
(313, 392102),
(314, 392050),
(315, 392044),
(316, 392043),
(317, 392053),
(318, 392134),
(319, 392135),
(320, 392069),
(321, 392060),
(322, 392109),
(323, 392074),
(324, 392069),
(325, 392094),
(326, 392077),
(327, 392073),
(328, 392093),
(329, 392077),
(330, 392042),
(331, 392093),
(332, 392134),
(333, 392108),
(334, 392133),
(335, 392133),
(336, 392085),
(337, 392119),
(338, 392119),
(339, 392062),
(340, 392062),
(341, 392052),
(342, 392091),
(343, 392127),
(344, 392114),
(345, 392100),
(346, 392130),
(347, 392117),
(348, 392113),
(349, 392123),
(350, 392112),
(351, 392041),
(352, 392043),
(353, 392080),
(354, 392075),
(355, 392071),
(356, 392133),
(357, 392111),
(358, 392103),
(359, 392085),
(360, 392047),
(361, 392105),
(362, 392138),
(363, 392041),
(364, 392072),
(365, 392130),
(366, 392133),
(367, 392117),
(368, 392109),
(369, 392112),
(370, 392138),
(371, 392131),
(372, 392124),
(373, 392088),
(374, 392117),
(375, 392097),
(376, 392048),
(377, 392106),
(378, 392074),
(379, 392120),
(380, 392089),
(381, 392045),
(382, 392121),
(383, 392091),
(384, 392084),
(385, 392055),
(386, 392122),
(387, 392077),
(388, 392126),
(389, 392085),
(390, 392122),
(391, 392133),
(392, 392050),
(393, 392119),
(394, 392133),
(395, 392081),
(396, 392109),
(397, 392126),
(398, 392057),
(399, 392078),
(400, 392098);

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
('aga234', 392044, '0123456789ABCDEFG', NULL),
('aga234', 392057, 'ABCDEFG0123456789', NULL);

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
(1, 3, 10),
(1, 4, 5),
(1, 5, 19),
(1, 6, 10),
(1, 11, 18),
(1, 12, 7),
(1, 13, 11),
(1, 17, 8),
(1, 21, 2),
(1, 24, 6),
(1, 25, 1),
(1, 26, 2),
(1, 28, 2),
(1, 30, 17),
(1, 32, 1),
(1, 33, 4),
(1, 35, 6),
(1, 36, 6),
(1, 37, 17),
(1, 38, 20),
(1, 39, 16),
(1, 40, 2),
(1, 42, 14),
(1, 49, 8),
(1, 50, 9),
(1, 53, 1),
(1, 56, 12),
(1, 57, 11),
(1, 58, 5),
(1, 59, 20),
(1, 63, 14),
(1, 65, 15),
(1, 66, 14),
(1, 67, 17),
(1, 72, 4),
(1, 74, 13),
(1, 75, 8),
(1, 79, 6),
(1, 82, 4),
(1, 85, 6),
(1, 86, 18),
(1, 87, 13),
(1, 88, 17),
(1, 89, 11),
(1, 90, 11),
(1, 94, 2),
(1, 96, 15),
(1, 97, 9),
(1, 99, 9),
(1, 102, 20),
(1, 107, 5),
(1, 108, 3),
(1, 110, 8),
(1, 111, 13),
(1, 112, 12),
(1, 113, 20),
(1, 115, 10),
(1, 116, 2),
(1, 118, 13),
(1, 121, 3),
(1, 122, 8),
(1, 123, 9),
(1, 126, 6),
(1, 127, 11),
(1, 130, 19),
(1, 131, 18),
(1, 132, 15),
(1, 133, 2),
(1, 134, 3),
(1, 137, 15),
(1, 138, 10),
(1, 139, 16),
(1, 141, 20),
(1, 142, 16),
(1, 144, 2),
(1, 148, 19),
(1, 149, 16),
(1, 150, 18),
(1, 153, 1),
(1, 154, 13),
(1, 158, 10),
(1, 162, 8),
(1, 163, 14),
(1, 164, 10),
(1, 165, 8),
(1, 166, 5),
(1, 167, 3),
(1, 168, 11),
(1, 169, 11),
(1, 170, 19),
(1, 171, 16),
(1, 172, 8),
(1, 175, 7),
(1, 176, 7),
(1, 179, 2),
(1, 181, 2),
(1, 183, 1),
(1, 184, 7),
(1, 186, 20),
(1, 187, 10),
(1, 188, 13),
(1, 190, 5),
(1, 193, 7),
(1, 195, 8),
(1, 197, 17),
(1, 198, 14),
(1, 200, 8),
(1, 202, 15),
(1, 204, 11),
(1, 207, 8),
(1, 210, 2),
(1, 213, 6),
(1, 216, 10),
(1, 217, 14),
(1, 218, 19),
(1, 219, 13),
(1, 220, 5),
(1, 221, 5),
(1, 226, 10),
(1, 227, 6),
(1, 230, 6),
(1, 231, 16),
(1, 233, 1),
(1, 237, 12),
(1, 238, 18),
(1, 240, 14),
(1, 241, 10),
(1, 242, 8),
(1, 245, 7),
(1, 247, 8),
(1, 248, 10),
(1, 249, 2),
(1, 250, 1),
(1, 251, 4),
(1, 254, 13),
(1, 255, 8),
(1, 256, 8),
(1, 259, 13),
(1, 264, 6),
(1, 265, 15),
(1, 266, 5),
(1, 270, 20),
(1, 271, 11),
(1, 272, 1),
(1, 276, 15),
(1, 277, 12),
(1, 280, 17),
(1, 282, 16),
(1, 284, 9),
(1, 285, 13),
(1, 286, 12),
(1, 287, 15),
(1, 290, 12),
(1, 292, 19),
(1, 293, 1),
(1, 295, 1),
(1, 299, 8),
(1, 302, 3),
(1, 304, 15),
(1, 305, 15),
(1, 306, 19),
(1, 307, 13),
(1, 312, 6),
(1, 313, 2),
(1, 315, 8),
(1, 320, 20),
(1, 323, 15),
(1, 325, 15),
(1, 327, 17),
(1, 328, 4),
(1, 330, 6),
(1, 331, 5),
(1, 333, 4),
(1, 334, 3),
(1, 335, 10),
(1, 336, 11),
(1, 338, 3),
(1, 342, 1),
(1, 343, 16),
(1, 344, 7),
(1, 348, 2),
(1, 349, 10),
(1, 350, 9),
(1, 353, 5),
(1, 354, 2),
(1, 355, 20),
(1, 356, 3),
(1, 358, 1),
(1, 359, 7),
(1, 360, 4),
(1, 362, 14),
(1, 363, 11),
(1, 366, 19),
(1, 367, 1),
(1, 369, 19),
(1, 374, 20),
(1, 375, 17),
(1, 376, 19),
(1, 379, 8),
(1, 380, 20),
(1, 381, 11),
(1, 384, 15),
(1, 386, 14),
(1, 387, 17),
(1, 388, 16),
(1, 391, 19),
(1, 393, 4),
(1, 394, 9),
(1, 396, 20),
(1, 397, 7),
(1, 399, 3),
(1, 400, 20),
(2, 1, 18),
(2, 2, 2),
(2, 7, 12),
(2, 8, 10),
(2, 9, 17),
(2, 10, 16),
(2, 14, 1),
(2, 15, 8),
(2, 16, 13),
(2, 18, 10),
(2, 19, 3),
(2, 20, 2),
(2, 22, 20),
(2, 23, 5),
(2, 27, 9),
(2, 29, 9),
(2, 31, 19),
(2, 34, 4),
(2, 41, 7),
(2, 43, 12),
(2, 44, 15),
(2, 45, 17),
(2, 46, 16),
(2, 47, 1),
(2, 48, 1),
(2, 51, 9),
(2, 52, 19),
(2, 54, 6),
(2, 55, 4),
(2, 60, 2),
(2, 61, 10),
(2, 62, 11),
(2, 64, 14),
(2, 68, 9),
(2, 69, 11),
(2, 70, 13),
(2, 71, 1),
(2, 73, 10),
(2, 76, 5),
(2, 77, 13),
(2, 78, 7),
(2, 80, 8),
(2, 81, 2),
(2, 83, 13),
(2, 84, 16),
(2, 91, 4),
(2, 92, 15),
(2, 93, 9),
(2, 95, 2),
(2, 98, 2),
(2, 100, 6),
(2, 101, 5),
(2, 103, 5),
(2, 104, 20),
(2, 105, 5),
(2, 106, 13),
(2, 109, 8),
(2, 114, 3),
(2, 117, 11),
(2, 119, 17),
(2, 120, 10),
(2, 124, 2),
(2, 125, 15),
(2, 128, 8),
(2, 129, 11),
(2, 135, 20),
(2, 136, 18),
(2, 140, 20),
(2, 143, 3),
(2, 145, 13),
(2, 146, 14),
(2, 147, 20),
(2, 151, 15),
(2, 152, 18),
(2, 155, 19),
(2, 156, 6),
(2, 157, 18),
(2, 159, 5),
(2, 160, 13),
(2, 161, 10),
(2, 173, 6),
(2, 174, 13),
(2, 177, 11),
(2, 178, 6),
(2, 180, 14),
(2, 182, 11),
(2, 185, 6),
(2, 189, 4),
(2, 191, 11),
(2, 192, 8),
(2, 194, 5),
(2, 196, 17),
(2, 199, 10),
(2, 201, 6),
(2, 203, 14),
(2, 205, 14),
(2, 206, 8),
(2, 208, 4),
(2, 209, 8),
(2, 211, 7),
(2, 212, 5),
(2, 214, 20),
(2, 215, 18),
(2, 222, 9),
(2, 223, 8),
(2, 224, 6),
(2, 225, 1),
(2, 228, 10),
(2, 229, 12),
(2, 232, 13),
(2, 234, 15),
(2, 235, 1),
(2, 236, 19),
(2, 239, 20),
(2, 243, 18),
(2, 244, 6),
(2, 246, 18),
(2, 252, 8),
(2, 253, 7),
(2, 257, 9),
(2, 258, 13),
(2, 260, 15),
(2, 261, 10),
(2, 262, 1),
(2, 263, 2),
(2, 267, 6),
(2, 268, 12),
(2, 269, 16),
(2, 273, 3),
(2, 274, 6),
(2, 275, 12),
(2, 278, 19),
(2, 279, 5),
(2, 281, 11),
(2, 283, 13),
(2, 288, 3),
(2, 289, 6),
(2, 291, 9),
(2, 294, 15),
(2, 296, 4),
(2, 297, 12),
(2, 298, 7),
(2, 300, 13),
(2, 301, 4),
(2, 303, 17),
(2, 308, 4),
(2, 309, 14),
(2, 310, 19),
(2, 311, 9),
(2, 314, 5),
(2, 316, 8),
(2, 317, 1),
(2, 318, 9),
(2, 319, 17),
(2, 321, 10),
(2, 322, 14),
(2, 324, 16),
(2, 326, 4),
(2, 329, 1),
(2, 332, 19),
(2, 337, 1),
(2, 339, 2),
(2, 340, 4),
(2, 341, 13),
(2, 345, 12),
(2, 346, 5),
(2, 347, 5),
(2, 351, 7),
(2, 352, 19),
(2, 357, 13),
(2, 361, 19),
(2, 364, 12),
(2, 365, 1),
(2, 368, 14),
(2, 370, 11),
(2, 371, 1),
(2, 372, 10),
(2, 373, 15),
(2, 377, 11),
(2, 378, 18),
(2, 382, 15),
(2, 383, 17),
(2, 385, 4),
(2, 389, 14),
(2, 390, 13),
(2, 392, 5),
(2, 395, 12),
(2, 398, 13);

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
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;
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
  MODIFY `samochod_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392141;
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
