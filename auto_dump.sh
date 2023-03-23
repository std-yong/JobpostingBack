docker exec db mysql -u root -ppassword -e "grant all privileges on todoList.* to user@'%' identified by 'password';"
echo "grant privileges to slave user Done."

sleep 1

docker exec db mysql -u root -ppassword -e "grant replication slave on *.* to 'user'@'%';"
echo "grant replication slave done"

sleep 1

docker exec db mysql -u root -ppassword -e "flush privileges;"
echo "flush privileges done"

sleep 1
#docker exec db mysql -u root -ppassword -e "use todoList; create table testtable ( no int(8), primary key (no) );"
#echo "create table done"

#sleep 1

#docker exec db mysql -u root -ppassword -e "exit"
#echo "exit mysql(db)"
#docker exec db mysql -u root -ppassword -e "exit"
#echo "exit container(slave)"

sleep 1

docker exec db mysqldump -uroot -ppassword todoList > dump.sql
echo "send mysql dump to local "

sleep 2

docker cp dump.sql db_slave:.
echo "copy dump.sql to db-slave"

sleep 2


#docker exec db_slave mysql -u root -ppassword -e "CREATE DATABASE todoList;"
#echo "start sync done"

docker exec db_slave mysql -u root -ppassword -e "grant all privileges on todoList.* to user@'%' identified by 'password';"
echo "grant privileges to slave user Done."
#sleep 1

#docker exec db_slave mysql -u root -ppassword -e "exit"
#echo "exit mysql(db_slave)"

#sleep 1

#docker exec db_slave mysql -u root -ppassword -e "exit"
#echo "exit container(slave)"

#sleep 1

docker exec db_slave mysql -u root -ppassword todoList < dump.sql
echo "slave get dump.sql"
echo "before change master to master query"

sleep 2

docker exec db mysql -u root -ppassword -e "show master status\G" > master_status.txt
echo "master_status file save finished"

sleep 2

docker exec db ip addr show eth0 > ip_output.txt
ip_address=$(cat ip_output.txt | awk '/inet / {print $2}' | cut -f1 -d'/')
echo $ip_address

sleep 2

search_string="mysql-bin"
file_name="master_status.txt"
if [ -n "$(grep "$search_string" "$file_name")" ]; then
    master_log_File=$(grep "$search_string" "$file_name" | awk '{print $2}')
    echo "success!"
    echo "master_log_File is="$master_log_File
else
    echo "문자열을 찾을 수 없삼"
fi

search_string="Position"
file_name="master_status.txt"
if [ -n "$(grep "$search_string" "$file_name")" ]; then
    master_log_Position=$(grep "$search_string" "$file_name" | awk '{print $2}')

    echo "success!"
    echo "master_log_Position is="$master_log_Position
else
    echo "문자열을 찾을 수 없삼"
fi

sleep 2


docker exec db_slave mysql -u root -ppassword -e "CHANGE MASTER TO MASTER_HOST='${ip_address}',
MASTER_USER='user', MASTER_PASSWORD='password', MASTER_LOG_FILE='${master_log_File}', MASTER_LOG_POS=${master_log_Position};"
echo "Finished connected"

sleep 2

docker exec db_slave mysql -u root -ppassword -e "start slave;"
echo "success!"
echo "start slave!"

sleep 2

docker exec db_slave mysql -u root -ppassword -e "show slave status\G" > slave_status.txt
echo "add slave_status.txt file"
sleep 2

search_string="Last_Errno"
file_name="slave_status.txt"
if [ -n "$(grep "$search_string" "$file_name")" ]; then
    last_errno=$(grep "$search_string" "$file_name" | awk '{print $2}')
    echo "success!"
    echo "Last_Errno is = " $last_errno
    echo "0 이면 master_slave 성공입니다."
else
    echo "Failed Master-slave"
fi

search_string="Last_IO_Errno"
file_name="slave_status.txt"
if [ -n "$(grep "$search_string" "$file_name")" ]; then
    last_io_errno=$(grep "$search_string" "$file_name" | awk '{print $2}')
    echo "success!"
    echo "Last_IO_Errno is = " $last_io_errno
    echo "0 이면 master_slave 성공입니다."
else
    echo "Failed Master-slave"
fi
