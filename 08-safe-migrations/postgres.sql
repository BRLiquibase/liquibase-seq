--liquibase formatted sql

--changeset yourname:ddl_index_big_table_col labels:jira-1801,release-1.0.0 runInTransaction:false
--comment Build the index without locking writes
CREATE INDEX CONCURRENTLY idx_big_table_col ON big_table (col);
--rollback DROP INDEX CONCURRENTLY idx_big_table_col;

--changeset yourname:ddl_big_table_col_nn_add labels:jira-1802,release-1.0.0
--comment Step 1 of NOT NULL: add the constraint without scanning the table
ALTER TABLE big_table ADD CONSTRAINT big_table_col_nn CHECK (col IS NOT NULL) NOT VALID;
--rollback ALTER TABLE big_table DROP CONSTRAINT big_table_col_nn;

--changeset yourname:ddl_big_table_col_nn_validate labels:jira-1802,release-1.0.0
--comment Step 2 of NOT NULL: check the existing rows
ALTER TABLE big_table VALIDATE CONSTRAINT big_table_col_nn;
--rollback empty
