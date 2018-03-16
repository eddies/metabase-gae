# Metabase for Google App Engine

Run [Metabase](https://www.metabase.com/) on [Google App Engine](https://cloud.google.com/appengine/).

## Prerequisites
* A Cloud SQL instance available for use
* Update the `env_variables` in `app.yaml`, especially:
  * `CLOUD_SQL_INSTANCE`
  * `MB_DB_NAME`
  * `MB_DB_USER`
  * `MB_DB_PASS`

Given a CloudSQL database name of "foo" you can use the following to get the correct `CLOUD_SQL_INSTANCE` value (assuming you have installed and configured the [Google Cloud SDK](https://cloud.google.com/sdk/)):

```bash
gcloud sql instances describe foo --format='value(connectionName)'
```

## Deployment

```bash
gcloud app deploy
```