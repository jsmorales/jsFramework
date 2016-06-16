#!/bin/bash
#-----------------------------------------------------------------------------
#Cuadros de dialogo con zenity
#-----------------------------------------------------------------------------
#ventana de informacion
#zenity --info --text "Hola Mundo, esta es una prueba de zenity."

#ventana de alerta
#zenity --warning --title="Prueba Zenity" --text "Esta es una alerta de zenity!"

#notificacion 
#zenity --notification --text "Hola esto es solo una notificación."

#menu con zenity
#opcion=$(zenity --list \
#--title="Elige una opcion:" \
#--column="numero" --column="Estado" --column="Solución" \
#1 Sediento "Beber" \
#2 Hambriento "Comer" \
#3 Ambas "Comer y beber" )

#echo "la opcion fue: "$opcion

#-----------------------------------------------------------------------------
#
zenity --info --text "Bienvenido a la Instalacion de jsFramework."

( echo "10" ; sleep 1
echo "20" ; sleep 1
echo "50" ; sleep 1
) |
zenity --progress \
--title="Dialogo de progreso" \
--text="Estoy haciendo cosas" \
--percentage=0

#-----------------------------------------------------------------------------
# Force Zenity Status message box to always be on top.
sleep 1 && wmctrl -r "Progress Status" -b add,above &

(
# =================================================================
echo "# Running First Task." ; sleep 2
# Command for first task goes on this line.

# =================================================================
echo "25"
echo "# Running Second Task." ; sleep 2
# Command for second task goes on this line.

# =================================================================
echo "50"
echo "# Running Third Task." ; sleep 2
# Command for third task goes on this line.

# =================================================================
echo "75"
echo "# Running Fourth Task." ; sleep 2
# Command for fourth task goes on this line.


# =================================================================
echo "99"
echo "# Running Fifth Task." ; sleep 2
# Command for fifth task goes on this line.

# =================================================================
echo "# All finished." ; sleep 2
echo "100"


) |
zenity --progress \
  --title="Progress Status" \
  --text="First Task." \
  --percentage=0 \
  

(( $? != 0 )) && zenity --error --text="Error in zenity command."

#exit 0
#-----------------------------------------------------------------------------