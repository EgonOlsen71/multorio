0 rem multorio - a two player game for the wic64
1 rem (w) EgonOlsen71 / Dec. 2021
5 gosub 2360:print chr$(142);chr$(8);
10 gosub 2050:gosub 2000:gosub 2100:gosub 48600
20 poke 650,192:poke 652,0:gosub 48000:gosub 39900:gosub 62500
30 gosub 49000:gosub 51000:rs%=0:ob%=0:wi%=0:sf%=0
40 rd%=rd%+1:pn=cp:ct%=-1:gosub 53100:gosub 54000:gosub 55000
60 gosub 56000:gosub 59200
70 gosub 62000
80 if rs%=1 then print chr$(147);:goto 30
90 cp=(cp+1) and 1
100 goto 40
999 end

2000 rem check for api presence...
2010 lf%=peek(ui)=76 and peek(ui+1)=30 and peek(ui+2)=192
2020 if lf%=0 then print chr$(147);"loading...":load "universal",8,1
2030 return

2050 rem init com settings
2055 to%=64:bu=51200:ui=49152:lr%=-1:rd%=0
2060 ur=49155:us=49152+18:ug=49152+21
2070 uc=49152+24:ug$="mul!":tw%=60:ad$=""
2080 gi%=1:gv%=1:dim di%(64)
2090 gu$="http://t.wic64.net/dxc.php":return

2100 rem init wic64
2105 print chr$(147);"initializing wic64...";
2110 sys ui: rem init
2120 sys uc: rem check presence
2130 gosub 2250
2135 poke bu,87:poke bu+3,15: rem "w" mode, http get
2140 print "ok"
2150 return

2160 rem wait for response until mx%=0
2161 ci%=peek(2023):zz%=-5
2162 i=53240:ad$="":gosub 42000
2165 gosub 2200:if er%<>0 then 2170
2166 ok=peek(bu+200):df%=(rc%<>lr%) or rm%=0
2168 if (ok=0 or ig%) and df% then poke 2023,ci%:gosub 3100:return
2170 zz%=zz%+1:mx%=mx%-1:if mx%<=0 then 2260
2172 if zz%>3 and rm%=1 and ty%=2 then poke 2023,19:gosub 3550:zz%=0
2175 tw=ti
2180 if ti-tw<tw% goto 2180
2185 poke 2023,peek(i)
2190 i=i+1:if i=53248 then i=53240
2195 goto 2165

2200 rem exchange data with wic64
2201 if rm%=0 then gosub 2500
2202 if rm%=1 then gosub 2600
2203 ca$="":ig%=ad$<>""
2204 gosub 2800
2205 poke 171,to%:sys us,bu
2210 if peek(171)=0 then 2245
2220 poke 171,to%:sys ug,bu+200
2225 if peek(171)=0 then 2245
2230 gosub 2650:if le% then 2240
2235 rc%=peek(bu+206):er%=0:return
2240 poke 2023,18:er%=3:ad$="&3=1":return
2245 poke 2023,5:er%=2:return

2250 rem wic64 error?
2252 if peek(171)<>0 then return
2260 gosub 2360
2270 print "communication error!":print
2275 print "either there's no wic64 present"
2280 print "or the connection has timed out!"
2305 gosub 58400:gosub 3900:sys ur
2310 gosub 62250
2330 run

2360 rem setup screen for system message
2370 print chr$(147);:poke 53280,0:poke 53281,0:poke 646,1
2380 return

2400 rem send data
2410 rm%=0:gosub 2160:return

2450 rem receive data
2460 rm%=1:gosub 2160:return

2500 rem create send url
2510 le=len(da$):tb=le:gosub 3250:dl$=chr$(lb%):dh$=chr$(hb%)
2520 ur$=gu$+"?1=":us%=len(ur$)
2530 ur$=ur$+"<$"+dl$+dh$+da$:ue%=len(ur$)
2540 ur$=ur$+"&2="+to$+ca$+ad$
2550 return

2600 rem create receive url
2610 ur$=gu$+"?1=&2="+fr$+ca$:ue%=0:us%=0
2620 return

2650 rem check load error (??)
2655 le%=(peek(169)=2) and (peek(bu+200)=33) and (peek(bu+201)=48)
2660 if le% then sys ui: sys ur
2670 return

2700 rem create data (type in ty%, length in le%, data in di%[])
2705 rem gameid+version (3 bytes)
2706 tb=gv%:gosub 3250
2710 da$=chr$(lb%)+chr$(hb%)+chr$(gv%)
2715 rem type (1 byte)
2720 da$=da$+chr$(ty%)
2725 rem length (1 byte) + round-id (1 byte)
2730 da$=da$+chr$(le%)+chr$(rd% and 255)
2735 if le%=0 then return
2736 rem payload
2740 for i=0 to le%-1:da$=da$+chr$(di%(i)):next
2750 return

2800 rem store url in memory
2810 dm%=0:for t=1 to len(ur$)
2820 d$=mid$(ur$,t,1):dd%=asc(d$)
2830 if t>us% and t<=ue% then 2860
2840 if dd%>=65 and dd%<=90 then dd%=dd%+32
2850 if dd%>=193 and dd%<=218 then dd%=dd%-128
2860 poke bu+3+t,dd%
2870 next:gosub 2900:return

2900 rem store length in memory
2910 d=len(ur$)+4:s=bu+1:gosub 3000
2920 return

3000 rem store s in d (lo/hi)
3005 tb=d:gosub 3250
3010 poke s,lb%:poke s+1,hb%:return

3100 rem check response for validity, stores type in ty%, round in rc%
3105 if rm%=0 then return
3110 i=peek(bu+201)+256*peek(bu+202):if i<>gi% then 3200
3120 i=peek(bu+203):if i<>gv% then 3200
3130 ty%=peek(bu+204):gosub 3800:return

3200 rem version conflict, exit
3210 gosub 2360
3230 print "connection error or version conflict!"
3240 sys ur:end

3250 rem low/highbyte. Value in tb, result in lb% and hb%
3260 lb%=tb and 255:hb%=int(tb/256):return

3300 rem switch players
3310 cp=0:af%(1)=1:af%(0)=0
3320 if me=0 then return
3330 af%(1)=0:af%(0)=1
3340 t$=pn$(0):pn$(0)=pn$(1):pn$(1)=t$
3350 return

3500 rem print remote message
3510 return

3550 rem retransmit last shot
3555 if sf%=0 then return
3560 pa=pn:pn=me:ms%=mx%:ry%=rd%:rd%=rz%
3570 gosub 3650:rm%=0:gosub 2162:pn=pa:rm%=1:le%=0
3580 mx%=ms%:rd%=ry%:return

3600 rem transmit shot
3605 gosub 60000:print chr$(19);"sending data..."
3608 if ct%<>-1 then gosub 4000
3610 gosub 3650:gosub 2400
3630 rz%=rd%:
3640 return

3650 rem prepare shot transmission
3660 di%(0)=pp(pn):di%(1)=pa(pn):sf%=1
3670 ty%=2:le%=2:gosub 2700:mx%=10:return

3700 rem resync clients
3705 print chr$(147);"get ready for next round...";
3706 tw=300: gosub 4620: rem force min. 5 sec delay...
3710 lr%=-1:ty%=3:le%=0:gosub 2700
3720 mx%=10:gosub 2400
3730 mx%=100:gosub 2450:if ty%<>3 then 3730
3740 return

3800 rem check for end game type
3810 if ty%<>4 then return
3820 gosub 2360:print "the remote client has ended the game!"
3830 gosub 62250:run

3900 rem send end game packet
3910 lr%=-1:ty%=4:le%=0:gosub 2700
3920 mx%=10:gosub 2400:return

4000 rem rem send taunt
4010 di%(0)=ct%
4020 ty%=5:le%=1:gosub 2700
4030 ad$="":ca$="!msg":rm%=0:gosub 2200
4040 ct%=-1:return

4100 rem receive taunt
4110 ad$="":ca$="!msg":rm%=1:gosub 2200
4120 ok=(peek(bu+200)=0) and (er%=0)
4130 if ok then gosub 3100: if ty%=5 then gosub 4200
4140 return

4200 rem display taunt msg
4210 ct%=peek(bu+207):if ct%>7 then return
4220 gosub 60000:a$=tn$(ct%):poke 646,1
4250 le%=len(a$):po%=20-le%/2:vc%=1:yp=0:pp%=39
4260 b$=left$(a$,vc%):xp=pp%:gosub 62950:print b$;" ";
4270 pp%=pp%-1:vc%=vc%+1:if pp%>=po% then 4260
4290 tw=80:gosub 4600
4300 vc%=le%+po%
4310 b$=right$(a$,vc%):if pp%<0 then pp%=0
4320 xp=pp%:gosub 62950:print b$;" ";
4330 pp%=pp%-1:vc%=vc%-1
4340 if vc%>=0 then 4310
4350 return

4400 rem choose taunt message
4410 gosub 4450:poke 646,13:b$=tn$(ct%):yp=3:xp=20-int(len(b$)/2)
4420 gosub 62950:print b$
4430 tw=70:tt=ti:return

4450 rem clear taunt message
4460 for i=1144 to 1144+39:poke i,32:next:return

4600 rem wait for tw jiffies
4610 tt=ti
4620 gosub 42000:if ti-tt<tw then 4620
4630 return

4650 rem check for message timeout
4660 if tw=0 then return
4670 if ti-tt>tw then tw=0:gosub 4450
4680 return


39000 rem enter string
39010 st$="":a$=""
39015 gosub 62950:gosub 39100
39020 gosub 62250
39030 if a$=chr$(13) and len(st$)>2 then print chr$(157);chr$(157);" ":return
39040 if a$<>chr$(20) then 39080
39050 if len(st$)>0 then st$=left$(st$, len(st$)-1):gosub 39880:goto 39015
39080 if (a$<"0" or a$>"9") and (a$<"a" or a$>"z") and a$<>" " then 39020
39090 if len(st$)>15 then gosub 39850:goto 39015
39095 gosub 39880:st$=st$+a$:goto 39015

39100 rem print temp string
39110 poke 646,13:print st$;chr$(164);" ";:return

39150 rem print error message
39160 xp=8:yp=4:gosub 62950:poke 646,10
39170 fl%=0:print "names have to be unique!":return

39180 rem print packet message, end game
39185 gosub 2360:print "out of sync, press any key to restart!"
39190 gosub 3900:gosub 62250:run

39200 rem enter player names
39202 fl%=0
39205 print chr$(147);
39210 xp=10:yp=2:gosub 62950:poke 646,7:print "multorio - game setup"
39212 xp=23:yp=24:gosub 62950:print "egonolsen71/2021";
39215 yp=6:if fl%=1 then gosub 39150:yp=8
39220 xp=8:gosub 62950:poke 646,1:print "local player:"
39225 gosub 62220
39230 xp=21:gosub 39000:pn$(0)=st$:yp=yp+2
39240 xp=8:gosub 62950:poke 646,1:print "remote player:"
39250 xp=22:gosub 39000:pn$(1)=st$:fl%=0
39260 if pn$(0)=pn$(1) then fl%=1:gosub 62200:gosub 39850:goto 39205
39270 to$=ug$+pn$(0)+"4"+pn$(1):fr$=ug$+pn$(1)+"4"+pn$(0)
39275 print chr$(147);:poke 646,1
39280 nu%=rnd(0)*1000:tb=nu%:gosub 3250:di%(0)=lb%:di%(1)=hb%
39282 ty%=6:le%=0:gosub 2700
39283 rem syncing is no longer an active process. It just "clears" the db once
39284 print "synching clients...":mx%=10:gosub 2400
39290 ty%=1:le%=2:gosub 2700
39300 print "exchange in progress...":mx%=10:gosub 2400
39310 print "looking for ";pn$(1);"..."
39311 mx%=100:gosub 2450
39312 if ty%=6 then print"where are you, ";pn$(1);"?":goto 39311
39315 if ty%<>1 then gosub 39180:goto 39310
39320 n2%=peek(bu+207)+256*peek(bu+208)
39330 if n2%=nu% then print"invalid seed...retrying...":goto 39280
39335 me=1
39340 if nu%<n2% then nt%=nu%:nu%=n2%:n2%=nt%:me=0
39345 gosub 3300
39350 sd=1000*n2%+nu%:sd=sd-int(sd/65535)*65535
39360 print "game seed is"+sd:sd=rnd(-sd)
39365 print pn$(cp);" moves first..."
39370 ct%=255:gosub 4000: rem "clear" taunt message...
39380 print chr$(147);:return

39400 rem terrain hit sound
39410 at%=2:dc%=2:el%=4:rl%=1:lq%=180:hq%=2
39420 wf%=128:pt%=6:gosub 40000:return

39500 rem game over sound
39510 at%=5:dc%=17:el%=4:rl%=4:lq%=180:hq%=15
39520 wf%=16:pt%=40:gosub 40000
39530 at%=10:dc%=13:el%=3:rl%=3:lq%=180:hq%=12
39540 wf%=16:pt%=45:gosub 40000
39550 return

39600 rem whoop sound
39610 at%=9:dc%=8:el%=0:rl%=0:lq%=180:hq%=5
39620 wf%=16:pt%=30:gosub 40000:return

39650 rem fire sound
39660 at%=1:dc%=8:el%=0:rl%=0:lq%=180:hq%=5
39670 wf%=128:pt%=30:gosub 40000:return

39750 rem player hit sound
39760 at%=1:dc%=10:el%=0:rl%=0:lq%=180:hq%=8
39770 wf%=128:pt%=30:gosub 40000:return

39800 rem beep sound
39810 at%=2:dc%=3:el%=8:rl%=2:lq%=180:hq%=22
39820 wf%=16:pt%=4:gosub 40000:return

39850 rem moop sound
39860 at%=4:dc%=4:el%=12:rl%=3:lq%=180:hq%=12
39870 wf%=16:pt%=8:gosub 40000:return

39880 rem short beep sound
39885 at%=1:dc%=1:el%=4:rl%=2:lq%=180:hq%=22
39890 wf%=16:pt%=6:gosub 40000:return

39900 rem init sounds
39905 dim% vt%(2),vl(2),vw%(2):vc%=0:ac%=0
39910 si=54272: for i=si to si+24:poke i,0:next
39920 poke si+24,15:return

40000 rem play sound
40005 ic=0:gosub 42000
40010 if vw%(vc%)=0 then 40100
40020 vc%=vc%+1:ic=ic+1
40030 if vc%=3 then vc%=0
40040 if ic=3 then return
40050 goto 40010
40100 tt=ti:sb=si+vc%*7
40110 poke sb+5,at%*16+dc%
40120 poke sb+6,el%*16+rl%
40130 poke sb,lq%:poke sb+1,hq%
40140 vw%(vc%)=wf%:vl(vc%)=tt:poke sb+4,wf%+1
40150 vt%(vc%)=pt%:ac%=ac%+1
40160 return

42000 rem enjoy the silence...
42002 if ac%=0 then return
42005 tt=ti
42010 for hh=0 to 2:if vw%(hh)=0 or tt-vl(hh)<vt%(hh) then 42040
42020 poke si+hh*7+4,vw%(hh):vw%(hh)=0:ac%=ac%-1
42040 next:return

48000 rem init arrays and variables
48010 dim ci%(3):ci%(0)=1:ci%(1)=15:ci%(2)=12:ci%(3)=11
48020 dim pm%(6),af%(1),pn$(1),ps(1),sb%(8),tn$(7)
48030 dim sc%(1,1):sc%(0,0)=126:sc%(1,0)=124
48040 sc%(0,1)=123:sc%(1,1)=108
48050 dim px(1),py(1),pa(1),pc(1),pp(1),po$(1),po%(1),hp%(1)
48060 dim cg(4),bb%(2),bc%(2):cg(0)=111:cg(1)=77:cg(2)=103
48070 dn$=chr$(17):hm$=chr$(19)
48080 lf$=chr$(157):lf$=lf$+lf$:lf$=lf$+lf$
48090 pc(0)=3:pc(1)=5:ca$="":ct%=0
48092 sb%(0)=253:sb%(1)=253:sb%(2)=254:sb%(3)=254:sb%(4)=255
48093 sb%(5)=255:sb%(6)=254:sb%(7)=254:sb%(8)=253
48100 cg(3)=78:cg(4)=111:po$(0)="":po%(0)=0
48110 for i=0 to 27:po$(1)=po$(1)+chr$(29):next
48120 po%(1)=28:pi=3.141592:cp=0:rp=0
48130 af%(0)=0:af%(1)=0
48140 pn$(0)="":pn$(1)=""
48150 return

48500 rem get color
48510 if yy>22 then cc=3:return
48520 if yy>18 then cc=2:return
48530 if yy>14 then cc=1:return
48540 cc=0:return

48600 rem init sprite
48610 poke 56334,peek(56334) and 254:poke 1,peek(1) and 251
48620 sp=704:for i=81*8+53248 to i+7: poke sp, peek(i):sp=sp+3:next
48630 poke 1,peek(1) or 4:poke 56334,peek(56334) or 1
48640 poke 2040,11:poke 53248,0:poke 53249,0:poke 53269,1
48645 poke 53276,0:poke 53287,1
48650 poke 53285,2:poke 53286,10
48660 restore:for i=16192 to 16192+191:read s%:poke i,s%:next:i=0
48670 read pm%:if pm%=-1 then 48690
48680 pm%(i)=pm%:i=i+1:goto 48670
48690 for i=0 to 7:read pm%:poke 53240+i,pm%:next
48700 for i=0 to 7:read tn$(i):next
48710 return

49000 rem render landscape
49020 gosub 39600:for i=0 to 4:gosub 50000:next
49030 for i=1984 to 2023
49040 poke i,160:poke i+54272,ci%(3)
49050 next
49100 return

50000 rem render mountain
50010 sc=233:ec=223
50020 x=int(2+rnd(1)*35):y=18-int(rnd(1)*8)
50030 sa=1024+x+y*40:se=sa+1:xe=x+1
50035 if peek(sa)<>32 or peek(se)<>32 then 50020
50037 yy=y:gosub 48500
50040 for yp=y to 24:pa=peek(sa):pe=peek(se):cf%=ci%(cc)
50050 if pa<>160 and pa<>223 then poke sa,sc:goto 50055
50052 poke sa,160
50055 if pe<>160 and pe<>233 then poke se,ec:goto 50060
50057 poke se,160
50060 poke sa+54272,cf%:poke se+54272,cf%
50070 if se-sa=1 then 50100
50080 for wp=sa+1 to se-1:poke wp,160
50090 poke wp+54272,cf%:next
50100 x=x-1:if x>=0 then sa=sa-1:goto 50120
50110 sc=160
50120 xe=xe+1:if xe<=39 then se=se+1:goto 50140
50130 ec=160
50140 sa=sa+40:se=se+40
50150 yy=yp+1:gosub 48500
50160 next:return

51000 rem setup player
51030 for i=0 to 1:pa(i)=90:pp(i)=10
51040 px(i)=int(10*rnd(1))+1+i*27
51050 hp%(i)=100
51100 next
51160 pn=0:gosub 52000:pn=1:gosub 52000
51190 return

52000 rem (re)draw player
52010 sa=1024+24*40+px(pn):y=24
52020 if peek(sa)=32 and peek(sa+1)=32 then 52050
52030 y=y-1:sa=sa-40:goto 52020
52050 py(pn)=y-1:y=y+1:sa=sa+40
52060 for yp=y to 24
52070 poke sa,160:poke sa+1,160
52080 yy=yp:gosub 48500
52100 poke sa+54272,ci%(cc):poke sa+54272+1,ci%(cc)
52110 sa=sa+40
52120 next

53000 rem update player
53010 gosub 60100
53020 poke sa,85:poke sa+1,73
53030 poke sa+54272,pc(pn):poke sa+54273,pc(pn)
53040 ai=int(pa(pn)*0.027748):ad=-(ai>2)
53050 poke sa-40,32:poke sa-39,32:poke sa-40+ad,cg(ai)
53060 poke sa+ad+54232,pc(pn)
53070 return

53100 rem calculate wind
53110 wr=rnd(1):if wr<0.499 then wr=-3:goto 53120
53115 wr=3
53120 wi%=wi%+int(rnd(1)*wr+0.499)
53130 if wi%>4 then wi%=4
53140 if wi%<-4 then wi%=-4
53150 return

53200 rem draw wind
53210 p=1043:for i=55309 to 55321:poke i,7:next
53215 if wi%=0 then 53240
53220 for i=p to i+wi% step sgn(wi%):poke i,64:next
53230 poke i,62+2*(wi%<0)
53240 poke p,81:return

53300 rem clear wind
53310 for i=1037 to 1049:poke i,32:next:return

53330 rem clear top line
53340 for i=1024 to 1063:poke i,32:next:return

53500 rem active player blinks
53510 gosub 60100:sa=sa+54272
53520 pc=pc(pn):poke sa+1,1:poke sa,1:
53530 poke sa+1,pc:poke sa,pc
53540 return

53700 rem print help text
53710 xp=7:yp=4:gosub 62950
53720 poke 646,15:print "a+d to adjust, 0-9 to enter"
53730 xp=11:yp=5:gosub 62950:print "f1 - f8 for taunts"
53740 poke 646,1:return

53750 rem clear help text
53760 for i=1144 to 1263:poke i,32:next:return

54000 rem player move
54001 gosub 53200
54002 gosub 39800:gosub 54200:if af%(pn)=1 then gosub 57000:return
54004 gosub 53700:gosub 62280
54005 as$="":goto 54040:poke 198,0:tw=0
54010 gosub 42000:gosub 4650:get a$:if a$="" then gosub 53500:goto 54010
54012 ky%=asc(a$):if ky%=3 then gosub 3900:run
54015 if ky%>47 and ky%<58 then gosub 54500:goto 54040
54020 if ky%=65 then pa(pn)=pa(pn)-1:as$="":goto 54040
54030 if ky%=68 then pa(pn)=pa(pn)+1:as$="":goto 54040
54032 if ky%=32 or ky%=13 then gosub 53750:return
54035 if ky%=20 then gosub 54700
54038 if ky%>132 and ky%<141 then ct%=ky%-133:gosub 4400
54039 if ky%=95 then ct%=-1
54040 if pa(pn)<0 then pa(pn)=0
54050 if pa(pn)>180 then pa(pn)=180
54060 gosub 54300
54080 if len(as$)>0 then print chr$(157);chr$(164);"  ":goto 54090
54085 print chr$(157);"   "
54090 gosub 53000
54100 goto 54010

54150 rem show damage
54155 p$=str$(-dd)+"  ":kc=10:ma=1
54156 gosub 54206:return

54200 rem show hit points
54205 p$=str$(hp%(pn))+"  ":kc=7:ma=2
54206 gosub 60100:sa=sa-120:for i=0 to 2
54208 bb%(i)=peek(sa+i):bc%(i)=peek(sa+i+54272)
54210 poke sa+i+54272,kc:poke sa+i,asc(mid$(p$,i+ma,1))
54220 next:return

54250 rem hide hit points
54260 gosub 60100:sa=sa-120:for i=0 to 2
54270 poke sa+i+54272,bc%(i):poke sa+i,bb%(i)
54280 next:return

54300 rem print angle
54310 poke 646,1:print chr$(19);po$(pn);"angle:    ";lf$;pa(pn);
54320 return

54500 rem enter angle
54510 if len(as$)>2 then return
54515 if len(as$)>0 then if left$(as$,1)="0" then as$=""
54520 as$=as$+a$
54530 gosub 54800:return

54700 rem clear char
54705 la%=len(as$):if la%=0 then return
54710 as$=left$(as$,la%-1)
54720 if as$="" then as$="0"
54730 gosub 54800:return

54800 rem calculate angle
54810 aa=val(as$)
54820 if aa<0 then aa=0:as$="0"
54830 if aa>180 then aa=180:as$="180"
54840 pa(pn)=aa
54850 return

55000 rem select power
55002 if af%(pn)=1 then gosub 53000:return
55005 gosub 62280:gosub 54300:print chr$(157);"  ";
55010 print hm$;dn$;:t$=po$(pn)
55020 print t$;chr$(176);:gosub 55800:print chr$(174)
55030 print t$;chr$(98);"        ";chr$(98)
55040 print t$;chr$(237);:gosub 55800:print chr$(253)
55045 gosub 55200:d=1.7857:s=7:poke 198,0
55050 get a$:if a$="" then 55054
55052 if a$=" " or a$=chr$(13) then gosub 3600:gosub 53330:return
55054 pp(pn)=pp(pn)+1:if pp(pn)=101 then pp(pn)=10:gosub 55200
55055 pp=pp(pn)/d
55060 ph=int(pp/s):pl=pp-ph*s:if ph>s then 55090
55070 poke 1105+po%(pn)+ph,pm%(pl)
55090 goto 55050

55200 rem clear power meter
55210 po%=po%(pn):for i=1105+po% to 1112+po%
55220 poke i,32:next:pp(pn)=10:return

55800 rem draw border
55810 for i=0 to 7:print chr$(99);:next
55820 return

56000 rem fire
56010 gosub 54250:gosub 60000:oc=-1:oa=0
56020 af=(pa(pn)/180)*pi:pf=pp(pn)
56030 if af>=pi then af=pi-0.01
56032 if af<=0 then af=0.01
56034 cf=cos(af):sf=sin(af)
56036 xf=px(pn)*8+8-16*cf:yf=py(pn)*8+8-8*sf
56040 dx=-cf*(pf/20):dy=-sf*(pf/20):dx=dx+wi%/6
56045 gosub 39650
56050 gosub 58000
56060 if oc<>32 then if oc<>-1 then sp=po:gosub 59000:gosub 61000:return
56070 dy=dy+0.02:goto 56050

57000 rem remote player moves...
57005 gosub 42000:gosub 53330
57008 print chr$(19);pn$(pn);" moves..."
57010 mx%=100:gosub 2450
57020 rem if ty%=5 then gosub 3500:goto 57010
57030 if ty%<>2 then 39180
57040 lr%=rc%:pa(pn)=peek(bu+208):pp(pn)=peek(bu+207)
57050 gosub 4100:gosub 53330:return

58000 rem plot bullet
58030 xf=xf+dx:yf=yf+dy:gosub 58300
58035 if xf>319 or xf<0 then 58200
58040 if yf<0 then oc=-1:gosub 59500:goto 58140
58050 gosub 58350
58100 xx%=xf:gosub 58250
58120 oc=peek(po)
58140 return
58200 gosub 58400
58210 oc=160:return

58250 rem place sprite
58260 xx%=xx%+20:ov=-(xx%>255):xx%=xx% and 255
58270 poke 53249,yf+46:poke 53248,xx%
58280 poke 53264,ov:return

58300 rem calculate position
58310 po=1024+int(xf/8)+int(yf/8)*40:return

58350 rem delete arrow
58360 if oa<>0 then poke oa,32:oa=0
58370 return

58400 rem "disable" sprite
58410 poke 53248,0:poke 53264,0:return

58430 rem disable explosion
58435 gosub 58400:poke 53287,1:poke 53276,0
58540 poke 2040,11:return

58560 rem enable explosion
58570 xx%=xf-8:gosub 58250:poke 53287,7:poke 53276,1:poke 2040,253
58580 return

59000 rem hit something
59020 gosub 58350
59025 if xf>319 or xf<0 then gosub 58400:gosub 59800:return
59030 gosub 58560:if po>1023 and po<2024 then 59040
59035 gosub 58430:return
59040 gosub 58300:pa=po-41
59045 gosub 39400:cs%=0
59050 for po=pa to pa+80 step 40:xi=int(xf/8)-1
59060 for pj=po to po+2:poke 2040,sb%(cs%):cs%=cs%+1
59070 if pj<1024 or pj>2023 then 59110
59075 pv%=32:if po=pa+40 or pj=po+1 then 59100
59076 pk=peek(pj-40-80*(po<>pa))<>32
59080 pl=(pj-1024)/40:if pl=int(pl) or pj<>po then 59085
59082 if peek(pj-1)<>32 and pk then pv%=105
59085 pl=(pj-1023)/40:if pl=int(pl) or pj=po then 59095
59090 if peek(pj+1)<>32 and pk then pv%=95
59095 if po=pa then 59100
59096 if pv%=105 then pv%=95+128:goto 59100
59098 if pv%=95 then pv%=105+128
59100 if xi>-1 and xi<40 then poke pj,pv%
59110 xi=xi+1:gosub 42000:next pj,po
59120 gosub 58430:return

59200 rem check for hole
59210 pa=pn:for pj=0 to 1
59220 pn=pj:gosub 60100:sa=sa+40
59230 if peek(sa)=32 and peek(sa+1)=32 and sa<2024 then gosub 59900
59240 gosub 53000:next:pn=pa
59250 return

59500 rem track bullet outside
59510 pa=1024+int(xf/8)
59520 oa=pa:poke pa,30:pa=pa+1
59530 if pa<1064 then poke pa,32
59540 pa=pa-2:if pa>1023 then poke pa,32
59550 gosub 58400:return

59800 rem out of bounds
59805 gosub 58400:gosub 42000:gosub 39850
59810 ob%=1:return

59900 rem player moves down
59910 sa=sa-120:poke sa,32:poke sa+1,32
59920 poke sa+40,32:poke sa+41,32
59923 poke sa+54272,1:poke sa+54273,1
59924 poke sa+54312,1:poke sa+54313,1
59930 gosub 60100:sa=sa+40
59940 if peek(sa)<>32 or peek(sa+1)<>32 or sa>2023 then 59980
59950 py(pn)=py(pn)+1:goto 59910
59980 return

60000 rem clear controls
60020 for i=1024 to 1183:poke i,32:next:return

60100 rem calculate screen pos
60110 sa=1024+py(pn)*40+px(pn)+40:return

61000 rem player hit
61005 if ob%=1 then ob%=0:return
61010 sp=sp-1024:py=int(sp/40):px=sp-py*40
61015 if px>39 or px<0 then return
61020 for i=0 to 1:dx=abs(px(i)-px)+(px>px(i)):dy=abs(py(i)-py)
61030 if dx>2 or dy>2 then 61200
61040 dd=10*(2-dx)+10*(2-dy)
61045 if dd<=0 then 61200
61050 hp%(i)=hp%(i)-dd:if hp%(i)<0 then hp%(i)=0
61060 pa=pn:pn=i:gosub 39750:gosub 54150
61070 for p=0 to dd*2:poke 53270,peek(53266) and 7 or 8:next
61080 poke 53270,8:gosub 54250:pn=pa
61200 next:return

61600 rem show scores
61610 a$=str$(ps(0))+" -"+str$(ps(1))
61620 yp=4:ck=1:gosub 62900
61630 return

62000 rem check death
62010 tt=ti:pa=0:pd=1:for i=0 to 1:if hp%(i)<=0 then pa=pa+pd:gosub 62100
62020 pd=pd+9:next
62025 if pa=0 then return
62028 gosub 39500
62030 yp=6:if pa>10 then a$="draw!!":ck=10:gosub 62900:goto 62060
62035 a$=" wins":px=-(pa=1)
62040 a$=pn$(px)+a$:ck=pc(px):ps(px)=ps(px)+1:gosub 62900
62060 gosub 61600:gosub 62280:gosub 62250:gosub 3700
62070 rs%=1:rp=(rp+1) and 1:cp=rp:return

62100 rem draw damaged player
62110 oo=pn:pn=i:gosub 60100:poke sa,104:poke sa+1,104
62120 poke sa-40,32:poke sa-39,32:pn=oo:return

62200 rem screen off
62210 poke 53265,peek(53265) and 239:return

62220 rem screen on
62230 poke 53265,peek(53265) or 16:return

62250 rem wait for input
62255 poke 198,0
62260 get a$:gosub 42000:if a$="" then 62260
62270 return

62280 rem wait for no input
62285 wait 198,255,255:return

62400 rem fill blanks
62410 for j=i to i-p%
62420 poke j,160:poke 54272+j,0
62430 next
62440 i=j-1:return

62500 rem show title...well, not anymore...
62510 print chr$(147);:poke 53280,6:poke 53281,6
62520 ps(0)=0:ps(1)=0
62530 gosub 39200:return

62900 rem print text
62910 xp=20-int(len(a$)/2):ii%=peek(646):poke 646,ck
62920 gosub 62950
62930 print a$:poke 646,ii%:return

62950 rem set cursor location
62960 poke 781,yp:poke 782,xp: poke 783,peek(783) and 254:sys 65520
62970 return

62980 rem explosion
62981 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
62982 data 80,0,0,109,192,3,237,176,3,153,176,1,153,192,13,155
62983 data 192,14,173,0,7,181,0,5,64,0,0,0,0,0,0,0
62984 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135
62986 data 0,0,0,0,5,64,0,6,64,0,22,80,0,30,208,21
62987 data 90,212,91,121,244,121,233,180,106,154,100,89,190,100,29,214
62988 data 164,15,157,48,7,165,80,5,106,64,0,103,64,0,109,64
62989 data 0,117,0,0,84,0,0,16,0,0,0,0,0,0,0,135
62990 data 0,0,0,5,85,64,5,231,69,7,166,109,2,170,169,17
62991 data 158,217,93,189,185,122,169,164,106,187,100,93,219,100,29,183
62992 data 180,2,175,176,106,186,180,106,122,85,118,118,153,118,106,157
62993 data 122,102,173,95,21,93,21,17,153,20,1,164,0,1,84,135

63000 data 32,101,117,97,246,234,160,-1

63010 data 47,64,77,66,78,64,77,66

63499 rem taunts
63500 data "hasta la vista, baby!"
63510 data "it sucks to be you!"
63540 data "fire in the hole!"
63550 data "say 'hello' to my little friend!"
63570 data "resistance is futile!"
63590 data "to survive a war, you gotta become war!"
63600 data "you can't hide, you can't run!"
63610 data "hell is the impossibility of reason!"




