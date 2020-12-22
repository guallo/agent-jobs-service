from .base_settings import *

SECRET_KEY = '#(^hb717whfv9uvfkm4^@ii(u2l!9re5d^jnvfgxghz%x@w+-p'

DEBUG = True

INSTALLED_APPS += [
    'sslserver',
]

# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
