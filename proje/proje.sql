-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 26 Kas 2020, 11:20:12
-- Sunucu sürümü: 8.0.17
-- PHP Sürümü: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `proje`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanıcılar`
--

CREATE TABLE `kullanıcılar` (
  `id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `surname` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `cep` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `TC` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `eposta` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `giris_tarih` date DEFAULT NULL,
  `dogum` date DEFAULT NULL,
  `dogum_yeri` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `anne_adi` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `baba_adi` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sifre` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanıcılar`
--

INSERT INTO `kullanıcılar` (`id`, `rol_id`, `name`, `surname`, `cep`, `TC`, `eposta`, `giris_tarih`, `dogum`, `dogum_yeri`, `anne_adi`, `baba_adi`, `sifre`) VALUES
(2, 1, 'Baran', 'Sümer', '+90 (555) 444 33 22', '12345678912', 'bmustafa.sumer@gmail.com', '2020-12-01', '1995-09-18', 'Ankara', 'Ayşe', 'Mehmet', '123'),
(13, 1, 'Ozan', 'Sarıkaya', '+90 (555) 333 22 11', '11122233344', 'os@gmail.com', '2019-01-01', '1995-01-01', 'Ankara', 'Ayşe', 'Mehmet', '11111111'),
(17, 2, 'Onur', 'Aydın', '+90 (532) 658 46 78', '12345678910', 'onur@gmail.com', '2020-10-01', '1996-07-28', 'Eskişehir', 'Ayşe', 'Mustafa', '33333333'),
(18, 2, 'Cem', 'Sarıkaya', '+90 (544) 685 99 85', '12345678945', 'cem1@hotmai̇l.com', '2020-10-02', '1990-05-25', 'Edi̇rne', 'Ayşe', 'Sinan', ''),
(20, 2, 'Mehmet', 'Yılmaz', '+90 (555) 666 88 99', '12345678901', 'my@gmail.com', '2011-01-01', '1961-01-01', 'Esenyurt', 'Ayşe', 'Bekir', '1'),
(22, 2, 'Merve', 'Özeş', '+90 (544) 332 24 52', '17983843242', 'merve@gmail.com', '1992-12-18', '1996-12-18', 'Afyon', 'Suna', 'Si̇na', ''),
(26, 1, 'Melih', 'Sezer', '+90 (532) 444 44 44', '12345678911', 'bmustafa.sumer@gmail.com', '2020-11-17', '0000-00-00', 'Undefined', 'Undefined', 'Undefined', ''),
(27, 2, 'Salih', 'Şahin', '+90 (555) 777 88 22', '12345678972', 'salih@hotmail.com', '2020-02-01', '0000-00-00', 'Undefined', 'Undefined', 'Undefined', ''),
(28, 2, 'Hasan', 'Yi̇ği̇t', '+90 (532) 660 10 34', '11122233398', 'bmustafa.sumer@gmai̇l.com', '2020-11-01', '2020-11-01', 'Ankara', 'Anne', 'Baba', ''),
(33, 1, 'Ahmet ', 'Taylan', '+90 (555) 444 88 77', '12345678998', 'ahmetx@gmail.com', '2006-09-28', '1964-05-16', 'İzmir', 'Suna', 'Salim', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roller`
--

CREATE TABLE `roller` (
  `id` int(11) NOT NULL,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `roller`
--

INSERT INTO `roller` (`id`, `name`) VALUES
(1, 'Firma Yöneticisi'),
(2, 'Çalışan');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kullanıcılar`
--
ALTER TABLE `kullanıcılar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `roller`
--
ALTER TABLE `roller`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kullanıcılar`
--
ALTER TABLE `kullanıcılar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Tablo için AUTO_INCREMENT değeri `roller`
--
ALTER TABLE `roller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
