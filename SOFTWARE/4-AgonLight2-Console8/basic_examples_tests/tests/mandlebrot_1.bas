   10 REM PROGRAM TO DRAW MANDLEBROT SET
   20 REM P.MAINWARING, MARCH 19TH 1990
   30 :
   40 MODE 2
   50 ITERS=32
   60 SCALE=1
   70 XRANGE=-2.5
   80 YRANGE=-1
   90 DIM A%(3),B%(3)
  100 :
  110 FOR I%=0 TO 3
  120   READ A%(I%),B%(I%)
  130 NEXT
  140 :
  150 DATA 0,0,1,1,0,1,1,0
  160 :
  170 XSTP=1280/320
  180 YSTP=1024/200
  190 COLS=64
  200 MAXX=1280
  210 MAXY=1024
  220 FOR I%=0 TO 3
  230   FOR J%=A%(I%) TO MAXY/SCALE STEP YSTP
  240     FOR K%=B%(I%) TO MAXX/SCALE STEP XSTP
  250       CR=XRANGE+K%*4/(MAXX/SCALE)
  260       CI=YRANGE+J%*3/(MAXX/SCALE)
  270       ZM=0:ZR=0:ZI=0:ZR2=0:ZI2=0
  280       IT=0
  290       REPEAT
  300         Z1=ZR2-ZI2+CR
  310         Z2=2*ZR*ZI+CI
  320         ZR=Z1
  330         ZI=Z2
  340         ZR2=ZR*ZR
  350         ZI2=ZI*ZI
  360         ZM=ZR2+ZI2
  370         IT=IT+1
  380       UNTIL IT=ITERS OR ZM>=4
  390       C%=COLS-1-INT(IT/(ITERS/(COLS-1)))
  430       GCOL 0,C%+16
  440       PLOT 69,K%,J%
  450     NEXT
  460   NEXT
  470 NEXT
  480 A%=GET
  490 MODE 1
