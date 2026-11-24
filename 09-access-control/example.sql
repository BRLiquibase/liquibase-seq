--liquibase formatted sql

--changeset yourname:dcl_create_role_poc_reporting labels:jira-1901,release-1.0.0
--comment Create a read only role
CREATE ROLE poc_reporting;
--rollback DROP ROLE poc_reporting;

--changeset yourname:dcl_grant_select_poc_customers labels:jira-1901,release-1.0.0
--comment Let the role read customers
GRANT SELECT ON poc_customers TO poc_reporting;
--rollback REVOKE SELECT ON poc_customers FROM poc_reporting;
