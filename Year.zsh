#!/bin/zsh
#
#Script que muestra una barra de progreso del año.
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


barra_progreso() {
    local longitud=$1
    local progreso=$2
    local barra=""
    local espacio=""
    
    # Calcular la cantidad de caracteres llenos y vacíos en la barra de progreso
    local caracteres_llenos=$((progreso * longitud / 100))
    local caracteres_vacios=$((longitud - caracteres_llenos))

    # Construir la barra de progreso
    for ((i = 0; i < caracteres_llenos; i++)); do
        barra+="█"
    done

    for ((i = 0; i < caracteres_vacios; i++)); do
        espacio+="░"
    done

    arriba=$longitud/2
    fecha=$(date +"%d-%m-%Y")
    algo=0
    columnas=$COLUMNS
    vacio=$(($COLUMNS-$longitud-4))
    vacio=$(($vacio/2))

    # Imprimir la barra de progreso
    echo -e "${(l[$vacio][ ])}\e[35mLlevamos ya un $progreso%, sigue intentandolo \e[0m"
    echo "${(l[$vacio][ ])}╔${(l[$((longitud+2))][═])}╗"
    echo "${(l[$vacio][ ])}║ ${(l[$((arriba-5))][ ])}\e[35m$fecha\e[0m${(l[$((arriba-5))][ ])} ║"
    echo -e "${(l[$vacio][ ])}║ \e[31m$barra\e[0m$espacio ║"
    echo -e "${(l[$vacio][ ])}║ \e[31m$barra\e[0m$espacio ║"
    echo -e "${(l[$vacio][ ])}║ \e[31m$barra\e[0m$espacio ║"
    echo -e "${(l[$vacio][ ])}║ 0%${(l[7][ ])}$((algo+=10))%${(l[7][ ])}$((algo+=10))%${(l[7][ ])}$((algo+=10))%${(l[7][ ])}$((algo+=10))%${(l[7][ ])}$((algo+=10))%${(l[7][ ])}$((algo+=10))%${(l[7][ ])}$((algo+=10))%${(l[7][ ])}$((algo+=10))%${(l[7][ ])}$((algo+=10))%${(l[4][ ])}$((algo+=10))% ║"
    echo "${(l[$vacio][ ])}╚${(l[$longitud+2][═])}╝"
}

# Obtener el año actual
año_actual=$(date +"%Y")

# Obtener el día del año actual
dia_actual=$(date +"%j")

# Calcular el progreso del año actual en porcentaje
progreso=$((dia_actual * 100 / 365))

col=$COLUMNS
if [[ col < 100 ]]; then
    # Imprimir la barra de progreso
    barra_progreso 10 $progreso
else 
    barra_progreso 100 $progreso
fi
