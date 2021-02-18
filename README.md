# agent-jobs-service

## Enabling HTTPS for development

### Method 1: using manage.py and stunnel separately

On a console, run the Django development server using `HTTPS=1`
```bash
HTTPS=1 ./manage.py runserver 8000
```

and on another console, run the stunnel proxy
```bash
cd stunnel
stunnel config
```

now the service can be accessed through https://localhost:8443/api/

### Method 2: using manage.sh to handle both manage.py and stunnel

```bash
HTTPS=1 ./manage.sh runserver 8000
```

and the service can be accessed through https://localhost:8443/api/

### Method 3: using manage-docker.sh to handle both manage.py and stunnel in a container

```bash
HTTPS=1 ./manage-docker.sh runserver 8000
```

and the service can be accessed through https://localhost:8443/api/
