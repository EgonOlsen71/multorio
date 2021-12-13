REALFAC = $BBA2
MEMARG = $BA8C
MEMMUL = $BA28
MEMSUB = $B850
FACMEM = $BBD7
PRINTSTRS = $AB25
VALS = $B7B5
CMPFAC = $BC5B
FACADD = $B867
SGNFAC = $BC2B
ARGADD = $B86A
ARGAND = $AFE9
ARGDIV = $BB14
FACMUL = $BA30
FACLOG = $B9EA
FACSQR = $BF71
FACEXPCALL = $BFED
FACABS = $BC58
FACSIN = $E26B
FACCOS = $E264
FACTAN = $E2B4
FACATN = $E30E
FACSIG = $BC39
FACNOT = $AED4
FACRND = $E097
XFACWORD = $B7F7
FACDIV = $BB0F
BASINT = $BCCC
FACPOW = $BF7B
FACSUB = $B853
FACOR = $AFE6
ARGFAC = $BBFC
FACARG = $BC0C
FACSTR = $BDDF
FACINT = $B1AA
RNDFAC = $BC1B
INTFAC = $B391
WRITETIS = $A9E7
GETTI = $BE68
GETTIME = $AF7E
COPYTIME = $AF87
TI2FAC = $AF84
BYTEFAC = $B3A2
CRSRRIGHT = $AB3B
ERRALL = $A437
ERRIQ = $B248
ERREI = $ACF4
ERRSYN = $AF08
INPUT = $A560
CRSRPOS = $FFF0
CHROUT = $FFD2
GETIN = $FFE4
OPENCH = $FFC0
CLOSECH = $FFC3
CHKIN = $FFC6
CHKOUT = $FFC9
CLRCH = $FFCC
LOADXX = $FFD5
SAVEXX = $FFD8
TWAIT = $FFE1
ERRFNF = $F12F
ARGSGN=$6E
ARGLO=$6D
ARGMO=$6C
ARGMOH=$6B
ARGHO=$6A
ARGEXP=$69
FACSGN=$66
FACLO=$65
FACMO=$64
FACMOH=$63
FACHO=$62
FACEXP=$61
FACOV=$70
OLDOV=$56
ARISGN=$6F
FAC=$61
RESLO=$29
RESMO=$28
RESMOH=$27
RESHO=$26
RESOV=$2A
RESHOP=$6F
FACHOP=$56
ITERCNT=$67
IOCHANNEL=$13
BASICSTART=$2B
BASICEND=$37
STATUS=$90
VERCHK=$93
SECADDR=$B9
DEVICENUM=$BA
FILELEN=$B7
LOGICADDR=$B8
FILEADDR=$BB
LOADEND=$C3
KEYNDX=$C6
INDEX1=$22
VALTYPE=$0D
LOWDS=$5D
TIMEADDR=$A0
BASICPOINTER=$7A
LOADOK_STATUS=64
LOFBUF=$FF
LOFBUFH=$100
INPUTBUF=$200
BASICBUFFER=820
TMP_ZP = 105
TMP2_ZP = 107
TMP3_ZP = 34
;make sure that JUMP_TARGET's low can't be $ff
JUMP_TARGET = 69
TMP_REG=71
G_REG=73
X_REG=61
*=2072
TSX
STX SP_SAVE
; *** CODE ***
PROGRAMSTART:
JSR START
;
LINE_0:
;
;
LINE_10:
;
LDY #1
STY 646
; Optimizer rule: Simple POKE/2
JSR COMPACTMAX
LDA #147
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
LDY #1
STY 53280
; Optimizer rule: Simple POKE/2
LDY #1
STY 53281
; Optimizer rule: Simple POKE/2
;
LINE_15:
;
JSR COMPACTMAX
LDA #142
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
JSR COMPACTMAX
LDA #8
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
JSR GOSUB
JSR LINE_48600
;
LINE_20:
;
LDY #192
STY 650
; Optimizer rule: Simple POKE/2
LDY #0
STY 652
; Optimizer rule: Simple POKE/2
JSR GOSUB
JSR LINE_48000
JSR GOSUB
JSR LINE_39900
JSR GOSUB
JSR LINE_62500
;
LINE_30:
;
JSR GOSUB
JSR LINE_49000
JSR GOSUB
JSR LINE_51000
LDY #0
TYA
; Optimizer rule: INT to FAC, FAC to INT/2
STY VAR_RS%
STA VAR_RS%+1
LDY #0
TYA
; Optimizer rule: INT to FAC, FAC to INT/2
STY VAR_OB%
STA VAR_OB%+1
;
LINE_40:
;
LDX #4
dcloop184_1:
LDA VAR_CP,X
STA VAR_PN,X
DEX
BPL dcloop184_1
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_54000
JSR GOSUB
JSR LINE_55000
;
LINE_60:
;
JSR GOSUB
JSR LINE_56000
JSR GOSUB
JSR LINE_59200
;
LINE_70:
;
JSR GOSUB
JSR LINE_62000
;
LINE_80:
;
LDA #$01
LDY #$00
STA TMP_ZP
STY TMP_ZP+1
LDY VAR_RS%
LDA VAR_RS%+1
JSR ICMP
; Optimized code for Integer(2)
;
;
;
;
;
;
;
;
;
;
EQ_EQ0:
EQ_SKIP0:
COMP_SKP0:
BNE LINE_SKIP86
LINE_NSKIP86:
; Optimizer rule: Simplified equal comparison/6
;
JSR COMPACTMAX
LDA #147
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
JMP LINE_30
;
LINE_SKIP86:
;
;
LINE_90:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_CP
LDY #>VAR_CP
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR MEMARG
JSR FASTAND
; Optimizer rule: Swap AND order/7
; Optimizer rule: Faster logic AND/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_CP
LDY #>VAR_CP
; FAC to (X/Y)
JSR FACMEM
;
LINE_100:
;
JMP LINE_40
;
LINE_999:
;
JSR END
RTS
;
LINE_39400:
;
;
LINE_39410:
LDX #4
dcloop184_2:
LDA CONST_6R,X
STA VAR_AT,X
LDA CONST_6R,X
STA VAR_DC,X
LDA CONST_7R,X
STA VAR_EL,X
LDA CONST_0R,X
STA VAR_RL,X
LDA CONST_8R,X
STA VAR_LQ,X
LDA CONST_6R,X
STA VAR_HQ,X
DEX
BPL dcloop184_2
; Special rule: Aggregation of assignments (6)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_39420:
LDX #4
dcloop184_8:
LDA CONST_9R,X
STA VAR_WF,X
LDA CONST_10R,X
STA VAR_PT,X
DEX
BPL dcloop184_8
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_IM
STA VAR_IM+1
STA VAR_IM+2
STA VAR_IM+3
STA VAR_IM+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_40000
JMP RETURN
;
LINE_39500:
;
;
LINE_39510:
LDX #4
dcloop184_10:
LDA CONST_11R,X
STA VAR_AT,X
LDA CONST_12R,X
STA VAR_DC,X
DEX
BPL dcloop184_10
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_EL
STA VAR_EL+1
STA VAR_EL+2
STA VAR_EL+3
STA VAR_EL+4
; Optimizer rule: Simplified setting to 0/6
STA VAR_RL
STA VAR_RL+1
STA VAR_RL+2
STA VAR_RL+3
STA VAR_RL+4
LDX #4
dcloop184_12:
LDA CONST_8R,X
STA VAR_LQ,X
LDA CONST_13R,X
STA VAR_HQ,X
DEX
BPL dcloop184_12
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_39520:
LDX #4
dcloop184_14:
LDA CONST_14R,X
STA VAR_WF,X
LDA CONST_15R,X
STA VAR_PT,X
DEX
BPL dcloop184_14
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_IM
STA VAR_IM+1
STA VAR_IM+2
STA VAR_IM+3
STA VAR_IM+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_40000
;
LINE_39530:
LDX #4
dcloop184_16:
LDA CONST_13R,X
STA VAR_AT,X
LDA CONST_16R,X
STA VAR_DC,X
DEX
BPL dcloop184_16
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_EL
STA VAR_EL+1
STA VAR_EL+2
STA VAR_EL+3
STA VAR_EL+4
; Optimizer rule: Simplified setting to 0/6
STA VAR_RL
STA VAR_RL+1
STA VAR_RL+2
STA VAR_RL+3
STA VAR_RL+4
LDX #4
dcloop184_18:
LDA CONST_8R,X
STA VAR_LQ,X
LDA CONST_3R,X
STA VAR_HQ,X
DEX
BPL dcloop184_18
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_39540:
LDX #4
dcloop184_20:
LDA CONST_14R,X
STA VAR_WF,X
LDA CONST_17R,X
STA VAR_PT,X
DEX
BPL dcloop184_20
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_IM
STA VAR_IM+1
STA VAR_IM+2
STA VAR_IM+3
STA VAR_IM+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_40000
;
LINE_39550:
LDX #4
dcloop184_22:
LDA CONST_18R,X
STA VAR_AT,X
LDA CONST_19R,X
STA VAR_DC,X
DEX
BPL dcloop184_22
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_EL
STA VAR_EL+1
STA VAR_EL+2
STA VAR_EL+3
STA VAR_EL+4
; Optimizer rule: Simplified setting to 0/6
STA VAR_RL
STA VAR_RL+1
STA VAR_RL+2
STA VAR_RL+3
STA VAR_RL+4
LDX #4
dcloop184_24:
LDA CONST_8R,X
STA VAR_LQ,X
LDA CONST_11R,X
STA VAR_HQ,X
DEX
BPL dcloop184_24
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_39560:
LDX #4
dcloop184_26:
LDA CONST_14R,X
STA VAR_WF,X
LDA CONST_20R,X
STA VAR_PT,X
DEX
BPL dcloop184_26
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_IM
STA VAR_IM+1
STA VAR_IM+2
STA VAR_IM+3
STA VAR_IM+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_40000
JMP RETURN
;
LINE_39600:
;
;
LINE_39610:
LDX #4
dcloop184_28:
LDA CONST_13R,X
STA VAR_AT,X
LDA CONST_3R,X
STA VAR_DC,X
DEX
BPL dcloop184_28
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_EL
STA VAR_EL+1
STA VAR_EL+2
STA VAR_EL+3
STA VAR_EL+4
; Optimizer rule: Simplified setting to 0/6
STA VAR_RL
STA VAR_RL+1
STA VAR_RL+2
STA VAR_RL+3
STA VAR_RL+4
LDX #4
dcloop184_30:
LDA CONST_8R,X
STA VAR_LQ,X
LDA CONST_21R,X
STA VAR_HQ,X
DEX
BPL dcloop184_30
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_39620:
LDX #4
dcloop184_32:
LDA CONST_14R,X
STA VAR_WF,X
LDA CONST_22R,X
STA VAR_PT,X
DEX
BPL dcloop184_32
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_IM
STA VAR_IM+1
STA VAR_IM+2
STA VAR_IM+3
STA VAR_IM+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_40000
JMP RETURN
;
LINE_39650:
;
;
LINE_39660:
LDX #4
dcloop298_1:
LDA CONST_0R,X
STA VAR_AT,X
LDA CONST_3R,X
STA VAR_DC,X
DEX
BPL dcloop298_1
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_EL
STA VAR_EL+1
STA VAR_EL+2
STA VAR_EL+3
STA VAR_EL+4
; Optimizer rule: Simplified setting to 0/6
STA VAR_RL
STA VAR_RL+1
STA VAR_RL+2
STA VAR_RL+3
STA VAR_RL+4
LDX #4
dcloop298_3:
LDA CONST_8R,X
STA VAR_LQ,X
LDA CONST_21R,X
STA VAR_HQ,X
DEX
BPL dcloop298_3
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_39670:
LDX #4
dcloop298_5:
LDA CONST_9R,X
STA VAR_WF,X
LDA CONST_22R,X
STA VAR_PT,X
DEX
BPL dcloop298_5
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_IM
STA VAR_IM+1
STA VAR_IM+2
STA VAR_IM+3
STA VAR_IM+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_40000
JMP RETURN
;
LINE_39750:
;
;
LINE_39760:
LDX #4
dcloop298_7:
LDA CONST_0R,X
STA VAR_AT,X
LDA CONST_18R,X
STA VAR_DC,X
DEX
BPL dcloop298_7
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_EL
STA VAR_EL+1
STA VAR_EL+2
STA VAR_EL+3
STA VAR_EL+4
; Optimizer rule: Simplified setting to 0/6
STA VAR_RL
STA VAR_RL+1
STA VAR_RL+2
STA VAR_RL+3
STA VAR_RL+4
LDX #4
dcloop298_9:
LDA CONST_8R,X
STA VAR_LQ,X
LDA CONST_3R,X
STA VAR_HQ,X
DEX
BPL dcloop298_9
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_39770:
LDX #4
dcloop298_11:
LDA CONST_9R,X
STA VAR_WF,X
LDA CONST_22R,X
STA VAR_PT,X
DEX
BPL dcloop298_11
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_IM
STA VAR_IM+1
STA VAR_IM+2
STA VAR_IM+3
STA VAR_IM+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_40000
JMP RETURN
;
LINE_39800:
;
;
LINE_39810:
LDX #4
dcloop298_13:
LDA CONST_6R,X
STA VAR_AT,X
LDA CONST_23R,X
STA VAR_DC,X
LDA CONST_3R,X
STA VAR_EL,X
LDA CONST_6R,X
STA VAR_RL,X
LDA CONST_8R,X
STA VAR_LQ,X
LDA CONST_24R,X
STA VAR_HQ,X
DEX
BPL dcloop298_13
; Special rule: Aggregation of assignments (6)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_39820:
LDX #4
dcloop298_19:
LDA CONST_14R,X
STA VAR_WF,X
LDA CONST_7R,X
STA VAR_PT,X
LDA CONST_0R,X
STA VAR_IM,X
DEX
BPL dcloop298_19
; Special rule: Aggregation of assignments (3)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_40000
JMP RETURN
;
LINE_39850:
;
;
LINE_39860:
LDX #4
dcloop298_22:
LDA CONST_7R,X
STA VAR_AT,X
LDA CONST_7R,X
STA VAR_DC,X
LDA CONST_25R,X
STA VAR_EL,X
LDA CONST_23R,X
STA VAR_RL,X
LDA CONST_8R,X
STA VAR_LQ,X
LDA CONST_25R,X
STA VAR_HQ,X
DEX
BPL dcloop298_22
; Special rule: Aggregation of assignments (6)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_39870:
LDX #4
dcloop298_28:
LDA CONST_14R,X
STA VAR_WF,X
LDA CONST_3R,X
STA VAR_PT,X
DEX
BPL dcloop298_28
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_IM
STA VAR_IM+1
STA VAR_IM+2
STA VAR_IM+3
STA VAR_IM+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_40000
JMP RETURN
;
LINE_39900:
;
;
LINE_39905:
;
LDA #0
STA VAR_VC
STA VAR_VC+1
STA VAR_VC+2
STA VAR_VC+3
STA VAR_VC+4
; Optimizer rule: Simplified setting to 0/6
STA VAR_AC
STA VAR_AC+1
STA VAR_AC+2
STA VAR_AC+3
STA VAR_AC+4
; Optimizer rule: Simplified setting to 0/6
;
LINE_39910:
;
LDX #4
dcloop298_30:
LDA CONST_26,X
STA VAR_I,X
DEX
BPL dcloop298_30
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_27
LDY #>CONST_27
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR FASTFOR
LDY #0
TYA
CPY A_REG
BNE COMP_SKP1
CMP A_REG+1
BNE COMP_SKP1
COMP_SKP1:
BNE RBEQ_0
JMP (JUMP_TARGET)
RBEQ_0:
;
LINE_39920:
;
LDY #15
STY 54296
; Optimizer rule: Simple POKE/2
JMP RETURN
;
LINE_40000:
;
;
LINE_40005:
;
LDA #0
STA VAR_IC
STA VAR_IC+1
STA VAR_IC+2
STA VAR_IC+3
STA VAR_IC+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_42000
;
LINE_40010:
;
LDA #<VAR_VC
LDY #>VAR_VC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_VW%[]
LDY #>VAR_VW%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
LDA X_REG
BEQ EQ_EQ1
LDA #0
; Optimizer rule: CMP (REG) = 0/3
JMP EQ_SKIP1
EQ_EQ1:
LDA #$1
EQ_SKIP1:
COMP_SKP2:
BEQ LINE_SKIP87
; Simplified conditional branch
;
LINE_NSKIP87:
;
JMP LINE_40100
;
LINE_SKIP87:
;
;
LINE_40020:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_VC
LDY #>VAR_VC
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_VC
LDY #>VAR_VC
; FAC to (X/Y)
JSR FACMEM
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_IC
LDY #>VAR_IC
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_IC
LDY #>VAR_IC
; FAC to (X/Y)
JSR FACMEM
;
LINE_40030:
;
LDX #4
dceloop2738_1:
LDA CONST_23R,X
CMP VAR_VC,X
BNE LINE_SKIP88
DEX
BPL dceloop2738_1
; Optimizer rule: Direct compare(=) of floats/7
LINE_NSKIP88:
; Optimizer rule: Simplified equal comparison/6
;
LDA #0
STA VAR_VC
STA VAR_VC+1
STA VAR_VC+2
STA VAR_VC+3
STA VAR_VC+4
; Optimizer rule: Simplified setting to 0/6
;
LINE_SKIP88:
;
;
LINE_40040:
;
LDX #4
dceloop2738_2:
LDA CONST_23R,X
CMP VAR_IC,X
BNE LINE_SKIP89
DEX
BPL dceloop2738_2
; Optimizer rule: Direct compare(=) of floats/7
LINE_NSKIP89:
; Optimizer rule: Simplified equal comparison/6
;
JMP RETURN
;
LINE_SKIP89:
;
;
LINE_40050:
;
JMP LINE_40010
;
LINE_40100:
;
<IF !X16>
SEI
LDY TIMEADDR
LDX TIMEADDR+1
LDA TIMEADDR+2
CLI
</IF>
SEC
JSR COPYTIME
JSR GETTIME
LDX #<VAR_TI
LDY #>VAR_TI
JSR FACMEM
LDX #4
dcloop298_31:
LDA VAR_TI,X
STA VAR_TT,X
DEX
BPL dcloop298_31
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_11R
LDY #>CONST_11R
JSR REALFAC
LDA #<VAR_VC
LDY #>VAR_VC
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: Highly simplified loading for calculations (mul)/6
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_26
LDY #>CONST_26
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SB
LDY #>VAR_SB
; FAC to (X/Y)
JSR FACMEM
;
LINE_40110:
;
LDA #<CONST_21R
LDY #>CONST_21R
JSR REALFAC
LDA #<VAR_SB
LDY #>VAR_SB
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDY #4
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_AT
LDY #>VAR_AT
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_DC
LDY #>VAR_DC
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF7+1
STA MOVBSELF7+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF7:
STY $FFFF
;
LINE_40120:
;
LDA #<CONST_10R
LDY #>CONST_10R
JSR REALFAC
LDA #<VAR_SB
LDY #>VAR_SB
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDY #4
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_EL
LDY #>VAR_EL
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_RL
LDY #>VAR_RL
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF8+1
STA MOVBSELF8+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF8:
STY $FFFF
;
LINE_40130:
;
LDA #<VAR_SB
LDY #>VAR_SB
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_LQ
LDY #>VAR_LQ
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF9+1
STA MOVBSELF9+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF9:
STY $FFFF
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SB
LDY #>VAR_SB
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_HQ
LDY #>VAR_HQ
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF10+1
STA MOVBSELF10+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF10:
STY $FFFF
;
LINE_40140:
;
LDA #<VAR_VC
LDY #>VAR_VC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_WF
LDY #>VAR_WF
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_VW%[]
LDY #>VAR_VW%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INTEGER
LDA #<VAR_VC
LDY #>VAR_VC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_TT
LDY #>VAR_TT
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_VL[]
LDY #>VAR_VL[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<CONST_7R
LDY #>CONST_7R
JSR REALFAC
LDA #<VAR_SB
LDY #>VAR_SB
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_WF
LDY #>VAR_WF
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF11+1
STA MOVBSELF11+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF11:
STY $FFFF
;
LINE_40150:
;
LDA #<VAR_VC
LDY #>VAR_VC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PT
LDY #>VAR_PT
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_VT%[]
LDY #>VAR_VT%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INTEGER
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_AC
LDY #>VAR_AC
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_AC
LDY #>VAR_AC
; FAC to (X/Y)
JSR FACMEM
;
LINE_40160:
;
LDA VAR_IM
BEQ EQ_SKIP4
EQ_EQ4:
JMP LINE_SKIP90
EQ_SKIP4:
COMP_SKP5:
; Optimizer rule: Reverted comparison/6
; Simplified conditional branch
;
LINE_NSKIP90:
;
JMP RETURN
;
LINE_SKIP90:
;
;
LINE_40170:
;
<IF !X16>
SEI
LDY TIMEADDR
LDX TIMEADDR+1
LDA TIMEADDR+2
CLI
</IF>
SEC
JSR COPYTIME
JSR GETTIME
LDX #<VAR_TI
LDY #>VAR_TI
JSR FACMEM
LDX #4
dcloop412_1:
LDA VAR_TI,X
STA VAR_TT,X
DEX
BPL dcloop412_1
; Optimizer rule: Direct copy of floats into mem/6
LDA #<VAR_VC
LDY #>VAR_VC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_VL[]
LDY #>VAR_VL[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
LDA #<VAR_TT
LDY #>VAR_TT
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PT
LDY #>VAR_PT
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BEQ LT_LT_EQ5
ROL
BCC LT_LT5
LT_LT_EQ5:
LDA #0
JMP LT_SKIP5
LT_LT5:
LDA #$1
LT_SKIP5:
COMP_SKP6:
BEQ LINE_SKIP91
; Simplified conditional branch
;
LINE_NSKIP91:
;
JMP LINE_40170
;
LINE_SKIP91:
;
;
LINE_40180:
;
LDA #<CONST_7R
LDY #>CONST_7R
JSR REALFAC
LDA #<VAR_SB
LDY #>VAR_SB
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_WF
LDY #>VAR_WF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF12+1
STA MOVBSELF12+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF12:
STY $FFFF
LDA #<VAR_VC
LDY #>VAR_VC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #0
TYA
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_VW%[]
LDY #>VAR_VW%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_AC
LDY #>VAR_AC
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_AC
LDY #>VAR_AC
; FAC to (X/Y)
JSR FACMEM
;
LINE_40190:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_VC
LDY #>VAR_VC
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_VC
LDY #>VAR_VC
; FAC to (X/Y)
JSR FACMEM
LDX #4
dceloop2738_3:
LDA CONST_23R,X
CMP VAR_VC,X
BNE LINE_SKIP92
DEX
BPL dceloop2738_3
; Optimizer rule: Direct compare(=) of floats/7
LINE_NSKIP92:
; Optimizer rule: Simplified equal comparison/6
;
LDA #0
STA VAR_VC
STA VAR_VC+1
STA VAR_VC+2
STA VAR_VC+3
STA VAR_VC+4
; Optimizer rule: Simplified setting to 0/6
;
LINE_SKIP92:
;
;
LINE_40200:
;
JMP RETURN
;
LINE_42000:
;
;
LINE_42002:
;
LDA VAR_AC
BEQ EQ_SKIP7
EQ_EQ7:
JMP LINE_SKIP93
EQ_SKIP7:
COMP_SKP8:
; Optimizer rule: Reverted comparison/6
; Simplified conditional branch
;
LINE_NSKIP93:
;
JMP RETURN
;
LINE_SKIP93:
;
;
LINE_42005:
;
<IF !X16>
SEI
LDY TIMEADDR
LDX TIMEADDR+1
LDA TIMEADDR+2
CLI
</IF>
SEC
JSR COPYTIME
JSR GETTIME
LDX #<VAR_TI
LDY #>VAR_TI
JSR FACMEM
LDX #4
dcloop412_2:
LDA VAR_TI,X
STA VAR_TT,X
DEX
BPL dcloop412_2
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_42010:
;
LDA #0
STA VAR_HH
STA VAR_HH+1
STA VAR_HH+2
STA VAR_HH+3
STA VAR_HH+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_HH
LDY #>VAR_HH
STA A_REG
STY A_REG+1
LDA #<FORLOOP0
STA JUMP_TARGET
LDA #>FORLOOP0
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP0:
LDA #<VAR_HH
LDY #>VAR_HH
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_VT%[]
LDY #>VAR_VT%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_HH
LDY #>VAR_HH
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_VL[]
LDY #>VAR_VL[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
LDA #<VAR_TT
LDY #>VAR_TT
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
; Optimizer rule: POP, REG0, VAR0/4
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BEQ LT_LT_EQ8
ROL
BCC LT_LT8
LT_LT_EQ8:
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP LT_SKIP8
LT_LT8:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
LT_SKIP8:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_HH
LDY #>VAR_HH
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_VW%[]
LDY #>VAR_VW%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BEQ EQ_EQ9
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP9
EQ_EQ9:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP9:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP9:
BEQ LINE_SKIP94
; Simplified conditional branch
;
LINE_NSKIP94:
;
JMP LINE_42040
;
LINE_SKIP94:
;
;
LINE_42020:
;
LDA #<CONST_11R
LDY #>CONST_11R
JSR REALFAC
LDA #<VAR_HH
LDY #>VAR_HH
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: Highly simplified loading for calculations (mul)/6
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_26
LDY #>CONST_26
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_7R
LDY #>CONST_7R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_HH
LDY #>VAR_HH
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_VW%[]
LDY #>VAR_VW%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF13+1
STA MOVBSELF13+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF13:
STY $FFFF
LDA #<VAR_HH
LDY #>VAR_HH
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #0
TYA
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_VW%[]
LDY #>VAR_VW%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_AC
LDY #>VAR_AC
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_AC
LDY #>VAR_AC
; FAC to (X/Y)
JSR FACMEM
;
LINE_42040:
;
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_1
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_1:
JMP RETURN
;
LINE_48000:
;
;
LINE_48010:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #1
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_CI%[]
LDY #>VAR_CI%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #15
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_CI%[]
LDY #>VAR_CI%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_6R
LDY #>CONST_6R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #12
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_CI%[]
LDY #>VAR_CI%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_23R
LDY #>CONST_23R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #11
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_CI%[]
LDY #>VAR_CI%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
;
LINE_48020:
;
;
LINE_48030:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #126
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SC%[]
LDY #>VAR_SC%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #124
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SC%[]
LDY #>VAR_SC%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
;
LINE_48040:
;
LDA #<CONST_6R
LDY #>CONST_6R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #123
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SC%[]
LDY #>VAR_SC%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_23R
LDY #>CONST_23R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #108
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SC%[]
LDY #>VAR_SC%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
;
LINE_48050:
;
;
LINE_48060:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_33R
LDY #>CONST_33R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_CG[]
LDY #>VAR_CG[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_34R
LDY #>CONST_34R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_CG[]
LDY #>VAR_CG[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<CONST_6R
LDY #>CONST_6R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_35R
LDY #>CONST_35R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_CG[]
LDY #>VAR_CG[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
;
LINE_48070:
;
JSR COMPACTMAX
LDA #17
JSR CHRINT
; Optimizer rule: CHR with integer constant/2
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_DN$
LDY #>VAR_DN$
JSR COPYSTRING
JSR COMPACTMAX
LDA #19
JSR CHRINT
; Optimizer rule: CHR with integer constant/2
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_HM$
LDY #>VAR_HM$
JSR COPYSTRING
;
LINE_48080:
;
JSR COMPACTMAX
LDA #157
JSR CHRINT
; Optimizer rule: CHR with integer constant/2
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_LF$
LDY #>VAR_LF$
JSR COPYSTRING
JSR COMPACTMAX
LDA VAR_LF$
LDY VAR_LF$+1
STA B_REG
STY B_REG+1
LDA VAR_LF$
LDY VAR_LF$+1
STA A_REG
STY A_REG+1
JSR CONCAT
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_LF$
LDY #>VAR_LF$
JSR COPYSTRING
JSR COMPACTMAX
LDA VAR_LF$
LDY VAR_LF$+1
STA B_REG
STY B_REG+1
LDA VAR_LF$
LDY VAR_LF$+1
STA A_REG
STY A_REG+1
JSR CONCAT
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_LF$
LDY #>VAR_LF$
JSR COPYSTRING
;
LINE_48090:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_23R
LDY #>CONST_23R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PC[]
LDY #>VAR_PC[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_21R
LDY #>CONST_21R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PC[]
LDY #>VAR_PC[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
;
LINE_48092:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #253
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #253
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_6R
LDY #>CONST_6R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #254
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_23R
LDY #>CONST_23R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #254
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_7R
LDY #>CONST_7R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #255
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
;
LINE_48093:
;
LDA #<CONST_21R
LDY #>CONST_21R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #255
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_10R
LDY #>CONST_10R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #254
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_11R
LDY #>CONST_11R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #254
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_3R
LDY #>CONST_3R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #253
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
;
LINE_48100:
;
LDA #<CONST_23R
LDY #>CONST_23R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_41R
LDY #>CONST_41R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_CG[]
LDY #>VAR_CG[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<CONST_7R
LDY #>CONST_7R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_33R
LDY #>CONST_33R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_CG[]
LDY #>VAR_CG[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<CONST_5R
LDY #>CONST_5R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_42
LDY #>CONST_42
STA A_REG
STY A_REG+1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_STRING
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #0
TYA
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_PO%[]
LDY #>VAR_PO%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
;
LINE_48110:
;
LDA #0
STA VAR_I
STA VAR_I+1
STA VAR_I+2
STA VAR_I+3
STA VAR_I+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_43R
LDY #>CONST_43R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP1
STA JUMP_TARGET
LDA #>FORLOOP1
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP1:
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR COMPACTMAX
LDA #29
JSR CHRINT
; Optimizer rule: CHR with integer constant/2
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
JSR PUSHINT
; ignored: CHGCTX #0
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
LDY #1
LDA #0
JSR ARRAYACCESS_STRING_INT
; Optimizer rule: Array index is integer (load)/7
JSR POPINT
LDY TMP_ZP
LDA TMP_ZP+1
STY B_REG
STA B_REG+1
JSR CONCAT
;ignored: JSR COPYSTR
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_STRING
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_2
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_2:
;
LINE_48120:
;
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #28
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_PO%[]
LDY #>VAR_PO%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDX #4
dcloop640_1:
LDA CONST_46,X
STA VAR_PI,X
DEX
BPL dcloop640_1
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_CP
STA VAR_CP+1
STA VAR_CP+2
STA VAR_CP+3
STA VAR_CP+4
; Optimizer rule: Simplified setting to 0/6
STA VAR_RP
STA VAR_RP+1
STA VAR_RP+2
STA VAR_RP+3
STA VAR_RP+4
; Optimizer rule: Simplified setting to 0/6
;
LINE_48130:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #0
TYA
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_AF%[]
LDY #>VAR_AF%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #0
TYA
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_AF%[]
LDY #>VAR_AF%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
;
LINE_48140:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_47
LDY #>CONST_47
STA A_REG
STY A_REG+1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PN$[]
LDY #>VAR_PN$[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_STRING
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_47
LDY #>CONST_47
STA A_REG
STY A_REG+1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PN$[]
LDY #>VAR_PN$[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_STRING
;
LINE_48150:
;
JMP RETURN
;
LINE_48500:
;
;
LINE_48510:
;
LDA #<CONST_24R
LDY #>CONST_24R
JSR REALFAC
LDA #<VAR_YY
LDY #>VAR_YY
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT10
LDA #0
JMP GT_SKIP10
GT_GT10:
LDA #$1
GT_SKIP10:
COMP_SKP12:
BEQ LINE_SKIP95
; Simplified conditional branch
;
LINE_NSKIP95:
;
LDX #4
dcloop640_2:
LDA CONST_23R,X
STA VAR_CC,X
DEX
BPL dcloop640_2
; Optimizer rule: Direct copy of floats into mem/6
JMP RETURN
;
LINE_SKIP95:
;
;
LINE_48520:
;
LDA #<CONST_48R
LDY #>CONST_48R
JSR REALFAC
LDA #<VAR_YY
LDY #>VAR_YY
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT11
LDA #0
JMP GT_SKIP11
GT_GT11:
LDA #$1
GT_SKIP11:
COMP_SKP13:
BEQ LINE_SKIP96
; Simplified conditional branch
;
LINE_NSKIP96:
;
LDX #4
dcloop640_3:
LDA CONST_6R,X
STA VAR_CC,X
DEX
BPL dcloop640_3
; Optimizer rule: Direct copy of floats into mem/6
JMP RETURN
;
LINE_SKIP96:
;
;
LINE_48530:
;
LDA #<CONST_49R
LDY #>CONST_49R
JSR REALFAC
LDA #<VAR_YY
LDY #>VAR_YY
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT12
LDA #0
JMP GT_SKIP12
GT_GT12:
LDA #$1
GT_SKIP12:
COMP_SKP14:
BEQ LINE_SKIP97
; Simplified conditional branch
;
LINE_NSKIP97:
;
LDX #4
dcloop640_4:
LDA CONST_0R,X
STA VAR_CC,X
DEX
BPL dcloop640_4
; Optimizer rule: Direct copy of floats into mem/6
JMP RETURN
;
LINE_SKIP97:
;
;
LINE_48540:
;
LDA #0
STA VAR_CC
STA VAR_CC+1
STA VAR_CC+2
STA VAR_CC+3
STA VAR_CC+4
; Optimizer rule: Simplified setting to 0/6
JMP RETURN
;
LINE_48600:
;
;
LINE_48610:
;
LDA #<CONST_50
LDY #>CONST_50
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #254
LDA #0
STY A_REG
STA A_REG+1
JSR PEEKBYTEAND
LDY #>X_REG
LDA #<X_REG
; Real in (A/Y) to FAC
JSR REALFAC
; FAC to integer in Y/A
JSR FACWORD
STY 56334
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #251
LDA #0
STY A_REG
STA A_REG+1
JSR PEEKBYTEANDFAST
STY 1
; Optimizer rule: Faster PEEKBYTEAND/2
;
LINE_48620:
LDX #4
dcloop640_5:
LDA CONST_52,X
STA VAR_SP,X
LDA CONST_53,X
STA VAR_I,X
DEX
BPL dcloop640_5
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_11R
LDY #>CONST_11R
JSR REALFAC
LDA #<VAR_I
LDY #>VAR_I
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP2
STA JUMP_TARGET
LDA #>FORLOOP2
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP2:
LDA #<VAR_SP
LDY #>VAR_SP
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF16+1
STA MOVBSELF16+2
MOVBSELF16:
LDY $FFFF
STY TMP_ZP
JSR POPREAL
JSR FACWORD
STY MOVBSELF17+1
STA MOVBSELF17+2
LDY TMP_ZP
MOVBSELF17:
STY $FFFF
; Optimizer rule: Fast byte copy/9
LDA #<CONST_23R
LDY #>CONST_23R
JSR REALFAC
LDA #<VAR_SP
LDY #>VAR_SP
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SP
LDY #>VAR_SP
; FAC to (X/Y)
JSR FACMEM
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_3
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_3:
;
LINE_48630:
;
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #4
LDA #0
STY A_REG
STA A_REG+1
JSR PEEKBYTEOR
LDY #>X_REG
LDA #<X_REG
; Real in (A/Y) to FAC
JSR REALFAC
; FAC to integer in Y/A
JSR FACWORD
STY 1
LDA #<CONST_50
LDY #>CONST_50
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #1
LDA #0
STY A_REG
STA A_REG+1
JSR PEEKBYTEORFAST
STY 56334
; Optimizer rule: Faster PEEKBYTEOR/2
;
LINE_48640:
;
LDY #11
STY 2040
; Optimizer rule: Simple POKE/2
LDY #0
STY 53248
; Optimizer rule: Simple POKE/2
LDY #0
STY 53249
; Optimizer rule: Simple POKE/2
LDY #1
STY 53269
; Optimizer rule: Simple POKE/2
;
LINE_48645:
;
LDY #0
STY 53276
; Optimizer rule: Simple POKE/2
LDY #1
STY 53287
; Optimizer rule: Simple POKE/2
;
LINE_48650:
;
LDY #2
STY 53285
; Optimizer rule: Simple POKE/2
LDY #10
STY 53286
; Optimizer rule: Simple POKE/2
;
LINE_48660:
;
JSR RESTORE
LDX #4
dcloop640_7:
LDA CONST_54,X
STA VAR_I,X
DEX
BPL dcloop640_7
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_55
LDY #>CONST_55
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(1)/1
LDA #<Y_REG
LDY #>Y_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP3
STA JUMP_TARGET
LDA #>FORLOOP3
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP3:
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_S
LDY #>VAR_S
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_I
LDY #>VAR_I
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_S
LDY #>VAR_S
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF28+1
STA MOVBSELF28+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF28:
STY $FFFF
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_4
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_4:
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
; Optimizer rule: Avoid INTEGER->REAL conversion/3
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC (2)/3
LDX #<VAR_I
LDY #>VAR_I
; FAC to (X/Y)
JSR FACMEM
;
LINE_48670:
;
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_PM
LDY #>VAR_PM
; FAC to (X/Y)
JSR FACMEM
LDX #4
dceloop2738_4:
LDA CONST_56,X
CMP VAR_PM,X
BNE LINE_SKIP98
DEX
BPL dceloop2738_4
; Optimizer rule: Direct compare(=) of floats/7
LINE_NSKIP98:
; Optimizer rule: Simplified equal comparison/6
;
JMP LINE_48690
;
LINE_SKIP98:
;
;
LINE_48680:
;
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PM
LDY #>VAR_PM
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PM[]
LDY #>VAR_PM[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_I
LDY #>VAR_I
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_I
LDY #>VAR_I
; FAC to (X/Y)
JSR FACMEM
JMP LINE_48670
;
LINE_48690:
;
JMP RETURN
;
LINE_49000:
;
;
LINE_49020:
;
JSR GOSUB
JSR LINE_39600
LDA #0
STA VAR_I
STA VAR_I+1
STA VAR_I+2
STA VAR_I+3
STA VAR_I+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_7R
LDY #>CONST_7R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP4
STA JUMP_TARGET
LDA #>FORLOOP4
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP4:
JSR GOSUB
JSR LINE_50000
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_5
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_5:
;
LINE_49030:
;
LDX #4
dcloop754_1:
LDA CONST_57,X
STA VAR_I,X
DEX
BPL dcloop754_1
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_58
LDY #>CONST_58
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP5
STA JUMP_TARGET
LDA #>FORLOOP5
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP5:
;
LINE_49040:
;
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF29+1
STA MOVBSELF29+2
LDA #$A0
MOVBSELF29:
STA $FFFF
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
LDA #<VAR_I
LDY #>VAR_I
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_CI%[]
LDY #>VAR_CI%[]
STA G_REG
STY G_REG+1
LDY #3
LDA #0
JSR ARRAYACCESS_INTEGER_INT
; Optimizer rule: Array index is integer (load)/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF30+1
STA MOVBSELF30+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF30:
STY $FFFF
;
LINE_49050:
;
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
JSR NEXT
LDA A_REG
BNE RBEQ_6
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_6:
;
LINE_49100:
;
JMP RETURN
;
LINE_50000:
;
;
LINE_50010:
;
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = RND(FAC)
JSR FACRND
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_X
LDY #>VAR_X
; FAC to (X/Y)
JSR FACMEM
LDX #4
dcloop754_2:
LDA CONST_61R,X
STA VAR_SC,X
LDA CONST_62R,X
STA VAR_EC,X
DEX
BPL dcloop754_2
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_50020:
;
LDA #<CONST_63R
LDY #>CONST_63R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = RND(FAC)
JSR FACRND
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL
LDA #<X_REG
LDY #>X_REG
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc (mul)/4
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_X
LDY #>VAR_X
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_3R
LDY #>CONST_3R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = RND(FAC)
JSR FACRND
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL
LDA #<X_REG
LDY #>X_REG
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc (mul)/4
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<CONST_48R
LDY #>CONST_48R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_Y
LDY #>VAR_Y
; FAC to (X/Y)
JSR FACMEM
;
LINE_50030:
;
LDA #<VAR_Y
LDY #>VAR_Y
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(1)/1
LDY #5
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDY #3
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_X
LDY #>VAR_X
JSR REALFAC
LDA #<CONST_64
LDY #>CONST_64
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFADDARG
; Optimizer rule: Fast FADD (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SE
LDY #>VAR_SE
; FAC to (X/Y)
JSR FACMEM
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_X
LDY #>VAR_X
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_XE
LDY #>VAR_XE
; FAC to (X/Y)
JSR FACMEM
;
LINE_50035:
;
LDA #<VAR_SE
LDY #>VAR_SE
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF31+1
STA MOVBSELF31+2
MOVBSELF31:
LDA $FFFF
CMP #32
BCC PEEKLT0
BEQ PEEKEQ0
LDA #$FF
JMP PEEKDONE0
PEEKLT0:
LDA #$01
JMP PEEKDONE0
PEEKEQ0:
LDA #0
PEEKDONE0:
; Optimized comparison for PEEK
;
;
BNE NEQ_NEQ14
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP14
NEQ_NEQ14:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP14:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF32+1
STA MOVBSELF32+2
MOVBSELF32:
LDA $FFFF
CMP #32
BCC PEEKLT1
BEQ PEEKEQ1
LDA #$FF
JMP PEEKDONE1
PEEKLT1:
LDA #$01
JMP PEEKDONE1
PEEKEQ1:
LDA #0
PEEKDONE1:
; Optimized comparison for PEEK
;
;
BNE NEQ_NEQ15
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP15
NEQ_NEQ15:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP15:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP20:
BEQ LINE_SKIP99
; Simplified conditional branch
;
LINE_NSKIP99:
;
JMP LINE_50020
;
LINE_SKIP99:
;
;
LINE_50037:
;
LDX #4
dcloop754_4:
LDA VAR_Y,X
STA VAR_YY,X
DEX
BPL dcloop754_4
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_48500
;
LINE_50040:
;
LDX #4
dcloop754_5:
LDA VAR_Y,X
STA VAR_YP,X
DEX
BPL dcloop754_5
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_66R
LDY #>CONST_66R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_YP
LDY #>VAR_YP
STA A_REG
STY A_REG+1
LDA #<FORLOOP6
STA JUMP_TARGET
LDA #>FORLOOP6
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP6:
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF33+1
STA MOVBSELF33+2
MOVBSELF33:
LDY $FFFF
LDA #0
; integer in Y/A to FAC
JSR INTFAC
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PA
LDY #>VAR_PA
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_SE
LDY #>VAR_SE
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF34+1
STA MOVBSELF34+2
MOVBSELF34:
LDY $FFFF
LDA #0
; integer in Y/A to FAC
JSR INTFAC
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PE
LDY #>VAR_PE
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_CC
LDY #>VAR_CC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_CI%[]
LDY #>VAR_CI%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
LDX #<VAR_CF
LDY #>VAR_CF
; FAC to (X/Y)
JSR FACMEM
;
LINE_50050:
;
LDA #<CONST_62R
LDY #>CONST_62R
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ16
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP16
NEQ_NEQ16:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP16:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_59R
LDY #>CONST_59R
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ17
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP17
NEQ_NEQ17:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP17:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP21:
BNE LINE_NSKIP100
; Optimizer rule: CMP (REG) != 0(2)/3
JMP LINE_SKIP100
;
LINE_NSKIP100:
;
LDA #<VAR_SA
LDY #>VAR_SA
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<Y_REG
LDY #>Y_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_SC
LDY #>VAR_SC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF35+1
STA MOVBSELF35+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF35:
STY $FFFF
JMP LINE_50055
;
LINE_SKIP100:
;
;
LINE_50052:
;
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF36+1
STA MOVBSELF36+2
LDA #$A0
MOVBSELF36:
STA $FFFF
;
LINE_50055:
;
LDA #<CONST_61R
LDY #>CONST_61R
JSR REALFAC
LDA #<VAR_PE
LDY #>VAR_PE
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ18
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP18
NEQ_NEQ18:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP18:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_59R
LDY #>CONST_59R
JSR REALFAC
LDA #<VAR_PE
LDY #>VAR_PE
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ19
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP19
NEQ_NEQ19:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP19:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP22:
BNE LINE_NSKIP101
; Optimizer rule: CMP (REG) != 0(2)/3
JMP LINE_SKIP101
;
LINE_NSKIP101:
;
LDA #<VAR_SE
LDY #>VAR_SE
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<Y_REG
LDY #>Y_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_EC
LDY #>VAR_EC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF37+1
STA MOVBSELF37+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF37:
STY $FFFF
JMP LINE_50060
;
LINE_SKIP101:
;
;
LINE_50057:
;
LDA #<VAR_SE
LDY #>VAR_SE
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF38+1
STA MOVBSELF38+2
LDA #$A0
MOVBSELF38:
STA $FFFF
;
LINE_50060:
;
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_CF
LDY #>VAR_CF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF39+1
STA MOVBSELF39+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF39:
STY $FFFF
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
LDA #<VAR_SE
LDY #>VAR_SE
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_CF
LDY #>VAR_CF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF40+1
STA MOVBSELF40+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF40:
STY $FFFF
;
LINE_50070:
;
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
LDA #<VAR_SE
LDY #>VAR_SE
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
EQ_EQ20:
EQ_SKIP20:
COMP_SKP23:
BNE LINE_SKIP102
LINE_NSKIP102:
; Optimizer rule: Simplified equal comparison/6
;
JMP LINE_50100
;
LINE_SKIP102:
;
;
LINE_50080:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_WP
LDY #>VAR_WP
; FAC to (X/Y)
JSR FACMEM
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SE
LDY #>VAR_SE
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_WP
LDY #>VAR_WP
STA A_REG
STY A_REG+1
LDA #<FORLOOP7
STA JUMP_TARGET
LDA #>FORLOOP7
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP7:
LDA #<VAR_WP
LDY #>VAR_WP
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF41+1
STA MOVBSELF41+2
LDA #$A0
MOVBSELF41:
STA $FFFF
;
LINE_50090:
;
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
LDA #<VAR_WP
LDY #>VAR_WP
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_CF
LDY #>VAR_CF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF42+1
STA MOVBSELF42+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF42:
STY $FFFF
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_7
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_7:
;
LINE_50100:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_X
LDY #>VAR_X
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_X
LDY #>VAR_X
; FAC to (X/Y)
JSR FACMEM
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
LDA #<VAR_X
LDY #>VAR_X
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ GTEQ_GTEQ21
BCS GTEQ_GTEQ21
LDA #0
JMP GTEQ_SKIP21
GTEQ_GTEQ21:
LDA #$1
GTEQ_SKIP21:
COMP_SKP25:
BEQ LINE_SKIP103
; Simplified conditional branch
;
LINE_NSKIP103:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
JMP LINE_50120
;
LINE_SKIP103:
;
;
LINE_50110:
;
LDX #4
dcloop868_1:
LDA CONST_59R,X
STA VAR_SC,X
DEX
BPL dcloop868_1
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_50120:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_XE
LDY #>VAR_XE
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_XE
LDY #>VAR_XE
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_67R
LDY #>CONST_67R
JSR REALFAC
LDA #<VAR_XE
LDY #>VAR_XE
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BCC LTEQ_LTEQ22
BEQ LTEQ_LTEQ22
LDA #0
JMP LTEQ_SKIP22
LTEQ_LTEQ22:
LDA #$1
LTEQ_SKIP22:
COMP_SKP26:
BEQ LINE_SKIP104
; Simplified conditional branch
;
LINE_NSKIP104:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SE
LDY #>VAR_SE
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SE
LDY #>VAR_SE
; FAC to (X/Y)
JSR FACMEM
JMP LINE_50140
;
LINE_SKIP104:
;
;
LINE_50130:
;
LDX #4
dcloop868_2:
LDA CONST_59R,X
STA VAR_EC,X
DEX
BPL dcloop868_2
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_50140:
;
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SE
LDY #>VAR_SE
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SE
LDY #>VAR_SE
; FAC to (X/Y)
JSR FACMEM
;
LINE_50150:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_YP
LDY #>VAR_YP
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_YY
LDY #>VAR_YY
; FAC to (X/Y)
JSR FACMEM
JSR GOSUB
JSR LINE_48500
;
LINE_50160:
;
LDA #<VAR_YP
LDY #>VAR_YP
STA A_REG
STY A_REG+1
JSR NEXT
LDA A_REG
BNE RBEQ_8
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_8:
JMP RETURN
;
LINE_51000:
;
;
LINE_51030:
;
LDA #0
STA VAR_I
STA VAR_I+1
STA VAR_I+2
STA VAR_I+3
STA VAR_I+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP8
STA JUMP_TARGET
LDA #>FORLOOP8
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP8:
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_69R
LDY #>CONST_69R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_70R
LDY #>CONST_70R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PD[]
LDY #>VAR_PD[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_18R
LDY #>CONST_18R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PP[]
LDY #>VAR_PP[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
;
LINE_51040:
;
LDA #<VAR_I
LDY #>VAR_I
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_43R
LDY #>CONST_43R
JSR REALFAC
LDA #<VAR_I
LDY #>VAR_I
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: Highly simplified loading for calculations (mul)/6
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<CONST_18R
LDY #>CONST_18R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = RND(FAC)
JSR FACRND
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL
LDA #<X_REG
LDY #>X_REG
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc (mul)/4
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFADDARG
; Optimizer rule: Fast FADD (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PX[]
LDY #>VAR_PX[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
;
LINE_51050:
;
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #100
LDA #0
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_HP%[]
LDY #>VAR_HP%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
;
LINE_51100:
;
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
JSR NEXT
LDA A_REG
BNE RBEQ_9
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_9:
;
LINE_51160:
;
LDA #0
STA VAR_PN
STA VAR_PN+1
STA VAR_PN+2
STA VAR_PN+3
STA VAR_PN+4
; Optimizer rule: Simplified setting to 0/6
JSR GOSUB
JSR LINE_52000
LDX #4
dcloop982_1:
LDA CONST_0R,X
STA VAR_PN,X
DEX
BPL dcloop982_1
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_52000
;
LINE_51190:
;
JMP RETURN
;
LINE_52000:
;
;
LINE_52010:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PX[]
LDY #>VAR_PX[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_71
LDY #>CONST_71
JSR REALFAC
LDA #<CONST_64
LDY #>CONST_64
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFADDARG
; Optimizer rule: Fast FADD (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
LDX #4
dcloop982_2:
LDA CONST_66R,X
STA VAR_Y,X
DEX
BPL dcloop982_2
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_52020:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF43+1
STA MOVBSELF43+2
MOVBSELF43:
LDA $FFFF
CMP #32
BCC PEEKLT2
BEQ PEEKEQ2
LDA #$FF
JMP PEEKDONE2
PEEKLT2:
LDA #$01
JMP PEEKDONE2
PEEKEQ2:
LDA #0
PEEKDONE2:
; Optimized comparison for PEEK
;
;
BEQ EQ_EQ23
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP23
EQ_EQ23:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP23:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF44+1
STA MOVBSELF44+2
MOVBSELF44:
LDA $FFFF
CMP #32
BCC PEEKLT3
BEQ PEEKEQ3
LDA #$FF
JMP PEEKDONE3
PEEKLT3:
LDA #$01
JMP PEEKDONE3
PEEKEQ3:
LDA #0
PEEKDONE3:
; Optimized comparison for PEEK
;
;
BEQ EQ_EQ24
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP24
EQ_EQ24:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP24:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP29:
BEQ LINE_SKIP105
; Simplified conditional branch
;
LINE_NSKIP105:
;
JMP LINE_52050
;
LINE_SKIP105:
;
;
LINE_52030:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_Y
LDY #>VAR_Y
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_Y
LDY #>VAR_Y
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
JMP LINE_52020
;
LINE_52050:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_Y
LDY #>VAR_Y
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PY[]
LDY #>VAR_PY[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_Y
LDY #>VAR_Y
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_Y
LDY #>VAR_Y
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
;
LINE_52060:
;
LDX #4
dcloop982_3:
LDA VAR_Y,X
STA VAR_YP,X
DEX
BPL dcloop982_3
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_66R
LDY #>CONST_66R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_YP
LDY #>VAR_YP
STA A_REG
STY A_REG+1
LDA #<FORLOOP9
STA JUMP_TARGET
LDA #>FORLOOP9
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP9:
;
LINE_52070:
;
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF45+1
STA MOVBSELF45+2
LDA #$A0
MOVBSELF45:
STA $FFFF
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF46+1
STA MOVBSELF46+2
LDA #$A0
MOVBSELF46:
STA $FFFF
;
LINE_52080:
;
LDX #4
dcloop1096_1:
LDA VAR_YP,X
STA VAR_YY,X
DEX
BPL dcloop1096_1
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_48500
;
LINE_52100:
;
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_CC
LDY #>VAR_CC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_CI%[]
LDY #>VAR_CI%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF47+1
STA MOVBSELF47+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF47:
STY $FFFF
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_CC
LDY #>VAR_CC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_CI%[]
LDY #>VAR_CI%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF48+1
STA MOVBSELF48+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF48:
STY $FFFF
;
LINE_52110:
;
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
;
LINE_52120:
;
LDA #<VAR_YP
LDY #>VAR_YP
STA A_REG
STY A_REG+1
JSR NEXT
LDA A_REG
BNE RBEQ_10
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_10:
;
LINE_53000:
;
;
LINE_53010:
;
JSR GOSUB
JSR LINE_60100
;
LINE_53020:
;
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF49+1
STA MOVBSELF49+2
LDA #$55
MOVBSELF49:
STA $FFFF
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF50+1
STA MOVBSELF50+2
LDA #$49
MOVBSELF50:
STA $FFFF
;
LINE_53030:
;
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PC[]
LDY #>VAR_PC[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF51+1
STA MOVBSELF51+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF51:
STY $FFFF
LDA #<CONST_74
LDY #>CONST_74
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PC[]
LDY #>VAR_PC[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF52+1
STA MOVBSELF52+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF52:
STY $FFFF
;
LINE_53040:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<CONST_75
LDY #>CONST_75
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; FAC = ARG * FAC
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_AI
LDY #>VAR_AI
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFAC
LDA #<VAR_AI
LDY #>VAR_AI
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT25
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP25
GT_GT25:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP25:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC (2)/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR XREGARG
; Optimizer rule: X_REG 2 ARG/1
; FAC = FAC * -1
JSR NEG
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_AD
LDY #>VAR_AD
; FAC to (X/Y)
JSR FACMEM
;
LINE_53050:
;
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF53+1
STA MOVBSELF53+2
LDA #$20
MOVBSELF53:
STA $FFFF
LDA #<CONST_67R
LDY #>CONST_67R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF54+1
STA MOVBSELF54+2
LDA #$20
MOVBSELF54:
STA $FFFF
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_AD
LDY #>VAR_AD
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_AI
LDY #>VAR_AI
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_CG[]
LDY #>VAR_CG[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF55+1
STA MOVBSELF55+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF55:
STY $FFFF
;
LINE_53060:
;
LDA #<VAR_AD
LDY #>VAR_AD
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_76
LDY #>CONST_76
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PC[]
LDY #>VAR_PC[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF56+1
STA MOVBSELF56+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF56:
STY $FFFF
;
LINE_53070:
;
JMP RETURN
;
LINE_53500:
;
;
LINE_53510:
;
JSR GOSUB
JSR LINE_60100
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
;
LINE_53520:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PC[]
LDY #>VAR_PC[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
LDX #<VAR_PC
LDY #>VAR_PC
; FAC to (X/Y)
JSR FACMEM
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF57+1
STA MOVBSELF57+2
LDA #$1
MOVBSELF57:
STA $FFFF
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF58+1
STA MOVBSELF58+2
LDA #$1
MOVBSELF58:
STA $FFFF
;
LINE_53530:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_PC
LDY #>VAR_PC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF59+1
STA MOVBSELF59+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF59:
STY $FFFF
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PC
LDY #>VAR_PC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF60+1
STA MOVBSELF60+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF60:
STY $FFFF
;
LINE_53540:
;
JMP RETURN
;
LINE_53700:
;
;
LINE_53710:
LDX #4
dcloop1210_1:
LDA CONST_18R,X
STA VAR_XP,X
LDA CONST_7R,X
STA VAR_YP,X
DEX
BPL dcloop1210_1
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_62950
;
LINE_53720:
;
LDY #15
STY 646
; Optimizer rule: Simple POKE/2
LDA #<CONST_77
LDY #>CONST_77
JSR STROUTBRKWL
; Optimizer rule: Memory saving STROUTBRK/1
; Optimizer rule: STROUT + LINEBRK/1
;
LINE_53730:
LDX #4
dcloop1210_3:
LDA CONST_13R,X
STA VAR_XP,X
LDA CONST_21R,X
STA VAR_YP,X
DEX
BPL dcloop1210_3
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_62950
LDA #<CONST_78
LDY #>CONST_78
JSR STROUTBRKWL
; Optimizer rule: Memory saving STROUTBRK/1
; Optimizer rule: STROUT + LINEBRK/1
;
LINE_53740:
;
LDY #1
STY 646
; Optimizer rule: Simple POKE/2
JMP RETURN
;
LINE_53750:
;
;
LINE_53760:
LDX #4
dcloop1210_5:
LDA CONST_18R,X
STA VAR_XP,X
LDA CONST_7R,X
STA VAR_YP,X
DEX
BPL dcloop1210_5
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_62950
;
LINE_53770:
;
LDY #1
STY 646
; Optimizer rule: Simple POKE/2
LDA #<CONST_79
LDY #>CONST_79
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA #<CONST_79
LDY #>CONST_79
JSR STROUTBRKWL
; Optimizer rule: Memory saving STROUTBRK/1
; Optimizer rule: STROUT + LINEBRK/1
;
LINE_53780:
LDX #4
dcloop1210_7:
LDA CONST_13R,X
STA VAR_XP,X
LDA CONST_21R,X
STA VAR_YP,X
DEX
BPL dcloop1210_7
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_62950
LDA #<CONST_79
LDY #>CONST_79
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA #<CONST_79
LDY #>CONST_79
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA #<CONST_80
LDY #>CONST_80
JSR STROUTBRKWL
; Optimizer rule: Memory saving STROUTBRK/1
; Optimizer rule: STROUT + LINEBRK/1
;
LINE_53790:
;
JMP RETURN
;
LINE_54000:
;
;
LINE_54002:
;
JSR GOSUB
JSR LINE_39800
JSR GOSUB
JSR LINE_54200
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_AF%[]
LDY #>VAR_AF%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
EQ_EQ26:
EQ_SKIP26:
COMP_SKP31:
BNE LINE_SKIP106
LINE_NSKIP106:
; Optimizer rule: Simplified equal comparison/6
;
JSR GOSUB
JSR LINE_57000
JMP RETURN
;
LINE_SKIP106:
;
;
LINE_54004:
;
JSR GOSUB
JSR LINE_53700
JSR GOSUB
JSR LINE_62280
;
LINE_54005:
;
LDA #<CONST_42
LDY #>CONST_42
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_AS$
LDY #>VAR_AS$
JSR COPYSTRING
; Optimizer rule: Simplified loading of Strings/5
JMP LINE_54040
;
LINE_54010:
;
JSR GOSUB
JSR LINE_42000
JSR GETSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_A$
LDY #>VAR_A$
JSR COPYSTRING
LDA #<CONST_42
LDY #>CONST_42
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA X_REG
COMP_SKP32:
BEQ LINE_SKIP107
; Simplified conditional branch
;
LINE_NSKIP107:
;
JSR GOSUB
JSR LINE_53500
JMP LINE_54010
;
LINE_SKIP107:
;
;
LINE_54012:
;
JSR COMPACTMAX
LDA #3
JSR CHRINT
; Optimizer rule: CHR with integer constant/2
LDY A_REG
LDA A_REG+1
STY B_REG
STA B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA X_REG
COMP_SKP33:
BEQ LINE_SKIP108
; Simplified conditional branch
;
LINE_NSKIP108:
;
JSR RUN
;
LINE_SKIP108:
;
;
LINE_54015:
;
LDA #<CONST_81
LDY #>CONST_81
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SLTEQ
LDY #>X_REG
LDA #<X_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA #<CONST_82
LDY #>CONST_82
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SGTEQ
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP34:
BEQ LINE_SKIP109
; Simplified conditional branch
;
LINE_NSKIP109:
;
JSR GOSUB
JSR LINE_54500
JMP LINE_54040
;
LINE_SKIP109:
;
;
LINE_54020:
;
LDA #<CONST_83
LDY #>CONST_83
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA X_REG
COMP_SKP35:
BNE LINE_NSKIP110
; Optimizer rule: CMP (REG) != 0(2)/3
JMP LINE_SKIP110
;
LINE_NSKIP110:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PA[]
LDY #>VAR_PA[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<CONST_42
LDY #>CONST_42
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_AS$
LDY #>VAR_AS$
JSR COPYSTRING
; Optimizer rule: Simplified loading of Strings/5
JMP LINE_54040
;
LINE_SKIP110:
;
;
LINE_54030:
;
LDA #<CONST_84
LDY #>CONST_84
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA X_REG
COMP_SKP36:
BNE LINE_NSKIP111
; Optimizer rule: CMP (REG) != 0(2)/3
JMP LINE_SKIP111
;
LINE_NSKIP111:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PA[]
LDY #>VAR_PA[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<CONST_42
LDY #>CONST_42
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_AS$
LDY #>VAR_AS$
JSR COPYSTRING
; Optimizer rule: Simplified loading of Strings/5
JMP LINE_54040
;
LINE_SKIP111:
;
;
LINE_54032:
;
JSR COMPACTMAX
LDA #13
JSR CHRINT
; Optimizer rule: CHR with integer constant/2
LDY A_REG
LDA A_REG+1
STY B_REG
STA B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDY #>X_REG
LDA #<X_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA #<CONST_80
LDY #>CONST_80
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP37:
BEQ LINE_SKIP112
; Simplified conditional branch
;
LINE_NSKIP112:
;
JSR GOSUB
JSR LINE_53750
JMP RETURN
;
LINE_SKIP112:
;
;
LINE_54035:
;
JSR COMPACTMAX
LDA #20
JSR CHRINT
; Optimizer rule: CHR with integer constant/2
LDY A_REG
LDA A_REG+1
STY B_REG
STA B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA X_REG
COMP_SKP38:
BEQ LINE_SKIP113
; Simplified conditional branch
;
LINE_NSKIP113:
;
JSR GOSUB
JSR LINE_54700
;
LINE_SKIP113:
;
;
LINE_54040:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BEQ LT_LT_EQ27
ROL
BCC LT_LT27
LT_LT_EQ27:
LDA #0
JMP LT_SKIP27
LT_LT27:
LDA #$1
LT_SKIP27:
COMP_SKP39:
BEQ LINE_SKIP114
; Simplified conditional branch
;
LINE_NSKIP114:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
;
LINE_SKIP114:
;
;
LINE_54050:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<CONST_8R
LDY #>CONST_8R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
ROL
BCS GT_GT28
LDA #0
JMP GT_SKIP28
GT_GT28:
LDA #$1
GT_SKIP28:
COMP_SKP40:
BEQ LINE_SKIP115
; Simplified conditional branch
;
LINE_NSKIP115:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_8R
LDY #>CONST_8R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
;
LINE_SKIP115:
;
;
LINE_54060:
;
JSR GOSUB
JSR LINE_54300
;
LINE_54080:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA VAR_AS$
LDY VAR_AS$+1
STA B_REG
STY B_REG+1
; ignored: CHGCTX #0
JSR LEN
JSR POPREAL
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
; Optimizer rule: POP, REG0, VAR0/4
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
ROL
BCS GT_GT29
LDA #0
JMP GT_SKIP29
GT_GT29:
LDA #$1
GT_SKIP29:
COMP_SKP41:
BEQ LINE_SKIP116
; Simplified conditional branch
;
LINE_NSKIP116:
;
JSR COMPACTMAX
LDA #157
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
JSR COMPACTMAX
LDA #164
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
LDA #<CONST_86
LDY #>CONST_86
JSR STROUTBRKWL
; Optimizer rule: Memory saving STROUTBRK/1
; Optimizer rule: STROUT + LINEBRK/1
JMP LINE_54090
;
LINE_SKIP116:
;
;
LINE_54085:
;
JSR COMPACTMAX
LDA #157
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
LDA #<CONST_87
LDY #>CONST_87
JSR STROUTBRKWL
; Optimizer rule: Memory saving STROUTBRK/1
; Optimizer rule: STROUT + LINEBRK/1
;
LINE_54090:
;
JSR GOSUB
JSR LINE_53000
;
LINE_54100:
;
JMP LINE_54010
;
LINE_54150:
;
;
LINE_54155:
;
JSR COMPACTMAX
LDA #<VAR_DD
LDY #>VAR_DD
JSR REALFAC
LDA #<CONST_88
LDY #>CONST_88
JSR MEMARG
JSR NEG
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
; ignored: CHGCTX #1
JSR STR
LDA #<CONST_86
LDY #>CONST_86
STA B_REG
STY B_REG+1
JSR CONCAT
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_P$
LDY #>VAR_P$
JSR COPYSTRING
LDX #4
dcloop1324_1:
LDA CONST_18R,X
STA VAR_KC,X
LDA CONST_0R,X
STA VAR_MA,X
DEX
BPL dcloop1324_1
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_54156:
;
JSR GOSUB
JSR LINE_54206
JMP RETURN
;
LINE_54200:
;
;
LINE_54205:
;
JSR COMPACTMAX
LDA #<CONST_86
LDY #>CONST_86
STA TMP_ZP
STY TMP_ZP+1
JSR PUSHINT
; Optimizer rule: Fast address push/3
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_HP%[]
LDY #>VAR_HP%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
; ignored: CHGCTX #1
JSR STR
JSR POPINT
LDY TMP_ZP
LDA TMP_ZP+1
STY B_REG
STA B_REG+1
JSR CONCAT
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_P$
LDY #>VAR_P$
JSR COPYSTRING
LDX #4
dcloop1324_3:
LDA CONST_11R,X
STA VAR_KC,X
LDA CONST_6R,X
STA VAR_MA,X
DEX
BPL dcloop1324_3
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_54206:
;
JSR GOSUB
JSR LINE_60100
LDA #<CONST_89R
LDY #>CONST_89R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
LDA #0
STA VAR_I
STA VAR_I+1
STA VAR_I+2
STA VAR_I+3
STA VAR_I+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP10
STA JUMP_TARGET
LDA #>FORLOOP10
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP10:
;
LINE_54208:
;
LDA #<VAR_I
LDY #>VAR_I
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF64+1
STA MOVBSELF64+2
MOVBSELF64:
LDY $FFFF
LDA #0
; integer in Y/A to FAC
JSR INTFAC
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
LDA #<VAR_BB%[]
LDY #>VAR_BB%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INTEGER_NX
; Optimizer rule: Value already in FAC(1)/6
LDA #<VAR_I
LDY #>VAR_I
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF65+1
STA MOVBSELF65+2
MOVBSELF65:
LDY $FFFF
LDA #0
; integer in Y/A to FAC
JSR INTFAC
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
LDA #<VAR_BC%[]
LDY #>VAR_BC%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INTEGER_NX
; Optimizer rule: Value already in FAC(1)/6
;
LINE_54210:
;
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_KC
LDY #>VAR_KC
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF66+1
STA MOVBSELF66+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF66:
STY $FFFF
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
JSR COMPACTMAX
LDA #<VAR_MA
LDY #>VAR_MA
JSR REALFAC
LDA #<VAR_I
LDY #>VAR_I
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA VAR_P$
LDY VAR_P$+1
STA B_REG
STY B_REG+1
JSR POPREAL
LDX #<D_REG
LDY #>D_REG
; FAC to (X/Y)
JSR FACMEM
JSR POPREAL
LDX #<C_REG
LDY #>C_REG
; FAC to (X/Y)
JSR FACMEM
JSR MID
LDY A_REG
LDA A_REG+1
STY B_REG
STA B_REG+1
; ignored: CHGCTX #0
JSR ASC
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF67+1
STA MOVBSELF67+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF67:
STY $FFFF
;
LINE_54220:
;
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_11
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_11:
JMP RETURN
;
LINE_54250:
;
;
LINE_54260:
;
JSR GOSUB
JSR LINE_60100
LDA #<CONST_89R
LDY #>CONST_89R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
LDA #0
STA VAR_I
STA VAR_I+1
STA VAR_I+2
STA VAR_I+3
STA VAR_I+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP11
STA JUMP_TARGET
LDA #>FORLOOP11
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP11:
;
LINE_54270:
;
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_BC%[]
LDY #>VAR_BC%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF68+1
STA MOVBSELF68+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF68:
STY $FFFF
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_BB%[]
LDY #>VAR_BB%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF69+1
STA MOVBSELF69+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF69:
STY $FFFF
;
LINE_54280:
;
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_12
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_12:
JMP RETURN
;
LINE_54300:
;
;
LINE_54310:
;
JSR COMPACTMAX
LDA #19
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
; ignored: CHGCTX #1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYACCESS_STRING
JSR STROUT
LDA #<CONST_90
LDY #>CONST_90
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA VAR_LF$
LDY VAR_LF$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR REALOUT
JSR CRSRRIGHT
;
LINE_54320:
;
JMP RETURN
;
LINE_54500:
;
;
LINE_54510:
;
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA VAR_AS$
LDY VAR_AS$+1
STA B_REG
STY B_REG+1
; ignored: CHGCTX #0
JSR LEN
JSR POPREAL
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
; Optimizer rule: POP, REG0, VAR0/4
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
ROL
BCS GT_GT30
LDA #0
JMP GT_SKIP30
GT_GT30:
LDA #$1
GT_SKIP30:
COMP_SKP44:
BEQ LINE_SKIP117
; Simplified conditional branch
;
LINE_NSKIP117:
;
JMP RETURN
;
LINE_SKIP117:
;
;
LINE_54515:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA VAR_AS$
LDY VAR_AS$+1
STA B_REG
STY B_REG+1
; ignored: CHGCTX #0
JSR LEN
JSR POPREAL
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
; Optimizer rule: POP, REG0, VAR0/4
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
ROL
BCS GT_GT31
LDA #0
JMP GT_SKIP31
GT_GT31:
LDA #$1
GT_SKIP31:
COMP_SKP45:
BNE LINE_NSKIP118
; Optimizer rule: Simplified CMP redux/7
JMP LINE_SKIP118
;
LINE_NSKIP118:
;
JSR COMPACTMAX
LDA #<CONST_82
LDY #>CONST_82
STA TMP_ZP
STY TMP_ZP+1
JSR PUSHINT
; Optimizer rule: Fast address push/3
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_CREG
; Optimizer rule: Direct copy from MEM to C/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
; ignored: CHGCTX #1
LDA VAR_AS$
LDY VAR_AS$+1
STA B_REG
STY B_REG+1
JSR LEFT
JSR POPINT
LDY TMP_ZP
LDA TMP_ZP+1
STY B_REG
STA B_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA X_REG
COMP_SKP46:
BEQ LINE_SKIP119
; Simplified conditional branch
;
LINE_NSKIP119:
;
LDA #<CONST_42
LDY #>CONST_42
STA B_REG
STY B_REG+1
LDA B_REG
LDY B_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_AS$
LDY #>VAR_AS$
JSR COPYSTRING
;
LINE_SKIP119:
;
;
LINE_SKIP118:
;
;
LINE_54520:
;
JSR COMPACTMAX
LDA VAR_A$
LDY VAR_A$+1
STA B_REG
STY B_REG+1
LDA VAR_AS$
LDY VAR_AS$+1
STA A_REG
STY A_REG+1
JSR CONCAT
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_AS$
LDY #>VAR_AS$
JSR COPYSTRING
;
LINE_54530:
;
JSR GOSUB
JSR LINE_54800
JMP RETURN
;
LINE_54700:
;
;
LINE_54705:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA VAR_AS$
LDY VAR_AS$+1
STA B_REG
STY B_REG+1
; ignored: CHGCTX #0
JSR LEN
JSR POPREAL
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
; Optimizer rule: POP, REG0, VAR0/4
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
EQ_EQ32:
EQ_SKIP32:
COMP_SKP47:
BNE LINE_SKIP120
LINE_NSKIP120:
; Optimizer rule: Simplified equal comparison/6
;
JMP RETURN
;
LINE_SKIP120:
;
;
LINE_54710:
;
JSR COMPACTMAX
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA VAR_AS$
LDY VAR_AS$+1
STA B_REG
STY B_REG+1
; ignored: CHGCTX #0
JSR LEN
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFSUBARG
; Optimizer rule: Fast FSUB (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<C_REG
LDY #>C_REG
; FAC to (X/Y)
JSR FACMEM
; ignored: CHGCTX #1
LDA VAR_AS$
LDY VAR_AS$+1
STA B_REG
STY B_REG+1
JSR LEFT
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_AS$
LDY #>VAR_AS$
JSR COPYSTRING
;
LINE_54720:
;
LDA #<CONST_42
LDY #>CONST_42
STA B_REG
STY B_REG+1
LDA VAR_AS$
LDY VAR_AS$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA X_REG
COMP_SKP48:
BEQ LINE_SKIP121
; Simplified conditional branch
;
LINE_NSKIP121:
;
LDA #<CONST_82
LDY #>CONST_82
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_AS$
LDY #>VAR_AS$
JSR COPYSTRING
; Optimizer rule: Simplified loading of Strings/5
;
LINE_SKIP121:
;
;
LINE_54730:
;
JSR GOSUB
JSR LINE_54800
JMP RETURN
;
LINE_54800:
;
;
LINE_54810:
;
LDA VAR_AS$
LDY VAR_AS$+1
STA B_REG
STY B_REG+1
; ignored: CHGCTX #0
JSR VAL
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
LDX #<VAR_AA
LDY #>VAR_AA
; FAC to (X/Y)
JSR FACMEM
;
LINE_54820:
;
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
LDA #<VAR_AA
LDY #>VAR_AA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ33
ROL
BCC LT_LT33
LT_LT_EQ33:
LDA #0
JMP LT_SKIP33
LT_LT33:
LDA #$1
LT_SKIP33:
COMP_SKP49:
BEQ LINE_SKIP122
; Simplified conditional branch
;
LINE_NSKIP122:
;
LDA #0
STA VAR_AA
STA VAR_AA+1
STA VAR_AA+2
STA VAR_AA+3
STA VAR_AA+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_82
LDY #>CONST_82
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_AS$
LDY #>VAR_AS$
JSR COPYSTRING
; Optimizer rule: Simplified loading of Strings/5
;
LINE_SKIP122:
;
;
LINE_54830:
;
LDA #<CONST_8R
LDY #>CONST_8R
JSR REALFAC
LDA #<VAR_AA
LDY #>VAR_AA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT34
LDA #0
JMP GT_SKIP34
GT_GT34:
LDA #$1
GT_SKIP34:
COMP_SKP50:
BEQ LINE_SKIP123
; Simplified conditional branch
;
LINE_NSKIP123:
;
LDX #4
dcloop1438_1:
LDA CONST_8R,X
STA VAR_AA,X
DEX
BPL dcloop1438_1
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_91
LDY #>CONST_91
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_AS$
LDY #>VAR_AS$
JSR COPYSTRING
; Optimizer rule: Simplified loading of Strings/5
;
LINE_SKIP123:
;
;
LINE_54840:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_AA
LDY #>VAR_AA
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
;
LINE_54850:
;
JMP RETURN
;
LINE_55000:
;
;
LINE_55002:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_AF%[]
LDY #>VAR_AF%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
EQ_EQ35:
EQ_SKIP35:
COMP_SKP51:
BNE LINE_SKIP124
LINE_NSKIP124:
; Optimizer rule: Simplified equal comparison/6
;
JSR GOSUB
JSR LINE_53000
JMP RETURN
;
LINE_SKIP124:
;
;
LINE_55005:
;
JSR GOSUB
JSR LINE_62280
JSR GOSUB
JSR LINE_54300
JSR COMPACTMAX
LDA #157
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
LDA #<CONST_86
LDY #>CONST_86
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
;
LINE_55010:
;
LDA VAR_HM$
LDY VAR_HM$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA VAR_DN$
LDY VAR_DN$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
;
LINE_55020:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
; ignored: CHGCTX #1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYACCESS_STRING
JSR STROUT
JSR COMPACTMAX
LDA #176
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
JSR GOSUB
JSR LINE_55800
JSR COMPACTMAX
LDA #174
JSR SINGLECHROUTBRK
; Optimizer rule: Single character output and break/2
; Optimizer rule: STROUT + LINEBRK/1
;
LINE_55030:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
; ignored: CHGCTX #1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYACCESS_STRING
JSR STROUT
JSR COMPACTMAX
LDA #98
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
LDA #<CONST_95
LDY #>CONST_95
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
JSR COMPACTMAX
LDA #98
JSR SINGLECHROUTBRK
; Optimizer rule: Single character output and break/2
; Optimizer rule: STROUT + LINEBRK/1
;
LINE_55040:
;
LDA #<VAR_PN
LDY #>VAR_PN
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
; ignored: CHGCTX #1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYACCESS_STRING
JSR STROUT
JSR COMPACTMAX
LDA #237
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
JSR GOSUB
JSR LINE_55800
JSR COMPACTMAX
LDA #253
JSR SINGLECHROUTBRK
; Optimizer rule: Single character output and break/2
; Optimizer rule: STROUT + LINEBRK/1
;
LINE_55045:
;
JSR GOSUB
JSR LINE_55200
LDX #4
dcloop1438_2:
LDA CONST_11R,X
STA VAR_S,X
DEX
BPL dcloop1438_2
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_55050:
;
JSR GETSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_A$
LDY #>VAR_A$
JSR COPYSTRING
JSR COMPACTMAX
LDA #13
JSR CHRINT
; Optimizer rule: CHR with integer constant/2
LDY A_REG
LDA A_REG+1
STY B_REG
STA B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA #<CONST_80
LDY #>CONST_80
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP52:
BEQ LINE_SKIP125
; Simplified conditional branch
;
LINE_NSKIP125:
;
JMP RETURN
;
LINE_SKIP125:
;
;
LINE_55052:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PP[]
LDY #>VAR_PP[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PP[]
LDY #>VAR_PP[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PP[]
LDY #>VAR_PP[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<CONST_97R
LDY #>CONST_97R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
EQ_EQ36:
EQ_SKIP36:
COMP_SKP53:
BNE LINE_SKIP126
LINE_NSKIP126:
; Optimizer rule: Simplified equal comparison/6
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_18R
LDY #>CONST_18R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PP[]
LDY #>VAR_PP[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
JSR GOSUB
JSR LINE_55200
;
LINE_SKIP126:
;
;
LINE_55055:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PP[]
LDY #>VAR_PP[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<CONST_98
LDY #>CONST_98
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FACDIV
; Optimizer rule: Combine load and div/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PP
LDY #>VAR_PP
; FAC to (X/Y)
JSR FACMEM
;
LINE_55060:
;
LDA #<VAR_S
LDY #>VAR_S
JSR REALFAC
LDA #<VAR_PP
LDY #>VAR_PP
JSR FACDIV
; Optimizer rule: Combine load and div/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PH
LDY #>VAR_PH
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_S
LDY #>VAR_S
JSR REALFAC
LDA #<VAR_PH
LDY #>VAR_PH
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: Highly simplified loading for calculations (mul)/6
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<VAR_PP
LDY #>VAR_PP
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PL
LDY #>VAR_PL
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_S
LDY #>VAR_S
JSR REALFAC
LDA #<VAR_PH
LDY #>VAR_PH
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT37
LDA #0
JMP GT_SKIP37
GT_GT37:
LDA #$1
GT_SKIP37:
COMP_SKP54:
BEQ LINE_SKIP127
; Simplified conditional branch
;
LINE_NSKIP127:
;
JMP LINE_55090
;
LINE_SKIP127:
;
;
LINE_55070:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PO%[]
LDY #>VAR_PO%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
LDA #<CONST_99
LDY #>CONST_99
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PH
LDY #>VAR_PH
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_PL
LDY #>VAR_PL
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PM[]
LDY #>VAR_PM[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF70+1
STA MOVBSELF70+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF70:
STY $FFFF
;
LINE_55090:
;
JMP LINE_55050
;
LINE_55200:
;
;
LINE_55210:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PO%[]
LDY #>VAR_PO%[]
JSR ARRAYACCESS_INTEGER_SI
STY VAR_PO%
STA VAR_PO%+1
; Optimizer rule: Store and load/3
; integer in Y/A to FAC
JSR INTFAC
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<CONST_99
LDY #>CONST_99
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_I
LDY #>VAR_I
; FAC to (X/Y)
JSR FACMEM
LDY VAR_PO%
LDA VAR_PO%+1
; integer in Y/A to FAC
JSR INTFAC
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<CONST_100
LDY #>CONST_100
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP12
STA JUMP_TARGET
LDA #>FORLOOP12
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP12:
;
LINE_55220:
;
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF71+1
STA MOVBSELF71+2
LDA #$20
MOVBSELF71:
STA $FFFF
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_13
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_13:
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_18R
LDY #>CONST_18R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PP[]
LDY #>VAR_PP[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
JMP RETURN
;
LINE_55800:
;
;
LINE_55810:
;
LDA #0
STA VAR_I
STA VAR_I+1
STA VAR_I+2
STA VAR_I+3
STA VAR_I+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_11R
LDY #>CONST_11R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP13
STA JUMP_TARGET
LDA #>FORLOOP13
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP13:
JSR COMPACTMAX
LDA #99
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
JSR NEXT
LDA A_REG
BNE RBEQ_14
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_14:
;
LINE_55820:
;
JMP RETURN
;
LINE_56000:
;
;
LINE_56010:
;
JSR GOSUB
JSR LINE_54250
JSR GOSUB
JSR LINE_60000
LDX #4
dcloop1552_1:
LDA CONST_56,X
STA VAR_OC,X
DEX
BPL dcloop1552_1
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_OA
STA VAR_OA+1
STA VAR_OA+2
STA VAR_OA+3
STA VAR_OA+4
; Optimizer rule: Simplified setting to 0/6
;
LINE_56020:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PA[]
LDY #>VAR_PA[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<CONST_8R
LDY #>CONST_8R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FACDIV
; Optimizer rule: Combine load and div/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_46
LDY #>CONST_46
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; FAC = ARG * FAC
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_AF
LDY #>VAR_AF
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PP[]
LDY #>VAR_PP[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
LDX #<VAR_PF
LDY #>VAR_PF
; FAC to (X/Y)
JSR FACMEM
;
LINE_56030:
;
LDA #<CONST_46
LDY #>CONST_46
JSR REALFAC
LDA #<VAR_AF
LDY #>VAR_AF
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ GTEQ_GTEQ38
BCS GTEQ_GTEQ38
LDA #0
JMP GTEQ_SKIP38
GTEQ_GTEQ38:
LDA #$1
GTEQ_SKIP38:
COMP_SKP57:
BEQ LINE_SKIP128
; Simplified conditional branch
;
LINE_NSKIP128:
;
LDX #4
dcloop1552_2:
LDA CONST_102,X
STA VAR_AF,X
DEX
BPL dcloop1552_2
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_SKIP128:
;
;
LINE_56032:
;
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
LDA #<VAR_AF
LDY #>VAR_AF
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BCC LTEQ_LTEQ39
BEQ LTEQ_LTEQ39
LDA #0
JMP LTEQ_SKIP39
LTEQ_LTEQ39:
LDA #$1
LTEQ_SKIP39:
COMP_SKP58:
BEQ LINE_SKIP129
; Simplified conditional branch
;
LINE_NSKIP129:
;
LDX #4
dcloop1552_3:
LDA CONST_103,X
STA VAR_AF,X
DEX
BPL dcloop1552_3
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_SKIP129:
;
;
LINE_56034:
;
LDA #<VAR_AF
LDY #>VAR_AF
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC = COS(FAC)
JSR FACCOS
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_CF
LDY #>VAR_CF
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_AF
LDY #>VAR_AF
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC = SIN(FAC)
JSR FACSIN
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SF
LDY #>VAR_SF
; FAC to (X/Y)
JSR FACMEM
;
LINE_56036:
;
LDY #4
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_CF
LDY #>VAR_CF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PX[]
LDY #>VAR_PX[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDY #3
STY A_REG
JSR XREGFAC
JSR SHL
; Optimizer rule: Shorter SHL/4
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_3R
LDY #>CONST_3R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFSUBARG
; Optimizer rule: Fast FSUB (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_XF
LDY #>VAR_XF
; FAC to (X/Y)
JSR FACMEM
LDY #3
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_SF
LDY #>VAR_SF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PY[]
LDY #>VAR_PY[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDY #3
STY A_REG
JSR XREGFAC
JSR SHL
; Optimizer rule: Shorter SHL/4
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_3R
LDY #>CONST_3R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFSUBARG
; Optimizer rule: Fast FSUB (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_YF
LDY #>VAR_YF
; FAC to (X/Y)
JSR FACMEM
;
LINE_56040:
;
LDA #<CONST_15R
LDY #>CONST_15R
JSR REALFAC
LDA #<VAR_PF
LDY #>VAR_PF
JSR FACDIV
; Optimizer rule: Combine load and div/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_CF
LDY #>VAR_CF
JSR REALFAC
LDA #<CONST_88
LDY #>CONST_88
JSR MEMARG
JSR NEG
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL
LDA #<X_REG
LDY #>X_REG
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc (mul)/4
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_DX
LDY #>VAR_DX
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_15R
LDY #>CONST_15R
JSR REALFAC
LDA #<VAR_PF
LDY #>VAR_PF
JSR FACDIV
; Optimizer rule: Combine load and div/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_SF
LDY #>VAR_SF
JSR REALFAC
LDA #<CONST_88
LDY #>CONST_88
JSR MEMARG
JSR NEG
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL
LDA #<X_REG
LDY #>X_REG
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc (mul)/4
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_DY
LDY #>VAR_DY
; FAC to (X/Y)
JSR FACMEM
;
LINE_56045:
;
JSR GOSUB
JSR LINE_39650
;
LINE_56050:
;
JSR GOSUB
JSR LINE_58000
;
LINE_56060:
;
LDA #<CONST_65R
LDY #>CONST_65R
JSR REALFAC
LDA #<VAR_OC
LDY #>VAR_OC
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ40
LDA #0
JMP NEQ_SKIP40
NEQ_NEQ40:
LDA #$1
NEQ_SKIP40:
COMP_SKP59:
BNE LINE_NSKIP130
; Optimizer rule: Simplified CMP redux/7
JMP LINE_SKIP130
;
LINE_NSKIP130:
;
LDX #4
dcneloop2739_1:
LDA CONST_56,X
CMP VAR_OC,X
BNE LINE_NSKIP131
DEX
BPL dcneloop2739_1
JMP LINE_SKIP131
; Optimizer rule: Direct compare(<>) of floats/8
LINE_NSKIP131:
; Optimizer rule: Simplified not equal comparison/6
;
LDA #<VAR_PO
LDY #>VAR_PO
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_SP
LDY #>VAR_SP
; FAC to (X/Y)
JSR FACMEM
JSR GOSUB
JSR LINE_59000
JSR GOSUB
JSR LINE_61000
JMP RETURN
;
LINE_SKIP131:
;
;
LINE_SKIP130:
;
;
LINE_56070:
;
LDA #<CONST_104
LDY #>CONST_104
JSR REALFAC
LDA #<VAR_DY
LDY #>VAR_DY
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_DY
LDY #>VAR_DY
; FAC to (X/Y)
JSR FACMEM
JMP LINE_56050
;
LINE_57000:
;
;
LINE_57005:
;
JSR GOSUB
JSR LINE_42000
;
LINE_57010:
;
JMP RETURN
;
LINE_58000:
;
;
LINE_58030:
;
LDA #<VAR_DX
LDY #>VAR_DX
JSR REALFAC
LDA #<VAR_XF
LDY #>VAR_XF
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_XF
LDY #>VAR_XF
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_DY
LDY #>VAR_DY
JSR REALFAC
LDA #<VAR_YF
LDY #>VAR_YF
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_YF
LDY #>VAR_YF
; FAC to (X/Y)
JSR FACMEM
JSR GOSUB
JSR LINE_58300
;
LINE_58035:
;
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
LDA #<VAR_XF
LDY #>VAR_XF
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ42
ROL
BCC LT_LT42
LT_LT_EQ42:
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP LT_SKIP42
LT_LT42:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
LT_SKIP42:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_105
LDY #>CONST_105
JSR REALFAC
LDA #<VAR_XF
LDY #>VAR_XF
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT43
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP43
GT_GT43:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP43:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP61:
BEQ LINE_SKIP132
; Simplified conditional branch
;
LINE_NSKIP132:
;
JMP LINE_58200
;
LINE_SKIP132:
;
;
LINE_58040:
;
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
LDA #<VAR_YF
LDY #>VAR_YF
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ44
ROL
BCC LT_LT44
LT_LT_EQ44:
LDA #0
JMP LT_SKIP44
LT_LT44:
LDA #$1
LT_SKIP44:
COMP_SKP62:
BEQ LINE_SKIP133
; Simplified conditional branch
;
LINE_NSKIP133:
;
LDX #4
dcloop1666_1:
LDA CONST_56,X
STA VAR_OC,X
DEX
BPL dcloop1666_1
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_59500
JMP LINE_58140
;
LINE_SKIP133:
;
;
LINE_58050:
;
JSR GOSUB
JSR LINE_58350
;
LINE_58100:
;
LDA #<VAR_XF
LDY #>VAR_XF
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACINT
STY VAR_XX%
STA VAR_XX%+1
JSR GOSUB
JSR LINE_58250
;
LINE_58110:
;
LDA #<VAR_OV
LDY #>VAR_OV
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC to integer in Y/A
JSR FACWORD
STY 53264
;
LINE_58120:
;
LDA #<VAR_PO
LDY #>VAR_PO
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF73+1
STA MOVBSELF73+2
MOVBSELF73:
LDY $FFFF
LDA #0
; integer in Y/A to FAC
JSR INTFAC
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_OC
LDY #>VAR_OC
; FAC to (X/Y)
JSR FACMEM
;
LINE_58140:
;
JMP RETURN
;
LINE_58200:
;
JSR GOSUB
JSR LINE_58400
;
LINE_58210:
;
LDX #4
dcloop1666_2:
LDA CONST_59R,X
STA VAR_OC,X
DEX
BPL dcloop1666_2
; Optimizer rule: Direct copy of floats into mem/6
JMP RETURN
;
LINE_58250:
;
;
LINE_58260:
;
LDA #<CONST_15R
LDY #>CONST_15R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY VAR_XX%
LDA VAR_XX%+1
; integer in Y/A to FAC
JSR INTFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACINT
STY VAR_XX%
STA VAR_XX%+1
LDA #$ff
LDY #$00
STA TMP_ZP
STY TMP_ZP+1
LDY VAR_XX%
LDA VAR_XX%+1
JSR ICMP
; Optimized code for Integer(2)
;
;
;
;
;
;
;
;
;
;
ROL
BCS GT_GT45
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP45
GT_GT45:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP45:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC (2)/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR XREGARG
; Optimizer rule: X_REG 2 ARG/1
; FAC = FAC * -1
JSR NEG
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_OV
LDY #>VAR_OV
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_106R
LDY #>CONST_106R
JSR REALFAC
LDA #<VAR_YF
LDY #>VAR_YF
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 53249
LDA #<CONST_40R
LDY #>CONST_40R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY VAR_XX%
LDA VAR_XX%+1
; integer in Y/A to FAC
JSR INTFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
JSR XREGARG
; Optimizer rule: X_REG 2 ARG/1
; FAC = ARG & FAC
JSR FASTAND
; Optimizer rule: Faster logic AND/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 53248
;
LINE_58270:
;
JMP RETURN
;
LINE_58300:
;
;
LINE_58310:
;
LDY #3
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_YF
LDY #>VAR_YF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC>>A
JSR SHR
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
LDY #5
LDA #0
STY A_REG
STA A_REG+1
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDY #3
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDY #3
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_XF
LDY #>VAR_XF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC>>A
JSR SHR
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_64
LDY #>CONST_64
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFADDARG
; Optimizer rule: Fast FADD (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PO
LDY #>VAR_PO
; FAC to (X/Y)
JSR FACMEM
JMP RETURN
;
LINE_58350:
;
;
LINE_58360:
;
LDA VAR_OA
BNE NEQ_NEQ46
LDA #0
; Optimizer rule: CMP (MEM) != 0/3
JMP NEQ_SKIP46
NEQ_NEQ46:
LDA #$1
NEQ_SKIP46:
COMP_SKP63:
BNE LINE_NSKIP134
; Optimizer rule: Simplified CMP redux/7
JMP LINE_SKIP134
;
LINE_NSKIP134:
;
LDA #<VAR_OA
LDY #>VAR_OA
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF76+1
STA MOVBSELF76+2
LDA #$20
MOVBSELF76:
STA $FFFF
LDA #0
STA VAR_OA
STA VAR_OA+1
STA VAR_OA+2
STA VAR_OA+3
STA VAR_OA+4
; Optimizer rule: Simplified setting to 0/6
;
LINE_SKIP134:
;
;
LINE_58370:
;
JMP RETURN
;
LINE_58400:
;
;
LINE_58410:
;
LDY #0
STY 53248
; Optimizer rule: Simple POKE/2
LDY #0
STY 53264
; Optimizer rule: Simple POKE/2
JMP RETURN
;
LINE_58430:
;
;
LINE_58435:
;
JSR GOSUB
JSR LINE_58400
LDY #1
STY 53287
; Optimizer rule: Simple POKE/2
LDY #0
STY 53276
; Optimizer rule: Simple POKE/2
;
LINE_58540:
;
LDY #11
STY 2040
; Optimizer rule: Simple POKE/2
JMP RETURN
;
LINE_58560:
;
;
LINE_58570:
;
LDA #<CONST_3R
LDY #>CONST_3R
JSR REALFAC
LDA #<VAR_XF
LDY #>VAR_XF
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACINT
STY VAR_XX%
STA VAR_XX%+1
JSR GOSUB
JSR LINE_58250
LDY #7
STY 53287
; Optimizer rule: Simple POKE/2
LDY #1
STY 53276
; Optimizer rule: Simple POKE/2
LDY #253
STY 2040
; Optimizer rule: Simple POKE/2
;
LINE_58580:
;
JMP RETURN
;
LINE_59000:
;
;
LINE_59020:
;
JSR GOSUB
JSR LINE_58350
;
LINE_59025:
;
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
LDA #<VAR_XF
LDY #>VAR_XF
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ47
ROL
BCC LT_LT47
LT_LT_EQ47:
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP LT_SKIP47
LT_LT47:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
LT_SKIP47:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_105
LDY #>CONST_105
JSR REALFAC
LDA #<VAR_XF
LDY #>VAR_XF
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT48
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP48
GT_GT48:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP48:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP64:
BEQ LINE_SKIP135
; Simplified conditional branch
;
LINE_NSKIP135:
;
JSR GOSUB
JSR LINE_58400
JSR GOSUB
JSR LINE_59800
JMP RETURN
;
LINE_SKIP135:
;
;
LINE_59030:
;
JSR GOSUB
JSR LINE_58560
LDA #<CONST_107
LDY #>CONST_107
JSR REALFAC
LDA #<VAR_PO
LDY #>VAR_PO
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ49
ROL
BCC LT_LT49
LT_LT_EQ49:
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP LT_SKIP49
LT_LT49:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
LT_SKIP49:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_108
LDY #>CONST_108
JSR REALFAC
LDA #<VAR_PO
LDY #>VAR_PO
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT50
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP50
GT_GT50:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP50:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP65:
BEQ LINE_SKIP136
; Simplified conditional branch
;
LINE_NSKIP136:
;
LDA #<VAR_PO
LDY #>VAR_PO
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF85+1
STA MOVBSELF85+2
LDA #$20
MOVBSELF85:
STA $FFFF
JMP LINE_59040
;
LINE_SKIP136:
;
;
LINE_59035:
;
JSR GOSUB
JSR LINE_58430
JMP RETURN
;
LINE_59040:
;
LDY #3
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_YF
LDY #>VAR_YF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC>>A
JSR SHR
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
LDY #5
LDA #0
STY A_REG
STA A_REG+1
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDY #3
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDY #3
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_XF
LDY #>VAR_XF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC>>A
JSR SHR
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_64
LDY #>CONST_64
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFADDARG
; Optimizer rule: Fast FADD (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PA
LDY #>VAR_PA
; FAC to (X/Y)
JSR FACMEM
;
LINE_59045:
;
JSR GOSUB
JSR LINE_39400
LDY #0
TYA
; Optimizer rule: INT to FAC, FAC to INT/2
STY VAR_CS%
STA VAR_CS%+1
;
LINE_59050:
;
LDX #4
dcloop1780_1:
LDA VAR_PA,X
STA VAR_PO,X
DEX
BPL dcloop1780_1
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_109R
LDY #>CONST_109R
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PO
LDY #>VAR_PO
STA A_REG
STY A_REG+1
LDA #<FORLOOP14
STA JUMP_TARGET
LDA #>FORLOOP14
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP14:
LDY #3
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_XF
LDY #>VAR_XF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC>>A
JSR SHR
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_XI
LDY #>VAR_XI
; FAC to (X/Y)
JSR FACMEM
;
LINE_59060:
;
LDX #4
dcloop1780_2:
LDA VAR_PO,X
STA VAR_PJ,X
DEX
BPL dcloop1780_2
; Optimizer rule: Direct copy of floats into mem/6
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFAC
LDA #<VAR_PO
LDY #>VAR_PO
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PJ
LDY #>VAR_PJ
STA A_REG
STY A_REG+1
LDA #<FORLOOP15
STA JUMP_TARGET
LDA #>FORLOOP15
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP15:
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
STA G_REG
STY G_REG+1
LDY VAR_CS%
LDA VAR_CS%+1
JSR ARRAYACCESS_INTEGER_INT
; Optimizer rule: Array index is integer (load)/7
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
STY 2040
LDY VAR_CS%
LDA VAR_CS%+1
JSR SUPERFIINX
; Optimizer rule: Even faster INTEGER INC/1
STY VAR_CS%
STA VAR_CS%+1
;
LINE_59070:
;
LDA #<CONST_58
LDY #>CONST_58
JSR REALFAC
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT51
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP51
GT_GT51:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP51:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_64
LDY #>CONST_64
JSR REALFAC
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ52
ROL
BCC LT_LT52
LT_LT_EQ52:
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP LT_SKIP52
LT_LT52:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
LT_SKIP52:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP66:
BEQ LINE_SKIP137
; Simplified conditional branch
;
LINE_NSKIP137:
;
JMP LINE_59110
;
LINE_SKIP137:
;
;
LINE_59075:
;
LDX #4
dcloop1894_1:
LDA CONST_65R,X
STA VAR_PV,X
DEX
BPL dcloop1894_1
; Optimizer rule: Direct copy of floats into mem/6
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_PO
LDY #>VAR_PO
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BEQ EQ_EQ53
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP53
EQ_EQ53:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP53:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<VAR_PO
LDY #>VAR_PO
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BEQ EQ_EQ54
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP54
EQ_EQ54:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP54:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP67:
BEQ LINE_SKIP138
; Simplified conditional branch
;
LINE_NSKIP138:
;
JMP LINE_59100
;
LINE_SKIP138:
;
;
LINE_59080:
;
LDA #<CONST_64
LDY #>CONST_64
JSR REALFAC
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FACDIV
; Optimizer rule: Combine load and div/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PL
LDY #>VAR_PL
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_PO
LDY #>VAR_PO
JSR REALFAC
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ55
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP55
NEQ_NEQ55:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP55:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PL
LDY #>VAR_PL
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC = INT(FAC)
JSR BASINT
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<VAR_PL
LDY #>VAR_PL
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BEQ EQ_EQ56
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP56
EQ_EQ56:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP56:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP68:
BEQ LINE_SKIP139
; Simplified conditional branch
;
LINE_NSKIP139:
;
JMP LINE_59085
;
LINE_SKIP139:
;
;
LINE_59082:
;
LDA #<VAR_PA
LDY #>VAR_PA
JSR REALFAC
LDA #<VAR_PO
LDY #>VAR_PO
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ57
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP57
NEQ_NEQ57:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP57:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
LDY #6
LDA #0
STY A_REG
STA A_REG+1
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDY #4
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFSUBARG
; Optimizer rule: Fast FSUB (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF87+1
STA MOVBSELF87+2
MOVBSELF87:
LDA $FFFF
CMP #32
BCC PEEKLT4
BEQ PEEKEQ4
LDA #$FF
JMP PEEKDONE4
PEEKLT4:
LDA #$01
JMP PEEKDONE4
PEEKEQ4:
LDA #0
PEEKDONE4:
; Optimized comparison for PEEK
;
;
BNE NEQ_NEQ58
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP58
NEQ_NEQ58:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP58:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF88+1
STA MOVBSELF88+2
MOVBSELF88:
LDA $FFFF
CMP #32
BCC PEEKLT5
BEQ PEEKEQ5
LDA #$FF
JMP PEEKDONE5
PEEKLT5:
LDA #$01
JMP PEEKDONE5
PEEKEQ5:
LDA #0
PEEKDONE5:
; Optimized comparison for PEEK
;
;
BNE NEQ_NEQ59
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP59
NEQ_NEQ59:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP59:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP69:
BEQ LINE_SKIP140
; Simplified conditional branch
;
LINE_NSKIP140:
;
LDX #4
dcloop1894_2:
LDA CONST_110R,X
STA VAR_PV,X
DEX
BPL dcloop1894_2
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_SKIP140:
;
;
LINE_59085:
;
LDA #<CONST_108
LDY #>CONST_108
JSR REALFAC
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FACDIV
; Optimizer rule: Combine load and div/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PL
LDY #>VAR_PL
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_PO
LDY #>VAR_PO
JSR REALFAC
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ EQ_EQ60
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP60
EQ_EQ60:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP60:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PL
LDY #>VAR_PL
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC = INT(FAC)
JSR BASINT
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<VAR_PL
LDY #>VAR_PL
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BEQ EQ_EQ61
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP61
EQ_EQ61:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP61:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP70:
BEQ LINE_SKIP141
; Simplified conditional branch
;
LINE_NSKIP141:
;
JMP LINE_59095
;
LINE_SKIP141:
;
;
LINE_59090:
;
LDA #<VAR_PA
LDY #>VAR_PA
JSR REALFAC
LDA #<VAR_PO
LDY #>VAR_PO
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ62
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP62
NEQ_NEQ62:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP62:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
LDY #6
LDA #0
STY A_REG
STA A_REG+1
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDY #4
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFSUBARG
; Optimizer rule: Fast FSUB (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF89+1
STA MOVBSELF89+2
MOVBSELF89:
LDA $FFFF
CMP #32
BCC PEEKLT6
BEQ PEEKEQ6
LDA #$FF
JMP PEEKDONE6
PEEKLT6:
LDA #$01
JMP PEEKDONE6
PEEKEQ6:
LDA #0
PEEKDONE6:
; Optimized comparison for PEEK
;
;
BNE NEQ_NEQ63
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP63
NEQ_NEQ63:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP63:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF90+1
STA MOVBSELF90+2
MOVBSELF90:
LDA $FFFF
CMP #32
BCC PEEKLT7
BEQ PEEKEQ7
LDA #$FF
JMP PEEKDONE7
PEEKLT7:
LDA #$01
JMP PEEKDONE7
PEEKEQ7:
LDA #0
PEEKDONE7:
; Optimized comparison for PEEK
;
;
BNE NEQ_NEQ64
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP64
NEQ_NEQ64:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP64:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP71:
BEQ LINE_SKIP142
; Simplified conditional branch
;
LINE_NSKIP142:
;
LDX #4
dcloop2008_1:
LDA CONST_111R,X
STA VAR_PV,X
DEX
BPL dcloop2008_1
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_SKIP142:
;
;
LINE_59095:
;
LDA #<CONST_110R
LDY #>CONST_110R
JSR REALFAC
LDA #<VAR_PV
LDY #>VAR_PV
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ EQ_EQ65
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP65
EQ_EQ65:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP65:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PA
LDY #>VAR_PA
JSR REALFAC
LDA #<VAR_PO
LDY #>VAR_PO
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ66
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP66
NEQ_NEQ66:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP66:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP72:
BEQ LINE_SKIP143
; Simplified conditional branch
;
LINE_NSKIP143:
;
LDX #4
dcloop2008_2:
LDA CONST_112,X
STA VAR_PV,X
DEX
BPL dcloop2008_2
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_SKIP143:
;
;
;+++++ SKIP TO $4000
JMP RELOCMEM0
*=$4000
RELOCMEM0:
LINE_59096:
;
LDA #<CONST_111R
LDY #>CONST_111R
JSR REALFAC
LDA #<VAR_PV
LDY #>VAR_PV
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ EQ_EQ67
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP67
EQ_EQ67:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP67:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PA
LDY #>VAR_PA
JSR REALFAC
LDA #<VAR_PO
LDY #>VAR_PO
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BNE NEQ_NEQ68
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP68
NEQ_NEQ68:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP68:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP73:
BEQ LINE_SKIP144
; Simplified conditional branch
;
LINE_NSKIP144:
;
LDX #4
dcloop2008_3:
LDA CONST_113,X
STA VAR_PV,X
DEX
BPL dcloop2008_3
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_SKIP144:
;
;
LINE_59100:
;
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_XI
LDY #>VAR_XI
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ69
ROL
BCC LT_LT69
LT_LT_EQ69:
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP LT_SKIP69
LT_LT69:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
LT_SKIP69:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_56
LDY #>CONST_56
JSR REALFAC
LDA #<VAR_XI
LDY #>VAR_XI
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT70
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP70
GT_GT70:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP70:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP74:
BNE LINE_NSKIP145
; Optimizer rule: CMP (REG) != 0(2)/3
JMP LINE_SKIP145
;
LINE_NSKIP145:
;
LDA #<VAR_PJ
LDY #>VAR_PJ
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<Y_REG
LDY #>Y_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PV
LDY #>VAR_PV
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF91+1
STA MOVBSELF91+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF91:
STY $FFFF
;
LINE_SKIP145:
;
;
LINE_59110:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_XI
LDY #>VAR_XI
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_XI
LDY #>VAR_XI
; FAC to (X/Y)
JSR FACMEM
JSR GOSUB
JSR LINE_42000
LDA #<VAR_PJ
LDY #>VAR_PJ
STA A_REG
STY A_REG+1
JSR NEXT
LDA A_REG
BNE RBEQ_15
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_15:
LDA #<VAR_PO
LDY #>VAR_PO
STA A_REG
STY A_REG+1
JSR NEXT
LDA A_REG
BNE RBEQ_16
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_16:
;
LINE_59120:
;
JSR GOSUB
JSR LINE_58430
JMP RETURN
;
LINE_59200:
;
;
LINE_59210:
;
LDX #4
dcloop2008_4:
LDA VAR_PN,X
STA VAR_PA,X
DEX
BPL dcloop2008_4
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_PJ
STA VAR_PJ+1
STA VAR_PJ+2
STA VAR_PJ+3
STA VAR_PJ+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PJ
LDY #>VAR_PJ
STA A_REG
STY A_REG+1
LDA #<FORLOOP16
STA JUMP_TARGET
LDA #>FORLOOP16
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP16:
;
LINE_59220:
;
LDX #4
dcloop2008_5:
LDA VAR_PJ,X
STA VAR_PN,X
DEX
BPL dcloop2008_5
; Optimizer rule: Direct copy of floats into mem/6
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PX[]
LDY #>VAR_PX[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PY[]
LDY #>VAR_PY[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
LDY #5
LDA #0
STY A_REG
STA A_REG+1
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDY #3
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_64
LDY #>CONST_64
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFADDARG
; Optimizer rule: Fast FADD (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
;
LINE_59230:
;
LDA #<CONST_107
LDY #>CONST_107
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ71
ROL
BCC LT_LT71
LT_LT_EQ71:
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP LT_SKIP71
LT_LT71:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
LT_SKIP71:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF92+1
STA MOVBSELF92+2
MOVBSELF92:
LDA $FFFF
CMP #32
BCC PEEKLT8
BEQ PEEKEQ8
LDA #$FF
JMP PEEKDONE8
PEEKLT8:
LDA #$01
JMP PEEKDONE8
PEEKEQ8:
LDA #0
PEEKDONE8:
; Optimized comparison for PEEK
;
;
BEQ EQ_EQ72
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP72
EQ_EQ72:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP72:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF93+1
STA MOVBSELF93+2
MOVBSELF93:
LDA $FFFF
CMP #32
BCC PEEKLT9
BEQ PEEKEQ9
LDA #$FF
JMP PEEKDONE9
PEEKLT9:
LDA #$01
JMP PEEKDONE9
PEEKEQ9:
LDA #0
PEEKDONE9:
; Optimized comparison for PEEK
;
;
BEQ EQ_EQ73
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP EQ_SKIP73
EQ_EQ73:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
EQ_SKIP73:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTAND
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic AND/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP77:
BEQ LINE_SKIP146
; Simplified conditional branch
;
LINE_NSKIP146:
;
JSR GOSUB
JSR LINE_59900
;
LINE_SKIP146:
;
;
LINE_59240:
;
JSR GOSUB
JSR LINE_53000
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_17
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_17:
LDX #4
dcloop2008_6:
LDA VAR_PA,X
STA VAR_PN,X
DEX
BPL dcloop2008_6
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_59250:
;
JMP RETURN
;
LINE_59500:
;
;
LINE_59510:
;
LDY #3
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_XF
LDY #>VAR_XF
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC>>A
JSR SHR
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_64
LDY #>CONST_64
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PA
LDY #>VAR_PA
; FAC to (X/Y)
JSR FACMEM
;
LINE_59520:
;
LDX #4
dcloop2122_1:
LDA VAR_PA,X
STA VAR_OA,X
DEX
BPL dcloop2122_1
; Optimizer rule: Direct copy of floats into mem/6
LDA #<VAR_PA
LDY #>VAR_PA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF94+1
STA MOVBSELF94+2
LDA #$1E
MOVBSELF94:
STA $FFFF
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_PA
LDY #>VAR_PA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PA
LDY #>VAR_PA
; FAC to (X/Y)
JSR FACMEM
;
LINE_59530:
;
LDA #<CONST_114
LDY #>CONST_114
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ74
ROL
BCC LT_LT74
LT_LT_EQ74:
LDA #0
JMP LT_SKIP74
LT_LT74:
LDA #$1
LT_SKIP74:
COMP_SKP79:
BEQ LINE_SKIP147
; Simplified conditional branch
;
LINE_NSKIP147:
;
LDA #<VAR_PA
LDY #>VAR_PA
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF95+1
STA MOVBSELF95+2
LDA #$20
MOVBSELF95:
STA $FFFF
;
LINE_SKIP147:
;
;
LINE_59540:
;
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PA
LDY #>VAR_PA
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_108
LDY #>CONST_108
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT75
LDA #0
JMP GT_SKIP75
GT_GT75:
LDA #$1
GT_SKIP75:
COMP_SKP80:
BEQ LINE_SKIP148
; Simplified conditional branch
;
LINE_NSKIP148:
;
LDA #<VAR_PA
LDY #>VAR_PA
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF96+1
STA MOVBSELF96+2
LDA #$20
MOVBSELF96:
STA $FFFF
;
LINE_SKIP148:
;
;
LINE_59550:
;
JSR GOSUB
JSR LINE_58400
JMP RETURN
;
LINE_59800:
;
;
LINE_59805:
;
JSR GOSUB
JSR LINE_58400
JSR GOSUB
JSR LINE_42000
JSR GOSUB
JSR LINE_39850
;
LINE_59810:
;
LDY #1
LDA #0
; Optimizer rule: INT to FAC, FAC to INT/2
STY VAR_OB%
STA VAR_OB%+1
JMP RETURN
;
LINE_59900:
;
;
LINE_59910:
;
LDA #<CONST_89R
LDY #>CONST_89R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
JSR FACMEM
; Optimizer rule: Omit FAC load/4
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF97+1
STA MOVBSELF97+2
LDA #$20
MOVBSELF97:
STA $FFFF
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF98+1
STA MOVBSELF98+2
LDA #$20
MOVBSELF98:
STA $FFFF
;
LINE_59920:
;
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF99+1
STA MOVBSELF99+2
LDA #$20
MOVBSELF99:
STA $FFFF
LDA #<CONST_115R
LDY #>CONST_115R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF100+1
STA MOVBSELF100+2
LDA #$20
MOVBSELF100:
STA $FFFF
;
LINE_59923:
;
LDA #<CONST_60
LDY #>CONST_60
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF101+1
STA MOVBSELF101+2
LDA #$1
MOVBSELF101:
STA $FFFF
LDA #<CONST_74
LDY #>CONST_74
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF102+1
STA MOVBSELF102+2
LDA #$1
MOVBSELF102:
STA $FFFF
;
LINE_59924:
;
LDA #<CONST_116
LDY #>CONST_116
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF103+1
STA MOVBSELF103+2
LDA #$1
MOVBSELF103:
STA $FFFF
LDA #<CONST_117
LDY #>CONST_117
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF104+1
STA MOVBSELF104+2
LDA #$1
MOVBSELF104:
STA $FFFF
;
LINE_59930:
;
JSR GOSUB
JSR LINE_60100
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
;
LINE_59940:
;
LDA #<CONST_58
LDY #>CONST_58
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT76
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP76
GT_GT76:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP76:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF105+1
STA MOVBSELF105+2
MOVBSELF105:
LDA $FFFF
CMP #32
BCC PEEKLT10
BEQ PEEKEQ10
LDA #$FF
JMP PEEKDONE10
PEEKLT10:
LDA #$01
JMP PEEKDONE10
PEEKEQ10:
LDA #0
PEEKDONE10:
; Optimized comparison for PEEK
;
;
BNE NEQ_NEQ77
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP77
NEQ_NEQ77:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP77:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF106+1
STA MOVBSELF106+2
MOVBSELF106:
LDA $FFFF
CMP #32
BCC PEEKLT11
BEQ PEEKEQ11
LDA #$FF
JMP PEEKDONE11
PEEKLT11:
LDA #$01
JMP PEEKDONE11
PEEKEQ11:
LDA #0
PEEKDONE11:
; Optimized comparison for PEEK
;
;
BNE NEQ_NEQ78
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP NEQ_SKIP78
NEQ_NEQ78:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
NEQ_SKIP78:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP81:
BEQ LINE_SKIP149
; Simplified conditional branch
;
LINE_NSKIP149:
;
JMP LINE_59980
;
LINE_SKIP149:
;
;
LINE_59950:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PY[]
LDY #>VAR_PY[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PY[]
LDY #>VAR_PY[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
JMP LINE_59910
;
LINE_59980:
;
JMP RETURN
;
LINE_60000:
;
;
LINE_60020:
;
LDA VAR_HM$
LDY VAR_HM$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
; ignored: CHGCTX #1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYACCESS_STRING
JSR STROUT
LDA #<CONST_79
LDY #>CONST_79
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
;
LINE_60030:
;
LDA VAR_HM$
LDY VAR_HM$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA VAR_DN$
LDY VAR_DN$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
; ignored: CHGCTX #1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYACCESS_STRING
JSR STROUT
LDA #<CONST_79
LDY #>CONST_79
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
;
LINE_60040:
;
LDA VAR_HM$
LDY VAR_HM$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA VAR_DN$
LDY VAR_DN$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA VAR_DN$
LDY VAR_DN$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
; ignored: CHGCTX #1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYACCESS_STRING
JSR STROUT
LDA #<CONST_79
LDY #>CONST_79
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
;
LINE_60050:
;
LDA VAR_HM$
LDY VAR_HM$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA VAR_DN$
LDY VAR_DN$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA VAR_DN$
LDY VAR_DN$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA VAR_DN$
LDY VAR_DN$+1
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
; ignored: CHGCTX #1
LDA #<VAR_PO$[]
LDY #>VAR_PO$[]
STA G_REG
STY G_REG+1
JSR ARRAYACCESS_STRING
JSR STROUT
LDA #<CONST_79
LDY #>CONST_79
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
;
LINE_60060:
;
JMP RETURN
;
LINE_60100:
;
;
LINE_60110:
;
LDA #<VAR_PN
LDY #>VAR_PN
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PX[]
LDY #>VAR_PX[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PN
LDY #>VAR_PN
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
LDA #<VAR_PY[]
LDY #>VAR_PY[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDY #5
LDA #0
STY A_REG
STA A_REG+1
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDY #3
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_64
LDY #>CONST_64
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFADDARG
; Optimizer rule: Fast FADD (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SA
LDY #>VAR_SA
; FAC to (X/Y)
JSR FACMEM
JMP RETURN
;
LINE_61000:
;
;
LINE_61005:
;
LDA #$01
LDY #$00
STA TMP_ZP
STY TMP_ZP+1
LDY VAR_OB%
LDA VAR_OB%+1
JSR ICMP
; Optimized code for Integer(2)
;
;
;
;
;
;
;
;
;
;
EQ_EQ79:
EQ_SKIP79:
COMP_SKP82:
BNE LINE_SKIP150
LINE_NSKIP150:
; Optimizer rule: Simplified equal comparison/6
;
LDY #0
TYA
; Optimizer rule: INT to FAC, FAC to INT/2
STY VAR_OB%
STA VAR_OB%+1
JMP RETURN
;
LINE_SKIP150:
;
;
LINE_61010:
;
LDA #<CONST_64
LDY #>CONST_64
JSR REALFAC
LDA #<VAR_SP
LDY #>VAR_SP
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_SP
LDY #>VAR_SP
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SP
LDY #>VAR_SP
JSR FACDIV
; Optimizer rule: Combine load and div/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PY
LDY #>VAR_PY
JSR FACMEM
; Optimizer rule: Omit FAC load/4
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(1)/1
LDY #5
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDY #3
LDA #0
STY A_REG
STA A_REG+1
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; FAC = FAC<<A
JSR SHL
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<VAR_SP
LDY #>VAR_SP
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PX
LDY #>VAR_PX
; FAC to (X/Y)
JSR FACMEM
;
LINE_61015:
;
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
LDA #<VAR_PX
LDY #>VAR_PX
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ80
ROL
BCC LT_LT80
LT_LT_EQ80:
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP LT_SKIP80
LT_LT80:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
LT_SKIP80:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_67R
LDY #>CONST_67R
JSR REALFAC
LDA #<VAR_PX
LDY #>VAR_PX
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT81
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP81
GT_GT81:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP81:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP83:
BEQ LINE_SKIP151
; Simplified conditional branch
;
LINE_NSKIP151:
;
JMP RETURN
;
LINE_SKIP151:
;
;
LINE_61020:
;
LDA #0
STA VAR_I
STA VAR_I+1
STA VAR_I+2
STA VAR_I+3
STA VAR_I+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP17
STA JUMP_TARGET
LDA #>FORLOOP17
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP17:
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PX[]
LDY #>VAR_PX[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
LDA #<VAR_PX
LDY #>VAR_PX
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
ROL
BCS GT_GT82
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP82
GT_GT82:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP82:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PX[]
LDY #>VAR_PX[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<VAR_PX
LDY #>VAR_PX
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = ABS(FAC)
JSR FACABS
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFADDARG
; Optimizer rule: Fast FADD (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_DX
LDY #>VAR_DX
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PY[]
LDY #>VAR_PY[]
JSR ARRAYACCESS_REAL_S
; Optimizer rule: Memory saving array access (real)/3
LDA #<VAR_PY
LDY #>VAR_PY
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = ABS(FAC)
JSR FACABS
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_DY
LDY #>VAR_DY
; FAC to (X/Y)
JSR FACMEM
;
LINE_61030:
;
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFAC
LDA #<VAR_DY
LDY #>VAR_DY
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT83
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP83
GT_GT83:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP83:
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFAC
LDA #<VAR_DX
LDY #>VAR_DX
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT84
LDA #<REAL_CONST_ZERO
LDY #>REAL_CONST_ZERO
JMP GT_SKIP84
GT_GT84:
LDA #<REAL_CONST_MINUS_ONE
LDY #>REAL_CONST_MINUS_ONE
GT_SKIP84:
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTOR
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: Faster logic OR/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA X_REG
COMP_SKP84:
BEQ LINE_SKIP152
; Simplified conditional branch
;
LINE_NSKIP152:
;
JMP LINE_61200
;
LINE_SKIP152:
;
;
LINE_61040:
;
LDA #<VAR_DY
LDY #>VAR_DY
JSR REALFAC
LDA #<CONST_6R
LDY #>CONST_6R
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_18R
LDY #>CONST_18R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; FAC = ARG * FAC
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_DX
LDY #>VAR_DX
JSR REALFAC
LDA #<CONST_6R
LDY #>CONST_6R
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_18R
LDY #>CONST_18R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; FAC = ARG * FAC
JSR FASTFMULMEM
; Optimizer rule: Fast FMUL (MEM)/1
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR FASTFADDARG
; Optimizer rule: Fast FADD (ARG)/1
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_DD
LDY #>VAR_DD
; FAC to (X/Y)
JSR FACMEM
;
LINE_61045:
;
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
LDA #<VAR_DD
LDY #>VAR_DD
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BCC LTEQ_LTEQ85
BEQ LTEQ_LTEQ85
LDA #0
JMP LTEQ_SKIP85
LTEQ_LTEQ85:
LDA #$1
LTEQ_SKIP85:
COMP_SKP85:
BEQ LINE_SKIP153
; Simplified conditional branch
;
LINE_NSKIP153:
;
JMP LINE_61200
;
LINE_SKIP153:
;
;
LINE_61050:
;
LDA #<VAR_I
LDY #>VAR_I
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_HP%[]
LDY #>VAR_HP%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
LDA #<VAR_DD
LDY #>VAR_DD
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
LDA #<VAR_HP%[]
LDY #>VAR_HP%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INTEGER_NX
; Optimizer rule: Value already in FAC(1)/6
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_HP%[]
LDY #>VAR_HP%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BEQ LT_LT_EQ86
ROL
BCC LT_LT86
LT_LT_EQ86:
LDA #0
JMP LT_SKIP86
LT_LT86:
LDA #$1
LT_SKIP86:
COMP_SKP86:
BEQ LINE_SKIP154
; Simplified conditional branch
;
LINE_NSKIP154:
;
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #0
TYA
STY AS_TMP
STA AS_TMP+1
LDA #<VAR_HP%[]
LDY #>VAR_HP%[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_INT_INTEGER
; Optimizer rule: Array content is integer (store)/9
;
LINE_SKIP154:
;
;
LINE_61060:
LDX #4
dcloop2350_1:
LDA VAR_PN,X
STA VAR_PA,X
LDA VAR_I,X
STA VAR_PN,X
DEX
BPL dcloop2350_1
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_39750
JSR GOSUB
JSR LINE_54150
;
LINE_61070:
;
LDA #0
STA VAR_P
STA VAR_P+1
STA VAR_P+2
STA VAR_P+3
STA VAR_P+4
; Optimizer rule: Simplified setting to 0/6
LDY #1
LDA #0
STY A_REG
STA A_REG+1
LDA #<VAR_DD
LDY #>VAR_DD
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC = FAC<<A
JSR SHL
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to FAC
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_P
LDY #>VAR_P
STA A_REG
STY A_REG+1
LDA #<FORLOOP18
STA JUMP_TARGET
LDA #>FORLOOP18
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP18:
LDA #<CONST_118
LDY #>CONST_118
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #7
LDA #0
STY A_REG
STA A_REG+1
JSR PEEKBYTEAND
LDA #<CONST_3R
LDY #>CONST_3R
JSR REALFAC
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR XREGARG
; Optimizer rule: X_REG 2 ARG/1
; FAC = ARG | FAC
JSR FASTOR
; Optimizer rule: Faster logic OR/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 53270
LDA #<VAR_P
LDY #>VAR_P
STA A_REG
STY A_REG+1
JSR NEXT
LDA A_REG
BNE RBEQ_18
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_18:
;
LINE_61080:
;
LDY #8
STY 53270
; Optimizer rule: Simple POKE/2
JSR GOSUB
JSR LINE_54250
LDX #4
dcloop2350_3:
LDA VAR_PA,X
STA VAR_PN,X
DEX
BPL dcloop2350_3
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_61200:
;
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
JSR NEXT
LDA A_REG
BNE RBEQ_19
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_19:
JMP RETURN
;
LINE_61600:
;
;
LINE_61610:
;
JSR COMPACTMAX
LDA #<VAR_PS[]
LDY #>VAR_PS[]
STA G_REG
STY G_REG+1
LDY #1
LDA #0
JSR ARRAYACCESS_REAL_INT
; Optimizer rule: Array index is integer (load)/7
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
; ignored: CHGCTX #1
JSR STR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
JSR PUSHINT
LDA #<CONST_119
LDY #>CONST_119
STA TMP_ZP
STY TMP_ZP+1
JSR PUSHINT
; Optimizer rule: Fast address push/3
LDA #<VAR_PS[]
LDY #>VAR_PS[]
STA G_REG
STY G_REG+1
LDY #0
TYA
JSR ARRAYACCESS_REAL_INT
; Optimizer rule: Array index is integer (load)/7
JSR COPY_XREG2YREG
; Optimizer rule: Direct copy from X to Y/1
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Improved copy from REG0 to REG1/7
; ignored: CHGCTX #1
JSR STR
JSR POPINT
LDY TMP_ZP
LDA TMP_ZP+1
STY B_REG
STA B_REG+1
JSR CONCAT
JSR POPINT
LDY TMP_ZP
LDA TMP_ZP+1
STY B_REG
STA B_REG+1
JSR CONCAT
;ignored: JSR COPYSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_A$
LDY #>VAR_A$
JSR COPYSTRING
;
LINE_61620:
LDX #4
dcloop2350_4:
LDA CONST_7R,X
STA VAR_YP,X
LDA CONST_0R,X
STA VAR_CK,X
DEX
BPL dcloop2350_4
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_62900
;
LINE_61630:
;
JMP RETURN
;
LINE_62000:
;
;
LINE_62010:
;
LDA #0
STA VAR_PA
STA VAR_PA+1
STA VAR_PA+2
STA VAR_PA+3
STA VAR_PA+4
; Optimizer rule: Simplified setting to 0/6
LDX #4
dcloop2350_6:
LDA CONST_0R,X
STA VAR_PD,X
DEX
BPL dcloop2350_6
; Optimizer rule: Direct copy of floats into mem/6
LDA #0
STA VAR_I
STA VAR_I+1
STA VAR_I+2
STA VAR_I+3
STA VAR_I+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_I
LDY #>VAR_I
STA A_REG
STY A_REG+1
LDA #<FORLOOP19
STA JUMP_TARGET
LDA #>FORLOOP19
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP19:
LDA #<VAR_I
LDY #>VAR_I
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_HP%[]
LDY #>VAR_HP%[]
JSR ARRAYACCESS_INTEGER_S
; Optimizer rule: Memory saving array access (integer)/3
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; CMPFAC with (A/Y)
JSR CMPFAC
BCC LTEQ_LTEQ87
BEQ LTEQ_LTEQ87
LDA #0
JMP LTEQ_SKIP87
LTEQ_LTEQ87:
LDA #$1
LTEQ_SKIP87:
COMP_SKP89:
BEQ LINE_SKIP155
; Simplified conditional branch
;
LINE_NSKIP155:
;
LDA #<VAR_PD
LDY #>VAR_PD
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PA
LDY #>VAR_PA
; FAC to (X/Y)
JSR FACMEM
JSR GOSUB
JSR LINE_62100
;
LINE_SKIP155:
;
;
LINE_62020:
;
LDA #<CONST_13R
LDY #>CONST_13R
JSR REALFAC
LDA #<VAR_PD
LDY #>VAR_PD
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_PD
LDY #>VAR_PD
; FAC to (X/Y)
JSR FACMEM
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_20
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_20:
;
LINE_62025:
;
LDA VAR_PA
BEQ EQ_SKIP88
EQ_EQ88:
JMP LINE_SKIP156
EQ_SKIP88:
COMP_SKP91:
; Optimizer rule: Reverted comparison/6
; Simplified conditional branch
;
LINE_NSKIP156:
;
JMP RETURN
;
LINE_SKIP156:
;
;
LINE_62028:
;
JSR GOSUB
JSR LINE_39500
;
LINE_62030:
;
LDA #<CONST_18R
LDY #>CONST_18R
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT89
LDA #0
JMP GT_SKIP89
GT_GT89:
LDA #$1
GT_SKIP89:
COMP_SKP92:
BNE LINE_NSKIP157
; Optimizer rule: Simplified CMP redux/7
JMP LINE_SKIP157
;
LINE_NSKIP157:
;
LDA #<CONST_120
LDY #>CONST_120
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_A$
LDY #>VAR_A$
JSR COPYSTRING
LDX #4
dcloop2350_7:
LDA CONST_10R,X
STA VAR_YP,X
LDA CONST_18R,X
STA VAR_CK,X
DEX
BPL dcloop2350_7
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_62900
;
LINE_SKIP157:
;
;
LINE_62035:
;
LDX #4
dcloop2464_1:
LDA CONST_10R,X
STA VAR_YP,X
DEX
BPL dcloop2464_1
; Optimizer rule: Direct copy of floats into mem/6
;
LINE_62040:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_PA
LDY #>VAR_PA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ EQ_EQ90
LDA #0
JMP EQ_SKIP90
EQ_EQ90:
LDA #$1
EQ_SKIP90:
COMP_SKP93:
BNE LINE_NSKIP158
; Optimizer rule: Simplified CMP redux/7
JMP LINE_SKIP158
;
LINE_NSKIP158:
;
LDA #<CONST_121
LDY #>CONST_121
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_A$
LDY #>VAR_A$
JSR COPYSTRING
; Optimizer rule: Simplified loading of Strings/5
LDA #<VAR_PC[]
LDY #>VAR_PC[]
STA G_REG
STY G_REG+1
LDY #1
LDA #0
JSR ARRAYACCESS_REAL_INT
; Optimizer rule: Array index is integer (load)/7
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
LDX #<VAR_CK
LDY #>VAR_CK
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PS[]
LDY #>VAR_PS[]
STA G_REG
STY G_REG+1
LDY #1
LDA #0
JSR ARRAYACCESS_REAL_INT
; Optimizer rule: Array index is integer (load)/7
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PS[]
LDY #>VAR_PS[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
JSR GOSUB
JSR LINE_62900
;
LINE_SKIP158:
;
;
LINE_62050:
;
LDA #<CONST_18R
LDY #>CONST_18R
JSR REALFAC
LDA #<VAR_PA
LDY #>VAR_PA
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ EQ_EQ91
LDA #0
JMP EQ_SKIP91
EQ_EQ91:
LDA #$1
EQ_SKIP91:
COMP_SKP94:
BNE LINE_NSKIP159
; Optimizer rule: Simplified CMP redux/7
JMP LINE_SKIP159
;
LINE_NSKIP159:
;
LDA #<CONST_122
LDY #>CONST_122
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_A$
LDY #>VAR_A$
JSR COPYSTRING
; Optimizer rule: Simplified loading of Strings/5
LDA #<VAR_PC[]
LDY #>VAR_PC[]
STA G_REG
STY G_REG+1
LDY #0
TYA
JSR ARRAYACCESS_REAL_INT
; Optimizer rule: Array index is integer (load)/7
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
LDX #<VAR_CK
LDY #>VAR_CK
; FAC to (X/Y)
JSR FACMEM
LDA #<CONST_5R
LDY #>CONST_5R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_PS[]
LDY #>VAR_PS[]
STA G_REG
STY G_REG+1
LDY #0
TYA
JSR ARRAYACCESS_REAL_INT
; Optimizer rule: Array index is integer (load)/7
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
; Optimizer rule: Avoid INTEGER->REAL conversion/3
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
JSR POPREALXREG
; Optimizer rule: POP and XREG combined/1
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<VAR_PS[]
LDY #>VAR_PS[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
JSR GOSUB
JSR LINE_62900
;
LINE_SKIP159:
;
;
LINE_62060:
;
JSR GOSUB
JSR LINE_61600
JSR GOSUB
JSR LINE_62280
JSR GOSUB
JSR LINE_62250
;
LINE_62070:
;
LDY #1
LDA #0
; Optimizer rule: INT to FAC, FAC to INT/2
STY VAR_RS%
STA VAR_RS%+1
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_RP
LDY #>VAR_RP
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(2)/1
LDA #<CONST_0R
LDY #>CONST_0R
JSR MEMARG
JSR FASTAND
; Optimizer rule: Swap AND order/7
; Optimizer rule: Faster logic AND/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_RP
LDY #>VAR_RP
; FAC to (X/Y)
JSR FACMEM
LDX #4
dcloop2464_2:
LDA VAR_RP,X
STA VAR_CP,X
DEX
BPL dcloop2464_2
; Optimizer rule: Direct copy of floats into mem/6
JMP RETURN
;
LINE_62100:
;
;
LINE_62110:
LDX #4
dcloop2464_3:
LDA VAR_PN,X
STA VAR_OO,X
LDA VAR_I,X
STA VAR_PN,X
DEX
BPL dcloop2464_3
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_60100
LDA #<VAR_SA
LDY #>VAR_SA
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF109+1
STA MOVBSELF109+2
LDA #$68
MOVBSELF109:
STA $FFFF
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF110+1
STA MOVBSELF110+2
LDA #$68
MOVBSELF110:
STA $FFFF
;
LINE_62120:
;
LDA #<CONST_68R
LDY #>CONST_68R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF111+1
STA MOVBSELF111+2
LDA #$20
MOVBSELF111:
STA $FFFF
LDA #<CONST_67R
LDY #>CONST_67R
JSR REALFAC
LDA #<VAR_SA
LDY #>VAR_SA
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF112+1
STA MOVBSELF112+2
LDA #$20
MOVBSELF112:
STA $FFFF
LDX #4
dcloop2464_5:
LDA VAR_OO,X
STA VAR_PN,X
DEX
BPL dcloop2464_5
; Optimizer rule: Direct copy of floats into mem/6
JMP RETURN
;
LINE_62200:
;
;
LINE_62210:
;
LDA #<CONST_124
LDY #>CONST_124
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #239
LDA #0
STY A_REG
STA A_REG+1
JSR PEEKBYTEANDFAST
STY 53265
; Optimizer rule: Faster PEEKBYTEAND/2
JMP RETURN
;
LINE_62220:
;
;
LINE_62230:
;
LDA #<CONST_124
LDY #>CONST_124
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #16
LDA #0
STY A_REG
STA A_REG+1
JSR PEEKBYTEORFAST
STY 53265
; Optimizer rule: Faster PEEKBYTEOR/2
JMP RETURN
;
LINE_62250:
;
;
LINE_62260:
;
JSR GETSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_A$
LDY #>VAR_A$
JSR COPYSTRING
JSR GOSUB
JSR LINE_42000
LDA #<CONST_42
LDY #>CONST_42
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA X_REG
COMP_SKP95:
BEQ LINE_SKIP160
; Simplified conditional branch
;
LINE_NSKIP160:
;
JMP LINE_62260
;
LINE_SKIP160:
;
;
LINE_62270:
;
JMP RETURN
;
LINE_62280:
;
;
LINE_62285:
;
JSR GETSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_A$
LDY #>VAR_A$
JSR COPYSTRING
JSR GOSUB
JSR LINE_42000
LDA #<CONST_42
LDY #>CONST_42
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SNEQ
LDA X_REG
COMP_SKP96:
BEQ LINE_SKIP161
; Simplified conditional branch
;
LINE_NSKIP161:
;
JMP LINE_62285
;
LINE_SKIP161:
;
;
LINE_62290:
;
JMP RETURN
;
LINE_62300:
;
;
LINE_62310:
;
JSR RESTORE
;
LINE_62320:
;
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_A
LDY #>VAR_A
; FAC to (X/Y)
JSR FACMEM
LDX #4
dcneloop2739_2:
LDA CONST_56,X
CMP VAR_A,X
BNE LINE_NSKIP162
DEX
BPL dcneloop2739_2
JMP LINE_SKIP162
; Optimizer rule: Direct compare(<>) of floats/8
LINE_NSKIP162:
; Optimizer rule: Simplified not equal comparison/6
;
JMP LINE_62320
;
LINE_SKIP162:
;
;
LINE_62330:
;
LDA #0
STA VAR_CO
STA VAR_CO+1
STA VAR_CO+2
STA VAR_CO+3
STA VAR_CO+4
; Optimizer rule: Simplified setting to 0/6
LDA #<CONST_64
LDY #>CONST_64
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC (2)/3
LDX #<VAR_I
LDY #>VAR_I
; FAC to (X/Y)
JSR FACMEM
JSR GOSUB
JSR LINE_62200
;
LINE_62340:
;
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_P
LDY #>VAR_P
; FAC to (X/Y)
JSR FACMEM
;
LINE_62350:
;
LDX #4
dceloop2738_5:
LDA CONST_126,X
CMP VAR_P,X
BNE LINE_SKIP163
DEX
BPL dceloop2738_5
; Optimizer rule: Direct compare(=) of floats/7
LINE_NSKIP163:
; Optimizer rule: Simplified equal comparison/6
;
JSR GOSUB
JSR LINE_62220
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 53280
JMP RETURN
;
LINE_SKIP163:
;
;
LINE_62360:
;
LDA #$0
STA FAC
STA FACHO
STA FACMOH
STA FACMO
STA FACLO
STA FACSGN
; Optimizer rule: Direct loading of 0/7
LDA #<VAR_P
LDY #>VAR_P
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ94
ROL
BCC LT_LT94
LT_LT_EQ94:
LDA #0
JMP LT_SKIP94
LT_LT94:
LDA #$1
LT_SKIP94:
COMP_SKP99:
BEQ LINE_SKIP164
; Simplified conditional branch
;
LINE_NSKIP164:
;
JSR GOSUB
JSR LINE_62400
JMP LINE_62340
;
LINE_SKIP164:
;
;
LINE_62370:
;
LDA #<CONST_14R
LDY #>CONST_14R
JSR REALFAC
LDA #<VAR_P
LDY #>VAR_P
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
BEQ LT_LT_EQ95
ROL
BCC LT_LT95
LT_LT_EQ95:
LDA #0
JMP LT_SKIP95
LT_LT95:
LDA #$1
LT_SKIP95:
COMP_SKP100:
BEQ LINE_SKIP165
; Simplified conditional branch
;
LINE_NSKIP165:
;
LDX #4
dcloop2578_1:
LDA VAR_P,X
STA VAR_CO,X
DEX
BPL dcloop2578_1
; Optimizer rule: Direct copy of floats into mem/6
JMP LINE_62340
;
LINE_SKIP165:
;
;
LINE_62380:
;
LDA #<CONST_14R
LDY #>CONST_14R
JSR REALFAC
LDA #<VAR_P
LDY #>VAR_P
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_P
LDY #>VAR_P
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_I
LDY #>VAR_I
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_P
LDY #>VAR_P
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF116+1
STA MOVBSELF116+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF116:
STY $FFFF
LDA #<VAR_I
LDY #>VAR_I
JSR REALFAC
LDA #<CONST_60
LDY #>CONST_60
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<VAR_CO
LDY #>VAR_CO
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR POPREAL
JSR FACWORD
; Optimizer rule: POP, REG0, VAR0 -> to WORD/2
STY MOVBSELF117+1
STA MOVBSELF117+2
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(1)/1
; FAC to integer in Y/A
JSR FACWORD
MOVBSELF117:
STY $FFFF
LDA #<VAR_P
LDY #>VAR_P
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC to integer in Y/A
JSR FACWORD
STY 53280
;
LINE_62390:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_I
LDY #>VAR_I
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_I
LDY #>VAR_I
; FAC to (X/Y)
JSR FACMEM
JMP LINE_62340
;
LINE_62400:
;
;
LINE_62410:
;
LDX #4
dcloop2578_2:
LDA VAR_I,X
STA VAR_J,X
DEX
BPL dcloop2578_2
; Optimizer rule: Direct copy of floats into mem/6
LDA #<VAR_P
LDY #>VAR_P
JSR REALFAC
LDA #<VAR_I
LDY #>VAR_I
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR PUSHREAL
LDA #<CONST_0R
LDY #>CONST_0R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
LDA #<VAR_J
LDY #>VAR_J
STA A_REG
STY A_REG+1
LDA #<FORLOOP20
STA JUMP_TARGET
LDA #>FORLOOP20
STA JUMP_TARGET+1
JSR INITFOR
FORLOOP20:
;
LINE_62420:
;
LDA #<VAR_J
LDY #>VAR_J
JSR REALFAC
; Optimizer rule: Direct loading of values into FAC/3
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF119+1
STA MOVBSELF119+2
LDA #$A0
MOVBSELF119:
STA $FFFF
LDA #<VAR_J
LDY #>VAR_J
JSR REALFAC
LDA #<CONST_60
LDY #>CONST_60
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY MOVBSELF120+1
STA MOVBSELF120+2
LDA #$0
MOVBSELF120:
STA $FFFF
;
LINE_62430:
;
LDA #0
STA A_REG
STA A_REG+1
JSR NEXT
; Optimizer rule: NEXT with no variable name simplified/4
LDA A_REG
BNE RBEQ_21
JMP (JUMP_TARGET)
; Optimizer rule: NEXT check simplified/4
RBEQ_21:
;
LINE_62440:
;
JSR ONETOFAC
; Optimizer rule: Faster setting to 1/1
LDA #<VAR_J
LDY #>VAR_J
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_I
LDY #>VAR_I
; FAC to (X/Y)
JSR FACMEM
JMP RETURN
;
LINE_62500:
;
;
LINE_62510:
;
JSR GOSUB
JSR LINE_62300
;
LINE_62520:
;
LDY #6
STY 646
LDX #4
dcloop2578_3:
LDA CONST_23R,X
STA VAR_XP,X
LDA CONST_23R,X
STA VAR_YP,X
DEX
BPL dcloop2578_3
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_62950
;
LINE_62530:
;
LDA #<CONST_127
LDY #>CONST_127
JSR STROUTBRKWL
LDX #4
dcloop2578_5:
LDA CONST_18R,X
STA VAR_XP,X
LDA CONST_7R,X
STA VAR_YP,X
DEX
BPL dcloop2578_5
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_62950
;
LINE_62540:
;
LDA #<CONST_128
LDY #>CONST_128
JSR STROUTBRKWL
; Optimizer rule: Memory saving STROUTBRK/1
; Optimizer rule: STROUT + LINEBRK/1
;
LINE_62550:
;
LDY #5
STY 646
LDX #4
dcloop2578_7:
LDA CONST_129R,X
STA VAR_XP,X
LDA CONST_66R,X
STA VAR_YP,X
DEX
BPL dcloop2578_7
; Special rule: Aggregation of assignments (2)
; Optimizer rule: Direct copy of floats into mem/6
JSR GOSUB
JSR LINE_62950
;
LINE_62560:
;
LDA #<CONST_130
LDY #>CONST_130
JSR STROUTWL
; Optimizer rule: Memory saving STROUT/1
;
LINE_62565:
;
JSR GOSUB
JSR LINE_62280
;
LINE_62570:
;
JSR GOSUB
JSR LINE_42000
JSR GOSUB
JSR LINE_63700
;
LINE_62580:
;
JSR GOSUB
JSR LINE_62200
LDY #1
STY 646
; Optimizer rule: Simple POKE/2
JSR COMPACTMAX
LDA #147
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
;
LINE_62590:
;
LDY #6
STY 53280
; Optimizer rule: Simple POKE/2
LDY #6
STY 53281
; Optimizer rule: Simple POKE/2
;
LINE_62850:
;
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PS[]
LDY #>VAR_PS[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
LDA #<CONST_0R
LDY #>CONST_0R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<CONST_5R
LDY #>CONST_5R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA #<VAR_PS[]
LDY #>VAR_PS[]
STA G_REG
STY G_REG+1
JSR ARRAYSTORE_REAL
;
LINE_62870:
;
JSR COMPACTMAX
LDA #147
JSR SINGLECHROUT
; Optimizer rule: Single character output/2
JSR GOSUB
JSR LINE_62220
JMP RETURN
;
LINE_62900:
;
;
LINE_62910:
;
LDA #<CONST_6R
LDY #>CONST_6R
JSR REALFACPUSH
; Optimizer rule: Load and PUSH combined/1
; ignored: CHGCTX #1
LDA VAR_A$
LDY VAR_A$+1
STA B_REG
STY B_REG+1
; ignored: CHGCTX #0
JSR LEN
JSR POPREAL2X
; Optimizer rule: POPREAL and load X/1
JSR ARGDIV
; Optimizer rule: POP, REG0, VAR0 -> direct calc/5
; Optimizer rule: FAC into REG?, REG? into FAC/0
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC = INT(FAC)
JSR BASINT
; Optimizer rule: FAC into REG?, REG? into FAC/0
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(2)/1
LDA #<CONST_15R
LDY #>CONST_15R
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDA #<X_REG
LDY #>X_REG
; Real in (A/Y) to ARG
JSR FASTFSUBMEM
; Optimizer rule: Fast FSUB (MEM)/1
; Optimizer rule: Combine load and sub/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_XP
LDY #>VAR_XP
; FAC to (X/Y)
JSR FACMEM
LDY 646
LDA #0
; integer in Y/A to FAC
JSR INTFAC
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_II
LDY #>VAR_II
; FAC to (X/Y)
JSR FACMEM
LDA #<VAR_CK
LDY #>VAR_CK
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC to integer in Y/A
JSR FACWORD
STY 646
;
LINE_62920:
;
JSR GOSUB
JSR LINE_62950
;
LINE_62930:
;
LDA VAR_A$
LDY VAR_A$+1
JSR STROUTBRKWL
; Optimizer rule: Memory saving STROUTBRK/1
; Optimizer rule: STROUT + LINEBRK/1
LDA #<VAR_II
LDY #>VAR_II
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC to integer in Y/A
JSR FACWORD
STY 646
JMP RETURN
;
LINE_62950:
;
;
LINE_62960:
;
LDA #<VAR_YP
LDY #>VAR_YP
JSR COPY2_XYA_XREG
; Optimizer rule: MEM 2 X_REG/3
; Optimizer rule: Memory saving copy/4
JSR XREGFAC
; Optimizer rule: X_REG 2 FAC(2)/1
; FAC to integer in Y/A
JSR FACWORD
STY 781
LDA #<VAR_XP
LDY #>VAR_XP
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACXREG
; Optimizer rule: FAC 2 X_REG(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC (2)/3
; FAC to integer in Y/A
JSR FACWORD
STY 782
LDA #<CONST_131
LDY #>CONST_131
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDY #254
LDA #0
STY A_REG
STA A_REG+1
JSR PEEKBYTEANDFAST
STY 783
; Optimizer rule: Faster PEEKBYTEAND/2
LDA #<65520
STA TMP_ZP
LDA #>65520
STA TMP_ZP+1
JSR SYSTEMCALL
;
LINE_62970:
;
JMP RETURN
;
LINE_62980:
;
;
LINE_62981:
;
;
LINE_62982:
;
;
LINE_62983:
;
;
LINE_62984:
;
;
LINE_62986:
;
;
LINE_62987:
;
;
LINE_62988:
;
;
LINE_62989:
;
;
LINE_62990:
;
;
LINE_62991:
;
;
LINE_62992:
;
;
LINE_62993:
;
;
LINE_63000:
;
;
LINE_63010:
;
;
LINE_63011:
;
;
LINE_63012:
;
;
LINE_63013:
;
;
LINE_63014:
;
;
LINE_63015:
;
;
LINE_63016:
;
;
LINE_63017:
;
;
LINE_63018:
;
;
LINE_63019:
;
;
LINE_63020:
;
;
LINE_63021:
;
;
LINE_63022:
;
;
LINE_63023:
;
;
LINE_63024:
;
;
LINE_63025:
;
;
LINE_63026:
;
;
LINE_63027:
;
;
LINE_63028:
;
;
LINE_63029:
;
;
LINE_63030:
;
;
LINE_63031:
;
;
LINE_63032:
;
;
LINE_63033:
;
;
LINE_63034:
;
;
LINE_63035:
;
;
LINE_63036:
;
;
LINE_63037:
;
;
LINE_63038:
;
;
LINE_63039:
;
;
LINE_63040:
;
;
LINE_63041:
;
;
LINE_63042:
;
;
LINE_63043:
;
;
LINE_63044:
;
;
LINE_63045:
;
;
LINE_63046:
;
;
LINE_63047:
;
;
LINE_63048:
;
;
LINE_63049:
;
;
LINE_63050:
;
;
LINE_63051:
;
;
LINE_63052:
;
;
LINE_63053:
;
;
LINE_63054:
;
;
LINE_63055:
;
;
LINE_63056:
;
;
LINE_63057:
;
;
LINE_63058:
;
;
LINE_63059:
;
;
LINE_63060:
;
;
LINE_63061:
;
;
LINE_63062:
;
;
LINE_63063:
;
;
LINE_63064:
;
;
LINE_63065:
;
;
LINE_63066:
;
;
LINE_63067:
;
;
LINE_63068:
;
;
LINE_63069:
;
;
LINE_63070:
;
;
LINE_63071:
;
;
LINE_63072:
;
;
LINE_63073:
;
;
LINE_63074:
;
;
LINE_63700:
;
;
LINE_63705:
;
;
LINE_63720:
;
LDY #15
STY 54296
; Optimizer rule: Simple POKE/2
;
LINE_63730:
;
LDY #9
STY 54277
; Optimizer rule: Simple POKE/2
LDY #0
STY 54278
; Optimizer rule: Simple POKE/2
;
LINE_63735:
;
LDY #26
STY 54284
; Optimizer rule: Simple POKE/2
LDY #36
STY 54285
; Optimizer rule: Simple POKE/2
;
LINE_63740:
;
LDY #16
STY 54291
; Optimizer rule: Simple POKE/2
LDY #240
STY 54292
; Optimizer rule: Simple POKE/2
;
LINE_63750:
;
<IF !X16>
SEI
LDY TIMEADDR
LDX TIMEADDR+1
LDA TIMEADDR+2
CLI
</IF>
SEC
JSR COPYTIME
JSR GETTIME
LDX #<VAR_TI
LDY #>VAR_TI
JSR FACMEM
LDA #<VAR_TI
LDY #>VAR_TI
; Real in (A/Y) to FAC
JSR REALFAC
JSR FACYREG
; Optimizer rule: FAC 2 Y_REG(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC (2)/3
LDX #<VAR_T
LDY #>VAR_T
; FAC to (X/Y)
JSR FACMEM
;
LINE_63760:
;
LDY #32
STY 54276
; Optimizer rule: Simple POKE/2
LDY #32
STY 54283
; Optimizer rule: Simple POKE/2
LDY #16
STY 54290
; Optimizer rule: Simple POKE/2
;
LINE_63770:
;
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_X
LDY #>VAR_X
; FAC to (X/Y)
JSR FACMEM
LDX #4
dceloop2738_6:
LDA CONST_56,X
CMP VAR_X,X
BNE LINE_SKIP166
DEX
BPL dceloop2738_6
; Optimizer rule: Direct compare(=) of floats/7
LINE_NSKIP166:
; Optimizer rule: Simplified equal comparison/6
;
JMP LINE_63900
;
LINE_SKIP166:
;
;
LINE_63780:
;
JSR READNUMBER
LDY #>Y_REG
LDA #<Y_REG
; Real in (A/Y) to FAC
JSR REALFAC
LDX #<VAR_H1
LDY #>VAR_H1
; FAC to (X/Y)
JSR FACMEM
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_L1
LDY #>VAR_L1
; FAC to (X/Y)
JSR FACMEM
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_H2
LDY #>VAR_H2
; FAC to (X/Y)
JSR FACMEM
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_L2
LDY #>VAR_L2
; FAC to (X/Y)
JSR FACMEM
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_H3
LDY #>VAR_H3
; FAC to (X/Y)
JSR FACMEM
JSR READNUMBER
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
LDX #<VAR_L3
LDY #>VAR_L3
; FAC to (X/Y)
JSR FACMEM
;
LINE_63790:
;
LDA #<VAR_H1
LDY #>VAR_H1
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA Y_REG
COMP_SKP103:
BNE LINE_NSKIP167
; Optimizer rule: CMP (REG) != 0(2)/3
JMP LINE_SKIP167
;
LINE_NSKIP167:
;
LDA #<VAR_H1
LDY #>VAR_H1
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 54273
LDA #<VAR_L1
LDY #>VAR_L1
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 54272
LDA #<CONST_135R
LDY #>CONST_135R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 54276
;
LINE_SKIP167:
;
;
LINE_63800:
;
LDA #<VAR_H2
LDY #>VAR_H2
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA Y_REG
COMP_SKP104:
BNE LINE_NSKIP168
; Optimizer rule: CMP (REG) != 0(2)/3
JMP LINE_SKIP168
;
LINE_NSKIP168:
;
LDA #<VAR_H2
LDY #>VAR_H2
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 54280
LDA #<VAR_L2
LDY #>VAR_L2
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 54279
LDA #<CONST_135R
LDY #>CONST_135R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 54283
;
LINE_SKIP168:
;
;
LINE_63810:
;
LDA #<VAR_H3
LDY #>VAR_H3
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
LDA Y_REG
COMP_SKP105:
BNE LINE_NSKIP169
; Optimizer rule: CMP (REG) != 0(2)/3
JMP LINE_SKIP169
;
LINE_NSKIP169:
;
LDA #<VAR_H3
LDY #>VAR_H3
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 54287
LDA #<VAR_L3
LDY #>VAR_L3
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 54286
LDA #<CONST_12R
LDY #>CONST_12R
JSR COPY2_XYA_YREG
; Optimizer rule: MEM 2 Y_REG/3
; Optimizer rule: Memory saving copy/4
; Optimizer rule: Quick copy into REG/7
JSR YREGFAC
; Optimizer rule: Y_REG 2 FAC(1)/1
; Optimizer rule: FAC into REG?, REG? into FAC/0
; FAC to integer in Y/A
JSR FACWORD
STY 54290
;
LINE_SKIP169:
;
;
LINE_63820:
;
LDA #<VAR_X
LDY #>VAR_X
JSR REALFAC
LDA #<VAR_T
LDY #>VAR_T
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
; Optimizer rule: Combine load and add/1
; Optimizer rule: Highly simplified loading for calculations/7
; Optimizer rule: FAC into REG?, REG? into FAC/0
LDX #<VAR_T
LDY #>VAR_T
; FAC to (X/Y)
JSR FACMEM
;
LINE_63830:
;
<IF !X16>
SEI
LDY TIMEADDR
LDX TIMEADDR+1
LDA TIMEADDR+2
CLI
</IF>
SEC
JSR COPYTIME
JSR GETTIME
LDX #<VAR_TI
LDY #>VAR_TI
JSR FACMEM
LDA #<VAR_TI
LDY #>VAR_TI
JSR REALFAC
LDA #<VAR_T
LDY #>VAR_T
JSR CMPFAC
; Optimizer rule: Highly simplified loading for CMP/6
ROL
BCS GT_GT97
LDA #0
JMP GT_SKIP97
GT_GT97:
LDA #$1
GT_SKIP97:
COMP_SKP106:
BEQ LINE_SKIP170
; Simplified conditional branch
;
LINE_NSKIP170:
;
JMP LINE_63830
;
LINE_SKIP170:
;
;
LINE_63835:
;
JSR GETSTR
LDA A_REG
LDY A_REG+1
STA TMP_ZP
STY TMP_ZP+1
LDA #<VAR_A$
LDY #>VAR_A$
JSR COPYSTRING
LDA #<CONST_42
LDY #>CONST_42
STA B_REG
STY B_REG+1
LDA VAR_A$
LDY VAR_A$+1
STA A_REG
STY A_REG+1
; ignored: CHGCTX #0
JSR SEQ
LDA X_REG
COMP_SKP107:
BEQ LINE_SKIP171
; Simplified conditional branch
;
LINE_NSKIP171:
;
JMP LINE_63760
;
LINE_SKIP171:
;
;
LINE_63840:
;
JSR GOSUB
JSR LINE_39910
JMP RETURN
;
LINE_63850:
;
;
LINE_63852:
;
;
LINE_63854:
;
;
LINE_63856:
;
;
LINE_63858:
;
;
LINE_63860:
;
;
LINE_63862:
;
;
LINE_63864:
;
;
LINE_63866:
;
;
LINE_63868:
;
;
LINE_63870:
;
;
LINE_63872:
;
;
LINE_63874:
;
;
LINE_63876:
;
;
LINE_63878:
;
;
LINE_63880:
;
;
LINE_63882:
;
;
LINE_63884:
;
;
LINE_63886:
;
;
LINE_63888:
;
;
LINE_63890:
;
;
LINE_63900:
;
;
LINE_63910:
;
JMP RETURN
JSR END
RTS
; *** SUBROUTINES ***
;###################################
END			LDX SP_SAVE
TXS
<IF BIGRAM>
JSR ENABLEROM
</IF>
<IF BOOST>
JSR BOOSTDIASBLE
</IF>
RTS
;###################################
;###################################
SYSTEMCALL
LDA TMP_ZP
STA SCDO+1
LDA TMP_ZP+1
STA SCDO+2
LDA $030F
PHA
LDA $030C
LDX $030D
LDY $030E
PLP
<IF BIGRAM>
JSR ENABLEROM
</IF>
SCDO		JSR $FFFF
<IF BIGRAM>
JSR DISABLEROM
</IF>
PHP
STA $030C
STX $030D
STY $030E
PLA
STA $030F
RTS
;###################################
;###################################
START		LDA ENDSTRBUF+1
BNE ENDGIVEN
LDA BASICEND
STA ENDSTRBUF
LDA BASICEND+1
STA ENDSTRBUF+1
ENDGIVEN	LDA #<FPSTACK
LDY #>FPSTACK
STA FPSTACKP
STY FPSTACKP+1
LDA #<FORSTACK
LDY #>FORSTACK
STA FORSTACKP
STY FORSTACKP+1
LDA #<STRBUF
LDY #>STRBUF
STA STRBUFP
STY STRBUFP+1
STA HIGHP
STY HIGHP+1
LDA #0
STA CHLOCKFLAG
STA LASTVAR
STA LASTVAR+1
JSR INITVARS
LDA #0
STA CMD_NUM
STA CHANNEL
TAY
TAX
<IF X16>
JSR VARBANKON
</IF>
STA KEYNDX
<IF X16>
JSR VARBANKOFF
LDA #DEFAULT_BANK
STA RAMSELECT
</IF>
JSR RESTORE
CLC
<IF BOOST>
JSR BOOSTENABLE
</IF>
RTS
;###################################
;###################################
INITNARRAY
STA TMP_ZP
STY TMP_ZP+1
LDY #0
TYA
NINITLOOP	STA (TMP_ZP),Y
INC TMP_ZP
BNE NLOOPNOV
INC TMP_ZP+1
NLOOPNOV	LDX TMP2_ZP
BNE NLOOPNOV2
DEC TMP2_ZP+1
NLOOPNOV2	DEC TMP2_ZP
BNE NINITLOOP
LDX TMP2_ZP+1
BNE NINITLOOP
RTS
;###################################
;###################################
INITSTRARRAY
STA TMP_ZP
STY TMP_ZP+1
SINITLOOP	LDY #0
LDA #<EMPTYSTR
STA (TMP_ZP),Y
LDA #>EMPTYSTR
INY
STA (TMP_ZP),Y
CLC
LDA TMP_ZP
ADC #2
STA TMP_ZP
BCC SLOOPNOV1
INC TMP_ZP+1
SLOOPNOV1	SEC
LDA TMP2_ZP
SBC #2
STA TMP2_ZP
BCS SLOOPNOV2
DEC TMP2_ZP+1
SLOOPNOV2	LDA TMP2_ZP
BNE SINITLOOP
LDA TMP2_ZP+1
BNE SINITLOOP
RTS
;###################################
;###################################
INITSPARAMS	STA TMP3_ZP
STY TMP3_ZP+1
SEC
SBC #2
STA TMP_ZP
TYA
SBC #0
STA TMP_ZP+1
LDY #0
LDA (TMP_ZP),Y
STA TMP2_ZP
INY
LDA (TMP_ZP),Y
STA TMP2_ZP+1
LDA TMP3_ZP
LDY TMP3_ZP+1
RTS
;##################################
;##################################
INITSTRVARS	LDA #<STRINGVARS_START		; Reset all string variables...
LDY #>STRINGVARS_START
CMP #<STRINGVARS_END
BNE INITIT1
CPY #>STRINGVARS_END
BNE INITIT1
JMP INITSA2					; No string variables at all
INITIT1		STA TMP_ZP
STY TMP_ZP+1
LDY #0
INITSTRLOOP	LDA #<EMPTYSTR
STA (TMP_ZP),Y
INY
LDA #>EMPTYSTR
STA (TMP_ZP),Y
DEY
LDA TMP_ZP
CLC
ADC #2
STA TMP_ZP
LDA TMP_ZP+1
ADC #0
STA TMP_ZP+1
CMP #>STRINGVARS_END
BNE INITSTRLOOP
LDA TMP_ZP
CMP #<STRINGVARS_END
BNE INITSTRLOOP
INITSA2		LDA #<STRINGARRAYS_START	; ...and all string arrays
LDY #>STRINGARRAYS_START
CMP #<STRINGARRAYS_END
BNE ARRAYLOOP
CPY #>STRINGARRAYS_END
BNE ARRAYLOOP
RTS							;...no string array at all
ARRAYLOOP	CLC
ADC #3
BCC ARRAYSKIP1
INY
ARRAYSKIP1	CPY #>STRINGARRAYS_END
BEQ ARRAYSC
BCC ARRAYSKIP2
JMP ARRAYQUIT
ARRAYSC		CMP #<STRINGARRAYS_END
BCS ARRAYQUIT
ARRAYSKIP2	STA TMP_REG
STY TMP_REG+1
JSR INITSPARAMS
LDA TMP_REG
LDY TMP_REG+1
JSR INITSTRARRAY
LDA TMP_ZP
LDY TMP_ZP+1
JMP ARRAYLOOP
ARRAYQUIT	RTS
;###################################
;###################################
RUN			LDX SP_SAVE
TXS
JMP PROGRAMSTART
;###################################
;###################################
RESTORE		LDA #<DATAS
LDY #>DATAS
STA DATASP
STY DATASP+1
RTS
;###################################
;###################################
MID			LDA #<D_REG
LDY #>D_REG
JSR REALFAC
JSR SGNFAC
ROL
BCC MIDLENGTH		; an actual length was given...
MIDNEGC		JSR STRFUNCINT		; ...no, it wasn't.
LDA TMP_REG			; copy start position from TMP_REG into TMP_REG+1
STA TMP_REG+1
BNE MIDOK2
JMP ILLEGALQUANTITY	; start has to be larger than 0
MIDOK2		DEC TMP_REG+1		; BASIC starts at 1, we start at 0
LDA (TMP_ZP),Y
SEC
SBC TMP_REG+1
STA TMP_REG			; store the calculated length
BCS	MIDNOV
STY TMP_REG			; Set length to 0, if start>string length
JMP MIDNOV
MIDLENGTH	JSR FACWORD
MIDCONST	STY TMP2_REG		; save the length in TMP2_REG
JSR STRFUNCINT
LDA TMP_REG			; copy start position from TMP_REG into TMP_REG+1
BNE MIDOK
JMP ILLEGALQUANTITY	; start has to be larger than 0
MIDOK		LDX TMP2_REG
STX TMP_REG			; store the length saved above in TMP_REG
STA TMP_REG+1
DEC TMP_REG+1		; BASIC starts at 1, we start at 0
MIDNOV		LDA TMP_REG+1		; the starting position
CLC
ADC TMP_REG			; add the length
BCS MIDCLAMP
CMP (TMP_ZP),Y
BCS	MIDCLAMP
MIDCOPY		JMP STRFUNC
MIDCLAMP	LDA (TMP_ZP),Y		; Clamp to the string's length, if needed...
SEC
SBC TMP_REG+1
STA TMP_REG
BCS MIDCOPY
STY TMP_REG
JMP MIDCOPY
;###################################
;###################################
LEFT		JSR STRFUNCINT
STY TMP_REG+1		; store the start position (always 0 for left$)
LDA (TMP_ZP),Y
CMP TMP_REG			; compare the source string's length with the parameter
BCS LEFTBELOW
STA TMP_REG			; length>source length? -> clamp to source length
LEFTBELOW	JMP STRFUNC
;###################################
;###################################
STRFUNCINT 	LDA B_REG			;the source string
STA TMP_ZP
LDA B_REG+1
STA TMP_ZP+1
LDA #<C_REG
LDY #>C_REG
JSR REALFAC
JSR FACWORD
STY TMP_REG			; store the parameter
LDY #0
RTS
;###################################
;###################################
; Generic function for string functions like for left$, right$ and mid$. It reuses the actual code to
; copy strings for an assignment but it jumps into it at a "copy only" stage. However, it still assumes
; that the source pointer points towards the length of the source string.
; We have to adapt to that behaviours, so we are adjusting and/or saving/restoring some values here.
STRFUNC		LDA TMP_REG+1
BEQ STARTATZERO
LDA TMP_ZP
CLC
ADC TMP_REG+1
STA TMP_ZP
BCC STARTATZERO
INC TMP_ZP+1
STARTATZERO	LDY #0
LDA (TMP_ZP),Y
PHA					; save the first byte of the source string on the stack
LDA TMP_REG
BNE STRFUNCNZ
LDA #<EMPTYSTR
STA A_REG
LDA #>EMPTYSTR
STA A_REG+1
JMP EXITSTRFUNC
STRFUNCNZ	STA (TMP_ZP),Y
LDA #<A_REG
LDY #>A_REG
STA TMP2_ZP
STY TMP2_ZP+1
LDX TMP_REG			; Put length into X for copy
JSR COPYONLY
EXITSTRFUNC	PLA
LDY #0
STA (TMP_ZP),Y		; restore the first byte of the source string on the stack
RTS
;###################################
;###################################
CONCAT		LDA A_REG
STA TMP_ZP
LDA A_REG+1
STA TMP_ZP+1
LDA STRBUFP		; adjust A_REG so that it points to the new tmp buffer
STA A_REG
STA TMP3_ZP
LDA STRBUFP+1
STA A_REG+1
STA TMP3_ZP+1
LDY #0
LDA (TMP_ZP),Y
TAX
LDA B_REG
STA TMP2_ZP
LDA B_REG+1
STA TMP2_ZP+1
TXA
CLC
ADC (TMP2_ZP),Y
BCC CCSTRFITS
JMP STRINGTOOLONG
CCSTRFITS	STA (TMP3_ZP),Y
INC TMP3_ZP
BNE CCNOOV2
INC TMP3_ZP+1
CCNOOV2		CLC
ADC STRBUFP
PHP
CLC
ADC #3
STA STRBUFP
BCC CCNOCS1
INC STRBUFP+1
CCNOCS1		PLP
BCC CCSTRFITS2
INC STRBUFP+1
CCSTRFITS2	JSR COPY2CONCAT		;...copy into the buffer
LDA B_REG			;set the content to append
STA TMP_ZP
LDA B_REG+1
STA TMP_ZP+1
JMP COPY2CONCAT		;..and copy it
;###################################
;###################################
COPY2CONCAT	LDY #0
LDA (TMP_ZP),Y
BEQ NOC2C			; Nothing to append, skip
STA TMP2_ZP
INC TMP_ZP
BNE COPY2LOOP
INC TMP_ZP+1
COPY2LOOP	LDA (TMP_ZP),Y
STA (TMP3_ZP),Y
INY
CPY TMP2_ZP
BNE COPY2LOOP
TYA
CLC
ADC TMP3_ZP			; Update tmp pointer in concat memory
STA TMP3_ZP
BCC NOC2C
INC TMP3_ZP+1
NOC2C		RTS
;###################################
;###################################
; Special loop to handle the common for-poke-next-case
; used to clear the screen and such...
FASTFOR		JSR POPREAL
JSR SGNFAC
STA TMP_REG		; store sign
BCC FFPOSSTEP
LDA #<REAL_CONST_MINUS_ONE	; negative...negate it
LDY #>REAL_CONST_MINUS_ONE
JSR MEMARG	; to ARG
JSR FACMUL	; MUL
FFPOSSTEP	JSR FACWORD	; to WORD
STY TMP2_ZP
STA TMP2_ZP+1	; step
LDA A_REG
LDY A_REG+1
JSR REALFAC
JSR FACWORD
STY TMP_ZP
STA TMP_ZP+1	; from
JSR POPREAL
JSR FACWORD
STY TMP2_ZP+2
STA TMP2_ZP+3	; end
JSR XREGFAC
JSR FACINT
STY TMP3_ZP		; value
LDA TMP2_ZP+1
BNE STEPNOTONE
LDA TMP2_ZP
CMP #$1
BNE STEPNOTONE
JMP STEPONE
STEPNOTONE	LDA TMP_REG
BEQ FFSTEPZERO
ROL
FFSTEPZERO	BCC FFSTEPPOS
FFSTEPNEG	LDY #0
LDA TMP3_ZP
TAX
FFNEGLOOP	TXA
STA (TMP_ZP),Y
LDA TMP_ZP
SEC
SBC TMP2_ZP
STA TMP_ZP
LDA TMP_ZP+1
BCS	FFNEGSKIP
SBC TMP2_ZP+1
STA TMP_ZP+1
FFNEGSKIP	CMP TMP2_ZP+3
BEQ FFNEGCHECK2
BCS FFNEGLOOP
JMP FFDONE
FFNEGCHECK2	LDA TMP_ZP
CMP TMP2_ZP+2
BCS FFNEGLOOP
JMP FFDONE
FFSTEPPOS	LDY #0
LDA TMP3_ZP
TAX
FFPOSLOOP	TXA
STA (TMP_ZP),Y
LDA TMP_ZP
CLC
ADC TMP2_ZP
STA TMP_ZP
LDA TMP_ZP+1
BCC	FFPOSSKIP
ADC TMP2_ZP+1
STA TMP_ZP+1
FFPOSSKIP	CMP TMP2_ZP+3
BCC FFPOSLOOP
BEQ FFPOSCHECK2
JMP FFDONE
FFPOSCHECK2	LDA TMP_ZP
CMP TMP2_ZP+2
BCC FFPOSLOOP
BEQ FFPOSLOOP
FFDONE		LDY TMP_ZP
LDA TMP_ZP+1
JSR INTFAC
LDX A_REG
LDY A_REG+1
LDA #1
STA A_REG
JMP FACMEM		; Store end value in loop variable
; Special routine for step=1/-1
STEPONE	LDA TMP_REG
BEQ OFFSTEPZERO
ROL
OFFSTEPZERO	BCC OFFSTEPPOS
OFFSTEPNEG	LDY #0
LDA TMP3_ZP
TAX
OFFNEGLOOP	TXA
STA (TMP_ZP),Y
LDA TMP_ZP
BNE ONOOVERFLOW
DEC TMP_ZP+1
ONOOVERFLOW	DEC TMP_ZP
LDA TMP_ZP+1
OFFNEGSKIP	CMP TMP2_ZP+3
BEQ OFFNEGCHECK2
BCS OFFNEGLOOP
JMP FFDONE
OFFNEGCHECK2
LDA TMP_ZP
CMP TMP2_ZP+2
BCS OFFNEGLOOP
JMP FFDONE
OFFSTEPPOS	LDY #0
LDA TMP3_ZP
TAX
OFFPOSLOOP	TXA
STA (TMP_ZP),Y
INC TMP_ZP
BNE ONOOVERFLOW2
INC TMP_ZP+1
ONOOVERFLOW2
LDA TMP_ZP+1
OFFPOSSKIP	CMP TMP2_ZP+3
BCC OFFPOSLOOP
BEQ OFFPOSCHECK2
JMP FFDONE
OFFPOSCHECK2
LDA TMP_ZP
CMP TMP2_ZP+2
BCC OFFPOSLOOP
BEQ OFFPOSLOOP
JMP FFDONE
;###################################
;###################################
STR			JSR YREGFAC
STRINT		LDY #1
JSR FACSTR
LDY #0
STY TMP_ZP+1
LDA #LOFBUF
STA TMP_ZP
DEY
STRLOOP		INY
LDA LOFBUFH,Y
BNE STRLOOP
STY LOFBUF
TYA
TAX			; Length in X
LDA #<A_REG
LDY #>A_REG
STA TMP2_ZP
STY TMP2_ZP+1
JMP COPYONLY
;###################################
;###################################
VAL			LDA B_REG
STA INDEX1
LDA B_REG+1
STA INDEX1+1
LDY #0
STY VALTYPE
LDA (INDEX1),Y
BNE	DOACVAL
JMP ZEROSET
DOACVAL		TAY
INC INDEX1
BNE VALSTR
INC INDEX1+1
VALSTR		JSR VALS
JMP FACXREG	;RTS is implicit
;###################################
;###################################
LEN			LDA B_REG
STA TMP_ZP
LDA B_REG+1
STA TMP_ZP+1
LDY #0
LDA (TMP_ZP),Y
BEQ ZEROLEN
TAY
LDA #0
JSR INTFAC
JMP FACXREG	;RTS is implicit
ZEROLEN		JMP ZEROSET
;###################################
;###################################
ASC			LDA B_REG
STA TMP_ZP
LDA B_REG+1
STA TMP_ZP+1
LDY #0
LDA (TMP_ZP),Y
BNE DOASC
JMP ILLEGALQUANTITY
DOASC		INY
LDA (TMP_ZP),Y
TAY
LDA #0
JSR INTFAC
JMP FACXREG
;###################################
;###################################
CHRINT		TAX
LDA STRBUFP
STA TMP_ZP
STA A_REG
LDA STRBUFP+1
STA TMP_ZP+1
STA A_REG+1
LDA #1
LDY #0
STA (TMP_ZP),Y
TXA
INY
STA (TMP_ZP),Y
LDA STRBUFP
CLC
ADC #2
STA STRBUFP
BCC NOCHR2
INC STRBUFP+1
NOCHR2		RTS
;###################################
;###################################
SAVEPOINTERS
LDA TMP_ZP			; ...save the pointers
STA STORE1
LDA TMP_ZP+1
STA STORE1+1
LDA TMP2_ZP
STA STORE2
LDA TMP2_ZP+1
STA STORE2+1
LDA TMP3_ZP
STA STORE3
LDA TMP3_ZP+1
STA STORE3+1
RTS
;###################################
;###################################
RESTOREPOINTERS
LDA STORE3+1		; ...restore the pointers
STA TMP3_ZP+1
LDA STORE3
STA TMP3_ZP
LDA STORE2+1
STA TMP2_ZP+1
LDA STORE2
STA TMP2_ZP
LDA STORE1+1
STA TMP_ZP+1
LDA STORE1
STA TMP_ZP
RTS
;###################################
;###################################
; This check is called in places, where the actual source's length is unknown.
; So we compact assuming the maximum string length of 255. It's not ideal this way
; but it's better than what we did before: Read some random length out of whatever
; memory location TMP_ZP/TMP_ZP+1 was pointing to...
COMPACTMAX
LDA #$FF
LDY #$0
JMP COMPACTF
;###################################
;###################################
COMPACT
LDY #0
GCBUFNE		LDA (TMP_ZP),Y		; Get the source's length
COMPACTF	STA TMP4_REG		; ...and store it
LDY STRBUFP+1		; First, check if the new string would fit into memory...
STY TMP4_REG+1		; For that, we have to calculate the new strbufp after adding the string
INY					; add 1 to the high byte to check, if at least 256 bytes are free (fast path)
BEQ ENDMEM			; actually, if this happens, all went wrong anyway...whatever...
CPY ENDSTRBUF+1		; check, if there are at least 256 bytes free. If there are, no detailed check is needed...
BCC RGCEXIT			; there are? We are out then.
ENDMEM		LDA STRBUFP
CLC
ADC TMP4_REG
STA TMP4_REG
BCC	RGCNOOV1
INC TMP4_REG+1
RGCNOOV1	CLC
LDA TMP4_REG
ADC #3
STA TMP4_REG
BCC	RGCNOOV2
INC TMP4_REG+1
RGCNOOV2	LDA TMP4_REG+1		; Now do the actual check
CMP ENDSTRBUF+1
BEQ RGCLOW1
BCS GCEXECOMP		; Doesn't fit, run GC!
JMP RGCEXIT
RGCLOW1		LDA TMP4_REG
CMP ENDSTRBUF
BCS	GCEXECOMP		; This also triggers if it would fit exactly...but anyway...
RGCEXIT		RTS					; It fits? Then exit without GC
;###################################
;###################################
GCEXECOMP	LDA STRBUFP
STA STORE4
LDA STRBUFP+1
STA STORE4+1
JSR GCEXE
JMP CHECKMEMORY
;###################################
;###################################
GCEXE		JSR SAVEPOINTERS
LDA #0
STA LASTVAR
STA LASTVAR+1		; reset the last variable pointer to 0
LDA #<STRBUF
STA TMP_ZP
STA GCSTART
LDA #>STRBUF
STA TMP_ZP+1		; Pointer into the string memory, initialized to point at the start...
STA GCSTART+1
GCLOOP		LDY #0
LDA TMP_ZP
STA GCWORK
LDA TMP_ZP+1
STA GCWORK+1		; store the pointer for later use...
LDA (TMP_ZP),Y
STA GCLEN			; store the length
INC TMP_ZP
BNE GCLOOPNOOV
INC TMP_ZP+1
GCLOOPNOOV	LDA TMP_ZP
CLC
ADC GCLEN
STA TMP_ZP
BCC GCLOOPNOOV2
INC TMP_ZP+1		; TMP_ZP now points to the reference to the string variable that used this chunk once
GCLOOPNOOV2 LDY #0
LDA (TMP_ZP),Y
STA TMP2_ZP
INY
LDA (TMP_ZP),Y
STA TMP2_ZP+1		; Store the variable reference in TMP2_ZP
LDA TMP_ZP
CLC
ADC #2
STA TMP_ZP
BCC GCLOOPNOOV3
INC TMP_ZP+1		; adjust the pointer to point to the next entry
GCLOOPNOOV3 LDY #0
LDA (TMP2_ZP),Y
CMP GCWORK
BNE GCKLOOP
INY
LDA (TMP2_ZP),Y
CMP GCWORK+1
BEQ MEMFREE
GCKLOOP		LDA TMP_ZP+1		; Check if we have processed all of the string memory...
CMP HIGHP+1
BEQ GCHECKLOW
BCC GCLOOP
JMP GCDONE
GCHECKLOW	LDA TMP_ZP
CMP HIGHP
BCS GCDONE
JMP GCLOOP
MEMFREE		LDA GCSTART			; found a variable that points to this chunk...
CMP GCWORK			; ...then check if the can be copied down. This is the case if GCSTART!=GCWORK
BNE COPYDOWN
LDA GCSTART+1
CMP GCWORK+1
BNE COPYDOWN
LDA TMP_ZP			; GCSTART==GCWORK...adjust GCSTART and continue
STA GCSTART
LDA TMP_ZP+1
STA GCSTART+1
JMP	GCKLOOP			; continue if needed...
COPYDOWN	LDA GCSTART			; There's a gap in memory, so copy the found variable down to GCSTART and adjust GCSTART accordingly
STA TMP_REG
LDA GCSTART+1
STA TMP_REG+1		; set the target location...
LDA GCWORK
STA TMP2_REG
LDA GCWORK+1
STA TMP2_REG+1		; set the source location...
LDA TMP_ZP
SEC
SBC GCWORK
STA TMP3_REG
LDA TMP_ZP+1
SBC GCWORK+1
STA TMP3_REG+1		; set the length
LDA GCSTART
CLC
ADC TMP3_REG
STA GCSTART
LDA GCSTART+1
ADC TMP3_REG+1
STA GCSTART+1		; update GCSTART to point to the next free chunk
JSR QUICKCOPY		; copy the chunk down to (former, now stored in TMP_REG) GCSTART
LDY #0
LDA TMP_REG
STA (TMP2_ZP),Y
INY
LDA TMP_REG+1
STA (TMP2_ZP),Y		; ...and adjust the pointer to the memory in the variable to that new location
JMP GCKLOOP
GCDONE		LDA GCSTART
STA HIGHP
STA STRBUFP
LDA GCSTART+1
STA HIGHP+1
STA STRBUFP+1		; Update the string pointers to the new, hopefully lower position
GCSKIP		JSR RESTOREPOINTERS
RTS					; Remember: GC has to adjust highp as well!
;###################################
;###################################
CHECKMEMORY
LDA STRBUFP+1		; Check if we are out of memory even after a garbage collection.
CMP STORE4+1		; This is indicated by the string pointer being still equal or higher
BCC STILLFITSCM		; than before the GC. We are not checking against the actual memory limit,
; because the GC stops before reaching it, leaving all unhandled variables
; untouched. That's because we can't free anything more if we've already reached
; the limit. But there's no direct indicator of this, so we use this indirect one.
BEQ CHECKMEMLOWCM
JMP OUTOFMEMORY		; STRBUFP>last value? OOM!
CHECKMEMLOWCM
LDA STRBUFP			; High bytes are equal? Check low bytes
CMP STORE4
BCC	STILLFITSCM
JMP OUTOFMEMORY		; No? OOM
STILLFITSCM RTS
;###################################
;###################################
QUICKCOPY	LDA TMP_REG		; a self modifying copy routine
STA TMEM+1
LDA TMP_REG+1
STA TMEM+2
LDA TMP2_REG
STA SMEM+1
LDA TMP2_REG+1
STA SMEM+2
LDY #$0
LDX TMP3_REG
BNE QCLOOP
LDA TMP3_REG+1
BEQ QCEXIT		; length is null, nothing to copy
QCLOOP
SMEM		LDA $0000,Y
TMEM		STA $0000,Y
INY
BNE YNOOV
INC TMEM+2
INC SMEM+2
YNOOV		DEX
BNE QCLOOP
LDA TMP3_REG+1
BEQ QCEXIT
DEC TMP3_REG+1
JMP QCLOOP
QCEXIT		RTS
;###################################
;###################################
COPYSTRING	STA TMP2_ZP
STY TMP2_ZP+1
CPY TMP_ZP+1
BNE CONTCOPY
LDA TMP2_ZP
CMP TMP_ZP
BNE CONTCOPY
RTS					; A copy from a variable into the same instance is pointless an will be ignored.
CONTCOPY	JSR COMPACT			; Do a GC if needed
LDY #0
STY TMP_FLAG
LDA (TMP_ZP),Y
BNE NOTEMPTYSTR
LDA #<EMPTYSTR		; The source is empty? Then assign the empty string constant instead
STA TMP_ZP
LDA #>EMPTYSTR
STA TMP_ZP+1
JMP ISCONST
NOTEMPTYSTR	TAX					; Store the length of the source in X...this is valid until right to the end, where it's not longer used anyway
LDA (TMP2_ZP),Y
STA TMP3_ZP
INY
LDA (TMP2_ZP),Y
STA TMP3_ZP+1
DEY
LDA TMP_ZP+1		; Check if the source is a constant (upper bound). If so, don't copy it but just point to it
CMP #>CONSTANTS_END
BEQ CHECKLOW1
BCS INVAR
JMP CHECKNEXT
CHECKLOW1	LDA TMP_ZP
CMP #<CONSTANTS_END
BCS INVAR
CHECKNEXT	LDA TMP_ZP+1		; Check if the source is a constant (lower bound). If so, don't copy it but just point to it
CMP #>CONSTANTS
BEQ CHECKLOW3
BCC INVAR
JMP ISCONST
CHECKLOW3	LDA TMP_ZP
CMP #<CONSTANTS
BCC INVAR			; No, it's not a constant. It's something from lower memory...
ISCONST		JSR CHECKLASTVAR	; Reclaim formerly used memory if possible
LDA TMP_ZP
STA (TMP2_ZP),Y		; Yes, it's a constant...
INY
LDA TMP_ZP+1
STA (TMP2_ZP),Y
LDA HIGHP			; Reset the memory pointer to the last assigned one. Everything that came later has to be temp. data
STA STRBUFP
LDA HIGHP+1
STA STRBUFP+1
RTS
INVAR		INY
LDA (TMP2_ZP),Y		; Check if the target is currently pointing into the constant pool. If so, don't update that memory by accident
CMP #>CONSTANTS_END
BEQ CHECKLOW2
BCS INVAR2
JMP PUPDATEPTR
CHECKLOW2	DEY
LDA (TMP2_ZP),Y
CMP #<CONSTANTS_END
BCS INVAR2
JMP PUPDATEPTR
INVAR2		LDY #0			; The target is somewhere in var memory (i.e. not in constant memory)
LDA (TMP3_ZP),Y
STA TMP_REG
TXA
CMP TMP_REG		; Compare the string-to-copy's length (in A) with the variable's current one (in TMP_REG)
BEQ UPDATEHP2	; does the new string fit into the old memory location (i.e. is it the same length)?
; Shorter strings would fit as well, but aren't stored this way or otherwise, the result would
; be some stray memory chunk that none could identify properly when doing a GC
PUPDATEPTR	JSR CHECKLASTVAR
LDY #1			; No? Then new memory has to be used. Update the "highest memory position" in the process
STY TMP_FLAG	; to regain temp. memory used for non-assigned strings like for printing and such...
JMP UPDATEPTR	; ...we set a flag here to handle this case later
UPDATEHP2	LDA HIGHP		; Update the memory pointer to the last assigned position, reclaim some memory this way
STA STRBUFP
LDA HIGHP+1
STA STRBUFP+1
JMP STRFITS
COPYONLY	LDY #0
STY TMP_FLAG
JMP CHECKMEM
ALTCOPY		JMP COPYSTRING2
UPDATEPTR	LDA TMP_ZP+1	; Check if the new string comes after or equals highp, which indicates that it can be
CMP HIGHP+1		; "copied down". This is another routine, because of...reasons...
BEQ CHECKXT1
BCS ALTCOPY
JMP CHECKMEM
CHECKXT1	LDA TMP_ZP
CMP HIGHP
BCS ALTCOPY
CHECKMEM
MEMOK		LDY #0
LDA STRBUFP		; no, then copy it into string memory later...
STA (TMP2_ZP),Y	; ...but update the string memory pointer now
STA TMP3_ZP
LDA STRBUFP+1
INY
STA (TMP2_ZP),Y
STA TMP3_ZP+1
TXA
CLC
ADC STRBUFP
PHP
CLC
ADC #3
STA STRBUFP
BCC NOCS1
INC STRBUFP+1
NOCS1		PLP
BCC STRFITS
INC STRBUFP+1
STRFITS		LDY TMP_FLAG	; Check if the pointer to the highest mem addr is used by an actual string
BEQ NOHPUPDATE	; has to be updated and do that...
LDA HIGHP+1
CMP STRBUFP+1
BCC UPDATEHIGHP
BEQ CHECKNEXTHP
JMP NOHPUPDATE
CHECKNEXTHP	LDA HIGHP
CMP	STRBUFP
BCC UPDATEHIGHP
JMP NOHPUPDATE
UPDATEHIGHP	LDA STRBUFP
STA HIGHP
LDA STRBUFP+1
STA HIGHP+1		; set new pointer
JSR REMEMBERLASTVAR
JSR STOREVARREF
NOHPUPDATE	LDY #0
LDA (TMP_ZP),Y	; Set the new length...
STA (TMP3_ZP),Y
TAY				; Copy length to Y
BEQ	EXITCOPY	; Length 0? nothing to copy then...
LOOP		LDA (TMP_ZP),Y	; Copy the actual string
STA (TMP3_ZP),Y
DEY
BNE LOOP
EXITCOPY	RTS
;###################################
;###################################
; Special copy routine that handles the case that a string is >highp but might interleave with the temp data that has to be copied into it.
; Therefor, this routine copies from lower to higher addresses and not vice versa like the simpler one above.
COPYSTRING2	LDY #0
LDA (TMP_ZP),Y
STA TMP_REG
TAX
LDA HIGHP
STA TMP3_ZP
STA (TMP2_ZP),Y
LDA HIGHP+1
STA TMP3_ZP+1
INY
STA (TMP2_ZP),Y
JSR REMEMBERLASTVAR
; Do a quick test, if a real copy is needed or if the memory addrs are equal anyway?
; This introduces some overhead but according to my tests, its actually faster this way.
LDA TMP_ZP
CMP TMP3_ZP
BNE DOLOOP
LDA TMP_ZP+1
CMP TMP3_ZP+1
BEQ SKIPCP2
DOLOOP		DEY
TXA
STA (TMP3_ZP),Y
INY
ASLOOP		LDA (TMP_ZP),Y
STA (TMP3_ZP),Y
INY
DEX
BNE	ASLOOP
SKIPCP2		LDA HIGHP
CLC
ADC TMP_REG
PHP
CLC
ADC #3
STA HIGHP
STA STRBUFP
BCC SKIPLOWAS1
INC HIGHP+1
SKIPLOWAS1	PLP
BCC SKIPLOWAS2
INC HIGHP+1
SKIPLOWAS2	LDA HIGHP+1
STA STRBUFP+1
JSR STOREVARREF
RTS
;###################################
;###################################
; Checks if this variable is the same one that has been stored last. If so, we can reclaim its memory first.
CHECKLASTVAR
LDA TMP2_ZP
CMP LASTVAR
BNE NOTSAMEVAR
LDA TMP2_ZP+1
CMP LASTVAR+1
BNE NOTSAMEVAR
LDA LASTVARP			; The target is the last string that has been added. We can free it's currently used memory then.
STA HIGHP
STA STRBUFP
LDA LASTVARP+1
STA HIGHP+1
STA STRBUFP+1
NOTSAMEVAR	RTS
;###################################
;###################################
; Stores the last variable reference that has been stored in string memory.
REMEMBERLASTVAR
LDA TMP2_ZP
STA LASTVAR
LDA TMP2_ZP+1
STA LASTVAR+1
LDA TMP3_ZP
STA LASTVARP
LDA TMP3_ZP+1
STA LASTVARP+1	; Remember this variable as the last written one
RTS
;###################################
;###################################
; Appends a reference to the variable at the end of the string in memory for
; easier GC later...
STOREVARREF
TYA
PHA				; Save Y reg
LDA TMP_ZP
PHA
LDA TMP_ZP+1
PHA
LDA HIGHP+1
STA TMP_ZP+1
LDA HIGHP
SEC
SBC #2
STA TMP_ZP
BCS RLVNOOV
DEC TMP_ZP+1
RLVNOOV		LDA TMP2_ZP
LDY #0
STA (TMP_ZP),Y
LDA TMP2_ZP+1
INY
STA (TMP_ZP),Y	; Store the reference to the variable that uses this chunk of memory at the end of the string
PLA
STA TMP_ZP+1
PLA
STA TMP_ZP		; ...restore TMP_ZP
PLA
TAY				; ...restore Y reg
RTS
;###################################
;###################################
REROUTE		LDA CMD_NUM		; if CMD mode, enable channel output
BEQ REROUTECMD
TAX
STA CHANNEL
JMP CHKOUT
REROUTECMD	RTS
;###################################
;###################################
RESETROUTE	LDA CMD_NUM		; if CMD mode, disable channel output
BEQ RESETROUTECMD
JMP CLRCHNEW
RESETROUTECMD
RTS
;###################################
;###################################
REALOUT		JSR REROUTE
LDA X_REG
BNE RNOTNULL
JMP PRINTNULL
RNOTNULL	JSR XREGFAC
REALOUTINT	LDY #0
JSR FACSTR
LDY #0
LDA LOFBUF,Y
STRLOOPRO	JSR CHROUT
INY
LDA LOFBUF,Y
BNE STRLOOPRO
JSR RESETROUTE
RTS
;###################################
;###################################
PRINTNULL	JSR REROUTE
LDA #$20
JSR CHROUT
LDA #$30
JSR CHROUT
JMP RESETROUTE
;###################################
;###################################
STROUTWL	STA A_REG
STY A_REG+1
STROUT		JSR REROUTE
LDA A_REG
STA INDEX1
LDA A_REG+1
STA INDEX1+1
LDY #0
LDA (INDEX1),Y
TAX
INC INDEX1
BNE PRINTSTR
INC INDEX1+1
PRINTSTR	JSR PRINTSTRS
LDA HIGHP			; Update the memory pointer to the last actually assigned one
STA STRBUFP
LDA HIGHP+1
STA STRBUFP+1
JSR RESETROUTE
RTS
;###################################
;###################################
SINGLECHROUTBRK
STA TMP_ZP
JSR REROUTE
LDA TMP_ZP
JSR CHROUT
LDA #$0D
JSR CHROUT
JMP RESETROUTE
;###################################
;###################################
SINGLECHROUT
STA TMP_ZP
JSR REROUTE
LDA TMP_ZP
JSR CHROUT
JMP RESETROUTE
;###################################
;###################################
STROUTBRKWL	STA A_REG
STY A_REG+1
STROUTBRK	JSR REROUTE
LDA A_REG
STA INDEX1
LDA A_REG+1
STA INDEX1+1
LDY #0
LDA (INDEX1),Y
TAX
INC INDEX1
BNE PRINTSTR2
INC INDEX1+1
PRINTSTR2	JSR PRINTSTRS
LDA HIGHP			; Update the memory pointer to the last actually assigned one
STA STRBUFP
LDA HIGHP+1
STA STRBUFP+1
LDA #$0D
JSR CHROUT
JMP RESETROUTE 	;RTS is implicit
;###################################
;###################################
ARRAYACCESS_STRING
JSR XREGFAC
JSR FACINT
ARRAYACCESS_STRING_INT
LDX G_REG
STX TMP_ZP
LDX G_REG+1
STX TMP_ZP+1
TAX
TYA
ASL
STA TMP2_ZP
TXA
ROL
STA TMP2_ZP+1
LDA TMP_ZP
CLC
ADC TMP2_ZP
STA TMP_ZP
LDA TMP_ZP+1
ADC TMP2_ZP+1
STA TMP_ZP+1
LDY #0
LDA (TMP_ZP),Y
STA A_REG
INY
LDA (TMP_ZP),Y
STA A_REG+1
RTS
;###################################
;###################################
ARRAYACCESS_INTEGER_SI
STA G_REG
STY G_REG+1
JSR XREGFAC
JSR FACINT
ARRAYACCESS_INTEGER_INT_SI
LDX G_REG
STX TMP_ZP
LDX G_REG+1
STX TMP_ZP+1
TAX
TYA
ASL
STA TMP2_ZP
TXA
ROL
STA TMP2_ZP+1
LDA TMP_ZP
CLC
ADC TMP2_ZP
STA TMP_ZP
LDA TMP_ZP+1
ADC TMP2_ZP+1
STA TMP_ZP+1
LDY #1
LDA (TMP_ZP),Y
TAX
DEY
LDA (TMP_ZP),Y
TAY
TXA
RTS
;###################################
;###################################
ARRAYACCESS_INTEGER_S
STA G_REG
STY G_REG+1
ARRAYACCESS_INTEGER
JSR XREGFAC
ARRAYACCESS_INTEGER_NX
JSR FACINT
ARRAYACCESS_INTEGER_INT
LDX G_REG
STX TMP_ZP
LDX G_REG+1
STX TMP_ZP+1
TAX
TYA
ASL
STA TMP2_ZP
TXA
ROL
STA TMP2_ZP+1
LDA TMP_ZP
CLC
ADC TMP2_ZP
STA TMP_ZP
LDA TMP_ZP+1
ADC TMP2_ZP+1
STA TMP_ZP+1
LDY #1
LDA (TMP_ZP),Y
TAX
DEY
LDA (TMP_ZP),Y
TAY
TXA
STY TMP2_ZP		; Store for integer optimization later on
STA TMP2_ZP+1
JSR INTFAC
JMP FACXREG	;RTS is implicit
;###################################
;###################################
ARRAYACCESS_REAL_S
STA G_REG
STY G_REG+1
ARRAYACCESS_REAL
JSR XREGFAC
JSR FACINT
ARRAYACCESS_REAL_INT
LDX G_REG
STX TMP_ZP
LDX G_REG+1
STX TMP_ZP+1
STY TMP3_ZP
STA TMP3_ZP+1
TAX
TYA
ASL
TAY
TXA
ROL
TAX
TYA
ASL
STA TMP2_ZP
TXA
ROL
STA TMP2_ZP+1
LDA TMP_ZP
CLC
ADC TMP3_ZP
STA TMP_ZP
LDA TMP_ZP+1
ADC TMP3_ZP+1
STA TMP_ZP+1
LDA TMP_ZP
CLC
ADC TMP2_ZP
STA TMP3_ZP
LDA TMP_ZP+1
ADC TMP2_ZP+1
STA TMP3_ZP+1
JMP COPY2_XY_XREG
;###################################
;###################################
ARRAYSTORE_STRING
JSR XREGFAC
JSR FACINT
ARRAYSTORE_STRING_INT
LDX G_REG
STX TMP_ZP
LDX G_REG+1
STX TMP_ZP+1
TAX
TYA
ASL
STA TMP2_ZP
TXA
ROL
STA TMP2_ZP+1
LDA TMP_ZP
CLC
ADC TMP2_ZP
TAX
LDA TMP_ZP+1
ADC TMP2_ZP+1
TAY
LDA A_REG
STA TMP_ZP
LDA A_REG+1
STA TMP_ZP+1
TXA
JMP COPYSTRING	; RTS is implicit
;###################################
;###################################
ARRAYSTORE_INT_INTEGER
JSR XREGFAC
JSR FACINT
LDX G_REG
STX TMP_ZP
LDX G_REG+1
STX TMP_ZP+1
TAX
TYA
ASL
STA TMP2_ZP
TXA
ROL
STA TMP2_ZP+1
LDA TMP_ZP
CLC
ADC TMP2_ZP
STA TMP_ZP
LDA TMP_ZP+1
ADC TMP2_ZP+1
STA TMP_ZP+1
LDY #1
LDA AS_TMP+1
STA (TMP_ZP),Y
DEY
LDA AS_TMP
STA (TMP_ZP),Y
RTS
;###################################
;###################################
ARRAYSTORE_INTEGER
JSR XREGFAC
ARRAYSTORE_INTEGER_NX
JSR FACINT
ARRAYSTORE_INTEGER_INT
LDX G_REG
STX TMP_ZP
LDX G_REG+1
STX TMP_ZP+1
TAX
TYA
ASL
STA TMP2_ZP
TXA
ROL
STA TMP2_ZP+1
LDA TMP_ZP
CLC
ADC TMP2_ZP
STA TMP_ZP
LDA TMP_ZP+1
ADC TMP2_ZP+1
STA TMP_ZP+1
JSR YREGFAC
JSR FACINT
STY TMP3_ZP
LDY #1
STA (TMP_ZP),Y
DEY
LDA TMP3_ZP
STA (TMP_ZP),Y
RTS
;###################################
;###################################
ARRAYSTORE_REAL
JSR XREGFAC
JSR FACINT
ARRAYSTORE_REAL_INT
LDX G_REG
STX TMP_ZP
LDX G_REG+1
STX TMP_ZP+1
STY TMP3_ZP
STA TMP3_ZP+1
TAX
TYA
ASL
TAY
TXA
ROL
TAX
TYA
ASL
STA TMP2_ZP
TXA
ROL
STA TMP2_ZP+1
LDA TMP_ZP
CLC
ADC TMP3_ZP
STA TMP_ZP
LDA TMP_ZP+1
ADC TMP3_ZP+1
STA TMP_ZP+1
LDA TMP_ZP
CLC
ADC TMP2_ZP
STA TMP_ZP
LDA TMP_ZP+1
ADC TMP2_ZP+1
STA TMP_ZP+1
JMP COPY2_YREG_XYA	;RTS is implicit
;###################################
;###################################
ADJUSTSTACK LDA FORSTACKP	; Adjust the FORSTACK in case a new loop uses an unclosed old one (i.e. the code jumped out of that loop with goto)
STA TMP_ZP
LDA FORSTACKP+1
STA TMP_ZP+1
ADSEARCHFOR	LDA TMP_ZP
CMP #<FORSTACK
BNE ADJUST2
LDA TMP_ZP+1
CMP #>FORSTACK
BNE ADJUST2
RTS				; Start of Stack reached? Return
ADJUST2		LDA TMP_ZP
SEC
SBC #2
STA TMP_ZP
BCS ADNOPV1N1
DEC TMP_ZP+1
ADNOPV1N1	LDY #0
LDA (TMP_ZP),Y
BNE ADNOGOSUB
RTS				; Encountered a GOSUB on the way? Then return (is this correct?)
ADNOGOSUB
INY
LDA TMP_ZP
SEC
SBC (TMP_ZP),Y
STA TMP_ZP
BCS ADNOPV1N2
DEC TMP_ZP+1
ADNOPV1N2	DEY
LDA A_REG
ADCMPFOR	CMP (TMP_ZP),Y
BNE ADSEARCHFOR
LDA A_REG+1
INY
CMP (TMP_ZP),Y
BEQ ADFOUNDFOR
JMP ADSEARCHFOR
ADLOW0		LDX A_REG+1
BEQ ADFOUNDFOR
BNE ADCMPFOR
ADFOUNDFOR	LDA TMP_ZP		; Adjust the stack so that it points onto the last entry for the "new" loop variable
STA FORSTACKP
LDA TMP_ZP+1
STA FORSTACKP+1
RTS
;###################################
;###################################
INITFOR		JSR ADJUSTSTACK
LDA FORSTACKP
STA TMP_ZP
LDA FORSTACKP+1
STA TMP_ZP+1
LDY #0
LDA A_REG
STA (TMP_ZP),Y
INY
LDA A_REG+1
STA (TMP_ZP),Y
INY
LDA JUMP_TARGET
STA (TMP_ZP),Y
INY
LDA JUMP_TARGET+1
STA (TMP_ZP),Y
INY
STY TMP3_ZP
JSR INCTMPZP
JSR POPREAL
LDX TMP_ZP
LDY TMP_ZP+1
; FAC to (X/Y)
JSR FACMEM
JSR SGNFAC
STA TMP_FLAG
LDY #5
STY TMP3_ZP
JSR INCTMPZP
JSR POPREAL
LDX TMP_ZP
LDY TMP_ZP+1
; FAC to (X/Y)
JSR FACMEM
LDY #5
STY TMP3_ZP
JSR INCTMPZP
LDY #0
LDA TMP_FLAG
STA (TMP_ZP),Y
INY
LDA #1
STA (TMP_ZP),Y
INY
LDA #15
STA (TMP_ZP),Y
LDY #3
STY TMP3_ZP
JSR INCTMPZP
LDA TMP_ZP
STA FORSTACKP
LDA TMP_ZP+1
STA FORSTACKP+1
RTS
;###################################
;###################################
NEXT		LDA FORSTACKP
STA TMP_ZP
LDA FORSTACKP+1
STA TMP_ZP+1
SEARCHFOR	LDA TMP_ZP+1
STA TMP3_REG+1
LDA TMP_ZP
STA TMP3_REG
SEC
SBC #2
STA TMP_ZP
BCS NOPV1N1
DEC TMP_ZP+1
NOPV1N1		LDY #0
LDA (TMP_ZP),Y
BNE NOGOSUB
JMP NEXTWOFOR
NOGOSUB
INY
LDA TMP_ZP
SEC
SBC (TMP_ZP),Y
STA TMP_ZP
BCS NOPV1N2
DEC TMP_ZP+1
NOPV1N2		DEY
LDA A_REG
BEQ LOW0
CMPFOR		CMP (TMP_ZP),Y
BNE SEARCHFOR
LDA A_REG+1
INY
CMP (TMP_ZP),Y
BEQ FOUNDFOR
JMP SEARCHFOR
LOW0		LDX A_REG+1
BEQ FOUNDFOR
BNE CMPFOR
FOUNDFOR	LDA TMP_ZP
STA TMP2_REG
LDA TMP_ZP+1
STA TMP2_REG+1
VARREAL
LDY #0
STY A_REG+1 ; Has to be done anyway...so we can do it here as well
LDA (TMP_ZP),Y
TAX
INY
LDA (TMP_ZP),Y
TAY
TXA
JSR REALFAC
CALCNEXT	LDA TMP_ZP
CLC
ADC #4
STA TMP_ZP
BCC NOPV2IN
INC TMP_ZP+1
NOPV2IN		STA TMP_REG
LDY TMP_ZP+1
STY TMP_REG+1
JSR FASTFADDMEM
; Optimizer rule: Fast FADD (MEM)/1
LDA TMP2_REG
STA TMP_ZP
LDA TMP2_REG+1
STA TMP_ZP+1
STOREREAL
LDY #0
LDA (TMP_ZP),Y
TAX
INY
LDA (TMP_ZP),Y
TAY
JSR FACMEM	;FAC TO (X/Y)
CMPFOR		LDA #5
STA TMP3_ZP
LDA TMP_REG
CLC
ADC #5
STA TMP_REG
BCC NOPV3
INC TMP_REG+1
NOPV3		LDY TMP_REG+1
JSR CMPFAC 	;CMPFAC
BEQ LOOPING
PHA
LDY #14
LDA (TMP_ZP),Y
BEQ STEPZERO
ROL
BCC STEPPOS
STEPNEG		PLA
ROL
BCC LOOPING
BCS EXITLOOP
STEPPOS		PLA
ROL
BCC EXITLOOP
LOOPING		LDA TMP3_REG
STA FORSTACKP
LDA TMP3_REG+1
STA FORSTACKP+1
LDA TMP2_REG
CLC
ADC #2
STA TMP2_REG
BCC NOPV4IN
INC TMP2_REG+1
NOPV4IN		LDY #0
STY A_REG
STA TMP_ZP
LDA TMP2_REG+1
STA TMP_ZP+1
LDA (TMP_ZP),Y
STA JUMP_TARGET
INY
LDA (TMP_ZP),Y
STA JUMP_TARGET+1
RTS
STEPZERO	PLA
JMP LOOPING
EXITLOOP	LDA TMP2_REG
STA FORSTACKP
LDA TMP2_REG+1
STA FORSTACKP+1
LDA #1
STA A_REG
RTS
;###################################
;###################################
RETURN		LDA FORSTACKP
STA TMP_ZP
LDA FORSTACKP+1
STA TMP_ZP+1
SEARCHGOSUB	LDA TMP_ZP
SEC
SBC #2
STA TMP_ZP
BCS NOPV1SG
DEC TMP_ZP+1
NOPV1SG		LDY #0
LDA (TMP_ZP),Y
BEQ FOUNDGOSUB
INY
LDA (TMP_ZP),Y
STA TMP3_ZP
LDA TMP_ZP
SEC
SBC (TMP_ZP),Y
STA TMP_ZP
BCS NOPV1GS
DEC TMP_ZP+1
NOPV1GS		JMP SEARCHGOSUB
FOUNDGOSUB
LDA TMP_ZP
STA FORSTACKP
LDA TMP_ZP+1
STA FORSTACKP+1
RTS
;###################################
;###################################
GOSUB		LDA FORSTACKP
STA TMP_ZP
LDA FORSTACKP+1
STA TMP_ZP+1
LDY #0
TYA
STA (TMP_ZP),Y
INY
STA (TMP_ZP),Y
INY
TYA
CLC
ADC TMP_ZP
STA FORSTACKP
BCC GOSUBNOOV
INC FORSTACKP+1
GOSUBNOOV	RTS
;###################################
;###################################
READINIT	LDA DATASP
STA TMP3_ZP
LDA DATASP+1
STA TMP3_ZP+1
LDY #$0
LDA (TMP3_ZP),Y
INC TMP3_ZP
BNE READNOOV
INC TMP3_ZP+1
READNOOV	CMP #$FF
BNE MOREDATA
JMP OUTOFDATA
MOREDATA	RTS
;###################################
;###################################
READADDPTR	STX TMP_REG+1
LDA TMP3_ZP
CLC
ADC TMP_REG+1
STA TMP3_ZP
BCC READADDPTRX
INC TMP3_ZP+1
READADDPTRX	RTS
;###################################
;###################################
READNUMBER	JSR READINIT
MORENUMDATA CMP #$2				; Strings are not allowed here
BNE NUMNUM
LDA (TMP3_ZP),Y		; ...unless they are empty, which makes them count as 0
BEQ RNESTR
CMP #1				; or a "." or "e", which is 0 as well...so length has to be 1..
BEQ STRGNUMCHK
JMP SYNTAXERROR
STRGNUMCHK 	INY
LDA (TMP3_ZP),Y
CMP #46				; ...and really a "."?
BEQ RNESTR2
CMP #69				; ...or really an "e"?
BEQ RNESTR2
JMP SYNTAXERROR
RNESTR2		LDA #0
LDY #0
JSR INTFAC
LDX #2
JSR READADDPTR
JMP NUMREAD
RNESTR		LDA #0
LDY #0
JSR INTFAC
LDX #1
JSR READADDPTR
JMP NUMREAD
NUMNUM		CMP #$1
BEQ NUMREADREAL
CMP #$0
BEQ NUMREADINT
CMP #$4
BCS READNOTYPE
LDA (TMP3_ZP),Y
TAY
JSR BYTEFAC
LDX #1
JSR READADDPTR
JMP NUMREAD			; It's a byte
READNOTYPE	TAY					; It's a byte >3, which mean it has no typing stored to save memory
JSR BYTEFAC
JMP NUMREAD
NUMREADINT	LDA (TMP3_ZP),Y		; It's an integer
STA TMP_REG
INY
LDA (TMP3_ZP),Y
LDY TMP_REG
JSR INTFAC
LDX #2
JSR READADDPTR
JMP NUMREAD
NUMREADREAL	LDA TMP3_ZP
LDY TMP3_ZP+1
JSR REALFAC
LDX #5
JSR READADDPTR
NUMREAD		JSR NEXTDATA
JMP FACYREG		; ...and return
;###################################
;###################################
NEXTDATA	LDA TMP3_ZP			; Adjust pointer to the next element
STA DATASP
LDA TMP3_ZP+1
STA DATASP+1
RTS
;###################################
;###################################
GETSTR		LDA #8
LDY #0
JSR COMPACTF
LDY #0
STY CMD_NUM		; Reset CMD target
JSR GETIN
CMP #0			; Without this compare, it works for disk and keyboard GETs...but not for those from the RS232 port...DOH!
BNE SOMEKEY
NOKEY		LDA #<EMPTYSTR
STA A_REG
LDA #>EMPTYSTR
STA A_REG+1
RTS
SOMEKEY		TAX
LDA STRBUFP
STA TMP_ZP
STA A_REG
LDA STRBUFP+1
STA TMP_ZP+1
STA A_REG+1
LDA #1
LDY #0
STA (TMP_ZP),Y
TXA
LDY #1
STA (TMP_ZP),Y
LDA STRBUFP
CLC
ADC #2
STA STRBUFP
BCC GETSTR1
INC STRBUFP+1
GETSTR1		RTS
;###################################
;###################################
SGTEQ		JSR CMPSTRGTEQ
LDA TMP3_ZP
BNE NOTSGTEQ
LDA #<REAL_CONST_MINUS_ONE
STA TMP3_ZP
LDA #>REAL_CONST_MINUS_ONE
STA TMP3_ZP+1
JMP COPY2_XY_XREG
NOTSGTEQ	JMP ZEROSET
;###################################
;###################################
ZEROSET		LDA #0
STA X_REG
STA X_REG+1
STA X_REG+2
STA X_REG+3
STA X_REG+4
RTS
;###################################
;###################################
SLTEQ		LDA A_REG
LDX B_REG
STX A_REG
STA B_REG
LDA A_REG+1
LDX B_REG+1
STX A_REG+1
STA B_REG+1
JMP SGTEQ
;###################################
;###################################
CMPSTRGTEQ	LDY #0				;Returns 0 if A>=B, something else otherwise
LDX #1
LDA A_REG
STA TMP_ZP
LDA A_REG+1
STA TMP_ZP+1
LDA B_REG
STA TMP2_ZP
LDA B_REG+1
STA TMP2_ZP+1
CMP TMP_ZP+1
BNE CMPSTRSK3
LDA TMP2_ZP
CMP TMP_ZP
BNE CMPSTRSK3
LDX #0
JMP STRSGTEQRES
CMPSTRSK3	LDA (TMP2_ZP),Y
STA TMP3_ZP+1
LDA (TMP_ZP),Y
STA TMP3_ZP
CMP TMP3_ZP+1
BCC DONTSWAPEQ
LDA TMP3_ZP+1
DONTSWAPEQ	TAX
BNE NOTZSTR2
LDX #1
LDA TMP3_ZP+1
CMP TMP3_ZP
BEQ SKIPEQ1
BCS STRSGTEQRES
SKIPEQ1		LDX #0
JMP STRSGTEQRES
NOTZSTR2	INC TMP_ZP
BNE SCGTEQSKP1
INC TMP_ZP+1
SCGTEQSKP1	INC TMP2_ZP
BNE CMPSGTEQLOOP
INC TMP2_ZP+1
CMPSGTEQLOOP
LDA (TMP_ZP),Y
CMP (TMP2_ZP),Y
BEQ SGTEQCONT2
BCC STRSGTEQRES
LDX #0
JMP STRSGTEQRES
SGTEQCONT2	INY
DEX
BNE CMPSGTEQLOOP
LDA TMP3_ZP+1					; All equal so far...decide based on the length then
CMP TMP3_ZP
BEQ STRSGTEQRES
BCC STRSGTEQRES
LDX #1
STRSGTEQRES	STX TMP3_ZP
RTS
;###################################
;###################################
SEQ			JSR CMPSTR
LDA TMP3_ZP
BNE NOTSEQ
LDA #<REAL_CONST_MINUS_ONE
STA TMP3_ZP
LDA #>REAL_CONST_MINUS_ONE
STA TMP3_ZP+1
JMP COPY2_XY_XREG
NOTSEQ		JMP ZEROSET
;###################################
;###################################
SNEQ		JSR CMPSTR
LDA TMP3_ZP
BEQ NOTSEQ
LDA #<REAL_CONST_MINUS_ONE
STA TMP3_ZP
LDA #>REAL_CONST_MINUS_ONE
STA TMP3_ZP+1
JMP COPY2_XY_XREG
;###################################
;###################################
CMPSTR		LDY #0			;Returns 0 if strings are equal, something else otherwise
LDX #1
LDA A_REG
STA TMP_ZP
LDA A_REG+1
STA TMP_ZP+1
LDA B_REG
STA TMP2_ZP
LDA B_REG+1
STA TMP2_ZP+1
CMP TMP_ZP+1
BNE CMPSTRSK1
LDA TMP2_ZP
CMP TMP_ZP
BNE CMPSTRSK1
LDX #0
JMP STRCMPRES
CMPSTRSK1	LDA (TMP_ZP),Y
CMP (TMP2_ZP),Y
BNE STRCMPRES
TAX
BNE NOTZCTR
LDX #0
JMP STRCMPRES
NOTZCTR		INC TMP_ZP
BNE SCSKP1
INC TMP_ZP+1
SCSKP1		INC TMP2_ZP
BNE CMPSTRLOOP
INC TMP2_ZP+1
CMPSTRLOOP	LDA (TMP_ZP),Y
CMP (TMP2_ZP),Y
BNE STRCMPRES
INY
DEX
BNE CMPSTRLOOP
STRCMPRES	STX TMP3_ZP
RTS
;###################################
;###################################
PUSHINT		LDX FPSTACKP
STX TMP2_ZP
LDX FPSTACKP+1
STX TMP2_ZP+1
LDA TMP_ZP
LDY #0
STA (TMP2_ZP),Y
LDA TMP_ZP+1
INY
STA (TMP2_ZP),Y
LDA TMP2_ZP
CLC
ADC #2
STA FPSTACKP
LDA TMP2_ZP+1
ADC #0
STA FPSTACKP+1
RTS
;###################################
;###################################
POPINT		LDA FPSTACKP
SEC
SBC #2
STA FPSTACKP
LDA FPSTACKP+1
SBC #0
STA FPSTACKP+1
LDX FPSTACKP
STX TMP2_ZP
LDX FPSTACKP+1
STX TMP2_ZP+1
LDY #0
LDA (TMP2_ZP),Y
STA TMP_ZP
INY
LDA (TMP2_ZP),Y
STA TMP_ZP+1
RTS
;##################################
;##################################
REALFACPUSH	STA TMP_ZP
STY	TMP_ZP+1
LDX FPSTACKP
LDY FPSTACKP+1
STX TMP2_ZP
STY TMP2_ZP+1
LDY #0
LDA (TMP_ZP),Y
STA (TMP2_ZP),Y
INY
LDA (TMP_ZP),Y
STA (TMP2_ZP),Y
INY
LDA (TMP_ZP),Y
STA (TMP2_ZP),Y
INY
LDA (TMP_ZP),Y
STA (TMP2_ZP),Y
INY
LDA (TMP_ZP),Y
STA (TMP2_ZP),Y
LDA FPSTACKP
CLC
ADC #5
STA FPSTACKP
BCC NOPVRFPXX
INC FPSTACKP+1
NOPVRFPXX	RTS
;###################################
;###################################
PUSHREAL	LDX FPSTACKP
LDY FPSTACKP+1
JSR FACMEM
LDA FPSTACKP
CLC
ADC #5
STA FPSTACKP
BCC NOPVPUR
INC FPSTACKP+1
NOPVPUR		RTS
;###################################
;###################################
POPREAL2X	LDA FPSTACKP
SEC
SBC #5
STA FPSTACKP
BCS NOPVPR2X
DEC FPSTACKP+1
NOPVPR2X	LDA FPSTACKP
LDY FPSTACKP+1
JSR REALFAC
JSR XREGARG
RTS
;###################################
;###################################
POPREAL		LDA FPSTACKP
SEC
SBC #5
STA FPSTACKP
BCS NOPVPR
DEC FPSTACKP+1
NOPVPR		LDA FPSTACKP
LDY FPSTACKP+1
JMP REALFAC
;###################################
;###################################
POPREALXREG LDA FPSTACKP
SEC
SBC #5
STA FPSTACKP
BCS NOPVPRXR
DEC FPSTACKP+1
NOPVPRXR	LDA FPSTACKP
LDY FPSTACKP+1
STA TMP_ZP
STY TMP_ZP+1
LDY #$4
LDA (TMP_ZP),Y
STA X_REG+4
STA FACLO
DEY
LDA (TMP_ZP),Y
STA X_REG+3
STA FACMO
DEY
LDA (TMP_ZP),Y
STA X_REG+2
STA FACMOH
DEY
LDA (TMP_ZP),Y
STA X_REG+1
STA FACSGN
ORA #$80
STA FACHO
DEY
LDA (TMP_ZP),Y
STA X_REG
STA FACEXP
STY FACOV
RTS
;###################################
;###################################
SHR			LDA FACEXP
BEQ SHROK
SEC
SBC A_REG
BCS SHROK
LDA #0
STA FACSGN
STA FACLO
STA FACMO
STA FACMOH
STA FACHO
SHROK		STA FACEXP
RTS
;###################################
;###################################
SHL			LDA FACEXP
BEQ SHLOK
CLC
ADC A_REG
BCC SHLOK
LDA #0
STA FACSGN
STA FACLO
STA FACMO
STA FACMOH
STA FACHO
LDA #$FF
SHLOK		STA FACEXP
RTS
;###################################
;###################################
NEG			LDA FACSGN
EOR #$FF
STA FACSGN
RTS
;### HELPER ########################
;###################################
INCTMPZP	LDA TMP_ZP
CLC
ADC TMP3_ZP
STA TMP_ZP
BCC NOPV2
INC TMP_ZP+1
NOPV2		RTS
;###################################
;###################################
ICMP		STY TMP3_ZP
STA TMP3_ZP+1
LDA TMP_ZP+1
CMP TMP3_ZP+1
BNE ICMPNE2
LDA TMP_ZP
CMP TMP3_ZP
ICMPNE		BEQ ICMPEQ
BCS ICMPHIGHER
JMP ICMPLOWER
ICMPNE2		BPL ICMPHIGHER
JMP ICMPLOWER
ICMPEQ		LDA #0
RTS
ICMPLOWER	LDA #$FF
SEC
RTS
ICMPHIGHER	LDA #$01
CLC
RTS
;###################################
;###################################
COPY2_YREG_XYA
LDY #0
LDA Y_REG
STA (TMP_ZP),Y
INY
LDA Y_REG+1
STA (TMP_ZP),Y
INY
LDA Y_REG+2
STA (TMP_ZP),Y
INY
LDA Y_REG+3
STA (TMP_ZP),Y
INY
LDA Y_REG+4
STA (TMP_ZP),Y
RTS
;###################################
;###################################
COPY2_XYA_XREG
STA TMP3_ZP
STY TMP3_ZP+1
COPY2_XY_XREG
LDX #<X_REG		; the pointer to X_REG has to be in X, because the "value already in X"-optimization might expect it to be there! YIKES!
LDY #0
LDA (TMP3_ZP),Y
STA X_REG
INY
LDA (TMP3_ZP),Y
STA X_REG+1
INY
LDA (TMP3_ZP),Y
STA X_REG+2
INY
LDA (TMP3_ZP),Y
STA X_REG+3
INY
LDA (TMP3_ZP),Y
STA X_REG+4
RTS
;###################################
;###################################
COPY2_XYA_CREG
STA TMP3_ZP
STY TMP3_ZP+1
COPY2_XY_CREG
LDX #<C_REG		; the pointer to C_REG has to be in X, because the "value already in X"-optimization might expect it to be there! YIKES!
LDY #0
LDA (TMP3_ZP),Y
STA C_REG
INY
LDA (TMP3_ZP),Y
STA C_REG+1
INY
LDA (TMP3_ZP),Y
STA C_REG+2
INY
LDA (TMP3_ZP),Y
STA C_REG+3
INY
LDA (TMP3_ZP),Y
STA C_REG+4
RTS
;###################################
;###################################
COPY2_XYA_YREG
STA TMP3_ZP
STY TMP3_ZP+1
COPY2_XY_YREG
LDX #<Y_REG		; the pointer to Y_REG has to be in X, because the "value already in X"-optimization might expect it to be there! YIKES!
LDY #0
LDA (TMP3_ZP),Y
STA Y_REG
INY
LDA (TMP3_ZP),Y
STA Y_REG+1
INY
LDA (TMP3_ZP),Y
STA Y_REG+2
INY
LDA (TMP3_ZP),Y
STA Y_REG+3
INY
LDA (TMP3_ZP),Y
STA Y_REG+4
RTS
;###################################
;###################################
COPY_XREG2YREG
LDA X_REG
STA Y_REG
LDA X_REG+1
STA Y_REG+1
LDA X_REG+2
STA Y_REG+2
LDA X_REG+3
STA Y_REG+3
LDA X_REG+4
STA Y_REG+4
RTS
;###################################
;###################################
PEEKBYTEAND
JSR PEEKBYTESUB
TYA
AND A_REG
TAY
LDA #0
JMP PEEKBYTESTORE
;###################################
;###################################
PEEKBYTEOR
JSR PEEKBYTESUB
TYA
ORA A_REG
TAY
LDA #0
JMP PEEKBYTESTORE
;###################################
;###################################
PEEKBYTESTORE
STY TMP2_ZP		; Store here for later optimization
JSR	INTFAC
JMP FACXREG
;###################################
;###################################
PEEKBYTESUB
JSR YREGFAC
JSR FACWORD
STY PEEKBYTE+1
STA PEEKBYTE+2
PEEKBYTE
LDY $FFFF
LDX #0
RTS
;###################################
;###################################
PEEKBYTEANDFAST
JSR PEEKBYTESUB
TYA
AND A_REG
TAY
RTS
;###################################
;###################################
PEEKBYTEORFAST
JSR PEEKBYTESUB
TYA
ORA A_REG
TAY
RTS
;###################################
;###################################
<IF !BIGRAM>
FACWORD
LDA FACEXP			; Check if there's a -0 in FAC1
BNE DOFACWORD
STA FACSGN			; make sure that it's not -0
DOFACWORD:
JMP XFACWORD
</IF>
;###################################
;###################################
ONETOFAC    LDX #129
STX FAC
DEX
STX FAC+1
LDX #0
STX FAC+2
STX FAC+3
STX FAC+4
STX FAC+5
STX FAC+6
RTS
;###################################
;###################################
FASTAND		LDA ARGEXP			; Check ARG for 0
BNE CHECKFAC
STA FACSGN			; if so, set FAC to 0 and exit
STA FACLO
STA FACMO
STA FACMOH
STA FACHO
STA FACEXP
RTS
CHECKFAC	LDA FACEXP			; Check if there's a -1 in FAC1
BNE FACNOTNULL
STA FACSGN			; make sure that it's not -0
RTS				; FAC is 0, then exit
FACNOTNULL	CMP #$81
BNE NORMALAND
LDA FACHO
CMP #$80
BNE NORMALAND
LDA FACMOH
BNE NORMALAND
LDA FACMO
BNE NORMALAND
LDA FACLO
BNE NORMALAND
LDA FACSGN
ROL
BCC NORMALAND
LDA ARGEXP			; Check if there's a -1 in ARG
CMP #$81
BNE NORMALAND
LDA ARGHO
CMP #$80
BNE NORMALAND
LDA ARGMOH
BNE NORMALAND
LDA ARGMO
BNE NORMALAND
LDA ARGLO
BNE NORMALAND
LDA ARGSGN
ROL
BCC NORMALAND
RTS				; both, FAC1 and ARG contain -1...then we leave FAC1 untouched and return
NORMALAND	JMP ARGAND
;###################################
;###################################
FASTOR		LDA FACEXP			; Check FAC for 0
BNE CHECKFACOR
LDA ARGEXP			; if so, is ARG = 0 as well?
BNE CHECKARGOR	; no, continue with ARG (FAC is still 0 here)
LDA #0
STA FACSGN			; make sure that the negative flag is deleted in this case...
RTS				; yes? Then we leave FAC untouched
CHECKFACOR	LDA FACEXP			; Check if there's a -1 in FAC1
CMP #$81
BNE NORMALOR
LDA FACHO
CMP #$80
BNE NORMALOR
LDA FACMOH
BNE NORMALOR
LDA FACMO
BNE NORMALOR
LDA FACLO
BNE NORMALOR
LDA FACSGN
ROL
BCC NORMALOR
CHECKARGOR	LDA ARGEXP			; Check if there's a -1 in ARG
BNE CHECKARGOR2
RTS 			; ARG is actually 0? Then the value of FAC doesn't change. We can exit here
CHECKARGOR2	CMP #$81
BNE NORMALOR
LDA ARGHO
CMP #$80
BNE NORMALOR
LDA ARGMOH
BNE NORMALOR
LDA ARGMO
BNE NORMALOR
LDA ARGLO
BNE NORMALOR
LDA ARGSGN
AND #$80
CMP #$80
BNE NORMALOR
JMP ARGFAC		; ARG is 1, so just copy it to FAC and exit (implicit)
NORMALOR	JMP FACOR
;###################################
;###################################
CLRCHNEW
LDA CHLOCKFLAG
BNE SKIPCLRCH
JMP CLRCH
SKIPCLRCH
RTS
;###################################
;###################################
SUPERFIINX	INY
BNE SFIINXNOV
CLC
ADC #$1
CMP #$80
BNE SFIINXNOV
JMP ILLEGALQUANTITY
SFIINXNOV	RTS
;###################################
;###################################
NEXTWOFOR
<IF BOOST>
JSR BOOSTDIASBLE
</IF>
LDX #$0A
JMP ERRALL
;###################################
;###################################
OUTOFDATA
<IF BOOST>
JSR BOOSTDIASBLE
</IF>
LDX #$0D
JMP ERRALL
;###################################
;###################################
OUTOFMEMORY
<IF BOOST>
JSR BOOSTDIASBLE
</IF>
LDX #$10
JMP ERRALL
;###################################
;###################################
STRINGTOOLONG
<IF BOOST>
JSR BOOSTDIASBLE
</IF>
LDX #$17
JMP ERRALL
;###################################
;###################################
ILLEGALQUANTITY
<IF BOOST>
JSR BOOSTDIASBLE
</IF>
JMP ERRIQ
;###################################
;###################################
SYNTAXERROR
<IF BOOST>
JSR BOOSTDIASBLE
</IF>
JMP ERRSYN
;###################################
;###################################
FACXREG		LDA FACLO
STA X_REG+4
LDA FACMO
STA X_REG+3
LDA FACMOH
STA X_REG+2
LDA FACSGN
ORA #$7F
AND FACHO
STA X_REG+1
LDA FACEXP
STA X_REG
LDA #0			; Why? Don't know...the ROM does this as well...
STA FACOV
RTS
;###################################
;###################################
FACYREG		LDA FACLO
STA Y_REG+4
LDA FACMO
STA Y_REG+3
LDA FACMOH
STA Y_REG+2
LDA FACSGN
ORA #$7F
AND FACHO
STA Y_REG+1
LDA FACEXP
STA Y_REG
LDA #0			; Why? Don't know...the ROM does this as well...
STA FACOV
RTS
;###################################
;###################################
XREGFAC		LDA X_REG+4
STA FACLO
LDA X_REG+3
STA FACMO
LDA X_REG+2
STA FACMOH
LDA X_REG+1
STA FACSGN
ORA #$80
STA FACHO
LDA X_REG
STA FACEXP
LDA #0
STA FACOV
RTS
;###################################
;###################################
XREGARG		LDA X_REG+4
STA ARGLO
LDA X_REG+3
STA ARGMO
LDA X_REG+2
STA ARGMOH
LDA X_REG+1
STA ARGSGN
EOR FACSGN
STA ARISGN
LDA ARGSGN
ORA #$80
STA ARGHO
LDA X_REG
STA ARGEXP
LDA FACEXP
RTS
;###################################
;###################################
YREGFAC		LDA Y_REG+4
STA FACLO
LDA Y_REG+3
STA FACMO
LDA Y_REG+2
STA FACMOH
LDA Y_REG+1
STA FACSGN
ORA #$80
STA FACHO
LDA Y_REG
STA FACEXP
LDA #0
STA FACOV
RTS
;###################################
;###################################
<IF BOOST>
BOOSTENABLE
LDA $D030
CMP #$FF
BNE C128
RTS
C128
LDA #1
STA BOOSTFLAG
LDA #0
STA BOOSTCNT
LDA $0314
STA IRQROUT
LDA $0315
STA IRQROUT+1
SEI
LDA #<MYRASTER
STA $0314
LDA #>MYRASTER
STA $0315
LDA #46
STA $D012
LDA $D011
AND #127
STA $D011
LDA $D01A
ORA #1
STA $D01A
CLI
RTS
MYRASTER
LDA $D019
BMI RASTER
LDA $DC0D
CLI
JMP $EA31
RASTER
STA $D019
LDA $D012
CMP #254
BCS SETSTART
LDA #0
STA $D030
LDA #254
STA $D012
JMP EXIT
SETSTART
LDA #1
STA $D030
LDA #46
STA $D012
EXIT
PLA
TAY
PLA
TAX
PLA
RTI
BOOSTFLAG
.BYTE 0
BOOSTCNT
.BYTE 0
IRQROUT
.WORD 0
NOBOOST
RTS
BOOSTOFF
LDA BOOSTFLAG
BEQ NOBOOST
SEI
LDA $D01A
AND #14
STA $D01A
LDA #0
STA $D030
INC BOOSTCNT
CLI
RTS
BOOSTON
LDA BOOSTFLAG
BEQ NOBOOST
LDA BOOSTCNT
BEQ BOOSTZERO	; Zero? Then just enable boost
BPL BOOSTNOV
LDA #0			; Counter >128, then reset it anyway (should not occur)
STA BOOSTCNT
JMP BOOSTZERO
BOOSTNOV
DEC BOOSTCNT
BNE NOBOOST
BOOSTZERO
SEI
LDA $D01A
ORA #1
STA $D01A
CLI
RTS
BOOSTDIASBLE
LDA BOOSTFLAG
BEQ NOBOOST
JSR BOOSTOFF
SEI
LDA IRQROUT
STA $0314
LDA IRQROUT+1
STA $0315
CLI
RTS
</IF>
;###################################
;###################################
FASTFSUBMEM
JSR MEMARG
FASTFSUBARG
LDA FACSGN
EOR #$FF
STA FACSGN
EOR ARGSGN
STA ARISGN
LDA FACEXP
JMP FASTFADDARG
;###################################
;###################################
FASTFADDMEM
JSR MEMARG
FASTFADDARG
BNE FADDRET2   		; JUMP IF FAC IS NOT ZERO.
JMP ARGFAC
FADDRET2	LDA ARGEXP
BNE FADDRET1   		; JUMP IF ARG IS NOT ZERO.
RTS
FADDRET1	SEC
SBC FACEXP
BEQ FFADD_EXPEQ     ; JUMP IF NO SHIFTING NEEDED. THE A REGISTER IS ALREADY ZERO.
BCC FFADD_SHFARG1   ; JUMP IF ARG NEEDS SHIFTING (HAS SMALLER EXPONENT).
; HERE, FAC IS THE SMALLEST OPERAND, AND ARG IS THE LARGEST.
; FAC WILL NEED TO BE SHIFTED RIGHT,
; COPY EXPONENT AND SIGN FROM ARG.
LDY ARGEXP
STY FACEXP
LDY ARGSGN
STY FACSGN
LDX #0
STX OLDOV      		; ARG HAS NO ROUNDING BITS.
LDX #FAC       		; INDICATE FAC IS THE SMALLEST OPERAND.
; A CONTAINS NUMBER OF BITS TO ROTATE RIGHT.
SEC
SBC #$08
BMI FFADD_SHFFAC2
; A >= 8, THEREFORE SHIFT RIGHT ONE BYTE.
FFADD_SHFFAC1
LDY FACLO      		; LO -> OV
STY FACOV
LDY FACMO      		; MO -> LO
STY FACMO+1
LDY FACMOH     		; MOH -> MO
STY FACMOH+1
LDY FACHO      		; HO -> MOH
STY FACHO+1
LDY #0
STY FACHO      		; 0 -> HO
SBC #$08       		; CARRY IS ALWAYS SET HERE.
BPL FFADD_SHFFAC1   ; JUMP IF MORE BYTES TO SHIFT.
FFADD_SHFFAC2
ADC #$08       		; CARRY IS ALWAYS CLEAR HERE.
BEQ FFADD_SHFFAC4   ; JUMP IF NO MORE SHIFTING.
TAY
LDA FACOV
FFADD_SHFFAC3
LSR FACHO      		; HO
ROR FACMOH     		; MOH
ROR FACMO      		; MO
ROR FACLO      		; LO
ROR            		; OV
DEY
BNE FFADD_SHFFAC3
JMP FFADD_MANADD2   ; NO MORE SHIFTING.
FFADD_SHFFAC4
LDA FACOV       	; THE A-REGISTER CONTAINS THE SHIFTED ROUNDING BITS OF FAC.
JMP FFADD_MANADD2
FFADD_EXPEQ
LDX FACOV
STX OLDOV
; OLDOV NOW CONTAINS ROUNDING BITS OF FAC.
; THE A-REGISTER CONTAINS THE ROUNDING BITS OF ARG (I.E. ZERO).
JMP FFADD_MANADD1
FFADD_SHFARG2
LDA FACOV      		; THE A-REGISTER CONTAINS THE SHIFTED ROUNDING BITS OF ARG.
JMP FFADD_MANADD1
FFADD_SHFARG1
LDX FACOV
STX OLDOV      		; OLDOV NOW CONTAINS ROUNDING BITS OF FAC.
LDX #$00       		; USE X-REGISTER FOR ROUNDING BITS OF ARG.
; -A CONTAINS NUMBER OF BITS TO ROTATE RIGHT.
; CARRY IS ALWAYS CLEAR HERE.
ADC #$08
BPL FFADD_SHFARG6   ; JUMP IF LESS THAN 8 SHIFTS.
FFADD_SHFARG3
LDX ARGLO      		; SHIFT RIGHT ONE BYTE
LDY ARGMO      		; MO -> LO
STY ARGMO+1
LDY ARGMOH     		; MOH -> MO
STY ARGMOH+1
LDY ARGHO      		; HO -> MOH
STY ARGHO+1
LDY #0
STY ARGHO      		; 0 -> HO
FFADD_SHFARG4
ADC #$08
BMI FFADD_SHFARG3
BEQ FFADD_SHFARG3
FFADD_SHFARG6
SBC #$08
BEQ FFADD_SHFARG2   ; JUMP IF NO MORE SHIFTING.
TAY
TXA            		; ROUNDING BITS.
FFADD_SHFARG5
LSR ARGHO
ROR ARGMOH
ROR ARGMO
ROR ARGLO
ROR         		; OV
INY
BNE FFADD_SHFARG5
FFADD_MANADD1
LDX #ARGEXP    		; INDICATE ARG IS THE SMALLEST OPERAND.
FFADD_MANADD2
BIT ARISGN
BMI FFADD_MANSUB1   ; JUMP IF OPERANDS HAVE DIFFERENT SIGN.
CLC
ADC OLDOV
STA FACOV
LDA FACLO
ADC ARGLO
STA FACLO
LDA FACMO
ADC ARGMO
STA FACMO
LDA FACMOH
ADC ARGMOH
STA FACMOH
LDA FACHO
ADC ARGHO
STA FACHO
BCC FFADD_RNDRTS
INC FACEXP
BEQ FFADD_OVERR
; CARRY BIT IS SET HERE.
ROR FACHO
ROR FACMOH
ROR FACMO
ROR FACLO
ROR FACOV
FFADD_RNDRTS
RTS
FFADD_OVERR
JMP ILLEGALQUANTITY
FFADD_MANSUB1
LDY #FACEXP
CPX #ARGEXP
BEQ FFADD_MANSUB2
LDY #ARGEXP
FFADD_MANSUB2
SEC            		; NEGATE THE ROUNDING BITS BEFORE ADDING.
EOR #$FF
ADC OLDOV
STA FACOV
LDA 4,Y
SBC 4,X
STA FACLO
LDA 3,Y
SBC 3,X
STA FACMO
LDA 2,Y
SBC 2,X
STA FACMOH
LDA 1,Y
SBC 1,X
STA FACHO
BCS FCNORMAL
LDA FACSGN
EOR #$FF
STA FACSGN
LDA FACHO
EOR #$FF
STA FACHO
LDA FACMOH
EOR #$FF
STA FACMOH
LDA FACMO
EOR #$FF
STA FACMO
LDA FACLO
EOR #$FF
STA FACLO
LDA FACOV
EOR #$FF
CLC
ADC #1
STA FACOV
BNE FCNORMAL
INC FACLO
BNE FCNORMAL
INC FACMO
BNE FCNORMAL
INC FACMOH
BNE FCNORMAL
INC FACHO
FCNORMAL  	BIT FACHO
BMI FFADD_RET       ; JUMP IF NUMBER IS ALREADY NORMALIZED.
LDA #0         		; NUMBER OF BITS ROTATED.
CLC
FFADD_NORM3
LDX FACHO
BNE FFADD_NORM1
LDX FACHO+1
STX FACHO
LDX FACMOH+1
STX FACMOH
LDX FACMO+1
STX FACMO
LDX FACOV
STX FACLO
LDX #0
STX FACOV
ADC #$08
CMP #$20
BNE FFADD_NORM3
JMP FFADD_ZEROFAC
FFADD_NORM2
CLC
ADC #1
ASL FACOV
ROL FACLO
ROL FACMO
ROL FACMOH
ROL FACHO
FFADD_NORM1
BPL FFADD_NORM2     ; WE MUST SHIFT LEFT ONE BIT
SEC
SBC FACEXP
BCS FFADD_ZEROFAC
EOR #$FF
CLC
ADC #1
STA FACEXP
FFADD_RET   RTS
FFADD_ZEROFAC
LDX #0
STX FACEXP
STX FACSGN
RTS
;###################################
;###################################
FASTFMULMEM
JSR MEMARG
FASTFMULARG
BEQ FFMUL_MULTRT    ; JUMP IF FAC IS ZERO.
LDA ARGEXP
BEQ FFMUL_ZEREMV    ; JUMP IF ARG IS ZERO.
CLC
ADC FACEXP
BCC FFMUL_TRYOFF
CLC
BPL FFMUL_ADJUST
JMP ILLEGALQUANTITY
FFMUL_ZEREMV
LDY #0
STY FACEXP     		; RESULT IS ZERO.
STY FACSGN
FFMUL_MULTRT
RTS
FFMUL_TRYOFF
BPL FFMUL_ZEREMV    ; JUMP IF UNDERFLOW.
FFMUL_ADJUST
ADC #$80       		; CARRY IS ALWAYS CLEAR HERE.
BEQ FFMUL_ZEREMV    ; JUMP IF UNDERFLOW.
STA FACEXP
LDA ARISGN
STA FACSGN
LDY #0
STY RESHOP
STY RESHO
STY RESMOH
STY RESMO
STY RESLO
STY RESOV
STY FACHOP
FFMUL_B0
LSR ARGLO      		; B0
BCC FFMUL_B1
LDA RESOV
CLC
ADC FACMOH     		; A2
STA RESOV
LDA RESLO
ADC FACHO      		; A3
STA RESLO
LDA RESMO
ADC FACHOP     		; A4
STA RESMO
BCC FFMUL_B1
INC RESMOH
BNE FFMUL_B1
INC RESHO
BNE FFMUL_B1
INC RESHOP
FFMUL_B1
LSR ARGMO      		; B1
BCC FFMUL_B2
LDA RESOV
CLC
ADC FACMO      		; A1
STA RESOV
LDA RESLO
ADC FACMOH     		; A2
STA RESLO
LDA RESMO
ADC FACHO      		; A3
STA RESMO
LDA RESMOH
ADC FACHOP     		; A4
STA RESMOH
BCC FFMUL_B2
INC RESHO
BNE FFMUL_B2
INC RESHOP
FFMUL_B2
LSR ARGMOH     		; B2
BCC FFMUL_B3
LDA RESOV
CLC
ADC FACLO      		; A0
STA RESOV
LDA RESLO
ADC FACMO      		; A1
STA RESLO
LDA RESMO
ADC FACMOH     		; A2
STA RESMO
LDA RESMOH
ADC FACHO      		; A3
STA RESMOH
LDA RESHO
ADC FACHOP     		; A4
STA RESHO
BCC FFMUL_B3
INC RESHOP
FFMUL_B3
LSR ARGHO      		; B3
BCC FFMUL_ROTA
LDA RESOV
CLC
ADC FACOV      		; AV
STA RESOV
LDA RESLO
ADC FACLO      		; A0
STA RESLO
LDA RESMO
ADC FACMO      		; A1
STA RESMO
LDA RESMOH
ADC FACMOH     		; A2
STA RESMOH
LDA RESHO
ADC FACHO      		; A3
STA RESHO
LDA RESHOP
ADC FACHOP     		; A4
STA RESHOP
FFMUL_ROTA
ASL FACOV
ROL FACLO
ROL FACMO
ROL FACMOH
ROL FACHO
ROL FACHOP
BMI FFMUL_FIN
JMP FFMUL_B0
FFMUL_FIN
LDA RESHOP
STA FACHO
LDA RESHO
STA FACMOH
LDA RESMOH
STA FACMO
LDA RESMO
STA FACLO
LDA RESLO
STA FACOV
JMP FCNORMAL    		; IN BASIC/XADD.S
MUL10
JSR ARGFAC      	; ARG = FAC; LEAVES EXPONENT IN A REGISTER.
TAX            		; EXPONENT
BEQ FFMUL_MUL101    ; RETURN IF ZERO.
CLC
ADC #2
BCS FFMUL_MUL102    ; JUMP IF OVERFLOW
STA FACEXP     		; STORE NEW EXPONENT.
LDY #0
STY ARISGN
JSR FASTFADDARG      ; THE Z FLAG IS CLEAR HERE.
INC FACEXP
BEQ FFMUL_MUL102     ; JUMP IF OVERFLOW
FFMUL_MUL101
RTS
FFMUL_MUL102
JMP ILLEGALQUANTITY
MUL6
JSR ARGFAC      	; ARG = FAC
TAX            		; EXPONENT
BEQ FFMUL_MUL61     ; RETURN IF ZERO.
INC FACEXP
BEQ FFMUL_MUL62     ; JUMP IF OVERFLOW
LDY #0
STY ARISGN
JSR FASTFADDARG      ; THE Z FLAG IS CLEAR HERE.
INC FACEXP
BEQ FFMUL_MUL62     ; OVERFLOW
FFMUL_MUL61
RTS
FFMUL_MUL62
JMP ILLEGALQUANTITY
;###################################
;###############################
INITVARS
JSR INITSTRVARS
LDA #0
LDY #4
REALINITLOOP0:
STA VAR_CP,Y
STA VAR_PN,Y
STA VAR_AT,Y
STA VAR_DC,Y
STA VAR_EL,Y
STA VAR_RL,Y
STA VAR_LQ,Y
STA VAR_HQ,Y
STA VAR_WF,Y
STA VAR_PT,Y
STA VAR_IM,Y
STA VAR_VC,Y
STA VAR_AC,Y
STA VAR_I,Y
STA VAR_IC,Y
STA VAR_TI,Y
STA VAR_TT,Y
STA VAR_SB,Y
STA VAR_HH,Y
STA VAR_PI,Y
STA VAR_RP,Y
STA VAR_YY,Y
STA VAR_CC,Y
STA VAR_SP,Y
STA VAR_S,Y
STA VAR_PM,Y
STA VAR_X,Y
STA VAR_SC,Y
STA VAR_EC,Y
STA VAR_Y,Y
STA VAR_SA,Y
STA VAR_SE,Y
STA VAR_XE,Y
STA VAR_YP,Y
STA VAR_PA,Y
STA VAR_PE,Y
STA VAR_CF,Y
STA VAR_WP,Y
STA VAR_AI,Y
STA VAR_AD,Y
STA VAR_PC,Y
STA VAR_XP,Y
STA VAR_DD,Y
STA VAR_KC,Y
STA VAR_MA,Y
STA VAR_AA,Y
STA VAR_PP,Y
STA VAR_PH,Y
STA VAR_PL,Y
STA VAR_OC,Y
STA VAR_OA,Y
STA VAR_AF,Y
STA VAR_PF,Y
STA VAR_SF,Y
STA VAR_XF,Y
STA VAR_YF,Y
STA VAR_DX,Y
STA VAR_DY,Y
STA VAR_PO,Y
STA VAR_OV,Y
STA VAR_XI,Y
STA VAR_PJ,Y
STA VAR_PV,Y
STA VAR_PY,Y
STA VAR_PX,Y
STA VAR_P,Y
STA VAR_CK,Y
STA VAR_PD,Y
STA VAR_OO,Y
STA VAR_A,Y
STA VAR_CO,Y
STA VAR_J,Y
STA VAR_II,Y
STA VAR_T,Y
STA VAR_H1,Y
STA VAR_L1,Y
STA VAR_H2,Y
STA VAR_L2,Y
STA VAR_H3,Y
STA VAR_L3,Y
DEY
BMI REALLOOPEXIT0
JMP REALINITLOOP0
REALLOOPEXIT0:
STA VAR_RS%
STA VAR_RS%+1
STA VAR_OB%
STA VAR_OB%+1
LDA #<VAR_VW%[]
LDY #>VAR_VW%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_VL[]
LDY #>VAR_VL[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_VT%[]
LDY #>VAR_VT%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_CI%[]
LDY #>VAR_CI%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_SC%[]
LDY #>VAR_SC%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_CG[]
LDY #>VAR_CG[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_PC[]
LDY #>VAR_PC[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_SB%[]
LDY #>VAR_SB%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_PO%[]
LDY #>VAR_PO%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_AF%[]
LDY #>VAR_AF%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_PM[]
LDY #>VAR_PM[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_PA[]
LDY #>VAR_PA[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_PD[]
LDY #>VAR_PD[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_PP[]
LDY #>VAR_PP[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_PX[]
LDY #>VAR_PX[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_HP%[]
LDY #>VAR_HP%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_PY[]
LDY #>VAR_PY[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_BB%[]
LDY #>VAR_BB%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #<VAR_BC%[]
LDY #>VAR_BC%[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #0
STA VAR_PO%
STA VAR_PO%+1
STA VAR_XX%
STA VAR_XX%+1
STA VAR_CS%
STA VAR_CS%+1
LDA #<VAR_PS[]
LDY #>VAR_PS[]
JSR INITSPARAMS
JSR INITNARRAY
LDA #0
RTS
;###############################
; *** SUBROUTINES END ***
; *** CONSTANTS ***
CONSTANTS
; CONST: #1

CONST_0R	.REAL 1.0
; CONST: #147


; CONST: #142


; CONST: #8

CONST_3R	.REAL 8.0
; CONST: #192


; CONST: #0

CONST_5R	.REAL 0.0
; CONST: #2

CONST_6R	.REAL 2.0
; CONST: #4

CONST_7R	.REAL 4.0
; CONST: #180

CONST_8R	.REAL 180.0
; CONST: #128

CONST_9R	.REAL 128.0
; CONST: #6

CONST_10R	.REAL 6.0
; CONST: #7

CONST_11R	.REAL 7.0
; CONST: #17

CONST_12R	.REAL 17.0
; CONST: #9

CONST_13R	.REAL 9.0
; CONST: #16

CONST_14R	.REAL 16.0
; CONST: #20

CONST_15R	.REAL 20.0
; CONST: #13

CONST_16R	.REAL 13.0
; CONST: #25

CONST_17R	.REAL 25.0
; CONST: #10

CONST_18R	.REAL 10.0
; CONST: #11

CONST_19R	.REAL 11.0
; CONST: #34

CONST_20R	.REAL 34.0
; CONST: #5

CONST_21R	.REAL 5.0
; CONST: #30

CONST_22R	.REAL 30.0
; CONST: #3

CONST_23R	.REAL 3.0
; CONST: #22

CONST_24R	.REAL 22.0
; CONST: #12

CONST_25R	.REAL 12.0
; CONST: #54272.0

CONST_26	.REAL 54272.0
; CONST: #54296.0

CONST_27	.REAL 54296.0
; CONST: #15


; CONST: #126


; CONST: #124


; CONST: #123


; CONST: #108


; CONST: #111

CONST_33R	.REAL 111.0
; CONST: #77

CONST_34R	.REAL 77.0
; CONST: #103

CONST_35R	.REAL 103.0
; CONST: #19


; CONST: #157


; CONST: #253


; CONST: #254


; CONST: #255

CONST_40R	.REAL 255.0
; CONST: #78

CONST_41R	.REAL 78.0
; CONST: $
CONST_42	.BYTE 0
.STRG ""
; CONST: #27

CONST_43R	.REAL 27.0
; CONST: #29


; CONST: #28


; CONST: #3.141592

CONST_46	.REAL 3.141592
; CONST: $ human
CONST_47	.BYTE 7
.STRG " human "
; CONST: #18

CONST_48R	.REAL 18.0
; CONST: #14

CONST_49R	.REAL 14.0
; CONST: #56334

CONST_50	.REAL 56334
; CONST: #251


; CONST: #704

CONST_52	.REAL 704
; CONST: #53896

CONST_53	.REAL 53896
; CONST: #16192

CONST_54	.REAL 16192
; CONST: #16383.0

CONST_55	.REAL 16383.0
; CONST: #-1.0

CONST_56	.REAL -1.0
; CONST: #1984

CONST_57	.REAL 1984
; CONST: #2023

CONST_58	.REAL 2023
; CONST: #160

CONST_59R	.REAL 160.0
; CONST: #54272

CONST_60	.REAL 54272
; CONST: #233

CONST_61R	.REAL 233.0
; CONST: #223

CONST_62R	.REAL 223.0
; CONST: #35

CONST_63R	.REAL 35.0
; CONST: #1024

CONST_64	.REAL 1024
; CONST: #32

CONST_65R	.REAL 32.0
; CONST: #24

CONST_66R	.REAL 24.0
; CONST: #39

CONST_67R	.REAL 39.0
; CONST: #40

CONST_68R	.REAL 40.0
; CONST: #90

CONST_69R	.REAL 90.0
; CONST: #100

CONST_70R	.REAL 100.0
; CONST: #960.0

CONST_71	.REAL 960.0
; CONST: #85


; CONST: #73


; CONST: #54273

CONST_74	.REAL 54273
; CONST: #0.027748

CONST_75	.REAL 0.027748
; CONST: #54232

CONST_76	.REAL 54232
; CONST: $'a' and 'd' to adjust
CONST_77	.BYTE 21
.STRG "'a' and 'd' to adjust"
; CONST: $or number keys to enter
CONST_78	.BYTE 23
.STRG "or number keys to enter"
; CONST: $
CONST_79	.BYTE 11
.STRG "           "
; CONST: $
CONST_80	.BYTE 1
.STRG " "
; CONST: $9
CONST_81	.BYTE 1
.STRG "9"
; CONST: $0
CONST_82	.BYTE 1
.STRG "0"
; CONST: $a
CONST_83	.BYTE 1
.STRG "a"
; CONST: $d
CONST_84	.BYTE 1
.STRG "d"
; CONST: #164


; CONST: $
CONST_86	.BYTE 2
.STRG "  "
; CONST: $
CONST_87	.BYTE 3
.STRG "   "
; CONST: #-1

CONST_88	.REAL -1
; CONST: #120

CONST_89R	.REAL 120.0
; CONST: $angle:
CONST_90	.BYTE 10
.STRG "angle:    "
; CONST: $180
CONST_91	.BYTE 3
.STRG "180"
; CONST: #176


; CONST: #174


; CONST: #98


; CONST: $
CONST_95	.BYTE 8
.STRG "        "
; CONST: #237


; CONST: #101

CONST_97R	.REAL 101.0
; CONST: #1.7857

CONST_98	.REAL 1.7857
; CONST: #1105

CONST_99	.REAL 1105
; CONST: #1112

CONST_100	.REAL 1112
; CONST: #99


; CONST: #3.1315920000000004

CONST_102	.REAL 3.1315920000000004
; CONST: #0.01

CONST_103	.REAL 0.01
; CONST: #0.02

CONST_104	.REAL 0.02
; CONST: #319

CONST_105	.REAL 319
; CONST: #46

CONST_106R	.REAL 46.0
; CONST: #2024

CONST_107	.REAL 2024
; CONST: #1023

CONST_108	.REAL 1023
; CONST: #80

CONST_109R	.REAL 80.0
; CONST: #105

CONST_110R	.REAL 105.0
; CONST: #95

CONST_111R	.REAL 95.0
; CONST: #223.0

CONST_112	.REAL 223.0
; CONST: #233.0

CONST_113	.REAL 233.0
; CONST: #1064

CONST_114	.REAL 1064
; CONST: #41

CONST_115R	.REAL 41.0
; CONST: #54312

CONST_116	.REAL 54312
; CONST: #54313

CONST_117	.REAL 54313
; CONST: #53266

CONST_118	.REAL 53266
; CONST: $ -
CONST_119	.BYTE 2
.STRG " -"
; CONST: $draw!!
CONST_120	.BYTE 6
.STRG "draw!!"
; CONST: $player 2 wins!
CONST_121	.BYTE 14
.STRG "player 2 wins!"
; CONST: $player 1 wins!
CONST_122	.BYTE 14
.STRG "player 1 wins!"
; CONST: #104


; CONST: #53265

CONST_124	.REAL 53265
; CONST: #239


; CONST: #-999.0

CONST_126	.REAL -999.0
; CONST: $the battle of
CONST_127	.BYTE 13
.STRG "the battle of"
; CONST: $vittorio!
CONST_128	.BYTE 9
.STRG "vittorio!"
; CONST: #23

CONST_129R	.REAL 23.0
; CONST: $egonolsen71/2021
CONST_130	.BYTE 16
.STRG "egonolsen71/2021"
; CONST: #783

CONST_131	.REAL 783
; CONST: #26


; CONST: #36


; CONST: #240


; CONST: #33

CONST_135R	.REAL 33.0
;###############################
; ******** DATA ********
DATAS
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 80
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 109
.BYTE 192
.BYTE 3
.BYTE 3
.BYTE 237
.BYTE 176
.BYTE 3
.BYTE 3
.BYTE 153
.BYTE 176
.BYTE 3
.BYTE 1
.BYTE 153
.BYTE 192
.BYTE 13
.BYTE 155
.BYTE 192
.BYTE 14
.BYTE 173
.BYTE 3
.BYTE 0
.BYTE 7
.BYTE 181
.BYTE 3
.BYTE 0
.BYTE 5
.BYTE 64
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 135
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 5
.BYTE 64
.BYTE 3
.BYTE 0
.BYTE 6
.BYTE 64
.BYTE 3
.BYTE 0
.BYTE 22
.BYTE 80
.BYTE 3
.BYTE 0
.BYTE 30
.BYTE 208
.BYTE 21
.BYTE 90
.BYTE 212
.BYTE 91
.BYTE 121
.BYTE 244
.BYTE 121
.BYTE 233
.BYTE 180
.BYTE 106
.BYTE 154
.BYTE 100
.BYTE 89
.BYTE 190
.BYTE 100
.BYTE 29
.BYTE 214
.BYTE 164
.BYTE 15
.BYTE 157
.BYTE 48
.BYTE 7
.BYTE 165
.BYTE 80
.BYTE 5
.BYTE 106
.BYTE 64
.BYTE 3
.BYTE 0
.BYTE 103
.BYTE 64
.BYTE 3
.BYTE 0
.BYTE 109
.BYTE 64
.BYTE 3
.BYTE 0
.BYTE 117
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 84
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 16
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 135
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 5
.BYTE 85
.BYTE 64
.BYTE 5
.BYTE 231
.BYTE 69
.BYTE 7
.BYTE 166
.BYTE 109
.BYTE 3
.BYTE 2
.BYTE 170
.BYTE 169
.BYTE 17
.BYTE 158
.BYTE 217
.BYTE 93
.BYTE 189
.BYTE 185
.BYTE 122
.BYTE 169
.BYTE 164
.BYTE 106
.BYTE 187
.BYTE 100
.BYTE 93
.BYTE 219
.BYTE 100
.BYTE 29
.BYTE 183
.BYTE 180
.BYTE 3
.BYTE 2
.BYTE 175
.BYTE 176
.BYTE 106
.BYTE 186
.BYTE 180
.BYTE 106
.BYTE 122
.BYTE 85
.BYTE 118
.BYTE 118
.BYTE 153
.BYTE 118
.BYTE 106
.BYTE 157
.BYTE 122
.BYTE 102
.BYTE 173
.BYTE 95
.BYTE 21
.BYTE 93
.BYTE 21
.BYTE 17
.BYTE 153
.BYTE 20
.BYTE 3
.BYTE 1
.BYTE 164
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 1
.BYTE 84
.BYTE 135
.BYTE 32
.BYTE 101
.BYTE 117
.BYTE 97
.BYTE 246
.BYTE 234
.BYTE 160
.BYTE 0
.WORD -1
.BYTE 15
.BYTE 87
.BYTE 215
.BYTE 97
.BYTE 99
.BYTE 59
.BYTE 50
.BYTE 99
.BYTE 88
.BYTE 57
.BYTE 109
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 238
.BYTE 208
.BYTE 170
.BYTE 208
.BYTE 95
.BYTE 29
.BYTE 42
.BYTE 80
.BYTE 42
.BYTE 42
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 88
.BYTE 45
.BYTE 88
.BYTE 97
.BYTE 104
.BYTE 64
.BYTE 86
.BYTE 233
.BYTE 223
.BYTE 231
.BYTE 150
.BYTE 108
.BYTE 223
.BYTE 76
.BYTE 93
.BYTE 195
.BYTE 192
.BYTE 86
.BYTE 109
.BYTE 17
.BYTE 45
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 42
.BYTE 84
.BYTE 238
.BYTE 170
.BYTE 197
.BYTE 208
.BYTE 144
.BYTE 186
.BYTE 232
.BYTE 95
.BYTE 57
.BYTE 80
.BYTE 80
.BYTE 45
.BYTE 57
.BYTE 42
.BYTE 91
.BYTE 97
.BYTE 109
.BYTE 69
.BYTE 43
.BYTE 95
.BYTE 86
.BYTE 86
.BYTE 60
.BYTE 232
.BYTE 180
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 103
.BYTE 222
.BYTE 86
.BYTE 99
.BYTE 43
.BYTE 80
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 92
.BYTE 237
.BYTE 173
.BYTE 151
.BYTE 189
.BYTE 185
.BYTE 187
.BYTE 152
.BYTE 208
.BYTE 208
.BYTE 144
.BYTE 144
.BYTE 207
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 58
.BYTE 45
.BYTE 106
.BYTE 70
.BYTE 57
.BYTE 56
.BYTE 86
.BYTE 86
.BYTE 224
.BYTE 237
.BYTE 195
.BYTE 86
.BYTE 185
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 58
.BYTE 103
.BYTE 97
.BYTE 17
.BYTE 43
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 92
.BYTE 187
.BYTE 144
.BYTE 170
.BYTE 215
.BYTE 235
.BYTE 195
.BYTE 86
.BYTE 212
.BYTE 208
.BYTE 157
.BYTE 208
.BYTE 144
.BYTE 208
.BYTE 207
.BYTE 58
.BYTE 109
.BYTE 56
.BYTE 93
.BYTE 86
.BYTE 70
.BYTE 86
.BYTE 86
.BYTE 86
.BYTE 86
.BYTE 63
.BYTE 59
.BYTE 83
.BYTE 53
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 58
.BYTE 231
.BYTE 232
.BYTE 107
.BYTE 80
.BYTE 109
.BYTE 191
.BYTE 211
.BYTE 86
.BYTE 79
.BYTE 215
.BYTE 226
.BYTE 186
.BYTE 80
.BYTE 64
.BYTE 175
.BYTE 198
.BYTE 235
.BYTE 144
.BYTE 208
.BYTE 208
.BYTE 144
.BYTE 208
.BYTE 82
.BYTE 57
.BYTE 57
.BYTE 86
.BYTE 86
.BYTE 204
.BYTE 86
.BYTE 225
.BYTE 191
.BYTE 82
.BYTE 105
.BYTE 82
.BYTE 105
.BYTE 217
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 104
.BYTE 210
.BYTE 208
.BYTE 57
.BYTE 58
.BYTE 233
.BYTE 212
.BYTE 208
.BYTE 231
.BYTE 87
.BYTE 173
.BYTE 86
.BYTE 80
.BYTE 80
.BYTE 58
.BYTE 67
.BYTE 237
.BYTE 222
.BYTE 156
.BYTE 156
.BYTE 144
.BYTE 144
.BYTE 144
.BYTE 236
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 11
.BYTE 84
.BYTE 15
.BYTE 80
.BYTE 103
.BYTE 61
.BYTE 187
.BYTE 151
.BYTE 208
.BYTE 151
.BYTE 187
.BYTE 208
.BYTE 192
.BYTE 88
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 23
.BYTE 59
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 105
.BYTE 23
.BYTE 216
.BYTE 208
.BYTE 208
.BYTE 170
.BYTE 208
.BYTE 60
.BYTE 83
.BYTE 79
.BYTE 231
.BYTE 203
.BYTE 170
.BYTE 227
.BYTE 159
.BYTE 185
.BYTE 144
.BYTE 208
.BYTE 104
.BYTE 80
.BYTE 12
.BYTE 229
.BYTE 11
.BYTE 208
.BYTE 192
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 102
.BYTE 233
.BYTE 208
.BYTE 144
.BYTE 144
.BYTE 144
.BYTE 144
.BYTE 195
.BYTE 86
.BYTE 86
.BYTE 88
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 204
.BYTE 208
.BYTE 184
.BYTE 208
.BYTE 144
.BYTE 211
.BYTE 57
.BYTE 83
.BYTE 210
.BYTE 237
.BYTE 187
.BYTE 208
.BYTE 70
.BYTE 104
.BYTE 104
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 11
.BYTE 187
.BYTE 144
.BYTE 215
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 23
.BYTE 233
.BYTE 208
.BYTE 144
.BYTE 144
.BYTE 151
.BYTE 86
.BYTE 49
.BYTE 86
.BYTE 80
.BYTE 96
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 11
.BYTE 92
.BYTE 187
.BYTE 236
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 23
.BYTE 235
.BYTE 151
.BYTE 227
.BYTE 144
.BYTE 208
.BYTE 215
.BYTE 95
.BYTE 84
.BYTE 106
.BYTE 171
.BYTE 144
.BYTE 192
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 11
.BYTE 84
.BYTE 84
.BYTE 79
.BYTE 0
.WORD -1
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 85
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 58
.BYTE 79
.BYTE 208
.BYTE 104
.BYTE 104
.BYTE 97
.BYTE 233
.BYTE 234
.BYTE 12
.BYTE 23
.BYTE 60
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 102
.BYTE 0
.WORD -1
.BYTE 11
.BYTE 144
.BYTE 15
.BYTE 80
.BYTE 28
.BYTE 12
.BYTE 23
.BYTE 15
.BYTE 156
.BYTE 183
.BYTE 12
.BYTE 144
.BYTE 208
.BYTE 15
.BYTE 180
.BYTE 86
.BYTE 185
.BYTE 70
.BYTE 221
.BYTE 237
.BYTE 99
.BYTE 59
.BYTE 92
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -1
.BYTE 145
.BYTE 208
.BYTE 236
.BYTE 11
.BYTE 57
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 92
.BYTE 189
.BYTE 186
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 23
.BYTE 80
.BYTE 12
.BYTE 87
.BYTE 15
.BYTE 107
.BYTE 11
.BYTE 58
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 11
.BYTE 208
.BYTE 15
.BYTE 80
.BYTE 23
.BYTE 58
.BYTE 188
.BYTE 189
.BYTE 12
.BYTE 208
.BYTE 144
.BYTE 144
.BYTE 15
.BYTE 208
.BYTE 231
.BYTE 231
.BYTE 62
.BYTE 79
.BYTE 186
.BYTE 107
.BYTE 12
.BYTE 102
.BYTE 0
.WORD -5
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 81
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 92
.BYTE 185
.BYTE 86
.BYTE 234
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 12
.BYTE 61
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 191
.BYTE 0
.WORD -1
.BYTE 11
.BYTE 236
.BYTE 57
.BYTE 15
.BYTE 23
.BYTE 76
.BYTE 88
.BYTE 58
.BYTE 189
.BYTE 12
.BYTE 208
.BYTE 144
.BYTE 144
.BYTE 15
.BYTE 144
.BYTE 208
.BYTE 230
.BYTE 80
.BYTE 93
.BYTE 110
.BYTE 87
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -4
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 85
.BYTE 16
.BYTE 15
.BYTE 30
.BYTE 87
.BYTE 221
.BYTE 188
.BYTE 104
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 11
.BYTE 229
.BYTE 0
.WORD -3
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 186
.BYTE 15
.BYTE 80
.BYTE 58
.BYTE 86
.BYTE 186
.BYTE 64
.BYTE 176
.BYTE 144
.BYTE 12
.BYTE 144
.BYTE 144
.BYTE 15
.BYTE 208
.BYTE 208
.BYTE 107
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 11
.BYTE 64
.BYTE 0
.WORD -3
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 151
.BYTE 84
.BYTE 15
.BYTE 80
.BYTE 74
.BYTE 225
.BYTE 83
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 11
.BYTE 92
.BYTE 208
.BYTE 12
.BYTE 144
.BYTE 0
.WORD -1
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -1
.BYTE 85
.BYTE 15
.BYTE 80
.BYTE 58
.BYTE 97
.BYTE 59
.BYTE 210
.BYTE 185
.BYTE 12
.BYTE 208
.BYTE 144
.BYTE 208
.BYTE 15
.BYTE 208
.BYTE 208
.BYTE 12
.BYTE 85
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 187
.BYTE 0
.WORD -4
.BYTE 151
.BYTE 57
.BYTE 15
.BYTE 23
.BYTE 103
.BYTE 97
.BYTE 103
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 12
.BYTE 92
.BYTE 208
.BYTE 144
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -3
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 236
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 28
.BYTE 80
.BYTE 83
.BYTE 83
.BYTE 103
.BYTE 104
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 238
.BYTE 0
.WORD -6
.BYTE 236
.BYTE 80
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 12
.BYTE 209
.BYTE 11
.BYTE 144
.BYTE 12
.BYTE 144
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -3
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 80
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 80
.BYTE 80
.BYTE 30
.BYTE 80
.BYTE 11
.BYTE 84
.BYTE 15
.BYTE 95
.BYTE 105
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 191
.BYTE 0
.WORD -6
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -1
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 207
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 11
.BYTE 23
.BYTE 223
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -2
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 208
.BYTE 101
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 217
.BYTE 11
.BYTE 208
.BYTE 12
.BYTE 170
.BYTE 0
.WORD -8
.BYTE 11
.BYTE 144
.BYTE 144
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 151
.BYTE 85
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 213
.BYTE 0
.WORD -3
.BYTE 208
.BYTE 106
.BYTE 80
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 15
.BYTE 80
.BYTE 11
.BYTE 95
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 15
.BYTE 187
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -3
.BYTE 208
.BYTE 0
.WORD -5
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -2
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 85
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 102
.BYTE 0
.WORD -4
.BYTE 208
.BYTE 60
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 11
.BYTE 79
.BYTE 211
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -13
.BYTE 11
.BYTE 231
.BYTE 12
.BYTE 232
.BYTE 11
.BYTE 105
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 80
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 23
.BYTE 0
.WORD -2
.BYTE 208
.BYTE 0
.WORD -2
.BYTE 11
.BYTE 151
.BYTE 57
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 80
.BYTE 103
.BYTE 208
.BYTE 208
.BYTE 0
.WORD -12
.BYTE 11
.BYTE 144
.BYTE 12
.BYTE 144
.BYTE 11
.BYTE 144
.BYTE 151
.BYTE 207
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 84
.BYTE 84
.BYTE 208
.BYTE 208
.BYTE 23
.BYTE 210
.BYTE 212
.BYTE 0
.WORD -1
.BYTE 230
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 217
.BYTE 0
.WORD -9
.BYTE 158
.BYTE 208
.BYTE 0
.WORD -3
.BYTE 12
.BYTE 144
.BYTE 144
.BYTE 11
.BYTE 144
.BYTE 144
.BYTE 144
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 238
.BYTE 208
.BYTE 0
.WORD -1
.BYTE 215
.BYTE 16
.BYTE 16
.BYTE 209
.BYTE 0
.WORD -1
.BYTE 110
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 11
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -16
.BYTE 11
.BYTE 144
.BYTE 144
.BYTE 144
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 12
.BYTE 92
.BYTE 11
.BYTE 208
.BYTE 0
.WORD -1
.BYTE 11
.BYTE 208
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 15
.BYTE 207
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 213
.BYTE 215
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 12
.BYTE 80
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -11
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -2
.BYTE 11
.BYTE 144
.BYTE 144
.BYTE 144
.BYTE 0
.WORD -1
.BYTE 11
.BYTE 144
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 12
.BYTE 229
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -1
.BYTE 12
.BYTE 144
.BYTE 144
.BYTE 15
.BYTE 208
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 105
.BYTE 0
.WORD -1
.BYTE 101
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 11
.BYTE 229
.BYTE 231
.BYTE 0
.WORD -3
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -8
.BYTE 11
.BYTE 144
.BYTE 144
.BYTE 144
.BYTE 144
.BYTE 144
.BYTE 0
.WORD -1
.BYTE 12
.BYTE 144
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 12
.BYTE 191
.BYTE 144
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -1
.BYTE 12
.BYTE 208
.BYTE 144
.BYTE 144
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -1
.BYTE 211
.BYTE 192
.BYTE 16
.BYTE 16
.BYTE 16
.BYTE 80
.BYTE 64
.BYTE 208
.BYTE 0
.WORD -1
.BYTE 170
.BYTE 12
.BYTE 144
.BYTE 0
.WORD -2
.BYTE 2
.BYTE 0
.STRG ""
.BYTE 208
.BYTE 0
.WORD -8
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -1
.BYTE 11
.BYTE 144
.BYTE 0
.WORD -2
.BYTE 0
.WORD -999
.BYTE 10
.BYTE 18
.BYTE 209
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 10
.BYTE 17
.BYTE 195
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 8
.BYTE 225
.BYTE 10
.BYTE 18
.BYTE 209
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 9
.BYTE 104
.BYTE 10
.BYTE 21
.BYTE 31
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 10
.BYTE 143
.BYTE 10
.BYTE 22
.BYTE 96
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 11
.BYTE 48
.BYTE 10
.BYTE 22
.BYTE 96
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 11
.BYTE 48
.BYTE 20
.BYTE 25
.BYTE 30
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 12
.BYTE 143
.BYTE 10
.BYTE 28
.BYTE 49
.BYTE 18
.BYTE 209
.BYTE 11
.BYTE 48
.BYTE 20
.BYTE 22
.BYTE 96
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 40
.BYTE 28
.BYTE 49
.BYTE 18
.BYTE 209
.BYTE 11
.BYTE 48
.BYTE 20
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 7
.BYTE 12
.BYTE 10
.BYTE 25
.BYTE 30
.BYTE 17
.BYTE 195
.BYTE 10
.BYTE 143
.BYTE 20
.BYTE 25
.BYTE 30
.BYTE 17
.BYTE 195
.BYTE 10
.BYTE 143
.BYTE 40
.BYTE 25
.BYTE 30
.BYTE 17
.BYTE 195
.BYTE 10
.BYTE 143
.BYTE 20
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 7
.BYTE 112
.BYTE 10
.BYTE 28
.BYTE 49
.BYTE 18
.BYTE 209
.BYTE 11
.BYTE 48
.BYTE 20
.BYTE 28
.BYTE 49
.BYTE 18
.BYTE 209
.BYTE 11
.BYTE 48
.BYTE 35
.BYTE 28
.BYTE 49
.BYTE 18
.BYTE 209
.BYTE 11
.BYTE 48
.BYTE 5
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 7
.BYTE 12
.BYTE 5
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 7
.BYTE 233
.BYTE 5
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 8
.BYTE 225
.BYTE 10
.BYTE 18
.BYTE 209
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 9
.BYTE 104
.BYTE 10
.BYTE 17
.BYTE 195
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 8
.BYTE 225
.BYTE 10
.BYTE 18
.BYTE 209
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 9
.BYTE 104
.BYTE 10
.BYTE 21
.BYTE 31
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 10
.BYTE 143
.BYTE 10
.BYTE 22
.BYTE 96
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 11
.BYTE 48
.BYTE 10
.BYTE 22
.BYTE 96
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 11
.BYTE 48
.BYTE 20
.BYTE 25
.BYTE 30
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 12
.BYTE 143
.BYTE 10
.BYTE 28
.BYTE 49
.BYTE 18
.BYTE 209
.BYTE 11
.BYTE 48
.BYTE 20
.BYTE 28
.BYTE 49
.BYTE 18
.BYTE 209
.BYTE 11
.BYTE 48
.BYTE 30
.BYTE 28
.BYTE 49
.BYTE 18
.BYTE 209
.BYTE 11
.BYTE 48
.BYTE 10
.BYTE 22
.BYTE 96
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 11
.BYTE 48
.BYTE 10
.BYTE 25
.BYTE 30
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 10
.BYTE 143
.BYTE 20
.BYTE 28
.BYTE 49
.BYTE 22
.BYTE 96
.BYTE 9
.BYTE 104
.BYTE 20
.BYTE 25
.BYTE 30
.BYTE 21
.BYTE 31
.BYTE 8
.BYTE 97
.BYTE 10
.BYTE 22
.BYTE 96
.BYTE 18
.BYTE 209
.BYTE 7
.BYTE 119
.BYTE 10
.BYTE 22
.BYTE 96
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 20
.BYTE 21
.BYTE 31
.BYTE 17
.BYTE 195
.BYTE 7
.BYTE 12
.BYTE 30
.BYTE 18
.BYTE 209
.BYTE 14
.BYTE 24
.BYTE 9
.BYTE 104
.BYTE 20
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 7
.BYTE 12
.BYTE 30
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 3
.BYTE 0
.BYTE 4
.BYTE 180
.BYTE 0
.WORD -1
.BYTE $FF
; ******** DATA END ********
CONSTANTS_END
;###################################
; *** VARIABLES ***
VARIABLES
; VAR: RS%
VAR_RS%	.WORD 0
; VAR: OB%
VAR_OB%	.WORD 0
; VAR: CP
VAR_CP	.REAL 0.0
; VAR: PN
VAR_PN	.REAL 0.0
; VAR: AT
VAR_AT	.REAL 0.0
; VAR: DC
VAR_DC	.REAL 0.0
; VAR: EL
VAR_EL	.REAL 0.0
; VAR: RL
VAR_RL	.REAL 0.0
; VAR: LQ
VAR_LQ	.REAL 0.0
; VAR: HQ
VAR_HQ	.REAL 0.0
; VAR: WF
VAR_WF	.REAL 0.0
; VAR: PT
VAR_PT	.REAL 0.0
; VAR: IM
VAR_IM	.REAL 0.0
; VAR: VC
VAR_VC	.REAL 0.0
; VAR: AC
VAR_AC	.REAL 0.0
; VAR: I
VAR_I	.REAL 0.0
; VAR: IC
VAR_IC	.REAL 0.0
; VAR: VW%[]
.BYTE 0
.WORD 6
VAR_VW%[]	.ARRAY 6
; VAR: TI
VAR_TI	.REAL 0.0
; VAR: TT
VAR_TT	.REAL 0.0
; VAR: SB
VAR_SB	.REAL 0.0
; VAR: VL[]
.BYTE 1
.WORD 15
VAR_VL[]	.ARRAY 15
; VAR: VT%[]
.BYTE 0
.WORD 6
VAR_VT%[]	.ARRAY 6
; VAR: HH
VAR_HH	.REAL 0.0
; VAR: CI%[]
.BYTE 0
.WORD 8
VAR_CI%[]	.ARRAY 8
; VAR: SC%[]
.BYTE 0
.WORD 8
VAR_SC%[]	.ARRAY 8
; VAR: CG[]
.BYTE 1
.WORD 25
VAR_CG[]	.ARRAY 25
; VAR: PC[]
.BYTE 1
.WORD 10
VAR_PC[]	.ARRAY 10
; VAR: SB%[]
.BYTE 0
.WORD 18
VAR_SB%[]	.ARRAY 18
; VAR: PO%[]
.BYTE 0
.WORD 4
VAR_PO%[]	.ARRAY 4
; VAR: PI
VAR_PI	.REAL 0.0
; VAR: RP
VAR_RP	.REAL 0.0
; VAR: AF%[]
.BYTE 0
.WORD 4
VAR_AF%[]	.ARRAY 4
; VAR: YY
VAR_YY	.REAL 0.0
; VAR: CC
VAR_CC	.REAL 0.0
; VAR: SP
VAR_SP	.REAL 0.0
; VAR: S
VAR_S	.REAL 0.0
; VAR: PM
VAR_PM	.REAL 0.0
; VAR: PM[]
.BYTE 1
.WORD 35
VAR_PM[]	.ARRAY 35
; VAR: X
VAR_X	.REAL 0.0
; VAR: SC
VAR_SC	.REAL 0.0
; VAR: EC
VAR_EC	.REAL 0.0
; VAR: Y
VAR_Y	.REAL 0.0
; VAR: SA
VAR_SA	.REAL 0.0
; VAR: SE
VAR_SE	.REAL 0.0
; VAR: XE
VAR_XE	.REAL 0.0
; VAR: YP
VAR_YP	.REAL 0.0
; VAR: PA
VAR_PA	.REAL 0.0
; VAR: PE
VAR_PE	.REAL 0.0
; VAR: CF
VAR_CF	.REAL 0.0
; VAR: WP
VAR_WP	.REAL 0.0
; VAR: PA[]
.BYTE 1
.WORD 10
VAR_PA[]	.ARRAY 10
; VAR: PD[]
.BYTE 1
.WORD 10
VAR_PD[]	.ARRAY 10
; VAR: PP[]
.BYTE 1
.WORD 10
VAR_PP[]	.ARRAY 10
; VAR: PX[]
.BYTE 1
.WORD 10
VAR_PX[]	.ARRAY 10
; VAR: HP%[]
.BYTE 0
.WORD 4
VAR_HP%[]	.ARRAY 4
; VAR: PY[]
.BYTE 1
.WORD 10
VAR_PY[]	.ARRAY 10
; VAR: AI
VAR_AI	.REAL 0.0
; VAR: AD
VAR_AD	.REAL 0.0
; VAR: PC
VAR_PC	.REAL 0.0
; VAR: XP
VAR_XP	.REAL 0.0
; VAR: DD
VAR_DD	.REAL 0.0
; VAR: KC
VAR_KC	.REAL 0.0
; VAR: MA
VAR_MA	.REAL 0.0
; VAR: BB%[]
.BYTE 0
.WORD 6
VAR_BB%[]	.ARRAY 6
; VAR: BC%[]
.BYTE 0
.WORD 6
VAR_BC%[]	.ARRAY 6
; VAR: AA
VAR_AA	.REAL 0.0
; VAR: PP
VAR_PP	.REAL 0.0
; VAR: PH
VAR_PH	.REAL 0.0
; VAR: PL
VAR_PL	.REAL 0.0
; VAR: PO%
VAR_PO%	.WORD 0
; VAR: OC
VAR_OC	.REAL 0.0
; VAR: OA
VAR_OA	.REAL 0.0
; VAR: AF
VAR_AF	.REAL 0.0
; VAR: PF
VAR_PF	.REAL 0.0
; VAR: SF
VAR_SF	.REAL 0.0
; VAR: XF
VAR_XF	.REAL 0.0
; VAR: YF
VAR_YF	.REAL 0.0
; VAR: DX
VAR_DX	.REAL 0.0
; VAR: DY
VAR_DY	.REAL 0.0
; VAR: PO
VAR_PO	.REAL 0.0
; VAR: XX%
VAR_XX%	.WORD 0
; VAR: OV
VAR_OV	.REAL 0.0
; VAR: CS%
VAR_CS%	.WORD 0
; VAR: XI
VAR_XI	.REAL 0.0
; VAR: PJ
VAR_PJ	.REAL 0.0
; VAR: PV
VAR_PV	.REAL 0.0
; VAR: PY
VAR_PY	.REAL 0.0
; VAR: PX
VAR_PX	.REAL 0.0
; VAR: P
VAR_P	.REAL 0.0
; VAR: PS[]
.BYTE 1
.WORD 10
VAR_PS[]	.ARRAY 10
; VAR: CK
VAR_CK	.REAL 0.0
; VAR: PD
VAR_PD	.REAL 0.0
; VAR: OO
VAR_OO	.REAL 0.0
; VAR: A
VAR_A	.REAL 0.0
; VAR: CO
VAR_CO	.REAL 0.0
; VAR: J
VAR_J	.REAL 0.0
; VAR: II
VAR_II	.REAL 0.0
; VAR: T
VAR_T	.REAL 0.0
; VAR: H1
VAR_H1	.REAL 0.0
; VAR: L1
VAR_L1	.REAL 0.0
; VAR: H2
VAR_H2	.REAL 0.0
; VAR: L2
VAR_L2	.REAL 0.0
; VAR: H3
VAR_H3	.REAL 0.0
; VAR: L3
VAR_L3	.REAL 0.0
STRINGVARS_START
; VAR: DN$
VAR_DN$	.WORD EMPTYSTR
; VAR: HM$
VAR_HM$	.WORD EMPTYSTR
; VAR: LF$
VAR_LF$	.WORD EMPTYSTR
; VAR: AS$
VAR_AS$	.WORD EMPTYSTR
; VAR: A$
VAR_A$	.WORD EMPTYSTR
; VAR: P$
VAR_P$	.WORD EMPTYSTR
; VAR: TI$
VAR_TI$ .WORD EMPTYSTR
STRINGVARS_END
STRINGARRAYS_START
; VAR: PO$[]
.BYTE 2
.WORD 4
VAR_PO$[]
.WORD EMPTYSTR EMPTYSTR
; VAR: PN$[]
.BYTE 2
.WORD 4
VAR_PN$[]
.WORD EMPTYSTR EMPTYSTR
STRINGARRAYS_END
VARIABLES_END
; *** INTERNAL ***
Y_REG	.REAL 0.0
C_REG	.REAL 0.0
D_REG	.REAL 0.0
E_REG	.REAL 0.0
F_REG	.REAL 0.0
A_REG	.WORD 0
B_REG	.WORD 0
CMD_NUM	.BYTE 0
CHANNEL	.BYTE 0
SP_SAVE	.BYTE 0
TMP2_REG	.WORD 0
TMP3_REG	.WORD 0
TMP4_REG	.WORD 0
AS_TMP	.WORD 0
BPOINTER_TMP	.WORD 0
BASICTEXTP	.BYTE 0
STORE1	.WORD 0
STORE2	.WORD 0
STORE3	.WORD 0
STORE4	.WORD 0
GCSTART	.WORD 0
GCLEN	.WORD 0
GCWORK	.WORD 0
TMP_FREG	.REAL 0
TMP2_FREG	.REAL 0
TMP_FLAG	.BYTE 0
REAL_CONST_ONE	.REAL 1.0
REAL_CONST_ZERO	.REAL 0.0
REAL_CONST_MINUS_ONE	.REAL -1.0
CHLOCKFLAG	.BYTE 0
EMPTYSTR	.BYTE 0
FPSTACKP	.WORD FPSTACK
FORSTACKP	.WORD FORSTACK
DATASP	.WORD DATAS
LASTVAR	.WORD 0
LASTVARP	.WORD 0
HIGHP	.WORD STRBUF
STRBUFP	.WORD STRBUF
ENDSTRBUF	.WORD 0
INPUTQUEUEP	.BYTE 0
PROGRAMEND
INPUTQUEUE	.ARRAY $0F
FPSTACK .ARRAY 100
FORSTACK .ARRAY 340
STRBUF	.BYTE 0
