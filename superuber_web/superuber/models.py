# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Departamento(models.Model):
	nome = models.CharField(max_length=30)

	def __str__(self):
		return self.nome

class Cargo(models.Model):
	nome = models.CharField(max_length=30)

	def __str__(self):
		return self.nome

class Funcionario(models.Model):
	matricula = models.IntegerField(primary_key=True)
	num_registro = models.CharField(max_length=14, verbose_name='CPF/CNPJ')
	nome_completo = models.CharField(max_length=80, verbose_name='nome completo')
	endereco = models.CharField(max_length=200)
	email = models.EmailField(verbose_name='e-mail')
	data_de_nascimento = models.DateField(verbose_name='data de nascimento')
	salario = models.FloatField()
	tipo = models.CharField(max_length=2, choices=(
			('PF', 'Pessoa Física'),
			('PJ', 'Pessoa Jurídica')
		),
		default='PF'
	)
	departamento = models.ForeignKey(Departamento, blank=True, null=True)
	cargo = models.ForeignKey(Cargo, blank=True, null=True)
	telefone = models.CharField(max_length=14)

	def __str__(self):
		return self.nome_completo

class Projeto(models.Model):
	nome = models.CharField(max_length=30)
	valor = models.FloatField(blank=True)
	estado =  models.CharField(max_length=3, choices=(
			('CRD', 'Criado'),
			('AND', 'Em andamento'),
			('CLD', 'Concluído'),
			('CAN', 'Cancelado')
		),
		default='CRD'
	)
	funcionario = models.ManyToManyField(Funcionario, blank=True)

	def __str__(self):
		return self.nome

class Cliente(models.Model):
	num_registro = models.CharField(max_length=14, primary_key=True)
	nome = models.CharField(max_length=80)
	email = models.EmailField(verbose_name='e-mail')
	apelido = models.CharField(max_length=20, blank=True)
	endereco = models.CharField(max_length=200)
	telefone = models.CharField(max_length=14)
	projeto = models.ManyToManyField(Projeto, blank=True)

	def __str__(self):
		return self.nome

class Fornecedor(models.Model):
	num_registro = models.CharField(max_length=14, primary_key=True)
	nome = models.CharField(max_length=50)
	email = models.EmailField(verbose_name='e-mail')
	endereco = models.CharField(max_length=200)
	telefone = models.CharField(max_length=14)
	projeto = models.ManyToManyField(Projeto)

	def __str__(self):
		return self.nome

class Custo(models.Model):
	nome = models.CharField(max_length=30)
	valor = models.FloatField()
	projeto = models.ForeignKey(Projeto)
	funcionario = models.ManyToManyField(Funcionario, blank=True)
	fornecedor = models.ManyToManyField(Fornecedor, blank=True)

	def __str__(self):
		return self.nome