#!/bin/bash

# Filtramos los intentos de conexiones fallidas sus IPs y las veces que se repite la misma linea.
grep "Failed password" $1 | grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}" | sort | uniq -c > count_ip.txt #Contador + IP

#Mostramos por pantalla el encabezado.
echo "Count, IP, Location"

while read line; do
	
	#Extraemos el numero de intentos fallidos y comprobamos que sean mayor a 10.
	count="$(echo $line | cut -d' ' -f1)"
	if [ $count -gt 10 ];
	then
		#Extraemos la IP y utilizando dicha IP genaramos la localización.
		ip="$(echo $line | cut -d' ' -f2)"
		localizacion=$(geoiplookup $ip | cut -b 28-40)
		echo $count', '$ip', '$localizacion #Imprimimos el resultado.
	fi
done < count_ip.txt | sort -Vr #Indicamos el fichero y lo ordenamos para el while.

#Borramos el fichero creado para no dejar ningun residuo.
rm count_ip.txt
