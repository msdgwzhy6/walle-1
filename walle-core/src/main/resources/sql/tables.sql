/**
 * 通过 docker 启动一个mysql数据库：
 * docker run --name mysql -p 13306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7.25
 * 设置root用户的密码为：root
 * 映射容器中的3306端口到本机的13306端口
 * 如果已有镜像，则直接启动一个容器：
 * docker run -p 13306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7.25
 */

/*
 * 安装 mycli 客户端：
 * brew update && brew install mycli
 */

/*
 * 使用 mycli 链接上 mysql：
 * 指令示例：
 * <ul>
 *  <li>mycli my_database</li>
 *  <li>mycli -u my_user -h my_host.com my_database</li>
 *  <li>mycli mysql://my_user@my_host.com:3306/my_database</li>
 * </ul>
 * 链接本地的一个 mysql 库，用户名：root
 * mycli -h localhost -u root -P 13306
 * 输入root密码：root
 */

/**
 * 连接上之后创建数据库 walle
 * create database walle character set 'utf8mb4';
 */




create database walle character set utf8mb4;

create table user (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0：否 1：是',
  `account` VARCHAR(100) NOT NULL COMMENT '登录账号',
  `password` VARCHAR(100) NOT NULL COMMENT '登录密码',
  `access_key` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '接口调用时使用的ak',
  `secret_key` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '接口调用时使用的sk',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';


create table group_board (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gmt_create` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '是否删除 0：否 1：是',
  `user_id` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '所属用户',
  `board_code` VARCHAR(100) NOT NULL COMMENT '模板编码',
  `board_name` VARCHAR(100) NOT NULL COMMENT '模板的名称',
  `message_type` VARCHAR(50) NOT NULL DEFAULT 'text' COMMENT '消息类型 text link markdown',
  `title` VARCHAR(200) DEFAULT NULL COMMENT '消息标题',
  `content` TEXT DEFAULT NULL COMMENT '消息正文',
  `at_all` TINYINT(4) DEFAULT '0' COMMENT '是否艾特所有人 0：否 1：是',
  `link_message_url` VARCHAR(500) DEFAULT NULL COMMENT 'link消息的跳转链接',
  `link_pic_url` VARCHAR(500) DEFAULT NULL COMMENT 'link消息的配图链接',
  `address_list` TEXT NOT NULL COMMENT '消息的接收者列表，JSONArray格式',
  PRIMARY KEY (`id`),
  KEY `idx_board_code` (`board_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='需要发送的群消息模板';



