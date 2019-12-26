#/bin/bash -xe

if ps -ef | grep [o]ra_pmon_$ORACLE_SID > /dev/null; then
    echo startup mount
else
    echo alter database mount
fi | sqlplus / as sysdba
