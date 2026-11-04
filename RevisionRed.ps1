
# Monitoreo del estado de la red

Write-Host "========================================"
Write-Host "     MONITOREO DEL ESTADO DE LA RED"
Write-Host "========================================"

# Bucle que se repite exactamente 3 veces
for ($i = 1; $i -le 3; $i++) {

    Write-Host "`n----------------------------------------"
    Write-Host "Verificacion numero: $i"

    # Mostrar fecha y hora
    Write-Host "Fecha y hora:"
    Get-Date -Format "dd/MM/yyyy HH:mm:ss"

    # Condicional para identificar iteraciones pares o impares
    if ($i % 2 -eq 0) {
        Write-Host "La iteracion $i es PAR."
    }
    else {
        Write-Host "La iteracion $i es IMPAR."
    }

    # Obtener adaptadores de red activos
    $adaptadores = Get-NetAdapter | Where-Object {
        $_.Status -eq "Up"
    }

    # Comprobar el estado de los adaptadores
    if ($adaptadores) {
        Write-Host "Estado: Se encontraron adaptadores activos."
        $adaptadores | Format-Table Name, InterfaceDescription, Status
    }
    else {
        Write-Host "Estado: No se encontraron adaptadores activos."
    }
}

# Mensaje final
Write-Host "`n========================================"
Write-Host "MONITOREO CONCLUIDO CON EXITO"
Write-Host "========================================"
