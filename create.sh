# create new database
 function create_DB {

    echo "enter your DB name"
    read DB_Name
    if [ -d DBS/$DB_Name ]
    then 
        echo "The DataBase called $DB_Name exist"
    else
        mkdir DBS/$DB_Name
        echo "*****************************************************************"
        echo "*                                                               *"
        echo "     your database $DB_Name has been created successfully     " 
        echo "*                                                               *"
        echo "*****************************************************************" 
    fi
}



# create tables in database
function create_table {
     
        echo " Enter name for the table you want to create ... "
        read table_name 
        if [ -f $table_name ]
        then
            echo "this table is already exist"
            DB_menu
        else
            cols_number
        fi
}
