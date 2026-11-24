# 05 Drift detection

Find changes made to a database outside Liquibase.

## How it works

1. Every deploy saves a snapshot of the database (`flows/liquibase.flowfile.cd.yaml`).
2. Every morning `.github/workflows/drift.yml` compares the database to that snapshot.
3. Any difference fails the job. The report is saved as a build artifact.
4. The next deploy runs the same check first, so drift blocks it.

Snapshots are kept in `~/liquibase-snapshots` on the runner. The workflows link that folder as `snapshots/`.
Liquibase reads the snapshot from a relative path only, so keep it that way.
Use the same runner every time.

## Try it

Deploy once. Then make a change by hand:

PostgreSQL:
```sql
ALTER TABLE poc_customers ADD drift_test VARCHAR(10);
```

SQL Server:
```sql
ALTER TABLE poc_customers ADD drift_test VARCHAR(10);
```

Run the `liquibase-drift` workflow by hand.

Expect: it fails. The report shows `drift_test` as unexpected.

Remove it afterwards:
```sql
ALTER TABLE poc_customers DROP COLUMN drift_test;
```
