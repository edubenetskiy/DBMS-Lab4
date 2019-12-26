#!/bin/bash -xe

srvctl add asm -p '+cutegoat' -d '+cutegoat'

echo <<'@' | sqlplus -S / as sysasm
    create spfile from memory;
    shutdown immediate;
    startup;
@
