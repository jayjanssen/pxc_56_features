#!/bin/sh

echo "Running Grants"
mysql -e "grant all on test.* to test@'localhost' identified by 'test'"
mysql -e "grant all on test.* to test@'%' identified by 'test'"

echo "Sysbench cleanup"
sysbench --test=sysbench_tests/db/common.lua --mysql-user=test --mysql-password=test --mysql-db=test --oltp-table-size=250000 --oltp-auto-inc=off  cleanup

echo "Sysbench prepare"
sysbench --test=sysbench_tests/db/common.lua --mysql-user=test --mysql-password=test --mysql-db=test --oltp-table-size=250000 --oltp-auto-inc=off  prepare

