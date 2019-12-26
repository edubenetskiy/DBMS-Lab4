CREATE DISKGROUP cutegoat EXTERNAL REDUNDANCY DISK
      '/u01/cutegoat/cutegoat0'
    , '/u01/cutegoat/cutegoat1'
    , '/u01/cutegoat/cutegoat2'
ATTRIBUTE 'COMPATIBLE.ASM' = '11.2.0.0.0';

CREATE DISKGROUP carelesscat EXTERNAL REDUNDANCY DISK
      '/u01/carelesscat/carelesscat0'
    , '/u01/carelesscat/carelesscat1'
    , '/u01/carelesscat/carelesscat2'
    , '/u01/carelesscat/carelesscat3'
    , '/u01/carelesscat/carelesscat4'
    , '/u01/carelesscat/carelesscat5'
    , '/u01/carelesscat/carelesscat6'
ATTRIBUTE 'COMPATIBLE.ASM' = '11.2.0.0.0';
