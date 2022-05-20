from django.db import models

# Create your models here.

class Departaments(models.Model):
    name = models.CharField(max_length=255)
    
    def __str__(self):
        return self.name


class Roles(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class Employee(models.Model):
    name = models.CharField(max_length=255)
    date_joined = models.DateField()
    departament_id = models.ForeignKey(Departaments, on_delete=models.CASCADE)
    role_id = models.ForeignKey(Roles, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.name


class Payments(models.Model):
    employee_id = models.ForeignKey(Employee, on_delete=models.CASCADE)
    year_month = models.IntegerField()
    salary = models.DecimalField(decimal_places=2, max_digits=10)
    bonus = models.DecimalField(decimal_places=2, max_digits=10)

    def __str__(self):
        return f'{self.employee_id} - {self.year_month}'


class Costs(models.Model):
    departament_id = models.ForeignKey(Departaments, on_delete=models.CASCADE)
    year_month = models.IntegerField()
    value = models.DecimalField(decimal_places=2, max_digits=10)
    description = models.CharField(max_length=255)
    
    def __str__(self):
        return f'{self.departament_id} - {self.year_month}'

class Invoicing(models.Model):
    departament_id = models.ForeignKey(Departaments, on_delete=models.CASCADE)
    year_month = models.IntegerField()
    value = models.DecimalField(decimal_places=2, max_digits=10)
    description = models.CharField(max_length=255)    

    def __str__(self):
        return f'{self.departament_id} - {self.year_month}'