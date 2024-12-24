#!/bin/bash

# Script: file-cute.sh
# Descripción: Corta archivos .fastq en la proporción correspondiente al usuario.
# El número de líneas que se cortan se calcula con el login del usuario.

# Obtener el login del usuario
user_login=$(whoami)  # Obtiene el login del usuario (por ejemplo, alumno16)

# Extrae el número de alumno
login_number=$(echo $user_login | sed 's/[^0-9]*//g')  # Extrae solo los números del login

# Función para cortar un archivo
cut_file() {
    local file=$1
    echo "Procesando $file..."
    
    # Calcular el número total de líneas del archivo
    local lines=$(wc -l < "$file")
    
    # Calcular la proporción en base al número del login
    local proportion=$((lines / login_number))  # El número de líneas a cortar depende de alumnoX
    
    # Cortar el archivo y guardar la parte superior proporcional
    head -n "$proportion" "$file" > "${file}.tmp"  # Guardamos la parte superior en un archivo temporal
    
    # Renombrar el archivo temporal para reemplazar el original
    mv "${file}.tmp" "$file"
    
    echo "Procesado $file: cortado a $proportion líneas."
}

# Procesa cada archivo .fastq en paralelo
for file in /home/alumno16/practica3/lab-git-Yaimy/*.fastq; do
    cut_file "$file" &  # Ejecuta el corte en paralelo
done

# Espera a que todos los trabajos paralelos terminen
wait

echo "Todos los archivos han sido procesados."

