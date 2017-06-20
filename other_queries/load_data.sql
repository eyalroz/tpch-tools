START TRANSACTION
COPY INTO region    from 'gregion.tbl'   USING DELIMITERS '|', '|\n';
COPY INTO nation    from 'gnation.tbl'   USING DELIMITERS '|', '|\n';
COPY INTO supplier  from 'gsupplier.tbl' USING DELIMITERS '|', '|\n';
COPY INTO customer  from 'gcustomer.tbl' USING DELIMITERS '|', '|\n';
COPY INTO part      from 'gpart.tbl'     USING DELIMITERS '|', '|\n';
COPY INTO partsupp  from 'gpartsupp.tbl' USING DELIMITERS '|', '|\n';
COPY INTO orders    from 'gorders.tbl'   USING DELIMITERS '|', '|\n';
COPY INTO lineitem  from 'glineitem.tbl' USING DELIMITERS '|', '|\n';
COMMIT;

