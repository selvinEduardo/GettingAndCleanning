Getting and Cleaning Data - Projecto de Curso
=============================================

### Conjunto de datos.
- En este proyecto se usaron los datos del dataset del estudio Human+Activity+Recognition+Using+Smartphones 
Especialmente se usaron las caracteristicas extraidas de los archivos `x_train.txt`, `x_test.txt`, `y_train.txt`, `y_test.txt`, `subject_train.txt` y `subject_test.txt`, todos estos contenidos en el archivo URI HAR DATASET.

### Las variables data frame de los arcivos.
se asignaron las siguientes variables:
features <- features.txt
actividades <- activity_labels.txt
sujeto_prueba <-subject_test.txt
x_prueba <-X_test.txt
y_prueba <- y_test.txt
sujeto_entrena <-subject_train.txt
x_entrena <-X_train.txt
y_entrena <- y_train.txt

### Se combino los datos .
En c1 usando rbind las variables x_entrena y  x_prueba
En c2 usando  rbind as variables y_entrena y  y_prueba
En sujeto usando rbind para el sujeto_entrena y  sujeto_prueba
en datosuni se combinaron tantos los contenidos de las variables  csujeto, c y  c1 haciendo uso de la funcion cbind

### covirtitiendo en tablas con columnas y flias.
Se conviertio en columnas el conjuto datos uni y se guardo en la variable DatosOrdenados para ello se uso  %>%  que nos permite realizar varias acciones y se uso cointa para select extraer solo aquellos valor que tuvieran mean y std.

### se cambiaron los rotulos de las columnas usando el comando gsub

"Acc" por  "Acelerometro"
"Gyro" por  "Giroscopio"
"Cuerpo","Mag con  "Magnitud
t por  "Tiempo
"^f" por "Frecuencia"
"tBody" por "TiempoCuerpo"
Meab por Media.
std() por Estandard"
SFinalmente freq() por Frequencia", angle por Angulo.
