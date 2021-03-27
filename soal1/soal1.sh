 #!/bin/bash

#a
printf 'Informasi jenis log, pesan log, dan username:\n'
cat syslog.log | cut -f6- -d' '
printf '\n';

#b
printf 'Pesan error dan jumlah kemunculan:\n'
cat syslog.log | grep "ERROR" | cut -d' ' -f7- | cut -d'(' -f1 | sort | uniq -c
