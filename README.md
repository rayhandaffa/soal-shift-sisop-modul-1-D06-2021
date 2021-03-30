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
   Sesuai syntax diatas dapat diartikan apabila kondisi value percent terbesar lebih kecil dibanding value persentaseprofit (Percentage Profit) maka, value yang menyimpan nilai perhitungan persentaseprofit akan disimpan di dalam sebuah variable "maks" lalu akan menyimpan IDnya. lalu pada bagian `END { }' /home/rayhandaffa/Downloads/Laporan-TokoShisop.tsv`akan memprintf-kan hasil perhitungan dengan persentase maksimalnya. Serta `Laporan-TokoShisop.tsv` merupakan nama file yang akan menjadi input pada soal ini.<br>
   
- **Penjelasan dan Penyelesaian Soal 2b**<br>
  Pada soal 2b ini terdapat sebuah kondisi dimana kita diminta untuk menampilkan nama customer yang melakukan transaksi pada tahun 2017 di Albuquerque. Untuk mendapatkan `nama customer` dapat dilihat syntax nya di bawah ini : 
  ```
  {
    if($2~"2017" && $10=="Albuquerque")
     {listCustomer[$7]++}
  }
  ```
  Berdasarkan potongan *coding*an, pada soal 2b menggunakan *`if`(condition)* untuk memeriksa dan menemukan data-data dari tabel data `Laporan-TokoShisop.tsv`. Untuk `$2~"2017` artinya pada tabel data tersebut ada sebuah kolom bernama `Order ID` dan berisi tanggal dimana order itu dibuat dan pada soal ini hanya menampilkan data-data pada tahun 2017. Selanjutnya, untuk `$10=="Albuquerque"` dimana artinya terdapat sebuat kolom `City` dan hanya menampilkan kota bernama Albuquerque. Lalu, ketika `nama customer` yang sesuai dengan ketentuan udah di dapatkan lalu nama-nama tesebut akan simpan di sebuah array bernama `listCustomer{$7}++` dimana `$7` ini merupakan sebuah kolom bernama `Customer Name` dan terdapat sebuah iterasi digunakan untuk menampilkan semua nama pada array sesuai format atau ketentuan. <br>
  
- **Penjelasan dan Penyelesaian Soal 2c**<br>
   Pada kondisi soal 2c kita diminta untuk menampilkan data dengan ketentuan segment dengan jumlah transaksi paling sedikit. Cara pertama untuk dapat menyelesaikannya yaitu pertama menghitung jumlah transaksi pada masing-masing segment customer. 
   ```
   {
    if(NR>1)
      {
         listSeg[$8]++
      }
   }
   ```
   `NR>1` dapat dijelaskan sebuah *number of records* atau dapat diartikan baris keberapa pada tabel file `Laporan-TokoShisop.tsv` tersebut, menggunakan `NR>1` agar dapat dimulainya pembacaan baris dimulai pada baris ke-2. Dan menggunakan sebuah array `listSeg[$8]++` guna untuk menghitung jumlah transaksi pada tabel Segment atau `$8` dan array tersebut berfungsi untuk menjadi index dan counter transaksi sebagi value-nya. Kemudian, setelah didapatkan jumlah transaksi tiap segmentnya maka selanjutnya kita menggunakan potongan codingan di bawah ini guna untuk mencari segment yang memiliki jumlah transaksi paling kecil
   
  ```
  {
     minPenjualan=5000
     for(segment in listSeg)
     {
       if(listSeg[segment] < minPenjualan)
       {
         minPenjualan = listSeg[segment]
         segmentMinimal = segment
       }
     }
      printf ("\nTipe segmen customer yang penjualannya paling sedikit adalah %s dengan %.1f transaksi\n", segment, minPenjualan);
  }
  ```
  Jika jumlah transaksi dari suatu segment lebih kecil dibandingkan transaksi yang disimpan (`minPenjualan`) maka jumlah transaksi (`listSeg[segment]`) dan index (`segment`) akan disimpan dalam variabel `segment` dan `minPenjualan`. Kemudian, hasilnya akan di cetak sesuai format.<br>
- **Penjelasan dan Penyelesaian Soal 2d**<br>
 
- **Penjelasan dan Penyelesaian Soal 2e**<br>

## Penjelasan dan Penyelesaian Soal 3
