# How to setup Odoo 14 dev environment

## The `docker-compose.dev.yml` file

```yml
version: "3"
services:
  odoo:
    image: fancn21th/odoo-dev:14.2
    ports:
      - "8069:8069"
    volumes:
      - ./dev/addons:/root/sourcecode/odoo/dev/addons:ro
    depends_on:
      - pqdb

  pqdb:
    image: postgres:10
    environment:
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD=odoo
      - POSTGRES_USER=odoo
      - PGDATA=/var/lib/postgresql/data/pgdata
    volumes:
      - odoo-db-data:/var/lib/postgresql/data/pgdata

volumes:
  odoo-db-data:
```

## How to use

- start containers

  ```
  docker-compose -f docker-compose.dev.yml up -d -V
  ```

- open url

  ```
  http://localhost:8069/
  ```

## Others

- chrome debug plugin

  [Odoo Debug](https://chrome.google.com/webstore/detail/odoo-debug/hmdmhilocobgohohpdpolmibjklfgkbi)
