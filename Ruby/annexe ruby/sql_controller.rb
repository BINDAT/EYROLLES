EXEC SQL BEGIN DECLARE SECTION;
    int     id;
    float   amount;
EXEC SQL END DECLARE SECTION;
EXEC SQL DECLARE c1 AS CURSOR FOR
select id, amount from orders;
while(1) {
    float tax;
    EXEC SQL WHENEVER NOT FOUND DO break;
    EXEC SQL FETCH c1 INTO :id, :amount;
        tax = calc_sales_tax(amount);
    EXEC SQL UPDATE orders set tax = :tax where id = :id;
}
EXEC SQL CLOSE c1;
EXEC SQL COMMIT WORK;