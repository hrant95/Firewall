
# bash script

# ip
function ipCase {
	echo 1 INPUT
	echo 2 OUTPUT
	echo 1 or 2\n

	read selected

	comand="sudo iptables -I "

	if [ "$selected" == 1 ]; then
		comand="$comand INPUT"
	else
		if [ "$selected" == 2 ]; then
			comand="$comand OUTPUT"
		else
			echo comm not found
		fi
	fi	

	echo Enter ip address!\n
	
	read ipAddress

	comand="$comand -s $ipAddress -j "
	
	echo 1 Enable
	echo 2 Disable
	echo 1 or 2\n

	read selected
	
	if [ "$selected" == 1 ]; then
		comand="$comand ACCEPT"
	else
		comand="$comand DROP"
	fi
	
	echo $comand

	# run command
	$comand
	
}

# port
function portCase {
	echo 1 INPUT
	echo 2 OUTPUT
	echo 1 or 2\n

	read selected

	comand="sudo iptables -I "

	if [ "$selected" == 1 ]; then
		comand="$comand INPUT"
	else
		if [ "$selected" == 2 ]; then
			comand="$comand OUTPUT"
		else
			echo comm not found
		fi
	fi	

	echo Enter port!\n
	
	read port

	comand="$comand  -p tcp --dport $port -j "
	
	echo 1 Enable
	echo 2 Disable
	echo 1 or 2\n

	read selected
	
	if [ "$selected" == 1 ]; then
		comand="$comand ACCEPT"
	else
		comand="$comand DROP"
	fi
	
	echo $comand

	# run command
	$comand
	
}

# mac
function macCase {
	echo 1 INPUT
	echo 2 OUTPUT
	echo 1 or 2\n

	read selected

	comand="sudo iptables -I "

	if [ "$selected" == 1 ]; then
		comand="$comand INPUT"
	else
		if [ "$selected" == 2 ]; then
			comand="$comand OUTPUT"
		else
			echo comm not found
		fi
	fi	

	echo Enter MAC address!\n
	
	read mac

	comand="$comand -m mac --mac-source $mac -j "
	
	echo 1 Enable
	echo 2 Disable
	echo 1 or 2\n

	read selected
	
	if [ "$selected" == 1 ]; then
		comand="$comand ACCEPT"
	else
		comand="$comand REJECT"
	fi
	
	echo $comand

	# run command
	$comand
	
}


echo 1 Ip
echo 2 Port
echo 3 MAC
echo 1 or 2 or 3\n
read selected

if [ "$selected" == 1 ]; then
	ipCase	
else
	if [ "$selected" == 2 ]; then
		portCase
	else
		if [ "$selected" == 3 ]; then
			macCase
		else
			echo comm not found
		fi
	fi
fi
