# Obtener la ruta del directorio actual
$directorio_actual = Get-Location

# Cambiar al directorio donde se encuentran los archivos que deseas subir
Set-Location -Path "C:\Users\Admin\Desktop\daily"

# Obtener la fecha y hora actual
$timestamp = Get-Date -Format "yyyyMMddHHmmss"

# Renombrar el archivo upload.html con la fecha y hora actual
Rename-Item -Path "upload.html" -NewName "upload_$timestamp.html"

# Inicializar un repositorio Git si no está inicializado
if (!(Test-Path -Path ".git")) {
    git init
}

# Agregar todos los archivos al repositorio
git add .

# Confirmar los cambios con un mensaje que incluya la fecha y hora
git commit -m "Subida - $timestamp"

# Subir los cambios al repositorio remoto en la rama master
git push origin master

# Volver al directorio original
Set-Location -Path $directorio_actual
