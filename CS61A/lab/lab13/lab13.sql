.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT a.color, a.pet, b.song FROM bluedog AS a, students AS b WHERE a.color = b.color AND a.pet = b.pet;


CREATE TABLE smallest_int_having AS
  SELECT a.time, a.smallest FROM students as a GROUP BY smallest having count(*) = 1;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students AS a, students AS b 
    WHERE a.pet = b.pet AND a.song = b.song AND a.time < b.time ;

CREATE TABLE sevens AS
  SELECT a.seven FROM students AS a, numbers AS b 
    WHERE a.time = b.time AND (a.number = 7 AND b.'7' = 'True');


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) FROM inventory
    GROUP BY item;

CREATE TABLE shopping_list AS
  SELECT a.name, b.store FROM products AS a, lowest_prices AS b
    WHERE a.name = b.item GROUP BY a.category HAVING MIN(a.MSRP/a.rating);

CREATE TABLE total_bandwidth AS
  SELECT SUM(Mbs) FROM shopping_list AS a, stores AS b WHERE a.store = b.store;

