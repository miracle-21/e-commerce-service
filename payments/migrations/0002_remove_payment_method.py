# Generated by Django 4.0.5 on 2022-09-14 13:17

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('payments', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='payment',
            name='method',
        ),
    ]
