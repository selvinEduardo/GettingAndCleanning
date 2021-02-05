# Obetener el archivo y descomprimirlo.
ArchivoURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(ArchivoURL, "datos.zip", method="curl")
unzip("datos.zip")


#Leer archivos.
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("num","funciones"))
actividades <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("cod", "activitidad"))
sujeto_prueba <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "sujeto")
x_prueba <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$funciones)
y_prueba <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "cod")
sujeto_entrena <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "sujeto")
x_entrena <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$funciones)
y_entrena <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "cod")



#Cargar librerias y combinar los datos de prueba y de entrenamiento.
library(dplyr)
c1 <- rbind(x_entrena, x_prueba)
c2 <- rbind(y_entrena, y_prueba)
sujeto <- rbind(sujeto_entrena, sujeto_prueba)
datosuni <- cbind(sujeto, c2, c1)



#Sacar usando dplyr y Select los datos 
DatosOrdenados <- datosuni %>% select(sujeto, cod, contains("mean"), contains("std"))
DatosOrdenados$cod <- actividades[DatosOrdenados$cod, 2]

#Cambiar los nombres de las variables.
names(DatosOrdenados)[2]="actividad"
names(DatosOrdenados)<-gsub("Acc", "Acelerometro", names(DatosOrdenados))
names(DatosOrdenados)<-gsub("Gyro", "Giroscopio", names(DatosOrdenados))
names(DatosOrdenados)<-gsub("BodyBody", "Cuerpo", names(DatosOrdenados))
names(DatosOrdenados)<-gsub("Mag", "Magnitud", names(DatosOrdenados))
names(DatosOrdenados)<-gsub("^t", "Tiempo", names(DatosOrdenados))
names(DatosOrdenados)<-gsub("^f", "Frecuencia", names(DatosOrdenados))
names(DatosOrdenados)<-gsub("tBody", "TiempoCuerpo", names(DatosOrdenados))
names(DatosOrdenados)<-gsub("-mean()", "Media", names(DatosOrdenados), ignore.case = TRUE)
names(DatosOrdenados)<-gsub("-std()", "Estandard", names(DatosOrdenados), ignore.case = TRUE)
names(DatosOrdenados)<-gsub("-freq()", "Frequencia", names(DatosOrdenados), ignore.case = TRUE)
names(DatosOrdenados)<-gsub("angle", "Angulo", names(DatosOrdenados))
names(DatosOrdenados)<-gsub("gravity", "Gravedad", names(DatosOrdenados))

#Crear un conjuto de datos con las medias y crear una archivo con la salida de los datos.
FinalDatos <- DatosOrdenados %>%
  group_by(sujeto, actividad) %>%
  summarise_all(funs(mean))
write.table(FinalDatos, "Datos.txt", row.name=FALSE)
str(FinalData)
