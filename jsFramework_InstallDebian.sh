#!/bin/bash
#-----------------------------------------------------------------------------
#Con este bash se pretende instalar el framework en la version mas reciente 
#desde git.
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
#aca debe ir el nombre del archivo que se deje por defecto
echo "creando BD"
mysqladmin -u root -p create unaMas
#VERIFICAR
SALIDA=$(mysqlcheck --check unaMas --user="root" --password="Lunel2016")
echo $SALIDA
#echo $INSTALL_GIT
#-----------------------------------------------------------------------------