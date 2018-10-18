--CREATE DATABASE SISTEMACOLABORATIVO;
CREATE TABLE Usuario(
pk_id_usuario SERIAL NOT NULL  PRIMARY KEY,
nombre VARCHAR(90),
apellido_paterno VARCHAR(120),
apellido_materno VARCHAR(120),
correo VARCHAR(90),
foto VARCHAR(90),
telefono VARCHAR (50),
sexo VARCHAR(90),
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
identificacion_identidad VARCHAR(90),
costo_x_hora VARCHAR(120),
niveles_educativos VARCHAR(120),
habilidades VARCHAR(320),
identificacion varchar(90),
estaactivo character varying(30) DEFAULT false,
	FOREIGN KEY (fk_id_usuario) 
	REFERENCES Usuario(pk_id_usuario)
	ON DELETE CASCADE
);

CREATE TABLE Curriculum(
pk_id_cv SERIAL NOT NULL  PRIMARY KEY,
fk_id_profesor SERIAL NOT NULL,
lugar_de_nacimiento VARCHAR(90),
FOREIGN KEY (fk_id_profesor) 
	REFERENCES Profesor(pk_id_profesor)
	ON DELETE CASCADE
);

CREATE TABLE Experiencia(
pk_id_experiencia SERIAL NOT NULL  PRIMARY KEY,
fk_id_cv SERIAL,
fecha_inicio DATE,
fecha_fin DATE,
empresa VARCHAR(90),
funcion_trabajo VARCHAR(200),
tarea_trabajo VARCHAR(200),
FOREIGN KEY (fk_id_cv) 
	REFERENCES Curriculum(pk_id_cv)
	ON DELETE CASCADE
);

CREATE TABLE Estudios(
pk_id_estudios SERIAL NOT NULL  PRIMARY KEY,
fk_id_cv SERIAL,
estudio VARCHAR(90),
fecha_inicio DATE,
fecha_fin DATE,
universidad VARCHAR(120),
FOREIGN KEY (fk_id_cv) 
	REFERENCES Curriculum(pk_id_cv)
	ON DELETE CASCADE
);
CREATE TABLE Complementarios(
pk_id_complementarios SERIAL NOT NULL  PRIMARY KEY,
fk_id_cv SERIAL,
estudio VARCHAR(90),
fecha_inicio DATE,
fecha_fin DATE,
centro VARCHAR(90),
lugar VARCHAR(90),
FOREIGN KEY (fk_id_cv) 
	REFERENCES Curriculum(pk_id_cv)
	ON DELETE CASCADE
);

CREATE TABLE Horario (
  dia VARCHAR(20) NOT NULL,
  horaInicio TIME NOT NULL,
  horaFin TIME NOT NULL,
  disponible VARCHAR(20) NOT NULL DEFAULT true,
  idHorario SERIAL NOT NULL,
  fk_id_profesor INT NOT NULL,
  PRIMARY KEY (idHorario),
    FOREIGN KEY (fk_id_profesor)
    	REFERENCES profesor (pk_id_profesor)
    		ON DELETE CASCADE
    		ON UPDATE CASCADE);

CREATE TABLE Tema(
	idTema SERIAL NOT NULL,
	tema VARCHAR(20) NOT NULL,
	PRIMARY KEY (idTema)
	);

CREATE TABLE TemaProfesor(
	idTemaProfesor SERIAL NOT NULL,
	idTema INT NOT NULL,
	fk_id_profesor INT NOT NULL,
	PRIMARY KEY (idTemaProfesor),
	FOREIGN KEY(idTema)
		REFERENCES Tema (idTema)
		    ON DELETE CASCADE
    		ON UPDATE CASCADE,
	FOREIGN KEY(fk_id_profesor)
		REFERENCES profesor (pk_id_profesor)
		    ON DELETE CASCADE
    		ON UPDATE CASCADE
);
	
 CREATE TABLE Asesorar(
 	idAsesorar SERIAL NOT NULL,
 	costo float NOT NULL DEFAULT 0.0,
 	aceptada VARCHAR(20) NOT NULL DEFAULT false,
 	comentario VARCHAR(120), 
	idTema INT NOT NULL,
	idHorario INT NOT NULL,
	fk_id_profesor INT NOT NULL,
	fk_id_alumno INT NOT NULL,
	PRIMARY KEY (idAsesorar),
	FOREIGN KEY(idTema)
		REFERENCES tema (idTema)
		    ON DELETE CASCADE
    		ON UPDATE CASCADE,
	FOREIGN KEY(fk_id_alumno)
		REFERENCES Alumno (pk_id_alumno)
		    ON DELETE CASCADE
    		ON UPDATE CASCADE,
	FOREIGN KEY(fk_id_profesor)
		REFERENCES Profesor (pk_id_profesor)
		    ON DELETE CASCADE
    		ON UPDATE CASCADE,
	FOREIGN KEY(idHorario)
		REFERENCES Horario (idHorario)
		    ON DELETE CASCADE
    		ON UPDATE CASCADE
 	);


