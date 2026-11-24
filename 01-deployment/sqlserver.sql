--liquibase formatted sql

--changeset yourname:ddl_create_poc_orders labels:jira-1101,release-1.0.0
--comment Create the orders table
CREATE TABLE dbo.poc_orders (
    id INT NOT NULL PRIMARY KEY,
    status VARCHAR(20)
);
--rollback DROP TABLE dbo.poc_orders;

--changeset yourname:dml_insert_poc_orders labels:jira-1101,release-1.0.0
--comment Add starting data
INSERT INTO dbo.poc_orders (id, status) VALUES (1, 'new');
INSERT INTO dbo.poc_orders (id, status) VALUES (2, 'shipped');
--rollback DELETE FROM dbo.poc_orders WHERE id IN (1, 2);

--changeset yourname:sp_get_poc_orders labels:jira-1101,release-1.0.0 splitStatements:false runOnChange:true
--comment Stored procedure that returns orders by status
CREATE OR ALTER PROCEDURE dbo.get_poc_orders @status VARCHAR(20)
AS
BEGIN
    SELECT id, status FROM dbo.poc_orders WHERE status = @status;
END;
--rollback DROP PROCEDURE dbo.get_poc_orders;
