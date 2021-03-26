
#!/bin/bash 

#2a
export LC_ALL=C
awk '
BEGIN{FS="\t"}
{
  persentasiprofit=$21/($18-$21)*100
}

{if(maks<=persentasiprofit)
 {maks=persentasiprofit;barisID=$1};
}

END {
  printf("Transaksi terakhir dengan profit percentage terbesar yaitu %d dengan persentase %d%%.\n", barisID, maks);
}' /home/rayhandapis/Downloads/Laporan-TokoShiSop.tsv > hasil.txt
#export LC_ALL=

#2b
awk '  
BEGIN{FS="\t"}
{
 if($2~"2017" && $10=="Albuquerque")
    {listCustomer[$7]++}
}
END {
  printf("\nDaftar nama customer di Albuquerque pada tahun 2017 antara lain:\n");
    {for(customer in listCustomer) 
       {printf ("%s\n", customer)}}
}' /home/rayhandapis/Downloads/Laporan-TokoShiSop.tsv >> hasil.txt 


