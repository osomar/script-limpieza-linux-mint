#!/bin/bash

echo "🚀 Iniciando actualización y limpieza del sistema..."

# Actualizar repositorios y paquetes
echo "🔄 Actualizando repositorios..."
sudo apt update -y

echo "⬆️  Actualizando paquetes del sistema..."
sudo apt upgrade -y
sudo apt full-upgrade -y

# Actualizar Flatpak y Snap
echo "📦 Actualizando paquetes Flatpak..."
sudo flatpak update -y

echo "📦 Actualizando paquetes Snap..."
sudo snap refresh

# Limpiar caché y paquetes huérfanos
echo "🧹 Limpiando caché de APT..."
sudo apt-get clean
sudo apt-get autoclean

echo "🧹 Eliminando paquetes huérfanos..."
sudo apt-get autoremove -y

# Opcional: Preguntar antes de borrar historial
read -p "¿Quieres borrar el historial de comandos? (s/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    history -c
    echo "🗑️  Historial de comandos borrado."
fi

echo "✅ ¡Limpieza y actualización completadas con éxito!"
