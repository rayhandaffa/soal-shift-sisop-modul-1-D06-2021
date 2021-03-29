#!/bin/bash 
cd /home/rayhandapis/Documents/PraktikumSisop/M1
namaDirek="$(date +%d)-$(date +%m)-$(date +%Y)" 
mkdir $namaDirek

bash /home/rayhandapis/Documents/PraktikumSisop/M1/soal3a.sh
mv *.jpg $namaDirek
mv Foto.log $namaDirek


