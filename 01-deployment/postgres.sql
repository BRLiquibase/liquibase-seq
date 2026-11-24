--liquibase formatted sql

--changeset yourname:ddl_create_poc_orders labels:jira-1101,release-1.0.0
--comment Create the orders table
CREATE TABLE poc_orders (
    id INT NOT NULL PRIMARY KEY,
    status VARCHAR(20)
);
--rollback DROP TABLE poc_orders;

--changeset yourname:dml_insert_poc_orders labels:jira-1101,release-1.0.0
--comment Add starting data
INSERT INTO poc_orders (id, status) VALUES (1, 'new');
INSERT INTO poc_orders (id, status) VALUES (2, 'shipped');
--rollback DELETE FROM poc_orders WHERE id IN (1, 2);

--changeset yourname:sp_get_poc_orders labels:jira-1101,release-1.0.0 splitStatements:false runOnChange:true
--comment Function that returns orders by status
CREATE OR REPLACE FUNCTION get_poc_orders(p_status varchar)
RETURNS TABLE (id integer, status varchar) AS $$
BEGIN
    RETURN QUERY SELECT o.id, o.status FROM poc_orders o WHERE o.status = p_status;
END;
$$ LANGUAGE plpgsql;
--rollback DROP FUNCTION IF EXISTS get_poc_orders(varchar);
