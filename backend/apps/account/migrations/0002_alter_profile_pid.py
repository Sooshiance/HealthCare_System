# Generated by Django 5.2 on 2025-04-11 14:49

import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='pid',
            field=models.CharField(default=uuid.UUID('290a89b5-ccd6-4ce0-b75f-242f0abaf808'), max_length=50),
        ),
    ]
