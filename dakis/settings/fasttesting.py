# pylint: disable=wildcard-import,unused-wildcard-import

from dakis.settings.testing import *  # noqa

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': ':memory:',
    }
}
