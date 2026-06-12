--seleccionar los clientes que viven en eeuu.
use Northwind
select * from Customers
where country = 'USA' 

-- SELECCIONAR LOS PROVEEDORES QUE VIVEN EN LA CIUDAD DE BERLIN
select * from Suppliers
where City = 'Berlin'

-- seleccionar los empleados con código 3,5 y 8
select * from Employees 
where EmployeeID in (3,5,8)

-- seleccionar los productos que tienen stock mayor que cero
-- y son del proveedor 1,3 y 5
select * from Products as P
where P.UnitsInStock > 0 and p.SupplierID in (1,3,5)
-- seleccionar los productos con precio mayor o igual a 20 o menor igual a 90
select * from Products
where UnitPrice between 20 and 90

-- mostrar ordenes de compra entre las fechas  01/01/1977 al 15/07/1977

select * from Orders
where OrderDate between '01/01/1977' and '15/07/1977'

--mostrar las ordenes de compra  hechas en el año 1997,
--que pertenecen a los empleados 1,3,4,8
SELECT *
FROM Orders
WHERE YEAR(OrderDate) = 1997
  AND EmployeeID IN (1, 3, 4, 8);

  -- MOSTRAR TODAS LAS ORDENES HECHAS EL PRIMERO DE TODOS LOS MESES
 SELECT *
FROM Orders
WHERE DAY(OrderDate) = 1
-- mostrar los clientes que tienen fax
SELECT *
FROM Customers
WHERE Fax IS NOT NULL
-- muestra todos los productos de la tabla 
-- products(ProductID, ProductName, UnitPrice) ordenados
-- de menor a mayor precio unitario (UnitPrice)
SELECT ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice ASC
/* necesitamos una lista de los empleados (Employees)
ordenada por su apellido (lastName) de forma alfabetica (a-z)
si hay empleados con  el mismo apellido,
ordenalos por su nombre (FirstName) de forma inversa*/
SELECT EmployeeID, LastName, FirstName
FROM Employees
ORDER BY LastName ASC, FirstName DESC;

/* el departamento de inventario quiere saber  cuales son los productos más caros de la empresa
muestra su nombre  y precio*/
select top 5 ProductName, UnitPrice from Products
order by UnitPrice desc

/* top con porcentajes 
enunciado: queremos premiar  a los clientes que más ordenes
han realizado. selecciona el 10% de los clientes(orders)
que tengan los fletes (freigth) más costosos*/

SELECT TOP 10 PERCENT *
FROM Orders
ORDER BY Freight DESC;
/* el caso de lo empates (with TIES)
ENUNCIADO: selecciona los 5 productos con menos unidades en stock
(unitsinstock). si el producto número 6 tiene la misma cantidad de stock que el número 5 ,
incluyendo también en el resultado*/
SELECT TOP 5 WITH TIES ProductID, ProductName, UnitsInStock
FROM Products
ORDER BY UnitsInStock ASC;
/* Si ejecutas la consulta SELECT TOP 5 ProductName FROM Products;
sin incluir una cláusula ORDER BY, ¿qué registros te devolverá el motor de la base de datos?

A.
Los 5 productos con el ProductID más bajo automáticamente.

B.
Los primeros 5 registros según el orden físico o arbitrario en
que la base de datos los procese.

C.
Una combinación de los 5 productos más caros y más baratos.

D.
Ninguno, la consulta arrojará un error de sintaxis por falta de ordenamiento.*/