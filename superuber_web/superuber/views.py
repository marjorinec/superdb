# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.views.generic import ListView, DetailView
from django.template.loader import get_template
from superuber.models import Funcionario

# Create your views here.

class FuncionarioList(ListView):
	model = Funcionario
	context_object_name = "Funcionarios"

class FuncionarioDetail(DetailView):
	model = Funcionario

	def get_context_data(self, **kwargs):
		context = super(FuncionarioDetail, self).get_context_data(**kwargs)

		context['funcionario_list'] = Funcionario.objects.all()

		return context 