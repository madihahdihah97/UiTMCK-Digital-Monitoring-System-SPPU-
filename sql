SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pemantauan`
--

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `idjabatan` int(11) NOT NULL,
  `namajabatan` varchar(100) NOT NULL,
  `gambarjabatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`idjabatan`, `namajabatan`, `gambarjabatan`) VALUES
(1, 'HEI', 'hei.jpg'),
(2, 'PPAQ', 'ppaq.jpg'),
(3, 'REKTOR', 'rektor.png');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `idstaff` varchar(4) NOT NULL,
  `idprojek` int(11) NOT NULL,
  `idprogram` int(11) NOT NULL,
  `idmedia` int(11) NOT NULL,
  `tarikh` date NOT NULL,
  `masa` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`idstaff`, `idprojek`, `idprogram`, `idmedia`, `tarikh`, `masa`) VALUES
('U001', 1, 1, 1, '2021-09-11', '11:30:00'),
('U002', 2, 2, 2, '2022-01-01', '16:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `idmedia` int(11) NOT NULL,
  `media` varchar(50) NOT NULL,
  `keteranganmedia` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`idmedia`, `media`, `keteranganmedia`) VALUES
(1, 'BrgAsas.jpg', 'Gambar menunjukkan barang-barang asas yang bakal diagihkan kepada golongan  warga asnaf UITM cawangan Machang'),
(2, 'mengaji.jpg', 'Gambar Menunjukkan: Peserta program sedang membaca ayat suci Al Quran');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `idprogram` int(11) NOT NULL,
  `namaprogram` varchar(70) NOT NULL,
  `laporan` varchar(200) NOT NULL,
  `tarikhaktiviti` varchar(100) NOT NULL,
  `aktiviti` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`idprogram`, `namaprogram`, `laporan`, `tarikhaktiviti`, `aktiviti`) VALUES
(1, 'Bantuan barang asas', 'Tempat: Perkarangan Pejabat Rektor<br>\r\nMasa: 10.00am - 12.00pm<br>\r\nTarikh Mula Program: 11.09.2021<br>\r\nTarikh Tamat Program: 11.09.2021<br>\r\nKehadiran: 30 orang warga asnaf \r\n', ' 11.09.2021', 'Barang dapor 1'),
(2, 'Tadarus Al Quran', 'Tempat: Sharhan Resindent<br>\r\nMasa: 5.00pm - 7.00pm<br>\r\nTarikh Mula Program: 10.02.2022<br>\r\nTarikh Tamat Program: 11.02.2022<br>\r\nkehadiran:15 peserta 7 orang AJK dan 02 orang jemputan majlis.\r\n', ' 01.01.22', 'Pendaftaran, Like Cinderella, BBQ, Tahajjud, Bacaan Surah Al-Kahfi, Zikir, Selawat, Tazkirah, Tilawah  Al-Quran, Senamrobik, sukaneka, busana muslimah, penutup dan penyampaian hadiah. ');

-- --------------------------------------------------------

--
-- Table structure for table `projek`
--

CREATE TABLE `projek` (
  `idprojek` int(11) NOT NULL,
  `namaprojek` varchar(70) NOT NULL,
  `gambarprojek` varchar(50) NOT NULL,
  `idjabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projek`
--

INSERT INTO `projek` (`idprojek`, `namaprojek`, `gambarprojek`, `idjabatan`) VALUES
(1, 'pendidikan masyarakat', 'masyarakat.jpg', 1),
(2, 'pendidikan islamiah', 'pusatislam.jpeg', 2),
(3, 'agro business', 'g003.jpeg', 3),
(4, 'program akademik baru', 'intro4.png', 3),
(5, 'A.D.A.B', 'adab.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `idstaff` varchar(4) NOT NULL,
  `namastaff` varchar(30) NOT NULL,
  `nokp` varchar(14) NOT NULL,
  `password` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `jawatan` varchar(20) NOT NULL,
  `idjabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`idstaff`, `namastaff`, `nokp`, `password`, `status`, `jawatan`, `idjabatan`) VALUES
('U001', 'Ahmad bin Abu', '950615085443', 'Ahmad1234', 'Pengguna', 'Pensyarah', 1),
('U002', 'Shafiza bt Shafie', '930312026058', 'Shafiza1234', 'Pengguna', 'Pensyarah', 2),
('U003', 'Natasya bt Ismail', '880514112662', 'Natasya1234', 'Admin', 'Rektor', 3),
('U004', 'Irfan bin Zukifli', '900704081111', 'Irfan1234', 'Admin', 'Rektor', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`idjabatan`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`idstaff`,`idprojek`,`idprogram`,`idmedia`,`tarikh`,`masa`),
  ADD KEY `idstaff` (`idstaff`),
  ADD KEY `idprojek` (`idprojek`),
  ADD KEY `idprogram` (`idprogram`),
  ADD KEY `idmedia` (`idmedia`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`idmedia`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`idprogram`);

--
-- Indexes for table `projek`
--
ALTER TABLE `projek`
  ADD PRIMARY KEY (`idprojek`),
  ADD KEY `idjabatan` (`idjabatan`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`idstaff`),
  ADD KEY `idjabatan` (`idjabatan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `idjabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `idmedia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `idprogram` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projek`
--
ALTER TABLE `projek`
  MODIFY `idprojek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_media` FOREIGN KEY (`idmedia`) REFERENCES `media` (`idmedia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_program` FOREIGN KEY (`idprogram`) REFERENCES `program` (`idprogram`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_projek` FOREIGN KEY (`idprojek`) REFERENCES `projek` (`idprojek`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_staff` FOREIGN KEY (`idstaff`) REFERENCES `staff` (`idstaff`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projek`
--
ALTER TABLE `projek`
  ADD CONSTRAINT `projek_jabatan` FOREIGN KEY (`idjabatan`) REFERENCES `jabatan` (`idjabatan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_jabatan` FOREIGN KEY (`idjabatan`) REFERENCES `jabatan` (`idjabatan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
