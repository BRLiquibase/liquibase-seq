--liquibase formatted sql

--changeset yourname:ddl_add_poc_customers_email labels:jira-1401,release-1.0.0
--comment Add an email column
ALTER TABLE poc_customers ADD email VARCHAR(200);
--rollback ALTER TABLE poc_customers DROP COLUMN email;

--changeset yourname:ddl_index_poc_customers_email labels:jira-1401,release-1.0.0
--comment Index the email column
CREATE INDEX idx_poc_customers_email ON poc_customers (email);
--rollback DROP INDEX idx_poc_customers_email;
