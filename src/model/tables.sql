drop table if exists favourite_goods;
drop table if exists favourite_shops;
drop table if exists orders;
drop table if exists statuses;
drop table if exists goods;
drop table if exists categories;
drop table if exists shops;
drop table if exists authorities;
drop table if exists users;
drop table if exists dormitories;



CREATE TABLE dormitories
(
    id      BIGSERIAL PRIMARY KEY,
    name    VARCHAR(50)  NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE users
(
    id         BIGSERIAL PRIMARY KEY,
    password   VARCHAR(50) NOT NULL,
    enabled    BOOLEAN     NOT NULL,
    email VARCHAR(40) UNIQUE NOT NULL,

    first_name VARCHAR(20) NOT NULL,
    last_name  VARCHAR(20) NOT NULL,
    dormitory  bigint references dormitories (id)
);

CREATE TABLE authorities
(
    id        BIGINT      NOT NULL,
    authority VARCHAR(50) NOT NULL,
    CONSTRAINT fk_authorities_users FOREIGN KEY (id) REFERENCES users (id)
);

CREATE UNIQUE INDEX ix_auth_username ON authorities (id, authority);

CREATE TABLE shops
(
    id        BIGSERIAL PRIMARY KEY,
    name      VARCHAR(50)   NOT NULL,
    owner_id  BIGINT REFERENCES users (id),
    dormitory BIGINT REFERENCES dormitories (id),
    info      VARCHAR(1000) NOT NULL
);

CREATE TABLE categories
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE goods
(
    id       BIGSERIAL PRIMARY KEY,
    name     VARCHAR(50)   NOT NULL,
    price    NUMERIC(7, 2) NOT NULL,
    info     VARCHAR(1000) DEFAULT '',
    shop_id  BIGINT REFERENCES shops (id),
    category BIGINT REFERENCES categories (id)
);

CREATE TABLE statuses
(
    id   SMALLSERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE orders
(
    id      BIGSERIAL PRIMARY KEY,
    date    timestamp NOT NULL,
    user_id BIGINT REFERENCES users (id),
    good_id BIGINT REFERENCES goods (id),
    status  SMALLINT REFERENCES statuses (id)
);

CREATE TABLE favourite_goods
(
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users (id),
    good_id BIGINT REFERENCES goods (id)
);

CREATE TABLE favourite_shops
(
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users (id),
    shop_id BIGINT REFERENCES shops (id)
);
