--Ex1
CREATE  OR REPLACE  FUNCTION quiEsTu (codeAc IN number) 
     return varchar2  is nomAc varchar2(60);
  
BEGIN
   select Nom into nomAc from acteur WHERE codeAc=codea;
   return nomac;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
     return 'no data found';
         
END quiEsTu;
set serveroutput on;
DECLARE
funct varchar2(60) ;
 
BEGIN
funct :=quiEsTu(1004);
dbms_output.put_line(funct);
--select quiEsTu(codeAc) into funct from dual;
END;
select * from Acteur;
select * from jouer;
--Ex2
select * from Film;


SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE mesFilms  (codeACT IN number)as titrefilm film.titre%type;
cursor c1 is select titre  from film  f , jouer j , acteur a 
where f.codef=j.codef and a.codea=j.codea and a.codea=codeACT;
begin
open c1;
loop
fetch c1 into titrefilm;
exit when c1%notfound;
DBMS_OUTPUT.put_line ('Le film n"existe pas');
end loop ;
close c1;
exception 
when  NO_DATA_FOUND THEN
DBMS_OUTPUT.put_line('no data ');
end mesFilms;

BEGIN
mesFilms(1001);
END;


--Ex3
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE maxMinSalaire(codeMaxA out number,codeMinA out number) as  
maxJouer NUMBER(10);
minJouer NUMBER(10);
begin
select max(salaire),min(salaire) into maxJouer,minJouer from jouer;
select codeA into codeMaxA from jouer where maxJouer=salaire;
select codeA into codeMinA from jouer where minJouer=salaire;
DBMS_OUTPUT.PUT_LINE(codeMaxA || codeMaxA);
end;

SET SERVEROUTPUT ON
declare 
v_max NUMBER(5);
v_min NUMBER(5);
n_Max varchar2(20);
n_Min varchar2(20);
BEGIN
maxMinSalaire(v_max,v_min);
select nom into n_Max from acteur where codeA=v_max;
select nom into n_Min from acteur where codeA=v_min;
DBMS_OUTPUT.PUT_LINE('max '||n_Max || ' min ' || n_Min);
END;



--Ex4
create or replace procedure majAge (codeAc in number) as ageAc number;
BEGIN
  select age into ageAc from acteur where codea=codeac;
  ageAc:=ageAc+1;
  update acteur set age=ageAc where codea=codeac;
END majAge;
SET SERVEROUTPUT ON
declare
BEGIN
majAge(1001);
DBMS_OUTPUT.PUT_line('opération terminée');
end;

select * from jouer;



--Ex5
create or replace procedure insertion (codeAc out number , codeF out number ,salaire out number) 
as codeAc jouer.codea%type ;
codeFilm jouer.codef%type;
salaireAc jouer.salaire%type;
begin
codeAc:=&donner_code_acteur;
codeFilm:=&donner_code_film;
salaireAc:=&donner_salaire;
insert into jouer(codea, codef, salaire) values (codeAc,codeFilm,salaireAc);
DBMS_OUTPUT.PUT_line('Ligne insérée avec succès');
end;


