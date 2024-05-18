# Definir la ruta del directorio donde se encuentran los archivos
$directorio_actual = "C:\Users\Admin\Desktop\daily"

# Cambiar al directorio donde se encuentran los archivos
Set-Location -Path $directorio_actual

# Obtener la fecha y hora actual
$timestamp = Get-Date -Format "yyyyMMddHHmmss"

# Buscar el primer archivo con extensión .html en el directorio
$html_file = Get-ChildItem -Path $directorio_actual -Filter *.html | Select-Object -First 1

# Verificar si se encontró algún archivo HTML
if ($html_file -ne $null) {
    # Renombrar el archivo HTML encontrado con la fecha y hora actual
    Rename-Item -Path $html_file.FullName -NewName "upload_$timestamp.html"

    # Cambiar al directorio del repositorio Git
    Set-Location -Path "$directorio_actual\.git"

    # Confirmar los cambios con un mensaje que incluya la fecha y hora
    git commit -m "Subida - $timestamp"

    # Subir los cambios al repositorio remoto en la rama master
    git push origin master

    Write-Host "La subida desde el programador de tareas se ha realizado correctamente."
} else {
    Write-Host "No se encontraron archivos HTML en el directorio actual."
}

# Volver al directorio original
Set-Location -Path $directorio_actual
