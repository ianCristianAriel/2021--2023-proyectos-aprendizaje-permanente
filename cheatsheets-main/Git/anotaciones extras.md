Tags--Sirve como referencia al momento de clonar y hacer pushs
git tag (tag simple) [Contenido del tag]
git tag -a (Para que sea un tag extenso) [Contenido del tag]
git tag (aca puede ir o no "-a") [contenido del tag] [numero exadecimal de commit] (Para que sea de un commit expesifico)

checkout--Sirve para restablecer todo a como estaba en un determinado commit incluso desacer el historial que quedaba luego del mismo
git checkout [contenido de tag de un determinado commit o su numero exadecimal]

revert--Cumple la misma funcion que checkout excepto el borrado del historial o log de cambios. En este caso el log permanece intacto
git revert [tag / codigo exadeximal del commit]

rm-- Sirve para eliminar un fichero del seguimiento
git rm [nombre del ficher y su extencion]

--Anotaciones--
Head--Es donde se ubica el area de trbajo actual, naturalmente es el del ultimo commit
branch--Cada vez que se cre una rama, se hace desde el ultimo commit de la rama actual

branch--crea ramas
git branch [nombre de la rama a crear]
git branch [nombre de la rama a crear] [nombre de la rama espesifica desde donde se crea]
git branch [nombre de la rama a crear] [numero exadecimal o tag espesifico de donde se quiera crear la rama]
git branch [nombre de la rama a crear] [nombre de la rama espesifica desde donde se crea] [numero exadecimal o tag espesifico de donde se quiera crear la rama]

rebase--Equivale a un merge, pero dejando todo en una sola linea. Normalmente se utiliza solo en local
git rebase [tag del commit espesifico]

stash--Se utiliza para pasar lo realizado luego del ultimo commit a un area aparte, denominada "stash"
git stash
git stash save "[Nombre]"
git stash apply (aplica lo realizado en el area de stash a su rama de origen)
git stash clear (limpia el historial luego de un: git stash apply)

cherry-pick--Mergea los cambios de un commit espesifico, en la rama actual
git cherry pick [hash del commit]
git cherry pick [hash del commit de inicio]..[hash del commit del final] (Cambios entre dos commit distintos, sin incluirlos)

reset--Mueve el head a un determinado commit
git reset --soft HEAD~[numero de posiciones que se desea volver hacia atras, por ejemplo: 2]

log online--Muestra los commits realizados, en una sola linea

reset hard--Descarta lo hecho ultimamente en local que todabia no se subio a remoto

git diff--Muestra las diferencias entre lo hecho en local y lo hecho en remoto
