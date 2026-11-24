# 08 Safe migrations on large tables

If time allows. PostgreSQL.

Liquibase does not rewrite a change into a low-lock one. The developer writes the safe pattern.
Liquibase runs it, tracks it and rolls it back.

| Change | Safe pattern |
|---|---|
| New index | `CREATE INDEX CONCURRENTLY`, outside a transaction |
| NOT NULL | Add a constraint as NOT VALID, validate it, then set NOT NULL |

## Try it

Copy `postgres.sql` into `changelogs/solstice/changesets/`. Replace `big_table` with a real large table.

Expect: no long table lock. Check with `pg_locks` while it runs.

## Open

Automatic low-lock rewrites. Open item. See the main README.
