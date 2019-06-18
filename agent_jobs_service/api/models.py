from django.db import models


class Job(models.Model):
    uuid = models.CharField(max_length=36, primary_key=True)
    cmd = models.TextField()
    directory = models.CharField(max_length=128)
    user = models.CharField(max_length=32)
    b64payload = models.TextField()
    extra_env_json = models.TextField()
