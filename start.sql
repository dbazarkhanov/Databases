CREATE TABLE customers (
    id int NOT NULL PRIMARY KEY,
    full_name varchar(50) NOT NULL ,
    timestamp timestamp NOT NULL ,
    delivery_address text NOT NULL
);

CREATE TABLE orders (
    code int NOT NULL PRIMARY KEY,
    customer_id int references customers,
    total_sum double precision NOT NULL ,
    is_paid boolean NOT NULL
);

CREATE TABLE products (
    id varchar NOT NULL PRIMARY KEY,
    name varchar NOT NULL UNIQUE ,
    description text,
    price double precision NOT NULL
);

CREATE TABLE order_items (
    order_code int NOT NULL references orders,
    product_id varchar NOT NULL references products,
    quantity int NOT NULL,
    PRIMARY KEY (order_code, product_id)
);

INSERT INTO order_items VALUES (1, 'A1', 3);
UPDATE order_items SET quantity = 10 WHERE order_code = 1;
DELETE FROM order_items WHERE order_code = 1;