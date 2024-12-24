#!/bin/bash
#SBATCH -p hpc-bio-pacioli           # Cola/partición a usar
#SBATCH -D /home/alumno16/practica3/lab-git-Yaimy/ # Directorio de trabajo
#SBATCH --job-name=fastq_cut        # Nombre del trabajo
#SBATCH --output=cut_%j.out         # Archivo de salida
#SBATCH --error=cut_%j.err          # Archivo de error
#SBATCH --ntasks=4                  # Número de tareas (una por archivo)
#SBATCH --time=00:10:00             # Tiempo límite
#SBATCH --mem=1G                    # Memoria por nodo


# Ejecuta el script file-cut.sh desde el directorio de trabajo
bash /home/alumno16/practica3/lab-git-Yaimy/file-cute1.sh

