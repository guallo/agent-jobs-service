from rest_framework import serializers

from .models import Job


class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ('uuid', 'cmd', 'directory', 'user', 'b64payload', 'extra_env_json')
