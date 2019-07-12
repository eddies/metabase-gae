# Metabase for Google App Engine

Run [Metabase](https://www.metabase.com/) on [Google App Engine](https://cloud.google.com/appengine/).

## Prerequisites
This application assumes that this is already an Embodied Analytics application setup for the environment you are deploying to.
This application uses TWO databases:
1) A Metbase Application Database to store information related to the metabase appliction. Connecting settings for this database are set in `app.ENV.yaml`
2) A READ replica of the Embodied Analytics database. Connection settings for this are set in the Web UI of Metabase

The Metabase application should always point to our READ REPLICA of the Embodied Anayltics Database

## Setup

install the [Google Cloud SDK](https://cloud.google.com/sdk/) if you haven't
already

login to your Google account

```bash
gcloud auth login
```

Connect to the gcloud project you want to deploy to

```bash
gcloud config set core/project [PROJECT_ID]
```

## Deployment
Set the `MB_DB_PASS` and `MB_ENCRYPTION_SECRET_KEY` - These values are stored in 1Password

```bash
gcloud app deploy app.ENV.yaml
```

DO NOT commit the ENV values set above
