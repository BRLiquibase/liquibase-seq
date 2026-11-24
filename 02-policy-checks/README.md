# 02 Policy checks

Block risky changes before they merge.

## Set up once

```
liquibase checks show
liquibase checks enable --check-name=ChangeDropColumnWarn
liquibase checks customize --check-name=ChangeDropColumnWarn
```

When asked for a severity, pick BLOCKER. A blocker stops the pipeline.
Repeat for `ChangeDropTableWarn` and `ModifyDataTypeWarn`.
Commit the file `liquibase.checks-settings.conf` that Liquibase creates in the repo root.

## Try it

1. Copy `postgres.sql` into `changelogs/solstice/changesets/` (or `sqlserver.sql` into `changelogs/seqdatamart/changesets/`).
2. Open a pull request.

Expect: the `liquibase-ci` check fails. The pull request comment lists the DROP COLUMN and the data type change.

## Not built in

Liquibase has no check that finds views, functions or stored procedures that use a dropped column.
Open item. See the main README.
