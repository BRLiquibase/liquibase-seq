--liquibase formatted sql

--changeset yourname:ddl_comment_poc_customers labels:jira-2101,release-1.0.0
--comment Describe the customers table and its name column
COMMENT ON TABLE poc_customers IS 'Customers of the POC.';
COMMENT ON COLUMN poc_customers.name IS 'Full name.';
--rollback COMMENT ON TABLE poc_customers IS NULL;
--rollback COMMENT ON COLUMN poc_customers.name IS NULL;
