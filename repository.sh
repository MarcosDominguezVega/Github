#!/bin/bash
echo "
#####################################################################################################################################################
#---------------------------------------------------------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------------------------------------------------------#
#-------------      _______       ____     ____________  -------------------------------------------------------------------------------------------#
#------------     /        |     |____|   |            |  ------------------------------------------------------------------------------------------#
#-----------     /    _____|      ____    |____    ____|   -----------------------------------------------------------------------------------------#
#----------     /    /           |    |       |    |        ----------------------------------------------------------------------------------------#
#---------     /    /    ___     |    |       |	   |         ---------------------------------------------------------------------------------------#
#----------    \    \   |   |    |    |       |	   |        ----------------------------------------------------------------------------------------#
#-----------    \    \__|   |    |    |       |	   |       -----------------------------------------------------------------------------------------#
#------------    \          |    |    |       |    |      ------------------------------------------------------------------------------------------#
#-------------    \_________|    |____|       |____|     -------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------------------------------------------------------#
#####################################################################################################################################################
"


espaciador(){
       	echo "<---------------------------------->"
}

archivo(){ 
	touch README.md
	echo "primer commit del repositorio" >> README.md
}

commit(){ 
	git add . -A
	echo "Introduce el nombre del commit: " 
	read commit
       	git commit -m "$commit"
}

directorio(){
	echo "Escribe el nombre del directorio: "
	read directorio
	mkdir $directorio && cd $directorio/
}

rama(){
	echo "Escribe el nombre de la rama: "
	read rama
	git branch $rama && git checkout $rama
}



echo "¿Quieres instalar git o actualizarlo?" ; read respuesta
if [[ $respuesta = "si" ]]
then
	sudo apt install git && sudo apt install gh && sudo apt upgrade -y 
	echo "Es necesario que configures tu git para poder empezar"
	echo "Escribe tu nombre y tu correo"

	echo "Usuario: " && read nombreUsuario ; git config --global user.name "$nombreUsuario"
	echo "Email: " && read correo ; git config --global user.email $correo
	echo "Crea un usuario en https://github.com dirijete a opciones de desarrollador y genera un token para el sigueinte paso"
	echo "Quieres registrar automaticamente tu cuenta de gitHub" ; read respuesta
	if [[ $respuesta = "si" ]]
	then
		git auth login
	fi

fi
	echo "¿Quieres crear un nuevo repositorio?" ; read respuesta

if [[ $respuesta = "si" ]]
then
	echo "Creando repositorio..."
	espaciador
	echo "Nombre del repositorio: " ; directorio ; git init . && archivo
	espaciador	
	ruta= pwd
	echo "Nombre del commit: " ; commit
	espaciador
fi

echo "¿Que deseas hacer?" ; 
opciones=(actualizar/clonar/eliminar/restaurar/remoto/ramas)
for i in "$opciones"
do
	echo $i
	espaciador
done && read opcion
case $opcion in
	"actualizar")
		echo "¿Que quieres actualizar? una rama(1) o un directorio(2)"
		read respuesta 
		if [[ $respuesta = 1 ]]
		then	
			echo "Muevete a donde quieres actualiza: "
			cd $ruta && espaciador
			commit; echo "Directorio actualizado"
		elif [[ $respuesta = 2 ]]
		then
			echo "Muevete a la rama master: "
			read ruta
			cd $ruta && git checkout branch $ruta && commit
		fi
		espaciador
		git show HEAD
	;;
	"clonar")
		echo "¿Quieres clonar un repositorio?" ; read respuesta
		if [[ $respuesta = "si" ]]
		then
			espaciador
			echo "Que repositorio es el que quieres clonar"
			read clonacion
			git clone $clonacion && clonaciones=($clonacion)	
				for i in "$clonaciones"
				do 
				      	echo "estas son las clonaciones anteriores"
					espaciador
					echo $i
				done
		fi			
	;;
	"eliminar")
		echo "¿Que quieres eliminar?"
		eliminaciones=(repositorios/ramas)
		posiciones=(trabajo/intercambio/temporal)
		for i in $eliminaciones
		do
			echo $i
		done
		echo "De donde quieres eliminar el archivo"
		espaciador
		read respuesta
		if [[ $respuesta = "repositorios" ]]
		then
			espaciador
			echo "¿Que forma de eliminacion quieres?" ; read forma
			for i in $posiciones
			do
				echo $i
			done
			case $forma in
				"trabajo")
					
					;;
				"intercambio")

					;;
				"temporal")

					;;
				*)
					echo "Opcion Invalida"
					;;
			esac
		elif [ $respuesta= "ramas" ]
		then
			echo "¿Que forma de eliminacion quieres?" ; read forma
			for i in $posiciones
			do
				echo $i
			done
			case $forma in
				"trabajo")
					;;
				"intercambio")
					;;
				"temporal")
					;;
				*)
					echo "Opcion Invalida"
					;;
			esac
		else
			echo "Error"
		fi
	
	;;
	"restaurar")
		echo "en mantenimiento..."
	;;
	"remoto")
		echo "¿Deseas crear un repositorio remoto?" ; read respuesta
		if [[ $respuesta = "si" ]]
		then
			git remote add .
		fi
	;;
	"ramas")
		echo "¿Cuantas ramas vas a crear?"
		read numero
		espaciador
		while [ $numero -ge 0 ]
		do
			echo "Escribe el nombre de la rama"
			espaciador
			rama && archivo ; commit &&  git checkout master
			espaciador
			git branch -av
			numero= $numero-1
		done
	;;
	*)
		echo 'Opcion no correcta'
	;;
esac








#####################################################################################################################################################
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#<------------------------------------------------------------------------------------------------------------------------------------------------->#
#####################################################################################################################################################
