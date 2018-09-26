CREATE DATABASE SISTEMACOLABORATIVO;
USE SISTEMACOLABORATIVO;
CREATE TABLE Usuario(
pk_id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(90),
apellido_paterno VARCHAR(120),
apellido_materno VARCHAR(120),
correo VARCHAR(90),
foto MEDIUMBLOB,
telefono VARCHAR (50),
sexo VARCHAR(90),
contrasenia VARCHAR(90),
rol varchar(25) null
);

CREATE TABLE Alumno(
pk_id_alumno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_id_usuario INT NOT NULL,
ultimo_nivel_educativo VARCHAR(120),
FOREIGN KEY (fk_id_usuario) 
	REFERENCES Usuario(pk_id_usuario)
	ON DELETE CASCADE
);

CREATE TABLE Interes_academico(
pk_id_interes INT AUTO_INCREMENT PRIMARY KEY,
fk_id_alumno INT,
interes VARCHAR(90),
FOREIGN KEY (fk_id_alumno) 
	REFERENCES Alumno(pk_id_alumno)
	ON DELETE CASCADE
);

CREATE TABLE Profesor(
pk_id_profesor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_id_usuario INT NOT NULL,
identificacion_identidad MEDIUMBLOB,
costo_x_hora VARCHAR(120),
niveles_educativos VARCHAR(120),
habilidades VARCHAR(320),
	FOREIGN KEY (fk_id_usuario) 
	REFERENCES Usuario(pk_id_usuario)
	ON DELETE CASCADE
);

CREATE TABLE Curriculum(
pk_id_cv INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_id_profesor INT NOT NULL,
lugar_de_nacimiento VARCHAR(90),
FOREIGN KEY (fk_id_profesor) 
	REFERENCES Profesor(pk_id_profesor)
	ON DELETE CASCADE
);

CREATE TABLE Experiencia(
pk_id_experiencia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_id_cv INT,
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
pk_id_estudios INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_id_cv INT,
estudio VARCHAR(90),
fecha_inicio DATE,
fecha_fin DATE,
universidad VARCHAR(120),
FOREIGN KEY (fk_id_cv) 
	REFERENCES Curriculum(pk_id_cv)
	ON DELETE CASCADE
);
#Titulos complementarios
CREATE TABLE Complementarios(
pk_id_complementarios INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_id_cv INT,
estudio VARCHAR(90),
fecha_inicio DATE,
fecha_fin DATE,
centro VARCHAR(90),
lugar VARCHAR(90),
FOREIGN KEY (fk_id_cv) 
	REFERENCES Curriculum(pk_id_cv)
	ON DELETE CASCADE
);