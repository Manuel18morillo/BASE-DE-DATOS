CREATE DEFINER=`root`@`localhost` FUNCTION `totalVentasCiudad`(nombre_ciudad VARCHAR(50)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(fv.monto) INTO total
    FROM Ciudad ci
    JOIN Clientes cl ON ci.id = cl.id_ciudad
    JOIN Factura_Venta fv ON cl.id = fv.id_cliente
    WHERE ci.nombre = nombre_ciudad;
    RETURN total;
END