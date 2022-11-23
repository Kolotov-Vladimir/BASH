#Условия
#Разработчику складских решений Андрею необходимо создать копию базы данные о заказах и деперсонализировать данные в ней.
#На вход приходит текстовая строка, содержащая разделенные пробелом номер заказа, имя, фамилию и стоимость заказа:
#order_id first_name second_name price
#Необходимо реализовать скрипт на bash (запуск под Ubuntu 20.04), который выведет на выход те же данные, но с хешированными именем и фамилией.
#Хеширование необходимо осуществлять утилитой sha1sum

#Примеры
#Вход:
#1 Иван Иванов 777

#Выход:
#1 f9c1c7766ad49ce9b46b23dbdd8a85bb01dffe3a 7af8ec5d9863b938bf49bb79158f0dd141e00e3d 777

#!/bin/bash
while [ ]
count=0
echo "Введите значение:"
read text
IFS=' ' read -ra my_array <<< "$text"
do
arr=()
for i in "${my_array[@]}"
do
    let "count = count + 1"
if	(($count == 1)); then
	arr+=$i
elif (($count == 4)); then	
	arr+=" "
	arr+=$i
else
k=$(echo $i | sha1sum | awk '{print $1}')
arr+=" "
arr+=$k
fi	
done
#echo $arr
echo ${arr[@]}
read -p "Хотите продолжить (y/n)? " answer
case ${answer:0:1} in
    y|Y )
    ;;
    * )
        echo No
		sleep 2
		exit
    ;;
esac
done
