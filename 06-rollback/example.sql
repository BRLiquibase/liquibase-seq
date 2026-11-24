--liquibase formatted sql

--changeset yourname:ddl_create_poc_items labels:jira-1601,release-1.0.0
--comment Create the items table
CREATE TABLE poc_items (
    id INT NOT NULL PRIMARY KEY
);
--rollback DROP TABLE poc_items;

--changeset yourname:ddl_add_col_a labels:jira-1602,release-1.0.0
--comment Add column A
ALTER TABLE poc_items ADD col_a VARCHAR(50);
--rollback ALTER TABLE poc_items DROP COLUMN col_a;

--changeset yourname:ddl_add_col_b labels:jira-1603,release-1.0.0
--comment Add column B
ALTER TABLE poc_items ADD col_b VARCHAR(50);
--rollback ALTER TABLE poc_items DROP COLUMN col_b;

--changeset yourname:ddl_add_col_c labels:jira-1604,release-1.0.0
--comment Add column C
ALTER TABLE poc_items ADD col_c VARCHAR(50);
--rollback ALTER TABLE poc_items DROP COLUMN col_c;
