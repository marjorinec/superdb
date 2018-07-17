# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import Funcionario, Departamento, Cargo, Projeto, Cliente, Custo, Fornecedor

# Register your models here.

admin.site.register(Funcionario)
admin.site.register(Departamento)
admin.site.register(Cargo)
admin.site.register(Projeto)
admin.site.register(Cliente)
admin.site.register(Custo)
admin.site.register(Fornecedor)
