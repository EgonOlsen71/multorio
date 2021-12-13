10 print chr$(147)
20 print "generated with spritemate"
30 print "3 of 3 sprites displayed."
40 poke 53285,2: rem multicolor 1
50 poke 53286,10: rem multicolor 2
60 poke 53269,255 : rem set all 8 sprites visible
70 for x=12800 to 12800+191: read y: poke x,y: next x: rem sprite generation
80 :: rem sprite_0
90 poke 53287,7: rem color = 7
100 poke 2040,200: rem pointer
110 poke 53248, 44: rem x pos
120 poke 53249, 120: rem y pos
130 :: rem sprite_0
140 poke 53288,7: rem color = 7
150 poke 2041,201: rem pointer
160 poke 53250, 92: rem x pos
170 poke 53251, 120: rem y pos
180 :: rem sprite_0
190 poke 53289,7: rem color = 7
200 poke 2042,202: rem pointer
210 poke 53252, 140: rem x pos
220 poke 53253, 120: rem y pos
230 poke 53276, 7: rem multicolor
240 poke 53277, 0: rem width
250 poke 53271, 0: rem height
1000 :: rem sprite_0 / multicolor / color: 7
1010 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1020 data 80,0,0,109,192,3,237,176,3,153,176,1,153,192,13,155
1030 data 192,14,173,0,7,181,0,5,64,0,0,0,0,0,0,0
1040 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135
1050 :: rem sprite_0 / multicolor / color: 7
1060 data 0,0,0,0,5,64,0,6,64,0,22,80,0,30,208,21
1070 data 90,212,91,121,244,121,233,180,106,154,100,89,190,100,29,214
1080 data 164,15,157,48,7,165,80,5,106,64,0,103,64,0,109,64
1090 data 0,117,0,0,84,0,0,16,0,0,0,0,0,0,0,135
1100 :: rem sprite_0 / multicolor / color: 7
1110 data 0,0,0,5,85,64,5,231,69,7,166,109,2,170,169,17
1120 data 158,217,93,189,185,122,169,164,106,187,100,93,219,100,29,183
1130 data 180,2,175,176,106,186,180,106,122,85,118,118,153,118,106,157
1140 data 122,102,173,95,21,93,21,17,153,20,1,164,0,1,84,135
