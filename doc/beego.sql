/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.7.19-log : Database - beego
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`beego` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `beego`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `client` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`name`,`client`,`url`,`notes`) values 
(7,'百度1111','ios','北京','没有');

/*Table structure for table `group` */

DROP TABLE IF EXISTS `group`;

CREATE TABLE `group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '2',
  `sort` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `group` */

insert  into `group`(`id`,`name`,`title`,`status`,`sort`) values 
(1,'APP','System',2,1);

/*Table structure for table `node` */

DROP TABLE IF EXISTS `node`;

CREATE TABLE `node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '1',
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `node` */

insert  into `node`(`id`,`title`,`name`,`level`,`pid`,`remark`,`status`,`group_id`) values 
(1,'系统管理','rbac',1,0,'',2,1),
(2,'节点管理','node/index',2,1,'',2,1),
(3,'node list','index',3,2,'',2,1),
(4,'add or edit','AddAndEdit',3,2,'',2,1),
(5,'del node','DelNode',3,2,'',2,1),
(6,'用户管理','user/index',2,1,'',2,1),
(7,'user list','Index',3,6,'',2,1),
(8,'add user','AddUser',3,6,'',2,1),
(9,'update user','UpdateUser',3,6,'',2,1),
(10,'del user','DelUser',3,6,'',2,1),
(11,'分组管理','group/index',2,1,'',2,1),
(12,'group list','index',3,11,'',2,1),
(13,'add group','AddGroup',3,11,'',2,1),
(14,'update group','UpdateGroup',3,11,'',2,1),
(15,'del group','DelGroup',3,11,'',2,1),
(16,'角色管理','role/index',2,1,'',2,1),
(17,'role list','index',3,16,'',2,1),
(18,'add or edit','AddAndEdit',3,16,'',2,1),
(19,'del role','DelRole',3,16,'',2,1),
(20,'get roles','Getlist',3,16,'',2,1),
(21,'show access','AccessToNode',3,16,'',2,1),
(22,'add accsee','AddAccess',3,16,'',2,1),
(23,'show role to userlist','RoleToUserList',3,16,'',2,1),
(24,'add role to user','AddRoleToUser',3,16,'',2,1);

/*Table structure for table `node_roles` */

DROP TABLE IF EXISTS `node_roles`;

CREATE TABLE `node_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `node_roles` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`title`,`name`,`remark`,`status`) values 
(1,'Admin role','Admin','I\'m a admin role',2);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `nickname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL DEFAULT '',
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '2',
  `lastlogintime` datetime DEFAULT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`nickname`,`email`,`remark`,`status`,`lastlogintime`,`createtime`) values 
(1,'admin','21232f297a57a5a743894a0e4a801fc3','ClownFish','osgochina@gmail.com','I\'m admin',2,NULL,'2017-08-17 03:18:22');

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_roles` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
