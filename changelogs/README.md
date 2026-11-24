# Changelogs

One folder per database. Add your own SQL changesets to `changesets/`.

| Folder | Database |
|---|---|
| solstice | PostgreSQL |
| seqdatamart | SQL Server |

## Rules for every changeset

- Author: your own name or GitHub username. Replace `yourname` in the examples.
- ID: a prefix and a name. `ddl_` for structure, `dml_` for data, `sp_` for procedures and functions.
- A `--comment` line, a label, and a `--rollback` line.
- Label: the Jira ticket and the release, for example `labels:jira-1412,release-1.0.3`.
- File name: a number prefix, so files run in order: `001-`, `002-`.

Each use case folder has example SQL. Copy it here to try that use case.
