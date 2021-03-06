BEGIN;

DROP TABLE IF EXISTS costumers_products CASCADE;

DROP TABLE IF EXISTS costumers CASCADE;
CREATE TABLE costumers
(
    id   serial PRIMARY KEY,
    name VARCHAR(255)
);
INSERT INTO costumers (name) VALUES ('Mike'), ('Jone'), ('Mary');


DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE products (
                          id serial PRIMARY KEY,
                          title VARCHAR(255),
                          price numeric(8, 2)
                      );

INSERT INTO products (title, price)
VALUES ('Ipad', 1250.00),
       ('Iphone', 1050.00),
       ('AirPods', 890.00),
       ('MacBookPro', 2500);


DROP TABLE IF EXISTS costumers_products CASCADE;
CREATE TABLE costumers_products (
                                    costumer_id int REFERENCES costumers (id) ON UPDATE CASCADE ON DELETE CASCADE,
                                    product_id int REFERENCES products (id) ON UPDATE CASCADE,
                                    CONSTRAINT costumers_products_pkey PRIMARY KEY (costumer_id, product_id)
);

COMMIT;