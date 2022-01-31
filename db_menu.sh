function DB_menu {
    echo "----------------------"
    echo "DataBase menu:"
    select choice in 'Create Table' 'List Tables' 'Drop Table' 'Select From Table' 'Insert into Table' 'Delete From Table' 'Update Table' 
    do
        case $REPLY in
            1)
                create_table
                DB_menu
                ;;
            2)
                list_table
                DB_menu
                ;;
            3)
                drop_table
                DB_menu
                ;;
            4)
                select_table
                DB_menu
                ;;

            5)  
                insert
                DB_menu          
                ;;
            
            6) 
                delete_record
                DB_menu
                ;;
            
            7) 
                update_record
                DB_menu
                ;;
        
            *)
                echo "you did'n choose option from the previos ones,are you sure you want to exit?"
                echo 'enter "y" to exit and anything else to main menu'
                read ans
                if [ $ans = "y" ] || [ $ans = "Y" ]
                then
                    exit 0
                else
                    cd ../..
                    main
                fi
                ;;
        esac			
    done
}