-- tables with the appropriate columns and primary keys
CREATE TABLE restaurant (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(200),
    rating DECIMAL,
    telephone CHAR(10),
    hours VARCHAR(100)
);

CREATE TABLE address (
    id INTEGER PRIMARY KEY,
    street VARCHAR(200),
    city VARCHAR(20),
    state VARCHAR(15),
    google_map_link VARCHAR(50),
    -- a one-to-one relationship with restaurant
    rest_id INTEGER REFERENCES restaurant(id) UNIQUE
);

CREATE TABLE category (
    id CHAR(2) PRIMARY KEY,
    name VARCHAR(20),
    description TEXT
);

CREATE TABLE dish (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(200),
    hot_and_spicy BOOLEAN
);

CREATE TABLE review (
    id INTEGER PRIMARY KEY,
    rating DECIMAL,
    description VARCHAR(200),
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    -- a one-to-many relationship with restaurant
    rest_id INTEGER REFERENCES restaurant(id)
);

CREATE TABLE categories_dishes (
    -- a many-to-many relationship between categories and dishes 
    -- a third cross-reference table is required
    -- two foreign keys referencing the primary keys of the member tables
    category_id CHAR(2) REFERENCES category(id),
    dish_id INTEGER REFERENCES dish(id),
    price MONEY,
    -- a composite primary key from the foreign keys
    PRIMARY KEY (category_id, dish_id)
);

-- queries to validate that primary keys exist for these tables
SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'restaurant';

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'address';

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'category';

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'dish';

SELECT constraint_name, table_name, column_name
FROM information_schema.key_column_usage
WHERE table_name = 'review';