-- write a query that displays the restaurant name, its address (street number and name) and telephone number
SELECT restaurant.name AS name, 
CONCAT(address.street_number, ' ', address.street_name) AS address, 
restaurant.telephone AS phone_number
FROM restaurant, address;

-- write a query to get the best rating the restaurant ever received and display the rating as best_rating.
SELECT MAX(rating) AS best_rating,
FROM review;
-- if you want to display more columns
SELECT rating, description, date
FROM review
WHERE rating = (SELECT MAX(rating) FROM review);

-- write a query to display a dish name, its price and category sorted by the dish name
SELECT dish.name AS dish_name, categories_dishes.price AS price, category.name AS category
FROM dish
JOIN categories_dishes ON dish.id = categories_dishes.dish_id
JOIN category ON category.id = categories_dishes.category_id
ORDER BY 1;

-- write a query to display the category, dish name and price, sorted by category name
SELECT category.name AS category, dish.name AS dish_name, categories_dishes.price AS price
FROM category
JOIN categories_dishes ON category.id = categories_dishes.category_id
JOIN dish ON dish.id = categories_dishes.dish_id
ORDER BY 1;

--  write a query that displays all the spicy dishes, their prices and category
SELECT dish.name AS spicy_dish_name, category.name AS category, categories_dishes.price AS price
FROM dish
JOIN categories_dishes ON dish.id = categories_dishes.dish_id
JOIN category ON category.id = categories_dishes.category_id
WHERE dish.hot_and_spicy = TRUE
ORDER BY 1;

-- write a query that displays the dish_id and COUNT(dish_id) as dish_count from the categories_dishes table
SELECT dish_id, COUNT(dish_id) AS dish_count
FROM categories_dishes
GROUP BY dish_id;

-- adjust the previous query to display only the dish(es) from the categories_dishes table which appears more than once
SELECT dish_id, COUNT(dish_id) AS dish_count
FROM categories_dishes
GROUP BY dish_id
HAVING COUNT(dish_id) > 1;

-- write a query which to display the name(s) of the dish that appears more than once in the categories_dishes table
SELECT dish.name AS dish_name, COUNT(categories_dishes.dish_id) AS dish_count
FROM categories_dishes
JOIN dish ON dish.id = categories_dishes.dish_id
GROUP BY dish.name
HAVING COUNT(categories_dishes.dish_id) > 1;

-- or like this using the old syntax
SELECT dish.name AS dish_name, COUNT(categories_dishes.dish_id)
FROM dish, categories_dishes
GROUP BY dish.name, dish.id, categories_dishes.dish_id
HAVING COUNT(categories_dishes.dish_id) > 1 AND dish.id = categories_dishes.dish_id;

-- write a query that displays the best rating as best_rating and the description
SELECT rating AS best_rating, description
FROM review
WHERE rating = (SELECT MAX(rating) FROM review);