# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-07-17 21:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('superuber', '0009_auto_20180717_1824'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cliente',
            name='projeto',
            field=models.ManyToManyField(blank=True, to='superuber.Projeto'),
        ),
        migrations.AlterField(
            model_name='custo',
            name='fornecedor',
            field=models.ManyToManyField(blank=True, to='superuber.Fornecedor'),
        ),
        migrations.AlterField(
            model_name='custo',
            name='funcionario',
            field=models.ManyToManyField(blank=True, to='superuber.Funcionario'),
        ),
        migrations.AlterField(
            model_name='projeto',
            name='funcionario',
            field=models.ManyToManyField(blank=True, to='superuber.Funcionario'),
        ),
    ]