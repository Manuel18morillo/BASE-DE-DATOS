CREATE DEFINER=`root`@`localhost` FUNCTION `fechaMayorVenta`() RETURNS date
    DETERMINISTIC
BEGIN
    DECLARE fecha DATE;
    SELECT fv.fecha INTO fecha
    FROM Factura_Venta fv
    WHERE fv.monto = (SELECT MAX(monto) FROM Factura_Venta);
    RETURN fecha;
END