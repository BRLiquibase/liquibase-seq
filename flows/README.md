# Flows

A flow file runs several Liquibase commands in order. Same file in GitHub Actions and Argo CD.

| File | Used for | Deploys? |
|---|---|---|
| liquibase.flowfile.ci.yaml | Pull request: validate, status, policy checks | No |
| liquibase.flowfile.cd.yaml | Merge: drift check, deploy, rollback test, snapshot | Yes |
| liquibase.flowfile.drift.yaml | Compare database to last snapshot | No |

Run one:

```
liquibase flow --flow-file=flows/liquibase.flowfile.ci.yaml
```

Switch features on or off with variables, for example `LB_TEST_ROLLBACK=T`.
Reports are not set here. Turn them on or off in the properties file.
