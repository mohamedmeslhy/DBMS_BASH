#delete database
function delete_database {
    echo "select database to delete..."
    list_database
    read db_delete
    if [ -d DBS/$db_delete ]
    then 
        rm -r DBS/$db_delete
        echo "*****************************************************************"
        echo "*                                                               *"
        echo "       $db_delete DataBase has been deleted successfuly          "
        echo "*                                                               *"
        echo "*****************************************************************"         
        main
    
    else
        echo "no such database called $db_delete, enter 1 to delete another DB or any thing else for main menu."
        select choice in "Delete DB" 
        do
            case $REPLY in
            1)
                delete_database
                ;;
            *)
                main     
                ;;
            esac
        done
    fi    
}


#delete table
function drop_table {
    ls
    echo ""
    echo "which table you want to delete .. ?"
    read dl_file
    if [ -f $dl_file ]
    then 
        rm $dl_file
        echo "*****************************************************************"
        echo "*                                                               *"
        echo "     your table $dl_file has been deleted successfully     " 
        echo "*                                                               *"
        echo "*****************************************************************"         
    else
        echo "There's no table with this name. Enter existing file name ..."
        echo ""
        select choice in 'try again' 'tables menu'
        do
            case $REPLY in
                1)
                    drop_table
                    ;;
                2) 
                    echo "*****************"
                    echo ""
                    DB_menu
                    ;;
                *)
                   echo " you should select from two options only .... "
            esac        
        done
    fi
}

