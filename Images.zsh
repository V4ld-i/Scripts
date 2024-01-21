#!/bin/zsh
#
# Script que al pasar como argumento una url te descarga la imagen de esta
# -------------------------------------------------
#
#  ██▒   █▓▄▄▄      ██▓   ▓█████▄ ██▓
# ▓██░   █▒████▄   ▓██▒   ▒██▀ ██▓██▒
#  ▓██  █▒▒██  ▀█▄ ▒██░   ░██   █▒██▒
#   ▒██ █░░██▄▄▄▄██▒██░   ░▓█▄   ░██░
#    ▒▀█░  ▓█   ▓██░██████░▒████▓░██░
#    ░ ▐░  ▒▒   ▓▒█░ ▒░▓  ░▒▒▓  ▒░▓  
#    ░ ░░   ▒   ▒▒ ░ ░ ▒  ░░ ▒  ▒ ▒ ░
#      ░░   ░   ▒    ░ ░   ░ ░  ░ ▒ ░
#       ░       ░  ░   ░  ░  ░    ░  
#      ░                   ░
# -------------------------------------------------

# Verificamos si se proporciono un argumento
if [[ $# -lt 2 ]]; then
    echo -e "Es \e[31mnecesario\e[0m que: $0 <URL de la imagen> <nombre de la imágen>"
    exit 1
fi

# Obtenemos la URL de la imagen
url=$1

# Obtenemos el nombre de la imagen
nombre=$2

curl -o "$nombre" "$url"

echo -e "Imagen descargada \e[32mcorrectamente\e[0m"
