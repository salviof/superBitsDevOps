
while read linha
do
    arquivos[ $idx ]="$linha"        
    (( idx++ ))
done < <(ls /home/salvioF)
cd /home
for arq in "${arquivos[@]}"
do
   :
   echo $arq
done

