# Clone the repo

```bash
$ git clone git@github.com:alexx-avdeev/python-test.git
$ cd python-test
```

## Build the container

```bash
$ docker build --tag python-test:1.0 .
```

## Run the container

```bash
docker run --privileged --publish 8000:8080 -d --rm --name python-test python-test:1.0
```

Service will be available at http://localhost:8000

Once done stop the container
```bash
docker stop python-test
```
