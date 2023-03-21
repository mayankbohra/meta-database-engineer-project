SELECT c.customer_id AS CustomerID,
       c.name AS FullName,
       o.order_id AS OrderID,
       o.total_cost AS Cost,
       m.name AS MenuName,
       mi.course AS CourseName,
       mi.starter AS StarterName
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN menus AS m
    ON o.menu_id = m.menu_id
JOIN menucontent AS mc
    ON m.menu_id = mc.menu_id
JOIN menuitems AS mi
    ON mc.menu_item_id = mi.menu_item_id
WHERE o.total_cost > 150;
