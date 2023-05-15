-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Bulan Mei 2023 pada 17.27
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbttd`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `concepts`
--

CREATE TABLE `concepts` (
  `conc_id` int(6) NOT NULL,
  `recipient_name` varchar(30) NOT NULL,
  `institute` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address_now` longtext NOT NULL,
  `address_ktp` longtext NOT NULL,
  `bod` date NOT NULL,
  `gender` char(1) NOT NULL,
  `religion` varchar(10) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `conc_date` date NOT NULL,
  `user_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `documents`
--

CREATE TABLE `documents` (
  `id` varchar(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `documents`
--

INSERT INTO `documents` (`id`, `name`, `filename`, `description`, `created_at`, `updated_at`) VALUES
('1', 'surat1', 'INSTRUKSI TUGAS BESAR.pdf', 'ini surat1', '2023-04-17 17:10:13', '2023-04-17 17:10:13'),
('2', 'surat2', 'Soal AHP.pdf', 'ini surat2', '2023-04-19 08:36:02', '2023-04-19 08:36:02'),
('3', 'surat3', 'Soal AHP.pdf', 'ini surat3', '2023-04-19 08:46:49', '2023-04-19 08:46:49'),
('4', 'surat4', 'Soal AHP.pdf', 'ini surat4', '2023-04-19 08:57:25', '2023-04-19 08:57:25'),
('5', 'surat5', 'Soal AHP.pdf', 'ini surat5', '2023-04-19 08:58:05', '2023-04-19 08:58:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `signature`
--

CREATE TABLE `signature` (
  `user_id` varchar(11) NOT NULL,
  `document_id` varchar(11) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `signed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `institute_name` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `sign_img` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `nik`, `institute_name`, `city`, `active`, `sign_img`, `token`, `created_at`, `updated_at`) VALUES
('1', 'dini', 'din@gmail.com', '12345', '123445436', 'universitas andalas', 'padang', 1, 'gambar dini', '', '2023-04-08 05:32:56', '2023-04-08 05:32:56'),
('10', 'baru', 'baru', '$2a$10$XPT2dd2Zh6KXpLzeWv1xEuNj0XBshwmblJtIKPAwOkOkYbW/Es6Cy', 'baru', 'baru', 'baru', 0, '', '', '2023-04-08 05:33:25', '2023-04-08 07:53:05'),
('11', 'anda', 'andsdfsdf', '$2a$10$wvwsK2iy14kRmy/UgbBtt.OFHOWiaUHaiO7qekkwbLnJqcOxWWrnu', '42141221', 'andals', 'dfsfdsf', 0, '', '', '2023-04-08 05:35:23', '2023-04-08 07:40:39'),
('12', 'din', 'dsfs', '$2a$10$QoGaXpBMebs/1GeybOsTWeQj/D54pdVlXgcyJK6ORYxZw8K3za3Dy', '12312312', 'dsfsf', 'sdfs', 1, '', '', '2023-04-08 05:37:53', '2023-04-08 05:37:53'),
('13', 'din', 'dsfs', '$2a$10$jEcMzZVehUmBhXiqHuBuS.01ZzenshULJqgMZ9vPxbQmG3I6ASA.i', '12312312', 'dsfsf', 'sdfs', 1, '', '', '2023-04-08 05:39:11', '2023-04-08 05:39:11'),
('14', 'din', 'dsfs', '$2a$10$kdYgno8Il8JeWK94VmI8Eu16LT0A1dI9Ry6/U.t/Qt2fBMte8CId.', '12312312', 'dsfsf', 'sdfs', 1, '', '', '2023-04-08 05:41:51', '2023-04-08 05:41:51'),
('15', 'din', 'dsfs', '$2a$10$x1DjuyU/iCT8FkyM4Qn3CeXxYmHyQxX.6KmDgVjgdw0FUYNeIH/aS', '12312312', 'dsfsf', 'sdfs', 1, '', '', '2023-04-08 05:48:28', '2023-04-08 05:48:28'),
('16', 'din', 'dsfs', '$2a$10$49RHDjSc3O9uDypHTtu.2e/HlUEFA1z992IqlMc3mJI8.1zylywWG', '12312312', 'dsfsf', 'sdfs', 1, '', '', '2023-04-08 05:52:25', '2023-04-08 05:52:25'),
('17', 'din', 'dsfs', '$2a$10$E1JxcofS99UwsOtapQ5NSeOt2sIyWuRdO.9WCMuvDkHsonQTpHoq2', '12312312', 'dsfsf', 'sdfs', 1, '', '', '2023-04-08 05:59:22', '2023-04-08 05:59:22'),
('20', 'anda12', 'anda12@gmail.com', '$2a$10$4QHO8SC3c5kqii7SHpXj7.FfwnKz8gufF2Lg/DgLj6GBCAVD7W66G', 'dfsdfsdf', 'andalas', 'padang', 1, 'anda12.png', '', '2023-04-10 08:11:03', '2023-04-19 11:22:43'),
('21', 'anda12', 'anda12@gmail.com', '$2a$10$t2chhCFvGtmzKI2CNQ1sHORBMxn8awKGgUoPOIxK7D8lH94cZxXK.', 'dfsdfsdf', 'andalas', 'padang', 1, '', '', '2023-04-10 08:13:02', '2023-04-10 08:43:23'),
('30', 'dini12345', 'dinidini@gmail.com', '$2a$10$MygggtEo91Wkf3/YLlMoROM8o/mLl7378lklwomHU56hpcTvrpyiu', '123456', 'universitas andalas', 'padang', 1, '', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRpbmlkaW5pQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiMTIzNDUiLCJpYXQiOjE2ODE4OTk5NTMsImV4cCI6MTY4MTkwMTc1M30.kr-2v0MKCaLKQzqe9HKirMdytxzNgfVrLRJeaStRFh8', '2023-04-10 09:54:04', '2023-04-19 10:25:53'),
('33', 'dini', 'dinidini@gmail.com', '$2a$10$/5XFsBW95Y6iLZIpkCWNuu/r1SA0MzjddYpsjjcfjLquNKkh7i0m.', '1232131', 'andalas', 'padang', 1, '', '', '2023-04-10 10:45:04', '2023-04-10 10:45:04'),
('34', 'dini', 'dinidini@gmail.com', '$2a$10$YZ0hiHiBswTH5eZUEmeYHeksmplgYu8e6.Nbd1CbWUPOLhGvvJAx.', '1232131', 'andalas', 'padang', 1, '', '', '2023-04-10 10:46:07', '2023-04-10 10:46:07'),
('35', 'dini12', 'dini@gmail.com', '$2a$10$MuJavzha/mDBDK13I/wuS.GRsyzE5j5CvcCDPkqiyANVNEmTv/2em', '1232131', 'andalas', 'padang', 1, '', '', '2023-04-19 08:24:12', '2023-04-19 08:24:12'),
('36', 'd', 'd@gmail.com', '$2a$10$Ldkq6IoGY20eJ9ycn0BHPuHD8wgZiVg07SJSGFwFy10MR/lTraGuG', '123', 'abc', 'abc', 1, '', '', '2023-04-19 09:01:51', '2023-04-19 09:01:51'),
('37', 'd', 'd@gmail.com', '$2a$10$B99An7h7pXZMq1UGuKr5O.tXrweNx8bbipHbrABlyURz3u.954Bsy', '123', 'abc', 'abc', 1, '', '', '2023-04-19 09:11:07', '2023-04-19 09:11:07'),
('38', 'd', 'd@gmail.com', '$2a$10$Ljf3qtN0wDGjA.MmTb27BeL0X1djQzbNY.050e3tQSDSQrpfTcpuy', '123', 'abc', 'abc', 1, '', '', '2023-04-19 09:12:50', '2023-04-19 09:12:50'),
('39', 'd', 'd@gmail.com', '$2a$10$8SYN5y0Amt/6GAsagYU6Ae18AlS0MvcQIW/MLNRItU0g4hFSAjY5q', '123', 'abc', 'abc', 1, '', '', '2023-04-19 09:15:08', '2023-04-19 09:15:08'),
('40', 'd', 'd@gmail.com', '$2a$10$UJM7c/DXAWcm5AmAORcNeOXxIxhyLSyhkJZO/R7s5k9WvB0Ke93cC', '123', 'abc', 'abc', 1, 'budiman.jpg', '', '2023-04-19 09:21:14', '2023-04-19 09:21:14'),
('41', 'd', 'd@gmail.com', '$2a$10$qEud5EmcPHmIjwhK3y7ZrOw9DZjvbunWjg4AfZhjm0L1cFWNIhc06', '123', 'abc', 'abc', 1, 'budiman.jpg', '', '2023-04-19 09:25:21', '2023-04-19 09:25:21'),
('7', 'dini', 'dini@gmail.com', '1234', '2213213', 'andalas', 'pdg', 0, '', '', '2023-04-08 05:32:56', '2023-04-08 05:32:56'),
('8', 'dini', 'dini@gmail.com', '1234', '2213213', 'andalas', 'pdg', 0, '', '', '2023-04-08 05:32:56', '2023-04-08 05:32:56');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `concepts`
--
ALTER TABLE `concepts`
  ADD PRIMARY KEY (`conc_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `signature`
--
ALTER TABLE `signature`
  ADD PRIMARY KEY (`user_id`,`document_id`),
  ADD KEY `document_id` (`document_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `concepts`
--
ALTER TABLE `concepts`
  MODIFY `conc_id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `concepts`
--
ALTER TABLE `concepts`
  ADD CONSTRAINT `concepts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `signature`
--
ALTER TABLE `signature`
  ADD CONSTRAINT `signature_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `signature_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
