# README

To run the project, you'll need to set the environment variables `API_KEY` and `API_SECRET` with your API key and secret.
Duplicate the file `.env.example` and name it to `.env` then update the value of the environment variables.

To easily run the project, you can use the `docker-compose` file provided. To do so, run the following command:

```bash
docker-compose up
```

or if you want to run separately services, you can run the following commands:

```bash
docker-compose up server
docker-compose up ui
```

This will start the server on port 3000 and the UI app on port 8080.
You can then access the UI app on `http://localhost:8080`.

## Troubleshooting
Ensure that the ports 3000 and 8080 are not being used by other services.
