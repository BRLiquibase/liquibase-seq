# 10 Onboarding an existing database

If time allows. Turn a live database into a changelog. Do it once per database.

## Steps

1. Point the properties file at the database.
2. Generate the changelog:

```
liquibase generate-changelog --changelog-file=changelogs/solstice/changesets/001-baseline.sql --diff-types=tables,columns,views,indexes,primarykeys,foreignkeys,uniqueconstraints,functions,storedprocedures,triggers
```

3. Mark it as already applied. The database already has these objects:

```
liquibase changelog-sync
```

4. Commit. Deploy as normal from here.

## Notes

- solstice is on Flyway today. Leave the Flyway history table alone.
- Write down the hours for each step. That is the number for the other 50 databases.
