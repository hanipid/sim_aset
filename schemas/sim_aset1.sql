-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';

DROP TABLE IF EXISTS `akun`;
CREATE TABLE `akun` (
  `idak` int(11) NOT NULL AUTO_INCREMENT,
  `kdak` varchar(3) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`idak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aset_kategori`;
CREATE TABLE `aset_kategori` (
  `id_aset_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `akun_id` int(11) NOT NULL,
  `label` varchar(45) DEFAULT NULL,
  `bg` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_aset_kategori`),
  KEY `fk_aset_kategori_akun2_idx` (`akun_id`),
  CONSTRAINT `fk_aset_kategori_akun2` FOREIGN KEY (`akun_id`) REFERENCES `akun` (`idak`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `basic_settings`;
CREATE TABLE `basic_settings` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `site_name` text,
  `meta_title` text,
  `meta_description` text,
  `address` text,
  `phone_number` text,
  `email` text,
  `logo` text,
  `currency` int(11) DEFAULT NULL,
  `ss_speed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  CONSTRAINT `website_data_ibfk_2` FOREIGN KEY (`currency`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `type` int(1) unsigned NOT NULL COMMENT '0:all 1:post 2:product',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(58) DEFAULT NULL,
  `currency` varchar(65) DEFAULT NULL,
  `alphabetic_code` varchar(3) DEFAULT NULL,
  `numeric_code` int(11) DEFAULT NULL,
  `minor_unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `email_confirmations`;
CREATE TABLE `email_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` char(32) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `confirmed` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `failed_logins`;
CREATE TABLE `failed_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned DEFAULT NULL,
  `ipAddress` char(15) NOT NULL,
  `attempted` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `kd_kabkota`;
CREATE TABLE `kd_kabkota` (
  `id_kota` int(11) NOT NULL AUTO_INCREMENT,
  `provinsi_id` int(11) NOT NULL,
  `kode` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_kota`),
  KEY `fk_kabkota_provinsi_idx` (`provinsi_id`),
  CONSTRAINT `fk_kabkota_provinsi` FOREIGN KEY (`provinsi_id`) REFERENCES `kd_provinsi` (`id_provinsi`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `kd_kepemilikan`;
CREATE TABLE `kd_kepemilikan` (
  `id_kepemilikan` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_kepemilikan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `kd_komptabel`;
CREATE TABLE `kd_komptabel` (
  `id_komtabel` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_komtabel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `kd_kuasa`;
CREATE TABLE `kd_kuasa` (
  `id_kuasa` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_kuasa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `kd_pengguna`;
CREATE TABLE `kd_pengguna` (
  `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `kd_provinsi`;
CREATE TABLE `kd_provinsi` (
  `id_provinsi` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_provinsi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `kd_subkuasa`;
CREATE TABLE `kd_subkuasa` (
  `id_subkuasa` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_subkuasa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `menu_sidebar`;
CREATE TABLE `menu_sidebar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `profiles` varchar(100) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `password_changes`;
CREATE TABLE `password_changes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` text NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profilesId` int(10) unsigned NOT NULL,
  `resource` varchar(16) NOT NULL,
  `action` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` int(10) unsigned NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `currency` int(11) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `price2` bigint(20) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `images` longtext,
  `comment_status` varchar(5) NOT NULL DEFAULT 'open',
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `post_type` varchar(20) NOT NULL,
  `column_set` char(1) DEFAULT NULL,
  `published_at` datetime DEFAULT '0000-00-00 00:00:00',
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `category` (`category`),
  KEY `currency` (`currency`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`currency`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `remember_tokens`;
CREATE TABLE `remember_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `token` char(32) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `reset_passwords`;
CREATE TABLE `reset_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` varchar(48) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `reset` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `success_logins`;
CREATE TABLE `success_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `TABLE 6`;
CREATE TABLE `TABLE 6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `golongan` varchar(8) DEFAULT NULL,
  `bidang` varchar(6) DEFAULT NULL,
  `kelompok` varchar(8) DEFAULT NULL,
  `sub_kelompok` varchar(22) DEFAULT NULL,
  `sub_sub_kelompok` varchar(8) DEFAULT NULL,
  `uraian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tmp_kib_a`;
CREATE TABLE `tmp_kib_a` (
  `id_tmp_kib_a` int(11) NOT NULL AUTO_INCREMENT,
  `tmp_kontrak_id` int(11) NOT NULL,
  `akun_idak` int(11) NOT NULL,
  `luas` varchar(45) DEFAULT NULL,
  `letak` varchar(45) DEFAULT NULL,
  `sts_tanah` varchar(45) DEFAULT NULL,
  `tgl_sertifikat` varchar(45) DEFAULT NULL,
  `no_sertifikat` varchar(45) DEFAULT NULL,
  `penggunaan` text,
  `nilai_perolehan` float DEFAULT NULL,
  `nilai_realisasi` float DEFAULT NULL,
  `ket` text,
  PRIMARY KEY (`id_tmp_kib_a`),
  KEY `fk_tmp_kiba_tmp_kontrak1_idx` (`tmp_kontrak_id`),
  KEY `fk_tmp_kiba_akun1_idx` (`akun_idak`),
  CONSTRAINT `fk_tmp_kiba_akun1` FOREIGN KEY (`akun_idak`) REFERENCES `akun` (`idak`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tmp_kiba_tmp_kontrak1` FOREIGN KEY (`tmp_kontrak_id`) REFERENCES `tmp_kontrak` (`id_tmp_kontrak`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `tmp_kontrak`;
CREATE TABLE `tmp_kontrak` (
  `id_tmp_kontrak` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL,
  `no` varchar(45) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `nilai_kontrak` varchar(45) DEFAULT NULL,
  `dana` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tmp_kontrak`),
  KEY `fk_tmp_kontrak_users1_idx` (`users_id`),
  CONSTRAINT `fk_tmp_kontrak_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(60) NOT NULL,
  `mustChangePassword` char(1) DEFAULT NULL,
  `profilesId` int(10) unsigned NOT NULL,
  `banned` char(1) NOT NULL,
  `suspended` char(1) NOT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `data` text,
  `tanggal` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP VIEW IF EXISTS `v_kode_barang`;
CREATE TABLE `v_kode_barang` (`parent` int(11), `idak` int(11), `kdak` varchar(3), `level` bigint(20), `kode_level1` varchar(3), `kode_level2` varchar(3), `kode_level3` varchar(3), `kode_level4` varchar(3), `kode_level5` varchar(3), `kode_level6` varchar(3), `kode_level7` varchar(3), `nama` varchar(255), `kode` varchar(27));


DROP VIEW IF EXISTS `v_tmp_kib_a`;
CREATE TABLE `v_tmp_kib_a` (`id_tmp_kib_a` int(11), `tmp_kontrak_id` int(11), `akun_idak` int(11), `luas` varchar(45), `letak` varchar(45), `sts_tanah` varchar(45), `tgl_sertifikat` varchar(45), `no_sertifikat` varchar(45), `penggunaan` text, `nilai_perolehan` float, `ket` text, `kode_aset` varchar(27), `nama_aset` varchar(255));


DROP VIEW IF EXISTS `v_tmp_kontrak`;
CREATE TABLE `v_tmp_kontrak` (`id_tmp_kontrak` int(11), `users_id` int(10) unsigned, `no` varchar(45), `tgl` date, `nilai_kontrak` varchar(45), `dana` varchar(45), `jumlah_barang` bigint(21));


DROP TABLE IF EXISTS `v_kode_barang`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_kode_barang` AS select `t1`.`parent` AS `parent`,`t1`.`idak` AS `idak`,`t1`.`kdak` AS `kdak`,1 AS `level`,`t1`.`kdak` AS `kode_level1`,NULL AS `kode_level2`,NULL AS `kode_level3`,NULL AS `kode_level4`,NULL AS `kode_level5`,NULL AS `kode_level6`,NULL AS `kode_level7`,`t1`.`nama` AS `nama`,`t1`.`kdak` AS `kode` from `akun` `t1` where isnull(`t1`.`parent`) union all select `t2`.`parent` AS `parent`,`t2`.`idak` AS `idak`,`t2`.`kdak` AS `kdak`,2 AS `level`,`t1`.`kdak` AS `kode_level1`,`t2`.`kdak` AS `kode_level2`,NULL AS `kode_level3`,NULL AS `kode_level4`,NULL AS `kode_level5`,NULL AS `kode_level6`,NULL AS `kode_level7`,`t2`.`nama` AS `nama`,concat(`t1`.`kdak`,'.',`t2`.`kdak`) AS `kode` from (`akun` `t1` join `akun` `t2` on((`t2`.`parent` = `t1`.`idak`))) where isnull(`t1`.`parent`) union all select `t3`.`parent` AS `parent`,`t3`.`idak` AS `idak`,`t3`.`kdak` AS `kdak`,3 AS `level`,`t1`.`kdak` AS `kode_level1`,`t2`.`kdak` AS `kode_level2`,`t3`.`kdak` AS `kode_level3`,NULL AS `kode_level4`,NULL AS `kode_level5`,NULL AS `kode_level6`,NULL AS `kode_level7`,`t3`.`nama` AS `nama`,concat(`t1`.`kdak`,'.',`t2`.`kdak`,'.',`t3`.`kdak`) AS `kode` from ((`akun` `t1` join `akun` `t2` on((`t2`.`parent` = `t1`.`idak`))) join `akun` `t3` on((`t3`.`parent` = `t2`.`idak`))) where isnull(`t1`.`parent`) union all select `t4`.`parent` AS `parent`,`t4`.`idak` AS `idak`,`t4`.`kdak` AS `kdak`,4 AS `level`,`t1`.`kdak` AS `kode_level1`,`t2`.`kdak` AS `kode_level2`,`t3`.`kdak` AS `kode_level3`,`t4`.`kdak` AS `kode_level4`,NULL AS `kode_level5`,NULL AS `kode_level6`,NULL AS `kode_level7`,`t4`.`nama` AS `nama`,concat(`t1`.`kdak`,'.',`t2`.`kdak`,'.',`t3`.`kdak`,'.',`t4`.`kdak`) AS `kode` from (((`akun` `t1` join `akun` `t2` on((`t2`.`parent` = `t1`.`idak`))) join `akun` `t3` on((`t3`.`parent` = `t2`.`idak`))) join `akun` `t4` on((`t4`.`parent` = `t3`.`idak`))) where isnull(`t1`.`parent`) union all select `t5`.`parent` AS `parent`,`t5`.`idak` AS `idak`,`t5`.`kdak` AS `kdak`,5 AS `level`,`t1`.`kdak` AS `kode_level1`,`t2`.`kdak` AS `kode_level2`,`t3`.`kdak` AS `kode_level3`,`t4`.`kdak` AS `kode_level4`,`t5`.`kdak` AS `kode_level5`,NULL AS `kode_level6`,NULL AS `kode_level7`,`t5`.`nama` AS `nama`,concat(`t1`.`kdak`,'.',`t2`.`kdak`,'.',`t3`.`kdak`,'.',`t4`.`kdak`,'.',`t5`.`kdak`) AS `kode` from ((((`akun` `t1` join `akun` `t2` on((`t2`.`parent` = `t1`.`idak`))) join `akun` `t3` on((`t3`.`parent` = `t2`.`idak`))) join `akun` `t4` on((`t4`.`parent` = `t3`.`idak`))) join `akun` `t5` on((`t5`.`parent` = `t4`.`idak`))) where isnull(`t1`.`parent`) union all select `t6`.`parent` AS `parent`,`t6`.`idak` AS `idak`,`t6`.`kdak` AS `kdak`,6 AS `level`,`t1`.`kdak` AS `kode_level1`,`t2`.`kdak` AS `kode_level2`,`t3`.`kdak` AS `kode_level3`,`t4`.`kdak` AS `kode_level4`,`t5`.`kdak` AS `kode_level5`,`t6`.`kdak` AS `kode_level6`,NULL AS `kode_level7`,`t6`.`nama` AS `nama`,concat(`t1`.`kdak`,'.',`t2`.`kdak`,'.',`t3`.`kdak`,'.',`t4`.`kdak`,'.',`t5`.`kdak`,'.',`t6`.`kdak`) AS `kode` from (((((`akun` `t1` join `akun` `t2` on((`t2`.`parent` = `t1`.`idak`))) join `akun` `t3` on((`t3`.`parent` = `t2`.`idak`))) join `akun` `t4` on((`t4`.`parent` = `t3`.`idak`))) join `akun` `t5` on((`t5`.`parent` = `t4`.`idak`))) join `akun` `t6` on((`t6`.`parent` = `t5`.`idak`))) where isnull(`t1`.`parent`) union all select `t7`.`parent` AS `parent`,`t7`.`idak` AS `idak`,`t7`.`kdak` AS `kdak`,7 AS `level`,`t1`.`kdak` AS `kode_level1`,`t2`.`kdak` AS `kode_level2`,`t3`.`kdak` AS `kode_level3`,`t4`.`kdak` AS `kode_level4`,`t5`.`kdak` AS `kode_level5`,`t6`.`kdak` AS `kode_level6`,`t7`.`kdak` AS `kode_level7`,`t7`.`nama` AS `nama`,concat(`t1`.`kdak`,'.',`t2`.`kdak`,'.',`t3`.`kdak`,'.',`t4`.`kdak`,'.',`t5`.`kdak`,'.',`t6`.`kdak`,'.',`t7`.`kdak`) AS `kode` from ((((((`akun` `t1` join `akun` `t2` on((`t2`.`parent` = `t1`.`idak`))) join `akun` `t3` on((`t3`.`parent` = `t2`.`idak`))) join `akun` `t4` on((`t4`.`parent` = `t3`.`idak`))) join `akun` `t5` on((`t5`.`parent` = `t4`.`idak`))) join `akun` `t6` on((`t6`.`parent` = `t5`.`idak`))) join `akun` `t7` on((`t7`.`parent` = `t6`.`idak`))) where isnull(`t1`.`parent`) order by `kode`;

DROP TABLE IF EXISTS `v_tmp_kib_a`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_tmp_kib_a` AS select `tka`.`id_tmp_kib_a` AS `id_tmp_kib_a`,`tka`.`tmp_kontrak_id` AS `tmp_kontrak_id`,`tka`.`akun_idak` AS `akun_idak`,`tka`.`luas` AS `luas`,`tka`.`letak` AS `letak`,`tka`.`sts_tanah` AS `sts_tanah`,`tka`.`tgl_sertifikat` AS `tgl_sertifikat`,`tka`.`no_sertifikat` AS `no_sertifikat`,`tka`.`penggunaan` AS `penggunaan`,`tka`.`nilai_perolehan` AS `nilai_perolehan`,`tka`.`ket` AS `ket`,(select `vkb`.`kode` from `v_kode_barang` `vkb` where (`vkb`.`idak` = `tka`.`akun_idak`)) AS `kode_aset`,(select `vkb`.`nama` from `v_kode_barang` `vkb` where (`vkb`.`idak` = `tka`.`akun_idak`)) AS `nama_aset` from `tmp_kib_a` `tka` limit 50;

DROP TABLE IF EXISTS `v_tmp_kontrak`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_tmp_kontrak` AS select `tk`.`id_tmp_kontrak` AS `id_tmp_kontrak`,`tk`.`users_id` AS `users_id`,`tk`.`no` AS `no`,`tk`.`tgl` AS `tgl`,`tk`.`nilai_kontrak` AS `nilai_kontrak`,`tk`.`dana` AS `dana`,(select count(0) from `tmp_kib_a` `tka` where (`tka`.`tmp_kontrak_id` = `tk`.`id_tmp_kontrak`)) AS `jumlah_barang` from `tmp_kontrak` `tk` limit 50;

-- 2019-01-05 04:18:27
