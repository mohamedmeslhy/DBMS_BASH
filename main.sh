#!/bin/bash 

echo "Select Option From The Next Menu: "

if [ -d DBS ]
then
    echo "db is ready"
else
    mkdir DBS
fi


function main {
select choice in 'Create DataBase' 'List DataBase' 'Connect To Database' 'Drop DataBase'
do
	case $REPLY in
		1)
			create_DB
            main
            ;;
		2)
			list_database
            main
            ;;
		3)
		    connect_DB
            ;;
        4)
            delete_database
            ;;
		*)
			echo "you didn't choose option from the previos ones,are you sure you want to exit?"
            echo 'enter "y" to exit and anything else to main menu.'
            read ans
            if [ $ans = "y" ] || [ $ans = "Y" ]
            then
                exit 0
            else
                main
            fi
            ;;
	esac			
done
}

. ./update.sh
. ./select.sh
. ./delete_table.sh
. ./insert.sh
. ./db_menu.sh
. ./create.sh
. ./delete.sh
. ./connect.sh
. ./list.sh
. ./create_table_funs.sh
main