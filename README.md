# POS SEQ

Liquibase Secure proof of concept for Spring EQ.
Each numbered folder is one use case. Each has a README and example SQL. Use any folder on its own.

## Start

1. [Install Liquibase Secure](https://www.liquibase.com/download-secure) 6.0.2. Run `liquibase --version`.
2. Copy `config/postgres.properties.example` or `config/sqlserver.properties.example` to `liquibase.properties`. Set the secret names.
3. Add your SQL changesets to `changelogs/<database>/changesets/`. Rules are in `changelogs/README.md`.
4. Try the commands in order:

```
liquibase connect
liquibase history
liquibase status
liquibase checks run
liquibase update
liquibase rollback-one-update --force
```

5. Pick a use case folder and follow its README.

Editor: the [Liquibase Secure Developer VS Code extension](https://docs.liquibase.com/secure-developer/user-guide-1-0/install-and-configure-the-liquibase-secure-developer-vs-code-extension).

## Folders

| Folder | Use case |
|---|---|
| 01-deployment | Deploy from GitHub Actions and Argo CD |
| 02-policy-checks | Block risky changes |
| 03-pr-review | Review from the pull request |
| 04-developer-workflow | Generated and hand-written changes |
| 05-drift-detection | Find out-of-band changes |
| 06-rollback | Undo a release or one change |
| 07-config-features | Labels, reports, logs, data residency |
| 08 to 11 | If time allows: safe migrations, access control, onboarding, schema docs |

Shared files: `changelogs/`, `flows/`, `config/`, `lib/`, `.github/`.

## Secrets

- GitHub secrets: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`, `LIQUIBASE_LICENSE_KEY`.
- AWS Secrets Manager: `seq-poc-<database>-<env>` with keys `url`, `username`, `password`. License for local use: `seq-poc-license`, key `key`.
- Never put a password in a workflow file or the repo.

## Open items

- Dependency check: no built in check finds views, functions or procedures that use a dropped column.
- Generated changesets: confirm rollback lines are created for SQL format.
- Low-lock migrations: not automatic. Manual patterns only.
- Argo CD drift check: where the snapshot is kept.
- SelectStar check.
- Data residency answer in writing.
- Liquibase Secure server dashboard: out of scope for now.

## Not tested

Nothing here has run against a database. Test each folder before sharing.
