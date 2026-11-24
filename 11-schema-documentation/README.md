# 11 Schema documentation

If time allows. Table and column descriptions live in Git and go through the pull request.

| Database | Method | File |
|---|---|---|
| PostgreSQL | `COMMENT ON` | `postgres.sql` |
| SQL Server | Extended property `MS_Description` | `sqlserver.sql` |

## Try it

1. Copy the file for your database into its `changesets/` folder.
2. Open a pull request, merge, deploy.
3. Check the description in the database and in SelectStar.

Needs the `poc_customers` table from 02-policy-checks. Deploy that first.

## Open

How SelectStar is checked. Open item. See the main README.
