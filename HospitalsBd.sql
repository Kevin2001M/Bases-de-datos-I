create database Hospitals;

go
use Hospitals;
go

CREATE TABLE Pacientes (
Id_paciente int identity,
Numero_Historial_Clinico int primary key,
Nombre_Paciente varchar(50) NOT NULL,
Apellido_Paciente varchar(50) NOT NULL,
Observaciones varchar(150) NOT NULL
);

CREATE TABLE Medico (
Id_Medico int identity,
Codigo_Identificacion_Medico int primary key,
Nombre_Medico varchar(50) NOT NULL,
Apellido_Medico varchar(50) NOT NULL,
NumeroDeColegiado varchar(50) NOT NULL,
Cargo varchar(150) NOT NULL
);

CREATE TABLE Ingresos (
 Id_Ingreso INT PRIMARY KEY identity,
 Tipo_Consulta VARCHAR(150) NOT NULL,
 FechaIngreso date default getdate(),
 Numero_Planta int NOT NULL,
 Numero_Cama int NOT NULL,
 Observaciones varchar(50),
 NumeroHistorialClinico INT NOT NULL,
 Codigo_Identificacion_Medico int NOT NULL

 FOREIGN KEY (NumeroHistorialClinico) REFERENCES Pacientes(Numero_Historial_Clinico),
 FOREIGN KEY (Codigo_Identificacion_Medico) REFERENCES Medico(Codigo_Identificacion_Medico)
);

create table DatosPaciente(
 Id_Datos INT PRIMARY KEY identity,
 NumeroHistorialClinico int,
 Sexo_Paciente varchar(50) NOT NULL,
 Departamento_Paciente varchar(50) NOT NULL,
 Municipio_Paciente varchar(50) NOT NULL,
 Cod_Postal varchar(50) NOT NULL,
 Tel_Paciente Int,
 FOREIGN KEY (NumeroHistorialClinico) REFERENCES Pacientes(Numero_Historial_Clinico),
);

create table DatosMedico(
 Id_Dato INT PRIMARY KEY identity,
 Codigo_Identificacion_Medico int,
 Sexo_Medico varchar (50) NOT NULL,
 Tel_Medico int NOT NULL,

  FOREIGN KEY (Codigo_Identificacion_Medico) REFERENCES Medico(Codigo_Identificacion_Medico),
);

create table Especialidad(
 Id_Especialidad INT PRIMARY KEY identity,
 Codigo_Identificacion_Medico int,
 Especializacion varchar (50) NOT NULL,

  FOREIGN KEY (Codigo_Identificacion_Medico) REFERENCES Medico(Codigo_Identificacion_Medico),
);



INSERT INTO Pacientes VALUES( 321, 'Jose','Otero','Dolor de cabeza');
INSERT INTO Pacientes VALUES( 322, 'Rodrigo','Henriquez','Dolor de estomago');
INSERT INTO Pacientes VALUES( 323, 'Juan','Martinez','Cortadura brazo');
INSERT INTO Pacientes VALUES( 324, 'Antonio','Cuadra','Vomito');
INSERT INTO Pacientes VALUES( 325, 'Liseth','Lopez','COVID');
INSERT INTO Pacientes VALUES( 326, 'Oscar','Alvarenga','Mareo');
INSERT INTO Pacientes VALUES( 327, 'Eduardo','Vazquez','Fiebre');
INSERT INTO Pacientes VALUES( 328, 'Enrique','Otero','Dolor de cabeza');
INSERT INTO Pacientes VALUES( 329, 'Karina','Lopez','Dolor de espalda');
INSERT INTO Pacientes VALUES( 330, 'Gladis','Ayala','Dolor de muelas');

INSERT INTO DatosPaciente VALUES( 321,'Masculino','Chalatenango', 'Chalatenago','1fre3',76138833);
INSERT INTO DatosPaciente VALUES( 322,'Masculino','Chalatenango', 'Las Flores','7yre3',67890223);
INSERT INTO DatosPaciente VALUES( 323,'Masculino','Chalatenango', 'Las Cumbres','hsbj3',77889933);
INSERT INTO DatosPaciente VALUES( 324,'Masculino','San Miguel', 'El Jocote','bga6s',76446116);
INSERT INTO DatosPaciente VALUES( 325,'Femenino','San Salvador', 'Santa Tecla','8usua',23096789);
INSERT INTO DatosPaciente VALUES( 326,'Masculino','Santa Ana', 'Metapan','89yse',60215688);
INSERT INTO DatosPaciente VALUES( 327,'MasculinoM','Chalatenango', 'Los Ranchos','bsy6s',78236502);
INSERT INTO DatosPaciente VALUES( 328,'Masculino','Chalatenango', 'Villa Toro','wy63e',69021945);
INSERT INTO DatosPaciente VALUES( 329,'Masculino','Chalatenango', 'Santo Tomas','lso92',88340218);
INSERT INTO DatosPaciente VALUES( 330,'Femenino','Cabañas', 'Sensunte','nus7',77237539);

INSERT INTO Medico VALUES( 23, 'Antonio','Flores', '3r87te','Doctor');
INSERT INTO Medico VALUES( 24, 'Ingrid','Brisuela', '387te','Doctora');
INSERT INTO Medico VALUES( 25, 'Wiliam','Leiva', '3t5e4','Enfermera');
INSERT INTO Medico VALUES( 26, 'Gladis','Perez', '365rt','Doctora');
INSERT INTO Medico VALUES( 27, 'Carlos','Benitez', '3y654','Doctor');
INSERT INTO Medico VALUES( 28, 'Kimberly','De la Cruz', '3765t','Enfermera');


INSERT INTO DatosMedico VALUES(23,'Masculino',78654327);
INSERT INTO DatosMedico VALUES(24,'Femenino',78654327);
INSERT INTO DatosMedico VALUES(25,'Masculino',78654327);
INSERT INTO DatosMedico VALUES(26,'Femenino',78654327);
INSERT INTO DatosMedico VALUES(27,'Masculino',78654327);
INSERT INTO DatosMedico VALUES(28,'Femenino',78654327);

INSERT INTO Especialidad VALUES(23,'Pediatra');
INSERT INTO Especialidad VALUES(24,'General');
INSERT INTO Especialidad VALUES(25,'Cirujano');
INSERT INTO Especialidad VALUES(26,'Pediatra');
INSERT INTO Especialidad VALUES(27,'General');
INSERT INTO Especialidad VALUES(28,'Oftalmologo');


INSERT INTO Ingresos VALUES( 'General','',1,10, 'Paciente Grave',321,23);
INSERT INTO Ingresos VALUES( 'General','',2,12, 'Observacion',325,27);
INSERT INTO Ingresos VALUES( 'Especializada','',1,1, 'Cirujia',323,25);
INSERT INTO Ingresos VALUES( 'Especializada','',1,6, 'Estable',321,23);
INSERT INTO Ingresos VALUES( 'General','',1,9, 'Grave',324,26);
INSERT INTO Ingresos VALUES( 'General','',2,4, 'Cita',329,28);
INSERT INTO Ingresos VALUES( 'Especializada','',1,45, 'Grave',330,26);
INSERT INTO Ingresos VALUES( 'Especializada','',2,7, 'Estable',322,24);
INSERT INTO Ingresos VALUES( 'General','',2,12, 'Estable',325,27);
INSERT INTO Ingresos VALUES( 'Especializada','',1,8, 'Estable',326,27);
INSERT INTO Ingresos VALUES( 'General','',2,5, 'Estable',327,24);
INSERT INTO Ingresos VALUES( 'General','',2,2, 'Estable',328,25);
INSERT INTO Ingresos VALUES( 'Especializada','',1,8, 'Estable',326,27);
INSERT INTO Ingresos VALUES( 'General','',2,5, 'Grave',327,24);
INSERT INTO Ingresos VALUES( 'General','',2,2, 'Grave',328,25);
INSERT INTO Ingresos VALUES( 'General','',2,5, 'Grave',327,24);
INSERT INTO Ingresos VALUES( 'General','',2,2, 'Estable',328,25);


---SELECCIONAR DATOS ACERCA DEL PACIENTE
select * from Pacientes;
select * from DatosPaciente;

---SELECCIONAR DATOS ACERCA DEL MEDICO
select * from Medico;
select * from DatosMedico;
select * from Especialidad;

---SELECCIONAR DATOS ACERCA DE INGRESOS
select * from Ingresos;
