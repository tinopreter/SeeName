#!/bin/bash

##########################################################################
			#Banner
##########################################################################


 echo "     ___           ___           ___           ___           ___           ___           ___     	"
 echo "    /\__\         /\__\         /\__\         /\  \         /\  \         /\  \         /\__\  		"  
 echo "   /:/ _/_       /:/ _/_       /:/ _/_        \:\  \       /::\  \       |::\  \       /:/ _/_   	"
 echo "  /:/ /\  \     /:/ /\__\     /:/ /\__\        \:\  \     /:/\:\  \      |:|:\  \     /:/ /\__\  	"
 echo " /:/ /::\  \   /:/ /:/ _/_   /:/ /:/ _/_   _____\:\  \   /:/ /::\  \   __|:|\:\  \   /:/ /:/ _/_ 	"
 echo "/:/_/:/\:\__\ /:/_/:/ /\__\ /:/_/:/ /\__\ /::::::::\__\ /:/_/:/\:\__\ /::::|_\:\__\ /:/_/:/ /\__\	"
 echo "\:\/:/ /:/  / \:\/:/ /:/  / \:\/:/ /:/  / \:\~~\~~\/_ / \:\/:/  \/_ / \:\~~\  \/_ / \:\/:/ /:/  /	"
 echo " \::/ /:/  /   \::/_/:/  /   \::/_/:/  /   \:\  \        \::/__/       \:\  \        \::/_/:/  / 	"
 echo "  \ _/:/  /     \:\/:/  /     \:\/:/  /     \:\  \        \:\  \        \:\  \        \:\/:/  /  	"
 echo "    /:/  /       \::/  /       \::/  /       \:\__\        \:\__\        \:\__\        \::/  /   	"
 echo "    \/__/         \/__/         \/__/         \/__/         \/__/         \/__/         \/__/  v1.0	"

echo

echo "---------------------------------------------------xxxx------------------------------------------------"
echo "---------------------------------------------------xxxx------------------------------------------------"
						echo "Created	By: tinxpreter								  								 "
echo "---------------------------------------------------xxxx------------------------------------------------"
echo "---------------------------------------------------xxxx------------------------------------------------"
echo


##########################################################################
			#Main Code
##########################################################################

domain="$2"

#Clean the code upon Exit/Interrupt
trap "rm ./resultd.txt ./resultf.txt 2>/dev/null" EXIT
trap '{ echo "Hey, you pressed Ctrl-C.  Time to quit." ; exit 1; }' INT

#single domain CNAME lookup
single()
{
	dig "$domain" | grep "CNAME" | awk '{print "\033[33m" $1," \t", "\033[32m" $(NF-1), "\t", "\033[36m" $NF}' | tee -a ./resultd.txt

}

#Read each line of domain from file and perform a CNAME lookup
fileList()
{
	while read line; do
		###call the dig tool to do a CNAME lookup
		#host -t CNAME "$line" | grep 'is an alias for' | awk '{print $NF}'
		dig "$line" | grep "CNAME" | awk '{print "-", "\033[33m" $1," \t", "\033[32m" $(NF-1), "\t", "\033[36m" $NF}' | tee -a ./resultf.txt
	done < $domain

}


#########################################################################
				# Help
#########################################################################
Help()
{
	#Display Help
	echo "seeName (I promise, I'll work on a better Name) Is a simple CNAME lookup Tool"
	echo
	echo "Usage: ./seename.sh [options] [domain]"
	echo
	echo "options:"
	echo "-d		specify a single domain"
	echo "-L		load domains from a file"
	echo "-h		Displays this Help Message"
	echo
	echo "Example:"
	echo "	./seename.sh -d blog.example.com -o cnames.txt"
	echo "	./seename.sh -f domains.txt -o cnames.txt"
}



#########################################################################
				#Get Options
#########################################################################

while getopts ":dLh" option; do
	case "$option" in
		h) #Display Help
			Help
			exit;;
		d) #set single domain
			single
			exit;;
		L) #read domains from file
			fileList
			exit;;
		\?) #Invalid Option
			echo "Error: Invalid Option $option";
			echo "Use -h for help";
			exit;;
	esac
done

#no specified domain handler
if [ -z "$domain" ]; then
	echo "No domain was specified";
	echo "Use: ./seename.sh -h for help";
fi;
