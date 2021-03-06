/*用户表*/
DROP TABLE IF EXISTS user;
CREATE TABLE user(
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
)ENGINE =InnoDB DEFAULT CHARACTER SET utf8;

/*分类表*/
DROP TABLE IF EXISTS category;
CREATE TABLE category(
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
)ENGINE =InnoDB DEFAULT CHARACTER SET utf8;

/*属性表*/
DROP TABLE IF EXISTS property;
CREATE TABLE property(
  id INT(11) NOT NULL AUTO_INCREMENT,
  cid INT(11) DEFAULT NULL,
  name VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_property_category FOREIGN KEY (cid) REFERENCES category(id)
)ENGINE =InnoDB DEFAULT CHARACTER SET utf8;

/*产品表*/
DROP TABLE IF EXISTS product;
CREATE TABLE product(
  id INT(11) NOT NULL AUTO_INCREMENT,
  cid INT(11) DEFAULT NULL,
  name VARCHAR(255) DEFAULT NULL,
  subTitle VARCHAR(255) DEFAULT NULL,
  orignalPrice VARCHAR(255) DEFAULT NULL,
  promotePrice VARCHAR(255) DEFAULT NULL,
  stock INT(11) DEFAULT NULL,
  createDate DATETIME NULL,
  PRIMARY KEY(id),
  CONSTRAINT fk_product_category  FOREIGN KEY (cid) REFERENCES category(id)
)ENGINE =InnoDB DEFAULT CHARACTER SET utf8;

/*评价表*/
DROP TABLE IF EXISTS review;
CREATE TABLE review(
  id INT(11) NOT NULL AUTO_INCREMENT,
  uid INT(11) DEFAULT NULL,
  pid INT(11) DEFAULT NULL,
  content VARCHAR(255) DEFAULT NULL,
  createDate DATETIME DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_review_product FOREIGN KEY (pid) REFERENCES product(id),
  CONSTRAINT fk_review_user FOREIGN KEY (uid) REFERENCES user(id)
)ENGINE =InnoDB DEFAULT CHARACTER SET utf8;

/*订单表*/
DROP TABLE IF EXISTS order_;
CREATE TABLE order_(
  id INT(11) NOT NULL AUTO_INCREMENT,
  uid INT(11) DEFAULT NULL,
  orderCode VARCHAR(255) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  post VARCHAR(255) DEFAULT NULL,
  receiver VARCHAR(255) DEFAULT NULL,
  mobile VARCHAR(255) DEFAULT NULL,
  userMessage VARCHAR(255) DEFAULT NULL,
  createDate DATETIME DEFAULT NULL,
  payDate DATETIME DEFAULT NULL,
  deliveryDate DATETIME DEFAULT NULL,
  confirmDate DATETIME DEFAULT NULL,
  status VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_order_user FOREIGN KEY (uid) REFERENCES user (id)
)ENGINE =InnoDB DEFAULT CHARACTER SET utf8;

/*订单项表*/
DROP TABLE IF EXISTS orderitem;
CREATE TABLE orderitem(
  id INT(11) NOT NULL AUTO_INCREMENT,
  pid INT(11) DEFAULT NULL,
  oid INT(11) DEFAULT NULL,
  uid INT(11) DEFAULT NULL,
  number INT(11) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_orderitem_pid FOREIGN KEY (pid) REFERENCES product(id),
  CONSTRAINT fk_orderitem_uid FOREIGN KEY (uid) REFERENCES user(id)
)ENGINE =InnoDB DEFAULT CHARACTER SET utf8;

