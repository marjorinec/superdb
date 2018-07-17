from django.template import Template, Context
from django.http import HttpResponse

def funcionario(request, offset):
	try:
		offset = int(offset)
	except ValueError:
		raise Http404()

	html = "<html><body>Funcionario de id = %s </body></html>" % (offset)
	return HttpResponse(html) 