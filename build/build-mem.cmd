call mospeed ..\basic\multorio.bas -memhole=16192-16383 -sysbuffer=52000 -compactlevel=4 -compression=true
del multorio_AD.d64
c1541 -format multorio,ml d64 multorio_AD.d64
call ..\build\c1541 ..\build\multorio_AD.d64 -write ++multorio.prg multorio,p
call ..\build\c1541 ..\build\multorio_AD.d64 -write universal.prg universal,p
cd ..\build
