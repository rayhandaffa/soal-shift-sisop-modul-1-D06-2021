 #!/bin/bash

#a
printf 'Informasi jenis log, pesan log, dan username:\n'
cat syslog.log | cut -f6- -d' '
printf '\n';

#b
printf 'Pesan error dan jumlah kemunculan:\n'
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c
printf '\n';

#c
printf 'Jumlah ERROR:\n'
cat syslog.log | grep "ERROR" | cut -d'(' -f2- | cut -d')' -f1 | sort | uniq -c
printf "\n"
printf 'Jumlah INFO:\n'
cat syslog.log | grep "INFO" | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq -c
printf '\n'

#d
printf 'Error, Count\n' > error_message.csv
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | grep -Eo '[0-9]{1,}' > counter.csv
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c | sort -nr | tr -d '[0-9]' | sed -e 's/^[[:space:]]*//' > message.csv
paste message.csv counter.csv | while IFS="$(printf '\t')" read -r f1 f2
do
  printf "$f1,$f2\n"
done >> error_message.csv

rm message.csv
rm counter.csv

#e
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
