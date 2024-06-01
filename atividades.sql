--Criando o Banco de Dados--

--Entidade forte--

CREATE DATABASE bdEscolaa

GO

USE bdEscolaa


CREATE TABLE tbCurso (
codCurso INT PRIMARY KEY IDENTITY(1,1)
,nomeCurso VARCHAR (30)
,cargahorariaCurso VARCHAR (30)
,valorCurso INT 
)


CREATE TABLE tbAluno(
codAluno INT PRIMARY KEY IDENTITY(1,1)
,nomeAluno VARCHAR (30)
,dataNascimentoAluno VARCHAR (11)
,rgAluno VARCHAR (20)
,naturalidadeAluno VARCHAR (30)
)


--Entidade Fraca--

CREATE TABLE tbTurma(
codTurma INT PRIMARY KEY IDENTITY(1,1)
,nomeTurma VARCHAR (30)
,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
,horarioTurma VARCHAR (30)
)

CREATE TABLE tbMatricula(
codMatricula INT PRIMARY KEY IDENTITY(1,1)
,dataMatricula VARCHAR (11)
,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
)


--Insert--

--Insert das entidades fortes--


INSERT INTO tbCurso(nomeCurso, cargahorariaCurso, valorCurso)
VALUES ('Inglês', 2000, 356.00)
,('Alemão', 3000, 478.00)

INSERT INTO tbAluno(nomeAluno, dataNascimentoAluno, rgAluno, naturalidadeAluno)
VALUES ('Paulo Santos', '03/10/2000', '82.292.122-0', 'SP')
,('Maria da Gloria', '10/03/1999', '45.233.123-0', 'SP')
,('Perla Nogueira Silva', '04/04/1998', '23.533.211-9', 'SP')
,('Gilson Barros Silva', '09/09/1995', '34.221.111-x', 'PE')
,('Mariana Barbosa Santos', '10/10/2001', '54.222.122-9', 'RJ')


--Insert das entidades fracas--

INSERT INTO tbTurma(nomeTurma, codCurso, horarioTurma)
VALUES ('1|A', 1, '12:00')
,('1|B', 1, '18:00')
,('1AA', 2, '19:00')

INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma)
VALUES ('10/03/2015', 1, 2)
,('05/04/2014', 2, 2)
,('05/03/2012', 3, 3)
,('03/03/2016', 1, 4)
,('05/07/2015', 4, 3)
,('07/05/2015', 4, 4)
,('06/06/2015', 5, 2)
,('05/05/2015', 5, 4)

SELECT * FROM tbCurso


--Exercicios--

--1--

SELECT nomeAluno, rgAluno, dataNascimentoAluno FROM tbAluno WHERE naturalidadeAluno like 'SP%'


--2--

SELECT nomeAluno, rgAluno FROM tbAluno WHERE nomeAluno like 'P%'


--3--

SELECT nomeCurso FROM tbCurso WHERE cargahorariaCurso > 2000


--4--

SELECT nomeAluno, rgAluno FROM tbAluno WHERE DATEPART(day,dataNascimentoAluno) <= 9 AND DATEPART(day,dataNascimentoAluno) >3


--5--

SELECT nomeAluno, dataNascimentoAluno FROM tbAluno WHERE DATEPART(month,dataNascimentoAluno) = 03	


--6--

SELECT codAluno, dataMatricula FROM tbMatricula WHERE DATEPART(month,dataMatricula) = 05


--7--

SELECT codAluno FROM tbMatricula WHERE codTurma = 2 OR codTurma = 3


--8--

SELECT codAluno FROM tbMatricula WHERE codTurma = 4 

--9--

SELECT codAluno, nomeAluno, dataNascimentoAluno, rgAluno, naturalidadeAluno FROM tbAluno

--10--

SELECT codTurma, nomeTurma, codCurso, horarioTurma FROM tbTurma