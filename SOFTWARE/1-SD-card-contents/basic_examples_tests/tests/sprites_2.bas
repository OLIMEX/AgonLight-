   10 REM Sprite Demo
   20 :
   30 MODE 2
   40 SW%=320
   50 SH%=200
   60 C%=16
   70 :
   80 REM Create a simple bitmap
   90 :
  100 VDU 23,27,0,0: REM Select bitmap 0
  110 READ W%,H%
  120 VDU 23,27,1,W%;H%;
  130 FOR I%=1 TO W%*H%
  140   READ B%
  150   VDU B%,B%,B%,B%
  160 NEXT
  170 :
  180 REM Set up some sprites
  190 :
  200 DIM sprite% ((C%*6)-1)
  210 :
  220 FOR I%=0 TO C%-1
  230   P%=sprite%+(I%*6)
  240   X%=RND(SW%)
  250   Y%=RND(SH%)
  260   ?(P%+0)=(X% AND &FF)
  270   ?(P%+1)=(X%/256)
  280   ?(P%+2)=(Y% AND &FF)
  290   ?(P%+3)=(Y%/256)
  300   ?(P%+4)=1
  310   ?(P%+5)=1
  320   VDU 23,27,4,I%: REM Select sprite I%
  330   VDU 23,27,5: REM Clear frames for current sprite
  340   VDU 23,27,6,0: REM Add bitmap 0 as frame 0 of sprite
  350   VDU 23,27,11: REM Show the sprite
  360 NEXT
  370 VDU 23,27,7,C%
  380 :
  390 REM Move the sprite
  400 :
  410 FOR I%=0 TO C%-1
  420   P%=sprite%+(I%*6)
  430   X%=?(P%+0)+256*?(P%+1)
  440   Y%=?(P%+2)+256*?(P%+3)
  450   XD%=?(P%+4):IF XD%=&FF THEN XD%=-1
  460   YD%=?(P%+5):IF YD%=&FF THEN YD%=-1
  470   VDU 23,27,4,I%,23,27,13,X%;Y%;
  480   X%=X%+XD%
  490   Y%=Y%+YD%
  500   IF X%<0 OR X%>SW% THEN XD%=-XD%:X%=X%+XD%
  510   IF Y%<0 OR Y%>SH% THEN YD%=-YD%:Y%=Y%+YD%
  520   ?(P%+0)=(X% AND &FF)
  530   ?(P%+1)=(X%/256)
  540   ?(P%+2)=(Y% AND &FF)
  550   ?(P%+3)=(Y%/256)
  560   ?(P%+4)=XD% AND &FF
  570   ?(P%+5)=YD% AND &FF
  580 NEXT
  590 :
  600 *FX 19
  610 VDU 23,27,15: REM Refresh the sprites
  620 :
  630 GOTO 410
  640 :
  650 STOP
  660 :
  670 REM Bitmap data
  680 :
  690 DATA 16,16
  700 :
  710 DATA 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
  720 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  730 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  740 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  750 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  760 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  770 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  780 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  790 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  800 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  810 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  820 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  830 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  840 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  850 DATA 255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255
  860 DATA 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
