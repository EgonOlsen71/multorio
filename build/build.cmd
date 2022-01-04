call mospeed ..\basic\multorio.bas -memhole=16192-16383 -sysbuffer=52000 -generatesrc=true
call mospeed ..\basic\loader.bas
call moscrunch ++loader.prg -addfiles=..\res\title.img
call moscrunch ++multorio.prg -addfiles=..\build\universal.prg
del multorio.d64
c1541 -format multorio,ml d64 multorio.d64
call ..\build\c1541 ..\build\multorio.d64 -write ++loader-c.prg loader,p
call ..\build\c1541 ..\build\multorio.d64 -write ++multorio-c.prg multorio,p
cd ..\build

