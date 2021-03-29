#!/bin/bash 
#3a
#download gambar dulu
for foto in {1..23}
do
wget -a Foto.log "https://loremflickr.com/320/240/kittem" --output-document "Koleksi_$foto.jpg"
done

#terus ngapus gambar yang sama
declare -A foto_kucing
shopt -s globstar

for foto in K*_*
do
 [[ -f "$foto" ]] || continue

 read cksm _ < <(md5sum "$foto")
  if ((foto_kucing[$cksm]++))
     then #echo  
         rm $foto
  fi
done

#ganti nama file sesuai urutan setelah di apus
for foto in {1..9}
do
 if [ -f Koleksi_$foto.jpg ]
     then 
        mv  "Koleksi_$foto.jpg" "Koleksi_0$foto.jpg"
 fi
done

