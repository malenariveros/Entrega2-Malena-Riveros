DELIMITER //

CREATE TRIGGER actualizar_monto_total AFTER INSERT ON facturas_clientes
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(8,2);
    SET total = (SELECT round(sum(monto_total), 2) FROM facturas_clientes WHERE id_facturas = NEW.id_facturas);
    UPDATE facturas_clientes SET monto_total = total WHERE id_facturas = NEW.id_facturas;
END//

DELIMITER ;