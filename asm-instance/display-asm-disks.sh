#!/bin/bash -xe

cat <<'@' | sqlplus -S / as sysasm
set pagesize 30
column name format a20
column path format a35
select name, path, mount_status from v$asm_disk order by path;
@
