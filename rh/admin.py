from django.contrib import admin

from .models import  *

# Register your models here.
admin.site.register(Departaments)
admin.site.register(Employee)
admin.site.register(Roles)
admin.site.register(Payments)
admin.site.register(Invoicing)
admin.site.register(Costs)