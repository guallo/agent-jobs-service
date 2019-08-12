import uuid
from django.db import models


class Job(models.Model):
    uuid = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    cmd = models.TextField()
    directory = models.CharField(max_length=128, blank=True)
    user = models.CharField(max_length=32, blank=True)
    b64payload = models.TextField(blank=True)
    extra_env_json = models.TextField(blank=True)
