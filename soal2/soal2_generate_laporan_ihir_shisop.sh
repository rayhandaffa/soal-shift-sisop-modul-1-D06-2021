
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
  printf("Transaksi terakhir dengan profit percentage terbesar yaitu %.1f dengan persentase %.1f%%.\n", barisID, maks);
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

#2c 
awk '
BEGIN{FS="\t"}
{
 if(NR>1)
   {
      listSeg[$8]++
   }
}

END {
    minPenjualan=5000
    for(segment in listSeg)
	{
          if(listSeg[segment] < minPenjualan)
	    {
		minPenjualan = listSeg[segment]
     		segmentMinimal = segment
            }
       	}
  printf("\nTipe segmen customer yang penjualannya paling sedikit adalah %s dengan %.1f transaksi.\n",  segment, minPenjualan);
#printf(%s", segment);
}' /home/rayhandapis/Downloads/Laporan-TokoShiSop.tsv >> hasil.txt

#2d
export LC_ALL=C
awk '
BEGIN{FS="\t"}
{
 if(NR!=1)
   {
     listGabungan[$13]+=$21
   }
}

END {
    profitMinimum=5000
    for(region in listGabungan)
    {
      if(listGabungan[region] < profitMinimum)
	{
	   listGabungan[region] = profitMinimum
           regionMinimum = region
        }
    }
printf("\nWilayah bagian (region) yang memiliki total keuntungan (profit) yang paling sedikit adalah %s dengan total keuntungan %.1f\n", region, listGabungan[region]);
#printf("%.1f", listGabungan[region]);
}' /home/rayhandapis/Downloads/Laporan-TokoShiSop.tsv >> hasil.txt
