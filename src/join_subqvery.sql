--Бардык клиенттердин шаарлары уникалдуу чыксын
SELECT DISTINCT city FROM customers;

-- Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
SELECT name FROM entrepreneurs WHERE year_of_birth BETWEEN 1950 AND 1960;

--Франциялык поставщиктердин аттары жана мамлекети чыксын
SELECT name, country FROM suppliers WHERE country = 'France';

-- Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
SELECT name, address, country FROM clients WHERE country LIKE 'a%' AND country <> 'Spain';

-- PostalCode бош болгон клиенттер чыксын
SELECT * FROM customers WHERE postalcode IS NULL;

-- Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
SELECT * FROM clients WHERE city = 'London' LIMIT 2;

-- Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
SELECT name, year_of_birth FROM entrepreneurs WHERE LENGTH(surname) = 4;

-- Ар бир олкодо канчадан поставщик бар экенин чыгаргыла

SELECT country, COUNT(*) AS supplier_count FROM suppliers GROUP BY country;

-- Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
SELECT country FROM suppliers GROUP BY country HAVING COUNT(*) = 1 ORDER BY country;

-- Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
SELECT category_id, COUNT(*) AS total_products FROM products GROUP BY category_id;

-- 6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
SELECT name, MIN(price) AS lowest_price FROM products WHERE category_id IN (6, 8) GROUP BY name;

-- Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
SELECT products.name AS product_name, supplier.name AS supplier_name FROM products p JOIN suppliers s ON products.supplier_id = supplier.id ORDER BY product_name, supplier_name;

--Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
SELECT supplier.name AS supplier_name, COUNT(products.id) AS product_count FROM suppliers s JOIN products p ON s.id = products.supplier_id GROUP BY supplier.name ORDER BY product_count DESC;

-- Клиенттердин аты CustomerName деп, ага саткан ишкерлердин аты жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
SELECT c.name AS customer_name, s.name AS seller_name, d.service_name FROM customers c JOIN sellers s ON c.seller_id = s.id JOIN delivery_services d ON c.delivery_service_id = d.id WHERE c.name = 'Customer Name';

-- Кайсы ишкер канча клиент обслуживайтеткен чыксын
SELECT e.name AS entrepreneur_name, COUNT(c.id) AS client_count FROM entrepreneurs e JOIN clients c ON e.id = c.entrepreneur_id GROUP BY e.name;