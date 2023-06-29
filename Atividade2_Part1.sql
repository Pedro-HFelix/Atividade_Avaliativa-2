use classicmodels;
-- Questão 1 A)
select
    p.productName NomeProduto,
    sum(p.quantityInStock) QuantidadeProdutos,
    sum(p.quantityInStock*buyPrice) ValorQuantProdutos
from 
	products p 
group by 
	p.productName
having
	QuantidadeProdutos < 200 
and 
	ValorQuantProdutos > 40000.00;
-- select * from products;
-- B)
SELECT
    employees.employeeNumber,
    COUNT(DISTINCT payments.customerNumber) AS quantidade_clientes,
    SUM(payments.amount) AS total_pagamentos
FROM
    payments
RIGHT JOIN
    customers ON customers.customerNumber = payments.customerNumber
RIGHT JOIN
    employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
GROUP BY
    employees.employeeNumber
HAVING
quantidade_clientes > 20 and total_pagamentos > 60000.00;
-- C)
SELECT
    e.employeeNumber AS NumeroVendedor,
    COUNT(DISTINCT p.customerNumber) AS quantidade_clientes,
    SUM(p.amount) AS total_pagamentos
FROM
    payments p
RIGHT JOIN
    customers c ON c.customerNumber = p.customerNumber
RIGHT JOIN
    employees e ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE
    YEAR(p.paymentDate) = 2003
    AND MONTH(p.paymentDate) BETWEEN 1 AND 6
GROUP BY
    e.employeeNumber
HAVING
    COUNT(DISTINCT p.customerNumber) >= 3
    AND SUM(p.amount) > 40000.00

UNION

SELECT
    e.employeeNumber AS NumeroVendedor,
    COUNT(DISTINCT p.customerNumber) AS quantidade_clientes,
    SUM(p.amount) AS total_pagamentos
FROM
    payments p
LEFT JOIN
    customers c ON c.customerNumber = p.customerNumber
LEFT JOIN
    employees e ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE
    YEAR(p.paymentDate) = 2004
    AND MONTH(p.paymentDate) BETWEEN 7 AND 12
GROUP BY
    e.employeeNumber
HAVING
    COUNT(DISTINCT p.customerNumber) >= 9
    AND SUM(p.amount) > 40000.00;
    
