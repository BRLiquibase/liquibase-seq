--liquibase formatted sql

--changeset yourname:ddl_create_poc_customers labels:jira-1201,release-1.0.0
--comment Create the customers table
CREATE TABLE poc_customers (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(200),
    phone VARCHAR(50)
);
--rollback DROP TABLE poc_customers;

--changeset yourname:ddl_drop_poc_customers_phone labels:jira-1202,release-1.0.1
--comment This should be flagged: drops a column
ALTER TABLE poc_customers DROP COLUMN phone;
--rollback ALTER TABLE poc_customers ADD phone VARCHAR(50);

--changeset yourname:ddl_shrink_poc_customers_name labels:jira-1203,release-1.0.1
--comment This should be flagged: shrinks a column
ALTER TABLE poc_customers ALTER COLUMN name TYPE VARCHAR(20);
--rollback ALTER TABLE poc_customers ALTER COLUMN name TYPE VARCHAR(200);
