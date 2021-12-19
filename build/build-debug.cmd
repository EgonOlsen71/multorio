call mospeed ..\basic\multorio.bas -memhole=16192-16383 -generatesrc=true -sysbuffer=52000 -compression=true
del multorio.d64
c1541 -format multorio,ml d64 multorio.d64
call ..\build\c1541 ..\build\multorio.d64 -write ++multorio-c.prg multorio,p
call ..\build\c1541 ..\build\multorio.d64 -write universal.prg universal,p
cd ..\build
