# Put the following into crontab
# To clean up undo-dir cache if it has not been modified for 90 days
m h  dom mon dow   command
43 00 *   *   3     find /home/anthony/.vim/undo-dir -type f -mtime +90 -delete
