#!/bin/bash -xe

backupDataFiles() {  
cat <<@ | rman target=/
    backup as copy incremental level 0 
    database format '+carelesscat' tag 'ORA_ASM_MIGRATION';
@
}

backupControlFilesAndSpfile() {
cat <<@ | rman target=/
    run {
        backup as backupset spfile;
        restore spfile to "+cutegoat/spfile"
    }
@
}

createPfileFromSpfile() {
    echo SPFILE=+cutegoat/spfile > /tmp/init.ora
}

mountWithPfile() {
cat <<'@' | sqlplus / as sysdba
    select name from v$controlfile;
    shutdown immediate;
    startup mount pfile='/tmp/init.ora';
@
}

changeControlFileAndFlashRecoveryAreaLocations() {
cat <<'@' | sqlplus / as sysdba
    alter system set control_files='+cutegoat/ct1.f'
        scope=spfile sid='s225088';
    alter system set db_recovery_file_dest='+carelesscat'
        scope=spfile sid='s225088';
    
    shutdown immediate;
    startup nomount pfile='inits_temp.ora';
@
}

backupDataFiles
backupControlFilesAndSpfile
createPfileFromSpfile
mountWithPfile
changeControlFileAndFlashRecoveryAreaLocations
