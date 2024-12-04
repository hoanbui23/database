
-- 
RENAME TABLE user_rename TO users; 

-- Buổi 2 

-- Ràng buộc

--Not Null
CREATE TABLE not_null ( 
 id INT NOT NULL,
 age INT
)

-- Unique
CREATE TABLE `UNIQUE` ( 
id INT UNIQUE
)

-- defaultID 
CREATE TABLE `default` (
	id INT NOT NULL UNIQUE,
	role VARCHAR(255) DEFAULT 'ROLE_USER',
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

-- khoá Chính 
CREATE TABLE primary_key( 
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255)
)

-- Khoá Phụ
 
CREATE TABLE foreign_key ( 
id BIGINT PRIMARY KEY AUTO_INCREMENT,
userId BIGINT ,
FOREIGN KEY(userId) REFERENCES primary_key(id)
)


-- Thêm dữ liệu vào bảng 
INSERT users(uses_id,full_name,age,birth_day,is_active) VALUES
(2,'Hao Hao',25,'1999-12-2',TRUE ),
(3,'Hao Hung',25,'1999-12-2',TRUE ),
(4,'Hao hien',25,'1999-12-2',TRUE )


-- update dữ liệu
UPDATE users
set full_name = 'BAO Bao'
WHERE uses_id = 2


-- DELETE
DELETE FROM users 
WHERE uses_id = 1


-- Truy Vấn
SELECT * FROM users

CREATE DATABASE db_app_food 

CREATE TABLE users ( 
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name  VARCHAR(255),
	email VARCHAR(255),
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	pass_word VARCHAR(255)
)

-- limit
SELECT * FROM
LIMIT 2

CREATE TABLE product ( 
	id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(255),
	price INT ,
	color VARCHAR(255),
	discount INT,
	is_active BOOLEAN
)


CREATE table buy_product(
id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT ,
product_id INT ,
price INT ,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (product_id) REFERENCES product(id)
)


CREATE TABLE food ( 
food_id  INT PRIMARY KEY AUTO_INCREMENT,
food_name VARCHAR(255),
image VARCHAR(255),
price INT ,
descs VARCHAR(255),
type_id INT ,
FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)

CREATE TABLE sub_food(
sub_id INT PRIMARY KEY AUTO_INCREMENT,
sub_name VARCHAR(255),
sub_price FLOAT,
food_id INT,
FOREIGN KEY(food_id) REFERENCES food(food_id)
)


CREATE TABLE food_type (
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR(255)
)

CREATE TABLE orders (
user_id INT ,
food_id INT ,
amount INT,
code VARCHAR(255) ,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (food_id) REFERENCES food(food_id)
) 


-- Inner Join
	SELECT * FROM  orders 
	INNER JOIN users ON 
	orders.user_id = users.user_id
	WHERE users.email ='hoanbui247@gmail.com' AND orders.food_id = '1'
--Left Join 
-- Trả về kết quả giống nhau  của 2 bảng bao gồm tất cả dữ liêuh bên bảng trái
	SELECT * FROM  users
	LEFT JOIN orders  ON 
	orders.user_id = users.user_id
	
-- Right Join
	SELECT * FROM  users
	RIGHT JOIN orders  ON 
	orders.user_id = users.user_id
	
	--
		SELECT * FROM  orders
	RIGHT JOIN users  ON 
	orders.user_id = users.user_id
	
	--Cross Join
	
	SELECT * FROM orders 
	CROSS JOIN users
	
	--GROUP BY --ORDERBY ( Nhóm những hàng có cùng giá trị lại với nhau)
	--- Thường kết hợp COUNT , SUM,MIN,MAX
	
	SELECT users.user_id, users.email, users.full_name FROM  orders 
	INNER JOIN users ON 
	orders.user_id = users.user_id
	GROUP BY users.user_id
	
	--ORDER BY : Sắp xếp từ lớn đến bé và sắp sếp từ bé đến lớn
	-- tăng dần ASC , 
	--Giảm dần DESC
	SELECT users.user_id, users.email, users.full_name FROM  orders 
	INNER JOIN users ON 
	orders.user_id = users.user_id
	GROUP BY users.user_id
	

	
	CREATE TABLE restaurants ( 
	res_id INT PRIMARY KEY AUTO_INCREMENT ,
	res_name VARCHAR(255),
	imgae VARCHAR(255),
	decs VARCHAR(255)
	)
	
		
	CREATE TABLE rate_res ( 
	user_id INT,
	res_id INT,
	amount INT,
	date_rate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id)
)	
	
	CREATE TABLE like_res ( 
	user_id INT,
	res_id INT,
	date_like TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id)
)	
	
	
		
	
	-- Bài tập
	
	-- Bài 1 : Tìm 5 user Like nhà hàng nhiều nhất
	SELECT users.user_id,users.full_name, users.email,users.pass_word  ,COUNT(like_res.user_id) AS total_like   FROM users
	INNER JOIN like_res ON 
	users.user_id = like_res.user_id 
	GROUP BY users.user_id
	ORDER BY   
    total_like DESC
    LIMIT 5;
    
    -- Tìm 2 nhà hàng có lượng like nhiều nhất 
    SELECT like_res.res_id, COUNT(like_res.res_id) as total_like  FROM like_res
    INNER JOIN restaurants ON
    like_res.res_id = restaurants.res_id
    GROUP BY restaurants.res_id
    ORDER BY   
    total_like DESC
    LIMIT 2;
    
    -- Tìm Người đã đặt nhiều nhất 
    SELECT users.user_id ,COUNT(users.user_id) AS total_order FROM users 
   	INNER JOIN orders ON 
   	users.user_id = orders.user_id 
   	GROUP BY users.user_id 
   	ORDER BY   
   	total_order DESC
   	LIMIT 1
   	    -- Tìm Người đã đặt nhiều nhất 
   	
   	
   	
   	
    
    
    
    
    
    
   
	
	
	
	
	
	

