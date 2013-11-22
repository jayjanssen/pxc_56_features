#!/bin/sh

echo "Sysbench run"

sysbench --test=sysbench_tests/db/update_non_index.lua --rand-type=uniform --rand-seed=`mysql -e "show global status like 'wsrep_local_index'" --raw --skip-column-names --vertical| tail -n 1` --mysql-user=test --mysql-password=test --mysql-db=test --oltp-table-size=250000 --max-requests=0 --num-threads=8 --max-time=60 run

