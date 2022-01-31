
# create table
function touch_table () {
    touch $1
}


# metadata = how many columns and it's type
function cols_number () {
    echo "Enter How many columns you want ... "
    read  cols

    re='^[0-9]+$'
    if ! [[ $cols =~ $re ]]
    then
        echo "error: $cols Not a number"
        DB_menu
    else
        echo "okay your DB will have $cols coulmns"
    fi


    typeset -i cols_len=$cols
    cols_len=cols_len-1
    typeset -i i=0

    t=""
    n=""


    echo "***************************************************"
    echo "*                                                 *"
    echo "*  warning!: the first column will be your (PK)   *" 
    echo "*                                                 *"
    echo "***************************************************"    



    while [ $i -le $cols_len ]
    do

        if [ $i -eq $cols_len ]
        then
            echo "type for the column number $(( i + 1 ))" 

            select choice in 'string' 'number' 
            do
                case $REPLY in
                    1)
                        t="${t}string";col_name1;break
                        ;;
                    2)
                        t="${t}number";col_name1;break
                        ;;
                    *)
                        echo "Error select option 1 or 2";;
                esac			
            done
        else

            echo "type for the column number $(( i + 1 ))" 

            select choice in 'string' 'number' 
            do
                case $REPLY in
                    1)
                        t="${t}string;";col_name2;break
                        ;;
                    2)
                        t="${t}number;";col_name2;break

                        ;;
                    *)
                        echo "Error select option 1 or 2";;
                esac			
            done
        fi
            i=i+1

    done
    cols_name
}




# columns metadata = columns name
function cols_name () {
    
    
        touch_table $table_name
        echo $t >> $table_name
        echo $n >> $table_name

        echo "*****************************************************************"
        echo "*                                                               *"
        echo "     your $table_name table  has been added successfully     " 
        echo "*                                                               *"
        echo "*****************************************************************" 

}

function col_name1 () {
    echo "enter column name"
    read
    n="${n}$REPLY"    

}

function col_name2 () {
    echo "enter column name"
    read
    n="${n}$REPLY;"    
}
