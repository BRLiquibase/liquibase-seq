--liquibase formatted sql

--changeset yourname:ddl_create_poc_tickets labels:jira-1701,release-1.0.0
--comment Create the tickets table
CREATE TABLE poc_tickets (
    id INT NOT NULL PRIMARY KEY
);
--rollback DROP TABLE poc_tickets;

--changeset yourname:ddl_add_poc_tickets_status labels:jira-1702,release-1.0.1
--comment Add a status column
ALTER TABLE poc_tickets ADD status VARCHAR(20);
--rollback ALTER TABLE poc_tickets DROP COLUMN status;
