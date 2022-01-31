function delete_record () {
    echo "which table to delete from?"
    ls
    read table_to_delte_from

    echo "enter the pk for record to delete."
    read pk_del
    echo ""

    records_data=`awk -F";" '{if(NR>2) {print $1}}' $table_to_delte_from`


    for value in $records_data
    do
        if [ $value == $pk_del ]
        then
            sed -i "/^$pk_del/d" $table_to_delte_from
            echo "record deleted"
        fi
    done

    
}

