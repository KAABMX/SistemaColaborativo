CREATE DATABASE SISTEMACOLABORATIVO;
USE SISTEMACOLABORATIVO;
CREATE TABLE Usuario(
pk_id_usuario SERIAL NOT NULL  PRIMARY KEY,
nombre VARCHAR(90),
apellido_paterno VARCHAR(120),
apellido_materno VARCHAR(120),
correo VARCHAR(90),
foto BYTEA,
contrasenia VARCHAR(90),
rol varchar(25) null,
codigo_activacion VARCHAR(30),
activado VARCHAR(30) DEFAULT false
);

CREATE TABLE Alumno(
pk_id_alumno SERIAL NOT NULL  PRIMARY KEY,
fk_id_usuario SERIAL NOT NULL,
ultimo_nivel_educativo VARCHAR(120),
FOREIGN KEY (fk_id_usuario) 
	REFERENCES Usuario(pk_id_usuario)
	ON DELETE CASCADE
);

CREATE TABLE Interes_academico(
pk_id_interes SERIAL  PRIMARY KEY,
fk_id_alumno SERIAL,
interes VARCHAR(90),
FOREIGN KEY (fk_id_alumno) 
	REFERENCES Alumno(pk_id_alumno)
	ON DELETE CASCADE
);

CREATE TABLE Profesor(
pk_id_profesor SERIAL NOT NULL  PRIMARY KEY,
fk_id_usuario SERIAL NOT NULL,
identificacion BYTEA,
costo_x_hora VARCHAR(120),
niveles_educativos VARCHAR(120),
habilidades VARCHAR(320),
estaActivo BOOLEAN DEFAULT false,
	FOREIGN KEY (fk_id_usuario) 
	REFERENCES Usuario(pk_id_usuario)
	ON DELETE CASCADE
);

CREATE TABLE Curriculum(
pk_id_cv SERIAL NOT NULL  PRIMARY KEY,
fk_id_profesor SERIAL NOT NULL,
lugar_de_nacimiento VARCHAR(90),
identificacion BYTEA,
FOREIGN KEY (fk_id_profesor) 
	REFERENCES Profesor(pk_id_profesor)
	ON DELETE CASCADE
);

CREATE TABLE Estudios(
pk_id_estudios SERIAL NOT NULL  PRIMARY KEY,
fk_id_cv SERIAL,
estudio VARCHAR(90),
universidad VARCHAR(120),
FOREIGN KEY (fk_id_cv) 
	REFERENCES Curriculum(pk_id_cv)
	ON DELETE CASCADE
);
