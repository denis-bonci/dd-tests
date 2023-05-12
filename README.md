
# dd-tests

Test environments aim to check a possible Datadog trace bug.


## Installation

Simply install Docker (and Docker compose) and than run

```bash
  docker compose up -d
```

For old Docker version instead

```bash
  docker-compose up -d
```

All environments will be available in localhost whith specific ports based on PHP + Symfony match.

http://localhost:<PHP-2-chars-version><Symfony-2-chars-version>

### PHP 7.4 and Symfony 4.4
http://localhost:7444/

### PHP 7.4 and Symfony 5.4 (latest supported for PHP 7.4)
http://localhost:7454/

### PHP 8.2 and Symfony 4.4
http://localhost:8244/

### PHP 8.2 and Symfony 6.2
http://localhost:8262/
