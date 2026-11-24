# 07 Config only features

Four features that need settings, not code.

## Labels and Jira traceability

Put the Jira ticket in the changeset label.

```sql
--changeset yourname:ddl_add_email labels:jira-1412,release-1.0.3
```

Deploy only that ticket:

```
LB_LABELS=jira-1412 liquibase flow --flow-file=flows/liquibase.flowfile.cd.yaml
```

Or run the `liquibase-promote` workflow by hand. Pick the environment and enter `jira-1412`.

Trace a change back: `liquibase history` shows author, ID, label and date. The pipeline run shows who deployed it.

## Reports

HTML report for each command. Turn on or off in the properties file:

```
liquibase.reports.enabled=true
liquibase.reports.path=reports
```

The pipelines save the `reports/` folder as a build artifact.

## Structured logs

JSON logs. Set in the properties file:

```
liquibase.logFormat=JSON
liquibase.logFile=liquibase.json
```

Send the file to any log tool.

## Data residency

What leaves the network. Liquibase to confirm in writing.

| Item | Leaves the network? |
|---|---|
| Schema metadata | To confirm |
| Change history | To confirm |
| Credentials | To confirm |
| License check | To confirm |
| Telemetry | To confirm |

## Later

- Liquibase Secure server dashboard. Not in this POC.
- Datadog. Optional. Point it at `liquibase.json`.
