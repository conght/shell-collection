#!bin/sh

TraversalDir(){
    # $1 input path

    for file in `ls $1`
    do
        file=$1"/"$file
        echo $file
        if [ -f $file ]
        then
            echo $file;
        else
            TraversalDir $file;
        fi
    done
}

TraversalDir $1;

exit 0;
