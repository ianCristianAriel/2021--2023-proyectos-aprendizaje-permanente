##Git flow:

#Para inicializar un seguimientode git mediante git flow.. se puede hace que se cree las ramas de manera automatica utilizando:
git flow init

#Luego preguntara el nombre de las distintas ramas. 
[Enter] #para que quede el por defecto 
[nombre a asignar] + [enter] #Para poner otro nombre que no sea el por defecto

#Para crear una nueva rama donde se desarrollaran los cambios, se utilia un comando alternativo al de creacion de ramas, el cua es predefinido dentro de gitflow
#En el caso de que se haya elegido otro nombre para la rama feature se debe remplazar feature por el nombre elegido para la rama
git flow feature start [nmbre a asignar a la rama] 

#Cuando se desea mergear el trabajo hecho en la rama feature, hacia la rama develop y eliminar la rama feature se utilia el comando:
#En el caso de que se haya elegido otro nombre para la rama feature se debe remplazar feature por el nombre elegido para la rama
git flow feature finish [nombre que se le asigno a la rama]

#Cuando hay una version estable en la rama develoop y se desea establecer una version dentro de la rama release se utiliza:
git flow release start [nombre de la version]

#Para mergear la version de la rama release a una version final dentro de la rama main, se utiliza:
#si hubo algun cambio se creara automaticamente una copia en rama develop tambien
#Luego de esto la rama release se elimina automaticamente
git flow release finish [nombre de la version]

#Si en el proseso quedo algun error a modificar se utiliza un hotfix, el cual creara una nueva version en main, hara una copia en develop (desde donde se modificara) y mergeara el cambio hecho a la version de main creada 
git flow hotfix start [nombre a dar al hotfix]
git flow hotfix finish hotfix [nombre que se le dio al hotfix] #para concluir el cambio
