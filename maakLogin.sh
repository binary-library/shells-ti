#check if they gave us a filename
if [[ -z $1 ]]; then
	#exit if they didnt
	echo "Geen bestandnaam gegeven";
	exit;
fi

#get a name
name="";
echo "Naam?";
read name;
#if name is empty use the whoami
if [[ -z  $name ]]; then
	name=$( echo whoami );
fi

#go in an infinite loop
while [ 1 ]; do
	echo "wachtwoord?";
	password_input="";
	read password_input;
	#read the password and check if its greater then 7
	if [ ${#password_input} -gt 7 ]; then
		echo "Bevestig";
		password_confirm="";
		read password_confirm;
		#read second password and check if its the same as previous one, if so delete the file we wanna write to
		if [[ "$password_input" == "$password_confirm" ]]; then
			rm $1;
			#if so sum will be the output of the md5sum command
			sum=$(echo "$password_input" | md5sum );
			echo "$name" >> $1;
			echo "$sum" >> $1;
			#output to file and exit
			exit;
		else
			echo "Wachtwoorden komen niet overeen";
		fi
	else
		echo "Wachtwoord te kort";
	fi
done
