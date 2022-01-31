
function insert () {

    echo "which table to insert in?"
    ls

    read ins_in_table

    typeset -i ins_cols=0
    ins_cols=`awk -F";" '{print NF; exit}' $ins_in_table`
    ins_cols=ins_cols-1 
    typeset -i z=0
    typeset -i o=1

    x=""

    while [ $z -le $ins_cols ]
    do

    col_type=`awk -F";" -v"o=$o" '{if(NR==1){print $o}}' $ins_in_table;`
    col_data=`awk -F";" -v"o=$o" '{if(NR==2){print $o}}' $ins_in_table;`
    
    
 
    typeset -i numberset=0


        while [ $numberset -eq 0 ]
        do
            echo "enter $col_data and its type must be $col_type" 
            read 
            if [ $z -eq 0 ]
            then
                if [ ! -z $REPLY ]
                then
                    
                    PK_values=`awk -F";" '{print $1}' $ins_in_table`
                    for i in $PK_values
                    do
                        if [ $REPLY == $i ]
                        then 
                            echo "you can't duplicate PK, please try again."
                            DB_menu                                                
                        fi
                    done

                    if [[ $col_type = "number" && "$REPLY" = +([0-9]) || $col_type = "string" && "$REPLY" = +([a-zA-Z]) ]]
                    then
                        x="${x}$REPLY;"
                        numberset=numberset+1
                    fi
                    
                else
                    echo "You won't be able to make insertion without enter your PK "
                    echo "Try again"
                    echo ""
                    DB_menu
            fi

            elif [ $z -eq $ins_cols ]
            then

                if [[ $col_type = "number" && "$REPLY" = +([0-9]) || $col_type = "string" && "$REPLY" = +([a-zA-Z]) ]]
                then
                    x="${x}$REPLY"
                    numberset=numberset+1
                fi
                

            else
            
                if [[ $col_type = "number" && "$REPLY" = +([0-9]) || $col_type = "string" && "$REPLY" = +([a-zA-Z]) ]]
                then
                    x="${x}$REPLY;"
                    numberset=numberset+1
                fi

            fi

        done
        o=o+1
        z=z+1
    done
    echo $x >> $ins_in_table
}
