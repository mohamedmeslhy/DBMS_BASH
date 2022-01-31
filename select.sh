function select_table () {
    ls
    echo ""
    echo "wich table to select from"
    read table_info
    select choice in 'select row' 'slect all' 'select coloumn'
    do
	case $REPLY in
		1)
			
            select_row
            DB_menu
            ;;
		2)
            select_all_table
            DB_menu
            ;;
		3)
            select_coulmn
		    DB_menu
            ;;
            
		*) 
        ;;
    esac
    done
}


function select_row () {

    recorded_data=`awk -F";" '{print $1}' $table_info`
    echo $recorded_data
    echo "enter the pk for record to display."
    read pk_display
    for value in $recorded_data
        do
            if [ $value == $pk_display ]
            then    

            sed -n "/^$pk_display/p" $table_info
            fi
        done   
}


function select_all_table() {
    all_table_data=`awk -F";" '{if(NR>1) {print $0,"\n"}}' $table_info;`
    for i in $all_table_data
    do
        echo $i
    done
}



function select_coulmn() {
    columns_select_names=`awk -F";" '{if(NR==2){for ( i=1 ; i<=NF; i++) {print $i}}}' $table_info;`

    # columns_names1=`awk -F";" '{if(NR==2){for ( i=1 ; i<=NF; i++) {print $i}}}' $table_info;`
    echo $columns_select_names

    echo "which column you want to select ..?"
    read c_select_name


# check if the colums existed   
    typeset -i l=0
    for vl in $columns_select_names
    do
        if [ $vl = $c_select_name ]
        then 
            l=l+1
        fi
    done


    if [ $l -gt 0 ]
    then
        for w in $columns_select_names
        do
            if [ $c_select_name = $w ]
            then
            indexs_select=`awk -F";" '{if(NR==2){for ( i=1 ; i<=NF; i++) {if($i=="'$c_select_name'") {print i}}}}' $table_info;`
            fi
        done
      
    
        columns_show=`awk -F";" -v"indexs_select=$indexs_select" '{if(NR>2){print $indexs_select}}' $table_info`
    else
        echo "there is no column with this name"
        echo ${columns_select_names[*]}
        DB_menu
    fi

    for vk in $columns_show
    do
        echo $vk
    done
    
}