--CREATE DATABASE SISTEMACOLABORATIVO;
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
activado VARCHAR(30) DEFAULT false,
calificacion float DEFAULT 5.0,
problematico VARCHAR(30) DEFAULT false
);

CREATE TABLE Alumno(
pk_id_alumno SERIAL NOT NULL  PRIMARY KEY,
fk_id_usuario INT NOT NULL,
ultimo_nivel_educativo VARCHAR(120),
FOREIGN KEY (fk_id_usuario) 
	REFERENCES Usuario(pk_id_usuario)
	ON DELETE CASCADE
);

CREATE TABLE Interes_academico(
pk_id_interes SERIAL  PRIMARY KEY,
fk_id_alumno INT,
interes VARCHAR(90),
FOREIGN KEY (fk_id_alumno) 
	REFERENCES Alumno(pk_id_alumno)
	ON DELETE CASCADE
);

CREATE TABLE Profesor(
pk_id_profesor SERIAL NOT NULL  PRIMARY KEY,
fk_id_usuario INT NOT NULL,
identificacion_identidad VARCHAR(90),
costo_x_hora VARCHAR(120),
identificacion BYTEA,
estaactivo character varying(30) DEFAULT false,
	FOREIGN KEY (fk_id_usuario) 
	REFERENCES Usuario(pk_id_usuario)
	ON DELETE CASCADE
);

CREATE TABLE Curriculum(
pk_id_cv SERIAL NOT NULL  PRIMARY KEY,
fk_id_profesor INT NOT NULL,
lugar_de_nacimiento VARCHAR(90),
FOREIGN KEY (fk_id_profesor) 
	REFERENCES Profesor(pk_id_profesor)
	ON DELETE CASCADE
);

CREATE TABLE Estudios(
pk_id_estudios SERIAL NOT NULL  PRIMARY KEY,
fk_id_cv INT,
estudio VARCHAR(90),
universidad VARCHAR(120),
FOREIGN KEY (fk_id_cv) 
	REFERENCES Curriculum(pk_id_cv)
	ON DELETE CASCADE
);


CREATE TABLE Resena (
  idResena SERIAL NOT NULL,
  comentario VARCHAR(255),
  calificacion INT NOT NULL,
  fk_id_usuario INT NOT NULL,
  PRIMARY KEY (idResena),
    FOREIGN KEY (fk_id_usuario)
    	REFERENCES Usuario (pk_id_usuario)
		    ON DELETE CASCADE
		    ON UPDATE CASCADE);


CREATE TABLE Denuncia (
  idDenuncia SERIAL NOT NULL,
  motivo VARCHAR(255) NOT NULL,
  fk_id_usuario INT NOT NULL,
  PRIMARY KEY (idDenuncia),
    FOREIGN KEY (fk_id_usuario)
    	REFERENCES Usuario (pk_id_usuario)
		    ON DELETE CASCADE
		    ON UPDATE CASCADE);



CREATE TABLE Nivel(
	idnivel SERIAL NOT NULL,
	nivel VARCHAR(20) NOT NULL,
	PRIMARY KEY (idnivel)
	);

CREATE TABLE NivelProfesor(
	idnivelprofesor SERIAL NOT NULL,
	idnivel INT NOT NULL,
	fk_id_profesor INT NOT NULL,
	PRIMARY KEY (idnivelprofesor),
	FOREIGN KEY(idnivel)
		REFERENCES Nivel (idnivel)
		    ON DELETE CASCADE
    		ON UPDATE CASCADE,
	FOREIGN KEY(fk_id_profesor)
		REFERENCES profesor (pk_id_profesor)
		    ON DELETE CASCADE
    		ON UPDATE CASCADE
);

CREATE TABLE Tema(
	idTema SERIAL NOT NULL,
	tema VARCHAR(20) NOT NULL,
	idnivel INT NOT NULL,
	PRIMARY KEY (idTema),
	FOREIGN KEY(idnivel)
		REFERENCES Nivel(idnivel)
		    ON DELETE CASCADE
    		ON UPDATE CASCADE	
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
 	costo float  DEFAULT 0.0,
 	aceptada VARCHAR(20) DEFAULT false,
 	estado VARCHAR(20) DEFAULT 'solicitada',
 	comentario VARCHAR(120), 
 	comentariorespuesta VARCHAR(120),  	
 	duracion INT ,
	idTema INT NOT NULL,
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
    		ON UPDATE CASCADE
 	);
