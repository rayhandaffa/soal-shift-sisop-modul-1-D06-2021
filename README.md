# Sistem Operasi D-06 (2021)
Praktikum Sistem Operasi Modul 1 - Shell Script, Cron dan AWK 
Kelompok : 
1. Ramadhan Arif - 05111940000162
2. Zulfayanti Sofia Solichin - 05111940000189
3. Rayhan Daffa Alhafish - 05111940000227

## Penjelasan dan Penyelesaian Soal 1

## Penjelasan dan Penyelesaian Soal 2
Pada soal ini terdapat sebuah file TokoShisop.tsv yang berisi data-data yang dapat kita ambil datanya berdasarkan beberapa kondisi antara lain akan dijelaskan dalam penjelasan soal<br>
 - **Penjelasan dan Penyelesaian Soal 2a**<br> 
   Pada soal 2a terdapat sebuah kondisi dimana kita diminta untuk menampilkan Row ID dan profit persentase sesuai dengan rumus profit yang di sediakan yaitu dengan cara membagi profit dan cost price lalu dikalikan dengan 100, untuk cost proce dapat diperoleh dengan cara mengurangkan sales dan profit. <br>
   ```
   export LC_ALL=C
   awk '
   BEGIN{FS="\t"}
   ```
   Berdasarkan syntax diatas terdapat sebuah `export LC_ALL_LC=C` yang digunakan untuk memberi tahu mesin membaca tanda baca titik (.) jadi tanda baca (,). dan `{FS="\t"}` dapat diartikan untuk memberitahu bahwa *Field Separator*-nya adalah tab. <br>
   
   Hal pertama yang perlu lakukan adalah dengan menghitung nilai profit persentase sesuai rumus yang disediakan. Perhitungan dapat dilakukan dengan cara memasukkan value yang ada di dalam kolom. Kolom profit berada di posisi kolom 21 oleh karena itu kita dapat menulisnya dengan `$21` dan kolom sales berada di posisi kolom 18 (`$18`). Sesuai dengan rumus `Profit Percentage = (Profit / Cost Price) *100 ` maka dapat ditulis dalam terminal ubuntu seperti `persentaseprofit=$21/($18-$21)*100`. Lalu, setelah mendapatkan hasil dari perhitungan dapat melakukan perbandingan dengan if dan membuat variable baru bernama "maks" yang berguna untuk menyimpan nilai percent terbesar. Berikut syntax yang dapat dilihat di bawah ini: <br> 
   
   ```
   { 
    if (maks<=persentaseprofit)
      {maks=presentasiprofit;barisID=$ID}
   }
   ```
   Sesuai syntax diatas dapat diartikan apabila kondisi value percent terbesar lebih kecil dibanding value persentaseprofit (Percentage Profit) maka, value yang menyimpan nilai perhitungan persentaseprofit akan disimpan di dalam sebuah variable "maks" lalu akan menyimpan IDnya. lalu pada bagian `END { }' /home/rayhandaffa/Downloads/Laporan-TokoShisop.tsv`akan memprintf-kan hasil perhitungan dengan persentase maksimalnya. Serta `Laporan-TokoShisop.tsv` merupakan nama file yang akan menjadi input pada soal ini<br>
- **Penjelasan dan Penyelesaian Soal 2b**
  
- **Penjelasan dan Penyelesaian Soal 2c**
   
- **Penjelasan dan Penyelesaian Soal 2d**

- **Penjelasan dan Penyelesaian Soal 2e**
