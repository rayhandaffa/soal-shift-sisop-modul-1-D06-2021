#!/bin/bash
#soal3a.sh

count=46
image=1

for((i=1;i<=count && image<=23;i=i+1))
do
    duplicate=0

    wget "https://loremflickr.com/320/240/kitten" -a Foto.log -O newKitten

    if [ $i -eq 1 ]
    then
        mv newKitten `printf "Koleksi_%02d" "$image"`
        image=$(($image+1))
    fi

    if [ $i -ne 1 ]
    then
        for ((j=1;j<image;j=j+1))
        do
            prevKitten=`printf "Koleksi_%02d" "$j"`

            #check for duplicates with comparison
            reduplicate=`cmp $prevKitten newKitten -b`

            if [ -z "$reduplicate" ]
            then
                duplicate=1
                break
            else
                duplicate=0
            fi
        done  
    fi

    if [ $i -gt 1 ]
    then
        if [ $duplicate -eq 1 ]
        then
            rm newKitten
        else
            mv newKitten `printf "Koleksi_%02d" "$image"`
            image=$((image+1))
        fi
    fi
done
