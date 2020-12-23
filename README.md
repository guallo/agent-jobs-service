# agent-jobs-service

## Enabling HTTPS for development

1. On a console, run the Django development server using `HTTPS=1`:
```bash
HTTPS=1 ./manage.py runserver 8000
```

2. On another console, run the stunnel proxy:
```bash
cd stunnel
stunnel config
```

3. Now the service can be accessed through https://localhost:8443/api/
