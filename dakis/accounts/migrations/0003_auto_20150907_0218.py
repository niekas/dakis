# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_auto_20150906_0810'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='hostname',
            field=models.CharField(max_length=255, verbose_name='Hostname', blank=True, default=''),
        ),
    ]
