# 04 Developer workflow

Two ways to make the same change. Compare them.

## A. Generated (no hand-written ALTER)

1. Keep a dev database that matches the main branch.
2. Make a second dev database. Change the table or view there.
3. Generate the changeset:

```
liquibase diff-changelog --reference-url=<changed db url> --reference-username=<user> --reference-password=<password> --changelog-file=changelogs/solstice/changesets/010-dev-change.sql
```

4. Open the file. Check it. Commit.

Needs the `poc_customers` table from 02-policy-checks. Deploy that first.

## B. Hand-written

Copy `hand-written.sql` into `changelogs/solstice/changesets/` and edit.

## Try it

Have two developers make five changes each, in parallel, with method A.
Then repeat with method B. Note the time and the mistakes.

## Check

Rollback lines may be missing from generated SQL changesets. Test before relying on them.
Open item. See the main README.
