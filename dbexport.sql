-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: maneja
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `account`
--

DROP TABLE IF EXISTS `account`;
/*!50001 DROP VIEW IF EXISTS `account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `account` (
  `id_user` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `nama` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `pekerjaan` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `finance`
--

DROP TABLE IF EXISTS `finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance` (
  `id_transaction` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `type` enum('debit','credit') NOT NULL,
  `value` decimal(50,2) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id_transaction`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `finance_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `userlogin` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance`
--

LOCK TABLES `finance` WRITE;
/*!40000 ALTER TABLE `finance` DISABLE KEYS */;
INSERT INTO `finance` VALUES (1,1,'debit',200000.00,'gaji'),(2,1,'debit',6000000.00,'gaji bulan desember'),(3,2,'debit',6000000.00,'gajian'),(4,2,'debit',6000000.00,' warung 1'),(5,3,'debit',6000000.00,' warung 3'),(6,6,'credit',20000.00,'iseng'),(7,6,'debit',50000.00,'top up'),(8,6,'debit',100000.00,'top up lagi'),(9,6,'debit',200000.00,'top up lagi'),(10,6,'debit',200000.00,'top up lagi'),(11,6,'credit',20000.00,'makan'),(12,6,'debit',200000.00,'banyak uang');
/*!40000 ALTER TABLE `finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `pekerjaan` varchar(30) NOT NULL,
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (0,' suika','089532','penari'),(2,' suika','18088','penari'),(6,' sh','','');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnt`
--

DROP TABLE IF EXISTS `tnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnt` (
  `id_tnt` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` date NOT NULL,
  `content` longtext NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` enum('tips','trick','news') NOT NULL,
  `foto` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tnt`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnt`
--

LOCK TABLES `tnt` WRITE;
/*!40000 ALTER TABLE `tnt` DISABLE KEYS */;
INSERT INTO `tnt` VALUES (1,'2020-12-05','Jakarta - Kementerian Pendayagunaan Aparatur Negara dan Reformasi Birokrasi (PAN-RB) menyebut rencana kenaikan gaji pegawai negeri sipil (PNS) di wilayah terdepan, terluar, tertinggal (3T) perlu mendapat restu dari presiden.\r\nDeputi Sumber Daya Manusia Aparatur Kementerian PAN-RB, Teguh Widjinarko mengatakan saat ini rencana tersebut sedang dikaji oleh Lembaga Administrasi Negara (LAN).\r\n\r\n\"Semua kebijakan yang dikeluarkan pemerintah harus melalui mekanisme persetujuan presiden,\" kata Teguh saat dihubungi detikcom, Jakarta, Sabtu (5/12/2020).\r\n\r\n\"Karena itu selalu ada keterlibatan sekretariat negara dalam proses perumusannya,\" tambahnya.\r\n\r\nDia bilang, kajian ini juga diharapkan bisa sejalan dengan rencana pemerintah melalui Badan Kepegawaian Negara (BKN) yang ingin mengubah sistem pangkat dan gaji PNS.\r\n\r\n\"Kami saat ini sedang berupaya merumuskan kebijakan tentang gaji, tunjangan dan fasilitas PNS. Sementara untuk itu diperlukan peraturan tentang pangkat. Semuanya sekarang sedang dalam proses. Mungkin proses ini juga memperhitungkan 3T,\" jelasnya.\r\n\r\nKhusus PNS di wilayah 3T, direncanakan kenaikan gajinya sesuai dengan kriteria sehingga tidak berlaku untuk ASN secara keseluruhan. Adapun kriteria yang dimaksud untuk PNS 3T adalah dengan bidang pekerjaan yang kompleks, berisiko tinggi, jauh dari akses pembangunan, membutuhkan insentif dan motivasi.','Rencana Kenaikan Gaji PNS di 3T Perlu Restu Jokowi','news','990c90c5-3147-4281-b293-405d23f854fb_169.jpg'),(2,'2020-12-01','Jakarta - Zambia menjadi negara Afrika pertama yang gagal bayar utangnya sejak pandemi COVID-19. Hal itu memicu kekhawatiran munculnya tsunami utang di benua itu yang terdampak virus COVID-19.\r\nBulan Oktober lalu, negara Afrika Selatan itu telah melewatkan pembayaran kupon obligasinya yang senilai US$ 42,5 juta setara Rp 600,9 miliar (kurs Rp 14.141/US$). Lalu, Zambia kembali melewatkan tenggat bayar utang lainnya pada 14 November lalu. Dengan begitu Zambia resmi masuk jurang gagal bayar atau default teknis.\r\n\r\nMenteri keuangan Zambia, Bwalya Ng\'andu menyalahkan kegagalan itu kepada pihak bank-bank China serta manajer aset dan dana di negara itu. Sebab, mereka yang mengajukan lebih banyak transparansi kepada pemerintah terkait transaksi utang dengan China senilai US$ 3 miliar, tetapi menolak menandatangani perjanjian kerahasiaan yang diperlukan\r\n\r\n\"Posisi bank-bank China adalah \'Anda tidak akan memberi siapa pun informasi tanpa perjanjian kerahasiaan\',\" kata Ng\'andu dikutip dari Guardian, Sabtu (5/12/2020).\r\n\r\nDana Moneter Internasional (IMF) dan Bank Dunia menyebut tumpukan utang Zambia sudah terlampau banyak ketimbang kemampuan bayar mereka. Sebelum pandemi saja, Zambia sudah punya utang sebesar US$ 1,7 miliar untuk dilunasi tahun ini, setara dengan lebih dari 8% PDB negara itu untuk tahun 2020.\r\n\r\nAdanya pandemi COVID-19, kemudian memperparah kondisi keuangan negara itu, memainkan peran kunci dalam gagal bayar utang baru-baru ini. Melihat kondisi tersebut, IMF kemudian berencana mengunjungi negara tersebut untuk membahas potensi pinjaman US$ 1,3 miliar demi membantu Zambia menyelesaikan masalah gagal bayarnya tersebut.','Ngeri... Negara Ini Dihantui \'Tsunami Utang\' hingga Gagal Bayar','news','p.jpg'),(3,'2020-12-03','Jakarta - Kementerian Pendayagunaan Aparatur Negara dan Reformasi Birokrasi (PAN-RB) menyebut rencana kenaikan gaji pegawai negeri (PNS) di wilayah terdepan, terluar, tertinggal (3T) masih dalam kajian.\r\nDeputi Sumber Daya Manusia Aparatur Kementerian PAN-RB, Teguh Widjinarko mengatakan rencana tersebut sedang dikaji oleh Lembaga Administrasi Negara (LAN).\r\n\r\n\"Sebenarnya yang sedang mengkaji adalah Lembaga Administrasi Negara. Kami menunggu hasil kajian mereka,\" kata Teguh saat dihubungi detikcom, Jakarta, Sabtu (5/12/2020).\r\n\r\nDari hasil kajian LAN ini, dikatakan Teguh akan menjadi pertimbangan bagi pemerintah menentukan kenaikan gaji PNS atau tidak, khususnya yang berada di wilayah kerja 3T.\r\n\r\nLebih lanjut Teguh mengungkapkan, penetapan dari hasil kajian LAN ini juga nantinya tidak bisa diputuskan langsung oleh Kementerian PAN-RB melainkan dibahas bersama dengan Kementerian Keuangan, Kementerian Sekretariat Negara, dan Kementerian Hukum dan HAM.\r\n\r\n\"Masih kajian, hasilnya dapat menjadi pertimbangan untuk kebijakan,\" ungkap dia.','PNS di Wilayah 3T Mau Naik Gaji, PAN-RB: Masih Kajian','news','97abf534-cf0e-405d-9b4d-a56003e94e8f_169.jpg'),(4,'2020-12-01','\r\n\r\n4 Cara Pintar Mengelola Keuangan untuk Pemula ΓÇô Setiap orang pasti merasakan kesulitan dalam hal mengelola keuangan mereka. Terlebih lagi jika Anda masih awam dengan tips dan trik cara mengatur keuangan yang tepat.\r\n\r\nHal tersebut bisa memungkinkan setiap pendapatan yang Anda miliki selalu tidak mencukupi sampai akhir bulan dan itu sangat membuat Anda merasa kesal.\r\n\r\nBerdasarkan data riset dari Kadence Internasional pada 2015 mengungkap, sebesar 28% warga Indonesia punya gaya hidup konsumtif yang tidak sehat. Orang-orang ini memiliki pengeluaran yang lebih besar daripada pemasukan yang mereka terima.\r\n\r\nData tersebut juga menunjukkan bahwa, lebih dari 90% pemilik bisnis kecil tidak memiliki keuangan yang akurat, dapat diandalkan, dan mutakhir. Alasan yang kerap muncul adalah, mereka merasa mengatur keuangan memakan waktu, rumit, dan mahal.\r\n\r\nJika dilihat dari data tersebut, masih terdapat orang-orang, khususnya masyarakat di Indonesia yang belum paham cara mengatur keuangan yang tepat sehingga terciptanya pemasukan dan pengeluaran yang seimbang.\r\n\r\nNah, berikut ini KoinWorks akan memberikan 4 langkah awal yang bisa Anda terapkan cara mengelola keuangan untuk pemula.','4 Cara Pintar Mengelola Keuangan untuk Pemula','tips','catat-pemasukan-dan-pengeluaran-1024x683.jpg'),(5,'2020-12-02','Memenuhi semua kebutuhan dengan baik merupakan hal yang selalu diupayakan oleh setiap orang, tentunya termasuk Anda juga. Semua ini tentu tidak akan menjadi masalah, jika Anda sudah memiliki pekerjaan dan penghasilan yang memadai setiap bulannya. \r\nSelain itu, memiliki anggaran keuangan yang tepat juga tak kalah pentingnya. \r\nJangan sampai Anda selalu menghabiskan banyak uang dengan percuma, tanpa mendapatkan manfaat maksimal dari pembelanjaan yang Anda lakukan tersebut. \r\nPenting untuk selalu membelanjakan uang dengan bijak, bahkan meski Anda memiliki penghasilan yang besar setiap bulannya. Setiap pos pengeluaran Anda harus diatur dengan sedemikian rupa, agar kondisi keuangan tetap bisa berjalan dengan seimbang. \r\nBaca Juga: Kenali 10 Faktor yang Menghambat Seseorang Menjadi Kaya \r\nCara ini akan memungkinkan Anda mendapatkan kondisi keuangan yang tetap stabil dan berbagai kebutuhan bisa terpenuhi dengan baik.  \r\nBagaimanapun juga, masa depan keuangan Anda tentu selalu menjadi poin penting yang wajib disiapkan dengan baik, bukan? \r\nBerikut ini adalah beberapa langkah bijak versi Cermati.com yang bisa Anda lakukan, agar uang Anda bisa terpakai dengan tidak sia-sia: \r\n1. Membiayai pendidikan \r\nUntuk kebanyakan orang, menyelesaikan pendidikan tidak cukup hanya dengan kuliah dan menjadi sarjana saja. Pada dasarnya ada banyak hal yang bisa Anda pelajari di luar bangku kuliah, bahkan untuk berbagai pengetahuan yang tidak formal sekalipun. \r\nAnda bisa mengambil kelas bahasa untuk memperbarui kemampuan berbahasa asing Anda. Atau, mungkin kelas lainnya yang bisa meningkatkan kemampuan Anda di bidang tertentu.\r\n2. Traveling \r\nBanyak cara yang bisa Anda lakukan untuk menikmati kesuksesan, salah satunya dengan melakukan perjalanan wisata atau traveling.  \r\nAnda bisa menjadwalkan kegiatan ini secara berkala, agar Anda kembali fresh dan bisa menikmati waktu dengan cara yang berbeda. Saat Anda traveling, Anda tentu bisa menemukan tempat yang baru dan orang-orang baru di sana.\r\n3. Belajar musik \r\nMusik selalu menjadi hal menarik untuk semua orang, bahkan meski saat ini Anda tidak menguasai satupun alat musik dengan baik.  \r\nUntuk lebih mendalami musik, Anda bisa belajar menggunakan alat musik tertentu dan menikmati sesuatu yang baru di dalam hidup Anda. \r\nIni akan memberi Anda pengalaman yang berbeda, bahkan bisa mengasah kemampuan berpikir Anda dalam bidang yang satu ini. Jika perlu, Anda bahkan bisa belajar mengasah kemampuan olah vokal Anda pada orang yang profesional.\r\n4. Membeli buku\r\n5. Bersosialisasi dan membangun koneksi\r\n6. Berinvestasi','6 Hal yang Bisa Membuat Uang Terpakai dengan Tidak Sia-Sia','tips','tnqr8qnknkfbx5gbkfxo.jpg'),(6,'2020-12-01','Siapa yang selama ini mengatur keuangan keluarga Anda? Bila Anda yang jadi \'manajer\'-nya, sebaiknya, cek selalu untuk memastikan kondisi keuangan keluarga dalam keadaan sehat. Apalagi di tengah pandemi seperti sekarang ini. \r\nYa Moms, memeriksa secara berkala kondisi keuangan keluarga menjadi sesuatu hal yang harus dilakukan. Sebab jika ada masalah, artinya ada yang salah dengan pengaturan keuangan rumah tangga selama ini. \r\n\r\nTanda Masalah Keuangan #1: Tidak Tahu Uang Habis Ke Mana\r\n\r\nEcha mengatakan, banyak ibu yang merasa selama ini kondisi keuangan baik-baik saja, dan uangnya cukup untuk membeli kebutuhan sehari-hari. Tapi apakah Anda tahu ke mana saja uang tersebut dialokasikan? Jika tidak, kemungkinan ada masalah nih, Moms. \r\n\r\nTanda Masalah Keuangan #2: Utang Lebih Besar dari Pendapatan\r\n\r\nJika Anda sudah memasuki gejala menengah, sebaiknya Anda berhati-hati ya, Moms. Ciri-cirinya adalah keluarga Anda memiliki utang lebih dari pendapatan. Echa mengatakan, utang itu boleh, tapi dengan catatan tidak lebih dari 30 persen dari total pendapatan.\r\n\r\nTanda Masalah Keuangan #3: Gali Lubang Tutup Lubang\r\n\r\nYang terakhir adalah gejala atau tanda kategori berat. Jika Anda sudah memasuki fase ini, artinya Anda harus memutar otak untuk menyelesaikan permasalahan keuangan yang ada. Tandanya? Anda harus gali lubang tutup lubang alias selalu membayar utang dengan berutang lagi di tempat lain. ','3 Tanda Keuangan Keluarga Bermasalah','tips','aeaqsr0p0xxj9v7w7wtq.jpg');
/*!40000 ALTER TABLE `tnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlogin` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogin`
--

LOCK TABLES `userlogin` WRITE;
/*!40000 ALTER TABLE `userlogin` DISABLE KEYS */;
INSERT INTO `userlogin` VALUES (1,'shak@dskjfj','8b5b443d32fb1c77ad187f59a9a5325067f7d801'),(2,'suika@mail.com','7c4a8d09ca3762af61e59520943dc26494f8941b'),(3,'suika@mail.xom','7c4a8d09ca3762af61e59520943dc26494f8941b'),(4,'suik@mail.com','7c4a8d09ca3762af61e59520943dc26494f8941b'),(5,'sda@mail.com','7c4a8d09ca3762af61e59520943dc26494f8941b'),(6,'sh@mail.com','7c4a8d09ca3762af61e59520943dc26494f8941b');
/*!40000 ALTER TABLE `userlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `account`
--

/*!50001 DROP TABLE IF EXISTS `account`*/;
/*!50001 DROP VIEW IF EXISTS `account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `account` AS select `userlogin`.`id_user` AS `id_user`,`userlogin`.`email` AS `email`,`userlogin`.`password` AS `password`,`profile`.`nama` AS `nama`,`profile`.`phone` AS `phone`,`profile`.`pekerjaan` AS `pekerjaan` from (`userlogin` join `profile` on(`profile`.`id_user` = `userlogin`.`id_user`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-07 22:21:51
