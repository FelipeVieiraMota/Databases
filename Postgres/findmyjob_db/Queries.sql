-- Todas as empresa que pagam acima de 8000 por vaga
select  
	v.salario as "Salario",
	v.titulo as "Vaga", 
	TO_CHAR(v.data_publicacao, 'dd/MM/YYYY') as "Publicação",
	TO_CHAR(v.data_expiracao, 'dd/MM/YYYY') as "Expiracão",	
	e.razao_social as "Razão Social"
from vagas v 
	join empresas e on v.empresa_id = e.id_empresa
where salario > 8000
order by v.salario desc;


select 
	e.id_empresa as "Numero de identificação por empresa",
	e.razao_social as "Razão Social da empresa",
	v.id_vaga as "Numero de identificação por vaga",
	v.titulo 
from empresas e 
	join vagas v on e.id_empresa = v.empresa_id
order by 
	e.id_empresa desc,
	v.id_vaga desc;


--Quantidade de vagas em aberto por empresa
select 
	count(v.id_vaga) as "Quantidade de vagas em aberto por empresa", 
	e.id_empresa as "Numero de identificação por empresa",
	e.razao_social as "Razão Social da empresa"
from empresas e 
	join vagas v on e.id_empresa = v.empresa_id
group by e.id_empresa
order by 
	count(e.id_empresa) desc, 
	e.id_empresa desc

select ROUND(AVG(v.salario),0) as "Media Salarial" from vagas v;
select AVG(v.salario) as "Media Salarial" from vagas v;