--liquibase formatted sql

--changeset yourname:ddl_comment_poc_customers labels:jira-2101,release-1.0.0
--comment Describe the customers table
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Customers of the POC.',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poc_customers';
--rollback EXEC sp_dropextendedproperty @name = N'MS_Description', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'poc_customers';
