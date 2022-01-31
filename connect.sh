 function connect_DB {
    echo "wich DataBase to connect?"
    list_database
    read db_connect
    if [ -d DBS/$db_connect ]
    then
        cd DBS/$db_connect
        DB_menu
    else
        echo "There is no DB with this name. press 1 to connect or anything else to main menu"
        select choice in "choose DB to connect" 
        do
            case $REPLY in
            1)
                connect_DB
                
                ;;
            *)
                
                main     
                ;;
            esac
        done
    fi
}