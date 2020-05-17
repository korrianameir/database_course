DROP TABLE IF EXISTS markets;
CREATE TABLE markets (
	id SERIAL,
	name varchar(255) DEFAULT NULL,
    admin_user_id BIGINT UNSIGNED DEFAULT NULL,

    INDEX markets_name_idx(name), 
	foreign key (admin_user_id) references users(id)
);

DROP TABLE IF EXISTS goods ;
CREATE TABLE goods (
	id SERIAL,
	name varchar(255) DEFAULT NULL,
	price BIGINT UNSIGNED NOT NULL
	market_id BIGINT UNSIGNED NOT NULL
    user_id BIGINT UNSIGNED DEFAULT NULL,

    INDEX goods_name_idx(name), 
	foreign key (user_id) references users(id)
	FOREIGN KEY (market_id) REFERENCES markets(id)
);

DROP TABLE IF EXISTS users_markets;
CREATE TABLE users_markets(
	user_id BIGINT UNSIGNED NOT NULL,
	market_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (user_id, market_id), 
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (market_id) REFERENCES markets(id)
);

DROP TABLE IF EXISTS markets_goods;
CREATE TABLE markets_goods(
	market_id BIGINT UNSIGNED NOT NULL,
	good_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (good_id, market_id,), 
    FOREIGN KEY (market_id) REFERENCES markets(id)
    FOREIGN KEY (good_id) REFERENCES goods(id)
);

