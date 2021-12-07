10 poke 646,1:print chr$(147);:poke 53280,1:poke 53281,1
15 print chr$(142);chr$(8);
20 poke 650,192:poke 652,0:gosub 48000:gosub 39900:gosub 62500
30 gosub 49000:gosub 51000:rs%=0:ob%=0
40 pn=cp: gosub 54000:gosub 55000
60 gosub 56000:gosub 59200
70 gosub 62000
80 if rs%=1 then print chr$(147);:goto 30
90 cp=(cp+1) and 1
100 goto 40
999 end

39400 rem terrain hit
39410 at=2:dc=2:el=4:rl=1:lq=180:hq=2
39420 wf=128:pt=6:im=0:gosub 40000:return

39500 rem game over
39510 at=7:dc=17:el=0:rl=0:lq=180:hq=9
39520 wf=16:pt=20:im=0:gosub 40000
39530 at=9:dc=13:el=0:rl=0:lq=180:hq=8
39540 wf=16:pt=25:im=0:gosub 40000
39550 at=10:dc=11:el=0:rl=0:lq=180:hq=7
39560 wf=16:pt=34:im=0:gosub 40000:return

39600 rem whoop
39610 at=9:dc=8:el=0:rl=0:lq=180:hq=5
39620 wf=16:pt=30:im=0:gosub 40000:return

39650 rem fire
39660 at=1:dc=8:el=0:rl=0:lq=180:hq=5
39670 wf=128:pt=30:im=0:gosub 40000:return

39750 rem player hit
39760 at=1:dc=10:el=0:rl=0:lq=180:hq=8
39770 wf=128:pt=30:im=0:gosub 40000:return

39800 rem beep
39810 at=2:dc=3:el=8:rl=2:lq=180:hq=22
39820 wf=16:pt=4:im=1:gosub 40000:return

39850 rem moop
39860 at=4:dc=4:el=12:rl=3:lq=180:hq=12
39870 wf=16:pt=8:im=0:gosub 40000:return

39900 rem init sounds
39905 dim vt%(2),vl(2),vw%(2):vc=0:ac=0
39910 si=54272: for i=si to si+24:poke i,0:next
39920 poke si+24,15:return

40000 rem play sound
40005 ic=0:gosub 42000
40010 if vw%(vc)=0 then 40100
40020 vc=vc+1:ic=ic+1
40030 if vc=3 then vc=0
40040 if ic=3 then return
40050 goto 40010
40100 tt=ti:sb=si+vc*7
40110 poke sb+5,at*16+dc
40120 poke sb+6,el*16+rl
40130 poke sb,lq:poke sb+1,hq
40140 vw%(vc)=wf:vl(vc)=tt:poke sb+4,wf+1
40150 vt%(vc)=pt:ac=ac+1
40160 if im=0 then return
40170 tt=ti:if tt-vl(vc)<pt then 40170
40180 poke sb+4,wf:vw%(vc)=0:ac=ac-1
40190 vc=vc+1:if vc=3 then vc=0
40200 return

42000 rem enjoy the silence...
42002 if ac=0 then return
42005 tt=ti
42010 for hh=0 to 2:if vw%(hh)=0 or tt-vl(hh)<vt%(hh) then 42040
42020 poke si+hh*7+4,vw%(hh):vw%(hh)=0:ac=ac-1
42040 next:return

48000 rem init arrays and variables
48010 dim ci(3):ci(0)=1:ci(1)=15:ci(2)=12:ci(3)=11
48020 dim pm(6),ai(1,4),af%(1),pn$(1),ps(1),tn$(19)
48030 dim sc%(1,1):sc%(0,0)=126:sc%(1,0)=124
48040 sc%(0,1)=123:sc%(1,1)=108
48050 dim px(1),py(1),pa(1),pd(1),pc(1),pp(1),po$(1),po%(1),hp%(1)
48060 dim cg(4),bb%(2),bc%(2):cg(0)=111:cg(1)=77:cg(2)=103
48070 dn$=chr$(17):hm$=chr$(19):cl$="           ":cx$=cl$+cl$+cl$
48080 lf$=chr$(157):lf$=lf$+lf$:lf$=lf$+lf$
48090 pc(0)=3:pc(1)=5
48100 cg(3)=78:cg(4)=111:po$(0)="":po%(0)=0
48110 for i=0 to 27:po$(1)=po$(1)+chr$(29):next
48120 po%(1)=28:pi=3.141592:cp=0:rp=0
48130 af%(0)=0:af%(1)=1
48140 pn$(0)=" human ":pn$(1)=" computer "
48150 return

48500 rem get color
48510 if yy>22 then cc=3:return
48520 if yy>18 then cc=2:return
48530 if yy>14 then cc=1:return
48540 cc=0:return

49000 rem render landscape
49020 gosub 39600:for i=0 to 4:gosub 50000:next
49030 for i=1984 to 2023
49040 poke i,160:poke i+54272,ci(3)
49050 next i
49060 mi=0:restore
49070 read pm:if pm=-1 then 49100
49080 pm(mi)=pm:mi=mi+1:goto 49070
49100 return

50000 rem render mountain
50010 x=rnd(0):sc=233:ec=223
50020 x=int(2+rnd(1)*35):y=18-int(rnd(1)*8)
50030 sa=1024+x+y*40:se=sa+1:xe=x+1
50035 if peek(sa)<>32 or peek(se)<>32 then 50020
50037 yy=y:gosub 48500
50040 for yp=y to 24:pa=peek(sa):pe=peek(se):cf=ci(cc)
50050 if pa<>160 and pa<>223 then poke sa,sc:goto 50055
50052 poke sa,160
50055 if pe<>160 and pe<>233 then poke se,ec:goto 50060
50057 poke se,160
50060 poke sa+54272,cf:poke se+54272,cf
50070 if se-sa=1 then 50100
50080 for wp=sa+1 to se-1:poke wp,160
50090 poke wp+54272,cf:next wp
50100 x=x-1:if x>=0 then sa=sa-1:goto 50120
50110 sc=160
50120 xe=xe+1:if xe<=39 then se=se+1:goto 50140
50130 ec=160
50140 sa=sa+40:se=se+40
50150 yy=yp+1:gosub 48500
50160 next yp:return

51000 rem setup player
51030 for i=0 to 1:pa(i)=pi/2:pd(i)=100:pp(i)=10
51040 px(i)=int(10*rnd(1))+1+i*27
51050 hp%(i)=100
51060 ai(i,0)=0:ai(i,1)=0:ai(i,3)=0
51100 next i
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
52100 poke sa+54272,ci(cc):poke sa+54272+1,ci(cc)
52110 sa=sa+40
52120 next yp

53000 rem update player
53010 gosub 60100
53020 poke sa,85:poke sa+1,73
53030 poke sa+54272,pc(pn):poke sa+54273,pc(pn)
53040 ai=int(pa(pn)/0.629):ad=-(ai>2)
53050 poke sa-40,32:poke sa-39,32:poke sa-40+ad,cg(ai)
53060 poke sa+ad+54232,pc(pn)
53070 return

53500 rem active player blinks
53510 gosub 60100:sa=sa+54272
53520 pc=pc(pn):poke sa+1,1:poke sa,1:
53530 poke sa+1,pc:poke sa,pc
53540 return

53700 rem print help text
53710 xp=10:yp=4:gosub 62950
53720 poke 646,15:print "'a' and 'd' to adjust"
53730 xp=9:yp=5:gosub 62950:print "or number keys to enter"
53740 poke 646,1:return

53750 rem clear help text
53760 xp=10:yp=4:gosub 62950
53770 poke 646,1:print cl$;cl$
53780 xp=9:yp=5:gosub 62950:print cl$;cl$;" "
53790 return

54000 rem player move
54002 gosub 39800:gosub 54200:if af%(pn)=1 then gosub 57000:return
54004 gosub 53700:gosub 62280
54005 as$="":goto 54040
54010 gosub 42000:get a$:if a$="" then gosub 53500:goto 54010
54012 if a$=chr$(3) then run
54015 if a$>="0" and a$<="9" then gosub 54500:goto 54040
54020 if a$="a" then pa(pn)=pa(pn)-0.02:as$="":goto 54040
54030 if a$="d" then pa(pn)=pa(pn)+0.02:as$="":goto 54040
54032 if a$=" " or a$=chr$(13) then gosub 53750:return
54035 if a$=chr$(20) then gosub 54700
54040 if pa(pn)<0 then pa(pn)=0
54050 if pa(pn)>pi then pa(pn)=pi
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
54305 ra = int(pa(pn)/pi*180+0.5)
54310 print chr$(19);po$(pn);"angle:    ";lf$;ra;
54320 return

54500 rem enter angle
54510 if len(as$)>2 then return
54515 if len(as$)>0 then if left$(as$,1)="0" then as$=""
54520 as$=as$+a$
54530 gosub 54800:return

54700 rem clear char
54705 if len(as$)=0 then return
54710 as$=left$(as$,len(as$)-1)
54720 if as$="" then as$="0"
54730 gosub 54800:return

54800 rem calculate angle
54810 aa=val(as$)
54820 if aa<0 then aa=0:as$="0"
54830 if aa>180 then aa=180:as$="180"
54840 pa(pn)=(aa/180)*pi
54850 return

55000 rem select power
55002 if af%(pn)=1 then gosub 53000:return
55005 gosub 62280:gosub 54300:print chr$(157);"  ";
55010 print hm$;dn$;
55020 print po$(pn);chr$(176);:gosub 55800:print chr$(174)
55030 print po$(pn);chr$(98);"        ";chr$(98)
55040 print po$(pn);chr$(237);:gosub 55800:print chr$(253)
55045 gosub 55200:d=1.7857:s=7
55050 get a$:if a$=" " or a$=chr$(13) then return
55052 pp(pn)=pp(pn)+1:if pp(pn)=101 then pp(pn)=10:gosub 55200
55055 pp=pp(pn)/d
55060 ph=int(pp/s):pl=pp-ph*s:if ph>s then 55090
55070 poke 1105+po%(pn)+ph,pm(pl)
55090 goto 55050

55200 rem clear power meter
55210 po%=po%(pn):for i=1105+po% to 1112+po%
55220 poke i,32:next:pp(pn)=10:return

55800 rem draw border
55810 for i=0 to 7:print chr$(99);:next i
55820 return

56000 rem fire
56010 gosub 54250:gosub 60000:oc=-1:oa=0
56020 xf=px(pn)*8+8:yf=py(pn)*8-8
56030 af=pa(pn):pf=pp(pn)
56035 if af>=pi then af=pi-0.01
56036 if af<=0 then af=0.01
56040 dx=-cos(af)*(pf/20):dy=-sin(af)*(pf/20)
56045 gosub 39650
56050 gosub 58000
56060 if oc<>32 then if oc<>-1 then sp=po:gosub 59000:gosub 61000:return
56070 dy=dy+0.02:goto 56050

57000 rem ai moves
57005 gosub 42000
57008 get a$:if a$=chr$(3) then run
57010 np=(pn+1) and 1:tx=px(np)+1:ty=py(np)
57015 sx=px(pn):sy=px(pn):rn=rnd(1)
57020 if ai(pn,0)=0 then gosub 57900:return
57030 dx=ai(pn,2)-tx:dy=ai(pn,3)-ty
57035 if dx=0 and dy>2 then dx=dy/1.5
57040 if pn=1 then dx=-dx
57050 if dx=0 and dy=0 then return
57055 if peek(53266)<120-(2*abs(dx)) then 57075
57060 ai(pn,0)=ai(pn,0)-dx/(1+rn)
57072 goto 57100
57075 aa=0.0174*(1+(2*(pn=1)))*(.5+rn/2)
57080 if dx<0 then ai(pn,1)=ai(pn,1)+aa
57090 if dx>0 then ai(pn,1)=ai(pn,1)-aa
57100 if ai(pn,1)>=pi then ai(pn,1)=pi-0.01
57105 if ai(pn,1)<=0 then ai(pn,1)=0.01
57110 gosub 57930
57120 if ai(pn,0)>100 then ai(pn,0)=0
57130 if ai(pn,3)>1 and ai(np,3)=0 then ai(pn,0)=0:ai(np,3)=999
57140 return

57900 ai(pn,0)=30+rnd(1)*50
57910 np=.2+rnd(1)*.2:if tx<sx then np=-np
57920 ai(pn,1)=pi/2+np
57930 pp(pn)=ai(pn,0):pa(pn)=ai(pn,1)
57940 return

58000 rem plot bullet
58010 gosub 58300
58020 pa=po
58030 xf=xf+dx:yf=yf+dy
58040 gosub 58300
58050 if po>2023 or xf>319 or xf<0 then 58200
58060 if po>1023 then 58100
58070 if oc<>-1 then poke pa,oc
58080 oc=-1:gosub 59500:goto 58140
58100 if oa<>0 then poke oa,32:oa=0
58105 if pa=po then 58140
58110 if oc<>-1 then poke pa,oc
58120 oc=peek(po):i0=-((int(xf) and 7)>3):i1=-((int(yf) and 7)>3)
58130 poke po,sc%(i0,i1)
58140 return
58200 if oc<>-1 then if pa<2024 then poke pa,oc
58210 oc=160:return

58300 rem calculate position
58310 po=1024+int(xf/8)+int(yf/8)*40:return

59000 rem hit something
59010 ai(pn,2)=xf/8:ai(pn,3)=yf/8
59020 if oa<>0 then poke oa,32:oa=0
59025 if xf>319 or xf<0 then gosub 59800:return
59030 if po>1023 and po<2024 then poke po,32:goto 59040
59035 return
59040 pa=1024+(int(xf/8)-1)+int((yf/8)-1)*40
59042 px=pa+41:cx=peek(54272+px):poke 54272+px,7:poke px,102
59045 gosub 39400
59050 for po=pa to pa+80 step 40:xi=int(xf/8)-1
59060 for pj=po to po+2
59070 if pj<1024 or pj>2023 then 59110
59075 pv=32:if po=pa+40 or pj=po+1 then 59100 
59080 pl=(pj-1024)/40:if pl=int(pl) or pj<>po then 59085
59082 if peek(pj-1)<>32 and peek(pj-40-80*(po<>pa))<>32 then pv=105
59085 pl=(pj-1023)/40:if pl=int(pl) or pj=po then 59095
59090 if peek(pj+1)<>32 and peek(pj-40-80*(po<>pa))<>32 then pv=95
59095 if po<>pa and pv=105 then pv=95+128
59096 if po<>pa and pv=95 then pv=105+128
59100 if xi>-1 and xi<40 then poke pj,pv
59110 xi=xi+1:gosub 42000:next pj,po
59120 poke 54272+px,cx:return

59200 rem check for hole
59210 pa=pn:for pj=0 to 1
59220 pn=pj:sa=1024+(py(pn)+1)*40+px(pn)+40
59230 if peek(sa)=32 and peek(sa+1)=32 and sa<2024 then gosub 59900
59240 gosub 53000:next:pn=pa
59250 return

59500 rem track bullet outside
59510 pa=1024+int(xf/8)
59520 oa=pa:poke pa,30:pa=pa+1
59530 if pa<1064 then poke pa,32
59540 pa=pa-2:if pa>1023 then poke pa,32
59550 return

59800 rem out of bounds
59805 gosub 42000:gosub 39850
59810 ai(pn,0)=0:ob%=1:return

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
60020 print hm$;po$(pn);cl$;
60030 print hm$;dn$;po$(pn);cl$;
60040 print hm$;dn$;dn$;po$(pn);cl$;
60050 print hm$;dn$;dn$;dn$;po$(pn);cl$;
60060 return

60100 rem calculate screen pos
60110 sa=1024+py(pn)*40+px(pn)+40:return

61000 rem player hit
61005 if ob%=1 then ob%=0:return
61010 sp=sp-1024:py=int(sp/40):px=sp-py*40
61015 if px>39 or px<0 then return
61020 for i=0 to 1:dx=abs(px(i)-px)+(px>px(i)):dy=abs(py(i)-py)
61030 if dx>2 or dy>2 then 61200
61040 dd=10*(2-dx)+10*(2-dy)
61045 ai(i,3)=ai(i,3)+1:if dd<=0 then 61200
61050 hp%(i)=hp%(i)-dd:if hp%(i)<0 then hp%(i)=0
61055 if af%(pn)=1 and i<>pn then tn%=0:gosub 61750
61057 if af%(i)=1 and i<>pn then tn%=1:gosub 61750
61060 pa=pn:pn=i:gosub 39750:gosub 54150:gosub 61500
61070 for p=0 to dd*2:poke 53270,peek(53266) and 7 or 8:next p
61080 poke 53270,8:gosub 54250:pn=pa
61200 next i:gosub 61800:return

61500 rem modify cannon on hit
61505 if rnd(1)<0.5 then return
61510 if ai(pn,0)>0 then ai(pn,0)=ai(pn,0)+(10-int(rnd(1)*20))
61520 if ai(pn,0)<10 then ai(pn,0)=0
61530 return

61600 rem show scores
61610 a$=str$(ps(0))+" -"+str$(ps(1))
61620 yp=4:ck=1:gosub 62900
61630 return

61700 rem read taunts
61710 for i=0 to 19:read tn$(i):next
61720 return

61750 rem display taunt
61755 if ti-ts<80 then return
61760 yp=rnd(1)*10:if tn%=0 then a$=tn$(yp)
61770 if tn%=1 then a$=tn$(yp+10)
61780 yp=4:ck=1:gosub 62900
61790 ts=ti:return

61800 rem clear taunt
61810 if ti-ts<80 then 61810
61820 a$=cx$:yp=4:ck=1:gosub 62900:return

62000 rem check death
62010 pa=0:pd=1:for i=0 to 1:if hp%(i)<=0 then pa=pa+pd:gosub 62100
62020 pd=pd+9:next
62025 if pa=0 then return
62028 gosub 39500
62030 if pa>10 then a$="draw!!":yp=6:ck=10:gosub 62900
62035 yp=6
62040 if pa=1 then a$="player 2 wins!":ck=pc(1):ps(1)=ps(1)+1:gosub 62900
62050 if pa=10 then a$="player 1 wins!":ck=pc(0):ps(0)=ps(0)+1:gosub 62900
62060 gosub 61600:gosub 62280:gosub 62250
62070 rs%=1:rp=(rp+1) and 1:cp=rp:return

62100 rem draw damaged player
62110 oo=pn:pn=i:gosub 60100:poke sa,104:poke sa+1,104
62120 poke sa-40,32:poke sa-39,32:pn=oo:return

62200 rem screen off
62210 poke 53265,peek(53265) and 239:return

62220 rem screen on
62230 poke 53265,peek(53265) or 16:return

62250 rem wait for input
62260 get a$:gosub 42000:if a$="" then 62260
62270 return

62280 rem wait for no input
62285 get a$:gosub 42000:if a$<>"" then 62285
62290 return

62300 rem render title
62310 restore
62320 read a:if a<>-1 then 62320
62330 co=0:i=1024:gosub 62200
62340 read p
62350 if p=-999 then gosub 62220: return
62360 if p<0 then gosub 62400:goto 62340
62370 if p<16 then co = p:goto 62340 
62380 poke i,p+16:poke 54272+i,co
62390 i=i+1:goto 62340

62400 rem fill blanks
62410 for j=i to i-p
62420 poke j,160:poke 54272+j,0
62430 next
62440 i=j-1:return

62500 rem show title
62510 gosub 62300:gosub 61700
62520 poke 646,6:xp=3:yp=3:gosub 62950
62530 print "the battle of":xp=10:yp=4:gosub 62950
62540 print "vittorio!"
62550 poke 646,5:xp=23:yp=24:gosub 62950
62560 print "egonolsen71/2021";
62565 gosub 62280
62570 gosub 42000:gosub 63700
62580 gosub 62200:poke 646,1:print chr$(147);
62590 poke 53280,6:poke 53281,6
62595 poke 646,7:xp=10:yp=24:gosub 62950:print"press space to begin"
62600 poke 646,1:xp=10:yp=0:gosub 62950:print "prepare for battle!"
62610 xp=8:yp=7:gosub 62950:print "(f1) player 1"
62620 xp=8:yp=15:gosub 62950:print "(f3) player 2"
62630 poke 1286,78:poke 1366,77:poke 1606,78:poke 1686,77
62640 xp=23:yp=5
62650 for i=0 to 1:af=af%(i)
62660 for j=0 to 1:pn$=pn$(j):gosub 62950
62670 if j=af then print chr$(18);:goto 62690
62680 print chr$(146);
62690 print pn$:yp=yp+4
62700 next j,i:print chr$(146);
62800 gosub 62220:gosub 62250
62810 if a$=chr$(133) then af%(0)=(af%(0)+1) and 1:gosub 39800
62820 if a$=chr$(134) then af%(1)=(af%(1)+1) and 1:gosub 39800
62830 if a$=" " or a$=chr$(13) then 62870
62835 gosub 42000
62840 goto 62640
62850 ps(0)=0:ps(1)=0
62870 print chr$(147);:return

62900 rem print text
62910 xp=20-int(len(a$)/2):ii=peek(646):poke 646,ck
62920 gosub 62950
62930 print a$:poke 646,ii:return

62950 rem set cursor location
62960 poke 781,yp:poke 782,xp: poke 783,peek(783) and 254:sys 65520
62970 return

63000 data 32,101,117,97,246,234,160,-1
63010 data 15,87,215,97,99,59,50,99,88,57,109,,16,15,80,,16,16
63011 data 16,15,80,238,208,170,208,95,29,42,80,42,42,80,,16,15,80
63012 data 88,45,88,97,104,64,86,233,223,231,150,108,223,76,93
63013 data 195,192,86,109,17,45,,16,15,80,,16,15,42,84,238,170
63014 data 197,208,144,186,232,95,57,80,80,45,57,42,91,97,109
63015 data 69,43,95,86,86,60,232,180,80,,16,16,16,15,103,222,86
63016 data 99,43,80,80,,16,15,92,237,173,151,189,185,187,152,208
63017 data 208,144,144,207,,16,15,80,58,45,106,70,57,56,86,86
63018 data 224,237,195,86,185,,16,16,16,16,16,15,58,103,97,17
63019 data 43,,16,15,92,187,144,170,215,235,195,86,212,208,157
63020 data 208,144,208,207,58,109,56,93,86,70,86,86,86,86,63,59
63021 data 83,53,,16,16,16,15,58,231,232,107,80,109,191,211,86
63022 data 79,215,226,186,80,64,175,198,235,144,208,208,144,208
63023 data 82,57,57,86,86,204,86,225,191,82,105,82,105,217,,16
63024 data 16,16,15,80,104,210,208,57,58,233,212,208,231,87,173
63025 data 86,80,80,58,67,237,222,156,156,144,144,144,236,,16
63026 data 16,11,84,15,80,103,61,187,151,208,151,187,208,192,88
63027 data 80,,16,15,80,,16,15,23,59,,16,15,105,23,216,208,208
63028 data 170,208,60,83,79,231,203,170,227,159,185,144,208,104
63029 data 80,12,229,11,208,192,,16,15,102,233,208,144,144,144
63030 data 144,195,86,86,88,,16,16,16,15,80,,16,16,16,15,80,204
63031 data 208,184,208,144,211,57,83,210,237,187,208,70,104,104
63032 data 80,,16,11,187,144,215,,16,16,16,15,23,233,208,144,144
63033 data 151,86,49,86,80,96,80,,16,11,92,187,236,,16,15,23,235
63034 data 151,227,144,208,215,95,84,106,171,144,192,80,,16,11,84
63035 data 84,79,-1,,85,16,16,16,16,16,15,58,79,208,104,104,97
63036 data 233,234,12,23,60,,16,102,-1,11,144,15,80,28,12,23,15,156
63037 data 183,12,144,208,15,180,86,185,70,221,237,99,59,92,,208
63038 data -1,145,208,236,11,57,,16,16,16,16,15,92,189,186,,16
63039 data 16,16,16,15,23,80,12,87,15,107,11,58,,208,11,208,15,80
63040 data 23,58,188,189,12,208,144,144,15,208,231,231,62,79,186
63041 data 107,12,102,-5,,81,16,16,16,15,92,185,86,234,,16,16
63042 data 16,16,16,16,16,12,61,,191,-1,11,236,57,15,23,76,88
63043 data 58,189,12,208,144,144,15,144,208,230,80,93,110,87,11,144
63044 data -4,,85,16,15,30,87,221,188,104,80,,16,16,16,16,16,16
63045 data 16,11,229,-3,,186,15,80,58,86,186,64,176,144,12,144
63046 data 144,15,208,208,107,,16,16,16,11,64,-3,,151,84,15,80
63047 data 74,225,83,80,,16,16,16,16,16,16,16,16,11,92,208,12,144
63048 data -1,,208,-1,85,15,80,58,97,59,210,185,12,208,144,208
63049 data 15,208,208,12,85,,16,15,80,,187,-4,151,57,15,23,103
63050 data 97,103,,16,16,16,16,16,16,16,12,92,208,144,11,144,-3,,236
63051 data 16,16,16,16,15,28,80,83,83,103,104,80,,16,15,80,,238
63052 data -6,236,80,16,16,16,16,16,16,16,16,16,16,12,209,11,144
63053 data 12,144,11,144,-3,,208,80,16,16,16,15,80,80,80,30,80
63054 data 11,84,15,95,105,,191,-6,11,144,-1,,207,16,16,16,16
63055 data 16,16,16,16,16,16,11,23,223,,208,11,144,-2,,208,208
63056 data 101,16,16,16,16,15,80,,16,15,80,217,11,208,12,170,-8,11,144
63057 data 144,,151,85,16,16,16,16,16,16,16,16,16,16,16,213,-3,208
63058 data 106,80,16,16,16,16,15,80,11,95,,16,15,187,,208,-3,208
63059 data -5,11,144,-2,,85,16,16,16,16,16,16,16,16,16,16,16,102
63060 data -4,208,60,16,16,16,16,16,11,79,211,,208,-13,11,231
63061 data 12,232,11,105,,80,16,16,16,16,16,16,16,16,23,-2,208
63062 data -2,11,151,57,,16,16,16,16,80,103,208,208,-12,11,144
63063 data 12,144,11,144,151,207,,16,16,16,16,16,16,84,84,208
63064 data 208,23,210,212,-1,230,16,16,16,16,16,217,-9,158,208
63065 data -3,12,144,144,11,144,144,144,,16,16,16,16,16,16,238
63066 data 208,-1,215,16,16,209,-1,110,16,16,16,16,11,80,,208
63067 data -16,11,144,144,144,,16,16,16,16,16,12,92,11,208,-1,11,208
63068 data ,208,15,207,,16,213,215,16,16,16,16,16,12,80,,208,-11,11,144
63069 data -2,11,144,144,144,-1,11,144,,16,16,16,16,16,12,229
63070 data ,208,-1,12,144,144,15,208,,105,-1,101,16,16,16,16,11,229
63071 data 231,-3,,208,11,144,-8,11,144,144,144,144,144,-1,12,144
63072 data ,16,16,16,16,12,191,144,,208,-1,12,208,144,144,,208
63073 data -1,211,192,16,16,16,80,64,208,-1,170,12,144,-2,,208
63074 data -8,11,144,-1,11,144,-2,-999

63500 data "it sucks to be you!"
63510 data "like taking candy from a baby!"
63520 data "it's good to be the best!"
63530 data "ouch, that had to hurt!"
63540 data "fire in the hole!"
63550 data "believe it, little boy!"
63560 data "lol!"
63570 data "your attempts are futile!"
63580 data "who's the man?"
63590 data "boom!"
63600 data "you were just lucky!"
63610 data "stop shooting me!"
63620 data "that didn't hurt!"
63630 data "stop throwing things at me!"
63640 data "i need some back-up!"
63650 data "you are such a fool!"
63660 data "where's my mother?"
63670 data "bugger off!"
63680 data "window licker!"
63690 data "bloody hell!"

63700 rem title song by jim vogel
63705 rem > the c64 music book <
63720 poke si+24,15
63730 poke si+5,9:poke si+6,0
63735 poke si+12,26:poke si+13,36
63740 poke si+19,16:poke si+20,240
63750 t = ti
63760 poke si+4,32:poke si+11,32:poke si+18,16
63770 read x:if x=-1 then 63900
63780 read h1,l1,h2,l2,h3,l3
63790 if h1 then poke si+1,h1:poke si,l1:poke si+4,33
63800 if h2 then poke si+8,h2:poke si+7,l2:poke si+11,33
63810 if h3 then poke si+15,h3:poke si+14,l3:poke si+18,17
63820 t = t+ x
63830 if t>ti then goto 63830
63835 get a$:if a$="" then 63760
63840 gosub 39910:return
63850 data 10,18,209,0,0,0,0,10,17,195,0,0,8,225
63852 data 10,18,209,0,0,9,104,10,21,31,0,0,10,143
63854 data 10,22,96,0,0,11,48,10,22,96,0,0,11,48
63856 data 20,25,30,0,0,12,143,10,28,49,18,209,11,48
63858 data 20,22,96,0,0,0,0,40,28,49,18,209,11,48
63860 data 20,0,0,0,0,7,12,10,25,30,17,195,10,143
63862 data 20,25,30,17,195,10,143,40,25,30,17,195,10,143
63864 data 20,0,0,0,0,7,112,10,28,49,18,209,11,48
63866 data 20,28,49,18,209,11,48,35,28,49,18,209,11,48
63868 data 5,0,0,0,0,7,12,5,0,0,0,0,7,233
63870 data 5,0,0,0,0,8,225,10,18,209,0,0,9,104
63872 data 10,17,195,0,0,8,225,10,18,209,0,0,9,104
63874 data 10,21,31,0,0,10,143,10,22,96,0,0,11,48
63876 data 10,22,96,0,0,11,48,20,25,30,0,0,12,143
63878 data 10,28,49,18,209,11,48,20,28,49,18,209,11,48
63880 data 30,28,49,18,209,11,48,10,22,96,0,0,11,48
63882 data 10,25,30,0,0,10,143,20,28,49,22,96,9,104
63884 data 20,25,30,21,31,8,97,10,22,96,18,209,7,119
63886 data 10,22,96,0,0,0,0,20,21,31,17,195,7,12
63888 data 30,18,209,14,24,9,104,20,0,0,0,0,7,12
63890 data 30,0,0,0,0,4,180,-1
63900 rem
63910 return


