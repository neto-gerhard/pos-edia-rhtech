with vw_costs as (
select
	departament_id_id,
	year_month,
	sum(value) costs
from
	rh_costs
group by
	1, 2
),

vw_invoicing as (
select
	departament_id_id,
	year_month,
	sum(value) invoicing
from
	rh_invoicing
group by
	1, 2
),

vw_payments as (
select
	departament_id_id,
	year_month,
	sum(salary + bonus) payments
from
	rh_payments rp
	join rh_employee re on re.id = rp.employee_id_id  
group by
	1, 2
)

select 
	rd.name departament,
	costs + payments total_costs,
	invoicing,
	(invoicing - (costs + payments)) / (costs + payments) * 100 impacto_faturamento 
from 
	vw_costs c
	join vw_invoicing i on c.departament_id_id = i.departament_id_id and c.year_month = i.year_month
	join vw_payments p on c.departament_id_id = p.departament_id_id and c.year_month = i.year_month
	join rh_departaments rd on rd.id = c.departament_id_id
	
	
-- Departamento de analytics causou o maior impacto