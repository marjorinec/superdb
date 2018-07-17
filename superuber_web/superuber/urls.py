from django.conf.urls import url
from superuber.views import FuncionarioList

urlpatterns = [
	url(r'^funcionario/(\d{1,4})/$', FuncionarioList.as_view()),
]