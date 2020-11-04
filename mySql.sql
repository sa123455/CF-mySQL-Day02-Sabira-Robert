
'query from bus,driver,address,period table'
SELECT driver.driver_fname,driver.driver_lname,address.street,address.street_no,period.period_date,bus.lisenc
FROM driver
JOIN address
ON
driver.fk_address_id=address.address_id
JOIN period
ON
period.fk_driver_id=driver.driver_id
JOIN bus
ON
bus.bus_id=period.fk_bus_id