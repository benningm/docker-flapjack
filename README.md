# Docker image for flapjack

This docker image is based on the official flapjack docker image.

It adds the following changes:

 - does not start an internal redis server
 - accepts configuration option thru environment variables

## Example usage

```
$ docker run \
  --env 'REDIS_HOST=redis-flapjack' \
  --env 'REDIS_PORT=6379' \
  --env 'REDIS_DB=0' \
  benningm/flapjack:latest
```

## Example docker-compose.yml

```
version: '2'
services:
  flapjack:
    image: benningm/flapjack:latest
    ports:
     - "3080:3080"
    depends_on:
     - redis
    environment:
     - 'FLAPJACK_LOGLEVEL=INFO'
     - 'REDIS_HOST=redis'
     - 'REDIS_PORT=6379'
     - 'REDIS_DB=0'
  redis:
    image: redis
```

## Environment variables

 - FLAPJACK_LOGLEVEL (default: INFO)
 - REDIS_HOST (default: redis)
 - REDIS_PORT (default: 6379)
 - REDIS_DB (default: 0)
 - SMTP_HOST (default: 127.0.0.1)
 - SMTP_PORT (default: 1025)
 - SMTP_STARTTLS (default: false)

