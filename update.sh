function update_record () {
   
    # gathering information about updates
    echo "enter the table to update" 
    read table_to_update

    #check if the table is there.
    if [ ! -f $table_to_update ]
    then
    echo "*****************************************************"
    echo "*                                                   *"
    echo "*  warning! the table you entered does not existed  *" 
    echo "*                                                   *"
    echo "*****************************************************"  
        DB_menu
    fi

    #metadata for table
    typeset -i fnumber=1

    columns_names=`awk -F";" '{if(NR==2){for ( i=2 ; i<=NF; i++) {print $i}}}' $table_to_update;`


    #information for PK
    recordupdate_data=`awk -F";" '{print $1}' $table_to_update`

    for key in $recordupdate_data
    do
        if [ $key = "string" ] || [ $key = "number" ]
        then
            echo "-type: $key"
        else
            echo $key
        fi
    done

    echo "enter the pk for record to update."
    read pk_update

    echo "which column you want to update ..?"
    read c_name



    typeset -i l=0

    for vl in $columns_names
    do
        if [ $vl = $c_name ]
        then 
            l=l+1
        fi
    done


    if [ $l -eq 0 ]
    then 
        echo "there is no column with this name"
        echo ${columns_names[*]}
        DB_menu
    fi


    echo "what is the new value ?"
    read new_value


    typeset -i a=1
    
    for value in $recordupdate_data
    do
        if [ $value == $pk_update ]
        then
            for w in $columns_names
            do
                indexs=`awk -F";" '{if(NR==2){for ( i=1 ; i<=NF; i++) {if($i=="'$c_name'") {print i}}}}' $table_to_update;`
            done

            if [ $a -gt 2 ]
            then
                col_type=`awk -F";" -v"indexs=$indexs" '{if(NR==1) {print $indexs}}' $table_to_update;`
                if [[ $col_type = "number" && "$new_value" = +([0-9]) || $col_type = "string" && "$new_value" = +([a-zA-Z]) ]]
                then
                    old_value=`awk -F";" -v"indexs=$indexs" '{if(NR=="'$a'"){print $indexs}}' $table_to_update;`
                    `sed -i "/^$value/s/$old_value/$new_value/g" $table_to_update`
                else
                    echo "wrong type"
                fi
            else
                echo "you cant change metadata"
            fi

        fi
    a=a+1
    done
    
}

