# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import Funcionario, Departamento, Cargo, Projeto, Cliente, Custo, Fornecedor

# Register your models here.

class FuncionarioAdmin(admin.ModelAdmin):
	list_display = ('nome_completo', 'telefone', 'email', 'num_registro', 'cargo')
	search_fields = ('nome_completo', 'cargo', 'matricula', 'num_registro')
	list_filter = ('nome_completo', 'cargo')

class ProjetoAdmin(admin.ModelAdmin):
	list_display = ('nome', 'valor', 'estado')
	search_field = ('nome')
	filter = ('estado')

class ClienteAdmin(admin.ModelAdmin):
	list_display = ('nome', 'num_registro', 'telefone', 'email')
	search_fields = ('nome', 'num_registro')

class CustoAdmin(admin.ModelAdmin):
	list_display = ('nome', 'projeto')

class FornecedorAdmin(admin.ModelAdmin):
	list_display = ('nome', 'num_registro', 'telefone', 'email')
	search_fields = ('nome', 'num_registro')


admin.site.register(Funcionario, FuncionarioAdmin)
admin.site.register(Departamento)
admin.site.register(Cargo)
admin.site.register(Projeto, ProjetoAdmin)
admin.site.register(Cliente, ClienteAdmin)
admin.site.register(Custo, CustoAdmin)
admin.site.register(Fornecedor, FornecedorAdmin)
