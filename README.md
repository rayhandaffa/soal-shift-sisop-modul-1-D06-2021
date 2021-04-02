# Sistem Operasi D-06 (2021)
Praktikum Sistem Operasi Modul 1 - Shell Script, Cron dan AWK 
Kelompok : 
1. Ramadhan Arif - 05111940000162
2. Zulfayanti Sofia Solichin - 05111940000189
3. Rayhan Daffa Alhafish - 05111940000227

## Penjelasan dan Penyelesaian Soal 1
Pada soal ini terdapat sebuah file syslog.log yang berisi data-data yang dapat kita ambil datanya berdasarkan beberapa kondisi antara lain akan dijelaskan dalam penjelasan soal<br>
- **Penjelasan dan Penyelesaian Soal 1a**<br>
  Pada soal 1a kita diminta untuk menampilkan informasi jenis log, pesan log, dan username pada setiap baris lognya dari file sylog.log dengan menggunakan regex.<br>
    ```
     cat syslog.log | cut -f6- -d' '
    ```
  Pada syntax diatas terdapat `cat syslog.log` untuk menampilkan isi file, namun karena terdapat beberapa data yang tidak perlu dimunculkan, dan data yang perlu dimunculkan merupakan kata ke-6 sampai akhir line maka digunakan syntax `cut -f6- -d' '` untuk memotong bagian yang ingin ditampilkan. Syntax tersebut bekerja dengan cara hanya mengambil data dari `f6` sampai akhir line dimana setiap `f` dibatasi dengan spasi. Hasil output dari soal ini dapat dilihat dibawah ini.<br>
 
    ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%201a.png)<br>
 
 - **Penjelasan dan Penyelesaian Soal 1b**<br>
   Pada soal 1b kita diminta untuk menampilkan jumlah pesan ERROR beserta banyak kemunculannya.<br>
    ```
    cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c
    ```
   Berdasarkan syntax diatas, pengerjaan 1b ini mirip dengan 1a namun hanya menampilkan yang error saja oleh karena itu digunakan syntax `grep "ERROR"` dimana nantinya data yang dimunculkan hanya data yang memiliki tulisan "ERROR". Selain itu digunakan syntax ` cut -d' ' -f7- | cut -d'(' -f1 ` dikarenakan posisi keterangan error terdapat pada kata ke-7 sampai dengan sebelum tanda kurung buka, maka selain dibuat batasan di awal, dibuat juga batasan di akhir dimana kata terakhir yang di ambil merupakan kata sebelum tanda kurung buka.<br>
   Lalu digunakan `sort` unntuk mengurutkan data, agar nantinya data yang memiliki pesan error yang sama dapat dihitung dan hitungan disimpan dengan menggunakan syntax `uniq -c`. Hasil output dapat dilihat sebagai berikut:<br>
   
   ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%201b.png)<br>

 - **Penjelasan dan Penyelesaian Soal 1c**<br>
  Pada soal 1c kita diminta untuk menampilkan log ERROR dan INFO yang terdapat pada setiap usernya.<br>
  Pertama-tama data yang ditampilkan merupakan jumlah ERROR pada setiap user<br>
     ```
       cat syslog.log | grep "ERROR" | cut -d'(' -f2- | cut -d')' -f1 | sort | uniq -c
      ```
    Pada syntax diatas terdapat `cat syslog.log` untuk menampilkan isi file, digunakan `grep "ERROR"` karena hanya akan mengambil data errornya saja, lalu dilanjutkan dengan ` cut -d'(' -f2- | cut -d')' -f1 ` untuk mengambil data username saja, karena data username terletak didalam kurung setelah itu digunakan `sort` unntuk mengurutkan data, agar nantinya data error dengan username yang sama dapat dihitung dan hitungan disimpan dengan menggunakan syntax `uniq -c`. Hasil output dapat dilihat sebagai berikut:<br>
  
   ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%201c.png)<br>

 - **Penjelasan dan Penyelesaian Soal 1d**<br>
 Pada soal 1d kita diminta untuk memasukkan data pada soal 1b ke dalam file error_message.csv dengan header Error, Count yag kemunculannya diurutkan berdasarkan jumlah pesan error paling banyak.<br>
 
   ```
       cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | grep -Eo '[0-9]{1,}' > counter.csv
   ```
   
   Karena data yang digunakan merupakan data yang sudah diambil pada soal nomor 1b, maka dapat digunakan syntax yang sama namun ditambahkan `sort -nr` untuk mengurutkan data dengan nomor yang paling besar ke paling kecil, lalu digunakan `grep -Eo '[0-9]{1,}' > counter.csv` untuk hanya mengambil data berupa angka yang selanjutnya angka tersebur disimpan ke dalam file sementara `counter.csv`<br>
 
    ```
       cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > message.csv
    ```
    
   Dengan menggunakan metode yang sama namun menggunakan `tr -d '[0-9]' ` untuk tidak mengambil data berupa angka dan menggunakan `sed -e 's/^[[:space:]]*//' > message.csv` untuk menghapus spasi pada awal kalimat pesan error dan menyimpan pesan error tersebut pada file sementara `message.csv.csv`<br>
 
    ```
       paste message.csv counter.csv | while IFS="$(printf '\t')" read -r f1 f2
    ```
    
   Syntax di atas digunakan untuk menyalin data pada file `message.csv` dan `counter.csv` lalu setiap file tersebut disimpan sebagai `f1` dan `f2`<br>
    ```
       do
         printf "$f1,$f2\n"
       done >> error_message.csv
    ```
    `printf "$f1,$f2\n"` digunakan untuk menampilkan data `f1` dan `f2` yang dibatasi oleh koma setelah itu data dimasukkan ke dalam file `error_message.csv`<br>
       Hapus file sementara yang sudah tidak dibutuhkan dengan menggunakan `rm message.csv` dan `rm counter.csv`. Tampilan pada file `error_message.csv` terlihat sebagai berikut: <br>
   
   ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%20csv%201d.png)<br>
    
 - **Penjelasan dan Penyelesaian Soal 1e**<br>
 Pada soal 1e kita diminta untuk membuat file yang berisi data pada poin c yang sudah disatukan dalam file `user_statistic.csv` dengan header Unsername,INFO,ERROR dan diurutkan berdasarkan username secara ascending.<br>
    ```
        printf 'Username, INFO, ERROR\n' > user_statistic.csv
        cat syslog.log | cut -d'(' -f2- | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > user.csv
        cat syslog.log | grep "ERROR" | cut -d'(' -f2- | cut -d')' -f1 | sort | uniq -c | grep -Eo '[0-9]{1,}' > countererror.csv
        cat syslog.log | grep "ERROR" | cut -d'(' -f2- | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > usererror.csv
        cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | grep -Eo '[0-9]{1,}' > counterinfo.csv
        cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > userinfo.csv
        while read username
        do
           user="$username"
           info=0
           error=0
  
          paste counterinfo.csv userinfo.csv | (while read countinfo userinfo
          do
           if [ "$user" == "$userinfo" ]
             then 
             info=$countinfo 
             break
           fi
        done

         paste countererror.csv usererror.csv | (while read counterror usererror
         do
         if [ "$user" == "$usererror" ]
           then 
           error=$counterror 
           break
         fi
        done

       printf "$user,$info,$error\n" >> user_statistic.csv))
       done < user.csv

      rm user.csv
      rm countererror.csv
      rm usererror.csv
      rm counterinfo.csv
      rm userinfo.csv
    ```
    Penyelesaian yang dapat dilakukan pertama yaitu membuat file sementara `user.csv` sebagai tempat untung menampung semua nama username yang terdapat pada data. Lalu membuat file sementara `countererror.csv` untuk menyimpan jumlah log error yang dimiliki oleh setiap user dan juga membuat file semetara `usererror.csv` untuk menyimpan nama user yang memiliki log error. Sama seperti error, dibuat juga file sementara `counterinfo.csv` untuk menyimpan jumlah log info yang dimiliki oleh setiap user dan juga membuat file semetara `userinfo.csv` untuk menyimpan nama user yang memiliki log info.<br>
 Setelah data terkumpul, dilakukan nested looping untuk membandingkan username pada `user.csv` dengan file `usererror.csv` dan `userinfo.csv`. Jika barisnya memiliki data yang sama, variable yang menyimpan jumlah info dan error akan diubah berdasarkan pada file `countererror.csv` dan `counterinfo.csv`. Lalu data dimasukkan secara urut ke dalam file `user_statistic.csv`. Setelah seluruh data dimasukkan ke dalam file, hapus semua file sementara yang sudah tidak dibutuhkan. Tampilan pada file `user_statistic.csv` terlihat sebagai berikut:<br>
   ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%20csv%201e.png)
 
### **Kendala yang di alami selama mengerjakan soal 1**<br> 
Terdapat beberapa kendala yang dialami saat mengerjakan soal no 1 yaitu :
1. Pada saat pengerjaan soal 1d terdapat error karena digunakannya `grep -o` untuk mencari setiap pesan error yang terdapat pada data lalu tiap line diakhiri dengan menampilkan jumlah kemunculannya, namun cara ini tidak berhasil untuk mengurutkan kemunculan data berdasarkan banyaknya pesan error dari pesan error terbanyak.
2. Pada saat pengerjaan soal 1e terdapat kesalahan ketika mengurutkan nama user secara ascending namun kami mengurutkan data berdasarkan kemunculan terbanyak.
3. Pada saat pengerjaan soal 1d dan 1e dikarenakan dapat menggunakan data dari hasil pengerjaan soal 1b dan 1c kami berencana mengubahnya menjadi suatu variable, namun cara tersebut tidak berhasil.

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
  Berdasarkan potongan *coding*an, pada soal 2b menggunakan *`if`(condition)* untuk memeriksa dan menemukan data-data dari tabel data `Laporan-TokoShisop.tsv`. Untuk `$2~"2017"` artinya pada tabel data tersebut ada sebuah kolom bernama `Order ID` dan berisi tanggal dimana order itu dibuat dan pada soal ini hanya menampilkan data-data pada tahun 2017. Selanjutnya, untuk `$10=="Albuquerque"` dimana artinya terdapat sebuat kolom `City` dan hanya menampilkan kota bernama Albuquerque. Lalu, ketika `nama customer` yang sesuai dengan ketentuan udah di dapatkan lalu nama-nama tesebut akan simpan di sebuah array bernama `listCustomer{$7}++` dimana `$7` ini merupakan sebuah kolom bernama `Customer Name` dan terdapat sebuah iterasi digunakan untuk menampilkan semua nama pada array sesuai format atau ketentuan. <br>
  
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
 Pada soal 2d hampir sama dengan 2c tetapi terdapat beberapa perbedaan yang mencolok yaitu dimana pada soal 2d diminta untuk menampilkan wilayah bagian yang memiliki total keuntungan (profit) yang paling sedikit. Sama seperti dengan di 2c hal yang paling utama adalah menghitung profit di masing-masing region. 
  ```
     {
       if(NR!=1)
        {
          listGabungan[$13]+=$21
        }
 
     }
  ```
   Terdapat sebuah array `listGabungan` dengan index = kolom `region` yang berada di kolom 13 (`$13`). Akumulasi keuntungan masing-masing region dihitung dengan menggunakan `listGabungan[$13]+=$21` yang dimana `$21` merupakan sebuah kolom yang merujuk `Profit`.
   
  ```
      {
         profitMinimun=5000
         for(region in listGabungan)
         {
          if(listGabungan[region] < profitMinimum)
              {
                 listGabungan[region] = profitMinimum
                 regionMinimum = region
               }
          }
          printf ("\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah  %s dengan total %.1f\n", region, listGabungan[region]);
       }
   ```
   Potongan program ini dijalankan guna untuk menge-*check* dan mencari jumlah profit atau keuntungan di masing-masing wilayah(region). Jika total keuntungan dari suatu region lebih kecil dibandingkan nilai yang disimpan maka akan tercetak sebuah index bernama `region` dan sebuah total keuntungan yang paling kecil bernama `profitMinimum`.
 
- **Penjelasan dan Penyelesaian Soal 2e**<br>
   Pada soal 2e meminta kita untuk membuat script hasil dari soal 2a, 2b, 2c, dan 2d yang disimpan ke `hasil.txt`. Dapat dilihat seperti dibawah ini: <br>

   ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/hasil%2Ctxt.jpg)<br>
   
     Di akhir setiap program pada nomer 2a, 2b, 2c, maupun 2d terdapat sebuah syntax `Laporan-TokoShisop.tsv >> hasil.txt` output semua soal 2 akan ditampilkan pada file `hasil.txt` dengan melakukan redirection untuk mengirim output ke file `hasil.txt`. 
     
 ### **Kendala yang di alami selama mengerjakan soal 2**<br> 
 Terdapat beberapa kendala yang kami alami saat mengerjakan soal no 2 yaitu :
 1. Pada saat mengerjakan soal no 2a kami mengalami beberapa error yaitu ketidaksesuaian saat meng-*run* program yang seharusnya 9952 dengan 100% malah 9964 dan tidak keluar hasil persenannya.
 2. Selanjutnya, kami mengalami error ketika menjalankan program 2b karena kami pada soal 2a memakai `\home\rayhandapis\Documents\PraktikumSisop\M1 >> hasil.txt` yang dimana seharusnya menggunakan tanda `>` saja sehingga tidak me-*replace* yang sudah ada.
 3. Kemudian pada saat mengerjakan soal no 2b, terdapat error yaitu ketika salah meng*print* hasil yaitu seharusnya hanya beberapa nama yang memiliki data di Kota `Albuquerque` dan pada tahun 2017. Hal ini disebabkan karena terjadinya kesalahan penulisan `City` yang seharusnya `Albuquerque` kami menulisnya `Albequerque`.
 4. Pada soal no 2c dan 2d kami memiliki error yang sama yaitu ketika kami menyimpan variabel yang di itung menggunakan variable yang sama. Sehingga, data tersebut tidak tersimpan.
 5. Error yang terakhir yang kami alami yaitu ketika mem*print* hasil program nomer 2d salah menggunakan `$d` yang seharusnya `"%.1f` ketika memprint profitMinimum. 
## Penjelasan dan Penyelesaian Soal 3
- **Penjelasan dan Penyelesaian Soal 3a**<br>
  Pada program ini, pertama-tama, dibuat sebuah variabel yang menyatakan nomor gambar, dimulai dari nomor 1. Berikutnya dilakukan iterasi selama gambar kurang dari 23.
  ```
  image=1
  
  for((i=1;image<=23;i=i+1))
  do
  ```
  Untuk mendownload file gambar pada link tersebut, digunakan command `wget`, kemudian log hasil gambar tadi diatur sedemikian agar disimpan dalam file Foto.log, serta beri nama file gambar tersebut dengan newKitten.
  ```
  wget "https://loremflickr.com/320/240/kitten" -a Foto.log -O newKitten
  ```
  Sejak iterasi kedua, file gambar yang di-download dibandingkan dengan file gambar pertama menggunakan perintah `cmp`. Perintah ini memungkinkan untuk membandingkan dua file dari jenis apa pun dan menulis hasilnya ke output standar.
  ```
  reduplicate=`cmp $prevKitten newKitten -b`
  ```
  Jika setelah dicek ternyata ada duplikasi, maka file gambar newKitten yang sudah di-download akan dihapus menggunakan perintah rm. Namun jika tidak, maka file newKitten akan diganti namanya dan disimpan di folder.
  ```
  if [ $duplicate -eq 1 ]
  then
      rm newKitten
  else
      mv newKitten `printf "Koleksi_%02d" "$image"`
      image=$((image+1))
  fi
  ```
  Program ini dijalankan berulang kali hingga total 23 gambar telah diperoleh. Serta, output log dapat dilihat dalam file Foto.log.
  ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%20soal3a.sh.png)<br>
  ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%20soal3a.Foto.log.png)<br>
 
- **Penjelasan dan Penyelesaian Soal 3b**<br>
  Pada program soal3b.sh ini, digunakan script seperti soal3a.sh. Namun ditambahkan sedikit modifikasi agar file gambar yang di-unduh beserta log-nya disimpan dalam folder dengan nama tanggal unduhnya dengan format "DD-MM-YYYY" (contoh : "13-03-2023").

  Dibuat sebuah variable `Date` untuk menampung tanggal pada hari ini dengan format "DD-MM-YYYY".
  ```
  Date=$(date +'%d-%m-%Y')
  ```
  Berikutnya, buat sebuah folder/direktori dengan nama tanggal pada hari ini yang telah tersimpan dalam variable `Date`.
  ```
  mkdir "$Date"
  ```
  Lalu, ubah direktori saat ini ke dalam folder "Date" dan eksekusi script yang sama seperti pada soal3a.sh. File gambar beserta log-nya dapat terunduh dan tersimpan di folder tanggal saat ini.
  ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%20soal3b.sh.png)<br>
  ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%20soal3b.Foto.log.png)<br>

- **Penjelasan dan Penyelesaian Soal 3c**<br>
  Pada program soal3c.sh ini, diperlukan untuk mengunduh gambar kucing dan kelinci secara bergantian (yang pertama bebas. contoh : tanggal 30 kucing > tanggal 31 kelinci > tanggal 1 kucing > ... ). Oleh karena itu, ditambahkan suatu program untuk mengecek apakah hari ini tanggal ganjil atau genap sebagai berikut.
  ```
  Divisor=2
  Day=$(date -d "$D" '+%d')
  let Mod=$Day%$Divisor
  ```

  Apabila hari ini tanggal ganjil maka `Mod` bernilai satu dan akan dibuat folder untuk Kucing (contoh : "Kucing_13-03-2023"), sedangkan apabila genap maka `Mod` bernilai nol dan akan dibuat folder untuk Kelinci (contoh : "Kelinci_14-03-2023"). Berikut ini adalah code rincian untuk membuat direktorinya.
  ```
  if [ $Mod -eq 1 ]
  then
      # Kucing_
      Date=$(date +'%d-%m-%Y')
      mkdir "Kucing_$Date"
      cd "Kucing_$Date"
  else
      # Kelinci_
      Date=$(date +'%d-%m-%Y')
      mkdir "Kelinci_$Date"
      cd "Kelinci_$Date"
  fi
  ```
  Dan juga pada bagian untuk mengunduh file, dilakukan program untuk pengecekan. Jika hari ini tanggal ganjil yang mana `Mod` bernilai satu, maka gambar kucing diunduh. Sebaliknya, jika `Mod` bernilai selain 1, maka gambar kelinci diunduh.
  ```
  if [ $Mod -eq 1 ]
  then
      # Kucing_
      wget "https://loremflickr.com/320/240/kitten" -a Foto.log -O newKitten
  else
      # Kelinci_
      wget "https://loremflickr.com/320/240/bunny" -a Foto.log -O newKitten  
  fi
  ```
  Untuk code selanjutnya sama dengan program soal3b.sh.
  Berikut ini adalah screenshot hasil direktori yang telah didapatkan.
  ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%20soal3c.sh%20with%20Foto.log.png)<br>

- **Penjelasan dan Penyelesaian Soal 3d**<br>
  Pada program soal3d.sh ini, diperlukan untuk mengamankan atau membuat script yang akan memindahkan seluruh folder ke zip yang diberi nama "Koleksi.zip" dan memberi password berupa tanggal pada hari ini dengan format "MMDDYYYY" (contoh : “03032003”).

  Cara untuk memindahkan seluruh folder ke zip dapat dilakukan dengan script bash sebagai berikut.
  ```
  DatePass=$(date +'%d%m%Y')
  zip -P "$DatePass" -r Koleksi.zip "Kucing_$Date"
  ```
  DatePass berisi password untuk tanggal hari ini. Dan command `zip -P` berfungsi untuk memberi password melalui command line, sedangkan `-r` berarti mengkompresi file-file di dalamnya secara rekursif.

  Untuk lebih lengkapnya, berikut ini adalah script bash untuk mengkompresi direktori Kucing maupun Kelinci sesuai tanggal pada hari ini.
  ```
  cd -

  if [ $Mod -eq 1 ]
  then
      # Kucing_
      DatePass=$(date +'%d%m%Y')
      zip -P "$DatePass" -r Koleksi.zip "Kucing_$Date"
  else
      # Keclinci_
      DatePass=$(date +'%d%m%Y')
      zip -P "$DatePass" -r Koleksi.zip "Kelinci_$Date"
  fi
  ```
  Berikut ini adalah screenshot hasil memindahkan folder ke zip.
  ![ssshift1](https://github.com/rayhandaffa/soal-shift-sisop-modul-1-D06-2021/blob/main/ss%20shift1/ss%20soal3d.sh%20with%20Foto.log.png)<br>


 ### **Kendala yang di alami dalam mengerjakan soal 3**<br>
 Terdapat beberapa kendala yang kami alami saat mengerjakan soal no 3 yaitu :
 1. Pada saat mengerjakan soal3a.sh terdapat error seperti file gambar yang telah di-download tidak mencapai 23 file.
 2. Pada saat mengerjakan soal3a.sh selanjutnya telah terdapat perbaikan, namun kurang efisien karena masih mendownload sampai 46 file. Sehingga dilakukan perbaikan agar download secukupnya hingga target 23 file tercapai.
 3. Pada saat mengerjakan soal3c.sh sempat mengalami kesalahan pada sintaks yang menyebabkan program menjadi error.
 4. Pada saat mengerjakan soal3d.sh mengalami kesalahan direktori untuk kompresi sehingga kompresi tidak dapat dilakukan.
