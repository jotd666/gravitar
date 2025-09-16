	; ADAPTATION,DISTRIBUTION,PERFORMANCEOR DISPLAY OF
	; THIS COMPUTER PROGRAM OR THE ASSOCIATED AUDIOVISUAL
	; WORK IS STRICTLY PROHIBITED!!!!!!!
	;	*********************************
	;	*MODULE:LUNAR BATTLE MAIN	*
	;	*				*
	;	*PROGRAMMER:RICHARD ADAM	*
	;	*				*
	;	*FUNCTION:LOONY STATE HANDLER	*
	;	*				*
	;	*********************************
    ; source name: LOONYM.MAC


9000: A9 16    lda #$16			;SET ATTRACT MODE
9002: 85 00    sta $00
9004: 85 01    sta $01
9006: A9 08    lda #$08
9008: 85 EB    sta $eb
900A: 85 EC    sta $ec
900C: A9 00    lda #$00
900E: 85 D0    sta $d0
9010: 85 4F    sta $4f
9012: 20 2D DE jsr $de2d
9015: 20 9E CB jsr $cb9e		;INITIALIZE HI SCORES
9018: 20 C2 E1 jsr $e1c2		;INITIALIZE SOUNDS
901B: 20 A6 CA jsr $caa6		;MOVE FROM EA BUFR TO TABLE
901E: A9 00    lda #$00
9020: 85 F2    sta $f2
9022: 20 36 90 jsr $9036		;DO GAME STATE
9025: 20 97 90 jsr $9097
9028: 20 72 CD jsr $cd72
902B: AD 00 78 lda $7800
902E: 29 10    and #$10
9030: D0 EC    bne $901e
9032: 4C 8B ED jmp $ed8b
9036: A6 CF    ldx $cf
9038: B5 00    lda $00, x
903A: AA       tax
903B: A5 FA    lda $fa
903D: 10 0B    bpl $904a
903F: BD 7A 90 lda $907a, x
9042: 48       pha
9043: BD 79 90 lda $9079, x
9046: 48       pha
9047: 4C 52 90 jmp $9052
904A: BD 54 90 lda $9054, x
904D: 48       pha
904E: BD 53 90 lda $9053, x
9051: 48       pha
9052: 60       rts

TODO create table with values minus 1!
    .word	$50FF 
    .word	$4F91 
    .word	$53BD 
    .word	$57D3 
    .word	$93ED 
    .word	$5058 
    .word	$5106 
    .word	$52A2
    .word	$92B4 
    .word	$927B 
    .word	$935A 
    .word	$55F2 
    .word	$910B 
    .word	$934A 
    .word	$9213 
    .word	$CB34
    .word	$94A8
    .word	$9401 
    .word	$9551 
     
    .word	$50FF 
    .word	$4F91 
    .word	$53BD 
    .word	$5721 
    .word	$91ED
    .word	$5058 
    .word	$5106 
    .word	$52A2 
    .word	$92B4 
    .word	$927B 
    .word	$935A 
    .word	$5575 
    .word	$910B
    .word	$93B5 

  
9097: A6 CF    ldx $cf
9099: E6 4F    inc $4f
909B: A5 D0    lda $d0
909D: D0 3B    bne $90da
909F: A5 F1    lda $f1
90A1: 29 03    and #$03
90A3: D0 04    bne $90a9
90A5: A9 02    lda #$02
90A7: 85 D6    sta $d6
90A9: A0 FF    ldy #$ff
90AB: A5 D6    lda $d6
90AD: F0 17    beq $90c6
90AF: C9 02    cmp #$02
90B1: A5 1D    lda $1d
90B3: 90 09    bcc $90be
90B5: 29 40    and #$40
90B7: F0 05    beq $90be
90B9: A0 02    ldy #$02
90BB: 4C C6 90 jmp $90c6
90BE: A5 1D    lda $1d
90C0: 29 20    and #$20
90C2: F0 02    beq $90c6
90C4: A0 00    ldy #$00
90C6: 98       tya
90C7: 30 0E    bmi $90d7
90C9: 95 00    sta $00, x
90CB: 24 F9    bit $f9
90CD: 30 08    bmi $90d7
90CF: A9 FF    lda #$ff
90D1: 85 F9    sta $f9
90D3: A9 04    lda #$04
90D5: 85 FC    sta $fc
90D7: 4C E0 90 jmp $90e0
90DA: 24 F9    bit $f9
90DC: 30 02    bmi $90e0
90DE: C6 F9    dec $f9
90E0: 60       rts
90E1: A9 FF    lda #$ff
90E3: 85 FA    sta $fa
90E5: A9 01    lda #$01
90E7: 8D 00 20 sta $2000
90EA: A9 E2    lda #$e2
90EC: 8D 01 20 sta $2001
90EF: A9 20    lda #$20
90F1: 8D 03 20 sta $2003
90F4: 8D 03 24 sta $2403
90F7: A9 00    lda #$00
90F9: 85 00    sta $00
90FB: A9 00    lda #$00
90FD: 85 EB    sta $eb
90FF: 20 C2 E1 jsr $e1c2
9102: E6 4F    inc $4f
9104: A5 42    lda $42
9106: C9 01    cmp #$01
9108: B0 04    bcs $910e
910A: A9 01    lda #$01
910C: 85 42    sta $42
910E: A9 00    lda #$00
9110: 85 F2    sta $f2
9112: 20 36 90 jsr $9036
9115: 20 72 CD jsr $cd72
9118: AD 00 78 lda $7800
911B: 29 10    and #$10
911D: F0 E3    beq $9102
911F: 4C 3A E8 jmp $e83a
9122: 20 07 C7 jsr $c707
9125: 20 D1 98 jsr $98d1
9128: 20 60 9F jsr $9f60
912B: A5 88    lda $88
912D: F0 1B    beq $914a
912F: 20 98 95 jsr $9598
9132: 20 64 97 jsr $9764
9135: 20 7E 98 jsr $987e
9138: 20 11 97 jsr $9711
913B: 20 3D C4 jsr $c43d
913E: 20 E8 A0 jsr $a0e8
9141: 20 D2 BE jsr $bed2
9144: 20 B2 BD jsr $bdb2
9147: 20 30 BE jsr $be30
914A: 20 EE C4 jsr $c4ee
914D: 20 D9 9D jsr $9dd9
9150: 20 05 9E jsr $9e05
9153: 20 7E 9C jsr $9c7e
9156: 20 B1 9C jsr $9cb1
9159: 20 A6 BF jsr $bfa6
915C: 20 BE BC jsr $bcbe
915F: 20 2F BC jsr $bc2f
9162: 20 D5 C3 jsr $c3d5
9165: 20 6F C8 jsr $c86f
9168: 20 85 C0 jsr $c085
916B: 20 72 C9 jsr $c972
916E: 20 12 9C jsr $9c12
9171: A9 02    lda #$02
9173: 85 EB    sta $eb
9175: 60       rts
9176: A9 01    lda #$01
9178: 85 CE    sta $ce
917A: A5 88    lda $88
917C: F0 18    beq $9196
917E: 20 D1 98 jsr $98d1
9181: 20 98 95 jsr $9598
9184: 20 A7 97 jsr $97a7
9187: 20 11 97 jsr $9711
918A: 20 3D C4 jsr $c43d
918D: 20 E5 C1 jsr $c1e5
9190: 20 9F BB jsr $bb9f
9193: 20 B3 C0 jsr $c0b3
9196: 20 63 9C jsr $9c63
9199: 20 33 9B jsr $9b33
919C: 20 8E C5 jsr $c58e
919F: 20 D5 C3 jsr $c3d5
91A2: 20 30 BE jsr $be30
91A5: 20 07 C7 jsr $c707
91A8: 20 6F C8 jsr $c86f
91AB: 20 85 C0 jsr $c085
91AE: 20 3E 9C jsr $9c3e
91B1: A9 0A    lda #$0a
91B3: 85 EB    sta $eb
91B5: 60       rts
91B6: A9 01    lda #$01
91B8: 85 CE    sta $ce
91BA: A9 60    lda #$60
91BC: 85 30    sta $30
91BE: A5 88    lda $88
91C0: F0 0F    beq $91d1
91C2: 20 98 95 jsr $9598
91C5: 20 7E 98 jsr $987e
91C8: 20 11 97 jsr $9711
91CB: 20 D1 98 jsr $98d1
91CE: 20 3D C4 jsr $c43d
91D1: A6 86    ldx $86
91D3: 20 3C 9B jsr $9b3c
91D6: 20 04 9D jsr $9d04
91D9: 20 9E C5 jsr $c59e
91DC: 20 F3 BB jsr $bbf3
91DF: 20 07 C7 jsr $c707
91E2: 20 7B BF jsr $bf7b
91E5: 20 6F C8 jsr $c86f
91E8: 20 85 C0 jsr $c085
91EB: 20 3E 9C jsr $9c3e
91EE: A9 0A    lda #$0a
91F0: 85 EB    sta $eb
91F2: 60       rts
91F3: A9 01    lda #$01
91F5: 85 CE    sta $ce
91F7: A6 CF    ldx $cf
91F9: B5 88    lda $88, x
91FB: F0 1B    beq $9218
91FD: 20 D1 98 jsr $98d1
9200: 20 98 95 jsr $9598
9203: 20 A7 97 jsr $97a7
9206: 20 11 97 jsr $9711
9209: 20 3D C4 jsr $c43d
920C: 20 E5 C1 jsr $c1e5
920F: 20 62 BC jsr $bc62
9212: 20 76 96 jsr $9676
9215: 20 B3 C0 jsr $c0b3
9218: 20 9F BB jsr $bb9f
921B: 20 63 9C jsr $9c63
921E: 20 33 9B jsr $9b33
9221: 20 8E C5 jsr $c58e
9224: 20 D5 C3 jsr $c3d5
9227: 20 30 BE jsr $be30
922A: 20 07 C7 jsr $c707
922D: 20 6F C8 jsr $c86f
9230: 20 85 C0 jsr $c085
9233: 20 3E 9C jsr $9c3e
9236: A5 F0    lda $f0
9238: 29 C0    and #$c0
923A: C9 C0    cmp #$c0
923C: F0 06    beq $9244
923E: A9 02    lda #$02
9240: 05 F5    ora $f5
9242: 85 F5    sta $f5
9244: A6 CF    ldx $cf
9246: A9 0A    lda #$0a
9248: 95 EB    sta $eb, x
924A: 60       rts
924B: A9 01    lda #$01
924D: 85 CE    sta $ce
924F: A9 60    lda #$60
9251: 85 30    sta $30
9253: A6 CF    ldx $cf
9255: B5 88    lda $88, x
9257: F0 0F    beq $9268
9259: 20 98 95 jsr $9598
925C: 20 7E 98 jsr $987e
925F: 20 11 97 jsr $9711
9262: 20 D1 98 jsr $98d1
9265: 20 3D C4 jsr $c43d
9268: A6 86    ldx $86
926A: 20 3C 9B jsr $9b3c
926D: 20 04 9D jsr $9d04
9270: 20 9E C5 jsr $c59e
9273: 20 F3 BB jsr $bbf3
9276: 20 62 BB jsr $bb62
9279: 20 07 C7 jsr $c707
927C: 20 62 BC jsr $bc62
927F: 20 76 96 jsr $9676
9282: 20 7B BF jsr $bf7b
9285: 20 6F C8 jsr $c86f
9288: 20 85 C0 jsr $c085
928B: 20 3E 9C jsr $9c3e
928E: A5 F0    lda $f0
9290: 29 C0    and #$c0
9292: C9 C0    cmp #$c0
9294: F0 06    beq $929c
9296: A9 02    lda #$02
9298: 05 F5    ora $f5
929A: 85 F5    sta $f5
929C: A6 CF    ldx $cf
929E: A9 0A    lda #$0a
92A0: 95 EB    sta $eb, x
92A2: 60       rts
92A3: 20 C8 C9 jsr $c9c8
92A6: 20 CC 92 jsr $92cc
92A9: 20 E6 E4 jsr $e4e6
92AC: A9 00    lda #$00
92AE: 85 D0    sta $d0
92B0: 85 FC    sta $fc
92B2: 85 F9    sta $f9
92B4: 60       rts
92B5: AD 6D 04 lda $046d
92B8: 10 11    bpl $92cb
92BA: A0 FF    ldy #$ff
92BC: 84 30    sty $30
92BE: A6 CF    ldx $cf
92C0: AC 6C 04 ldy $046c
92C3: B9 6F 04 lda $046f, y
92C6: 95 00    sta $00, x
92C8: 20 D7 51 jsr $51d7
92CB: 60       rts
92CC: A5 D0    lda $d0
92CE: F8       sed
92CF: A2 02    ldx #$02
92D1: BD 63 01 lda $0163, x
92D4: 18       clc
92D5: 6D 57 04 adc $0457
92D8: 8D 57 04 sta $0457
92DB: BD 65 01 lda $0165, x
92DE: 6D 58 04 adc $0458
92E1: 8D 58 04 sta $0458
92E4: AD 59 04 lda $0459
92E7: 69 00    adc #$00
92E9: 8D 59 04 sta $0459
92EC: CA       dex
92ED: D0 E2    bne $92d1
92EF: D8       cld
92F0: AD 4E 04 lda $044e
92F3: 18       clc
92F4: 6D 54 04 adc $0454
92F7: 8D 54 04 sta $0454
92FA: AD 4F 04 lda $044f
92FD: 6D 55 04 adc $0455
9300: 8D 55 04 sta $0455
9303: AD 56 04 lda $0456
9306: 69 00    adc #$00
9308: 8D 56 04 sta $0456
930B: 60       rts
930C: A5 30    lda $30
930E: 48       pha
930F: C9 FF    cmp #$ff
9311: D0 03    bne $9316
9313: 20 0B E1 jsr $e10b
9316: 68       pla
9317: C9 80    cmp #$80
9319: 90 1B    bcc $9336
931B: 20 6F C8 jsr $c86f
931E: C6 30    dec $30
9320: A9 00    lda #$00
9322: 85 F5    sta $f5
9324: A6 CF    ldx $cf
9326: BD 7A 01 lda $017a, x
9329: C9 01    cmp #$01
932B: D0 06    bne $9333
932D: A9 01    lda #$01
932F: 05 F5    ora $f5
9331: 85 F5    sta $f5
9333: 4C 6B 93 jmp $936b
9336: A6 CF    ldx $cf
9338: B5 F6    lda $f6, x
933A: 29 01    and #$01
933C: D0 06    bne $9344
933E: 20 F3 53 jsr $53f3
9341: 4C 47 93 jmp $9347
9344: 20 04 54 jsr $5404
9347: A9 07    lda #$07
9349: 8D 38 01 sta $0138
934C: A9 F9    lda #$f9
934E: 8D 39 01 sta $0139
9351: A9 01    lda #$01
9353: 85 28    sta $28
9355: 85 29    sta $29
9357: A9 18    lda #$18
9359: 95 00    sta $00, x
935B: BD 7A 01 lda $017a, x
935E: C9 01    cmp #$01
9360: D0 09    bne $936b
9362: A9 FE    lda #$fe
9364: 25 F5    and $f5
9366: 85 F5    sta $f5
9368: FE 7A 01 inc $017a, x
936B: A6 CF    ldx $cf
936D: A9 0C    lda #$0c
936F: 95 EB    sta $eb, x
9371: 60       rts
9372: A9 00    lda #$00
9374: A2 05    ldx #$05
9376: 95 12    sta $12, x
9378: CA       dex
9379: 10 FB    bpl $9376
937B: 60       rts
937C: A5 30    lda $30
937E: A0 01    ldy #$01
9380: A6 CF    ldx $cf
9382: B5 4D    lda $4d, x
9384: AA       tax
9385: A5 30    lda $30
9387: DD B6 93 cmp $93b6, x
938A: 90 05    bcc $9391
938C: C6 30    dec $30
938E: 4C A0 93 jmp $93a0
9391: A5 D0    lda $d0
9393: D0 05    bne $939a
9395: A9 24    lda #$24
9397: 4C 9C 93 jmp $939c
939A: A9 08    lda #$08
939C: A6 CF    ldx $cf
939E: 95 00    sta $00, x
93A0: 88       dey
93A1: 10 DD    bpl $9380
93A3: A9 EB    lda #$eb
93A5: 25 F4    and $f4
93A7: 85 F4    sta $f4
93A9: A9 FD    lda #$fd
93AB: 25 F5    and $f5
93AD: 85 F5    sta $f5
93AF: A6 CF    ldx $cf
93B1: A9 06    lda #$06
93B3: 95 EB    sta $eb, x
93B5: 60       rts
93B6: 81 81    sta ($81, x)
93B8: 81 64    sta ($64, x)
93BA: 60       rts
93BB: 81 81    sta ($81, x)
93BD: 81 50    sta ($50, x)
93BF: 60       rts
93C0: 81 81    sta ($81, x)
93C2: 70 81    bvs $9345
93C4: 60       rts

93D7: 20 D1 98 jsr $98d1
93DA: 20 60 9F jsr $9f60
93DD: A6 CF    ldx $cf
93DF: B5 88    lda $88, x
93E1: F0 21    beq $9404
93E3: 20 98 95 jsr $9598
93E6: 20 64 97 jsr $9764
93E9: 20 7E 98 jsr $987e
93EC: 20 11 97 jsr $9711
93EF: 20 3D C4 jsr $c43d
93F2: 20 E8 A0 jsr $a0e8
93F5: 20 D2 BE jsr $bed2
93F8: 20 62 BC jsr $bc62
93FB: 20 B2 BD jsr $bdb2
93FE: 20 94 BB jsr $bb94
9401: 20 30 BE jsr $be30
9404: 20 EE C4 jsr $c4ee
9407: 20 D9 9D jsr $9dd9
940A: 20 05 9E jsr $9e05
940D: 20 7E 9C jsr $9c7e
9410: 20 B1 9C jsr $9cb1
9413: 20 A6 BF jsr $bfa6
9416: 20 BE BC jsr $bcbe
9419: 20 2F BC jsr $bc2f
941C: 20 D5 C3 jsr $c3d5
941F: 20 76 96 jsr $9676
9422: 20 6F C8 jsr $c86f
9425: 20 85 C0 jsr $c085
9428: 20 72 C9 jsr $c972
942B: 20 12 9C jsr $9c12
942E: A6 CF    ldx $cf
9430: A9 02    lda #$02
9432: 95 EB    sta $eb, x
9434: 60       rts
9435: A9 38    lda #$38
9437: 85 0F    sta $0f
9439: A2 FF    ldx #$ff
943B: 86 10    stx $10
943D: E8       inx
943E: 8E 36 01 stx $0136
9441: 8D 37 01 sta $0137
9444: 86 0D    stx $0d
9446: 86 0E    stx $0e
9448: 86 1E    stx $1e
944A: 86 4B    stx $4b
944C: 8E 44 01 stx $0144
944F: 8E 6E 04 stx $046e
9452: 8E 7D 01 stx $017d
9455: 8E 7E 01 stx $017e
9458: 86 F5    stx $f5
945A: A9 A0    lda #$a0
945C: 8D 7C 01 sta $017c
945F: A9 04    lda #$04
9461: 85 27    sta $27
9463: 85 11    sta $11
9465: 85 4C    sta $4c
9467: 86 EE    stx $ee
9469: 86 CF    stx $cf
946B: 86 F6    stx $f6
946D: 8E 3C 01 stx $013c
9470: 85 28    sta $28
9472: 85 29    sta $29
9474: A9 06    lda #$06
9476: 8D 38 01 sta $0138
9479: A9 FA    lda #$fa
947B: 8D 39 01 sta $0139
947E: A9 02    lda #$02
9480: 85 49    sta $49
9482: 85 E3    sta $e3
9484: 20 1D DE jsr $de1d
9487: 20 19 54 jsr $5419
948A: 20 72 93 jsr $9372
948D: 20 67 54 jsr $5467
9490: 20 A9 50 jsr $50a9
9493: A9 80    lda #$80
9495: 85 30    sta $30
9497: A9 01    lda #$01
9499: 85 CE    sta $ce
949B: AD BE 59 lda $59be
949E: 85 18    sta $18
94A0: A9 22    lda #$22
94A2: 85 00    sta $00
94A4: A9 10    lda #$10
94A6: 95 EB    sta $eb, x
94A8: 60       rts
94A9: 20 E7 98 jsr $98e7
94AC: 20 B1 95 jsr $95b1
94AF: 20 07 C7 jsr $c707
94B2: 20 64 97 jsr $9764
94B5: 20 B3 C0 jsr $c0b3
94B8: 20 63 9C jsr $9c63
94BB: 20 8E C5 jsr $c58e
94BE: 20 33 9B jsr $9b33
94C1: 20 D5 C3 jsr $c3d5
94C4: 20 82 95 jsr $9582
94C7: A9 14    lda #$14
94C9: 20 63 95 jsr $9563
94CC: 85 F4    sta $f4
94CE: A9 80    lda #$80
94D0: 05 F2    ora $f2
94D2: 85 F2    sta $f2
94D4: A9 10    lda #$10
94D6: 85 EB    sta $eb
94D8: 60       rts
94D9: CE 7C 01 dec $017c
94DC: D0 13    bne $94f1
94DE: AC 7E 01 ldy $017e
94E1: C8       iny
94E2: B9 F1 94 lda $94f1, y
94E5: 8D 7D 01 sta $017d
94E8: B9 F9 94 lda $94f9, y
94EB: 8D 7C 01 sta $017c
94EE: 8C 7E 01 sty $017e
94F1: 60       rts
94F2: 08       php
94F3: 01 04    ora ($04, x)
94F5: 00       brk
94F6: 02       kil
94F7: 08       php
94F8: 01 00    ora ($00, x)
94FA: 04 02    nop $02
94FC: 20 20 36 jsr $3620
94FF: 0E 01 FF asl $ff01
9502: 20 07 C7 jsr $c707
9505: A5 88    lda $88
9507: F0 3C    beq $9545
9509: 20 D9 94 jsr $94d9
950C: 20 E7 98 jsr $98e7
950F: 20 60 9F jsr $9f60
9512: 20 65 96 jsr $9665
9515: 20 64 97 jsr $9764
9518: 20 7E 98 jsr $987e
951B: 20 6F 95 jsr $956f
951E: 20 3A 97 jsr $973a
9521: 20 E8 A0 jsr $a0e8
9524: 20 E3 C4 jsr $c4e3
9527: 20 25 BF jsr $bf25
952A: 20 62 BC jsr $bc62
952D: 20 EE C4 jsr $c4ee
9530: 20 D9 9D jsr $9dd9
9533: 20 05 9E jsr $9e05
9536: 20 D5 C3 jsr $c3d5
9539: 20 7E 9C jsr $9c7e
953C: 20 B1 9C jsr $9cb1
953F: 20 A6 BF jsr $bfa6
9542: 20 BE BC jsr $bcbe
9545: 20 6F C8 jsr $c86f
9548: 20 85 C0 jsr $c085
954B: A9 7F    lda #$7f
954D: 25 F2    and $f2
954F: 85 F2    sta $f2
9551: A9 60    lda #$60
9553: 20 63 95 jsr $9563
9556: 85 F4    sta $f4
9558: 20 72 C9 jsr $c972
955B: 20 82 95 jsr $9582
955E: A9 12    lda #$12
9560: 85 EB    sta $eb
9562: 60       rts
9563: A6 D6    ldx $d6
9565: F0 05    beq $956c
9567: 09 08    ora #$08
9569: 4C 6E 95 jmp $956e
956C: 29 F7    and #$f7
956E: 60       rts
956F: AD 7D 01 lda $017d
9572: 29 04    and #$04
9574: F0 02    beq $9578
9576: C6 11    dec $11
9578: AD 7D 01 lda $017d
957B: 29 08    and #$08
957D: F0 02    beq $9581
957F: E6 11    inc $11
9581: 60       rts
9582: A5 00    lda $00
9584: A8       tay
9585: C9 08    cmp #$08
9587: D0 02    bne $958b
9589: A0 24    ldy #$24
958B: C9 0A    cmp #$0a
958D: D0 02    bne $9591
958F: A0 16    ldy #$16
9591: 84 00    sty $00
9593: A9 FF    lda #$ff
9595: 85 3F    sta $3f
9597: 60       rts
9598: A9 00    lda #$00
959A: 85 4C    sta $4c
959C: A5 1D    lda $1d
959E: 29 10    and #$10
95A0: D0 01    bne $95a3
95A2: 60       rts
95A3: 18       clc
95A4: F8       sed
95A5: A5 48    lda $48
95A7: 69 06    adc #$06
95A9: 85 48    sta $48
95AB: D8       cld
95AC: 85 4C    sta $4c
95AE: 20 EF E0 jsr $e0ef
95B1: A5 11    lda $11
95B3: 29 0F    and #$0f
95B5: A8       tay
95B6: A5 1E    lda $1e
95B8: 4A       lsr a
95B9: 4A       lsr a
95BA: B0 06    bcs $95c2
95BC: B9 54 97 lda $9754, y
95BF: 4C C5 95 jmp $95c5
95C2: B9 44 97 lda $9744, y
95C5: 85 1A    sta $1a
95C7: A5 28    lda $28
95C9: 85 19    sta $19
95CB: 20 6E DE jsr multiply_de6e
95CE: A4 1E    ldy $1e
95D0: 46 1C    lsr resh_1c
95D2: 66 1B    ror resl_1b
95D4: 46 1C    lsr resh_1c
95D6: 66 1B    ror resl_1b
95D8: 46 1C    lsr resh_1c
95DA: 66 1B    ror resl_1b
95DC: A5 1B    lda resl_1b
95DE: 59 55 96 eor $9655, y
95E1: 85 1B    sta resl_1b
95E3: A5 1C    lda resh_1c
95E5: 59 55 96 eor $9655, y
95E8: 85 1C    sta resh_1c
95EA: A5 17    lda $17
95EC: 18       clc
95ED: 65 1B    adc resl_1b
95EF: 85 17    sta $17
95F1: A5 16    lda $16
95F3: 65 1C    adc resh_1c
95F5: 85 16    sta $16
95F7: 10 05    bpl $95fe
95F9: A9 FF    lda #$ff
95FB: 4C 00 96 jmp $9600
95FE: A9 00    lda #$00
9600: 85 15    sta $15
9602: 98       tya
9603: 4A       lsr a
9604: 4A       lsr a
9605: A5 11    lda $11
9607: 29 0F    and #$0f
9609: A8       tay
960A: B0 06    bcs $9612
960C: B9 44 97 lda $9744, y
960F: 4C 15 96 jmp $9615
9612: B9 54 97 lda $9754, y
9615: 85 1A    sta $1a
9617: A5 29    lda $29
9619: 85 19    sta $19
961B: 20 6E DE jsr multiply_de6e
961E: A4 1E    ldy $1e
9620: 46 1C    lsr resh_1c
9622: 66 1B    ror resl_1b
9624: 46 1C    lsr resh_1c
9626: 66 1B    ror resl_1b
9628: 46 1C    lsr resh_1c
962A: 66 1B    ror resl_1b
962C: A5 1B    lda resl_1b
962E: 59 5D 96 eor $965d, y
9631: 85 1B    sta resl_1b
9633: A5 1C    lda resh_1c
9635: 59 5D 96 eor $965d, y
9638: 85 1C    sta resh_1c
963A: A5 14    lda $14
963C: 18       clc
963D: 65 1B    adc resl_1b
963F: 85 14    sta $14
9641: A5 13    lda $13
9643: 65 1C    adc resh_1c
9645: 85 13    sta $13
9647: 10 05    bpl $964e
9649: A9 FF    lda #$ff
964B: 4C 50 96 jmp $9650
964E: A9 00    lda #$00
9650: 85 12    sta $12
9652: 4C D3 96 jmp $96d3
9655: 00       brk
9656: 00       brk
9657: FF FF FF isb $ffff, x
965A: FF 00 00 isb $0000, x
965D: 00       brk
965E: 00       brk
965F: 00       brk
9660: 00       brk
9661: FF FF FF isb $ffff, x
9664: FF A9 00 isb $00a9, x
9667: 85 4C    sta $4c
9669: AD 7D 01 lda $017d
966C: 29 02    and #$02
966E: F0 05    beq $9675
9670: 85 4C    sta $4c
9672: 4C B1 95 jmp $95b1
9675: 60       rts
9676: A6 CF    ldx $cf
9678: BD 68 01 lda $0168, x
967B: 1D 6A 01 ora $016a, x
967E: 1D 6C 01 ora $016c, x
9681: F0 41    beq $96c4
9683: A5 48    lda $48
9685: F0 3A    beq $96c1
9687: F8       sed
9688: BD 68 01 lda $0168, x
968B: 38       sec
968C: E5 48    sbc $48
968E: 9D 68 01 sta $0168, x
9691: B0 16    bcs $96a9
9693: BD 6A 01 lda $016a, x
9696: E9 00    sbc #$00
9698: 9D 6A 01 sta $016a, x
969B: 08       php
969C: C9 21    cmp #$21
969E: B0 08    bcs $96a8
96A0: BD 6C 01 lda $016c, x
96A3: D0 03    bne $96a8
96A5: 20 D3 E0 jsr $e0d3
96A8: 28       plp
96A9: B0 15    bcs $96c0
96AB: BD 6C 01 lda $016c, x
96AE: E9 00    sbc #$00
96B0: 9D 6C 01 sta $016c, x
96B3: B0 0B    bcs $96c0
96B5: A9 00    lda #$00
96B7: 9D 68 01 sta $0168, x
96BA: 9D 6A 01 sta $016a, x
96BD: 9D 6C 01 sta $016c, x
96C0: D8       cld
96C1: 4C CE 96 jmp $96ce
96C4: A9 FF    lda #$ff
96C6: 85 30    sta $30
96C8: 95 42    sta $42, x
96CA: A9 0A    lda #$0a
96CC: 95 00    sta $00, x
96CE: A9 00    lda #$00
96D0: 85 48    sta $48
96D2: 60       rts
96D3: A0 00    ldy #$00
96D5: AE 38 01 ldx $0138
96D8: A5 16    lda $16
96DA: 10 0F    bpl $96eb
96DC: CD 39 01 cmp $0139
96DF: B0 07    bcs $96e8
96E1: AD 39 01 lda $0139
96E4: 85 16    sta $16
96E6: 84 17    sty $17
96E8: 4C F4 96 jmp $96f4
96EB: CD 38 01 cmp $0138
96EE: 90 04    bcc $96f4
96F0: 84 17    sty $17
96F2: 86 16    stx $16
96F4: A5 13    lda $13
96F6: 10 0F    bpl $9707
96F8: CD 39 01 cmp $0139
96FB: B0 07    bcs $9704
96FD: AD 39 01 lda $0139
9700: 85 13    sta $13
9702: 84 14    sty $14
9704: 4C 10 97 jmp $9710
9707: CD 38 01 cmp $0138
970A: 90 04    bcc $9710
970C: 86 13    stx $13
970E: 84 14    sty $14
9710: 60       rts
9711: A6 CF    ldx $cf
9713: BD 68 01 lda $0168, x
9716: 1D 6A 01 ora $016a, x
9719: 1D 6C 01 ora $016c, x
971C: F0 25    beq $9743
971E: A5 1D    lda $1d
9720: 29 04    and #$04
9722: F0 08    beq $972c
9724: E6 27    inc $27
9726: A5 27    lda $27
9728: 29 3F    and #$3f
972A: 85 11    sta $11
972C: A5 1D    lda $1d
972E: 29 08    and #$08
9730: F0 08    beq $973a
9732: C6 27    dec $27
9734: A5 27    lda $27
9736: 29 3F    and #$3f
9738: 85 11    sta $11
973A: A5 11    lda $11
973C: 4A       lsr a
973D: 4A       lsr a
973E: 4A       lsr a
973F: 29 06    and #$06
9741: 85 1E    sta $1e
9743: 60       rts
9744: 00       brk
9745: 19 32 4A ora $4a32, y
9748: 62       kil
9749: 79 8E A2 adc $a28e, y
974C: B5 C6    lda $c6, x
974E: D5 E2    cmp $e2, x
9750: ED F5 FB sbc $fbf5
9753: FF FF FB isb $fbff, x
9756: F5 ED    sbc $ed, x
9758: E2 D5    nop #$d5
975A: C6 B5    dec $b5
975C: A2 8E    ldx #$8e
975E: 79 62 4A adc $4a62, y
9761: 32       kil
9762: 19 00 A6 ora $a600, y
9765: CF B5 4D dcp $4db5
9768: AA       tax
9769: BD 31 C1 lda $c131, x
976C: 29 10    and #$10
976E: D0 37    bne $97a7
9770: BD 31 C1 lda $c131, x
9773: 29 20    and #$20
9775: D0 1B    bne $9792
9777: A6 CF    ldx $cf
9779: B5 F6    lda $f6, x
977B: 29 04    and #$04
977D: D0 14    bne $9793
977F: A5 17    lda $17
9781: 38       sec
9782: E5 18    sbc $18
9784: 85 17    sta $17
9786: A5 16    lda $16
9788: E9 00    sbc #$00
978A: 85 16    sta $16
978C: A5 15    lda $15
978E: E9 00    sbc #$00
9790: 85 15    sta $15
9792: 60       rts
9793: A5 17    lda $17
9795: 18       clc
9796: 65 18    adc $18
9798: 85 17    sta $17
979A: A5 16    lda $16
979C: 69 00    adc #$00
979E: 85 16    sta $16
97A0: A5 15    lda $15
97A2: 69 00    adc #$00
97A4: 85 15    sta $15
97A6: 60       rts
97A7: A5 0F    lda $0f
97A9: 38       sec
97AA: E5 52    sbc $52
97AC: 85 38    sta $38
97AE: A5 10    lda $10
97B0: E5 51    sbc $51
97B2: 85 7B    sta $7b
97B4: 85 39    sta $39
97B6: A5 0D    lda $0d
97B8: 38       sec
97B9: E5 54    sbc $54
97BB: 85 3A    sta $3a
97BD: A5 0E    lda $0e
97BF: E5 53    sbc $53
97C1: 85 3B    sta $3b
97C3: 85 7C    sta $7c
97C5: 20 49 98 jsr $9849
97C8: A4 CF    ldy $cf
97CA: B9 00 00 lda $0000, y
97CD: C9 08    cmp #$08
97CF: D0 0D    bne $97de
97D1: B9 F6 00 lda $00f6, y
97D4: 29 04    and #$04
97D6: F0 06    beq $97de
97D8: A5 7B    lda $7b
97DA: 49 80    eor #$80
97DC: 85 7B    sta $7b
97DE: A5 17    lda $17
97E0: A6 7B    ldx $7b
97E2: 30 14    bmi $97f8
97E4: 38       sec
97E5: E5 38    sbc $38
97E7: 85 17    sta $17
97E9: A5 16    lda $16
97EB: E9 00    sbc #$00
97ED: 85 16    sta $16
97EF: A5 15    lda $15
97F1: E9 00    sbc #$00
97F3: 85 15    sta $15
97F5: 4C 09 98 jmp $9809
97F8: 18       clc
97F9: 65 38    adc $38
97FB: 85 17    sta $17
97FD: A5 16    lda $16
97FF: 69 00    adc #$00
9801: 85 16    sta $16
9803: A5 15    lda $15
9805: 69 00    adc #$00
9807: 85 15    sta $15
9809: B9 00 00 lda $0000, y
980C: C9 08    cmp #$08
980E: D0 0D    bne $981d
9810: B9 F6 00 lda $00f6, y
9813: 29 04    and #$04
9815: F0 06    beq $981d
9817: A5 7C    lda $7c
9819: 49 80    eor #$80
981B: 85 7C    sta $7c
981D: A5 14    lda $14
981F: A6 7C    ldx $7c
9821: 30 14    bmi $9837
9823: 38       sec
9824: E5 3A    sbc $3a
9826: 85 14    sta $14
9828: A5 13    lda $13
982A: E9 00    sbc #$00
982C: 85 13    sta $13
982E: A5 12    lda $12
9830: E9 00    sbc #$00
9832: 85 12    sta $12
9834: 4C 48 98 jmp $9848
9837: 18       clc
9838: 65 3A    adc $3a
983A: 85 14    sta $14
983C: A5 13    lda $13
983E: 69 00    adc #$00
9840: 85 13    sta $13
9842: A5 12    lda $12
9844: 69 00    adc #$00
9846: 85 12    sta $12
9848: 60       rts
9849: A2 02    ldx #$02
984B: A0 00    ldy #$00
984D: B5 39    lda $39, x
984F: 10 0B    bpl $985c
9851: 98       tya
9852: 38       sec
9853: F5 38    sbc $38, x
9855: 95 38    sta $38, x
9857: 98       tya
9858: F5 39    sbc $39, x
985A: 95 39    sta $39, x
985C: CA       dex
985D: CA       dex
985E: 10 ED    bpl $984d
9860: A2 02    ldx #$02
9862: A0 03    ldy #$03
9864: 56 39    lsr $39, x
9866: 76 38    ror $38, x
9868: 88       dey
9869: 10 F9    bpl $9864
986B: 56 38    lsr $38, x
986D: 56 38    lsr $38, x
986F: B5 38    lda $38, x
9871: 4A       lsr a
9872: 18       clc
9873: 75 38    adc $38, x
9875: 09 03    ora #$03
9877: 95 38    sta $38, x
9879: CA       dex
987A: CA       dex
987B: 10 E5    bpl $9862
987D: 60       rts
987E: A6 CF    ldx $cf
9880: B5 4D    lda $4d, x
9882: AA       tax
9883: BD 31 C1 lda $c131, x
9886: 29 20    and #$20
9888: D0 3C    bne $98c6
988A: A2 03    ldx #$03
988C: A4 49    ldy $49
988E: B5 14    lda $14, x
9890: F0 2F    beq $98c1
9892: B5 12    lda $12, x
9894: 30 17    bmi $98ad
9896: B5 14    lda $14, x
9898: 38       sec
9899: F9 C7 98 sbc $98c7, y
989C: 95 14    sta $14, x
989E: B5 13    lda $13, x
98A0: E9 00    sbc #$00
98A2: 95 13    sta $13, x
98A4: B5 12    lda $12, x
98A6: E9 00    sbc #$00
98A8: 95 12    sta $12, x
98AA: 4C C1 98 jmp $98c1
98AD: B5 14    lda $14, x
98AF: 18       clc
98B0: 79 C7 98 adc $98c7, y
98B3: 95 14    sta $14, x
98B5: B5 13    lda $13, x
98B7: 69 00    adc #$00
98B9: 95 13    sta $13, x
98BB: B5 12    lda $12, x
98BD: 69 00    adc #$00
98BF: 95 12    sta $12, x
98C1: CA       dex
98C2: CA       dex
98C3: CA       dex
98C4: 10 C8    bpl $988e
98C6: 60       rts
98C7: 03 03    slo ($03, x)
98C9: 03 03    slo ($03, x)
98CB: 02       kil
98CC: 02       kil
98CD: 02       kil
98CE: 02       kil
98CF: 02       kil
98D0: 02       kil
98D1: A6 CF    ldx $cf
98D3: B5 88    lda $88, x
98D5: D0 01    bne $98d8
98D7: 60       rts
98D8: A5 1D    lda $1d
98DA: 29 01    and #$01
98DC: F0 09    beq $98e7
98DE: F8       sed
98DF: A9 20    lda #$20
98E1: 18       clc
98E2: 65 48    adc $48
98E4: 85 48    sta $48
98E6: D8       cld
98E7: A5 0B    lda $0b
98E9: 18       clc
98EA: 65 17    adc $17
98EC: 85 0B    sta $0b
98EE: A5 0F    lda $0f
98F0: 65 16    adc $16
98F2: 85 0F    sta $0f
98F4: A5 10    lda $10
98F6: 65 15    adc $15
98F8: 30 0A    bmi $9904
98FA: C9 05    cmp #$05
98FC: 90 06    bcc $9904
98FE: A0 00    ldy #$00
9900: 84 0F    sty $0f
9902: A9 05    lda #$05
9904: 85 10    sta $10
9906: A6 CF    ldx $cf
9908: B5 00    lda $00, x
990A: C9 24    cmp #$24
990C: F0 04    beq $9912
990E: C9 08    cmp #$08
9910: D0 09    bne $991b
9912: 20 7E 9A jsr $9a7e
9915: 20 8E 99 jsr $998e
9918: 4C 45 99 jmp $9945
991B: C9 1C    cmp #$1c
991D: D0 13    bne $9932
991F: A9 FE    lda #$fe
9921: 85 21    sta $21
9923: A9 02    lda #$02
9925: 85 22    sta $22
9927: A9 02    lda #$02
9929: 85 23    sta $23
992B: A9 FE    lda #$fe
992D: 85 24    sta $24
992F: 4C 42 99 jmp $9942
9932: A9 FD    lda #$fd
9934: 85 21    sta $21
9936: A9 02    lda #$02
9938: 85 22    sta $22
993A: A9 03    lda #$03
993C: 85 23    sta $23
993E: A9 FD    lda #$fd
9940: 85 24    sta $24
9942: 20 37 9A jsr $9a37
9945: A5 0C    lda $0c
9947: 18       clc
9948: 65 14    adc $14
994A: 85 0C    sta $0c
994C: A5 0D    lda $0d
994E: 65 13    adc $13
9950: 85 0D    sta $0d
9952: A5 0E    lda $0e
9954: 65 12    adc $12
9956: 85 0E    sta $0e
9958: A5 7A    lda $7a
995A: F0 03    beq $995f
995C: 20 60 99 jsr $9960
995F: 60       rts
9960: 24 7A    bit $7a
9962: 10 16    bpl $997a
9964: A9 00    lda #$00
9966: 38       sec
9967: E5 14    sbc $14
9969: 85 14    sta $14
996B: A9 00    lda #$00
996D: E5 13    sbc $13
996F: 85 13    sta $13
9971: A9 00    lda #$00
9973: E5 12    sbc $12
9975: 85 12    sta $12
9977: 4C 8D 99 jmp $998d
997A: A9 00    lda #$00
997C: 38       sec
997D: E5 17    sbc $17
997F: 85 17    sta $17
9981: A9 00    lda #$00
9983: E5 16    sbc $16
9985: 85 16    sta $16
9987: A9 00    lda #$00
9989: E5 15    sbc $15
998B: 85 15    sta $15
998D: 60       rts
998E: A6 CF    ldx $cf
9990: B5 4D    lda $4d, x
9992: AA       tax
9993: BD 31 C1 lda $c131, x
9996: 29 F0    and #$f0
9998: F0 17    beq $99b1
999A: BD FA 99 lda $99fa, x
999D: 85 21    sta $21
999F: BD 0A 9A lda $9a0a, x
99A2: 85 22    sta $22
99A4: BD 19 9A lda $9a19, x
99A7: 85 23    sta $23
99A9: BD 28 9A lda $9a28, x
99AC: 85 24    sta $24
99AE: 4C 37 9A jmp $9a37
99B1: A5 12    lda $12
99B3: 25 0E    and $0e
99B5: A6 30    ldx $30
99B7: E0 50    cpx #$50
99B9: B0 05    bcs $99c0
99BB: C9 FF    cmp #$ff
99BD: 4C C2 99 jmp $99c2
99C0: C9 FD    cmp #$fd
99C2: B0 0F    bcs $99d3
99C4: C9 10    cmp #$10
99C6: 90 0B    bcc $99d3
99C8: 20 C8 9A jsr $9ac8
99CB: 20 A5 9A jsr $9aa5
99CE: 68       pla
99CF: 68       pla
99D0: 4C 5F 99 jmp $995f
99D3: A5 12    lda $12
99D5: 30 22    bmi $99f9
99D7: A5 0E    lda $0e
99D9: A6 30    ldx $30
99DB: E0 50    cpx #$50
99DD: B0 05    bcs $99e4
99DF: C9 01    cmp #$01
99E1: 4C E6 99 jmp $99e6
99E4: C9 02    cmp #$02
99E6: 90 11    bcc $99f9
99E8: F0 0F    beq $99f9
99EA: C9 10    cmp #$10
99EC: B0 0B    bcs $99f9
99EE: 20 C8 9A jsr $9ac8
99F1: 20 A5 9A jsr $9aa5
99F4: 68       pla
99F5: 68       pla
99F6: 4C 5F 99 jmp $995f
99F9: 60       rts
99FA: 00       brk
99FB: 00       brk
99FC: 00       brk
99FD: FA       nop
99FE: F8       sed
99FF: 00       brk
9A00: 00       brk
9A01: 00       brk
9A02: 00       brk
9A03: 00       brk
9A04: F8       sed
9A05: 00       brk
9A06: 00       brk
9A07: FA       nop
9A08: 00       brk
9A09: F8       sed
9A0A: 00       brk
9A0B: 00       brk
9A0C: 00       brk
9A0D: 06 03    asl $03
9A0F: 00       brk
9A10: 00       brk
9A11: 00       brk
9A12: 04 03    nop $03
9A14: 00       brk
9A15: 00       brk
9A16: 06 00    asl $00
9A18: 08       php
9A19: 00       brk
9A1A: 00       brk
9A1B: 00       brk
9A1C: 06 08    asl $08
9A1E: 00       brk
9A1F: 00       brk
9A20: 00       brk
9A21: 08       php
9A22: 08       php
9A23: 00       brk
9A24: 00       brk
9A25: 08       php
9A26: 00       brk
9A27: 08       php
9A28: 00       brk
9A29: 00       brk
9A2A: 00       brk
9A2B: FA       nop
9A2C: F8       sed
9A2D: 00       brk
9A2E: 00       brk
9A2F: 00       brk
9A30: 00       brk
9A31: F8       sed
9A32: 00       brk
9A33: 00       brk
9A34: F8       sed
9A35: 00       brk
9A36: F8       sed
9A37: A9 00    lda #$00
9A39: 85 7A    sta $7a
9A3B: A5 0E    lda $0e
9A3D: 10 11    bpl $9a50
9A3F: C5 24    cmp $24
9A41: B0 0A    bcs $9a4d
9A43: A9 80    lda #$80
9A45: 85 7A    sta $7a
9A47: A9 08    lda #$08
9A49: 85 0D    sta $0d
9A4B: E6 0E    inc $0e
9A4D: 4C 5E 9A jmp $9a5e
9A50: C5 23    cmp $23
9A52: 90 0A    bcc $9a5e
9A54: A9 80    lda #$80
9A56: 85 7A    sta $7a
9A58: A9 F7    lda #$f7
9A5A: 85 0D    sta $0d
9A5C: C6 0E    dec $0e
9A5E: A5 10    lda $10
9A60: 10 0F    bpl $9a71
9A62: C5 21    cmp $21
9A64: B0 08    bcs $9a6e
9A66: A9 40    lda #$40
9A68: 85 7A    sta $7a
9A6A: A9 FF    lda #$ff
9A6C: 85 0F    sta $0f
9A6E: 4C 7D 9A jmp $9a7d
9A71: C5 22    cmp $22
9A73: 90 08    bcc $9a7d
9A75: A9 40    lda #$40
9A77: 85 7A    sta $7a
9A79: A9 00    lda #$00
9A7B: 85 0F    sta $0f
9A7D: 60       rts
9A7E: A5 7A    lda $7a
9A80: D0 22    bne $9aa4
9A82: 18       clc
9A83: A5 2E    lda $2e
9A85: 65 14    adc $14
9A87: 85 2E    sta $2e
9A89: A5 2F    lda $2f
9A8B: 65 13    adc $13
9A8D: 85 2F    sta $2f
9A8F: 24 12    bit $12
9A91: 30 07    bmi $9a9a
9A93: 90 02    bcc $9a97
9A95: E6 2A    inc $2a
9A97: 4C 9E 9A jmp $9a9e
9A9A: B0 02    bcs $9a9e
9A9C: C6 2A    dec $2a
9A9E: A5 2A    lda $2a
9AA0: 29 0F    and #$0f
9AA2: 85 2A    sta $2a
9AA4: 60       rts
9AA5: A5 2C    lda $2c
9AA7: 18       clc
9AA8: 65 14    adc $14
9AAA: 85 2C    sta $2c
9AAC: A5 2D    lda $2d
9AAE: 65 13    adc $13
9AB0: 85 2D    sta $2d
9AB2: 24 12    bit $12
9AB4: 30 07    bmi $9abd
9AB6: 90 02    bcc $9aba
9AB8: E6 2B    inc $2b
9ABA: 4C C1 9A jmp $9ac1
9ABD: B0 02    bcs $9ac1
9ABF: C6 2B    dec $2b
9AC1: A5 2B    lda $2b
9AC3: 29 0F    and #$0f
9AC5: 85 2B    sta $2b
9AC7: 60       rts
9AC8: A2 16    ldx #$16
9ACA: BD 73 02 lda $0273, x
9ACD: 38       sec
9ACE: E5 14    sbc $14
9AD0: 9D 73 02 sta $0273, x
9AD3: BD 5C 02 lda $025c, x
9AD6: E5 13    sbc $13
9AD8: 9D 5C 02 sta $025c, x
9ADB: BD 45 02 lda $0245, x
9ADE: E5 12    sbc $12
9AE0: 9D 45 02 sta $0245, x
9AE3: 20 0A 9B jsr $9b0a
9AE6: E0 02    cpx #$02
9AE8: B0 1C    bcs $9b06
9AEA: BD 12 01 lda $0112, x
9AED: 38       sec
9AEE: E5 14    sbc $14
9AF0: 9D 12 01 sta $0112, x
9AF3: BD 16 01 lda $0116, x
9AF6: E5 13    sbc $13
9AF8: 9D 16 01 sta $0116, x
9AFB: BD 1A 01 lda $011a, x
9AFE: E5 12    sbc $12
9B00: 9D 1A 01 sta $011a, x
9B03: 20 0A 9B jsr $9b0a
9B06: CA       dex
9B07: 10 C1    bpl $9aca
9B09: 60       rts
9B0A: BD 45 02 lda $0245, x
9B0D: 10 0A    bpl $9b19
9B0F: C9 F8    cmp #$f8
9B11: B0 03    bcs $9b16
9B13: 4C 21 9B jmp $9b21
9B16: 4C 20 9B jmp $9b20
9B19: C9 08    cmp #$08
9B1B: 90 03    bcc $9b20
9B1D: 4C 21 9B jmp $9b21
9B20: 60       rts
9B21: BD 45 02 lda $0245, x
9B24: 30 06    bmi $9b2c
9B26: 38       sec
9B27: E9 10    sbc #$10
9B29: 4C 2F 9B jmp $9b2f
9B2C: 18       clc
9B2D: 69 10    adc #$10
9B2F: 9D 45 02 sta $0245, x
9B32: 60       rts
9B33: A2 01    ldx #$01
9B35: 20 3C 9B jsr $9b3c
9B38: CA       dex
9B39: 10 FA    bpl $9b35
9B3B: 60       rts
9B3C: A9 03    lda #$03
9B3E: 8D 3F 01 sta $013f
9B41: A9 FB    lda #$fb
9B43: 8D 40 01 sta $0140
9B46: 8D 42 01 sta $0142
9B49: A9 04    lda #$04
9B4B: 8D 41 01 sta $0141
9B4E: A4 CF    ldy $cf
9B50: B9 E3 00 lda $00e3, y
9B53: 85 7B    sta $7b
9B55: B9 3C 01 lda $013c, y
9B58: F0 01    beq $9b5b
9B5A: 60       rts
9B5B: BD 34 01 lda $0134, x
9B5E: F0 01    beq $9b61
9B60: 60       rts
9B61: BD 0C 01 lda $010c, x
9B64: 10 2C    bpl $9b92
9B66: 2C 40 01 bit $0140
9B69: 10 1B    bpl $9b86
9B6B: CD 40 01 cmp $0140
9B6E: D0 1F    bne $9b8f
9B70: C5 10    cmp $10
9B72: B0 18    bcs $9b8c
9B74: E0 02    cpx #$02
9B76: 90 0E    bcc $9b86
9B78: A9 00    lda #$00
9B7A: 9D 24 01 sta $0124, x
9B7D: 9D 20 01 sta $0120, x
9B80: 9D 1C 01 sta $011c, x
9B83: 4C 89 9B jmp $9b89
9B86: 20 9B 9D jsr $9d9b
9B89: 4C 8F 9B jmp $9b8f
9B8C: 20 9B 9D jsr $9d9b
9B8F: 4C C1 9B jmp $9bc1
9B92: CD 40 01 cmp $0140
9B95: D0 22    bne $9bb9
9B97: C5 10    cmp $10
9B99: 90 18    bcc $9bb3
9B9B: E0 02    cpx #$02
9B9D: 90 0E    bcc $9bad
9B9F: A9 00    lda #$00
9BA1: 9D 24 01 sta $0124, x
9BA4: 9D 20 01 sta $0120, x
9BA7: 9D 1C 01 sta $011c, x
9BAA: 4C B0 9B jmp $9bb0
9BAD: 20 9B 9D jsr $9d9b
9BB0: 4C B6 9B jmp $9bb6
9BB3: 20 9B 9D jsr $9d9b
9BB6: 4C C1 9B jmp $9bc1
9BB9: CD 3F 01 cmp $013f
9BBC: 90 03    bcc $9bc1
9BBE: 20 B1 9D jsr $9db1
9BC1: BD 04 01 lda $0104, x
9BC4: 18       clc
9BC5: 7D 1C 01 adc $011c, x
9BC8: 9D 04 01 sta $0104, x
9BCB: BD 08 01 lda $0108, x
9BCE: 7D 20 01 adc $0120, x
9BD1: 9D 08 01 sta $0108, x
9BD4: BD 0C 01 lda $010c, x
9BD7: 7D 24 01 adc $0124, x
9BDA: 9D 0C 01 sta $010c, x
9BDD: BD 18 01 lda $0118, x
9BE0: 10 0B    bpl $9bed
9BE2: CD 42 01 cmp $0142
9BE5: D0 03    bne $9bea
9BE7: 20 6C 9D jsr $9d6c
9BEA: 4C F5 9B jmp $9bf5
9BED: CD 41 01 cmp $0141
9BF0: 90 03    bcc $9bf5
9BF2: 20 82 9D jsr $9d82
9BF5: BD 10 01 lda $0110, x
9BF8: 18       clc
9BF9: 7D 28 01 adc $0128, x
9BFC: 9D 10 01 sta $0110, x
9BFF: BD 14 01 lda $0114, x
9C02: 7D 2C 01 adc $012c, x
9C05: 9D 14 01 sta $0114, x
9C08: BD 18 01 lda $0118, x
9C0B: 7D 30 01 adc $0130, x
9C0E: 9D 18 01 sta $0118, x
9C11: 60       rts
9C12: A5 4F    lda $4f
9C14: 29 FF    and #$ff
9C16: D0 25    bne $9c3d
9C18: AD 4E 04 lda $044e
9C1B: 29 01    and #$01
9C1D: D0 1E    bne $9c3d
9C1F: A6 CF    ldx $cf
9C21: 18       clc
9C22: B5 E5    lda $e5, x
9C24: 69 01    adc #$01
9C26: C9 10    cmp #$10
9C28: 90 02    bcc $9c2c
9C2A: A9 10    lda #$10
9C2C: 95 E5    sta $e5, x
9C2E: B5 49    lda $49, x
9C30: A8       tay
9C31: B9 5B 9C lda $9c5b, y
9C34: 18       clc
9C35: 75 E7    adc $e7, x
9C37: 10 02    bpl $9c3b
9C39: A9 80    lda #$80
9C3B: 95 E7    sta $e7, x
9C3D: 60       rts
9C3E: A5 4F    lda $4f
9C40: 29 FF    and #$ff
9C42: D0 16    bne $9c5a
9C44: AD 4E 04 lda $044e
9C47: 29 03    and #$03
9C49: D0 0F    bne $9c5a
9C4B: A6 CF    ldx $cf
9C4D: B5 E3    lda $e3, x
9C4F: 18       clc
9C50: 69 01    adc #$01
9C52: C9 07    cmp #$07
9C54: 90 02    bcc $9c58
9C56: A9 07    lda #$07
9C58: 95 E3    sta $e3, x
9C5A: 60       rts
9C5B: 01 02    ora ($02, x)
9C5D: 03 04    slo ($04, x)
9C5F: 05 06    ora $06
9C61: 07 08    slo $08
9C63: A2 01    ldx #$01
9C65: 20 04 9D jsr $9d04
9C68: CA       dex
9C69: 10 FA    bpl $9c65
9C6B: 60       rts
9C6C: BD 00 01 lda $0100, x
9C6F: D0 09    bne $9c7a
9C71: 20 CA 9D jsr $9dca
9C74: 20 D1 9D jsr $9dd1
9C77: 4C 7D 9C jmp $9c7d
9C7A: DE 00 01 dec $0100, x
9C7D: 60       rts
9C7E: A9 01    lda #$01
9C80: 85 21    sta $21
9C82: A6 CF    ldx $cf
9C84: B5 E5    lda $e5, x
9C86: 85 7B    sta $7b
9C88: A2 03    ldx #$03
9C8A: 20 10 9D jsr $9d10
9C8D: CA       dex
9C8E: C6 21    dec $21
9C90: 10 F8    bpl $9c8a
9C92: 60       rts
9C93: 03 03    slo ($03, x)
9C95: 03 00    slo ($00, x)
9C97: 00       brk
9C98: 04 03    nop $03
9C9A: 03 03    slo ($03, x)
9C9C: 03 03    slo ($03, x)
9C9E: 03 03    slo ($03, x)
9CA0: 03 03    slo ($03, x)
9CA2: FF FF FF isb $ffff, x
9CA5: FF 00 03 isb $0300, x
9CA8: 01 FF    ora ($ff, x)
9CAA: 00       brk
9CAB: 00       brk
9CAC: 01 00    ora ($00, x)
9CAE: 00       brk
9CAF: 00       brk
9CB0: 00       brk
9CB1: A5 37    lda $37
9CB3: D0 4E    bne $9d03
9CB5: A6 CF    ldx $cf
9CB7: B5 E5    lda $e5, x
9CB9: 85 7B    sta $7b
9CBB: B5 4D    lda $4d, x
9CBD: AA       tax
9CBE: BD 31 C1 lda $c131, x
9CC1: 29 08    and #$08
9CC3: D0 3E    bne $9d03
9CC5: BD 93 9C lda $9c93, x
9CC8: 8D 3F 01 sta $013f
9CCB: BD A2 9C lda $9ca2, x
9CCE: 8D 40 01 sta $0140
9CD1: A9 F7    lda #$f7
9CD3: 8D 42 01 sta $0142
9CD6: A9 09    lda #$09
9CD8: 8D 41 01 sta $0141
9CDB: A9 01    lda #$01
9CDD: 85 21    sta $21
9CDF: A2 03    ldx #$03
9CE1: 20 5B 9B jsr $9b5b
9CE4: BD 18 01 lda $0118, x
9CE7: 10 0C    bpl $9cf5
9CE9: C9 F8    cmp #$f8
9CEB: B0 05    bcs $9cf2
9CED: A9 07    lda #$07
9CEF: 9D 18 01 sta $0118, x
9CF2: 4C FE 9C jmp $9cfe
9CF5: C9 08    cmp #$08
9CF7: 90 05    bcc $9cfe
9CF9: A9 F9    lda #$f9
9CFB: 9D 18 01 sta $0118, x
9CFE: CA       dex
9CFF: C6 21    dec $21
9D01: 10 DE    bpl $9ce1
9D03: 60       rts
9D04: A4 CF    ldy $cf
9D06: B9 E3 00 lda $00e3, y
9D09: 85 7B    sta $7b
9D0B: B9 3C 01 lda $013c, y
9D0E: D0 5B    bne $9d6b
9D10: BD 00 01 lda $0100, x
9D13: D0 53    bne $9d68
9D15: BD 08 01 lda $0108, x
9D18: 85 38    sta $38
9D1A: BD 0C 01 lda $010c, x
9D1D: 85 39    sta $39
9D1F: BD 14 01 lda $0114, x
9D22: 85 3A    sta $3a
9D24: BD 18 01 lda $0118, x
9D27: 85 3B    sta $3b
9D29: 20 6F A5 jsr $a56f
9D2C: 86 24    stx $24
9D2E: 20 99 A4 jsr $a499
9D31: A6 24    ldx $24
9D33: E0 03    cpx #$03
9D35: D0 06    bne $9d3d
9D37: 20 6C 9D jsr $9d6c
9D3A: 4C 56 9D jmp $9d56
9D3D: E0 02    cpx #$02
9D3F: D0 06    bne $9d47
9D41: 20 82 9D jsr $9d82
9D44: 4C 56 9D jmp $9d56
9D47: A5 55    lda $55
9D49: 29 02    and #$02
9D4B: D0 06    bne $9d53
9D4D: 20 82 9D jsr $9d82
9D50: 4C 56 9D jmp $9d56
9D53: 20 6C 9D jsr $9d6c
9D56: A5 55    lda $55
9D58: 29 01    and #$01
9D5A: D0 06    bne $9d62
9D5C: 20 B1 9D jsr $9db1
9D5F: 4C 65 9D jmp $9d65
9D62: 20 9B 9D jsr $9d9b
9D65: 4C 6B 9D jmp $9d6b
9D68: DE 00 01 dec $0100, x
9D6B: 60       rts
9D6C: A9 00    lda #$00
9D6E: 9D 30 01 sta $0130, x
9D71: AD 0A 60 lda $600a
9D74: 9D 28 01 sta $0128, x
9D77: 29 0F    and #$0f
9D79: 9D 00 01 sta $0100, x
9D7C: A5 7B    lda $7b
9D7E: 9D 2C 01 sta $012c, x
9D81: 60       rts
9D82: A9 00    lda #$00
9D84: 38       sec
9D85: E5 7B    sbc $7b
9D87: 9D 2C 01 sta $012c, x
9D8A: AD 0A 60 lda $600a
9D8D: 9D 28 01 sta $0128, x
9D90: 29 0F    and #$0f
9D92: 9D 00 01 sta $0100, x
9D95: A9 FF    lda #$ff
9D97: 9D 30 01 sta $0130, x
9D9A: 60       rts
9D9B: A9 00    lda #$00
9D9D: 9D 24 01 sta $0124, x
9DA0: AD 0A 60 lda $600a
9DA3: 9D 1C 01 sta $011c, x
9DA6: 29 07    and #$07
9DA8: 9D 00 01 sta $0100, x
9DAB: A5 7B    lda $7b
9DAD: 9D 20 01 sta $0120, x
9DB0: 60       rts
9DB1: A9 00    lda #$00
9DB3: 38       sec
9DB4: E5 7B    sbc $7b
9DB6: 9D 20 01 sta $0120, x
9DB9: AD 0A 60 lda $600a
9DBC: 9D 1C 01 sta $011c, x
9DBF: 29 07    and #$07
9DC1: 9D 00 01 sta $0100, x
9DC4: A9 FF    lda #$ff
9DC6: 9D 24 01 sta $0124, x
9DC9: 60       rts
9DCA: AD 0A 60 lda $600a
9DCD: 30 E2    bmi $9db1
9DCF: 10 CA    bpl $9d9b
9DD1: AD 0A 60 lda $600a
9DD4: 30 AC    bmi $9d82
9DD6: 4C 6C 9D jmp $9d6c
9DD9: A6 CF    ldx $cf
9DDB: B5 4D    lda $4d, x
9DDD: AA       tax
9DDE: BD 31 C1 lda $c131, x
9DE1: 30 21    bmi $9e04
9DE3: A5 37    lda $37
9DE5: D0 1D    bne $9e04
9DE7: A5 10    lda $10
9DE9: D0 0B    bne $9df6
9DEB: A5 30    lda $30
9DED: F0 04    beq $9df3
9DEF: A9 80    lda #$80
9DF1: 85 37    sta $37
9DF3: 4C 04 9E jmp $9e04
9DF6: 30 0C    bmi $9e04
9DF8: C9 03    cmp #$03
9DFA: 90 08    bcc $9e04
9DFC: A5 30    lda $30
9DFE: 30 04    bmi $9e04
9E00: A9 40    lda #$40
9E02: 85 37    sta $37
9E04: 60       rts
9E05: 24 37    bit $37
9E07: 10 26    bpl $9e2f
9E09: A5 30    lda $30
9E0B: F0 20    beq $9e2d
9E0D: 38       sec
9E0E: E9 04    sbc #$04
9E10: 85 30    sta $30
9E12: 20 5C 9E jsr $9e5c
9E15: A5 0E    lda $0e
9E17: 10 0A    bpl $9e23
9E19: C9 FF    cmp #$ff
9E1B: B0 03    bcs $9e20
9E1D: 20 AD 9E jsr $9ead
9E20: 4C 2A 9E jmp $9e2a
9E23: C9 01    cmp #$01
9E25: 90 03    bcc $9e2a
9E27: 20 8E 9E jsr $9e8e
9E2A: 4C 2F 9E jmp $9e2f
9E2D: 85 37    sta $37
9E2F: 24 37    bit $37
9E31: 50 28    bvc $9e5b
9E33: A5 30    lda $30
9E35: 30 20    bmi $9e57
9E37: 18       clc
9E38: 69 04    adc #$04
9E3A: 85 30    sta $30
9E3C: 20 75 9E jsr $9e75
9E3F: A5 0E    lda $0e
9E41: 10 0A    bpl $9e4d
9E43: C9 FF    cmp #$ff
9E45: B0 03    bcs $9e4a
9E47: 20 8E 9E jsr $9e8e
9E4A: 4C 54 9E jmp $9e54
9E4D: C9 01    cmp #$01
9E4F: 90 03    bcc $9e54
9E51: 20 AD 9E jsr $9ead
9E54: 4C 5B 9E jmp $9e5b
9E57: A9 00    lda #$00
9E59: 85 37    sta $37
9E5B: 60       rts
9E5C: A5 0F    lda $0f
9E5E: 18       clc
9E5F: 69 10    adc #$10
9E61: 85 0F    sta $0f
9E63: 90 02    bcc $9e67
9E65: E6 10    inc $10
9E67: A5 66    lda $66
9E69: 18       clc
9E6A: 69 10    adc #$10
9E6C: 85 66    sta $66
9E6E: 90 02    bcc $9e72
9E70: E6 67    inc $67
9E72: 4C CC 9E jmp $9ecc
9E75: A5 0F    lda $0f
9E77: 38       sec
9E78: E9 10    sbc #$10
9E7A: 85 0F    sta $0f
9E7C: B0 02    bcs $9e80
9E7E: C6 10    dec $10
9E80: A5 66    lda $66
9E82: 38       sec
9E83: E9 10    sbc #$10
9E85: 85 66    sta $66
9E87: B0 02    bcs $9e8b
9E89: C6 67    dec $67
9E8B: 4C F1 9E jmp $9ef1
9E8E: A5 0D    lda $0d
9E90: 38       sec
9E91: E9 09    sbc #$09
9E93: 85 0D    sta $0d
9E95: B0 02    bcs $9e99
9E97: C6 0E    dec $0e
9E99: A5 2D    lda $2d
9E9B: 18       clc
9E9C: 69 09    adc #$09
9E9E: 85 2D    sta $2d
9EA0: 90 08    bcc $9eaa
9EA2: A5 2B    lda $2b
9EA4: 69 00    adc #$00
9EA6: 29 0F    and #$0f
9EA8: 85 2B    sta $2b
9EAA: 4C 3B 9F jmp $9f3b
9EAD: A5 0D    lda $0d
9EAF: 18       clc
9EB0: 69 09    adc #$09
9EB2: 85 0D    sta $0d
9EB4: 90 02    bcc $9eb8
9EB6: E6 0E    inc $0e
9EB8: A5 2D    lda $2d
9EBA: 38       sec
9EBB: E9 09    sbc #$09
9EBD: 85 2D    sta $2d
9EBF: B0 08    bcs $9ec9
9EC1: A5 2B    lda $2b
9EC3: E9 00    sbc #$00
9EC5: 29 0F    and #$0f
9EC7: 85 2B    sta $2b
9EC9: 4C 16 9F jmp $9f16
9ECC: A2 16    ldx #$16
9ECE: BD 17 02 lda $0217, x
9ED1: 18       clc
9ED2: 69 10    adc #$10
9ED4: 9D 17 02 sta $0217, x
9ED7: 90 03    bcc $9edc
9ED9: FE 00 02 inc $0200, x
9EDC: E0 02    cpx #$02
9EDE: B0 0D    bcs $9eed
9EE0: BD 0A 01 lda $010a, x
9EE3: 69 10    adc #$10
9EE5: 9D 0A 01 sta $010a, x
9EE8: 90 03    bcc $9eed
9EEA: FE 0E 01 inc $010e, x
9EED: CA       dex
9EEE: 10 DE    bpl $9ece
9EF0: 60       rts
9EF1: A2 16    ldx #$16
9EF3: BD 17 02 lda $0217, x
9EF6: 38       sec
9EF7: E9 10    sbc #$10
9EF9: 9D 17 02 sta $0217, x
9EFC: B0 03    bcs $9f01
9EFE: DE 00 02 dec $0200, x
9F01: E0 02    cpx #$02
9F03: B0 0D    bcs $9f12
9F05: BD 0A 01 lda $010a, x
9F08: E9 0F    sbc #$0f
9F0A: 9D 0A 01 sta $010a, x
9F0D: B0 03    bcs $9f12
9F0F: DE 0E 01 dec $010e, x
9F12: CA       dex
9F13: 10 DE    bpl $9ef3
9F15: 60       rts
9F16: A2 16    ldx #$16
9F18: BD 5C 02 lda $025c, x
9F1B: 18       clc
9F1C: 69 09    adc #$09
9F1E: 9D 5C 02 sta $025c, x
9F21: 90 03    bcc $9f26
9F23: FE 45 02 inc $0245, x
9F26: E0 02    cpx #$02
9F28: B0 0D    bcs $9f37
9F2A: BD 16 01 lda $0116, x
9F2D: 69 09    adc #$09
9F2F: 9D 16 01 sta $0116, x
9F32: 90 03    bcc $9f37
9F34: FE 1A 01 inc $011a, x
9F37: CA       dex
9F38: 10 DE    bpl $9f18
9F3A: 60       rts
9F3B: A2 16    ldx #$16
9F3D: BD 5C 02 lda $025c, x
9F40: 38       sec
9F41: E9 09    sbc #$09
9F43: 9D 5C 02 sta $025c, x
9F46: B0 03    bcs $9f4b
9F48: DE 45 02 dec $0245, x
9F4B: E0 02    cpx #$02
9F4D: B0 0D    bcs $9f5c
9F4F: BD 16 01 lda $0116, x
9F52: E9 08    sbc #$08
9F54: 9D 16 01 sta $0116, x
9F57: B0 03    bcs $9f5c
9F59: DE 1A 01 dec $011a, x
9F5C: CA       dex
9F5D: 10 DE    bpl $9f3d
9F5F: 60       rts
9F60: A9 00    lda #$00
9F62: 38       sec
9F63: E5 2D    sbc $2d
9F65: 85 44    sta $44
9F67: A9 F8    lda #$f8
9F69: E9 00    sbc #$00
9F6B: 85 45    sta $45
9F6D: A5 2B    lda $2b
9F6F: 0A       asl a
9F70: A8       tay
9F71: A5 66    lda $66
9F73: 18       clc
9F74: 71 62    adc ($62), y
9F76: 85 46    sta $46
9F78: A5 67    lda $67
9F7A: C8       iny
9F7B: 71 62    adc ($62), y
9F7D: 88       dey
9F7E: 85 47    sta $47
9F80: A2 03    ldx #$03
9F82: 86 21    stx $21
9F84: A6 21    ldx $21
9F86: BD EC 02 lda $02ec, x
9F89: D0 03    bne $9f8e
9F8B: 4C 5A A0 jmp $a05a
9F8E: BD 64 02 lda $0264, x
9F91: 38       sec
9F92: E5 44    sbc $44
9F94: 85 38    sta $38
9F96: BD 4D 02 lda $024d, x
9F99: E5 45    sbc $45
9F9B: 85 39    sta $39
9F9D: 18       clc
9F9E: 65 2B    adc $2b
9FA0: 29 0F    and #$0f
9FA2: 85 22    sta $22
9FA4: A5 2B    lda $2b
9FA6: 85 23    sta $23
9FA8: A0 03    ldy #$03
9FAA: B9 44 00 lda $0044, y
9FAD: 99 31 00 sta $0031, y
9FB0: 88       dey
9FB1: 10 F7    bpl $9faa
9FB3: A5 23    lda $23
9FB5: 0A       asl a
9FB6: A8       tay
9FB7: E6 32    inc $32
9FB9: A5 33    lda $33
9FBB: 18       clc
9FBC: 71 5C    adc ($5c), y
9FBE: 85 33    sta $33
9FC0: A5 34    lda $34
9FC2: C8       iny
9FC3: 71 5C    adc ($5c), y
9FC5: 88       dey
9FC6: 85 34    sta $34
9FC8: E6 23    inc $23
9FCA: A5 23    lda $23
9FCC: 29 0F    and #$0f
9FCE: 85 23    sta $23
9FD0: C5 22    cmp $22
9FD2: D0 DF    bne $9fb3
9FD4: A8       tay
9FD5: B1 5E    lda ($5e), y
9FD7: D0 03    bne $9fdc
9FD9: 4C 5A A0 jmp $a05a
9FDC: 85 23    sta $23
9FDE: B1 60    lda ($60), y
9FE0: A8       tay
9FE1: 20 B7 A0 jsr $a0b7
9FE4: 90 6D    bcc $a053
9FE6: B1 56    lda ($56), y
9FE8: F0 69    beq $a053
9FEA: B1 5A    lda ($5a), y
9FEC: 85 19    sta $19
9FEE: BD 64 02 lda $0264, x
9FF1: 38       sec
9FF2: E5 31    sbc $31
9FF4: 85 24    sta $24
9FF6: BD 4D 02 lda $024d, x
9FF9: E5 32    sbc $32
9FFB: 10 07    bpl $a004
9FFD: A9 00    lda #$00
9FFF: 38       sec
A000: E5 24    sbc $24
A002: 85 24    sta $24
A004: A5 24    lda $24
A006: 85 1A    sta $1a
A008: 84 22    sty $22
A00A: 20 6E DE jsr multiply_de6e
A00D: A5 1C    lda resh_1c
A00F: 85 38    sta $38
A011: A4 22    ldy $22
A013: C8       iny
A014: B1 5A    lda ($5a), y
A016: 88       dey
A017: 29 7F    and #$7f
A019: 85 19    sta $19
A01B: 20 6E DE jsr multiply_de6e
A01E: A4 22    ldy $22
A020: A5 1B    lda resl_1b
A022: 18       clc
A023: 65 38    adc $38
A025: 85 38    sta $38
A027: A9 00    lda #$00
A029: 65 1C    adc resh_1c
A02B: 85 39    sta $39
A02D: C8       iny
A02E: B1 5A    lda ($5a), y
A030: 20 63 A0 jsr $a063
A033: 88       dey
A034: BD 64 02 lda $0264, x
A037: 85 3A    sta $3a
A039: BD 4D 02 lda $024d, x
A03C: 85 3B    sta $3b
A03E: 20 A2 A0 jsr $a0a2
A041: A9 00    lda #$00
A043: 85 41    sta $41
A045: 86 24    stx $24
A047: 20 D2 A4 jsr $a4d2
A04A: A6 24    ldx $24
A04C: B0 05    bcs $a053
A04E: A9 00    lda #$00
A050: 9D EC 02 sta $02ec, x
A053: 20 83 A0 jsr $a083
A056: C6 23    dec $23
A058: D0 87    bne $9fe1
A05A: C6 21    dec $21
A05C: 30 03    bmi $a061
A05E: 4C 84 9F jmp $9f84
A061: 60       rts
A062: 19 10 10 ora $1010, y
A065: A5 33    lda $33
A067: 38       sec
A068: E5 38    sbc $38
A06A: 85 38    sta $38
A06C: A5 34    lda $34
A06E: E5 39    sbc $39
A070: 85 39    sta $39
A072: 4C 82 A0 jmp $a082
A075: A5 33    lda $33
A077: 18       clc
A078: 65 38    adc $38
A07A: 85 38    sta $38
A07C: A5 34    lda $34
A07E: 65 39    adc $39
A080: 85 39    sta $39
A082: 60       rts
A083: A5 33    lda $33
A085: 18       clc
A086: 71 58    adc ($58), y
A088: 85 33    sta $33
A08A: A5 34    lda $34
A08C: C8       iny
A08D: 71 58    adc ($58), y
A08F: 88       dey
A090: 85 34    sta $34
A092: A5 31    lda $31
A094: 18       clc
A095: 71 56    adc ($56), y
A097: 85 31    sta $31
A099: A5 32    lda $32
A09B: C8       iny
A09C: 71 56    adc ($56), y
A09E: 85 32    sta $32
A0A0: C8       iny
A0A1: 60       rts
A0A2: BD 1F 02 lda $021f, x
A0A5: 85 3C    sta $3c
A0A7: BD 08 02 lda $0208, x
A0AA: 85 3D    sta $3d
A0AC: BD 64 02 lda $0264, x
A0AF: 85 3E    sta $3e
A0B1: BD 4D 02 lda $024d, x
A0B4: 85 3F    sta $3f
A0B6: 60       rts
A0B7: A5 31    lda $31
A0B9: 38       sec
A0BA: FD 64 02 sbc $0264, x
A0BD: A5 32    lda $32
A0BF: FD 4D 02 sbc $024d, x
A0C2: 85 24    sta $24
A0C4: A5 31    lda $31
A0C6: 18       clc
A0C7: 71 56    adc ($56), y
A0C9: 85 3A    sta $3a
A0CB: A5 32    lda $32
A0CD: C8       iny
A0CE: 71 56    adc ($56), y
A0D0: 88       dey
A0D1: 85 3B    sta $3b
A0D3: A5 3A    lda $3a
A0D5: 38       sec
A0D6: FD 64 02 sbc $0264, x
A0D9: A5 3B    lda $3b
A0DB: FD 4D 02 sbc $024d, x
A0DE: 45 24    eor $24
A0E0: 10 04    bpl $a0e6
A0E2: 38       sec
A0E3: 4C E7 A0 jmp $a0e7
A0E6: 18       clc
A0E7: 60       rts
A0E8: A2 03    ldx #$03
A0EA: B5 44    lda $44, x
A0EC: 95 31    sta $31, x
A0EE: CA       dex
A0EF: 10 F9    bpl $a0ea
A0F1: A5 2B    lda $2b
A0F3: 85 21    sta $21
A0F5: A5 21    lda $21
A0F7: 0A       asl a
A0F8: A8       tay
A0F9: E6 32    inc $32
A0FB: A5 33    lda $33
A0FD: 18       clc
A0FE: 71 5C    adc ($5c), y
A100: 85 33    sta $33
A102: A5 34    lda $34
A104: C8       iny
A105: 71 5C    adc ($5c), y
A107: 85 34    sta $34
A109: E6 21    inc $21
A10B: A5 21    lda $21
A10D: 29 0F    and #$0f
A10F: 85 21    sta $21
A111: C5 2A    cmp $2a
A113: D0 E0    bne $a0f5
A115: A2 03    ldx #$03
A117: B5 31    lda $31, x
A119: 95 44    sta $44, x
A11B: CA       dex
A11C: 10 F9    bpl $a117
A11E: A4 2A    ldy $2a
A120: B1 5E    lda ($5e), y
A122: D0 01    bne $a125
A124: 60       rts
A125: 85 21    sta $21
A127: B1 60    lda ($60), y
A129: A8       tay
A12A: 20 36 A5 jsr $a536
A12D: 90 62    bcc $a191
A12F: B1 56    lda ($56), y
A131: F0 5E    beq $a191
A133: B1 5A    lda ($5a), y
A135: 85 19    sta $19
A137: A5 0D    lda $0d
A139: 38       sec
A13A: E5 31    sbc $31
A13C: 85 24    sta $24
A13E: A5 0E    lda $0e
A140: E5 32    sbc $32
A142: 10 07    bpl $a14b
A144: A9 00    lda #$00
A146: 38       sec
A147: E5 24    sbc $24
A149: 85 24    sta $24
A14B: A5 24    lda $24
A14D: 85 1A    sta $1a
A14F: 84 22    sty $22
A151: 20 6E DE jsr multiply_de6e
A154: A4 22    ldy $22
A156: A5 1C    lda resh_1c
A158: 85 38    sta $38
A15A: C8       iny
A15B: B1 5A    lda ($5a), y
A15D: 29 7F    and #$7f
A15F: 85 19    sta $19
A161: 20 6E DE jsr multiply_de6e
A164: A4 22    ldy $22
A166: A5 1B    lda resl_1b
A168: 18       clc
A169: 65 38    adc $38
A16B: 85 38    sta $38
A16D: A9 00    lda #$00
A16F: 65 1C    adc resh_1c
A171: 85 39    sta $39
A173: C8       iny
A174: B1 5A    lda ($5a), y
A176: 20 63 A0 jsr $a063
A179: 88       dey
A17A: A5 0D    lda $0d
A17C: 85 3A    sta $3a
A17E: A5 0E    lda $0e
A180: 85 3B    sta $3b
A182: 20 6F A5 jsr $a56f
A185: A9 00    lda #$00
A187: 85 41    sta $41
A189: 20 D2 A4 jsr $a4d2
A18C: B0 03    bcs $a191
A18E: 4C 80 A5 jmp $a580
A191: 20 83 A0 jsr $a083
A194: C6 21    dec $21
A196: D0 92    bne $a12a
A198: 60       rts
A199: 06 28    asl $28
A19B: 00       brk
A19C: 28       plp
A19D: 1C 28 32 nop $3228, x
A1A0: 28       plp
A1A1: 40       rti
A1A2: 28       plp
A1A3: 00       brk
A1A4: 28       plp
A1A5: 5A       nop
A1A6: 28       plp
A1A7: 68       pla
A1A8: 28       plp
A1A9: 00       brk
A1AA: 28       plp
A1AB: 6E 28 74 ror $7428
A1AE: 28       plp
A1AF: 7A       nop
A1B0: 28       plp
A1B1: 80 28    nop #$28
A1B3: 9A       txs
A1B4: 28       plp
A1B5: AC 28 BE ldy $be28
A1B8: 28       plp
A1B9: 00       brk
A1BA: 00       brk
A1BB: 00       brk
A1BC: 00       brk
A1BD: 00       brk
A1BE: 00       brk
A1BF: 00       brk
A1C0: 00       brk
A1C1: CE 2A EC dec $ec2a
A1C4: 2A       rol a
A1C5: 12       kil
A1C6: 2B 44    anc #$44
A1C8: 2B 5A    anc #$5a
A1CA: 2B 78    anc #$78
A1CC: 2B 9E    anc #$9e
A1CE: 2B D0    anc #$d0
A1D0: 2B 00    anc #$00
A1D2: 00       brk
A1D3: 00       brk
A1D4: 00       brk
A1D5: 00       brk
A1D6: 00       brk
A1D7: 00       brk
A1D8: 00       brk
A1D9: E6 2B    inc $2b
A1DB: F4 2B    nop $2b, x
A1DD: 06 2C    asl $2c
A1DF: 20 2C 3A jsr $3a2c
A1E2: 2C 60 2C bit $2c60
A1E5: 82 2C    nop #$2c
A1E7: AC 2C BE ldy $be2c
A1EA: 2C D0 2C bit $2cd0
A1ED: EA       nop
A1EE: 2C 08 2D bit $2d08
A1F1: 26 2D    rol $2d
A1F3: 40       rti
A1F4: 2D 4E 2D and $2d4e
A1F7: 6C 2D CA jmp ($ca2d)
A1FA: 28       plp
A1FB: E8       inx
A1FC: 28       plp
A1FD: 0E 29 30 asl $3029
A200: 29 52    and #$52
A202: 29 60    and #$60
A204: 29 86    and #$86
A206: 29 B4    and #$b4
A208: 29 C2    and #$c2
A20A: 29 E8    and #$e8
A20C: 29 12    and #$12
A20E: 2A       rol a
A20F: 34 2A    nop $2a, x
A211: 56 2A    lsr $2a, x
A213: 78       sei
A214: 2A       rol a
A215: A2 2A    ldx #$2a
A217: AC 2A 00 ldy $002a
A21A: 00       brk
A21B: 00       brk
A21C: 00       brk
A21D: 00       brk
A21E: 00       brk
A21F: 7E 2D 8C ror $8c2d, x
A222: 2D AE 2D and $2dae
A225: D4 2D    nop $2d, x
A227: EE 2D 14 inc $142d
A22A: 2E 46 2E rol $2e46
A22D: 78       sei
A22E: 2E AE 2E rol $2eae
A231: C8       iny
A232: 2E 00 00 rol $0000
A235: 00       brk
A236: 00       brk
A237: 00       brk
A238: 00       brk
A239: 00       brk
A23A: 28       plp
A23B: D2       kil
A23C: 2E 00 28 rol $2800
A23F: D8       cld
A240: 2E 00 28 rol $2800
A243: 00       brk
A244: 28       plp
A245: D2       kil
A246: 2E D2 2E rol $2ed2
A249: 00       brk
A24A: 28       plp
A24B: D8       cld
A24C: 2E 00 28 rol $2800
A24F: D8       cld
A250: 2E D2 2E rol $2ed2
A253: 00       brk
A254: 28       plp
A255: D8       cld
A256: 2E 00 28 rol $2800
A259: D8       cld
A25A: 2E DE 2E rol $2ede
A25D: F4 2E    nop $2e, x
A25F: 00       brk
A260: 28       plp
A261: 06 2F    asl $2f
A263: 18       clc
A264: 2F D2 2E rla $2ed2
A267: 2A       rol a
A268: 2F 40 2F rla $2f40
A26B: D8       cld
A26C: 2E 00 28 rol $2800
A26F: 52       kil
A270: 2F 00 28 rla $2800
A273: 60       rts
A274: 2F 00 28 rla $2800
A277: 00       brk
A278: 28       plp
A279: 00       brk
A27A: 00       brk
A27B: 00       brk
A27C: 00       brk
A27D: 00       brk
A27E: 00       brk
A27F: 72       kil
A280: 2F 94 2F rla $2f94
A283: B2       kil
A284: 2F D4 2F rla $2fd4
A287: FA       nop
A288: 2F 0C 30 rla $300c
A28B: 32       kil
A28C: 30 58    bmi $a2e6
A28E: 30 86    bmi $a216
A290: 30 B0    bmi $a242
A292: 30 00    bmi $a294
A294: 00       brk
A295: 00       brk
A296: 00       brk
A297: 00       brk
A298: 00       brk
A299: 00       brk
A29A: 28       plp
A29B: C6 30    dec $30
A29D: D4 30    nop $30, x
A29F: DE 30 E4 dec $e430, x
A2A2: 30 F6    bmi $a29a
A2A4: 30 08    bmi $a2ae
A2A6: 31 00    and ($00), y
A2A8: 28       plp
A2A9: 0E 31 28 asl $2831
A2AC: 31 56    and ($56), y
A2AE: 31 7C    and ($7c), y
A2B0: 31 A2    and ($a2), y
A2B2: 31 D0    and ($d0), y
A2B4: 31 00    and ($00), y
A2B6: 28       plp
A2B7: E2 31    nop #$31
A2B9: 0E 37 20 asl $2037
A2BC: 37 36    rla $36, x
A2BE: 37 0E    rla $0e, x
A2C0: 37 20    rla $20, x
A2C2: 37 54    rla $54, x
A2C4: 37 7E    rla $7e, x
A2C6: 37 94    rla $94, x
A2C8: 37 C2    rla $c2, x
A2CA: 37 00    rla $00, x
A2CC: 28       plp
A2CD: D8       cld
A2CE: 37 F6    rla $f6, x
A2D0: 37 00    rla $00, x
A2D2: 28       plp
A2D3: 14 38    nop $38, x
A2D5: 2A       rol a
A2D6: 38       sec
A2D7: 00       brk
A2D8: 28       plp
A2D9: 00       brk
A2DA: 00       brk
A2DB: 00       brk
A2DC: 00       brk
A2DD: 00       brk
A2DE: 00       brk
A2DF: A6 33    ldx $33
A2E1: C0 33    cpy #$33
A2E3: DE 33 0C dec $0c33, x
A2E6: 34 26    nop $26, x
A2E8: 34 50    nop $50, x
A2EA: 34 76    nop $76, x
A2EC: 34 90    nop $90, x
A2EE: 34 BE    nop $be, x
A2F0: 34 DC    nop $dc, x
A2F2: 34 00    nop $00, x
A2F4: 00       brk
A2F5: 00       brk
A2F6: 00       brk
A2F7: 00       brk
A2F8: 00       brk
A2F9: 00       brk
A2FA: 28       plp
A2FB: EC 31 FE cpx $fe31
A2FE: 31 28    and ($28), y
A300: 32       kil
A301: 4E 32 74 lsr $7432
A304: 32       kil
A305: 92       kil
A306: 32       kil
A307: A8       tay
A308: 32       kil
A309: C2 32    nop #$32
A30B: E0 32    cpx #$32
A30D: F6 32    inc $32, x
A30F: 10 33    bpl $a344
A311: 2A       rol a
A312: 33 44    rla ($44), y
A314: 33 6A    rla ($6a), y
A316: 33 90    rla ($90), y
A318: 33 00    rla ($00), y
A31A: FF 00 00 isb $0000, x
A31D: E0 01    cpx #$01
A31F: C0 FE    cpy #$fe
A321: 20 FF 00 jsr $00ff
A324: 00       brk
A325: C0 01    cpy #$01
A327: 40       rti
A328: FF 00 00 isb $0000, x
A32B: C0 00    cpy #$00
A32D: 80 FF    nop #$ff
A32F: E0 FE    cpx #$fe
A331: 00       brk
A332: 00       brk
A333: 00       brk
A334: 00       brk
A335: 20 02 00 jsr $0002
A338: FF 00 00 isb $0000, x
A33B: 00       brk
A33C: 00       brk
A33D: 00       brk
A33E: 00       brk
A33F: 00       brk
A340: 00       brk
A341: E0 FE    cpx #$fe
A343: A0 FF    ldy #$ff
A345: A0 00    ldy #$00
A347: A0 FF    ldy #$ff
A349: 00       brk
A34A: 00       brk
A34B: 20 FF E0 jsr $e0ff
A34E: 01 00    ora ($00, x)
A350: 00       brk
A351: 00       brk
A352: 00       brk
A353: 00       brk
A354: 00       brk
A355: 00       brk
A356: 00       brk
A357: 00       brk
A358: 00       brk
A359: 80 FE    nop #$fe
A35B: 20 FF 00 jsr $00ff
A35E: 00       brk
A35F: 60       rts
A360: 00       brk
A361: E0 00    cpx #$00
A363: E0 FE    cpx #$fe
A365: 40       rti
A366: 00       brk
A367: 00       brk
A368: 02       kil
A369: 80 FE    nop #$fe
A36B: C0 FF    cpy #$ff
A36D: 80 FF    nop #$ff
A36F: 80 00    nop #$00
A371: C0 01    cpy #$01
A373: 60       rts
A374: FE 40 00 inc $0040, x
A377: 60       rts
A378: 01 80    ora ($80, x)
A37A: 00       brk
A37B: C0 FF    cpy #$ff
A37D: 20 00 00 jsr $0000
A380: 00       brk
A381: A0 FF    ldy #$ff
A383: 00       brk
A384: 00       brk
A385: 80 00    nop #$00
A387: 40       rti
A388: 00       brk
A389: 00       brk
A38A: 00       brk
A38B: 80 FF    nop #$ff
A38D: 40       rti
A38E: 00       brk
A38F: A0 FF    ldy #$ff
A391: 20 00 00 jsr $0000
A394: 00       brk
A395: 40       rti
A396: 00       brk
A397: 80 FF    nop #$ff
A399: 00       brk
A39A: 00       brk
A39B: 00       brk
A39C: 00       brk
A39D: 00       brk
A39E: 00       brk
A39F: 00       brk
A3A0: FF 00 FF isb $ff00, x
A3A3: 00       brk
A3A4: FF 00 00 isb $0000, x
A3A7: 00       brk
A3A8: 00       brk
A3A9: 00       brk
A3AA: 00       brk
A3AB: 00       brk
A3AC: 00       brk
A3AD: 00       brk
A3AE: 01 00    ora ($00, x)
A3B0: 01 00    ora ($00, x)
A3B2: 01 00    ora ($00, x)
A3B4: 00       brk
A3B5: 00       brk
A3B6: 00       brk
A3B7: 00       brk
A3B8: 00       brk
A3B9: 00       brk
A3BA: 00       brk
A3BB: 00       brk
A3BC: FF 00 00 isb $0000, x
A3BF: 00       brk
A3C0: 01 00    ora ($00, x)
A3C2: 00       brk
A3C3: 00       brk
A3C4: 00       brk
A3C5: 00       brk
A3C6: FF 00 FF isb $ff00, x
A3C9: 00       brk
A3CA: 00       brk
A3CB: 00       brk
A3CC: 01 00    ora ($00, x)
A3CE: 00       brk
A3CF: 00       brk
A3D0: 01 00    ora ($00, x)
A3D2: FF 00 00 isb $0000, x
A3D5: 00       brk
A3D6: 01 00    ora ($00, x)
A3D8: 00       brk
A3D9: 00       brk
A3DA: FF 00 00 isb $0000, x
A3DD: 00       brk
A3DE: 00       brk
A3DF: 00       brk
A3E0: 00       brk
A3E1: 00       brk
A3E2: 00       brk
A3E3: 00       brk
A3E4: 02       kil
A3E5: 00       brk
A3E6: FD 00 00 sbc $0000, x
A3E9: 00       brk
A3EA: 01 00    ora ($00, x)
A3EC: 01 00    ora ($00, x)
A3EE: 00       brk
A3EF: 00       brk
A3F0: 01 00    ora ($00, x)
A3F2: FF 00 00 isb $0000, x
A3F5: 00       brk
A3F6: 00       brk
A3F7: 00       brk
A3F8: 00       brk
A3F9: 00       brk
A3FA: 00       brk
A3FB: 00       brk
A3FC: 00       brk
A3FD: 00       brk
A3FE: 00       brk
A3FF: 00       brk
A400: FF 00 FF isb $ff00, x
A403: 00       brk
A404: 00       brk
A405: 00       brk
A406: 02       kil
A407: 00       brk
A408: 00       brk
A409: 00       brk
A40A: FF 00 00 isb $0000, x
A40D: 00       brk
A40E: 00       brk
A40F: 00       brk
A410: 01 00    ora ($00, x)
A412: 01 00    ora ($00, x)
A414: 00       brk
A415: 00       brk
A416: 00       brk
A417: 00       brk
A418: 00       brk
A419: 00       brk
A41A: 00       brk
A41B: C0 02    cpy #$02
A41D: C0 00    cpy #$00
A41F: 00       brk
A420: 02       kil
A421: C0 FB    cpy #$fb
A423: 00       brk
A424: 00       brk
A425: 40       rti
A426: FE 00 00 inc $0000, x
A429: 00       brk
A42A: 01 00    ora ($00, x)
A42C: 00       brk
A42D: 00       brk
A42E: 00       brk
A42F: 00       brk
A430: 00       brk
A431: 00       brk
A432: 00       brk
A433: 00       brk
A434: 00       brk
A435: 00       brk
A436: 00       brk
A437: 80 FF    nop #$ff
A439: 00       brk
A43A: 00       brk
A43B: 00       brk
A43C: 00       brk
A43D: 00       brk
A43E: 00       brk
A43F: 00       brk
A440: 00       brk
A441: 00       brk
A442: 00       brk
A443: 00       brk
A444: 00       brk
A445: 00       brk
A446: 00       brk
A447: 00       brk
A448: 00       brk
A449: 00       brk
A44A: 00       brk
A44B: 00       brk
A44C: 00       brk
A44D: 00       brk
A44E: 00       brk
A44F: 00       brk
A450: 00       brk
A451: 00       brk
A452: 00       brk
A453: 00       brk
A454: 00       brk
A455: 00       brk
A456: 00       brk
A457: 00       brk
A458: 00       brk
A459: 00       brk
A45A: 00       brk
A45B: 00       brk
A45C: 00       brk
A45D: 00       brk
A45E: 00       brk
A45F: 00       brk
A460: FF 00 FF isb $ff00, x
A463: 00       brk
A464: 01 00    ora ($00, x)
A466: 00       brk
A467: 00       brk
A468: FF 00 01 isb $0100, x
A46B: 00       brk
A46C: 00       brk
A46D: 00       brk
A46E: FF 00 01 isb $0100, x
A471: 00       brk
A472: 01 00    ora ($00, x)
A474: 00       brk
A475: 00       brk
A476: 00       brk
A477: 00       brk
A478: 00       brk
A479: 00       brk
A47A: FF 00 FE isb $fe00, x
A47D: 00       brk
A47E: 00       brk
A47F: 00       brk
A480: 00       brk
A481: 00       brk
A482: 00       brk
A483: 00       brk
A484: 00       brk
A485: C0 00    cpy #$00
A487: 00       brk
A488: 00       brk
A489: C0 00    cpy #$00
A48B: 00       brk
A48C: 00       brk
A48D: 00       brk
A48E: FF 00 00 isb $0000, x
A491: C0 FE    cpy #$fe
A493: 80 00    nop #$00
A495: 00       brk
A496: 01 40    ora ($40, x)
A498: 02       kil
A499: A2 02    ldx #$02
A49B: B5 38    lda $38, x
A49D: 38       sec
A49E: F5 3C    sbc $3c, x
A4A0: 95 38    sta $38, x
A4A2: B5 39    lda $39, x
A4A4: F5 3D    sbc $3d, x
A4A6: 95 39    sta $39, x
A4A8: CA       dex
A4A9: CA       dex
A4AA: 10 EF    bpl $a49b
A4AC: A9 00    lda #$00
A4AE: 85 55    sta $55
A4B0: A2 02    ldx #$02
A4B2: B5 39    lda $39, x
A4B4: 10 14    bpl $a4ca
A4B6: A9 00    lda #$00
A4B8: 38       sec
A4B9: F5 38    sbc $38, x
A4BB: 95 38    sta $38, x
A4BD: A9 00    lda #$00
A4BF: F5 39    sbc $39, x
A4C1: 95 39    sta $39, x
A4C3: A5 55    lda $55
A4C5: 1D CF A4 ora $a4cf, x
A4C8: 85 55    sta $55
A4CA: CA       dex
A4CB: CA       dex
A4CC: 10 E4    bpl $a4b2
A4CE: 60       rts
A4CF: 01 00    ora ($00, x)
A4D1: 02       kil
A4D2: 20 99 A4 jsr $a499
A4D5: A5 39    lda $39
A4D7: 05 3B    ora $3b
A4D9: D0 1F    bne $a4fa
A4DB: A6 41    ldx $41
A4DD: 10 03    bpl $a4e2
A4DF: 4C FC A4 jmp $a4fc
A4E2: A5 38    lda $38
A4E4: DD 2A A5 cmp $a52a, x
A4E7: B0 0C    bcs $a4f5
A4E9: A5 3A    lda $3a
A4EB: DD 2E A5 cmp $a52e, x
A4EE: B0 05    bcs $a4f5
A4F0: 65 38    adc $38
A4F2: DD 32 A5 cmp $a532, x
A4F5: A5 38    lda $38
A4F7: 4C FB A4 jmp $a4fb
A4FA: 38       sec
A4FB: 60       rts
A4FC: A4 22    ldy $22
A4FE: A5 38    lda $38
A500: D9 12 A5 cmp $a512, y
A503: B0 0C    bcs $a511
A505: A5 3A    lda $3a
A507: D9 1A A5 cmp $a51a, y
A50A: B0 05    bcs $a511
A50C: 65 38    adc $38
A50E: D9 22 A5 cmp $a522, y
A511: 60       rts
A512: 24 24    bit $24
A514: 24 24    bit $24
A516: 24 24    bit $24
A518: 24 24    bit $24
A51A: 2E 2E 2E rol $2e2e
A51D: 2E 2E 2E rol $2e2e
A520: 2E 2E 40 rol $402e
A523: 40       rti
A524: 40       rti
A525: 40       rti
A526: 40       rti
A527: 40       rti
A528: 40       rti
A529: 40       rti
A52A: 13 10    slo ($10), y
A52C: 23 30    rla ($30, x)
A52E: 11 14    ora ($14), y
A530: 24 50    bit $50
A532: 18       clc
A533: 1C 32 70 nop $7032, x
A536: A5 31    lda $31
A538: 38       sec
A539: E5 0D    sbc $0d
A53B: 85 7B    sta $7b
A53D: A5 32    lda $32
A53F: E5 0E    sbc $0e
A541: 85 22    sta $22
A543: D0 08    bne $a54d
A545: A5 7B    lda $7b
A547: C9 02    cmp #$02
A549: B0 02    bcs $a54d
A54B: 38       sec
A54C: 60       rts
A54D: A5 31    lda $31
A54F: 18       clc
A550: 71 56    adc ($56), y
A552: 85 23    sta $23
A554: A5 32    lda $32
A556: C8       iny
A557: 71 56    adc ($56), y
A559: 88       dey
A55A: 85 24    sta $24
A55C: A5 23    lda $23
A55E: 38       sec
A55F: E5 0D    sbc $0d
A561: A5 24    lda $24
A563: E5 0E    sbc $0e
A565: 45 22    eor $22
A567: 10 04    bpl $a56d
A569: 38       sec
A56A: 4C 6E A5 jmp $a56e
A56D: 18       clc
A56E: 60       rts
A56F: A5 0F    lda $0f
A571: 85 3C    sta $3c
A573: A5 10    lda $10
A575: 85 3D    sta $3d
A577: A5 0D    lda $0d
A579: 85 3E    sta $3e
A57B: A5 0E    lda $0e
A57D: 85 3F    sta $3f
A57F: 60       rts
A580: 20 8A A5 jsr $a58a
A583: 20 C0 C8 jsr $c8c0
A586: 20 EB E0 jsr $e0eb
A589: 60       rts
A58A: A9 00    lda #$00
A58C: A6 CF    ldx $cf
A58E: 95 88    sta $88, x
A590: A5 0F    lda $0f
A592: 85 38    sta $38
A594: A5 10    lda $10
A596: 85 39    sta $39
A598: A5 0D    lda $0d
A59A: 85 3A    sta $3a
A59C: A5 0E    lda $0e
A59E: 85 3B    sta $3b
A5A0: 60       rts
A5A1: 40       rti
A5A2: 00       brk
A5A3: 60       rts
A5A4: 00       brk
A5A5: 60       rts
A5A6: 00       brk
A5A7: A0 FF    ldy #$ff
A5A9: 60       rts
A5AA: 00       brk
A5AB: 40       rti
A5AC: 00       brk
A5AD: C0 00    cpy #$00
A5AF: C0 00    cpy #$00
A5B1: 40       rti
A5B2: FF 60 00 isb $0060, x
A5B5: 40       rti
A5B6: 00       brk
A5B7: 60       rts
A5B8: 00       brk
A5B9: 80 00    nop #$00
A5BB: 80 FF    nop #$ff
A5BD: FF 00 60 isb $6000, x
A5C0: 00       brk
A5C1: A0 FF    ldy #$ff
A5C3: 40       rti
A5C4: 00       brk
A5C5: C0 00    cpy #$00
A5C7: 40       rti
A5C8: FF C0 00 isb $00c0, x
A5CB: FF 00 A0 isb $a000, x
A5CE: 00       brk
A5CF: 60       rts
A5D0: FF FF 00 isb $00ff, x
A5D3: FF 00 FF isb $ff00, x
A5D6: 00       brk
A5D7: FF 00 FF isb $ff00, x
A5DA: 00       brk
A5DB: FF 00 FF isb $ff00, x
A5DE: 00       brk
A5DF: 00       brk
A5E0: 00       brk
A5E1: 40       rti
A5E2: FF 40 00 isb $0040, x
A5E5: 80 FF    nop #$ff
A5E7: FF 00 FF isb $ff00, x
A5EA: 00       brk
A5EB: 01 FF    ora ($ff, x)
A5ED: FF 00 01 isb $0100, x
A5F0: FF A0 00 isb $00a0, x
A5F3: 60       rts
A5F4: FF 80 00 isb $0080, x
A5F7: 80 00    nop #$00
A5F9: C0 00    cpy #$00
A5FB: 40       rti
A5FC: 00       brk
A5FD: 00       brk
A5FE: 00       brk
A5FF: 60       rts
A600: 00       brk
A601: 40       rti
A602: FF 60 FF isb $ff60, x
A605: 00       brk
A606: 00       brk
A607: 00       brk
A608: 00       brk
A609: 00       brk
A60A: 00       brk
A60B: 40       rti
A60C: 01 C0    ora ($c0, x)
A60E: 00       brk
A60F: 40       rti
A610: 00       brk
A611: 00       brk
A612: 00       brk
A613: A0 FF    ldy #$ff
A615: 80 FF    nop #$ff
A617: 40       rti
A618: FF 00 00 isb $0000, x
A61B: C0 00    cpy #$00
A61D: E0 00    cpx #$00
A61F: 00       brk
A620: 00       brk
A621: A0 FF    ldy #$ff
A623: 60       rts
A624: FE 80 FF inc $ff80, x
A627: 00       brk
A628: 00       brk
A629: 40       rti
A62A: 01 E0    ora ($e0, x)
A62C: 00       brk
A62D: A0 FF    ldy #$ff
A62F: 40       rti
A630: FF 00 00 isb $0000, x
A633: C0 00    cpy #$00
A635: 80 FF    nop #$ff
A637: E0 FE    cpx #$fe
A639: 00       brk
A63A: 00       brk
A63B: E0 00    cpx #$00
A63D: 40       rti
A63E: 00       brk
A63F: 80 00    nop #$00
A641: A0 00    ldy #$00
A643: 00       brk
A644: 00       brk
A645: 00       brk
A646: 00       brk
A647: E0 00    cpx #$00
A649: 60       rts
A64A: 01 00    ora ($00, x)
A64C: 00       brk
A64D: 00       brk
A64E: 00       brk
A64F: 20 01 00 jsr $0001
A652: 00       brk
A653: 00       brk
A654: 01 00    ora ($00, x)
A656: FF 00 00 isb $0000, x
A659: 00       brk
A65A: 00       brk
A65B: 00       brk
A65C: 01 00    ora ($00, x)
A65E: 82 AA    nop #$aa
A660: 81 00    sta ($00, x)
A662: 00       brk
A663: 00       brk
A664: 00       brk
A665: 00       brk
A666: 00       brk
A667: AA       tax
A668: 01 00    ora ($00, x)
A66A: 01 AA    ora ($aa, x)
A66C: 00       brk
A66D: 00       brk
A66E: 00       brk
A66F: 00       brk
A670: 81 00    sta ($00, x)
A672: 81 80    sta ($80, x)
A674: 81 00    sta ($00, x)
A676: 00       brk
A677: 00       brk
A678: 02       kil
A679: 55 02    eor $02, x
A67B: 00       brk
A67C: 00       brk
A67D: 80 80    nop #$80
A67F: 20 82 AA jsr $aa82
A682: 80 00    nop #$00
A684: 00       brk
A685: 00       brk
A686: 02       kil
A687: 66 01    ror $01
A689: 60       rts
A68A: 80 C0    nop #$c0
A68C: 80 00    nop #$00
A68E: 00       brk
A68F: C0 00    cpy #$00
A691: 80 80    nop #$80
A693: 10 81    bpl $a616
A695: 00       brk
A696: 00       brk
A697: 00       brk
A698: 81 55    sta ($55, x)
A69A: 00       brk
A69B: 00       brk
A69C: 02       kil
A69D: 40       rti
A69E: 01 00    ora ($00, x)
A6A0: 00       brk
A6A1: 00       brk
A6A2: 00       brk
A6A3: 00       brk
A6A4: 81 60    sta ($60, x)
A6A6: 01 00    ora ($00, x)
A6A8: 00       brk
A6A9: 00       brk
A6AA: 00       brk
A6AB: CC 01 00 cpy $0001
A6AE: 00       brk
A6AF: 00       brk
A6B0: 02       kil
A6B1: 55 81    eor $81, x
A6B3: 00       brk
A6B4: 00       brk
A6B5: 00       brk
A6B6: 0A       asl a
A6B7: 0E 18 1E asl $1e18
A6BA: 2A       rol a
A6BB: 2C 32 34 bit $3432
A6BE: 36 38    rol $38, x
A6C0: 3A       nop
A6C1: 3C 48 50 nop $5048, x
A6C4: 58       cli
A6C5: 05 02    ora $02
A6C7: 05 03    ora $03
A6C9: 06 01    asl $01
A6CB: 03 01    slo ($01, x)
A6CD: 01 01    ora ($01, x)
A6CF: 01 01    ora ($01, x)
A6D1: 06 04    asl $04
A6D3: 04 02    nop $02
A6D5: C0 00    cpy #$00
A6D7: 40       rti
A6D8: 00       brk
A6D9: 00       brk
A6DA: 00       brk
A6DB: 60       rts
A6DC: FF A0 00 isb $00a0, x
A6DF: 80 FF    nop #$ff
A6E1: 80 FF    nop #$ff
A6E3: 60       rts
A6E4: 00       brk
A6E5: 60       rts
A6E6: 00       brk
A6E7: 40       rti
A6E8: 00       brk
A6E9: 00       brk
A6EA: 00       brk
A6EB: C0 FF    cpy #$ff
A6ED: 40       rti
A6EE: 00       brk
A6EF: 00       brk
A6F0: 00       brk
A6F1: C0 FF    cpy #$ff
A6F3: 40       rti
A6F4: FF 60 00 isb $0060, x
A6F7: A0 FF    ldy #$ff
A6F9: 00       brk
A6FA: 00       brk
A6FB: 60       rts
A6FC: 00       brk
A6FD: A0 00    ldy #$00
A6FF: 80 FF    nop #$ff
A701: 80 00    nop #$00
A703: 00       brk
A704: 00       brk
A705: A0 FF    ldy #$ff
A707: 60       rts
A708: 00       brk
A709: 80 FF    nop #$ff
A70B: 80 FF    nop #$ff
A70D: A0 00    ldy #$00
A70F: 60       rts
A710: 00       brk
A711: 00       brk
A712: 00       brk
A713: 80 FF    nop #$ff
A715: 80 FF    nop #$ff
A717: FF 00 00 isb $0000, x
A71A: 00       brk
A71B: 01 FF    ora ($ff, x)
A71D: 60       rts
A71E: 00       brk
A71F: 80 00    nop #$00
A721: 80 FF    nop #$ff
A723: A0 FF    ldy #$ff
A725: FF 00 01 isb $0100, x
A728: FF A0 00 isb $00a0, x
A72B: 60       rts
A72C: 00       brk
A72D: A0 FF    ldy #$ff
A72F: 60       rts
A730: 00       brk
A731: 00       brk
A732: 00       brk
A733: A0 FF    ldy #$ff
A735: 60       rts
A736: FF 40 00 isb $0040, x
A739: 80 00    nop #$00
A73B: 40       rti
A73C: 00       brk
A73D: A0 FF    ldy #$ff
A73F: 60       rts
A740: 00       brk
A741: C0 FF    cpy #$ff
A743: 40       rti
A744: 00       brk
A745: 00       brk
A746: 00       brk
A747: C0 FF    cpy #$ff
A749: 40       rti
A74A: 00       brk
A74B: 60       rts
A74C: FF A0 FF isb $ffa0, x
A74F: C0 00    cpy #$00
A751: 40       rti
A752: 00       brk
A753: 80 FF    nop #$ff
A755: E0 FF    cpx #$ff
A757: A0 FF    ldy #$ff
A759: 00       brk
A75A: 00       brk
A75B: 40       rti
A75C: 00       brk
A75D: A0 FE    ldy #$fe
A75F: 00       brk
A760: 00       brk
A761: A0 00    ldy #$00
A763: 00       brk
A764: 00       brk
A765: 80 00    nop #$00
A767: A0 FF    ldy #$ff
A769: 40       rti
A76A: 00       brk
A76B: C0 FF    cpy #$ff
A76D: 40       rti
A76E: FF C0 FF isb $ffc0, x
A771: 00       brk
A772: 00       brk
A773: 80 03    nop #$03
A775: 00       brk
A776: 00       brk
A777: 40       rti
A778: FF A0 FF isb $ffa0, x
A77B: A0 FF    ldy #$ff
A77D: C0 FF    cpy #$ff
A77F: 00       brk
A780: 00       brk
A781: A0 00    ldy #$00
A783: 80 00    nop #$00
A785: 80 00    nop #$00
A787: 20 03 A0 jsr $a003
A78A: FF A0 FF isb $ffa0, x
A78D: 00       brk
A78E: 00       brk
A78F: 80 FF    nop #$ff
A791: 00       brk
A792: 00       brk
A793: A0 FF    ldy #$ff
A795: 00       brk
A796: 03 00    slo ($00, x)
A798: 00       brk
A799: 80 00    nop #$00
A79B: 00       brk
A79C: 00       brk
A79D: 7E 04 80 ror $8004, x
A7A0: FF 00 00 isb $0000, x
A7A3: 80 FF    nop #$ff
A7A5: 80 FF    nop #$ff
A7A7: 00       brk
A7A8: 00       brk
A7A9: 00       brk
A7AA: 00       brk
A7AB: 00       brk
A7AC: FF 60 FF isb $ff60, x
A7AF: 60       rts
A7B0: 00       brk
A7B1: 00       brk
A7B2: 00       brk
A7B3: 60       rts
A7B4: 00       brk
A7B5: E0 03    cpx #$03
A7B7: 00       brk
A7B8: 00       brk
A7B9: 80 01    nop #$01
A7BB: 40       rti
A7BC: 00       brk
A7BD: 00       brk
A7BE: 00       brk
A7BF: 40       rti
A7C0: 00       brk
A7C1: 60       rts
A7C2: 00       brk
A7C3: 80 00    nop #$00
A7C5: 40       rti
A7C6: 00       brk
A7C7: 40       rti
A7C8: 00       brk
A7C9: 20 01 40 jsr $4001
A7CC: 00       brk
A7CD: 40       rti
A7CE: 00       brk
A7CF: 00       brk
A7D0: 00       brk
A7D1: 60       rts
A7D2: 00       brk
A7D3: 00       brk
A7D4: 00       brk
A7D5: 40       rti
A7D6: 00       brk
A7D7: 80 00    nop #$00
A7D9: 00       brk
A7DA: 00       brk
A7DB: 60       rts
A7DC: 00       brk
A7DD: 00       brk
A7DE: 00       brk
A7DF: 00       brk
A7E0: 01 00    ora ($00, x)
A7E2: 00       brk
A7E3: 00       brk
A7E4: 00       brk
A7E5: 00       brk
A7E6: 01 00    ora ($00, x)
A7E8: 00       brk
A7E9: 00       brk
A7EA: 01 00    ora ($00, x)
A7EC: 81 AA    sta ($aa, x)
A7EE: 00       brk
A7EF: 00       brk
A7F0: 81 00    sta ($00, x)
A7F2: 01 00    ora ($00, x)
A7F4: 81 00    sta ($00, x)
A7F6: 00       brk
A7F7: 00       brk
A7F8: 01 00    ora ($00, x)
A7FA: 00       brk
A7FB: 00       brk
A7FC: 81 00    sta ($00, x)
A7FE: 81 00    sta ($00, x)
A800: 81 00    sta ($00, x)
A802: 01 00    ora ($00, x)
A804: 00       brk
A805: 00       brk
A806: 01 00    ora ($00, x)
A808: 01 00    ora ($00, x)
A80A: 01 00    ora ($00, x)
A80C: 81 00    sta ($00, x)
A80E: 81 00    sta ($00, x)
A810: 81 00    sta ($00, x)
A812: 00       brk
A813: 00       brk
A814: 81 00    sta ($00, x)
A816: 00       brk
A817: 00       brk
A818: 81 00    sta ($00, x)
A81A: 01 00    ora ($00, x)
A81C: 00       brk
A81D: 00       brk
A81E: 01 00    ora ($00, x)
A820: 00       brk
A821: 00       brk
A822: 00       brk
A823: 81 80    sta ($80, x)
A825: 00       brk
A826: 00       brk
A827: 00       brk
A828: 81 00    sta ($00, x)
A82A: 81 00    sta ($00, x)
A82C: 00       brk
A82D: 00       brk
A82E: 00       brk
A82F: 00       brk
A830: 81 00    sta ($00, x)
A832: 81 00    sta ($00, x)
A834: 01 00    ora ($00, x)
A836: 00       brk
A837: 00       brk
A838: 01 00    ora ($00, x)
A83A: 00       brk
A83B: 00       brk
A83C: 00       brk
A83D: 66 02    ror $02
A83F: 00       brk
A840: 01 00    ora ($00, x)
A842: 00       brk
A843: 00       brk
A844: 01 00    ora ($00, x)
A846: 01 00    ora ($00, x)
A848: 01 00    ora ($00, x)
A84A: 01 00    ora ($00, x)
A84C: 01 00    ora ($00, x)
A84E: 00       brk
A84F: 00       brk
A850: 01 00    ora ($00, x)
A852: 01 00    ora ($00, x)
A854: 00       brk
A855: 00       brk
A856: 01 00    ora ($00, x)
A858: 00       brk
A859: 00       brk
A85A: 01 00    ora ($00, x)
A85C: 01 00    ora ($00, x)
A85E: 00       brk
A85F: 00       brk
A860: 01 00    ora ($00, x)
A862: 00       brk
A863: 00       brk
A864: 00       brk
A865: 00       brk
A866: 0E 20 38 asl $3820
A869: 42       kil
A86A: 50 62    bvc $a8ce
A86C: 7A       nop
A86D: 00       brk
A86E: 00       brk
A86F: 00       brk
A870: 00       brk
A871: 00       brk
A872: 00       brk
A873: 00       brk
A874: 00       brk
A875: 07 09    slo $09
A877: 0C 05 07 nop $0705
A87A: 09 0C    ora #$0c
A87C: 05 00    ora $00
A87E: 00       brk
A87F: 00       brk
A880: 00       brk
A881: FF 00 40 isb $4000, x
A884: FF C0 00 isb $00c0, x
A887: FF 00 00 isb $0000, x
A88A: 00       brk
A88B: A0 FF    ldy #$ff
A88D: 60       rts
A88E: 00       brk
A88F: FF 00 00 isb $0000, x
A892: 00       brk
A893: A0 FF    ldy #$ff
A895: 60       rts
A896: FF 00 00 isb $0000, x
A899: FF 00 A0 isb $a000, x
A89C: 00       brk
A89D: 60       rts
A89E: 00       brk
A89F: 00       brk
A8A0: 00       brk
A8A1: 01 FF    ora ($ff, x)
A8A3: 00       brk
A8A4: 00       brk
A8A5: FF 00 60 isb $6000, x
A8A8: 00       brk
A8A9: 60       rts
A8AA: 00       brk
A8AB: 40       rti
A8AC: 00       brk
A8AD: 00       brk
A8AE: 00       brk
A8AF: A0 FF    ldy #$ff
A8B1: C0 FF    cpy #$ff
A8B3: A0 FF    ldy #$ff
A8B5: 00       brk
A8B6: 00       brk
A8B7: FF 00 80 isb $8000, x
A8BA: 00       brk
A8BB: 80 FF    nop #$ff
A8BD: 00       brk
A8BE: 00       brk
A8BF: FF 00 00 isb $0000, x
A8C2: 00       brk
A8C3: 60       rts
A8C4: FF 60 00 isb $0060, x
A8C7: 40       rti
A8C8: 00       brk
A8C9: 60       rts
A8CA: 00       brk
A8CB: A0 00    ldy #$00
A8CD: 00       brk
A8CE: 00       brk
A8CF: C0 FF    cpy #$ff
A8D1: A0 FF    ldy #$ff
A8D3: A0 FF    ldy #$ff
A8D5: 00       brk
A8D6: 00       brk
A8D7: 40       rti
A8D8: 00       brk
A8D9: C0 FF    cpy #$ff
A8DB: FF 00 A0 isb $a000, x
A8DE: 00       brk
A8DF: 60       rts
A8E0: 00       brk
A8E1: 01 FF    ora ($ff, x)
A8E3: FF 00 FF isb $ff00, x
A8E6: 00       brk
A8E7: 00       brk
A8E8: 00       brk
A8E9: A0 FF    ldy #$ff
A8EB: 60       rts
A8EC: 00       brk
A8ED: FF 00 00 isb $0000, x
A8F0: 00       brk
A8F1: C0 FF    cpy #$ff
A8F3: 40       rti
A8F4: FF 00 00 isb $0000, x
A8F7: FF 00 80 isb $8000, x
A8FA: 00       brk
A8FB: 80 00    nop #$00
A8FD: 00       brk
A8FE: 00       brk
A8FF: 20 FF E0 jsr $e0ff
A902: FF 00 00 isb $0000, x
A905: FF 00 60 isb $6000, x
A908: 00       brk
A909: A0 00    ldy #$00
A90B: 00       brk
A90C: 00       brk
A90D: 20 FF E0 jsr $e0ff
A910: FF 00 00 isb $0000, x
A913: FF 00 60 isb $6000, x
A916: 00       brk
A917: A0 00    ldy #$00
A919: 40       rti
A91A: FF C0 FF isb $ffc0, x
A91D: 00       brk
A91E: 00       brk
A91F: FF 00 40 isb $4000, x
A922: 00       brk
A923: 40       rti
A924: 00       brk
A925: 80 00    nop #$00
A927: 80 00    nop #$00
A929: 40       rti
A92A: 00       brk
A92B: 40       rti
A92C: 00       brk
A92D: 00       brk
A92E: 00       brk
A92F: 01 FF    ora ($ff, x)
A931: 80 00    nop #$00
A933: 80 00    nop #$00
A935: C0 00    cpy #$00
A937: 40       rti
A938: FF 00 00 isb $0000, x
A93B: FF 00 00 isb $0000, x
A93E: 00       brk
A93F: 40       rti
A940: FF 40 FF isb $ff40, x
A943: 20 FF 80 jsr $80ff
A946: 01 E0    ora ($e0, x)
A948: 00       brk
A949: 00       brk
A94A: 00       brk
A94B: 00       brk
A94C: 00       brk
A94D: E0 00    cpx #$00
A94F: 00       brk
A950: 00       brk
A951: A0 00    ldy #$00
A953: E0 00    cpx #$00
A955: 00       brk
A956: 00       brk
A957: 00       brk
A958: 00       brk
A959: 60       rts
A95A: 00       brk
A95B: 80 01    nop #$01
A95D: 00       brk
A95E: FF 80 01 isb $0180, x
A961: 00       brk
A962: 00       brk
A963: A0 00    ldy #$00
A965: 00       brk
A966: 00       brk
A967: 40       rti
A968: 00       brk
A969: A0 00    ldy #$00
A96B: 40       rti
A96C: 00       brk
A96D: 00       brk
A96E: 00       brk
A96F: C0 FF    cpy #$ff
A971: 80 00    nop #$00
A973: 00       brk
A974: 00       brk
A975: 00       brk
A976: 00       brk
A977: A0 00    ldy #$00
A979: 80 00    nop #$00
A97B: 00       brk
A97C: 00       brk
A97D: 00       brk
A97E: FF 20 FF isb $ff20, x
A981: A0 FF    ldy #$ff
A983: 00       brk
A984: 00       brk
A985: 40       rti
A986: 00       brk
A987: 00       brk
A988: 00       brk
A989: 00       brk
A98A: 01 80    ora ($80, x)
A98C: FF 80 00 isb $0080, x
A98F: 00       brk
A990: 00       brk
A991: 00       brk
A992: 01 C0    ora ($c0, x)
A994: FF C0 FF isb $ffc0, x
A997: 80 FF    nop #$ff
A999: 80 00    nop #$00
A99B: A0 00    ldy #$00

A9A9: C0 FF    cpy #$ff
A9AB: C0 00    cpy #$00
A9AD: 00       brk
A9AE: 00       brk
A9AF: 80 00    nop #$00
A9B1: 80 00    nop #$00
A9B3: 00       brk
A9B4: 00       brk
A9B5: 80 FF    nop #$ff
A9B7: 00       brk
A9B8: 00       brk
A9B9: 80 01    nop #$01
A9BB: 00       brk
A9BC: 00       brk
A9BD: C0 FF    cpy #$ff
A9BF: 00       brk
A9C0: 01 00    ora ($00, x)
A9C2: 00       brk
A9C3: 80 00    nop #$00
A9C5: 00       brk
A9C6: 00       brk
A9C7: 40       rti
A9C8: 01 00    ora ($00, x)
A9CA: 00       brk
A9CB: C0 FF    cpy #$ff
A9CD: C0 00    cpy #$00
A9CF: 00       brk
A9D0: 00       brk
A9D1: 80 00    nop #$00
A9D3: 00       brk
A9D4: 00       brk
A9D5: C0 00    cpy #$00
A9D7: 00       brk
A9D8: 00       brk
A9D9: 80 00    nop #$00
A9DB: 00       brk
A9DC: 00       brk
A9DD: 80 FF    nop #$ff
A9DF: A0 FF    ldy #$ff
A9E1: C0 00    cpy #$00
A9E3: 00       brk
A9E4: 00       brk
A9E5: 40       rti
A9E6: 00       brk
A9E7: 00       brk
A9E8: 00       brk
A9E9: E0 00    cpx #$00
A9EB: 00       brk
A9EC: 00       brk
A9ED: 80 00    nop #$00
A9EF: 00       brk
A9F0: 00       brk
A9F1: 00       brk
A9F2: 00       brk
A9F3: E0 00    cpx #$00
A9F5: 80 00    nop #$00
A9F7: 00       brk
A9F8: 00       brk
A9F9: 00       brk
A9FA: 00       brk
A9FB: 00       brk
A9FC: 81 00    sta ($00, x)
A9FE: 81 E0    sta ($e0, x)
AA00: 80 00    nop #$00
AA02: 00       brk
AA03: 55 02    eor $02, x
AA05: 00       brk
AA06: 00       brk
AA07: 00       brk
AA08: 00       brk
AA09: 00       brk
AA0A: 00       brk
AA0B: 00       brk
AA0C: 00       brk
AA0D: 00       brk
AA0E: 01 00    ora ($00, x)
AA10: 00       brk
AA11: 00       brk
AA12: 00       brk
AA13: 00       brk
AA14: 00       brk
AA15: 00       brk
AA16: 01 00    ora ($00, x)
AA18: 00       brk
AA19: 00       brk
AA1A: 81 00    sta ($00, x)
AA1C: 00       brk
AA1D: 00       brk
AA1E: 00       brk
AA1F: AA       tax
AA20: 01 00    ora ($00, x)
AA22: 00       brk
AA23: 00       brk
AA24: 01 00    ora ($00, x)
AA26: 00       brk
AA27: AA       tax
AA28: 00       brk
AA29: 00       brk
AA2A: 00       brk
AA2B: AA       tax
AA2C: 80 00    nop #$00
AA2E: 00       brk
AA2F: 00       brk
AA30: 00       brk
AA31: 00       brk
AA32: 00       brk
AA33: 00       brk
AA34: 01 00    ora ($00, x)
AA36: 00       brk
AA37: 00       brk
AA38: 00       brk
AA39: 00       brk
AA3A: 00       brk
AA3B: 66 81    ror $81
AA3D: 00       brk
AA3E: 81 00    sta ($00, x)
AA40: 00       brk
AA41: AA       tax
AA42: 00       brk
AA43: 00       brk
AA44: 00       brk
AA45: 00       brk
AA46: 00       brk
AA47: 00       brk
AA48: 82 55    nop #$55
AA4A: 01 00    ora ($00, x)
AA4C: 00       brk
AA4D: 00       brk
AA4E: 00       brk
AA4F: 00       brk
AA50: 81 00    sta ($00, x)
AA52: 81 80    sta ($80, x)
AA54: 80 CC    nop #$cc
AA56: 00       brk
AA57: AA       tax
AA58: 01 E0    ora ($e0, x)
AA5A: 00       brk
AA5B: 00       brk
AA5C: 00       brk
AA5D: 80 81    nop #$81
AA5F: 00       brk
AA60: 00       brk
AA61: 55 01    eor $01, x
AA63: 00       brk
AA64: 00       brk
AA65: 40       rti
AA66: 80 00    nop #$00
AA68: 00       brk
AA69: 00       brk
AA6A: 00       brk
AA6B: AA       tax
AA6C: 00       brk
AA6D: 00       brk
AA6E: 00       brk
AA6F: 00       brk
AA70: 00       brk
AA71: 00       brk
AA72: 81 00    sta ($00, x)
AA74: 00       brk
AA75: 00       brk
AA76: 00       brk
AA77: 00       brk
AA78: 00       brk
AA79: 00       brk
AA7A: 82 00    nop #$00
AA7C: 00       brk
AA7D: 00       brk
AA7E: 00       brk
AA7F: 55 01    eor $01, x
AA81: 00       brk
AA82: 00       brk
AA83: 00       brk
AA84: 00       brk
AA85: 00       brk
AA86: 00       brk
AA87: 00       brk
AA88: 82 00    nop #$00
AA8A: 00       brk
AA8B: 00       brk
AA8C: 00       brk
AA8D: 55 01    eor $01, x
AA8F: 00       brk
AA90: 00       brk
AA91: 00       brk
AA92: 01 00    ora ($00, x)
AA94: 00       brk
AA95: 00       brk
AA96: 00       brk
AA97: 00       brk
AA98: 00       brk
AA99: 00       brk
AA9A: 82 80    nop #$80
AA9C: 81 80    sta ($80, x)
AA9E: 81 00    sta ($00, x)
AAA0: 00       brk
AAA1: 00       brk
AAA2: 01 00    ora ($00, x)
AAA4: 00       brk
AAA5: 00       brk
AAA6: 00       brk
AAA7: 00       brk
AAA8: 00       brk
AAA9: 00       brk
AAAA: 01 00    ora ($00, x)
AAAC: 00       brk
AAAD: 00       brk
AAAE: 00       brk
AAAF: 2B 01    anc #$01
AAB1: 00       brk
AAB2: 00       brk
AAB3: 00       brk
AAB4: 00       brk
AAB5: 00       brk
AAB6: 06 0E    asl $0e
AAB8: 1A       nop
AAB9: 26 38    rol $38
AABB: 48       pha
AABC: 5C 64 6C nop $6c64, x
AABF: 78       sei
AAC0: 86 94    stx $94
AAC2: A0 A6    ldy #$a6
AAC4: B4 03    ldy $03, x
AAC6: 04 06    nop $06
AAC8: 06 09    asl $09
AACA: 08       php
AACB: 0A       asl a
AACC: 04 04    nop $04
AACE: 06 07    asl $07
AAD0: 07 06    slo $06
AAD2: 03 07    slo ($07, x)
AAD4: 04 FF    nop $ff
AAD6: 00       brk
AAD7: 00       brk
AAD8: 00       brk
AAD9: C0 FF    cpy #$ff
AADB: C0 FF    cpy #$ff
AADD: 80 FF    nop #$ff
AADF: 00       brk
AAE0: 00       brk
AAE1: FF 00 80 isb $8000, x
AAE4: 00       brk
AAE5: 40       rti
AAE6: 00       brk
AAE7: 40       rti
AAE8: 00       brk
AAE9: 00       brk
AAEA: 00       brk
AAEB: C0 FF    cpy #$ff
AAED: C0 FF    cpy #$ff
AAEF: 80 FF    nop #$ff
AAF1: 00       brk
AAF2: 00       brk
AAF3: FF 00 20 isb $2000, x
AAF6: 00       brk
AAF7: 60       rts
AAF8: 00       brk
AAF9: 40       rti
AAFA: 00       brk
AAFB: 40       rti
AAFC: 00       brk
AAFD: 00       brk
AAFE: 00       brk
AAFF: 01 FF    ora ($ff, x)
AB01: 00       brk
AB02: 00       brk
AB03: FF 00 40 isb $4000, x
AB06: 00       brk
AB07: 80 00    nop #$00
AB09: 40       rti
AB0A: 00       brk
AB0B: 00       brk
AB0C: 00       brk
AB0D: 01 FF    ora ($ff, x)
AB0F: 00       brk
AB10: 00       brk
AB11: C0 00    cpy #$00
AB13: 40       rti
AB14: 00       brk
AB15: 40       rti
AB16: 00       brk
AB17: 40       rti
AB18: 00       brk
AB19: 80 00    nop #$00
AB1B: 20 00 40 jsr $4000
AB1E: 00       brk
AB1F: A0 00    ldy #$00
AB21: 00       brk
AB22: 00       brk
AB23: 80 FF    nop #$ff
AB25: C0 FF    cpy #$ff
AB27: C0 FF    cpy #$ff
AB29: 40       rti
AB2A: 00       brk
AB2B: C0 00    cpy #$00
AB2D: 20 00 40 jsr $4000
AB30: 00       brk
AB31: 20 00 80 jsr $8000
AB34: 00       brk
AB35: 00       brk
AB36: 00       brk
AB37: 80 FF    nop #$ff
AB39: C0 FF    cpy #$ff
AB3B: C0 FF    cpy #$ff
AB3D: 00       brk
AB3E: 00       brk
AB3F: C0 00    cpy #$00
AB41: 40       rti
AB42: 00       brk
AB43: 40       rti
AB44: 00       brk
AB45: 60       rts
AB46: 00       brk
AB47: 60       rts
AB48: 00       brk
AB49: 80 00    nop #$00
AB4B: 40       rti
AB4C: 00       brk
AB4D: 40       rti
AB4E: 00       brk
AB4F: 00       brk
AB50: 00       brk
AB51: C0 FF    cpy #$ff
AB53: C0 FF    cpy #$ff
AB55: 80 FF    nop #$ff
AB57: 40       rti
AB58: 00       brk
AB59: C0 00    cpy #$00
AB5B: 40       rti
AB5C: 00       brk
AB5D: 40       rti
AB5E: 00       brk
AB5F: 60       rts
AB60: 00       brk
AB61: 20 00 00 jsr $0000
AB64: 00       brk
AB65: C0 FF    cpy #$ff
AB67: C0 FF    cpy #$ff
AB69: 80 FF    nop #$ff
AB6B: 00       brk
AB6C: 00       brk
AB6D: FF 00 40 isb $4000, x
AB70: 00       brk
AB71: 40       rti
AB72: 00       brk
AB73: 40       rti
AB74: 00       brk
AB75: 40       rti
AB76: 00       brk
AB77: 00       brk
AB78: 00       brk
AB79: 01 FF    ora ($ff, x)
AB7B: 00       brk
AB7C: 00       brk
AB7D: FF 00 40 isb $4000, x
AB80: 00       brk
AB81: 40       rti
AB82: 00       brk
AB83: 40       rti
AB84: 00       brk
AB85: 40       rti
AB86: 00       brk
AB87: 00       brk
AB88: 00       brk
AB89: 01 FF    ora ($ff, x)
AB8B: 00       brk
AB8C: 00       brk
AB8D: FF 00 40 isb $4000, x
AB90: 00       brk
AB91: 40       rti
AB92: 00       brk
AB93: 40       rti
AB94: 00       brk
AB95: 40       rti
AB96: 00       brk
AB97: 00       brk
AB98: 00       brk
AB99: 01 FF    ora ($ff, x)
AB9B: 00       brk
AB9C: 00       brk
AB9D: FF 00 40 isb $4000, x
ABA0: 00       brk
ABA1: 40       rti
ABA2: 00       brk
ABA3: 80 00    nop #$00
ABA5: 00       brk
ABA6: 00       brk
ABA7: C0 FF    cpy #$ff
ABA9: C0 FF    cpy #$ff
ABAB: 80 FF    nop #$ff
ABAD: 00       brk
ABAE: 00       brk
ABAF: C0 00    cpy #$00
ABB1: 40       rti
ABB2: 00       brk
ABB3: 60       rts
ABB4: 00       brk
ABB5: A0 00    ldy #$00
ABB7: 40       rti
ABB8: 00       brk
ABB9: 40       rti
ABBA: 00       brk
ABBB: 40       rti
ABBC: 00       brk
ABBD: 40       rti
ABBE: 00       brk
ABBF: 00       brk
ABC0: 00       brk
ABC1: 01 FF    ora ($ff, x)
ABC3: 40       rti
ABC4: 00       brk
ABC5: C0 00    cpy #$00
ABC7: 80 00    nop #$00
ABC9: E0 01    cpx #$01
ABCB: 60       rts
ABCC: FF A0 00 isb $00a0, x
ABCF: 00       brk
ABD0: 00       brk
ABD1: 40       rti
ABD2: 00       brk
ABD3: 00       brk
ABD4: 00       brk
ABD5: 00       brk
ABD6: 00       brk
ABD7: 80 00    nop #$00
ABD9: 40       rti
ABDA: FF 20 02 isb $0220, x
ABDD: A0 FF    ldy #$ff
ABDF: 60       rts
ABE0: 00       brk
ABE1: 00       brk
ABE2: 00       brk
ABE3: 40       rti
ABE4: 00       brk
ABE5: 00       brk
ABE6: 00       brk
ABE7: 20 00 00 jsr $0000
ABEA: 00       brk
ABEB: 60       rts
ABEC: 00       brk
ABED: A0 FF    ldy #$ff
ABEF: 00       brk
ABF0: 02       kil
ABF1: 00       brk
ABF2: 00       brk
ABF3: 40       rti
ABF4: 00       brk
ABF5: 00       brk
ABF6: 00       brk
ABF7: C0 FF    cpy #$ff
ABF9: 00       brk
ABFA: 00       brk
ABFB: 40       rti
ABFC: 00       brk
ABFD: 00       brk
ABFE: 02       kil
ABFF: 00       brk
AC00: 00       brk
AC01: 40       rti
AC02: 00       brk
AC03: 00       brk
AC04: 00       brk
AC05: C0 FF    cpy #$ff
AC07: C0 00    cpy #$00
AC09: 40       rti
AC0A: FF A0 FF isb $ffa0, x
AC0D: 80 00    nop #$00
AC0F: 00       brk
AC10: 00       brk
AC11: 80 FF    nop #$ff
AC13: 60       rts
AC14: 02       kil
AC15: 00       brk
AC16: 00       brk
AC17: 60       rts
AC18: FF A0 00 isb $00a0, x
AC1B: 40       rti
AC1C: 00       brk
AC1D: 00       brk
AC1E: 00       brk
AC1F: 80 00    nop #$00
AC21: 00       brk
AC22: 00       brk
AC23: 80 FF    nop #$ff
AC25: 80 00    nop #$00
AC27: E0 01    cpx #$01
AC29: 00       brk
AC2A: 00       brk
AC2B: 80 FF    nop #$ff
AC2D: 80 00    nop #$00
AC2F: 40       rti
AC30: 00       brk
AC31: 00       brk
AC32: 00       brk
AC33: C0 FF    cpy #$ff
AC35: A0 FF    ldy #$ff
AC37: 00       brk
AC38: 00       brk
AC39: A0 00    ldy #$00
AC3B: 00       brk
AC3C: 00       brk
AC3D: 60       rts
AC3E: 00       brk
AC3F: A0 FF    ldy #$ff
AC41: A0 01    ldy #$01
AC43: 60       rts
AC44: FF A0 00 isb $00a0, x
AC47: 00       brk
AC48: 00       brk
AC49: 40       rti
AC4A: 00       brk
AC4B: 00       brk
AC4C: 00       brk
AC4D: 60       rts
AC4E: 00       brk
AC4F: A0 FF    ldy #$ff
AC51: 00       brk
AC52: 00       brk
AC53: 80 FF    nop #$ff
AC55: 20 02 A0 jsr $a002
AC58: FF 60 00 isb $0060, x
AC5B: 00       brk
AC5C: 00       brk
AC5D: 40       rti
AC5E: 00       brk
AC5F: 00       brk
AC60: 00       brk
AC61: 00       brk
AC62: 00       brk
AC63: 40       rti
AC64: 00       brk
AC65: 80 00    nop #$00
AC67: 80 FF    nop #$ff
AC69: E0 01    cpx #$01
AC6B: 00       brk
AC6C: 00       brk
AC6D: 40       rti
AC6E: 00       brk
AC6F: 00       brk
AC70: 00       brk
AC71: A0 FF    ldy #$ff
AC73: 00       brk
AC74: 00       brk
AC75: 80 00    nop #$00
AC77: 80 FF    nop #$ff
AC79: 40       rti
AC7A: 02       kil
AC7B: 00       brk
AC7C: 00       brk
AC7D: 40       rti
AC7E: 00       brk
AC7F: 00       brk
AC80: 00       brk
AC81: 20 00 00 jsr $0000
AC84: 00       brk
AC85: C0 00    cpy #$00
AC87: 40       rti
AC88: FF 20 02 isb $0220, x
AC8B: 00       brk
AC8C: 00       brk
AC8D: 40       rti
AC8E: 00       brk
AC8F: 00       brk
AC90: 00       brk
AC91: 40       rti
AC92: 00       brk
AC93: 00       brk
AC94: 00       brk
AC95: C0 FF    cpy #$ff
AC97: 20 02 80 jsr $8002
AC9A: FF 80 00 isb $0080, x
AC9D: 00       brk
AC9E: 00       brk
AC9F: 40       rti
ACA0: 00       brk
ACA1: 00       brk
ACA2: 00       brk
ACA3: C0 FF    cpy #$ff
ACA5: 40       rti
ACA6: 00       brk
ACA7: 00       brk
ACA8: 00       brk
ACA9: A0 00    ldy #$00
ACAB: 60       rts
ACAC: FF 00 00 isb $0000, x
ACAF: 80 FF    nop #$ff
ACB1: 60       rts
ACB2: 02       kil
ACB3: 00       brk
ACB4: 00       brk
ACB5: 40       rti
ACB6: 00       brk
ACB7: 00       brk
ACB8: 00       brk
ACB9: 80 00    nop #$00
ACBB: 00       brk
ACBC: 00       brk
ACBD: 80 82    nop #$82
ACBF: 80 02    nop #$02
ACC1: 00       brk
ACC2: 00       brk
ACC3: 00       brk
ACC4: 00       brk
ACC5: 00       brk
ACC6: 00       brk
ACC7: 00       brk
ACC8: 00       brk
ACC9: 00       brk
ACCA: 02       kil
ACCB: 00       brk
ACCC: 83 00    sax ($00, x)
ACCE: 00       brk
ACCF: 80 81    nop #$81
ACD1: 80 01    nop #$01
ACD3: 00       brk
ACD4: 00       brk
ACD5: 00       brk
ACD6: 00       brk
ACD7: 00       brk
ACD8: 00       brk
ACD9: 00       brk
ACDA: 01 00    ora ($00, x)
ACDC: 00       brk
ACDD: 80 01    nop #$01
ACDF: 80 81    nop #$81
ACE1: 00       brk
ACE2: 00       brk
ACE3: 00       brk
ACE4: 00       brk
ACE5: 00       brk
ACE6: 00       brk
ACE7: 00       brk
ACE8: 00       brk
ACE9: 00       brk
ACEA: 81 00    sta ($00, x)
ACEC: 00       brk
ACED: 00       brk
ACEE: 01 00    ora ($00, x)
ACF0: 00       brk
ACF1: 00       brk
ACF2: 00       brk
ACF3: 00       brk
ACF4: 00       brk
ACF5: 00       brk
ACF6: 00       brk
ACF7: 00       brk
ACF8: 81 00    sta ($00, x)
ACFA: 03 00    slo ($00, x)
ACFC: 83 C0    sax ($c0, x)
ACFE: 80 00    nop #$00
AD00: 04 00    nop $00
AD02: 00       brk
AD03: CC 80 00 cpy $0080
AD06: 00       brk
AD07: 00       brk
AD08: 00       brk
AD09: 80 82    nop #$82
AD0B: 80 02    nop #$02
AD0D: 00       brk
AD0E: 01 00    ora ($00, x)
AD10: 00       brk
AD11: 00       brk
AD12: 04 00    nop $00
AD14: 00       brk
AD15: 00       brk
AD16: 84 00    sty $00
AD18: 01 00    ora ($00, x)
AD1A: 00       brk
AD1B: 00       brk
AD1C: 00       brk
AD1D: 00       brk
AD1E: 82 00    nop #$00
AD20: 02       kil
AD21: 00       brk
AD22: 00       brk
AD23: 00       brk
AD24: 00       brk
AD25: 00       brk
AD26: 81 80    sta ($80, x)
AD28: 81 00    sta ($00, x)
AD2A: 00       brk
AD2B: AA       tax
AD2C: 01 00    ora ($00, x)
AD2E: 00       brk
AD2F: 80 01    nop #$01
AD31: 80 81    nop #$81
AD33: 00       brk
AD34: 00       brk
AD35: 80 82    nop #$82
AD37: 80 02    nop #$02
AD39: 00       brk
AD3A: 00       brk
AD3B: 00       brk
AD3C: 01 00    ora ($00, x)
AD3E: 00       brk
AD3F: 80 01    nop #$01
AD41: 80 81    nop #$81
AD43: 00       brk
AD44: 00       brk
AD45: 00       brk
AD46: 84 00    sty $00
AD48: 00       brk
AD49: 80 81    nop #$81
AD4B: 80 01    nop #$01
AD4D: 00       brk
AD4E: 00       brk
AD4F: 00       brk
AD50: 00       brk
AD51: 00       brk
AD52: 00       brk
AD53: 00       brk
AD54: 00       brk
AD55: 00       brk
AD56: 01 00    ora ($00, x)
AD58: 02       kil
AD59: 00       brk
AD5A: 82 00    nop #$00
AD5C: 00       brk
AD5D: 00       brk
AD5E: 00       brk
AD5F: 00       brk
AD60: 00       brk
AD61: 00       brk
AD62: 00       brk
AD63: 55 81    eor $81, x
AD65: 00       brk
AD66: 00       brk
AD67: 00       brk
AD68: 02       kil
AD69: 00       brk
AD6A: 82 00    nop #$00
AD6C: 00       brk
AD6D: 00       brk
AD6E: 00       brk
AD6F: 00       brk
AD70: 00       brk
AD71: 00       brk
AD72: 00       brk
AD73: 80 00    nop #$00
AD75: 00       brk
AD76: 00       brk
AD77: 00       brk
AD78: 03 00    slo ($00, x)
AD7A: 83 00    sax ($00, x)
AD7C: 00       brk
AD7D: 00       brk
AD7E: 00       brk
AD7F: 00       brk
AD80: 00       brk
AD81: 00       brk
AD82: 00       brk
AD83: 00       brk
AD84: 01 00    ora ($00, x)
AD86: 00       brk
AD87: 80 80    nop #$80
AD89: 00       brk
AD8A: 00       brk
AD8B: 00       brk
AD8C: 82 00    nop #$00
AD8E: 02       kil
AD8F: 00       brk
AD90: 00       brk
AD91: 00       brk
AD92: 00       brk
AD93: 00       brk
AD94: 00       brk
AD95: 00       brk
AD96: 81 AA    sta ($aa, x)
AD98: 00       brk
AD99: 00       brk
AD9A: 00       brk
AD9B: 80 02    nop #$02
AD9D: 80 82    nop #$82
AD9F: 00       brk
ADA0: 00       brk
ADA1: 55 81    eor $81, x
ADA3: 00       brk
ADA4: 00       brk
ADA5: 00       brk
ADA6: 00       brk
ADA7: 00       brk
ADA8: 01 00    ora ($00, x)
ADAA: 00       brk
ADAB: 00       brk
ADAC: 0E 20 30 asl $3020
ADAF: 40       rti
ADB0: 46 58    lsr $58
ADB2: 6E 74 86 ror $8674
ADB5: 9A       txs
ADB6: AA       tax
ADB7: BA       tsx
ADB8: CA       dex
ADB9: DE E2 07 dec $07e2, x
ADBC: 09 08    ora #$08
ADBE: 08       php
ADBF: 03 09    slo ($09, x)
ADC1: 0B 03    anc #$03
ADC3: 09 0A    ora #$0a
ADC5: 08       php
ADC6: 08       php
ADC7: 08       php
ADC8: 0A       asl a
ADC9: 02       kil
ADCA: 08       php
ADCB: FF 00 00 isb $0000, x
ADCE: 00       brk
ADCF: 01 FF    ora ($ff, x)
ADD1: FF 00 00 isb $0000, x
ADD4: 00       brk
ADD5: 80 FF    nop #$ff
ADD7: 80 00    nop #$00
ADD9: 00       brk
ADDA: 00       brk
ADDB: 01 FF    ora ($ff, x)
ADDD: FF 00 80 isb $8000, x
ADE0: FF FF 00 isb $00ff, x
ADE3: 00       brk
ADE4: 00       brk
ADE5: 01 FF    ora ($ff, x)
ADE7: 00       brk
ADE8: 00       brk
ADE9: FF 00 00 isb $0000, x
ADEC: 00       brk
ADED: 01 FF    ora ($ff, x)
ADEF: 00       brk
ADF0: 00       brk
ADF1: FF 00 FF isb $ff00, x
ADF4: 00       brk
ADF5: 00       brk
ADF6: 00       brk
ADF7: 80 FF    nop #$ff
ADF9: 81 FF    sta ($ff, x)
ADFB: 00       brk
ADFC: 00       brk
ADFD: FF 00 FF isb $ff00, x
AE00: 00       brk
AE01: 00       brk
AE02: 00       brk
AE03: 01 FF    ora ($ff, x)
AE05: 00       brk
AE06: 00       brk
AE07: FF 00 00 isb $0000, x
AE0A: 00       brk
AE0B: 01 FF    ora ($ff, x)
AE0D: 00       brk
AE0E: 00       brk
AE0F: FF 00 FF isb $ff00, x
AE12: 00       brk
AE13: 00       brk
AE14: 00       brk
AE15: 01 FF    ora ($ff, x)
AE17: 00       brk
AE18: 00       brk
AE19: FF 00 00 isb $0000, x
AE1C: 00       brk
AE1D: 80 FF    nop #$ff
AE1F: 80 00    nop #$00
AE21: 00       brk
AE22: 00       brk
AE23: 01 FF    ora ($ff, x)
AE25: 00       brk
AE26: 00       brk
AE27: FF 00 FF isb $ff00, x
AE2A: 00       brk
AE2B: 00       brk
AE2C: 00       brk
AE2D: 80 FF    nop #$ff
AE2F: 81 FF    sta ($ff, x)
AE31: 00       brk
AE32: 00       brk
AE33: FF 00 00 isb $0000, x
AE36: 00       brk
AE37: 01 FF    ora ($ff, x)
AE39: 00       brk
AE3A: 00       brk
AE3B: FF 00 00 isb $0000, x
AE3E: 00       brk
AE3F: 01 FF    ora ($ff, x)
AE41: FF 00 01 isb $0100, x
AE44: FF FF 00 isb $00ff, x
AE47: 00       brk
AE48: 00       brk
AE49: 81 FF    sta ($ff, x)
AE4B: 80 FF    nop #$ff
AE4D: FF 00 01 isb $0100, x
AE50: FF 00 00 isb $0000, x
AE53: FF 00 00 isb $0000, x
AE56: 00       brk
AE57: 80 FF    nop #$ff
AE59: 81 FF    sta ($ff, x)
AE5B: FF 00 01 isb $0100, x
AE5E: FF 80 00 isb $0080, x
AE61: 80 FF    nop #$ff
AE63: 00       brk
AE64: 00       brk
AE65: FF 00 FF isb $ff00, x
AE68: 00       brk
AE69: 01 FF    ora ($ff, x)
AE6B: 00       brk
AE6C: FF 00 02 isb $0200, x
AE6F: 00       brk
AE70: FF 00 FF isb $ff00, x
AE73: 80 01    nop #$01
AE75: 80 00    nop #$00
AE77: 80 00    nop #$00
AE79: 80 01    nop #$01
AE7B: 00       brk
AE7C: FF 00 03 isb $0300, x
AE7F: 80 00    nop #$00
AE81: 00       brk
AE82: FF 80 01 isb $0180, x
AE85: 00       brk
AE86: 01 00    ora ($00, x)
AE88: 01 00    ora ($00, x)
AE8A: 01 80    ora ($80, x)
AE8C: 01 00    ora ($00, x)
AE8E: FF 00 02 isb $0200, x
AE91: 00       brk
AE92: FF 00 00 isb $0000, x
AE95: 00       brk
AE96: 01 00    ora ($00, x)
AE98: 00       brk
AE99: 80 00    nop #$00
AE9B: 00       brk
AE9C: 03 00    slo ($00, x)
AE9E: 01 00    ora ($00, x)
AEA0: 00       brk
AEA1: 00       brk
AEA2: 01 00    ora ($00, x)
AEA4: 00       brk
AEA5: 80 03    nop #$03
AEA7: 00       brk
AEA8: FF 00 02 isb $0200, x
AEAB: 00       brk
AEAC: FF 00 01 isb $0100, x
AEAF: 00       brk
AEB0: 01 00    ora ($00, x)
AEB2: 00       brk
AEB3: 00       brk
AEB4: 01 00    ora ($00, x)
AEB6: 00       brk
AEB7: 80 02    nop #$02
AEB9: 00       brk
AEBA: FF 80 01 isb $0180, x
AEBD: 80 00    nop #$00
AEBF: 00       brk
AEC0: 00       brk
AEC1: 00       brk
AEC2: 01 00    ora ($00, x)
AEC4: 00       brk
AEC5: 00       brk
AEC6: 01 00    ora ($00, x)
AEC8: 01 00    ora ($00, x)
AECA: 00       brk
AECB: 80 01    nop #$01
AECD: 80 FF    nop #$ff
AECF: 00       brk
AED0: 00       brk
AED1: 80 01    nop #$01
AED3: 00       brk
AED4: 00       brk
AED5: 80 01    nop #$01
AED7: 00       brk
AED8: 00       brk
AED9: 80 00    nop #$00
AEDB: 00       brk
AEDC: 00       brk
AEDD: 00       brk
AEDE: 01 00    ora ($00, x)
AEE0: 00       brk
AEE1: 00       brk
AEE2: 01 80    ora ($80, x)
AEE4: 00       brk
AEE5: 00       brk
AEE6: 01 80    ora ($80, x)
AEE8: 00       brk
AEE9: 80 FF    nop #$ff
AEEB: 00       brk
AEEC: 00       brk
AEED: 80 00    nop #$00
AEEF: 00       brk
AEF0: 01 80    ora ($80, x)
AEF2: 00       brk
AEF3: 00       brk
AEF4: FF 80 01 isb $0180, x
AEF7: 80 00    nop #$00
AEF9: 00       brk
AEFA: 00       brk
AEFB: 00       brk
AEFC: 01 80    ora ($80, x)
AEFE: 00       brk
AEFF: 80 00    nop #$00
AF01: 80 00    nop #$00
AF03: 80 01    nop #$01
AF05: 00       brk
AF06: FF 00 01 isb $0100, x
AF09: 00       brk
AF0A: 01 00    ora ($00, x)
AF0C: 81 00    sta ($00, x)
AF0E: 00       brk
AF0F: 00       brk
AF10: 81 00    sta ($00, x)
AF12: 81 00    sta ($00, x)
AF14: 00       brk
AF15: 00       brk
AF16: 01 00    ora ($00, x)
AF18: 01 00    ora ($00, x)
AF1A: 00       brk
AF1B: 00       brk
AF1C: 81 00    sta ($00, x)
AF1E: 01 00    ora ($00, x)
AF20: 01 00    ora ($00, x)
AF22: 81 00    sta ($00, x)
AF24: 00       brk
AF25: 00       brk
AF26: 01 00    ora ($00, x)
AF28: 00       brk
AF29: 00       brk
AF2A: 01 00    ora ($00, x)
AF2C: 00       brk
AF2D: 00       brk
AF2E: 81 00    sta ($00, x)
AF30: 01 00    ora ($00, x)
AF32: 81 00    sta ($00, x)
AF34: 00       brk
AF35: 00       brk
AF36: 00       brk
AF37: 00       brk
AF38: 00       brk
AF39: 00       brk
AF3A: 01 00    ora ($00, x)
AF3C: 00       brk
AF3D: 00       brk
AF3E: 01 00    ora ($00, x)
AF40: 00       brk
AF41: 00       brk
AF42: 00       brk
AF43: 00       brk
AF44: 00       brk
AF45: 00       brk
AF46: 00       brk
AF47: 00       brk
AF48: 81 00    sta ($00, x)
AF4A: 01 00    ora ($00, x)
AF4C: 81 00    sta ($00, x)
AF4E: 01 00    ora ($00, x)
AF50: 01 00    ora ($00, x)
AF52: 00       brk
AF53: 00       brk
AF54: 00       brk
AF55: 00       brk
AF56: 00       brk
AF57: 00       brk
AF58: 00       brk
AF59: 00       brk
AF5A: 81 00    sta ($00, x)
AF5C: 01 00    ora ($00, x)
AF5E: 01 00    ora ($00, x)
AF60: 00       brk
AF61: 00       brk
AF62: 00       brk
AF63: 00       brk
AF64: 00       brk
AF65: 00       brk
AF66: 00       brk
AF67: 00       brk
AF68: 01 00    ora ($00, x)
AF6A: 00       brk
AF6B: 00       brk
AF6C: 00       brk
AF6D: 00       brk
AF6E: 81 00    sta ($00, x)
AF70: 00       brk
AF71: 00       brk
AF72: 00       brk
AF73: 00       brk
AF74: 00       brk
AF75: 00       brk
AF76: 00       brk
AF77: 00       brk
AF78: 00       brk
AF79: 00       brk
AF7A: 00       brk
AF7B: 00       brk
AF7C: 00       brk
AF7D: 00       brk
AF7E: 00       brk
AF7F: 00       brk
AF80: 00       brk
AF81: 00       brk
AF82: 01 00    ora ($00, x)
AF84: 81 00    sta ($00, x)
AF86: 01 00    ora ($00, x)
AF88: 00       brk
AF89: 00       brk
AF8A: 81 00    sta ($00, x)
AF8C: 00       brk
AF8D: 00       brk
AF8E: 00       brk
AF8F: 00       brk
AF90: 01 00    ora ($00, x)
AF92: 00       brk
AF93: 00       brk
AF94: 81 00    sta ($00, x)
AF96: 00       brk
AF97: 00       brk
AF98: 01 00    ora ($00, x)
AF9A: 00       brk
AF9B: 00       brk
AF9C: 01 00    ora ($00, x)
AF9E: 81 00    sta ($00, x)
AFA0: 01 00    ora ($00, x)
AFA2: 01 00    ora ($00, x)
AFA4: 00       brk
AFA5: 00       brk
AFA6: 81 00    sta ($00, x)
AFA8: 01 00    ora ($00, x)
AFAA: 01 00    ora ($00, x)
AFAC: 00       brk
AFAD: 00       brk
AFAE: 00       brk
AFAF: 06 16    asl $16
AFB1: 28       plp
AFB2: 34 46    nop $46, x
AFB4: 5E 76 90 lsr $9076, x
AFB7: 9C 00 00 shy $0000, x
AFBA: 00       brk
AFBB: 00       brk
AFBC: 00       brk
AFBD: 00       brk
AFBE: 03 08    slo ($08, x)
AFC0: 09 06    ora #$06
AFC2: 09 0C    ora #$0c
AFC4: 0C 0D 06 nop $060d
AFC7: 02       kil
AFC8: 00       brk
AFC9: 00       brk
AFCA: 00       brk
AFCB: FF 00 FF isb $ff00, x
AFCE: 00       brk
AFCF: FF 00 FF isb $ff00, x
AFD2: 00       brk
AFD3: FF 00 FF isb $ff00, x
AFD6: 00       brk
AFD7: FF 00 FF isb $ff00, x
AFDA: 00       brk
AFDB: FF 00 FF isb $ff00, x
AFDE: 00       brk
AFDF: FF 00 FF isb $ff00, x
AFE2: 00       brk
AFE3: FF 00 FF isb $ff00, x
AFE6: 00       brk
AFE7: FF 00 FF isb $ff00, x
AFEA: 00       brk
AFEB: 00       brk
AFEC: 00       brk
AFED: 00       brk
AFEE: FF 00 00 isb $0000, x
AFF1: 00       brk
AFF2: 01 00    ora ($00, x)
AFF4: 00       brk
AFF5: 00       brk
AFF6: 00       brk
AFF7: 00       brk
AFF8: FF 00 FF isb $ff00, x
AFFB: 00       brk
AFFC: 00       brk
AFFD: 00       brk
AFFE: 01 00    ora ($00, x)
B000: 00       brk
B001: 00       brk
B002: 01 00    ora ($00, x)
B004: FF 00 00 isb $0000, x
B007: 00       brk
B008: 01 00    ora ($00, x)
B00A: 00       brk
B00B: 00       brk
B00C: 00       brk
B00D: 00       brk
B00E: 81 00    sta ($00, x)
B010: 00       brk
B011: 00       brk
B012: 01 00    ora ($00, x)
B014: 00       brk
B015: 00       brk
B016: 00       brk
B017: 00       brk
B018: 81 00    sta ($00, x)
B01A: 81 00    sta ($00, x)
B01C: 00       brk
B01D: 00       brk
B01E: 01 00    ora ($00, x)
B020: 00       brk
B021: 00       brk
B022: 01 00    ora ($00, x)
B024: 81 00    sta ($00, x)
B026: 00       brk
B027: 00       brk
B028: 01 00    ora ($00, x)
B02A: 00       brk
B02B: 01 01    ora ($01, x)
B02D: 01 01    ora ($01, x)
B02F: 01 01    ora ($01, x)
B031: 01 01    ora ($01, x)
B033: 01 01    ora ($01, x)
B035: 01 01    ora ($01, x)
B037: 01 01    ora ($01, x)
B039: 01 01    ora ($01, x)
B03B: 00       brk
B03C: 02       kil
B03D: 04 06    nop $06
B03F: 08       php
B040: 0A       asl a
B041: 0C 0E 10 nop $100e
B044: 12       kil
B045: 14 16    nop $16, x
B047: 18       clc
B048: 1A       nop
B049: 1C 1E FF nop $ff1e, x
B04C: 00       brk
B04D: FF 00 01 isb $0100, x
B050: FF FF 00 isb $00ff, x
B053: 00       brk
B054: 00       brk
B055: 01 FF    ora ($ff, x)
B057: FF 00 01 isb $0100, x
B05A: FF FF 00 isb $00ff, x
B05D: 01 FF    ora ($ff, x)
B05F: FF 00 FF isb $ff00, x
B062: 00       brk
B063: 00       brk
B064: 00       brk
B065: 01 FF    ora ($ff, x)
B067: FF 00 FF isb $ff00, x
B06A: 00       brk
B06B: 01 FF    ora ($ff, x)
B06D: 00       brk
B06E: 00       brk
B06F: FF 00 FF isb $ff00, x
B072: 00       brk
B073: FF 00 01 isb $0100, x
B076: FF FF 00 isb $00ff, x
B079: 00       brk
B07A: 00       brk
B07B: 01 FF    ora ($ff, x)
B07D: FF 00 01 isb $0100, x
B080: FF FF 00 isb $00ff, x
B083: 01 FF    ora ($ff, x)
B085: FF 00 FF isb $ff00, x
B088: 00       brk
B089: FF 00 01 isb $0100, x
B08C: FF FF 00 isb $00ff, x
B08F: FF 00 FF isb $ff00, x
B092: 00       brk
B093: 01 FF    ora ($ff, x)
B095: FF 00 01 isb $0100, x
B098: FF FF 00 isb $00ff, x
B09B: FF 00 00 isb $0000, x
B09E: 01 00    ora ($00, x)
B0A0: 00       brk
B0A1: 00       brk
B0A2: 00       brk
B0A3: 00       brk
B0A4: 01 00    ora ($00, x)
B0A6: 02       kil
B0A7: 00       brk
B0A8: FF 00 00 isb $0000, x
B0AB: 00       brk
B0AC: 01 00    ora ($00, x)
B0AE: 01 00    ora ($00, x)
B0B0: 01 00    ora ($00, x)
B0B2: 00       brk
B0B3: 00       brk
B0B4: 00       brk
B0B5: 00       brk
B0B6: 01 00    ora ($00, x)
B0B8: 01 00    ora ($00, x)
B0BA: 01 00    ora ($00, x)
B0BC: 00       brk
B0BD: 00       brk
B0BE: 01 00    ora ($00, x)
B0C0: 02       kil
B0C1: 00       brk
B0C2: FF 00 FF isb $ff00, x
B0C5: 00       brk
B0C6: 00       brk
B0C7: 00       brk
B0C8: 00       brk
B0C9: 00       brk
B0CA: 01 00    ora ($00, x)
B0CC: 01 00    ora ($00, x)
B0CE: 00       brk
B0CF: 00       brk
B0D0: 01 00    ora ($00, x)
B0D2: 00       brk
B0D3: 00       brk
B0D4: 01 00    ora ($00, x)
B0D6: 00       brk
B0D7: 00       brk
B0D8: 01 00    ora ($00, x)
B0DA: 00       brk
B0DB: 00       brk
B0DC: 00       brk
B0DD: 00       brk
B0DE: 01 00    ora ($00, x)
B0E0: 00       brk
B0E1: 00       brk
B0E2: 00       brk
B0E3: 00       brk
B0E4: 00       brk
B0E5: 00       brk
B0E6: 00       brk
B0E7: 00       brk
B0E8: 01 00    ora ($00, x)
B0EA: 00       brk
B0EB: 00       brk
B0EC: 00       brk
B0ED: 00       brk
B0EE: 00       brk
B0EF: 00       brk
B0F0: 01 00    ora ($00, x)
B0F2: 00       brk
B0F3: 00       brk
B0F4: 00       brk
B0F5: 00       brk
B0F6: 01 00    ora ($00, x)
B0F8: 81 00    sta ($00, x)
B0FA: 81 00    sta ($00, x)
B0FC: 00       brk
B0FD: 00       brk
B0FE: 00       brk
B0FF: 00       brk
B100: 01 00    ora ($00, x)
B102: 01 00    ora ($00, x)
B104: 00       brk
B105: 00       brk
B106: 00       brk
B107: 00       brk
B108: 00       brk
B109: 00       brk
B10A: 01 00    ora ($00, x)
B10C: 01 00    ora ($00, x)
B10E: 00       brk
B10F: 00       brk
B110: 01 00    ora ($00, x)
B112: 81 00    sta ($00, x)
B114: 81 00    sta ($00, x)
B116: 81 00    sta ($00, x)
B118: 00       brk
B119: 00       brk
B11A: 00       brk
B11B: 00       brk
B11C: 01 00    ora ($00, x)
B11E: 81 00    sta ($00, x)
B120: 00       brk
B121: 00       brk
B122: 01 00    ora ($00, x)
B124: 81 00    sta ($00, x)
B126: 01 00    ora ($00, x)
B128: 00       brk
B129: 00       brk
B12A: 01 00    ora ($00, x)
B12C: 00       brk
B12D: 00       brk
B12E: 00       brk
B12F: 00       brk
B130: 01 00    ora ($00, x)
B132: 00       brk
B133: 00       brk
B134: 00       brk
B135: 00       brk
B136: 00       brk
B137: 00       brk
B138: 00       brk
B139: 00       brk
B13A: 01 00    ora ($00, x)
B13C: 00       brk
B13D: 00       brk
B13E: 00       brk
B13F: 00       brk
B140: 00       brk
B141: 01 05    ora ($05, x)
B143: 04 01    nop $01
B145: 04 04    nop $04
B147: 01 05    ora ($05, x)
B149: 04 01    nop $01
B14B: 01 03    ora ($03, x)
B14D: 01 04    ora ($04, x)
B14F: 01 01    ora ($01, x)
B151: 00       brk
B152: 02       kil
B153: 0C 14 16 nop $1614
B156: 1E 26 28 asl $2826, x
B159: 32       kil
B15A: 3A       nop
B15B: 3C 3E 44 nop $443e, x
B15E: 46 4E    lsr $4e
B160: 50 FF    bvc $b161
B162: 00       brk
B163: FF 00 01 isb $0100, x
B166: FF FF 00 isb $00ff, x
B169: 80 00    nop #$00
B16B: 80 00    nop #$00
B16D: FF 00 FF isb $ff00, x
B170: 00       brk
B171: 00       brk
B172: 00       brk
B173: 01 FF    ora ($ff, x)
B175: FF 00 FF isb $ff00, x
B178: 00       brk
B179: 01 FF    ora ($ff, x)
B17B: FF 00 01 isb $0100, x
B17E: FF FF 00 isb $00ff, x
B181: FF 00 FF isb $ff00, x
B184: 00       brk
B185: 00       brk
B186: 00       brk
B187: 01 FF    ora ($ff, x)
B189: FF 00 01 isb $0100, x
B18C: FF FF 00 isb $00ff, x
B18F: FF 00 00 isb $0000, x
B192: 00       brk
B193: 01 FF    ora ($ff, x)
B195: FF 00 60 isb $6000, x
B198: FF A0 00 isb $00a0, x
B19B: 01 FF    ora ($ff, x)
B19D: FF 00 01 isb $0100, x
B1A0: FF 80 00 isb $0080, x
B1A3: 80 00    nop #$00
B1A5: FF 00 00 isb $0000, x
B1A8: 00       brk
B1A9: 01 FF    ora ($ff, x)
B1AB: 00       brk
B1AC: 00       brk
B1AD: FF 00 00 isb $0000, x
B1B0: 00       brk
B1B1: 01 FF    ora ($ff, x)
B1B3: 00       brk
B1B4: 00       brk
B1B5: FF 00 FF isb $ff00, x
B1B8: 00       brk
B1B9: 00       brk
B1BA: 00       brk
B1BB: 01 FF    ora ($ff, x)
B1BD: 00       brk
B1BE: 00       brk
B1BF: FF 00 00 isb $0000, x
B1C2: 00       brk
B1C3: 01 FF    ora ($ff, x)
B1C5: 00       brk
B1C6: 00       brk
B1C7: FF 00 FF isb $ff00, x
B1CA: 00       brk
B1CB: 01 FF    ora ($ff, x)
B1CD: 60       rts
B1CE: 00       brk
B1CF: A0 FF    ldy #$ff
B1D1: 00       brk
B1D2: 00       brk
B1D3: 80 00    nop #$00
B1D5: 80 00    nop #$00
B1D7: A0 FF    ldy #$ff
B1D9: 60       rts
B1DA: 00       brk
B1DB: 00       brk
B1DC: 00       brk
B1DD: 01 FF    ora ($ff, x)
B1DF: FF 00 01 isb $0100, x
B1E2: FF FF 00 isb $00ff, x
B1E5: 01 FF    ora ($ff, x)
B1E7: FF 00 80 isb $8000, x
B1EA: 00       brk
B1EB: 80 00    nop #$00
B1ED: 00       brk
B1EE: 00       brk
B1EF: C0 01    cpy #$01
B1F1: 00       brk
B1F2: 00       brk
B1F3: 00       brk
B1F4: 01 00    ora ($00, x)
B1F6: 00       brk
B1F7: C0 00    cpy #$00
B1F9: 00       brk
B1FA: 02       kil
B1FB: 00       brk
B1FC: 00       brk
B1FD: 80 FD    nop #$fd
B1FF: 00       brk
B200: 00       brk
B201: 40       rti
B202: FE 00 00 inc $0000, x
B205: C0 01    cpy #$01
B207: C0 01    cpy #$01
B209: C0 00    cpy #$00
B20B: 40       rti
B20C: FE 00 00 inc $0000, x
B20F: 00       brk
B210: 01 C0    ora ($c0, x)
B212: 00       brk
B213: 00       brk
B214: 01 00    ora ($00, x)
B216: 00       brk
B217: 00       brk
B218: 01 00    ora ($00, x)
B21A: 00       brk
B21B: 00       brk
B21C: 00       brk
B21D: C0 00    cpy #$00
B21F: 00       brk
B220: 00       brk
B221: 60       rts
B222: 00       brk
B223: 00       brk
B224: 00       brk
B225: A0 00    ldy #$00
B227: 00       brk
B228: 01 00    ora ($00, x)
B22A: 00       brk
B22B: C0 01    cpy #$01
B22D: 80 00    nop #$00
B22F: 00       brk
B230: 00       brk
B231: 00       brk
B232: 00       brk
B233: C0 00    cpy #$00
B235: 00       brk
B236: 00       brk
B237: 60       rts
B238: 00       brk
B239: 00       brk
B23A: 00       brk
B23B: A0 01    ldy #$01
B23D: 00       brk
B23E: FF 40 03 isb $0340, x
B241: 40       rti
B242: FE 00 00 inc $0000, x
B245: C0 00    cpy #$00
B247: 00       brk
B248: 00       brk
B249: 60       rts
B24A: 00       brk
B24B: 00       brk
B24C: 00       brk
B24D: 80 00    nop #$00
B24F: 20 01 80 jsr $8001
B252: 00       brk
B253: 00       brk
B254: FF 00 00 isb $0000, x
B257: C0 00    cpy #$00
B259: 00       brk
B25A: 00       brk
B25B: 60       rts
B25C: 00       brk
B25D: 80 00    nop #$00
B25F: 00       brk
B260: 00       brk
B261: 80 FF    nop #$ff
B263: A0 FF    ldy #$ff
B265: 00       brk
B266: 00       brk
B267: 80 01    nop #$01
B269: 00       brk
B26A: 00       brk
B26B: 00       brk
B26C: 00       brk
B26D: C0 00    cpy #$00
B26F: 00       brk
B270: 00       brk
B271: 80 01    nop #$01
B273: 00       brk
B274: 00       brk
B275: 00       brk
B276: 00       brk
B277: 80 FF    nop #$ff
B279: 00       brk
B27A: 00       brk
B27B: C0 01    cpy #$01
B27D: 00       brk
B27E: 00       brk
B27F: 00       brk
B280: 01 00    ora ($00, x)
B282: 00       brk
B283: 80 01    nop #$01
B285: 00       brk
B286: 02       kil
B287: 00       brk
B288: 00       brk
B289: 00       brk
B28A: 00       brk
B28B: 00       brk
B28C: 00       brk
B28D: C0 81    cpy #$81
B28F: 00       brk
B290: 00       brk
B291: 00       brk
B292: 00       brk
B293: C0 01    cpy #$01
B295: C0 00    cpy #$00
B297: C0 81    cpy #$81
B299: 00       brk
B29A: 00       brk
B29B: 00       brk
B29C: 01 00    ora ($00, x)
B29E: 81 00    sta ($00, x)
B2A0: 01 00    ora ($00, x)
B2A2: 00       brk
B2A3: 00       brk
B2A4: 01 00    ora ($00, x)
B2A6: 00       brk
B2A7: 00       brk
B2A8: 00       brk
B2A9: 00       brk
B2AA: 00       brk
B2AB: 00       brk
B2AC: 00       brk
B2AD: 00       brk
B2AE: 00       brk
B2AF: 00       brk
B2B0: 00       brk
B2B1: 00       brk
B2B2: 01 00    ora ($00, x)
B2B4: 81 00    sta ($00, x)
B2B6: 00       brk
B2B7: C0 01    cpy #$01
B2B9: 00       brk
B2BA: 01 00    ora ($00, x)
B2BC: 00       brk
B2BD: 00       brk
B2BE: 00       brk
B2BF: 00       brk
B2C0: 00       brk
B2C1: 00       brk
B2C2: 00       brk
B2C3: 00       brk
B2C4: 00       brk
B2C5: 00       brk
B2C6: 00       brk
B2C7: 00       brk
B2C8: 00       brk
B2C9: 00       brk
B2CA: 81 00    sta ($00, x)
B2CC: 01 C0    ora ($c0, x)
B2CE: 81 00    sta ($00, x)
B2D0: 00       brk
B2D1: 00       brk
B2D2: 00       brk
B2D3: 00       brk
B2D4: 00       brk
B2D5: 00       brk
B2D6: 00       brk
B2D7: 00       brk
B2D8: 00       brk
B2D9: 00       brk
B2DA: 00       brk
B2DB: 20 01 00 jsr $0001
B2DE: 00       brk
B2DF: 00       brk
B2E0: 81 00    sta ($00, x)
B2E2: 00       brk
B2E3: 00       brk
B2E4: 00       brk
B2E5: 00       brk
B2E6: 00       brk
B2E7: 00       brk
B2E8: 01 00    ora ($00, x)
B2EA: 00       brk
B2EB: 00       brk
B2EC: 00       brk
B2ED: 00       brk
B2EE: 81 00    sta ($00, x)
B2F0: 81 00    sta ($00, x)
B2F2: 00       brk
B2F3: 00       brk
B2F4: 00       brk
B2F5: 00       brk
B2F6: 00       brk
B2F7: 00       brk
B2F8: 00       brk
B2F9: 00       brk
B2FA: 00       brk
B2FB: 00       brk
B2FC: 00       brk
B2FD: 80 01    nop #$01
B2FF: 00       brk
B300: 00       brk
B301: 00       brk
B302: 00       brk
B303: 00       brk
B304: 81 01    sta ($01, x)
B306: 03 02    slo ($02, x)
B308: 01 04    ora ($04, x)
B30A: 04 01    nop $01
B30C: 01 06    ora ($06, x)
B30E: 0B 09    anc #$09
B310: 09 0B    ora #$0b
B312: 04 01    nop $01
B314: 02       kil
B315: 00       brk
B316: 02       kil
B317: 08       php
B318: 0C 0E 16 nop $160e
B31B: 1E 20 22 asl $2220, x
B31E: 2E 44 56 rol $5644
B321: 68       pla
B322: 7E 86 88 ror $8886, x
B325: FF 00 01 isb $0100, x
B328: FF FF 00 isb $00ff, x
B32B: 01 FF    ora ($ff, x)
B32D: FF 00 FF isb $ff00, x
B330: 00       brk
B331: 01 FF    ora ($ff, x)
B333: FF 00 01 isb $0100, x
B336: FF FF 00 isb $00ff, x
B339: FF 00 00 isb $0000, x
B33C: 00       brk
B33D: 01 FF    ora ($ff, x)
B33F: FF 00 00 isb $0000, x
B342: 00       brk
B343: 01 FF    ora ($ff, x)
B345: FF 00 01 isb $0100, x
B348: FF 00 00 isb $0000, x
B34B: FF 00 01 isb $0100, x
B34E: FF FF 00 isb $00ff, x
B351: 01 FF    ora ($ff, x)
B353: FF 00 01 isb $0100, x
B356: FF FF 00 isb $00ff, x
B359: 00       brk
B35A: 00       brk
B35B: 01 FF    ora ($ff, x)
B35D: FF 00 FF isb $ff00, x
B360: 00       brk
B361: 00       brk
B362: 00       brk
B363: 01 FF    ora ($ff, x)
B365: 00       brk
B366: 00       brk
B367: FF 00 00 isb $0000, x
B36A: 00       brk
B36B: 01 FF    ora ($ff, x)
B36D: 00       brk
B36E: 00       brk
B36F: FF 00 FF isb $ff00, x
B372: 00       brk
B373: 00       brk
B374: 00       brk
B375: 01 FF    ora ($ff, x)
B377: 00       brk
B378: 00       brk
B379: FF 00 00 isb $0000, x
B37C: 00       brk
B37D: 01 FF    ora ($ff, x)
B37F: FF 00 00 isb $0000, x
B382: 00       brk
B383: 01 FF    ora ($ff, x)
B385: FF 00 01 isb $0100, x
B388: FF FF 00 isb $00ff, x
B38B: 01 FF    ora ($ff, x)
B38D: 00       brk
B38E: 00       brk
B38F: FF 00 FF isb $ff00, x
B392: 00       brk
B393: 01 FF    ora ($ff, x)
B395: FF 00 01 isb $0100, x
B398: FF FF 00 isb $00ff, x
B39B: 01 FF    ora ($ff, x)
B39D: FF 00 01 isb $0100, x
B3A0: FF FF 00 isb $00ff, x
B3A3: 01 FF    ora ($ff, x)
B3A5: 00       brk
B3A6: FF 00 01 isb $0100, x
B3A9: 00       brk
B3AA: 01 00    ora ($00, x)
B3AC: 00       brk
B3AD: 00       brk
B3AE: 01 00    ora ($00, x)
B3B0: FF 00 04 isb $0400, x
B3B3: 00       brk
B3B4: 01 00    ora ($00, x)
B3B6: 00       brk
B3B7: 00       brk
B3B8: 01 00    ora ($00, x)
B3BA: 00       brk
B3BB: 00       brk
B3BC: 01 00    ora ($00, x)
B3BE: 01 00    ora ($00, x)
B3C0: 00       brk
B3C1: 00       brk
B3C2: 03 00    slo ($00, x)
B3C4: 01 00    ora ($00, x)
B3C6: 01 00    ora ($00, x)
B3C8: 00       brk
B3C9: 00       brk
B3CA: 01 00    ora ($00, x)
B3CC: 00       brk
B3CD: 00       brk
B3CE: 03 00    slo ($00, x)
B3D0: 00       brk
B3D1: FF 00 FF isb $ff00, x
B3D4: 00       brk
B3D5: FF 00 00 isb $0000, x
B3D8: 01 00    ora ($00, x)
B3DA: 02       kil
B3DB: 00       brk
B3DC: 01 00    ora ($00, x)
B3DE: 01 00    ora ($00, x)
B3E0: FF 00 01 isb $0100, x
B3E3: 00       brk
B3E4: 00       brk
B3E5: 00       brk
B3E6: 01 00    ora ($00, x)
B3E8: 01 00    ora ($00, x)
B3EA: 02       kil
B3EB: 00       brk
B3EC: FF 00 02 isb $0200, x
B3EF: 00       brk
B3F0: 01 00    ora ($00, x)
B3F2: 00       brk
B3F3: 00       brk
B3F4: 01 00    ora ($00, x)
B3F6: 00       brk
B3F7: 00       brk
B3F8: 02       kil
B3F9: 00       brk
B3FA: 01 00    ora ($00, x)
B3FC: 01 00    ora ($00, x)
B3FE: 00       brk
B3FF: 00       brk
B400: 00       brk
B401: 00       brk
B402: 01 00    ora ($00, x)
B404: 00       brk
B405: 00       brk
B406: 01 00    ora ($00, x)
B408: 01 00    ora ($00, x)
B40A: 01 00    ora ($00, x)
B40C: 00       brk
B40D: 00       brk
B40E: 01 00    ora ($00, x)
B410: 00       brk
B411: 00       brk
B412: 01 00    ora ($00, x)
B414: 00       brk
B415: 00       brk
B416: 01 00    ora ($00, x)
B418: 00       brk
B419: 00       brk
B41A: 01 00    ora ($00, x)
B41C: 00       brk
B41D: 00       brk
B41E: 01 00    ora ($00, x)
B420: 01 00    ora ($00, x)
B422: 01 00    ora ($00, x)
B424: 01 00    ora ($00, x)
B426: 81 00    sta ($00, x)
B428: 01 00    ora ($00, x)
B42A: 01 00    ora ($00, x)
B42C: 00       brk
B42D: 00       brk
B42E: 01 00    ora ($00, x)
B430: 81 00    sta ($00, x)
B432: 01 00    ora ($00, x)
B434: 01 00    ora ($00, x)
B436: 00       brk
B437: 00       brk
B438: 01 00    ora ($00, x)
B43A: 00       brk
B43B: 00       brk
B43C: 00       brk
B43D: 00       brk
B43E: 01 00    ora ($00, x)
B440: 00       brk
B441: 00       brk
B442: 00       brk
B443: 00       brk
B444: 01 00    ora ($00, x)
B446: 01 00    ora ($00, x)
B448: 00       brk
B449: 00       brk
B44A: 00       brk
B44B: 00       brk
B44C: 00       brk
B44D: 00       brk
B44E: 00       brk
B44F: 00       brk
B450: 00       brk
B451: 00       brk
B452: 01 00    ora ($00, x)
B454: 01 00    ora ($00, x)
B456: 01 00    ora ($00, x)
B458: 01 00    ora ($00, x)
B45A: 81 00    sta ($00, x)
B45C: 01 00    ora ($00, x)
B45E: 01 00    ora ($00, x)
B460: 81 00    sta ($00, x)
B462: 00       brk
B463: 00       brk
B464: 00       brk
B465: 00       brk
B466: 00       brk
B467: 00       brk
B468: 01 00    ora ($00, x)
B46A: 81 00    sta ($00, x)
B46C: 81 00    sta ($00, x)
B46E: 01 00    ora ($00, x)
B470: 01 00    ora ($00, x)
B472: 00       brk
B473: 00       brk
B474: 00       brk
B475: 00       brk
B476: 00       brk
B477: 00       brk
B478: 00       brk
B479: 00       brk
B47A: 01 00    ora ($00, x)
B47C: 81 00    sta ($00, x)
B47E: 00       brk
B47F: 00       brk
B480: 00       brk
B481: 00       brk
B482: 00       brk
B483: 00       brk
B484: 00       brk
B485: 00       brk
B486: 00       brk
B487: 00       brk
B488: 01 00    ora ($00, x)
B48A: 01 00    ora ($00, x)
B48C: 00       brk
B48D: 00       brk
B48E: 00       brk
B48F: 00       brk
B490: 00       brk
B491: 00       brk
B492: 01 00    ora ($00, x)
B494: 81 00    sta ($00, x)
B496: 01 00    ora ($00, x)
B498: 00       brk
B499: 00       brk
B49A: 00       brk
B49B: 00       brk
B49C: 00       brk
B49D: 00       brk
B49E: 01 00    ora ($00, x)
B4A0: 01 00    ora ($00, x)
B4A2: 01 00    ora ($00, x)
B4A4: 01 00    ora ($00, x)
B4A6: 00       brk
B4A7: 00       brk
B4A8: 05 05    ora $05
B4AA: 06 09    asl $09
B4AC: 04 09    nop $09
B4AE: 07 09    slo $09
B4B0: 08       php
B4B1: 02       kil
B4B2: 00       brk
B4B3: 00       brk
B4B4: 00       brk
B4B5: 00       brk
B4B6: 00       brk
B4B7: 00       brk
B4B8: 00       brk
B4B9: 0A       asl a
B4BA: 14 20    nop $20, x
B4BC: 32       kil
B4BD: 3A       nop
B4BE: 4C 5A 6C jmp $6c5a
B4C1: 7C 00 00 nop $0000, x
B4C4: 00       brk
B4C5: FF 00 FF isb $ff00, x
B4C8: 00       brk
B4C9: 01 FF    ora ($ff, x)
B4CB: FF 00 01 isb $0100, x
B4CE: FF FF 00 isb $00ff, x
B4D1: 00       brk
B4D2: 00       brk
B4D3: 80 FF    nop #$ff
B4D5: 80 FF    nop #$ff
B4D7: 00       brk
B4D8: 00       brk
B4D9: FF 00 00 isb $0000, x
B4DC: 00       brk
B4DD: 80 FF    nop #$ff
B4DF: 80 FF    nop #$ff
B4E1: FF 00 FF isb $ff00, x
B4E4: 00       brk
B4E5: 00       brk
B4E6: 00       brk
B4E7: 01 FF    ora ($ff, x)
B4E9: 00       brk
B4EA: 00       brk
B4EB: FF 00 00 isb $0000, x
B4EE: 00       brk
B4EF: 01 FF    ora ($ff, x)
B4F1: 00       brk
B4F2: 00       brk
B4F3: FF 00 FF isb $ff00, x
B4F6: 00       brk
B4F7: 01 FF    ora ($ff, x)
B4F9: FF 00 C0 isb $c000, x
B4FC: FF 40 FF isb $ff40, x
B4FF: 00       brk
B500: 00       brk
B501: FF 00 00 isb $0000, x
B504: 00       brk
B505: 01 FF    ora ($ff, x)
B507: FF 00 00 isb $0000, x
B50A: 00       brk
B50B: 01 FF    ora ($ff, x)
B50D: FF 00 01 isb $0100, x
B510: FF 00 00 isb $0000, x
B513: FF 00 FF isb $ff00, x
B516: 00       brk
B517: 00       brk
B518: 00       brk
B519: 01 FF    ora ($ff, x)
B51B: 00       brk
B51C: 00       brk
B51D: FF 00 FF isb $ff00, x
B520: 00       brk
B521: 00       brk
B522: 00       brk
B523: 80 FF    nop #$ff
B525: 80 FF    nop #$ff
B527: 00       brk
B528: 00       brk
B529: FF 00 40 isb $4000, x
B52C: 00       brk
B52D: C0 00    cpy #$00
B52F: 00       brk
B530: 00       brk
B531: 40       rti
B532: FF C0 FF isb $ffc0, x
B535: 00       brk
B536: 00       brk
B537: FF 00 FF isb $ff00, x
B53A: 00       brk
B53B: 00       brk
B53C: 00       brk
B53D: 01 FF    ora ($ff, x)
B53F: 00       brk
B540: 00       brk
B541: FF 00 FF isb $ff00, x
B544: 00       brk
B545: 00       brk
B546: 00       brk
B547: C0 FF    cpy #$ff
B549: 40       rti
B54A: FF 00 00 isb $0000, x
B54D: FF 00 FF isb $ff00, x
B550: 00       brk
B551: 01 FF    ora ($ff, x)
B553: C0 00    cpy #$00
B555: 40       rti
B556: 00       brk
B557: 00       brk
B558: 00       brk
B559: 01 FF    ora ($ff, x)
B55B: FF 00 00 isb $0000, x
B55E: 00       brk
B55F: 40       rti
B560: FF C0 FF isb $ffc0, x
B563: 00       brk
B564: 00       brk
B565: FF 00 FF isb $ff00, x
B568: 00       brk
B569: 00       brk
B56A: 00       brk
B56B: 80 FF    nop #$ff
B56D: 80 FF    nop #$ff
B56F: 00       brk
B570: 00       brk
B571: 80 00    nop #$00
B573: 80 00    nop #$00
B575: 00       brk
B576: 00       brk
B577: 01 FF    ora ($ff, x)
B579: FF 00 01 isb $0100, x
B57C: FF 40 00 isb $0040, x
B57F: C0 FF    cpy #$ff
B581: 00       brk
B582: 00       brk
B583: 80 00    nop #$00
B585: 80 00    nop #$00
B587: 00       brk
B588: 00       brk
B589: 01 FF    ora ($ff, x)
B58B: E0 00    cpx #$00
B58D: A0 FF    ldy #$ff
B58F: 80 FF    nop #$ff
B591: 00       brk
B592: 00       brk
B593: FF 00 00 isb $0000, x
B596: 00       brk
B597: 00       brk
B598: FF 00 02 isb $0200, x
B59B: 00       brk
B59C: 00       brk
B59D: 00       brk
B59E: FF 00 00 isb $0000, x
B5A1: 80 00    nop #$00
B5A3: 00       brk
B5A4: 00       brk
B5A5: 80 FF    nop #$ff
B5A7: 00       brk
B5A8: 01 60    ora ($60, x)
B5AA: 00       brk
B5AB: 20 01 80 jsr $8001
B5AE: FF 00 00 isb $0000, x
B5B1: 00       brk
B5B2: 01 00    ora ($00, x)
B5B4: 00       brk
B5B5: 80 00    nop #$00
B5B7: 00       brk
B5B8: 00       brk
B5B9: E0 00    cpx #$00
B5BB: A0 FF    ldy #$ff
B5BD: 80 00    nop #$00
B5BF: 00       brk
B5C0: 01 80    ora ($80, x)
B5C2: 00       brk
B5C3: 00       brk
B5C4: 00       brk
B5C5: 00       brk
B5C6: 00       brk
B5C7: 80 00    nop #$00
B5C9: E0 00    cpx #$00
B5CB: 40       rti
B5CC: 00       brk
B5CD: 60       rts
B5CE: FF 80 00 isb $0080, x
B5D1: 00       brk
B5D2: 01 80    ora ($80, x)
B5D4: 00       brk
B5D5: 00       brk
B5D6: 00       brk
B5D7: 00       brk
B5D8: 00       brk
B5D9: 80 00    nop #$00
B5DB: 00       brk
B5DC: 00       brk
B5DD: 00       brk
B5DE: 01 00    ora ($00, x)
B5E0: 01 80    ora ($80, x)
B5E2: 00       brk
B5E3: 00       brk
B5E4: 00       brk
B5E5: C0 00    cpy #$00
B5E7: C0 00    cpy #$00
B5E9: 00       brk
B5EA: FF 80 02 isb $0280, x
B5ED: 00       brk
B5EE: 00       brk
B5EF: 00       brk
B5F0: 00       brk
B5F1: C0 00    cpy #$00
B5F3: 80 00    nop #$00
B5F5: 80 FF    nop #$ff
B5F7: 80 01    nop #$01
B5F9: 00       brk
B5FA: 00       brk
B5FB: 00       brk
B5FC: 00       brk
B5FD: C0 00    cpy #$00
B5FF: C0 00    cpy #$00
B601: 40       rti
B602: FF 00 00 isb $0000, x
B605: 80 01    nop #$01
B607: 00       brk
B608: 00       brk
B609: 00       brk
B60A: 00       brk
B60B: C0 00    cpy #$00
B60D: 00       brk
B60E: 00       brk
B60F: C0 00    cpy #$00
B611: 00       brk
B612: 00       brk
B613: 00       brk
B614: FF 00 01 isb $0100, x
B617: 00       brk
B618: 00       brk
B619: C0 00    cpy #$00
B61B: C0 00    cpy #$00
B61D: 00       brk
B61E: 00       brk
B61F: 00       brk
B620: 00       brk
B621: 00       brk
B622: 01 C0    ora ($c0, x)
B624: 00       brk
B625: 00       brk
B626: 00       brk
B627: C0 00    cpy #$00
B629: 00       brk
B62A: 00       brk
B62B: 00       brk
B62C: 00       brk
B62D: 00       brk
B62E: 01 C0    ora ($c0, x)
B630: 00       brk
B631: 00       brk
B632: 00       brk
B633: C0 00    cpy #$00
B635: 00       brk
B636: 00       brk
B637: 00       brk
B638: 01 40    ora ($40, x)
B63A: 00       brk
B63B: 80 FF    nop #$ff
B63D: 80 00    nop #$00
B63F: 00       brk
B640: 01 80    ora ($80, x)
B642: FF 80 00 isb $0080, x
B645: 80 01    nop #$01
B647: 00       brk
B648: 00       brk
B649: 00       brk
B64A: 01 80    ora ($80, x)
B64C: FF 40 00 isb $0040, x
B64F: 00       brk
B650: 00       brk
B651: 00       brk
B652: 01 80    ora ($80, x)
B654: 00       brk
B655: 80 FF    nop #$ff
B657: 80 01    nop #$01
B659: 00       brk
B65A: 00       brk
B65B: E0 00    cpx #$00
B65D: 60       rts
B65E: 00       brk
B65F: 80 FF    nop #$ff
B661: 80 01    nop #$01
B663: 00       brk
B664: 00       brk
B665: 00       brk
B666: 00       brk
B667: 00       brk
B668: 81 00    sta ($00, x)
B66A: 01 00    ora ($00, x)
B66C: 00       brk
B66D: 00       brk
B66E: 81 00    sta ($00, x)
B670: 00       brk
B671: 00       brk
B672: 00       brk
B673: 00       brk
B674: 00       brk
B675: 00       brk
B676: 81 00    sta ($00, x)
B678: 00       brk
B679: 55 00    eor $00, x
B67B: 55 80    eor $80, x
B67D: 00       brk
B67E: 81 00    sta ($00, x)
B680: 00       brk
B681: 00       brk
B682: 01 00    ora ($00, x)
B684: 00       brk
B685: 00       brk
B686: 00       brk
B687: 00       brk
B688: 00       brk
B689: 00       brk
B68A: 00       brk
B68B: 55 80    eor $80, x
B68D: 55 00    eor $00, x
B68F: 00       brk
B690: 01 00    ora ($00, x)
B692: 81 00    sta ($00, x)
B694: 00       brk
B695: 00       brk
B696: 00       brk
B697: 00       brk
B698: 00       brk
B699: E0 00    cpx #$00
B69B: 00       brk
B69C: 01 D2    ora ($d2, x)
B69E: 80 D2    nop #$d2
B6A0: 00       brk
B6A1: 00       brk
B6A2: 01 00    ora ($00, x)
B6A4: 81 00    sta ($00, x)
B6A6: 00       brk
B6A7: 00       brk
B6A8: 00       brk
B6A9: 00       brk
B6AA: 00       brk
B6AB: 00       brk
B6AC: 00       brk
B6AD: 00       brk
B6AE: 01 00    ora ($00, x)
B6B0: 01 00    ora ($00, x)
B6B2: 81 00    sta ($00, x)
B6B4: 00       brk
B6B5: C0 00    cpy #$00
B6B7: C0 80    cpy #$80
B6B9: 00       brk
B6BA: 81 00    sta ($00, x)
B6BC: 01 00    ora ($00, x)
B6BE: 00       brk
B6BF: 00       brk
B6C0: 00       brk
B6C1: 00       brk
B6C2: 00       brk
B6C3: 00       brk
B6C4: 01 00    ora ($00, x)
B6C6: 81 00    sta ($00, x)
B6C8: 01 00    ora ($00, x)
B6CA: 00       brk
B6CB: 00       brk
B6CC: 00       brk
B6CD: 00       brk
B6CE: 01 00    ora ($00, x)
B6D0: 81 00    sta ($00, x)
B6D2: 81 00    sta ($00, x)
B6D4: 00       brk
B6D5: 00       brk
B6D6: 00       brk
B6D7: 00       brk
B6D8: 00       brk
B6D9: 00       brk
B6DA: 00       brk
B6DB: 00       brk
B6DC: 00       brk
B6DD: 00       brk
B6DE: 00       brk
B6DF: 00       brk
B6E0: 00       brk
B6E1: 00       brk
B6E2: 00       brk
B6E3: 00       brk
B6E4: 81 00    sta ($00, x)
B6E6: 01 00    ora ($00, x)
B6E8: 00       brk
B6E9: 00       brk
B6EA: 01 00    ora ($00, x)
B6EC: 81 00    sta ($00, x)
B6EE: 00       brk
B6EF: 00       brk
B6F0: 00       brk
B6F1: 00       brk
B6F2: 00       brk
B6F3: 00       brk
B6F4: 01 00    ora ($00, x)
B6F6: 00       brk
B6F7: 00       brk
B6F8: 00       brk
B6F9: 00       brk
B6FA: 00       brk
B6FB: 00       brk
B6FC: 00       brk
B6FD: 00       brk
B6FE: 00       brk
B6FF: 00       brk
B700: 01 00    ora ($00, x)
B702: 00       brk
B703: 00       brk
B704: 00       brk
B705: 00       brk
B706: 00       brk
B707: 00       brk
B708: 01 00    ora ($00, x)
B70A: 81 00    sta ($00, x)
B70C: 81 00    sta ($00, x)
B70E: 01 00    ora ($00, x)
B710: 81 00    sta ($00, x)
B712: 81 00    sta ($00, x)
B714: 01 00    ora ($00, x)
B716: 81 00    sta ($00, x)
B718: 00       brk
B719: 00       brk
B71A: 01 00    ora ($00, x)
B71C: 81 00    sta ($00, x)
B71E: 01 00    ora ($00, x)
B720: 00       brk
B721: 00       brk
B722: 00       brk
B723: 00       brk
B724: 01 00    ora ($00, x)
B726: 81 00    sta ($00, x)
B728: 01 00    ora ($00, x)
B72A: 00       brk
B72B: 00       brk
B72C: 01 00    ora ($00, x)
B72E: 01 00    ora ($00, x)
B730: 81 00    sta ($00, x)
B732: 01 00    ora ($00, x)
B734: 00       brk
B735: 01 04    ora ($04, x)
B737: 0A       asl a
B738: 09 09    ora #$09
B73A: 07 05    slo $05
B73C: 06 07    asl $07
B73E: 05 06    ora $06
B740: 06 06    asl $06
B742: 09 09    ora #$09
B744: 05 00    ora $00
B746: 02       kil
B747: 0A       asl a
B748: 1E 30 42 asl $4230, x
B74B: 50 5A    bvc $b7a7
B74D: 66 74    ror $74
B74F: 7E 8A 96 ror $968a, x
B752: A2 B4    ldx #$b4
B754: C6 FF    dec $ff
B756: 00       brk
B757: 00       brk
B758: 00       brk
B759: 01 FF    ora ($ff, x)
B75B: FF 00 01 isb $0100, x
B75E: FF FF 00 isb $00ff, x
B761: FF 00 00 isb $0000, x
B764: 00       brk
B765: 01 FF    ora ($ff, x)
B767: 00       brk
B768: 00       brk
B769: FF 00 01 isb $0100, x
B76C: FF FF 00 isb $00ff, x
B76F: FF 00 80 isb $8000, x
B772: FF 80 00 isb $0080, x
B775: 01 FF    ora ($ff, x)
B777: FF 00 01 isb $0100, x
B77A: FF FF 00 isb $00ff, x
B77D: 01 FF    ora ($ff, x)
B77F: FF 00 00 isb $0000, x
B782: 00       brk
B783: 01 FF    ora ($ff, x)
B785: FF 00 01 isb $0100, x
B788: FF FF 00 isb $00ff, x
B78B: 01 FF    ora ($ff, x)
B78D: FF 00 01 isb $0100, x
B790: FF FF 00 isb $00ff, x
B793: 00       brk
B794: 00       brk
B795: 01 FF    ora ($ff, x)
B797: FF 00 01 isb $0100, x
B79A: FF 80 00 isb $0080, x
B79D: 80 FF    nop #$ff
B79F: FF 00 01 isb $0100, x
B7A2: FF FF 00 isb $00ff, x
B7A5: 01 FF    ora ($ff, x)
B7A7: FF 00 80 isb $8000, x
B7AA: FF 80 00 isb $0080, x
B7AD: FF 00 00 isb $0000, x
B7B0: 00       brk
B7B1: 01 FF    ora ($ff, x)
B7B3: FF 00 01 isb $0100, x
B7B6: FF FF 00 isb $00ff, x
B7B9: 80 00    nop #$00
B7BB: 80 FF    nop #$ff
B7BD: FF 00 00 isb $0000, x
B7C0: 00       brk
B7C1: 01 FF    ora ($ff, x)
B7C3: FF 00 01 isb $0100, x
B7C6: FF FF 00 isb $00ff, x
B7C9: 01 FF    ora ($ff, x)
B7CB: 00       brk
B7CC: 00       brk
B7CD: FF 00 FF isb $ff00, x
B7D0: 00       brk
B7D1: 01 FF    ora ($ff, x)
B7D3: FF 00 01 isb $0100, x
B7D6: FF FF 00 isb $00ff, x
B7D9: 00       brk
B7DA: 00       brk
B7DB: 01 FF    ora ($ff, x)
B7DD: FF 00 01 isb $0100, x
B7E0: FF 00 00 isb $0000, x
B7E3: FF 00 01 isb $0100, x
B7E6: FF 00 FF isb $ff00, x
B7E9: 00       brk
B7EA: 03 00    slo ($00, x)
B7EC: FE 00 03 inc $0300, x
B7EF: 00       brk
B7F0: 01 00    ora ($00, x)
B7F2: 01 00    ora ($00, x)
B7F4: FF 00 02 isb $0200, x
B7F7: 00       brk
B7F8: 02       kil
B7F9: 00       brk
B7FA: 01 80    ora ($80, x)
B7FC: FF 80 02 isb $0280, x
B7FF: 00       brk
B800: 01 00    ora ($00, x)
B802: 00       brk
B803: 00       brk
B804: 01 00    ora ($00, x)
B806: 00       brk
B807: 00       brk
B808: 01 00    ora ($00, x)
B80A: 02       kil
B80B: 80 00    nop #$00
B80D: 80 01    nop #$01
B80F: 00       brk
B810: 00       brk
B811: 00       brk
B812: 01 00    ora ($00, x)
B814: 01 00    ora ($00, x)
B816: 00       brk
B817: 00       brk
B818: 00       brk
B819: 00       brk
B81A: 05 00    ora $00
B81C: 01 00    ora ($00, x)
B81E: 00       brk
B81F: 00       brk
B820: 01 00    ora ($00, x)
B822: 00       brk
B823: 00       brk
B824: FF 00 05 isb $0500, x
B827: 00       brk
B828: FF 00 FF isb $ff00, x
B82B: 00       brk
B82C: 04 00    nop $00
B82E: 01 00    ora ($00, x)
B830: 01 00    ora ($00, x)
B832: 01 00    ora ($00, x)
B834: 02       kil
B835: 00       brk
B836: 01 00    ora ($00, x)
B838: 01 00    ora ($00, x)
B83A: 02       kil
B83B: 00       brk
B83C: 01 00    ora ($00, x)
B83E: 01 00    ora ($00, x)
B840: 00       brk
B841: 00       brk
B842: 05 00    ora $00
B844: 01 00    ora ($00, x)
B846: 00       brk
B847: 00       brk
B848: 01 00    ora ($00, x)
B84A: 00       brk
B84B: 00       brk
B84C: 00       brk
B84D: 00       brk
B84E: FF 00 00 isb $0000, x
B851: 00       brk
B852: 02       kil
B853: 00       brk
B854: 02       kil
B855: 80 00    nop #$00
B857: 80 01    nop #$01
B859: 00       brk
B85A: 00       brk
B85B: 00       brk
B85C: 01 00    ora ($00, x)
B85E: 01 00    ora ($00, x)
B860: 00       brk
B861: 00       brk
B862: 01 00    ora ($00, x)
B864: 01 00    ora ($00, x)
B866: 02       kil
B867: 80 00    nop #$00
B869: 80 00    nop #$00
B86B: 00       brk
B86C: 02       kil
B86D: 00       brk
B86E: 01 00    ora ($00, x)
B870: 01 00    ora ($00, x)
B872: 02       kil
B873: 00       brk
B874: 01 00    ora ($00, x)
B876: 01 00    ora ($00, x)
B878: 01 00    ora ($00, x)
B87A: 81 00    sta ($00, x)
B87C: 00       brk
B87D: 00       brk
B87E: 82 00    nop #$00
B880: 03 00    slo ($00, x)
B882: 01 00    ora ($00, x)
B884: 01 00    ora ($00, x)
B886: 81 00    sta ($00, x)
B888: 00       brk
B889: 00       brk
B88A: 02       kil
B88B: 00       brk
B88C: 00       brk
B88D: 80 80    nop #$80
B88F: 80 00    nop #$00
B891: 00       brk
B892: 01 00    ora ($00, x)
B894: 00       brk
B895: 00       brk
B896: 02       kil
B897: 00       brk
B898: 00       brk
B899: 00       brk
B89A: 84 00    sty $00
B89C: 02       kil
B89D: 80 00    nop #$00
B89F: 80 80    nop #$80
B8A1: 00       brk
B8A2: 00       brk
B8A3: 00       brk
B8A4: 01 00    ora ($00, x)
B8A6: 81 00    sta ($00, x)
B8A8: 00       brk
B8A9: 00       brk
B8AA: 00       brk
B8AB: 00       brk
B8AC: 00       brk
B8AD: 00       brk
B8AE: 01 00    ora ($00, x)
B8B0: 00       brk
B8B1: 00       brk
B8B2: 01 00    ora ($00, x)
B8B4: 00       brk
B8B5: 00       brk
B8B6: 81 00    sta ($00, x)
B8B8: 00       brk
B8B9: 00       brk
B8BA: 81 00    sta ($00, x)
B8BC: 81 00    sta ($00, x)
B8BE: 01 00    ora ($00, x)
B8C0: 02       kil
B8C1: 00       brk
B8C2: 02       kil
B8C3: 00       brk
B8C4: 01 00    ora ($00, x)
B8C6: 81 00    sta ($00, x)
B8C8: 01 00    ora ($00, x)
B8CA: 01 00    ora ($00, x)
B8CC: 81 00    sta ($00, x)
B8CE: 02       kil
B8CF: 00       brk
B8D0: 02       kil
B8D1: 00       brk
B8D2: 00       brk
B8D3: 00       brk
B8D4: 00       brk
B8D5: 00       brk
B8D6: 01 00    ora ($00, x)
B8D8: 00       brk
B8D9: 00       brk
B8DA: 01 00    ora ($00, x)
B8DC: 00       brk
B8DD: 00       brk
B8DE: 00       brk
B8DF: 00       brk
B8E0: 82 00    nop #$00
B8E2: 00       brk
B8E3: 00       brk
B8E4: 00       brk
B8E5: 00       brk
B8E6: 02       kil
B8E7: 80 00    nop #$00
B8E9: 80 80    nop #$80
B8EB: 00       brk
B8EC: 00       brk
B8ED: 00       brk
B8EE: 01 00    ora ($00, x)
B8F0: 81 00    sta ($00, x)
B8F2: 00       brk
B8F3: 00       brk
B8F4: 01 00    ora ($00, x)
B8F6: 81 00    sta ($00, x)
B8F8: 02       kil
B8F9: 80 00    nop #$00
B8FB: 80 00    nop #$00
B8FD: 80 80    nop #$80
B8FF: 00       brk
B900: 01 00    ora ($00, x)
B902: 01 00    ora ($00, x)
B904: 02       kil
B905: 00       brk
B906: 00       brk
B907: 00       brk
B908: 01 00    ora ($00, x)
B90A: 01 00    ora ($00, x)
B90C: 00       brk
B90D: 00       brk
B90E: 06 07    asl $07
B910: 0B 06    anc #$06
B912: 07 07    slo $07
B914: 06 0B    asl $0b
B916: 07 05    slo $05
B918: 00       brk
B919: 00       brk
B91A: 00       brk
B91B: 00       brk
B91C: 00       brk
B91D: 00       brk
B91E: 00       brk
B91F: 0C 1A 30 nop $301a
B922: 3C 4A 58 nop $584a, x
B925: 64 7A    nop $7a
B927: 88       dey
B928: 00       brk
B929: 00       brk
B92A: 00       brk
B92B: FF 00 A0 isb $a000, x
B92E: FF 60 FF isb $ff60, x
B931: FF 00 FF isb $ff00, x
B934: 00       brk
B935: 01 FF    ora ($ff, x)
B937: FF 00 60 isb $6000, x
B93A: FF A0 FF isb $ffa0, x
B93D: FF 00 01 isb $0100, x
B940: FF FF 00 isb $00ff, x
B943: A0 FF    ldy #$ff
B945: E0 FF    cpx #$ff
B947: E0 FF    cpx #$ff
B949: A0 FF    ldy #$ff
B94B: FF 00 A0 isb $a000, x
B94E: FF 60 FF isb $ff60, x
B951: FF 00 FF isb $ff00, x
B954: 00       brk
B955: 01 FF    ora ($ff, x)
B957: FF 00 60 isb $6000, x
B95A: FF A0 FF isb $ffa0, x
B95D: FF 00 E0 isb $e000, x
B960: FF A0 FF isb $ffa0, x
B963: 80 00    nop #$00
B965: 00       brk
B966: 00       brk
B967: 01 FF    ora ($ff, x)
B969: 60       rts
B96A: 00       brk
B96B: 20 00 20 jsr $2000
B96E: 00       brk
B96F: 60       rts
B970: 00       brk
B971: FF 00 01 isb $0100, x
B974: FF 80 00 isb $0080, x
B977: A0 FF    ldy #$ff
B979: E0 FF    cpx #$ff
B97B: FF 00 00 isb $0000, x
B97E: 00       brk
B97F: 01 FF    ora ($ff, x)
B981: 60       rts
B982: 00       brk
B983: 20 00 20 jsr $2000
B986: 00       brk
B987: 60       rts
B988: 00       brk
B989: 00       brk
B98A: 00       brk
B98B: A0 FF    ldy #$ff
B98D: 60       rts
B98E: FF FF 00 isb $00ff, x
B991: FF 00 01 isb $0100, x
B994: FF 60 00 isb $0060, x
B997: A0 00    ldy #$00
B999: 01 FF    ora ($ff, x)
B99B: FF 00 FF isb $ff00, x
B99E: 00       brk
B99F: 00       brk
B9A0: 00       brk
B9A1: 01 FF    ora ($ff, x)
B9A3: 60       rts
B9A4: 00       brk
B9A5: 20 00 20 jsr $2000
B9A8: 00       brk
B9A9: 60       rts
B9AA: 00       brk
B9AB: FF 00 00 isb $0000, x
B9AE: 00       brk
B9AF: 01 FF    ora ($ff, x)
B9B1: 60       rts
B9B2: 00       brk
B9B3: 20 00 20 jsr $2000
B9B6: 00       brk
B9B7: 60       rts
B9B8: 00       brk
B9B9: FF 00 FF isb $ff00, x
B9BC: 00       brk
B9BD: 00       brk
B9BE: 00       brk
B9BF: A0 FF    ldy #$ff
B9C1: 60       rts
B9C2: FF FF 00 isb $00ff, x
B9C5: FF 00 00 isb $0000, x
B9C8: 00       brk
B9C9: 01 FF    ora ($ff, x)
B9CB: 60       rts
B9CC: 00       brk
B9CD: 20 00 20 jsr $2000
B9D0: 00       brk
B9D1: 60       rts
B9D2: 00       brk
B9D3: 01 FF    ora ($ff, x)
B9D5: 60       rts
B9D6: 00       brk
B9D7: A0 00    ldy #$00
B9D9: 01 FF    ora ($ff, x)
B9DB: FF 00 00 isb $0000, x
B9DE: 00       brk
B9DF: C0 00    cpy #$00
B9E1: A0 00    ldy #$00
B9E3: 00       brk
B9E4: 00       brk
B9E5: 00       brk
B9E6: 00       brk
B9E7: 60       rts
B9E8: 01 00    ora ($00, x)
B9EA: 00       brk
B9EB: 60       rts
B9EC: FF 40 FF isb $ff40, x
B9EF: 00       brk
B9F0: 00       brk
B9F1: 00       brk
B9F2: 02       kil
B9F3: 00       brk
B9F4: 00       brk
B9F5: A0 FF    ldy #$ff
B9F7: C0 FF    cpy #$ff
B9F9: 40       rti
B9FA: 00       brk
B9FB: 60       rts
B9FC: 00       brk
B9FD: 00       brk
B9FE: 00       brk
B9FF: C0 00    cpy #$00
BA01: A0 00    ldy #$00
BA03: 00       brk
BA04: 00       brk
BA05: 00       brk
BA06: 00       brk
BA07: 60       rts
BA08: 01 00    ora ($00, x)
BA0A: 00       brk
BA0B: 60       rts
BA0C: FF 40 FF isb $ff40, x
BA0F: 00       brk
BA10: 00       brk
BA11: 40       rti
BA12: 00       brk
BA13: 60       rts
BA14: 00       brk
BA15: 00       brk
BA16: 00       brk
BA17: 60       rts
BA18: 02       kil
BA19: 00       brk
BA1A: 00       brk
BA1B: A0 FF    ldy #$ff
BA1D: C0 FF    cpy #$ff
BA1F: 40       rti
BA20: 00       brk
BA21: 60       rts
BA22: 00       brk
BA23: 00       brk
BA24: 00       brk
BA25: A0 00    ldy #$00
BA27: 00       brk
BA28: 00       brk
BA29: A0 FF    ldy #$ff
BA2B: C0 FF    cpy #$ff
BA2D: 00       brk
BA2E: 00       brk
BA2F: A0 00    ldy #$00
BA31: 00       brk
BA32: 00       brk
BA33: A0 FF    ldy #$ff
BA35: C0 FF    cpy #$ff
BA37: 40       rti
BA38: 00       brk
BA39: 60       rts
BA3A: 00       brk
BA3B: 80 01    nop #$01
BA3D: C0 00    cpy #$00
BA3F: A0 00    ldy #$00
BA41: 00       brk
BA42: 00       brk
BA43: 00       brk
BA44: 00       brk
BA45: 20 02 C0 jsr $c002
BA48: 00       brk
BA49: A0 00    ldy #$00
BA4B: 00       brk
BA4C: 00       brk
BA4D: 00       brk
BA4E: 00       brk
BA4F: 00       brk
BA50: 00       brk
BA51: 00       brk
BA52: 03 00    slo ($00, x)
BA54: 00       brk
BA55: A0 FF    ldy #$ff
BA57: C0 FF    cpy #$ff
BA59: 40       rti
BA5A: 00       brk
BA5B: 60       rts
BA5C: 00       brk
BA5D: 00       brk
BA5E: 00       brk
BA5F: A0 00    ldy #$00
BA61: 00       brk
BA62: 00       brk
BA63: A0 FF    ldy #$ff
BA65: C0 FF    cpy #$ff
BA67: 40       rti
BA68: 00       brk
BA69: 60       rts
BA6A: 00       brk
BA6B: 00       brk
BA6C: 00       brk
BA6D: 00       brk
BA6E: 00       brk
BA6F: 00       brk
BA70: 01 C0    ora ($c0, x)
BA72: 00       brk
BA73: A0 00    ldy #$00
BA75: 00       brk
BA76: 00       brk
BA77: 00       brk
BA78: 00       brk
BA79: E0 00    cpx #$00
BA7B: 00       brk
BA7C: 00       brk
BA7D: A0 FF    ldy #$ff
BA7F: C0 FF    cpy #$ff
BA81: 40       rti
BA82: 00       brk
BA83: 60       rts
BA84: 00       brk
BA85: 20 00 C0 jsr $c000
BA88: 00       brk
BA89: A0 00    ldy #$00
BA8B: 00       brk
BA8C: 00       brk
BA8D: 00       brk
BA8E: 00       brk
BA8F: 00       brk
BA90: 00       brk
BA91: 00       brk
BA92: 02       kil
BA93: 00       brk
BA94: 01 00    ora ($00, x)
BA96: 00       brk
BA97: 00       brk
BA98: 00       brk
BA99: 00       brk
BA9A: 00       brk
BA9B: 00       brk
BA9C: 00       brk
BA9D: 00       brk
BA9E: 81 00    sta ($00, x)
BAA0: 82 00    nop #$00
BAA2: 00       brk
BAA3: 00       brk
BAA4: 00       brk
BAA5: 00       brk
BAA6: 00       brk
BAA7: 00       brk
BAA8: 81 00    sta ($00, x)
BAAA: 82 00    nop #$00
BAAC: 02       kil
BAAD: 00       brk
BAAE: 01 00    ora ($00, x)
BAB0: 00       brk
BAB1: 00       brk
BAB2: 02       kil
BAB3: 00       brk
BAB4: 01 00    ora ($00, x)
BAB6: 00       brk
BAB7: 00       brk
BAB8: 00       brk
BAB9: 00       brk
BABA: 00       brk
BABB: 00       brk
BABC: 00       brk
BABD: 00       brk
BABE: 81 00    sta ($00, x)
BAC0: 82 00    nop #$00
BAC2: 00       brk
BAC3: 00       brk
BAC4: 02       kil
BAC5: 00       brk
BAC6: 01 00    ora ($00, x)
BAC8: 00       brk
BAC9: 00       brk
BACA: 00       brk
BACB: 00       brk
BACC: 00       brk
BACD: 00       brk
BACE: 81 00    sta ($00, x)
BAD0: 82 00    nop #$00
BAD2: 02       kil
BAD3: 00       brk
BAD4: 01 00    ora ($00, x)
BAD6: 00       brk
BAD7: 00       brk
BAD8: 00       brk
BAD9: 00       brk
BADA: 00       brk
BADB: 00       brk
BADC: 81 00    sta ($00, x)
BADE: 82 00    nop #$00
BAE0: 00       brk
BAE1: 00       brk
BAE2: 00       brk
BAE3: 00       brk
BAE4: 00       brk
BAE5: 00       brk
BAE6: 81 00    sta ($00, x)
BAE8: 82 00    nop #$00
BAEA: 02       kil
BAEB: 00       brk
BAEC: 01 00    ora ($00, x)
BAEE: 00       brk
BAEF: 00       brk
BAF0: 02       kil
BAF1: 00       brk
BAF2: 01 00    ora ($00, x)
BAF4: 00       brk
BAF5: 00       brk
BAF6: 00       brk
BAF7: 00       brk
BAF8: 00       brk
BAF9: 00       brk
BAFA: 02       kil
BAFB: 00       brk
BAFC: 01 00    ora ($00, x)
BAFE: 00       brk
BAFF: 00       brk
BB00: 00       brk
BB01: 00       brk
BB02: 00       brk
BB03: 00       brk
BB04: 00       brk
BB05: 00       brk
BB06: 00       brk
BB07: 00       brk
BB08: 81 00    sta ($00, x)
BB0A: 82 00    nop #$00
BB0C: 02       kil
BB0D: 00       brk
BB0E: 01 00    ora ($00, x)
BB10: 00       brk
BB11: 00       brk
BB12: 00       brk
BB13: 00       brk
BB14: 00       brk
BB15: 00       brk
BB16: 81 00    sta ($00, x)
BB18: 82 00    nop #$00
BB1A: 02       kil
BB1B: 00       brk
BB1C: 01 00    ora ($00, x)
BB1E: 00       brk
BB1F: 00       brk
BB20: 00       brk
BB21: 00       brk
BB22: 00       brk
BB23: 00       brk
BB24: 02       kil
BB25: 00       brk
BB26: 01 00    ora ($00, x)
BB28: 00       brk
BB29: 00       brk
BB2A: 00       brk
BB2B: 00       brk
BB2C: 00       brk
BB2D: 00       brk
BB2E: 00       brk
BB2F: 00       brk
BB30: 81 00    sta ($00, x)
BB32: 82 00    nop #$00
BB34: 02       kil
BB35: 00       brk
BB36: 01 00    ora ($00, x)
BB38: 00       brk
BB39: 00       brk
BB3A: 02       kil
BB3B: 00       brk
BB3C: 01 00    ora ($00, x)
BB3E: 00       brk
BB3F: 00       brk
BB40: 00       brk
BB41: 04 05    nop $05
BB43: 07 04    slo $04
BB45: 05 0A    ora $0a
BB47: 05 0B    ora $0b
BB49: 05 01    ora $01
BB4B: 07 07    slo $07
BB4D: 01 05    ora ($05, x)
BB4F: 0B 01    anc #$01
BB51: 00       brk
BB52: 08       php
BB53: 12       kil
BB54: 20 28 32 jsr $3228
BB57: 46 50    lsr $50
BB59: 66 70    ror $70
BB5B: 72       kil
BB5C: 80 8E    nop #$8e
BB5E: 90 9A    bcc $bafa
BB60: B0 2C    bcs $bb8e
BB62: A6 CF    ldx $cf
BB64: BD 3C 01 lda $013c, x
BB67: D0 20    bne $bb89
BB69: B5 88    lda $88, x
BB6B: F0 1C    beq $bb89
BB6D: A6 86    ldx $86
BB6F: BD 34 01 lda $0134, x
BB72: D0 15    bne $bb89
BB74: 20 90 A5 jsr $a590
BB77: A9 00    lda #$00
BB79: 85 24    sta $24
BB7B: A9 02    lda #$02
BB7D: 85 41    sta $41
BB7F: 20 CE BB jsr $bbce
BB82: A5 24    lda $24
BB84: F0 03    beq $bb89
BB86: 4C 8A BB jmp $bb8a
BB89: 60       rts
BB8A: 20 8A A5 jsr $a58a
BB8D: 20 C0 C8 jsr $c8c0
BB90: 20 EB E0 jsr $e0eb
BB93: 60       rts
BB94: A2 03    ldx #$03
BB96: 20 6F BB jsr $bb6f
BB99: A2 02    ldx #$02
BB9B: 20 6F BB jsr $bb6f
BB9E: 60       rts
BB9F: A9 03    lda #$03
BBA1: 85 21    sta $21
BBA3: A4 CF    ldy $cf
BBA5: B9 3C 01 lda $013c, y
BBA8: D0 17    bne $bbc1
BBAA: A4 21    ldy $21
BBAC: B9 EC 02 lda $02ec, y
BBAF: F0 0C    beq $bbbd
BBB1: A2 01    ldx #$01
BBB3: 86 22    stx $22
BBB5: 20 C2 BB jsr $bbc2
BBB8: A6 22    ldx $22
BBBA: CA       dex
BBBB: 10 F6    bpl $bbb3
BBBD: C6 21    dec $21
BBBF: 10 E9    bpl $bbaa
BBC1: 60       rts
BBC2: BD 34 01 lda $0134, x
BBC5: D0 2B    bne $bbf2
BBC7: A9 02    lda #$02
BBC9: 85 41    sta $41
BBCB: 20 BD BE jsr $bebd
BBCE: BD 08 01 lda $0108, x
BBD1: 85 3C    sta $3c
BBD3: BD 0C 01 lda $010c, x
BBD6: 85 3D    sta $3d
BBD8: BD 14 01 lda $0114, x
BBDB: 85 3E    sta $3e
BBDD: BD 18 01 lda $0118, x
BBE0: 85 3F    sta $3f
BBE2: 86 22    stx $22
BBE4: 20 D2 A4 jsr $a4d2
BBE7: A6 22    ldx $22
BBE9: A4 21    ldy $21
BBEB: B0 05    bcs $bbf2
BBED: E6 24    inc $24
BBEF: 20 08 BC jsr $bc08
BBF2: 60       rts
BBF3: A0 03    ldy #$03
BBF5: 84 21    sty $21
BBF7: A4 21    ldy $21
BBF9: B9 EC 02 lda $02ec, y
BBFC: F0 05    beq $bc03
BBFE: A6 86    ldx $86
BC00: 20 C2 BB jsr $bbc2
BC03: C6 21    dec $21
BC05: 10 F0    bpl $bbf7
BC07: 60       rts
BC08: AD 0A 60 lda $600a
BC0B: 09 40    ora #$40
BC0D: E0 02    cpx #$02
BC0F: 90 02    bcc $bc13
BC11: A9 30    lda #$30
BC13: 9D 34 01 sta $0134, x
BC16: A9 00    lda #$00
BC18: 99 EC 02 sta $02ec, y
BC1B: 20 4D BC jsr $bc4d
BC1E: 20 C0 C8 jsr $c8c0
BC21: 20 EB E0 jsr $e0eb
BC24: A9 00    lda #$00
BC26: 85 23    sta $23
BC28: A9 01    lda #$01
BC2A: 85 24    sta $24
BC2C: 4C 7D C3 jmp $c37d
BC2F: A9 03    lda #$03
BC31: 85 21    sta $21
BC33: A4 21    ldy $21
BC35: B9 EC 02 lda $02ec, y
BC38: F0 0E    beq $bc48
BC3A: A2 03    ldx #$03
BC3C: 86 22    stx $22
BC3E: 20 C2 BB jsr $bbc2
BC41: A6 22    ldx $22
BC43: CA       dex
BC44: E0 01    cpx #$01
BC46: D0 F4    bne $bc3c
BC48: C6 21    dec $21
BC4A: 10 E7    bpl $bc33
BC4C: 60       rts
BC4D: BD 08 01 lda $0108, x
BC50: 85 38    sta $38
BC52: BD 0C 01 lda $010c, x
BC55: 85 39    sta $39
BC57: BD 14 01 lda $0114, x
BC5A: 85 3A    sta $3a
BC5C: BD 18 01 lda $0118, x
BC5F: 85 3B    sta $3b
BC61: 60       rts
BC62: 20 6F A5 jsr $a56f
BC65: A2 0C    ldx #$0c
BC67: BD F0 02 lda $02f0, x
BC6A: F0 29    beq $bc95
BC6C: 86 21    stx $21
BC6E: 20 99 BC jsr $bc99
BC71: A9 00    lda #$00
BC73: 85 41    sta $41
BC75: 20 D2 A4 jsr $a4d2
BC78: B0 19    bcs $bc93
BC7A: A5 4B    lda $4b
BC7C: D0 06    bne $bc84
BC7E: A5 1D    lda $1d
BC80: 29 01    and #$01
BC82: F0 06    beq $bc8a
BC84: 20 B0 BC jsr $bcb0
BC87: 4C 93 BC jmp $bc93
BC8A: 20 8A A5 jsr $a58a
BC8D: 20 C0 C8 jsr $c8c0
BC90: 20 EB E0 jsr $e0eb
BC93: A6 21    ldx $21
BC95: CA       dex
BC96: 10 CF    bpl $bc67
BC98: 60       rts
BC99: A6 21    ldx $21
BC9B: BD 23 02 lda $0223, x
BC9E: 85 38    sta $38
BCA0: BD 0C 02 lda $020c, x
BCA3: 85 39    sta $39
BCA5: BD 68 02 lda $0268, x
BCA8: 85 3A    sta $3a
BCAA: BD 51 02 lda $0251, x
BCAD: 85 3B    sta $3b
BCAF: 60       rts
BCB0: A9 70    lda #$70
BCB2: 65 48    adc $48
BCB4: 85 48    sta $48
BCB6: A6 21    ldx $21
BCB8: A9 00    lda #$00
BCBA: 9D F0 02 sta $02f0, x
BCBD: 60       rts
BCBE: A9 03    lda #$03
BCC0: 85 21    sta $21
BCC2: A4 21    ldy $21
BCC4: B9 EC 02 lda $02ec, y
BCC7: F0 24    beq $bced
BCC9: A2 07    ldx #$07
BCCB: BD E4 02 lda $02e4, x
BCCE: F0 1A    beq $bcea
BCD0: 20 BD BE jsr $bebd
BCD3: 20 7E BE jsr $be7e
BCD6: 86 22    stx $22
BCD8: A9 FF    lda #$ff
BCDA: 85 41    sta $41
BCDC: 20 D2 A4 jsr $a4d2
BCDF: A6 22    ldx $22
BCE1: A4 21    ldy $21
BCE3: B0 03    bcs $bce8
BCE5: 20 53 C3 jsr $c353
BCE8: A6 22    ldx $22
BCEA: CA       dex
BCEB: 10 DE    bpl $bccb
BCED: C6 21    dec $21
BCEF: 10 D1    bpl $bcc2
BCF1: 60       rts
BCF2: E0 20    cpx #$20
BCF4: E0 D0    cpx #$d0
BCF6: E0 E0    cpx #$e0
BCF8: 20 E0 20 jsr $20e0
BCFB: E0 20    cpx #$20
BCFD: 20 E0 20 jsr $20e0
BD00: 20 20 20 jsr $2020
BD03: E0 20    cpx #$20
BD05: E0 20    cpx #$20
BD07: E0 20    cpx #$20
BD09: E0 E0    cpx #$e0
BD0B: 20 10 20 jsr $2010
BD0E: 10 10    bpl $bd20
BD10: E0 20    cpx #$20
BD12: E0 20    cpx #$20
BD14: E0 20    cpx #$20
BD16: E0 20    cpx #$20
BD18: 20 20 E0 jsr $e020
BD1B: 20 00 00 jsr $0000
BD1E: E0 00    cpx #$00
BD20: 20 00 00 jsr $0000
BD23: 00       brk
BD24: 00       brk
BD25: 00       brk
BD26: 00       brk
BD27: 00       brk
BD28: 00       brk
BD29: 00       brk
BD2A: 10 10    bpl $bd3c
BD2C: F0 00    beq $bd2e
BD2E: 20 F0 00 jsr $00f0
BD31: F0 E0    beq $bd13
BD33: E0 E0    cpx #$e0
BD35: E0 E0    cpx #$e0
BD37: E0 E0    cpx #$e0
BD39: E0 E0    cpx #$e0
BD3B: 00       brk
BD3C: E0 E0    cpx #$e0
BD3E: 20 20 E0 jsr $e020
BD41: 00       brk
BD42: E0 E0    cpx #$e0
BD44: E0 20    cpx #$20
BD46: 20 20 E0 jsr $e020
BD49: 20 20 20 jsr $2020
BD4C: E0 E0    cpx #$e0
BD4E: 20 E0 E0 jsr $e0e0
BD51: 20 20 E0 jsr $e020
BD54: E0 20    cpx #$20
BD56: E0 E0    cpx #$e0
BD58: 20 20 E0 jsr $e020
BD5B: E0 20    cpx #$20
BD5D: 20 E0 00 jsr $00e0
BD60: 20 E0 20 jsr $20e0
BD63: 20 20 E0 jsr $e020
BD66: E0 E0    cpx #$e0
BD68: E0 E0    cpx #$e0
BD6A: E0 E0    cpx #$e0
BD6C: 20 E0 20 jsr $20e0
BD6F: 20 E0 20 jsr $20e0
BD72: F0 10    beq $bd84
BD74: F0 F0    beq $bd66
BD76: F0 10    beq $bd88
BD78: 10 10    bpl $bd8a
BD7A: F0 F0    beq $bd6c
BD7C: F0 00    beq $bd7e
BD7E: F0 00    beq $bd80
BD80: 10 10    bpl $bd92
BD82: 20 E0 20 jsr $20e0
BD85: 20 20 20 jsr $2020
BD88: 20 20 20 jsr $2020
BD8B: 00       brk
BD8C: E0 20    cpx #$20
BD8E: E0 E0    cpx #$e0
BD90: 20 20 20 jsr $2020
BD93: E0 20    cpx #$20
BD95: E0 E0    cpx #$e0
BD97: 20 20 20 jsr $2020
BD9A: E0 E0    cpx #$e0
BD9C: 20 20 E0 jsr $e020
BD9F: E0 E0    cpx #$e0
BDA1: 20 20 20 jsr $2020
BDA4: 20 E0 20 jsr $20e0
BDA7: 20 E0 20 jsr $20e0
BDAA: E0 20    cpx #$20
BDAC: 20 20 20 jsr $2020
BDAF: 20 E0 20 jsr $20e0
BDB2: A6 CF    ldx $cf
BDB4: B5 4D    lda $4d, x
BDB6: AA       tax
BDB7: BD 31 C1 lda $c131, x
BDBA: 29 20    and #$20
BDBC: F0 2D    beq $bdeb
BDBE: A9 80    lda #$80
BDC0: 05 F4    ora $f4
BDC2: 85 F4    sta $f4
BDC4: A9 03    lda #$03
BDC6: 85 21    sta $21
BDC8: A4 21    ldy $21
BDCA: B9 EC 02 lda $02ec, y
BDCD: F0 18    beq $bde7
BDCF: 20 BD BE jsr $bebd
BDD2: 20 EC BD jsr $bdec
BDD5: A9 03    lda #$03
BDD7: 85 41    sta $41
BDD9: A9 00    lda #$00
BDDB: 85 22    sta $22
BDDD: 20 D2 A4 jsr $a4d2
BDE0: A4 21    ldy $21
BDE2: B0 03    bcs $bde7
BDE4: 4C FD BD jmp $bdfd
BDE7: C6 21    dec $21
BDE9: 10 DD    bpl $bdc8
BDEB: 60       rts
BDEC: A9 E0    lda #$e0
BDEE: 85 3C    sta $3c
BDF0: A9 FE    lda #$fe
BDF2: 85 3D    sta $3d
BDF4: A9 20    lda #$20
BDF6: 85 3E    sta $3e
BDF8: A9 02    lda #$02
BDFA: 85 3F    sta $3f
BDFC: 60       rts
BDFD: AD 43 01 lda $0143
BE00: 10 2D    bpl $be2f
BE02: 20 F7 E0 jsr $e0f7
BE05: A9 00    lda #$00
BE07: 8D 43 01 sta $0143
BE0A: A9 20    lda #$20
BE0C: 8D 34 01 sta $0134
BE0F: 8D 35 01 sta $0135
BE12: A9 00    lda #$00
BE14: 99 EC 02 sta $02ec, y
BE17: 85 23    sta $23
BE19: A9 05    lda #$05
BE1B: 85 24    sta $24
BE1D: 20 7D C3 jsr $c37d
BE20: A6 CF    ldx $cf
BE22: B5 F6    lda $f6, x
BE24: C9 01    cmp #$01
BE26: D0 07    bne $be2f
BE28: A9 FF    lda #$ff
BE2A: 85 21    sta $21
BE2C: 20 E0 5A jsr $5ae0
BE2F: 60       rts
BE30: AD 3E 01 lda $013e
BE33: 30 48    bmi $be7d
BE35: A5 4F    lda $4f
BE37: 29 3F    and #$3f
BE39: D0 42    bne $be7d
BE3B: F8       sed
BE3C: AD 3E 01 lda $013e
BE3F: 38       sec
BE40: E9 01    sbc #$01
BE42: 8D 3E 01 sta $013e
BE45: D8       cld
BE46: 10 35    bpl $be7d
BE48: CE 3E 01 dec $013e
BE4B: A6 CF    ldx $cf
BE4D: B5 4D    lda $4d, x
BE4F: 0A       asl a
BE50: 65 CF    adc $cf
BE52: A8       tay
BE53: A9 FF    lda #$ff
BE55: 99 44 01 sta $0144, y
BE58: B4 4D    ldy $4d, x
BE5A: 20 D0 C1 jsr $c1d0
BE5D: 20 C0 C8 jsr $c8c0
BE60: 20 C0 C8 jsr $c8c0
BE63: 20 C0 C8 jsr $c8c0
BE66: 20 EB E0 jsr $e0eb
BE69: 20 67 54 jsr $5467
BE6C: A6 CF    ldx $cf
BE6E: A9 80    lda #$80
BE70: 85 30    sta $30
BE72: A9 00    lda #$00
BE74: 95 88    sta $88, x
BE76: A9 18    lda #$18
BE78: 95 00    sta $00, x
BE7A: 9D 3C 01 sta $013c, x
BE7D: 60       rts
BE7E: 8A       txa
BE7F: A8       tay
BE80: B1 76    lda ($76), y
BE82: 85 7B    sta $7b
BE84: 10 05    bpl $be8b
BE86: A9 FF    lda #$ff
BE88: 4C 8D BE jmp $be8d
BE8B: A9 00    lda #$00
BE8D: 85 7C    sta $7c
BE8F: B9 17 02 lda $0217, y
BE92: 18       clc
BE93: 65 7B    adc $7b
BE95: 85 3C    sta $3c
BE97: B9 00 02 lda $0200, y
BE9A: 65 7C    adc $7c
BE9C: 85 3D    sta $3d
BE9E: B1 78    lda ($78), y
BEA0: 85 7B    sta $7b
BEA2: 10 05    bpl $bea9
BEA4: A9 FF    lda #$ff
BEA6: 4C AB BE jmp $beab
BEA9: A9 00    lda #$00
BEAB: 85 7C    sta $7c
BEAD: B9 5C 02 lda $025c, y
BEB0: 18       clc
BEB1: 65 7B    adc $7b
BEB3: 85 3E    sta $3e
BEB5: B9 45 02 lda $0245, y
BEB8: 65 7C    adc $7c
BEBA: 85 3F    sta $3f
BEBC: 60       rts
BEBD: B9 1F 02 lda $021f, y
BEC0: 85 38    sta $38
BEC2: B9 08 02 lda $0208, y
BEC5: 85 39    sta $39
BEC7: B9 64 02 lda $0264, y
BECA: 85 3A    sta $3a
BECC: B9 4D 02 lda $024d, y
BECF: 85 3B    sta $3b
BED1: 60       rts
BED2: A9 00    lda #$00
BED4: 8D 6E 04 sta $046e
BED7: 85 4B    sta $4b
BED9: A6 CF    ldx $cf
BEDB: B5 88    lda $88, x
BEDD: F0 37    beq $bf16
BEDF: A5 1D    lda $1d
BEE1: 29 01    and #$01
BEE3: F0 31    beq $bf16
BEE5: A6 CF    ldx $cf
BEE7: B5 4D    lda $4d, x
BEE9: C9 03    cmp #$03
BEEB: D0 07    bne $bef4
BEED: A5 10    lda $10
BEEF: 10 03    bpl $bef4
BEF1: 4C 17 BF jmp $bf17
BEF4: A5 11    lda $11
BEF6: C9 20    cmp #$20
BEF8: 90 02    bcc $befc
BEFA: 49 3F    eor #$3f
BEFC: C9 04    cmp #$04
BEFE: A9 FF    lda #$ff
BF00: 85 4B    sta $4b
BF02: 20 C5 C2 jsr $c2c5
BF05: B0 0F    bcs $bf16
BF07: A9 01    lda #$01
BF09: 8D 6E 04 sta $046e
BF0C: A6 2A    ldx $2a
BF0E: DE FB 02 dec $02fb, x
BF11: D0 03    bne $bf16
BF13: 4C 41 BF jmp $bf41
BF16: 60       rts
BF17: A5 11    lda $11
BF19: C9 20    cmp #$20
BF1B: 90 02    bcc $bf1f
BF1D: 49 3F    eor #$3f
BF1F: C9 1C    cmp #$1c
BF21: 4C FE BE jmp $befe
BF24: 60       rts
BF25: A9 00    lda #$00
BF27: 8D 6E 04 sta $046e
BF2A: 85 4B    sta $4b
BF2C: A5 10    lda $10
BF2E: F0 02    beq $bf32
BF30: 10 0E    bpl $bf40
BF32: A6 2A    ldx $2a
BF34: BD FB 02 lda $02fb, x
BF37: F0 07    beq $bf40
BF39: A5 30    lda $30
BF3B: D0 03    bne $bf40
BF3D: 4C E5 BE jmp $bee5
BF40: 60       rts
BF41: A5 D0    lda $d0
BF43: F0 35    beq $bf7a
BF45: F8       sed
BF46: A4 CF    ldy $cf
BF48: A9 00    lda #$00
BF4A: 18       clc
BF4B: 79 68 01 adc $0168, y
BF4E: 99 68 01 sta $0168, y
BF51: B9 6A 01 lda $016a, y
BF54: 69 25    adc #$25
BF56: 99 6A 01 sta $016a, y
BF59: B9 6C 01 lda $016c, y
BF5C: 69 00    adc #$00
BF5E: 99 6C 01 sta $016c, y
BF61: C9 02    cmp #$02
BF63: 90 11    bcc $bf76
BF65: B9 6A 01 lda $016a, y
BF68: C9 50    cmp #$50
BF6A: 90 0A    bcc $bf76
BF6C: A9 50    lda #$50
BF6E: 99 6A 01 sta $016a, y
BF71: A9 00    lda #$00
BF73: 99 68 01 sta $0168, y
BF76: D8       cld
BF77: 4C E7 E0 jmp $e0e7
BF7A: 60       rts
BF7B: A6 86    ldx $86
BF7D: BD 34 01 lda $0134, x
BF80: F0 23    beq $bfa5
BF82: A2 0E    ldx #$0e
BF84: A9 00    lda #$00
BF86: 1D BF 03 ora $03bf, x
BF89: CA       dex
BF8A: 10 FA    bpl $bf86
BF8C: AA       tax
BF8D: D0 16    bne $bfa5
BF8F: A2 05    ldx #$05
BF91: B5 80    lda $80, x
BF93: 95 0B    sta $0b, x
BF95: CA       dex
BF96: 10 F9    bpl $bf91
BF98: A9 FF    lda #$ff
BF9A: 85 30    sta $30
BF9C: 20 67 54 jsr $5467
BF9F: A6 CF    ldx $cf
BFA1: A9 1A    lda #$1a
BFA3: 95 00    sta $00, x
BFA5: 60       rts
BFA6: A6 CF    ldx $cf
BFA8: B5 4D    lda $4d, x
BFAA: AA       tax
BFAB: A5 10    lda $10
BFAD: 10 08    bpl $bfb7
BFAF: BD 07 C0 lda $c007, x
BFB2: C5 10    cmp $10
BFB4: 4C BA BF jmp $bfba
BFB7: DD F8 BF cmp $bff8, x
BFBA: A4 CF    ldy $cf
BFBC: 90 20    bcc $bfde
BFBE: A9 0E    lda #$0e
BFC0: 99 00 00 sta $0000, y
BFC3: BD 31 C1 lda $c131, x
BFC6: C9 A8    cmp #$a8
BFC8: F0 06    beq $bfd0
BFCA: 4C 25 C0 jmp $c025
BFCD: 4C DE BF jmp $bfde
BFD0: AD 43 01 lda $0143
BFD3: 30 06    bmi $bfdb
BFD5: 4C 25 C0 jmp $c025
BFD8: 4C DE BF jmp $bfde
BFDB: 4C 6F C0 jmp $c06f
BFDE: A5 0E    lda $0e
BFE0: 10 08    bpl $bfea
BFE2: A9 00    lda #$00
BFE4: 38       sec
BFE5: E5 0E    sbc $0e
BFE7: 38       sec
BFE8: E9 01    sbc #$01
BFEA: DD 16 C0 cmp $c016, x
BFED: 90 08    bcc $bff7
BFEF: A9 0E    lda #$0e
BFF1: 99 00 00 sta $0000, y
BFF4: 4C 25 C0 jmp $c025
BFF7: 60       rts
BFF8: 05 05    ora $05
BFFA: 05 05    ora $05
BFFC: 03 05    slo ($05, x)
BFFE: 05 05    ora $05
C000: 04 03    nop $03
C002: 05 05    ora $05
C004: 04 05    nop $05
C006: 03 FB    slo ($fb, x)
C008: FB FB FA isb $fafb, y
C00B: FB FA FA isb $fafa, y
C00E: FA       nop
C00F: FA       nop
C010: FA       nop
C011: FB FB FA isb $fafb, y
C014: FB FA 06 isb $06fa, y
C017: 06 06    asl $06
C019: 06 08    asl $08
C01B: 08       php
C01C: 08       php
C01D: 08       php
C01E: 08       php
C01F: 08       php
C020: 08       php
C021: 08       php
C022: 08       php
C023: 08       php
C024: 08       php
C025: A6 CF    ldx $cf
C027: B5 4D    lda $4d, x
C029: AA       tax
C02A: BD 31 C1 lda $c131, x
C02D: C9 A8    cmp #$a8
C02F: F0 0D    beq $c03e
C031: A9 00    lda #$00
C033: A2 07    ldx #$07
C035: 1D E4 02 ora $02e4, x
C038: CA       dex
C039: 10 FA    bpl $c035
C03B: AA       tax
C03C: D0 31    bne $c06f
C03E: A6 CF    ldx $cf
C040: B5 E9    lda $e9, x
C042: A0 00    ldy #$00
C044: 84 23    sty $23
C046: 94 E9    sty $e9, x
C048: 85 24    sta $24
C04A: 20 7D C3 jsr $c37d
C04D: A6 CF    ldx $cf
C04F: BD 7A 01 lda $017a, x
C052: D0 18    bne $c06c
C054: FE 7A 01 inc $017a, x
C057: B5 4D    lda $4d, x
C059: F0 11    beq $c06c
C05B: A8       tay
C05C: B9 80 C0 lda $c080, y
C05F: 85 7E    sta $7e
C061: A9 10    lda #$10
C063: 85 24    sta $24
C065: 20 7D C3 jsr $c37d
C068: C6 7E    dec $7e
C06A: 10 F9    bpl $c065
C06C: 4C 7F C0 jmp $c07f
C06F: A6 CF    ldx $cf
C071: B5 E9    lda $e9, x
C073: 48       pha
C074: B5 4D    lda $4d, x
C076: 0A       asl a
C077: 18       clc
C078: 65 CF    adc $cf
C07A: AA       tax
C07B: 68       pla
C07C: 9D 71 04 sta $0471, x
C07F: 60       rts
C080: 00       brk
C081: 01 05    ora ($05, x)
C083: 0B 13    anc #$13
C085: A2 0E    ldx #$0e
C087: A9 00    lda #$00
C089: 1D BF 03 ora $03bf, x
C08C: CA       dex
C08D: 10 FA    bpl $c089
C08F: A6 CF    ldx $cf
C091: 15 88    ora $88, x
C093: D0 1D    bne $c0b2
C095: A6 CF    ldx $cf
C097: B5 00    lda $00, x
C099: C9 08    cmp #$08
C09B: D0 0B    bne $c0a8
C09D: 20 56 53 jsr $5356
C0A0: 20 6F 53 jsr $536f
C0A3: A9 0C    lda #$0c
C0A5: 4C AA C0 jmp $c0aa
C0A8: A9 0A    lda #$0a
C0AA: A6 CF    ldx $cf
C0AC: 95 00    sta $00, x
C0AE: A9 FF    lda #$ff
C0B0: 85 30    sta $30
C0B2: 60       rts
C0B3: A6 CF    ldx $cf
C0B5: B5 F6    lda $f6, x
C0B7: 29 03    and #$03
C0B9: AA       tax
C0BA: BD 42 C1 lda $c142, x
C0BD: AA       tax
C0BE: A9 04    lda #$04
C0C0: 85 24    sta $24
C0C2: A4 CF    ldy $cf
C0C4: 8A       txa
C0C5: 0A       asl a
C0C6: 65 CF    adc $cf
C0C8: A8       tay
C0C9: B9 44 01 lda $0144, y
C0CC: 10 03    bpl $c0d1
C0CE: 4C D4 C0 jmp $c0d4
C0D1: 20 54 C1 jsr $c154
C0D4: CA       dex
C0D5: C6 24    dec $24
C0D7: 10 E9    bpl $c0c2
C0D9: 4C 45 C1 jmp $c145
C0DC: 01 FE    ora ($fe, x)
C0DE: FD 01 00 sbc $0001, x
C0E1: 01 FF    ora ($ff, x)
C0E3: FD FF 01 sbc $01ff, x
C0E6: 01 FE    ora ($fe, x)
C0E8: FD 01 00 sbc $0001, x
C0EB: 00       brk
C0EC: 00       brk
C0ED: F4 70    nop $70, x
C0EF: BC C2 37 ldy $37c2, x
C0F2: C2 9C    nop #$9c
C0F4: C0 40    cpy #$40
C0F6: C0 F4    cpy #$f4
C0F8: 70 BC    bvs $c0b6
C0FA: C2 37    nop #$37
C0FC: C8       iny
C0FD: C8       iny
C0FE: 40       rti
C0FF: 66 A8    ror $a8
C101: 60       rts
C102: A8       tay
C103: CE 58 14 dec $1458
C106: D0 60    bne $c168
C108: 40       rti
C109: 66 A8    ror $a8
C10B: 60       rts
C10C: A8       tay
C10D: 96 20    stx $20, y
C10F: 02       kil
C110: 02       kil
C111: FD FE FD sbc $fdfe, x
C114: FF 02 00 isb $0002, x
C117: FD 02 02 sbc $0202, x
C11A: 02       kil
C11B: FD FE FD sbc $fdfe, x
C11E: 00       brk
C11F: FF 50 50 isb $5050, x
C122: 50 50    bvc $c174
C124: 50 50    bvc $c176
C126: 50 50    bvc $c178
C128: 50 50    bvc $c17a
C12A: 50 50    bvc $c17c
C12C: 50 50    bvc $c17e
C12E: 50 20    bvc $c150
C130: 20 00 00 jsr $0000
C133: 00       brk
C134: 98       tya
C135: A8       tay
C136: 08       php
C137: 00       brk
C138: 00       brk
C139: 88       dey
C13A: A8       tay
C13B: 00       brk
C13C: 00       brk
C13D: 98       tya
C13E: 00       brk
C13F: A8       tay
C140: 40       rti
C141: 40       rti
C142: 04 09    nop $09
C144: 0E A6 CF asl $cfa6
C147: B5 F6    lda $f6, x
C149: 29 01    and #$01
C14B: F0 05    beq $c152
C14D: A2 10    ldx #$10
C14F: 4C 54 C1 jmp $c154
C152: A2 0F    ldx #$0f
C154: A5 0D    lda $0d
C156: 38       sec
C157: FD FE C0 sbc $c0fe, x
C15A: 85 38    sta $38
C15C: A5 0E    lda $0e
C15E: FD 0F C1 sbc $c10f, x
C161: 10 0A    bpl $c16d
C163: 49 FF    eor #$ff
C165: 48       pha
C166: A5 38    lda $38
C168: 49 FF    eor #$ff
C16A: 85 38    sta $38
C16C: 68       pla
C16D: 85 39    sta $39
C16F: A5 0F    lda $0f
C171: 38       sec
C172: FD ED C0 sbc $c0ed, x
C175: 85 3A    sta $3a
C177: A5 10    lda $10
C179: FD DC C0 sbc $c0dc, x
C17C: 10 0A    bpl $c188
C17E: 49 FF    eor #$ff
C180: 48       pha
C181: A5 3A    lda $3a
C183: 49 FF    eor #$ff
C185: 85 3A    sta $3a
C187: 68       pla
C188: 85 3B    sta $3b
C18A: D0 43    bne $c1cf
C18C: A5 3A    lda $3a
C18E: DD 20 C1 cmp $c120, x
C191: B0 3C    bcs $c1cf
C193: A5 39    lda $39
C195: D0 38    bne $c1cf
C197: A5 38    lda $38
C199: DD 20 C1 cmp $c120, x
C19C: B0 2F    bcs $c1cd
C19E: BD 31 C1 lda $c131, x
C1A1: 29 40    and #$40
C1A3: F0 0C    beq $c1b1
C1A5: 20 8A A5 jsr $a58a
C1A8: 20 C0 C8 jsr $c8c0
C1AB: 20 EB E0 jsr $e0eb
C1AE: 4C CD C1 jmp $c1cd
C1B1: A4 CF    ldy $cf
C1B3: BD 31 C1 lda $c131, x
C1B6: 10 0A    bpl $c1c2
C1B8: 29 20    and #$20
C1BA: F0 06    beq $c1c2
C1BC: B9 3C 01 lda $013c, y
C1BF: F0 01    beq $c1c2
C1C1: 60       rts
C1C2: 96 4D    stx $4d, y
C1C4: 20 31 5B jsr $5b31
C1C7: A9 06    lda #$06
C1C9: A6 CF    ldx $cf
C1CB: 95 00    sta $00, x
C1CD: A2 00    ldx #$00
C1CF: 60       rts
C1D0: B9 ED C0 lda $c0ed, y
C1D3: 85 38    sta $38
C1D5: B9 DC C0 lda $c0dc, y
C1D8: 85 39    sta $39
C1DA: B9 FE C0 lda $c0fe, y
C1DD: 85 3A    sta $3a
C1DF: B9 0F C1 lda $c10f, y
C1E2: 85 3B    sta $3b
C1E4: 60       rts
C1E5: A4 CF    ldy $cf
C1E7: B9 3C 01 lda $013c, y
C1EA: D0 3B    bne $c227
C1EC: A2 01    ldx #$01
C1EE: BD 34 01 lda $0134, x
C1F1: D0 31    bne $c224
C1F3: 20 6F A5 jsr $a56f
C1F6: 20 75 C2 jsr $c275
C1F9: 20 28 C2 jsr $c228
C1FC: A5 7F    lda $7f
C1FE: F0 24    beq $c224
C200: 86 86    stx $86
C202: A2 05    ldx #$05
C204: A9 00    lda #$00
C206: B5 0B    lda $0b, x
C208: 95 80    sta $80, x
C20A: CA       dex
C20B: 10 F7    bpl $c204
C20D: 20 8A C2 jsr $c28a
C210: 20 67 54 jsr $5467
C213: A4 CF    ldy $cf
C215: A9 1C    lda #$1c
C217: 99 00 00 sta $0000, y
C21A: 20 C2 E1 jsr $e1c2
C21D: 20 03 E1 jsr $e103
C220: 68       pla
C221: 68       pla
C222: A2 00    ldx #$00
C224: CA       dex
C225: 10 C7    bpl $c1ee
C227: 60       rts
C228: A9 00    lda #$00
C22A: 85 7F    sta $7f
C22C: A5 38    lda $38
C22E: 38       sec
C22F: E5 3C    sbc $3c
C231: 85 7B    sta $7b
C233: A5 39    lda $39
C235: E5 3D    sbc $3d
C237: 10 0A    bpl $c243
C239: 49 FF    eor #$ff
C23B: 48       pha
C23C: A5 7B    lda $7b
C23E: 49 FF    eor #$ff
C240: 85 7B    sta $7b
C242: 68       pla
C243: 85 7C    sta $7c
C245: A5 3A    lda $3a
C247: 38       sec
C248: E5 3E    sbc $3e
C24A: 85 7D    sta $7d
C24C: A5 3B    lda $3b
C24E: E5 3F    sbc $3f
C250: 10 0A    bpl $c25c
C252: 49 FF    eor #$ff
C254: 48       pha
C255: A5 7D    lda $7d
C257: 49 FF    eor #$ff
C259: 85 7D    sta $7d
C25B: 68       pla
C25C: 85 7E    sta $7e
C25E: D0 14    bne $c274
C260: A5 7D    lda $7d
C262: C9 50    cmp #$50
C264: B0 0E    bcs $c274
C266: A5 7C    lda $7c
C268: D0 0A    bne $c274
C26A: A5 7B    lda $7b
C26C: C9 50    cmp #$50
C26E: B0 04    bcs $c274
C270: A9 FF    lda #$ff
C272: 85 7F    sta $7f
C274: 60       rts
C275: BD 08 01 lda $0108, x
C278: 85 38    sta $38
C27A: BD 0C 01 lda $010c, x
C27D: 85 39    sta $39
C27F: BD 14 01 lda $0114, x
C282: 85 3A    sta $3a
C284: BD 18 01 lda $0118, x
C287: 85 3B    sta $3b
C289: 60       rts
C28A: A6 86    ldx $86
C28C: BD 0C 01 lda $010c, x
C28F: C5 10    cmp $10
C291: D0 05    bne $c298
C293: BD 08 01 lda $0108, x
C296: C5 0F    cmp $0f
C298: 90 05    bcc $c29f
C29A: A9 FE    lda #$fe
C29C: 4C A1 C2 jmp $c2a1
C29F: A9 01    lda #$01
C2A1: 85 10    sta $10
C2A3: 49 FF    eor #$ff
C2A5: 9D 0C 01 sta $010c, x
C2A8: BD 18 01 lda $0118, x
C2AB: C5 0E    cmp $0e
C2AD: D0 05    bne $c2b4
C2AF: BD 14 01 lda $0114, x
C2B2: C5 0D    cmp $0d
C2B4: 90 05    bcc $c2bb
C2B6: A9 FE    lda #$fe
C2B8: 4C BD C2 jmp $c2bd
C2BB: A9 01    lda #$01
C2BD: 85 0E    sta $0e
C2BF: 49 FF    eor #$ff
C2C1: 9D 18 01 sta $0118, x
C2C4: 60       rts
C2C5: A4 2A    ldy $2a
C2C7: B9 FB 02 lda $02fb, y
C2CA: 38       sec
C2CB: D0 01    bne $c2ce
C2CD: 60       rts
C2CE: 18       clc
C2CF: A9 10    lda #$10
C2D1: 65 44    adc $44
C2D3: 90 03    bcc $c2d8
C2D5: E6 45    inc $45
C2D7: 18       clc
C2D8: 71 6A    adc ($6a), y
C2DA: 85 44    sta $44
C2DC: A5 45    lda $45
C2DE: 69 00    adc #$00
C2E0: 85 45    sta $45
C2E2: A9 00    lda #$00
C2E4: 85 22    sta $22
C2E6: B1 68    lda ($68), y
C2E8: 85 21    sta $21
C2EA: A2 03    ldx #$03
C2EC: 06 21    asl $21
C2EE: 26 22    rol $22
C2F0: CA       dex
C2F1: 10 F9    bpl $c2ec
C2F3: A5 22    lda $22
C2F5: C9 08    cmp #$08
C2F7: 90 04    bcc $c2fd
C2F9: 09 F0    ora #$f0
C2FB: 85 22    sta $22
C2FD: A5 46    lda $46
C2FF: 18       clc
C300: 65 21    adc $21
C302: 85 46    sta $46
C304: A5 47    lda $47
C306: 65 22    adc $22
C308: 85 47    sta $47
C30A: A5 0D    lda $0d
C30C: 38       sec
C30D: E5 44    sbc $44
C30F: 85 21    sta $21
C311: A5 0E    lda $0e
C313: E5 45    sbc $45
C315: 10 0C    bpl $c323
C317: 49 FF    eor #$ff
C319: 85 22    sta $22
C31B: A5 21    lda $21
C31D: 49 FF    eor #$ff
C31F: 85 21    sta $21
C321: A5 22    lda $22
C323: F0 04    beq $c329
C325: 38       sec
C326: 4C 52 C3 jmp $c352
C329: A5 21    lda $21
C32B: C9 40    cmp #$40
C32D: B0 23    bcs $c352
C32F: A5 0F    lda $0f
C331: 38       sec
C332: E5 46    sbc $46
C334: 85 23    sta $23
C336: A5 10    lda $10
C338: E5 47    sbc $47
C33A: 10 0C    bpl $c348
C33C: 49 FF    eor #$ff
C33E: 85 24    sta $24
C340: A5 23    lda $23
C342: 49 FF    eor #$ff
C344: 85 23    sta $23
C346: A5 24    lda $24
C348: F0 04    beq $c34e
C34A: 38       sec
C34B: 4C 52 C3 jmp $c352
C34E: A5 23    lda $23
C350: C9 88    cmp #$88
C352: 60       rts
C353: A9 00    lda #$00
C355: 9D E4 02 sta $02e4, x
C358: 99 EC 02 sta $02ec, y
C35B: 20 BD BE jsr $bebd
C35E: 20 C0 C8 jsr $c8c0
C361: 20 EB E0 jsr $e0eb
C364: A2 06    ldx #$06
C366: AD EB 02 lda $02eb
C369: 1D E4 02 ora $02e4, x
C36C: CA       dex
C36D: 10 FA    bpl $c369
C36F: AA       tax
C370: D0 03    bne $c375
C372: 20 07 E1 jsr $e107
C375: A9 50    lda #$50
C377: 85 23    sta $23
C379: A9 02    lda #$02
C37B: 85 24    sta $24
C37D: A5 D0    lda $d0
C37F: F0 20    beq $c3a1
C381: F8       sed
C382: 18       clc
C383: A6 CF    ldx $cf
C385: A5 23    lda $23
C387: 7D 62 01 adc $0162, x
C38A: 9D 62 01 sta $0162, x
C38D: A5 24    lda $24
C38F: 7D 64 01 adc $0164, x
C392: 9D 64 01 sta $0164, x
C395: BD 66 01 lda $0166, x
C398: 69 00    adc #$00
C39A: 9D 66 01 sta $0166, x
C39D: 20 A2 C3 jsr $c3a2
C3A0: D8       cld
C3A1: 60       rts
C3A2: A5 F0    lda $f0
C3A4: 29 C0    and #$c0
C3A6: C9 C0    cmp #$c0
C3A8: F0 27    beq $c3d1
C3AA: BD 66 01 lda $0166, x
C3AD: DD 16 05 cmp $0516, x
C3B0: 90 1F    bcc $c3d1
C3B2: BD 64 01 lda $0164, x
C3B5: DD 14 05 cmp $0514, x
C3B8: 90 17    bcc $c3d1
C3BA: F6 42    inc $42, x
C3BC: 20 DB E0 jsr $e0db
C3BF: A5 F0    lda $f0
C3C1: 0A       asl a
C3C2: 2A       rol a
C3C3: 2A       rol a
C3C4: 29 03    and #$03
C3C6: A8       tay
C3C7: BD 16 05 lda $0516, x
C3CA: 18       clc
C3CB: 79 D2 C3 adc $c3d2, y
C3CE: 9D 16 05 sta $0516, x
C3D1: 60       rts
C3D2: 01 02    ora ($02, x)
C3D4: 03 A6    slo ($a6, x)
C3D6: CF B5 00 dcp $00b5
C3D9: C9 08    cmp #$08
C3DB: D0 0B    bne $c3e8
C3DD: B5 4D    lda $4d, x
C3DF: AA       tax
C3E0: BD 31 C1 lda $c131, x
C3E3: 29 08    and #$08
C3E5: F0 01    beq $c3e8
C3E7: 60       rts
C3E8: A5 4F    lda $4f
C3EA: 29 01    and #$01
C3EC: D0 33    bne $c421
C3EE: A2 03    ldx #$03
C3F0: BD 34 01 lda $0134, x
C3F3: F0 29    beq $c41e
C3F5: DE 34 01 dec $0134, x
C3F8: D0 24    bne $c41e
C3FA: E0 02    cpx #$02
C3FC: B0 1A    bcs $c418
C3FE: A4 CF    ldy $cf
C400: B9 3C 01 lda $013c, y
C403: D0 10    bne $c415
C405: B9 F6 00 lda $00f6, y
C408: 29 01    and #$01
C40A: D0 06    bne $c412
C40C: 20 37 54 jsr $5437
C40F: 4C 15 C4 jmp $c415
C412: 20 4C 54 jsr $544c
C415: 4C 1B C4 jmp $c41b
C418: 20 22 C4 jsr $c422
C41B: 20 04 9D jsr $9d04
C41E: CA       dex
C41F: 10 CF    bpl $c3f0
C421: 60       rts
C422: A9 F8    lda #$f8
C424: 9D 18 01 sta $0118, x
C427: 86 21    stx $21
C429: A6 CF    ldx $cf
C42B: A9 03    lda #$03
C42D: A6 21    ldx $21
C42F: 9D 0C 01 sta $010c, x
C432: AD 0A 60 lda $600a
C435: 9D 14 01 sta $0114, x
C438: 9D 08 01 sta $0108, x
C43B: 60       rts
C43C: 03 A6    slo ($a6, x)
C43E: 35 A5    and $a5, x
C440: 1D 29 02 ora $0229, x
C443: 85 35    sta $35
C445: D0 01    bne $c448
C447: 60       rts
C448: 8A       txa
C449: 29 02    and #$02
C44B: F0 01    beq $c44e
C44D: 60       rts
C44E: A5 1D    lda $1d
C450: 29 01    and #$01
C452: F0 01    beq $c455
C454: 60       rts
C455: A2 03    ldx #$03
C457: BD EC 02 lda $02ec, x
C45A: F0 03    beq $c45f
C45C: 4C DC C4 jmp $c4dc
C45F: 20 DF E0 jsr $e0df
C462: A5 10    lda $10
C464: 9D 08 02 sta $0208, x
C467: A5 0F    lda $0f
C469: 9D 1F 02 sta $021f, x
C46C: A5 0E    lda $0e
C46E: 9D 4D 02 sta $024d, x
C471: A5 0D    lda $0d
C473: 9D 64 02 sta $0264, x
C476: A9 00    lda #$00
C478: 9D 7B 02 sta $027b, x
C47B: 9D 36 02 sta $0236, x
C47E: A4 CF    ldy $cf
C480: B9 00 00 lda $0000, y
C483: C9 18    cmp #$18
C485: D0 05    bne $c48c
C487: A9 0E    lda #$0e
C489: 4C 8E C4 jmp $c48e
C48C: A9 38    lda #$38
C48E: 9D EC 02 sta $02ec, x
C491: A4 11    ldy $11
C493: B9 FF C7 lda $c7ff, y
C496: 18       clc
C497: 65 17    adc $17
C499: 9D A8 02 sta $02a8, x
C49C: B9 8F C7 lda $c78f, y
C49F: 65 16    adc $16
C4A1: 9D 8A 02 sta $028a, x
C4A4: B9 2F C8 lda $c82f, y
C4A7: 18       clc
C4A8: 65 14    adc $14
C4AA: 9D D5 02 sta $02d5, x
C4AD: B9 BF C7 lda $c7bf, y
C4B0: 65 13    adc $13
C4B2: 9D B7 02 sta $02b7, x
C4B5: A0 FF    ldy #$ff
C4B7: BD 8A 02 lda $028a, x
C4BA: 10 07    bpl $c4c3
C4BC: 98       tya
C4BD: 9D 99 02 sta $0299, x
C4C0: 4C C9 C4 jmp $c4c9
C4C3: C8       iny
C4C4: 98       tya
C4C5: 9D 99 02 sta $0299, x
C4C8: 88       dey
C4C9: BD B7 02 lda $02b7, x
C4CC: 10 07    bpl $c4d5
C4CE: 98       tya
C4CF: 9D C6 02 sta $02c6, x
C4D2: 4C DA C4 jmp $c4da
C4D5: C8       iny
C4D6: 98       tya
C4D7: 9D C6 02 sta $02c6, x
C4DA: A2 00    ldx #$00
C4DC: CA       dex
C4DD: 30 03    bmi $c4e2
C4DF: 4C 57 C4 jmp $c457
C4E2: 60       rts
C4E3: AD 7D 01 lda $017d
C4E6: 29 01    and #$01
C4E8: F0 03    beq $c4ed
C4EA: 4C 55 C4 jmp $c455
C4ED: 60       rts
C4EE: A5 37    lda $37
C4F0: D0 4E    bne $c540
C4F2: AD 0A 60 lda $600a
C4F5: A6 CF    ldx $cf
C4F7: D5 E7    cmp $e7, x
C4F9: B0 45    bcs $c540
C4FB: B5 4D    lda $4d, x
C4FD: C9 03    cmp #$03
C4FF: D0 03    bne $c504
C501: 4C 41 C5 jmp $c541
C504: AD 0A 60 lda $600a
C507: 10 04    bpl $c50d
C509: 38       sec
C50A: 4C 0E C5 jmp $c50e
C50D: 18       clc
C50E: 29 03    and #$03
C510: 65 2A    adc $2a
C512: AA       tax
C513: CA       dex
C514: 8A       txa
C515: 4A       lsr a
C516: 29 07    and #$07
C518: A8       tay
C519: A9 07    lda #$07
C51B: 85 21    sta $21
C51D: B9 E4 02 lda $02e4, y
C520: F0 15    beq $c537
C522: A6 ED    ldx $ed
C524: BD F0 02 lda $02f0, x
C527: D0 08    bne $c531
C529: A9 03    lda #$03
C52B: 99 8F 04 sta $048f, y
C52E: 4C 8F C6 jmp $c68f
C531: CA       dex
C532: 10 F0    bpl $c524
C534: 4C 3C C5 jmp $c53c
C537: 88       dey
C538: 10 02    bpl $c53c
C53A: A0 07    ldy #$07
C53C: C6 21    dec $21
C53E: 10 DD    bpl $c51d
C540: 60       rts
C541: A2 00    ldx #$00
C543: A5 10    lda $10
C545: 10 01    bpl $c548
C547: E8       inx
C548: A5 0E    lda $0e
C54A: 10 02    bpl $c54e
C54C: E8       inx
C54D: E8       inx
C54E: 8A       txa
C54F: 0A       asl a
C550: 85 21    sta $21
C552: A5 4F    lda $4f
C554: 29 01    and #$01
C556: 18       clc
C557: 65 21    adc $21
C559: A8       tay
C55A: B9 86 C5 lda $c586, y
C55D: A8       tay
C55E: A9 07    lda #$07
C560: 85 21    sta $21
C562: B9 E4 02 lda $02e4, y
C565: F0 15    beq $c57c
C567: A6 ED    ldx $ed
C569: BD F0 02 lda $02f0, x
C56C: D0 08    bne $c576
C56E: A9 03    lda #$03
C570: 99 8F 04 sta $048f, y
C573: 4C 8F C6 jmp $c68f
C576: CA       dex
C577: 10 F0    bpl $c569
C579: 4C 81 C5 jmp $c581
C57C: 88       dey
C57D: 10 02    bpl $c581
C57F: A0 07    ldy #$07
C581: C6 21    dec $21
C583: 10 DD    bpl $c562
C585: 60       rts
C586: 06 07    asl $07
C588: 05 07    ora $07
C58A: 00       brk
C58B: 04 01    nop $01
C58D: 03 A6    slo ($a6, x)
C58F: CF BD 3C dcp $3cbd
C592: 01 D0    ora ($d0, x)
C594: 08       php
C595: A2 01    ldx #$01
C597: 20 9E C5 jsr $c59e
C59A: CA       dex
C59B: 10 FA    bpl $c597
C59D: 60       rts
C59E: A4 CF    ldy $cf
C5A0: B9 88 00 lda $0088, y
C5A3: F0 20    beq $c5c5
C5A5: BD 34 01 lda $0134, x
C5A8: D0 1B    bne $c5c5
C5AA: BD F9 02 lda $02f9, x
C5AD: D0 16    bne $c5c5
C5AF: A5 CF    lda $cf
C5B1: D0 05    bne $c5b8
C5B3: A4 49    ldy $49
C5B5: 4C BA C5 jmp $c5ba
C5B8: A4 4A    ldy $4a
C5BA: AD 0A 60 lda $600a
C5BD: D9 C6 C5 cmp $c5c6, y
C5C0: B0 03    bcs $c5c5
C5C2: 4C CE C5 jmp $c5ce
C5C5: 60       rts
C5C6: 08       php
C5C7: 10 20    bpl $c5e9
C5C9: 40       rti
C5CA: 50 60    bvc $c62c
C5CC: 70 80    bvs $c54e
C5CE: 86 21    stx $21
C5D0: BD 08 01 lda $0108, x
C5D3: 9D 2C 02 sta $022c, x
C5D6: 85 38    sta $38
C5D8: BD 0C 01 lda $010c, x
C5DB: 9D 15 02 sta $0215, x
C5DE: 85 39    sta $39
C5E0: BD 14 01 lda $0114, x
C5E3: 9D 71 02 sta $0271, x
C5E6: 85 3A    sta $3a
C5E8: BD 18 01 lda $0118, x
C5EB: 9D 5A 02 sta $025a, x
C5EE: 85 3B    sta $3b
C5F0: 20 6F A5 jsr $a56f
C5F3: 20 99 A4 jsr $a499
C5F6: A5 55    lda $55
C5F8: 0A       asl a
C5F9: A8       tay
C5FA: A5 38    lda $38
C5FC: 38       sec
C5FD: E5 3A    sbc $3a
C5FF: A5 39    lda $39
C601: E5 3B    sbc $3b
C603: 10 01    bpl $c606
C605: C8       iny
C606: B9 7E C6 lda $c67e, y
C609: 85 22    sta $22
C60B: AD 0A 60 lda $600a
C60E: 29 07    and #$07
C610: 18       clc
C611: 65 22    adc $22
C613: A8       tay
C614: A6 21    ldx $21
C616: B9 2F C8 lda $c82f, y
C619: 9D E2 02 sta $02e2, x
C61C: B9 BF C7 lda $c7bf, y
C61F: 9D C4 02 sta $02c4, x
C622: B9 FF C7 lda $c7ff, y
C625: 9D B5 02 sta $02b5, x
C628: B9 8F C7 lda $c78f, y
C62B: 9D 97 02 sta $0297, x
C62E: 48       pha
C62F: A0 FF    ldy #$ff
C631: 68       pla
C632: 10 04    bpl $c638
C634: 98       tya
C635: 4C 3B C6 jmp $c63b
C638: C8       iny
C639: 98       tya
C63A: 88       dey
C63B: 9D A6 02 sta $02a6, x
C63E: BD C4 02 lda $02c4, x
C641: 10 04    bpl $c647
C643: 98       tya
C644: 4C 49 C6 jmp $c649
C647: C8       iny
C648: 98       tya
C649: 9D D3 02 sta $02d3, x
C64C: A5 CF    lda $cf
C64E: D0 05    bne $c655
C650: A5 00    lda $00
C652: 4C 57 C6 jmp $c657
C655: A5 01    lda $01
C657: C9 18    cmp #$18
C659: 90 0E    bcc $c669
C65B: C9 1C    cmp #$1c
C65D: D0 05    bne $c664
C65F: A9 30    lda #$30
C661: 4C 66 C6 jmp $c666
C664: A9 0A    lda #$0a
C666: 4C 77 C6 jmp $c677
C669: A5 CF    lda $cf
C66B: D0 05    bne $c672
C66D: A4 4D    ldy $4d
C66F: 4C 74 C6 jmp $c674
C672: A4 4E    ldy $4e
C674: B9 86 C6 lda $c686, y
C677: 9D F9 02 sta $02f9, x
C67A: 20 E3 E0 jsr $e0e3
C67D: 60       rts
C67E: 20 28 38 jsr $3828
C681: 30 10    bmi $c693
C683: 18       clc
C684: 00       brk
C685: 08       php
C686: 28       plp
C687: 28       plp
C688: 1C 00 00 nop $0000, x
C68B: 08       php
C68C: 18       clc
C68D: 28       plp
C68E: 00       brk
C68F: A9 00    lda #$00
C691: 9D 3A 02 sta $023a, x
C694: 9D 7F 02 sta $027f, x
C697: B9 17 02 lda $0217, y
C69A: 9D 23 02 sta $0223, x
C69D: B9 00 02 lda $0200, y
C6A0: 9D 0C 02 sta $020c, x
C6A3: B9 5C 02 lda $025c, y
C6A6: 9D 68 02 sta $0268, x
C6A9: B9 45 02 lda $0245, y
C6AC: 9D 51 02 sta $0251, x
C6AF: AD 0A 60 lda $600a
C6B2: 10 05    bpl $c6b9
C6B4: 98       tya
C6B5: 18       clc
C6B6: 69 08    adc #$08
C6B8: A8       tay
C6B9: B1 70    lda ($70), y
C6BB: 9D F0 02 sta $02f0, x
C6BE: B1 72    lda ($72), y
C6C0: 85 21    sta $21
C6C2: AD 0A 60 lda $600a
C6C5: 31 74    and ($74), y
C6C7: 18       clc
C6C8: 65 21    adc $21
C6CA: 29 3F    and #$3f
C6CC: A8       tay
C6CD: B9 2F C8 lda $c82f, y
C6D0: 9D D9 02 sta $02d9, x
C6D3: B9 BF C7 lda $c7bf, y
C6D6: 9D BB 02 sta $02bb, x
C6D9: B9 FF C7 lda $c7ff, y
C6DC: 9D AC 02 sta $02ac, x
C6DF: B9 8F C7 lda $c78f, y
C6E2: 9D 8E 02 sta $028e, x
C6E5: 48       pha
C6E6: A0 FF    ldy #$ff
C6E8: 68       pla
C6E9: 10 04    bpl $c6ef
C6EB: 98       tya
C6EC: 4C F2 C6 jmp $c6f2
C6EF: C8       iny
C6F0: 98       tya
C6F1: 88       dey
C6F2: 9D 9D 02 sta $029d, x
C6F5: BD BB 02 lda $02bb, x
C6F8: 10 04    bpl $c6fe
C6FA: 98       tya
C6FB: 4C 00 C7 jmp $c700
C6FE: C8       iny
C6FF: 98       tya
C700: 9D CA 02 sta $02ca, x
C703: 20 E3 E0 jsr $e0e3
C706: 60       rts
C707: A2 0E    ldx #$0e
C709: BD EC 02 lda $02ec, x
C70C: F0 6E    beq $c77c
C70E: BD 36 02 lda $0236, x
C711: 18       clc
C712: 7D A8 02 adc $02a8, x
C715: 9D 36 02 sta $0236, x
C718: BD 1F 02 lda $021f, x
C71B: 7D 8A 02 adc $028a, x
C71E: 9D 1F 02 sta $021f, x
C721: BD 08 02 lda $0208, x
C724: 7D 99 02 adc $0299, x
C727: 9D 08 02 sta $0208, x
C72A: 10 0C    bpl $c738
C72C: C9 FA    cmp #$fa
C72E: B0 05    bcs $c735
C730: A9 01    lda #$01
C732: 9D EC 02 sta $02ec, x
C735: 4C 41 C7 jmp $c741
C738: C9 06    cmp #$06
C73A: 90 05    bcc $c741
C73C: A9 01    lda #$01
C73E: 9D EC 02 sta $02ec, x
C741: BD 7B 02 lda $027b, x
C744: 18       clc
C745: 7D D5 02 adc $02d5, x
C748: 9D 7B 02 sta $027b, x
C74B: BD 64 02 lda $0264, x
C74E: 7D B7 02 adc $02b7, x
C751: 9D 64 02 sta $0264, x
C754: BD 4D 02 lda $024d, x
C757: 7D C6 02 adc $02c6, x
C75A: 9D 4D 02 sta $024d, x
C75D: 10 0C    bpl $c76b
C75F: C9 F8    cmp #$f8
C761: B0 05    bcs $c768
C763: A9 01    lda #$01
C765: 9D EC 02 sta $02ec, x
C768: 4C 74 C7 jmp $c774
C76B: C9 08    cmp #$08
C76D: 90 05    bcc $c774
C76F: A9 01    lda #$01
C771: 9D EC 02 sta $02ec, x
C774: DE EC 02 dec $02ec, x
C777: D0 03    bne $c77c
C779: 20 80 C7 jsr $c780
C77C: CA       dex
C77D: 10 8A    bpl $c709
C77F: 60       rts
C780: A9 00    lda #$00
C782: 9D 08 02 sta $0208, x
C785: 9D 4D 02 sta $024d, x
C788: 9D 1F 02 sta $021f, x
C78B: 9D 64 02 sta $0264, x
C78E: 60       rts
C78F: 10 0F    bpl $c7a0
C791: 0F 0E 0E slo $0e0e
C794: 0D 0C 0B ora $0b0c
C797: 0A       asl a
C798: 08       php
C799: 07 06    slo $06
C79B: 04 03    nop $03
C79D: 01 00    ora ($00, x)
C79F: 00       brk
C7A0: FE FD FB inc $fbfd, x
C7A3: F9 F8 F7 sbc $f7f8, y
C7A6: F5 F4    sbc $f4, x
C7A8: F3 F2    isb ($f2), y
C7AA: F1 F1    sbc ($f1), y
C7AC: F0 F0    beq $c79e
C7AE: F0 F0    beq $c7a0
C7B0: F0 F0    beq $c7a2
C7B2: F1 F1    sbc ($f1), y
C7B4: F2       kil
C7B5: F3 F4    isb ($f4), y
C7B7: F5 F7    sbc $f7, x
C7B9: F8       sed
C7BA: F9 FB FD sbc $fdfb, y
C7BD: FE FF 00 inc $00ff, x
C7C0: 01 03    ora ($03, x)
C7C2: 04 06    nop $06
C7C4: 07 08    slo $08
C7C6: 0A       asl a
C7C7: 0B 0C    anc #$0c
C7C9: 0D 0E 0E ora $0e0e
C7CC: 0F 0F 0F slo $0f0f
C7CF: 10 0F    bpl $c7e0
C7D1: 0F 0E 0E slo $0e0e
C7D4: 0D 0C 0B ora $0b0c
C7D7: 0A       asl a
C7D8: 08       php
C7D9: 07 06    slo $06
C7DB: 04 03    nop $03
C7DD: 01 00    ora ($00, x)
C7DF: 00       brk
C7E0: FE FD FB inc $fbfd, x
C7E3: F9 F8 F7 sbc $f7f8, y
C7E6: F5 F4    sbc $f4, x
C7E8: F3 F2    isb ($f2), y
C7EA: F1 F1    sbc ($f1), y
C7EC: F0 F0    beq $c7de
C7EE: F0 F0    beq $c7e0
C7F0: F0 F0    beq $c7e2
C7F2: F1 F1    sbc ($f1), y
C7F4: F2       kil
C7F5: F3 F4    isb ($f4), y
C7F7: F5 F7    sbc $f7, x
C7F9: F8       sed
C7FA: F9 FB FD sbc $fdfb, y
C7FD: FE FF 00 inc $00ff, x
C800: B0 50    bcs $c852
C802: D0 20    bne $c824
C804: 50 60    bvc $c866
C806: 50 20    bvc $c828
C808: E0 90    cpx #$90
C80A: 20 A0 20 jsr $20a0
C80D: 90 10    bcc $c81f
C80F: 00       brk
C810: 70 E0    bvs $c7f2
C812: 60       rts
C813: E0 70    cpx #$70
C815: 20 E0 B0 jsr $b0e0
C818: A0 B0    ldy #$b0
C81A: E0 30    cpx #$30
C81C: B0 50    bcs $c86e
C81E: 10 00    bpl $c820
C820: 50 B0    bvc $c7d2
C822: 30 E0    bmi $c804
C824: B0 A0    bcs $c7c6
C826: B0 E0    bcs $c808
C828: 20 70 E0 jsr $e070
C82B: 60       rts
C82C: E0 70    cpx #$70
C82E: FF 00 90 isb $9000, x
C831: 20 A0 20 jsr $20a0
C834: 90 E0    bcc $c816
C836: 20 50 60 jsr $6050
C839: 50 20    bvc $c85b
C83B: D0 50    bne $c88d
C83D: B0 F0    bcs $c82f
C83F: 00       brk
C840: B0 50    bcs $c892
C842: D0 20    bne $c864
C844: 50 60    bvc $c8a6
C846: 50 20    bvc $c868
C848: E0 90    cpx #$90
C84A: 20 A0 20 jsr $20a0
C84D: 90 10    bcc $c85f
C84F: 00       brk
C850: 70 E0    bvs $c832
C852: 60       rts
C853: E0 70    cpx #$70
C855: 20 E0 B0 jsr $b0e0
C858: A0 B0    ldy #$b0
C85A: E0 30    cpx #$30
C85C: B0 50    bcs $c8ae
C85E: 10 00    bpl $c860
C860: 50 B0    bvc $c812
C862: 30 E0    bmi $c844
C864: B0 A0    bcs $c806
C866: B0 E0    bcs $c848
C868: 20 70 E0 jsr $e070
C86B: 60       rts
C86C: E0 70    cpx #$70
C86E: FF A2 07 isb $07a2, x
C871: A5 4F    lda $4f
C873: 29 01    and #$01
C875: D0 02    bne $c879
C877: A2 0F    ldx #$0f
C879: A0 07    ldy #$07
C87B: BD BF 03 lda $03bf, x
C87E: F0 3B    beq $c8bb
C880: BD 29 03 lda $0329, x
C883: 18       clc
C884: 7D 83 03 adc $0383, x
C887: 9D 29 03 sta $0329, x
C88A: BD 1A 03 lda $031a, x
C88D: 7D 74 03 adc $0374, x
C890: 9D 1A 03 sta $031a, x
C893: BD 0B 03 lda $030b, x
C896: 7D 65 03 adc $0365, x
C899: 9D 0B 03 sta $030b, x
C89C: BD 56 03 lda $0356, x
C89F: 18       clc
C8A0: 7D B0 03 adc $03b0, x
C8A3: 9D 56 03 sta $0356, x
C8A6: BD 47 03 lda $0347, x
C8A9: 7D A1 03 adc $03a1, x
C8AC: 9D 47 03 sta $0347, x
C8AF: BD 38 03 lda $0338, x
C8B2: 7D 92 03 adc $0392, x
C8B5: 9D 38 03 sta $0338, x
C8B8: DE BF 03 dec $03bf, x
C8BB: CA       dex
C8BC: 88       dey
C8BD: 10 BC    bpl $c87b
C8BF: 60       rts
C8C0: A4 87    ldy $87
C8C2: C8       iny
C8C3: C0 03    cpy #$03
C8C5: 90 02    bcc $c8c9
C8C7: A0 00    ldy #$00
C8C9: 84 87    sty $87
C8CB: A9 04    lda #$04
C8CD: 85 23    sta $23
C8CF: B9 FD C8 lda $c8fd, y
C8D2: A8       tay
C8D3: A5 38    lda $38
C8D5: 99 1A 03 sta $031a, y
C8D8: A5 39    lda $39
C8DA: 99 0B 03 sta $030b, y
C8DD: A5 3A    lda $3a
C8DF: 99 47 03 sta $0347, y
C8E2: A5 3B    lda $3b
C8E4: 99 38 03 sta $0338, y
C8E7: AD 0A 60 lda $600a
C8EA: 29 3F    and #$3f
C8EC: 09 08    ora #$08
C8EE: 99 BF 03 sta $03bf, y
C8F1: 20 64 C9 jsr $c964
C8F4: 20 6B C9 jsr $c96b
C8F7: C8       iny
C8F8: C6 23    dec $23
C8FA: 10 D7    bpl $c8d3
C8FC: 60       rts
C8FD: 00       brk
C8FE: 05 0A    ora $0a
C900: A9 F8    lda #$f8
C902: 99 A1 03 sta $03a1, y
C905: AD 0A 60 lda $600a
C908: 99 B0 03 sta $03b0, y
C90B: 29 07    and #$07
C90D: 18       clc
C90E: 79 A1 03 adc $03a1, y
C911: 99 A1 03 sta $03a1, y
C914: A9 FF    lda #$ff
C916: 99 92 03 sta $0392, y
C919: 60       rts
C91A: A9 00    lda #$00
C91C: 99 92 03 sta $0392, y
C91F: 99 A1 03 sta $03a1, y
C922: AD 0A 60 lda $600a
C925: 99 B0 03 sta $03b0, y
C928: 29 07    and #$07
C92A: 18       clc
C92B: 79 A1 03 adc $03a1, y
C92E: 99 A1 03 sta $03a1, y
C931: 60       rts
C932: A9 00    lda #$00
C934: 99 65 03 sta $0365, y
C937: 99 74 03 sta $0374, y
C93A: AD 0A 60 lda $600a
C93D: 99 83 03 sta $0383, y
C940: 29 07    and #$07
C942: 18       clc
C943: 79 74 03 adc $0374, y
C946: 99 74 03 sta $0374, y
C949: 60       rts
C94A: A9 F8    lda #$f8
C94C: 99 74 03 sta $0374, y
C94F: AD 0A 60 lda $600a
C952: 99 83 03 sta $0383, y
C955: 29 07    and #$07
C957: 18       clc
C958: 79 74 03 adc $0374, y
C95B: 99 74 03 sta $0374, y
C95E: A9 FF    lda #$ff
C960: 99 65 03 sta $0365, y
C963: 60       rts
C964: AD 0A 60 lda $600a
C967: 30 E1    bmi $c94a
C969: 10 C7    bpl $c932
C96B: AD 0A 60 lda $600a
C96E: 30 90    bmi $c900
C970: 10 A8    bpl $c91a
C972: A6 CF    ldx $cf
C974: B5 4D    lda $4d, x
C976: AA       tax
C977: BD 31 C1 lda $c131, x
C97A: 29 20    and #$20
C97C: D0 39    bne $c9b7
C97E: A9 00    lda #$00
C980: A2 07    ldx #$07
C982: 1D E4 02 ora $02e4, x
C985: CA       dex
C986: 10 FA    bpl $c982
C988: A0 40    ldy #$40
C98A: AA       tax
C98B: D0 0E    bne $c99b
C98D: 98       tya
C98E: 05 F2    ora $f2
C990: 85 F2    sta $f2
C992: A9 FD    lda #$fd
C994: 25 F5    and $f5
C996: 85 F5    sta $f5
C998: 4C B4 C9 jmp $c9b4
C99B: 98       tya
C99C: 49 FF    eor #$ff
C99E: 25 F2    and $f2
C9A0: 85 F2    sta $f2
C9A2: A5 D0    lda $d0
C9A4: F0 0E    beq $c9b4
C9A6: A5 F0    lda $f0
C9A8: 29 C0    and #$c0
C9AA: C9 C0    cmp #$c0
C9AC: F0 06    beq $c9b4
C9AE: A9 02    lda #$02
C9B0: 05 F5    ora $f5
C9B2: 85 F5    sta $f5
C9B4: 4C C7 C9 jmp $c9c7
C9B7: AD 43 01 lda $0143
C9BA: 10 05    bpl $c9c1
C9BC: A9 10    lda #$10
C9BE: 4C C3 C9 jmp $c9c3
C9C1: A9 04    lda #$04
C9C3: 05 F2    ora $f2
C9C5: 85 F2    sta $f2
C9C7: 60       rts
C9C8: A2 01    ldx #$01
C9CA: 86 21    stx $21
C9CC: A5 D0    lda $d0
C9CE: D0 01    bne $c9d1
C9D0: 60       rts
C9D1: A9 FF    lda #$ff
C9D3: 85 4D    sta $4d
C9D5: 85 4E    sta $4e
C9D7: A6 21    ldx $21
C9D9: A0 07    ldy #$07
C9DB: BD 66 01 lda $0166, x
C9DE: D9 2E 04 cmp $042e, y
C9E1: D0 11    bne $c9f4
C9E3: BD 64 01 lda $0164, x
C9E6: D9 26 04 cmp $0426, y
C9E9: D0 09    bne $c9f4
C9EB: BD 62 01 lda $0162, x
C9EE: D9 1E 04 cmp $041e, y
C9F1: D0 01    bne $c9f4
C9F3: 18       clc
C9F4: 90 5E    bcc $ca54
C9F6: A9 1E    lda #$1e
C9F8: 85 00    sta $00
C9FA: 85 01    sta $01
C9FC: A9 00    lda #$00
C9FE: 85 38    sta $38
CA00: 85 39    sta $39
CA02: 85 3A    sta $3a
CA04: 94 4D    sty $4d, x
CA06: BD 62 01 lda $0162, x
CA09: 85 7B    sta $7b
CA0B: BD 64 01 lda $0164, x
CA0E: 85 7C    sta $7c
CA10: BD 66 01 lda $0166, x
CA13: 85 7D    sta $7d
CA15: A5 38    lda $38
CA17: BE 46 04 ldx $0446, y
CA1A: 99 46 04 sta $0446, y
CA1D: 86 38    stx $38
CA1F: A5 39    lda $39
CA21: BE 3E 04 ldx $043e, y
CA24: 99 3E 04 sta $043e, y
CA27: 86 39    stx $39
CA29: A5 3A    lda $3a
CA2B: BE 36 04 ldx $0436, y
CA2E: 99 36 04 sta $0436, y
CA31: 86 3A    stx $3a
CA33: A5 7B    lda $7b
CA35: BE 1E 04 ldx $041e, y
CA38: 99 1E 04 sta $041e, y
CA3B: 86 7B    stx $7b
CA3D: A5 7C    lda $7c
CA3F: BE 26 04 ldx $0426, y
CA42: 99 26 04 sta $0426, y
CA45: 86 7C    stx $7c
CA47: A5 7D    lda $7d
CA49: BE 2E 04 ldx $042e, y
CA4C: 99 2E 04 sta $042e, y
CA4F: 86 7D    stx $7d
CA51: 88       dey
CA52: 10 C1    bpl $ca15
CA54: 88       dey
CA55: 10 84    bpl $c9db
CA57: C6 21    dec $21
CA59: 30 03    bmi $ca5e
CA5B: 4C D7 C9 jmp $c9d7
CA5E: A5 4D    lda $4d
CA60: 30 06    bmi $ca68
CA62: C5 4E    cmp $4e
CA64: 90 02    bcc $ca68
CA66: C6 4E    dec $4e
CA68: A5 CF    lda $cf
CA6A: 49 01    eor #$01
CA6C: 0A       asl a
CA6D: 0A       asl a
CA6E: 05 CF    ora $cf
CA70: 69 05    adc #$05
CA72: 85 41    sta $41
CA74: A0 16    ldy #$16
CA76: A5 41    lda $41
CA78: F0 22    beq $ca9c
CA7A: 29 03    and #$03
CA7C: 85 CF    sta $cf
CA7E: C6 CF    dec $cf
CA80: 46 41    lsr $41
CA82: 46 41    lsr $41
CA84: A6 CF    ldx $cf
CA86: B5 4D    lda $4d, x
CA88: 30 0F    bmi $ca99
CA8A: 85 4C    sta $4c
CA8C: A9 3C    lda #$3c
CA8E: 85 7A    sta $7a
CA90: A9 02    lda #$02
CA92: 85 37    sta $37
CA94: A0 1E    ldy #$1e
CA96: 84 00    sty $00
CA98: 60       rts
CA99: 4C 74 CA jmp $ca74
CA9C: A2 00    ldx #$00
CA9E: 86 CF    stx $cf
CAA0: CA       dex
CAA1: 86 3F    stx $3f
CAA3: 84 00    sty $00
CAA5: 60       rts
CAA6: A2 08    ldx #$08
CAA8: A0 07    ldy #$07
CAAA: BD 5A 04 lda $045a, x
CAAD: 1D 59 04 ora $0459, x
CAB0: 1D 58 04 ora $0458, x
CAB3: F0 29    beq $cade
CAB5: BD 5A 04 lda $045a, x
CAB8: 99 1E 04 sta $041e, y
CABB: BD 63 04 lda $0463, x
CABE: 99 46 04 sta $0446, y
CAC1: CA       dex
CAC2: BD 5A 04 lda $045a, x
CAC5: 99 26 04 sta $0426, y
CAC8: BD 63 04 lda $0463, x
CACB: 99 3E 04 sta $043e, y
CACE: CA       dex
CACF: BD 5A 04 lda $045a, x
CAD2: 99 2E 04 sta $042e, y
CAD5: BD 63 04 lda $0463, x
CAD8: 99 36 04 sta $0436, y
CADB: 4C E0 CA jmp $cae0
CADE: CA       dex
CADF: CA       dex
CAE0: 88       dey
CAE1: CA       dex
CAE2: 10 C6    bpl $caaa
CAE4: 60       rts
CAE5: A2 08    ldx #$08
CAE7: A0 07    ldy #$07
CAE9: B9 1E 04 lda $041e, y
CAEC: 9D 5A 04 sta $045a, x
CAEF: B9 46 04 lda $0446, y
CAF2: 9D 63 04 sta $0463, x
CAF5: CA       dex
CAF6: B9 26 04 lda $0426, y
CAF9: 9D 5A 04 sta $045a, x
CAFC: B9 3E 04 lda $043e, y
CAFF: 9D 63 04 sta $0463, x
CB02: CA       dex
CB03: B9 2E 04 lda $042e, y
CB06: 9D 5A 04 sta $045a, x
CB09: B9 36 04 lda $0436, y
CB0C: 9D 63 04 sta $0463, x
CB0F: 88       dey
CB10: CA       dex
CB11: 10 D6    bpl $cae9
CB13: 60       rts
CB14: A5 4F    lda $4f
CB16: 29 1F    and #$1f
CB18: D0 12    bne $cb2c
CB1A: C6 7A    dec $7a
CB1C: D0 0E    bne $cb2c
CB1E: A6 CF    ldx $cf
CB20: B5 4D    lda $4d, x
CB22: C9 05    cmp #$05
CB24: 90 03    bcc $cb29
CB26: 20 E2 E4 jsr $e4e2
CB29: 4C 74 CA jmp $ca74
CB2C: A9 40    lda #$40
CB2E: 85 30    sta $30
CB30: A9 01    lda #$01
CB32: 85 CE    sta $ce
CB34: A6 4C    ldx $4c
CB36: 20 71 CB jsr $cb71
CB39: A6 35    ldx $35
CB3B: A5 1D    lda $1d
CB3D: 29 01    and #$01
CB3F: 85 35    sta $35
CB41: F0 27    beq $cb6a
CB43: 8A       txa
CB44: 29 01    and #$01
CB46: D0 22    bne $cb6a
CB48: A5 4C    lda $4c
CB4A: 18       clc
CB4B: 69 08    adc #$08
CB4D: 85 4C    sta $4c
CB4F: C6 37    dec $37
CB51: 10 10    bpl $cb63
CB53: C9 1D    cmp #$1d
CB55: 90 06    bcc $cb5d
CB57: 20 E5 CA jsr $cae5
CB5A: 20 E2 E4 jsr $e4e2
CB5D: 20 74 CA jsr $ca74
CB60: 4C 6A CB jmp $cb6a
CB63: A6 4C    ldx $4c
CB65: A9 01    lda #$01
CB67: 9D 36 04 sta $0436, x
CB6A: A9 0E    lda #$0e
CB6C: 85 EB    sta $eb
CB6E: 85 EC    sta $ec
CB70: 60       rts
CB71: A5 4F    lda $4f
CB73: 29 07    and #$07
CB75: D0 26    bne $cb9d
CB77: A5 1D    lda $1d
CB79: 48       pha
CB7A: 29 04    and #$04
CB7C: F0 0E    beq $cb8c
CB7E: BC 36 04 ldy $0436, x
CB81: C8       iny
CB82: C0 1B    cpy #$1b
CB84: 90 02    bcc $cb88
CB86: A0 00    ldy #$00
CB88: 98       tya
CB89: 9D 36 04 sta $0436, x
CB8C: 68       pla
CB8D: 29 08    and #$08
CB8F: F0 0C    beq $cb9d
CB91: BC 36 04 ldy $0436, x
CB94: 88       dey
CB95: 10 02    bpl $cb99
CB97: A0 1A    ldy #$1a
CB99: 98       tya
CB9A: 9D 36 04 sta $0436, x
CB9D: 60       rts
CB9E: A2 07    ldx #$07
CBA0: BD C2 CB lda $cbc2, x
CBA3: 9D 26 04 sta $0426, x
CBA6: BD DA CB lda $cbda, x
CBA9: 9D 3E 04 sta $043e, x
CBAC: BD CA CB lda $cbca, x
CBAF: 9D 1E 04 sta $041e, x
CBB2: BD E2 CB lda $cbe2, x
CBB5: 9D 46 04 sta $0446, x
CBB8: BD D2 CB lda $cbd2, x
CBBB: 9D 36 04 sta $0436, x
CBBE: CA       dex
CBBF: 10 DF    bpl $cba0
CBC1: 60       rts
CBC2: 13 38    slo ($38), y
CBC4: 53 72    sre ($72), y
CBC6: 75 80    adc $80, x
CBC8: 92       kil
CBC9: 99 50 00 sta $0050, y
CBCC: 50 50    bvc $cc1e
CBCE: 00       brk
CBCF: 00       brk
CBD0: 50 00    bvc $cbd2
CBD2: 02       kil
CBD3: 0F 0A 0D slo $0d0a
CBD6: 12       kil
CBD7: 0D 13 01 ora $0113
CBDA: 12       kil
CBDB: 12       kil
CBDC: 0F 0C 04 slo $040c
CBDF: 05 04    ora $04
CBE1: 03 04    slo ($04, x)
CBE3: 12       kil
CBE4: 05 08    ora $08
CBE6: 01 03    ora ($03, x)
CBE8: 0D 05 48 ora $4805
CBEB: 8A       txa
CBEC: 48       pha
CBED: 98       tya
CBEE: 48       pha
CBEF: D8       cld
CBF0: BA       tsx
CBF1: E0 D0    cpx #$d0
CBF3: 90 10    bcc $cc05
CBF5: BD 06 01 lda $0106, x
CBF8: C9 90    cmp #$90
CBFA: B0 06    bcs $cc02
CBFC: 29 F0    and #$f0
CBFE: C9 50    cmp #$50
CC00: D0 03    bne $cc05
CC02: 4C 08 CC jmp $cc08
CC05: 4C 05 CC jmp $cc05
CC08: 8D 80 89 sta $8980
CC0B: 8D C0 88 sta $88c0
CC0E: 20 8A CC jsr $cc8a
CC11: 20 37 E1 jsr $e137
CC14: A5 D6    lda $d6
CC16: C9 12    cmp #$12
CC18: 90 0C    bcc $cc26
CC1A: 24 F9    bit $f9
CC1C: 30 08    bmi $cc26
CC1E: A9 04    lda #$04
CC20: 85 FC    sta $fc
CC22: A9 FF    lda #$ff
CC24: 85 F9    sta $f9
CC26: A5 FC    lda $fc
CC28: 30 10    bmi $cc3a
CC2A: A5 D6    lda $d6
CC2C: 85 40    sta $40
CC2E: 20 2A E7 jsr $e72a
CC31: A5 40    lda $40
CC33: C5 D6    cmp $d6
CC35: F0 03    beq $cc3a
CC37: 20 FF E0 jsr $e0ff
CC3A: 20 31 CD jsr $cd31
CC3D: 20 C0 CC jsr $ccc0
CC40: A5 E0    lda $e0
CC42: 29 0F    and #$0f
CC44: D0 03    bne $cc49
CC46: 20 06 E5 jsr $e506
CC49: E6 FB    inc $fb
CC4B: E6 02    inc $02
CC4D: A5 FA    lda $fa
CC4F: 30 07    bmi $cc58
CC51: AD 00 78 lda $7800
CC54: 29 10    and #$10
CC56: F0 28    beq $cc80
CC58: AD 00 78 lda $7800
CC5B: 29 40    and #$40
CC5D: F0 1E    beq $cc7d
CC5F: A5 03    lda $03
CC61: D0 14    bne $cc77
CC63: 85 02    sta $02
CC65: AD 01 20 lda $2001
CC68: 49 02    eor #$02
CC6A: 8D 01 20 sta $2001
CC6D: A0 24    ldy #$24
CC6F: 29 02    and #$02
CC71: F0 02    beq $cc75
CC73: A0 20    ldy #$20
CC75: 84 03    sty $03
CC77: 8D 80 88 sta $8880
CC7A: 8D 40 88 sta $8840
CC7D: 4C 84 CC jmp $cc84
CC80: A9 20    lda #$20
CC82: 85 03    sta $03
CC84: 68       pla
CC85: A8       tay
CC86: 68       pla
CC87: AA       tax
CC88: 68       pla
CC89: 40       rti
CC8A: AD 00 88 lda $8800
CC8D: 30 04    bmi $cc93
CC8F: A6 CF    ldx $cf
CC91: D0 0E    bne $cca1
CC93: AD 00 88 lda $8800
CC96: 29 E0    and #$e0
CC98: 85 40    sta $40
CC9A: AD 00 80 lda $8000
CC9D: 29 1F    and #$1f
CC9F: 05 40    ora $40
CCA1: 49 FF    eor #$ff
CCA3: 85 1D    sta $1d
CCA5: A9 07    lda #$07
CCA7: 8D 0F 60 sta $600f
CCAA: 8D 0F 68 sta $680f
CCAD: 8D 0B 60 sta $600b
CCB0: AD 08 60 lda $6008
CCB3: 85 F0    sta $f0
CCB5: 8D 0B 68 sta $680b
CCB8: AD 08 68 lda $6808
CCBB: 49 02    eor #$02
CCBD: 85 F1    sta $f1
CCBF: 60       rts
CCC0: A5 D0    lda $d0
CCC2: F0 0D    beq $ccd1
CCC4: 4A       lsr a
CCC5: F0 05    beq $cccc
CCC7: A9 10    lda #$10
CCC9: 4C CE CC jmp $ccce
CCCC: A9 20    lda #$20
CCCE: 4C F0 CC jmp $ccf0
CCD1: A5 FB    lda $fb
CCD3: 29 40    and #$40
CCD5: F0 17    beq $ccee
CCD7: A5 D6    lda $d6
CCD9: F0 0E    beq $cce9
CCDB: C9 02    cmp #$02
CCDD: 90 05    bcc $cce4
CCDF: A9 00    lda #$00
CCE1: 4C E6 CC jmp $cce6
CCE4: A9 20    lda #$20
CCE6: 4C EB CC jmp $cceb
CCE9: A9 30    lda #$30
CCEB: 4C F0 CC jmp $ccf0
CCEE: A9 30    lda #$30
CCF0: A6 D5    ldx $d5
CCF2: 10 02    bpl $ccf6
CCF4: 09 01    ora #$01
CCF6: A6 D4    ldx $d4
CCF8: 10 02    bpl $ccfc
CCFA: 09 02    ora #$02
CCFC: AA       tax
CCFD: 20 12 CD jsr $cd12
CD00: 8A       txa
CD01: 05 F8    ora $f8
CD03: A6 F9    ldx $f9
CD05: 10 05    bpl $cd0c
CD07: 29 F7    and #$f7
CD09: 4C 0E CD jmp $cd0e
CD0C: 09 08    ora #$08
CD0E: 8D 00 88 sta $8800
CD11: 60       rts
CD12: AD 00 78 lda $7800
CD15: 29 10    and #$10
CD17: F0 17    beq $cd30
CD19: AD 00 88 lda $8800
CD1C: 10 05    bpl $cd23
CD1E: A9 C0    lda #$c0
CD20: 4C 2E CD jmp $cd2e
CD23: A4 CF    ldy $cf
CD25: F0 05    beq $cd2c
CD27: A9 00    lda #$00
CD29: 4C 2E CD jmp $cd2e
CD2C: A9 C0    lda #$c0
CD2E: 85 F8    sta $f8
CD30: 60       rts
CD31: A5 FB    lda $fb
CD33: D0 3C    bne $cd71
CD35: A5 F9    lda $f9
CD37: 10 06    bpl $cd3f
CD39: A5 FC    lda $fc
CD3B: 30 02    bmi $cd3f
CD3D: C6 FC    dec $fc
CD3F: A5 D0    lda $d0
CD41: F0 10    beq $cd53
CD43: EE 4E 04 inc $044e
CD46: D0 03    bne $cd4b
CD48: EE 4F 04 inc $044f
CD4B: AD 6D 04 lda $046d
CD4E: 30 03    bmi $cd53
CD50: CE 6D 04 dec $046d
CD53: A6 CF    ldx $cf
CD55: A5 88    lda $88
CD57: F0 18    beq $cd71
CD59: B5 00    lda $00, x
CD5B: C9 08    cmp #$08
CD5D: D0 12    bne $cd71
CD5F: AD 4E 04 lda $044e
CD62: 29 03    and #$03
CD64: D0 0B    bne $cd71
CD66: B5 E9    lda $e9, x
CD68: F0 07    beq $cd71
CD6A: F8       sed
CD6B: 38       sec
CD6C: E9 01    sbc #$01
CD6E: 95 E9    sta $e9, x
CD70: D8       cld
CD71: 60       rts
CD72: A6 03    ldx $03
CD74: F0 FC    beq $cd72
CD76: 86 09    stx $09
CD78: A9 02    lda #$02
CD7A: 85 08    sta $08
CD7C: A5 CE    lda $ce
CD7E: A4 30    ldy $30
CD80: 20 7F E4 jsr $e47f
CD83: A6 CF    ldx $cf
CD85: B5 EB    lda $eb, x
CD87: AA       tax
CD88: BD 92 CD lda $cd92, x
CD8B: 48       pha
CD8C: BD 91 CD lda $cd91, x
CD8F: 48       pha
CD90: 60       rts
CD91: A4 CD    ldy $cd
CD93: D3 CD    dcp ($cd), y
CD95: A4 CD    ldy $cd
CD97: E8       inx
CD98: CD 30 CE cmp $ce30
CD9B: F4 CD    nop $cd, x
CD9D: 0F CE 27 slo $27ce
CDA0: CE F4 CD dec $cdf4
CDA3: D3 CD    dcp ($cd), y
CDA5: 20 37 CE jsr $ce37
CDA8: 20 A7 D9 jsr $d9a7
CDAB: 20 A7 D9 jsr $d9a7
CDAE: 20 04 D9 jsr $d904
CDB1: 20 D9 DA jsr $dad9
CDB4: 20 89 DA jsr $da89
CDB7: 20 0A DB jsr $db0a
CDBA: 20 03 DA jsr $da03
CDBD: 20 B4 DC jsr $dcb4
CDC0: 20 F5 DB jsr $dbf5
CDC3: 20 1F CF jsr $cf1f
CDC6: 20 67 DD jsr $dd67
CDC9: 20 4D DA jsr $da4d
CDCC: 20 13 E4 jsr $e413
CDCF: A9 00    lda #$00
CDD1: 85 03    sta $03
CDD3: 60       rts
CDD4: 20 AC D1 jsr $d1ac
CDD7: 20 2E D2 jsr $d22e
CDDA: 20 69 D1 jsr $d169
CDDD: 20 57 CF jsr $cf57
CDE0: 20 CE D2 jsr $d2ce
CDE3: 20 84 D8 jsr $d884
CDE6: 4C A5 CD jmp $cda5
CDE9: 20 AC D1 jsr $d1ac
CDEC: 20 2E D2 jsr $d22e
CDEF: 20 CE D2 jsr $d2ce
CDF2: 4C A5 CD jmp $cda5
CDF5: 20 AC D1 jsr $d1ac
CDF8: 20 2E D2 jsr $d22e
CDFB: 20 91 CF jsr $cf91
CDFE: 20 69 D1 jsr $d169
CE01: 20 57 CF jsr $cf57
CE04: 20 F1 D0 jsr $d0f1
CE07: 20 2F D1 jsr $d12f
CE0A: 20 84 D8 jsr $d884
CE0D: 4C A5 CD jmp $cda5
CE10: 20 AC D1 jsr $d1ac
CE13: 20 2E D2 jsr $d22e
CE16: 20 91 CF jsr $cf91
CE19: 20 57 CF jsr $cf57
CE1C: 20 F1 D0 jsr $d0f1
CE1F: 20 2F D1 jsr $d12f
CE22: 20 84 D8 jsr $d884
CE25: 4C A5 CD jmp $cda5
CE28: 20 5B CE jsr $ce5b
CE2B: 20 67 DD jsr $dd67
CE2E: 4C A5 CD jmp $cda5
CE31: 20 3E CE jsr $ce3e
CE34: 4C A5 CD jmp $cda5
CE37: A2 A6    ldx #$a6
CE39: A9 4B    lda #$4b
CE3B: 4C 53 E4 jmp $e453
CE3E: A5 3F    lda $3f
CE40: C9 C0    cmp #$c0
CE42: 90 0E    bcc $ce52
CE44: 68       pla
CE45: 68       pla
CE46: 20 68 CE jsr $ce68
CE49: 20 80 DC jsr $dc80
CE4C: 4C A5 CD jmp $cda5
CE4F: 4C 5A CE jmp $ce5a
CE52: 68       pla
CE53: 68       pla
CE54: 20 C5 DD jsr $ddc5
CE57: 4C CC CD jmp $cdcc
CE5A: 60       rts
CE5B: A9 9F    lda #$9f
CE5D: 05 F3    ora $f3
CE5F: 85 F3    sta $f3
CE61: A9 00    lda #$00
CE63: 85 F5    sta $f5
CE65: 4C 44 CE jmp $ce44
CE68: A9 02    lda #$02
CE6A: 8D 7F 01 sta $017f
CE6D: 20 66 E4 jsr $e466
CE70: A2 07    ldx #$07
CE72: 86 23    stx $23
CE74: A2 F0    ldx #$f0
CE76: 86 38    stx $38
CE78: 20 66 E4 jsr $e466
CE7B: 20 66 E4 jsr $e466
CE7E: A6 38    ldx $38
CE80: A9 E0    lda #$e0
CE82: A0 00    ldy #$00
CE84: 20 8A E4 jsr $e48a
CE87: A4 CF    ldy $cf
CE89: B9 4D 00 lda $004d, y
CE8C: C5 23    cmp $23
CE8E: D0 06    bne $ce96
CE90: 20 86 D9 jsr $d986
CE93: 4C 99 CE jmp $ce99
CE96: 20 76 D9 jsr $d976
CE99: A5 23    lda $23
CE9B: 49 07    eor #$07
CE9D: 18       clc
CE9E: 69 01    adc #$01
CEA0: 0A       asl a
CEA1: 20 F8 D9 jsr $d9f8
CEA4: A2 00    ldx #$00
CEA6: A9 06    lda #$06
CEA8: A0 00    ldy #$00
CEAA: 20 8A E4 jsr $e48a
CEAD: A6 23    ldx $23
CEAF: BD 36 04 lda $0436, x
CEB2: 20 F9 CE jsr $cef9
CEB5: A6 23    ldx $23
CEB7: BD 3E 04 lda $043e, x
CEBA: 20 F9 CE jsr $cef9
CEBD: A6 23    ldx $23
CEBF: BD 46 04 lda $0446, x
CEC2: 20 F9 CE jsr $cef9
CEC5: A2 00    ldx #$00
CEC7: A9 04    lda #$04
CEC9: A0 00    ldy #$00
CECB: 20 8A E4 jsr $e48a
CECE: 20 6E D9 jsr $d96e
CED1: A6 23    ldx $23
CED3: 18       clc
CED4: BD 2E 04 lda $042e, x
CED7: 20 47 DE jsr $de47
CEDA: A6 23    ldx $23
CEDC: BD 26 04 lda $0426, x
CEDF: 20 47 DE jsr $de47
CEE2: A6 23    ldx $23
CEE4: BD 1E 04 lda $041e, x
CEE7: 20 47 DE jsr $de47
CEEA: 20 66 E4 jsr $e466
CEED: A5 38    lda $38
CEEF: 38       sec
CEF0: E9 0D    sbc #$0d
CEF2: 85 38    sta $38
CEF4: C6 23    dec $23
CEF6: 10 83    bpl $ce7b
CEF8: 60       rts
CEF9: 0A       asl a
CEFA: A8       tay
CEFB: D0 09    bne $cf06
CEFD: AE 48 4D ldx $4d48
CF00: AD 49 4D lda $4d49
CF03: 4C 0C CF jmp $cf0c
CF06: BE 5C 4D ldx $4d5c, y
CF09: B9 5D 4D lda $4d5d, y
CF0C: 4C 56 D9 jmp $d956
CF0F: 48       pha
CF10: 29 F0    and #$f0
CF12: 4A       lsr a
CF13: 4A       lsr a
CF14: 4A       lsr a
CF15: 20 F8 D9 jsr $d9f8
CF18: 68       pla
CF19: 29 0F    and #$0f
CF1B: 0A       asl a
CF1C: 4C F8 D9 jmp $d9f8
CF1F: A6 CF    ldx $cf
CF21: B5 00    lda $00, x
CF23: C9 1A    cmp #$1a
CF25: F0 13    beq $cf3a
CF27: C9 14    cmp #$14
CF29: F0 0F    beq $cf3a
CF2B: C9 12    cmp #$12
CF2D: F0 0B    beq $cf3a
CF2F: C9 1E    cmp #$1e
CF31: F0 07    beq $cf3a
CF33: A9 7F    lda #$7f
CF35: 25 F3    and $f3
CF37: 85 F3    sta $f3
CF39: 60       rts
CF3A: 20 66 E4 jsr $e466
CF3D: A9 80    lda #$80
CF3F: 05 F3    ora $f3
CF41: 85 F3    sta $f3
CF43: 20 47 CF jsr $cf47
CF46: 60       rts
CF47: A9 14    lda #$14
CF49: A2 5C    ldx #$5c
CF4B: A0 00    ldy #$00
CF4D: 20 8A E4 jsr $e48a
CF50: A6 CF    ldx $cf
CF52: E8       inx
CF53: 8A       txa
CF54: 4C 19 CF jmp $cf19
CF57: 20 7E D9 jsr $d97e
CF5A: A2 0E    ldx #$0e
CF5C: 86 21    stx $21
CF5E: BD BF 03 lda $03bf, x
CF61: F0 27    beq $cf8a
CF63: 20 66 E4 jsr $e466
CF66: A6 21    ldx $21
CF68: BD 0B 03 lda $030b, x
CF6B: 85 07    sta $07
CF6D: BD 1A 03 lda $031a, x
CF70: 85 06    sta $06
CF72: BD 38 03 lda $0338, x
CF75: 85 05    sta $05
CF77: BD 47 03 lda $0347, x
CF7A: 85 04    sta $04
CF7C: A9 00    lda #$00
CF7E: 85 0A    sta $0a
CF80: A2 04    ldx #$04
CF82: 20 A9 E4 jsr $e4a9
CF85: A9 E0    lda #$e0
CF87: 20 86 E4 jsr $e486
CF8A: C6 21    dec $21
CF8C: A6 21    ldx $21
CF8E: D0 CE    bne $cf5e
CF90: 60       rts
CF91: A6 CF    ldx $cf
CF93: B5 00    lda $00, x
CF95: C9 1C    cmp #$1c
CF97: F0 28    beq $cfc1
CF99: B5 F6    lda $f6, x
CF9B: 29 03    and #$03
CF9D: AA       tax
CF9E: BD 42 C1 lda $c142, x
CFA1: 85 22    sta $22
CFA3: A2 04    ldx #$04
CFA5: 86 21    stx $21
CFA7: A5 22    lda $22
CFA9: 0A       asl a
CFAA: 65 CF    adc $cf
CFAC: A8       tay
CFAD: B9 44 01 lda $0144, y
CFB0: 30 03    bmi $cfb5
CFB2: 20 C2 CF jsr $cfc2
CFB5: C6 22    dec $22
CFB7: C6 21    dec $21
CFB9: 10 EC    bpl $cfa7
CFBB: 20 FC CF jsr $cffc
CFBE: 4C 33 DB jmp $db33
CFC1: 60       rts
CFC2: A4 22    ldy $22
CFC4: B9 97 04 lda $0497, y
CFC7: 18       clc
CFC8: 79 CB D0 adc $d0cb, y
CFCB: AA       tax
CFCC: BD 7D D0 lda $d07d, x
CFCF: 10 0E    bpl $cfdf
CFD1: 8A       txa
CFD2: 18       clc
CFD3: 7D 7D D0 adc $d07d, x
CFD6: AA       tax
CFD7: A9 00    lda #$00
CFD9: 99 97 04 sta $0497, y
CFDC: BD 7D D0 lda $d07d, x
CFDF: BE 97 04 ldx $0497, y
CFE2: 48       pha
CFE3: A5 4F    lda $4f
CFE5: 39 DE D0 and $d0de, y
CFE8: D0 01    bne $cfeb
CFEA: E8       inx
CFEB: 8A       txa
CFEC: 99 97 04 sta $0497, y
CFEF: 68       pla
CFF0: 0A       asl a
CFF1: A8       tay
CFF2: B9 16 D0 lda $d016, y
CFF5: BE 15 D0 ldx $d015, y
CFF8: 20 53 E4 jsr $e453
CFFB: 60       rts
CFFC: A6 CF    ldx $cf
CFFE: B5 F6    lda $f6, x
D000: 29 01    and #$01
D002: D0 05    bne $d009
D004: A0 10    ldy #$10
D006: 4C 0B D0 jmp $d00b
D009: A0 12    ldy #$12
D00B: 84 22    sty $22
D00D: 20 C2 CF jsr $cfc2
D010: C6 22    dec $22
D012: 4C C2 CF jmp $cfc2
D015: 58       cli
D016: 3D 5C 3D and $3d5c, x
D019: 64 3D    nop $3d
D01B: 6C 3D 74 jmp ($743d)
D01E: 3D 7C 3D and $3d7c, x
D021: 84 3D    sty $3d
D023: 5E 3E 62 lsr $623e, x
D026: 3E B2 3E rol $3eb2, x
D029: B6 3E    ldx $3e, y
D02B: BA       tsx
D02C: 3E BE 3E rol $3ebe, x
D02F: 1E 3F 24 asl $243f, x
D032: 3F EE 3F rla $3fee, x
D035: F8       sed
D036: 3F DA 40 rla $40da, x
D039: DE 40 E2 dec $e240, x
D03C: 40       rti
D03D: 6A       ror a
D03E: 41 6E    eor ($6e, x)
D040: 41 72    eor ($72, x)
D042: 41 2A    eor ($2a, x)
D044: 42       kil
D045: 30 42    bmi $d089
D047: 32       kil
D048: 42       kil
D049: 3A       nop
D04A: 42       kil
D04B: D0 42    bne $d08f
D04D: DA       nop
D04E: 42       kil
D04F: E4 42    cpx $42
D051: F0 40    beq $d093
D053: F4 40    nop $40, x
D055: F8       sed
D056: 40       rti
D057: D2       kil
D058: 43 D6    sre ($d6, x)
D05A: 43 DC    sre ($dc, x)
D05C: 43 E4    sre ($e4, x)
D05E: 43 E8    sre ($e8, x)
D060: 43 EE    sre ($ee, x)
D062: 43 F6    sre ($f6, x)
D064: 43 2A    sre ($2a, x)
D066: 44 E2    nop $e2
D068: 44 E8    nop $e8
D06A: 44 40    nop $40
D06C: 45 48    eor $48
D06E: 45 52    eor $52
D070: 45 E2    eor $e2
D072: 3D E8 3D and $3de8, x
D075: EE 3D F6 inc $f63d
D078: 3D 02 3E and $3e02, x
D07B: 0E 3E 00 asl $003e
D07E: 01 02    ora ($02, x)
D080: 03 04    slo ($04, x)
D082: 05 06    ora $06
D084: F9 07 07 sbc $0707, y
D087: 08       php
D088: 08       php
D089: FC 09 0A nop $0a09, x
D08C: 0B 0C    anc #$0c
D08E: FC 0D 0E nop $0e0d, x
D091: FE 0F 0F inc $0f0f, x
D094: 10 10    bpl $d0a6
D096: FC 11 12 nop $1211, x
D099: 13 FD    slo ($fd), y
D09B: 14 14    nop $14, x
D09D: 14 15    nop $15, x
D09F: 15 FB    ora $fb, x
D0A1: 16 FF    asl $ff, x
D0A3: 17 18    slo $18, x
D0A5: 19 1A FC ora $fc1a, y
D0A8: 1B 1C 1D slo $1d1c, y
D0AB: FD 1E 1F sbc $1f1e, x
D0AE: 20 FD 21 jsr $21fd
D0B1: 22       kil
D0B2: 23 24    rla ($24, x)
D0B4: 25 26    and $26
D0B6: FA       nop
D0B7: 27 27    rla $27
D0B9: 28       plp
D0BA: 28       plp
D0BB: FC 29 2A nop $2a29, x
D0BE: FE 2B 2C inc $2c2b, x
D0C1: 2D FD 2E and $2efd
D0C4: 2F 30 FD rla $fd30
D0C7: 31 32    and ($32), y
D0C9: 33 FD    rla ($fd), y
D0CB: 15 08    ora $08, x
D0CD: 0D 12 1A ora $1a12
D0D0: 2B 1E    anc #$1e
D0D2: 26 24    rol $24
D0D4: 2F 42 3A rla $3a42
D0D7: 3F 33 1A rla $1a33, x
D0DA: 00       brk
D0DB: 46 00    lsr $00
D0DD: 4A       lsr a
D0DE: 01 0F    ora ($0f, x)
D0E0: 03 0F    slo ($0f, x)
D0E2: 07 03    slo $03
D0E4: 0F 07 07 slo $0707
D0E7: 03 07    slo ($07, x)
D0E9: 05 07    ora $07
D0EB: 07 07    slo $07
D0ED: 03 07    slo ($07, x)
D0EF: 01 03    ora ($03, x)
D0F1: A2 0F    ldx #$0f
D0F3: 86 21    stx $21
D0F5: 20 66 E4 jsr $e466
D0F8: A6 21    ldx $21
D0FA: BD CE 03 lda $03ce, x
D0FD: 85 06    sta $06
D0FF: BD DE 03 lda $03de, x
D102: 85 07    sta $07
D104: BD EE 03 lda $03ee, x
D107: 85 04    sta $04
D109: BD FE 03 lda $03fe, x
D10C: 85 05    sta $05
D10E: A9 00    lda #$00
D110: 85 0A    sta $0a
D112: A2 04    ldx #$04
D114: 20 A9 E4 jsr $e4a9
D117: 20 8D D9 jsr $d98d
D11A: A6 21    ldx $21
D11C: BD 0E 04 lda $040e, x
D11F: 48       pha
D120: 38       sec
D121: E9 04    sbc #$04
D123: 9D 0E 04 sta $040e, x
D126: 68       pla
D127: 20 86 E4 jsr $e486
D12A: C6 21    dec $21
D12C: 10 C7    bpl $d0f5
D12E: 60       rts
D12F: A5 50    lda $50
D131: D0 33    bne $d166
D133: A5 4F    lda $4f
D135: 29 0F    and #$0f
D137: AA       tax
D138: AD 0A 60 lda $600a
D13B: 9D CE 03 sta $03ce, x
D13E: AD 0A 60 lda $600a
D141: 29 03    and #$03
D143: 18       clc
D144: 69 FE    adc #$fe
D146: 9D DE 03 sta $03de, x
D149: AD 0A 60 lda $600a
D14C: 9D EE 03 sta $03ee, x
D14F: AD 0A 60 lda $600a
D152: 29 03    and #$03
D154: 18       clc
D155: 69 FE    adc #$fe
D157: 9D FE 03 sta $03fe, x
D15A: A9 C0    lda #$c0
D15C: 9D 0E 04 sta $040e, x
D15F: A9 02    lda #$02
D161: 85 50    sta $50
D163: 4C 68 D1 jmp $d168
D166: C6 50    dec $50
D168: 60       rts
D169: 20 76 D9 jsr $d976
D16C: A2 0E    ldx #$0e
D16E: 86 21    stx $21
D170: BD EC 02 lda $02ec, x
D173: F0 30    beq $d1a5
D175: 20 66 E4 jsr $e466
D178: A6 21    ldx $21
D17A: BD 4D 02 lda $024d, x
D17D: 85 05    sta $05
D17F: BD 64 02 lda $0264, x
D182: 85 04    sta $04
D184: BD 1F 02 lda $021f, x
D187: 85 06    sta $06
D189: BD 08 02 lda $0208, x
D18C: 85 07    sta $07
D18E: A9 00    lda #$00
D190: 85 0A    sta $0a
D192: A2 04    ldx #$04
D194: 20 A9 E4 jsr $e4a9
D197: A5 21    lda $21
D199: C9 04    cmp #$04
D19B: B0 03    bcs $d1a0
D19D: 20 82 D9 jsr $d982
D1A0: A9 E0    lda #$e0
D1A2: 20 86 E4 jsr $e486
D1A5: C6 21    dec $21
D1A7: A6 21    ldx $21
D1A9: 10 C5    bpl $d170
D1AB: 60       rts
D1AC: A6 CF    ldx $cf
D1AE: B5 88    lda $88, x
D1B0: F0 0C    beq $d1be
D1B2: 20 BF D1 jsr $d1bf
D1B5: 20 6E D9 jsr $d96e
D1B8: 20 D5 D1 jsr $d1d5
D1BB: 20 E4 D1 jsr $d1e4
D1BE: 60       rts
D1BF: 20 66 E4 jsr $e466
D1C2: A2 03    ldx #$03
D1C4: B5 0D    lda $0d, x
D1C6: 95 04    sta $04, x
D1C8: CA       dex
D1C9: 10 F9    bpl $d1c4
D1CB: A2 04    ldx #$04
D1CD: A9 00    lda #$00
D1CF: 85 0A    sta $0a
D1D1: 20 A9 E4 jsr $e4a9
D1D4: 60       rts
D1D5: A5 11    lda $11
D1D7: 29 FE    and #$fe
D1D9: A8       tay
D1DA: B9 C7 45 lda $45c7, y
D1DD: BE C6 45 ldx $45c6, y
D1E0: 20 56 D9 jsr $d956
D1E3: 60       rts
D1E4: A5 4C    lda $4c
D1E6: F0 06    beq $d1ee
D1E8: 20 76 D9 jsr $d976
D1EB: 4C F1 D1 jmp $d1f1
D1EE: 20 6A D9 jsr $d96a
D1F1: A5 11    lda $11
D1F3: 29 FE    and #$fe
D1F5: A8       tay
D1F6: BE 26 4A ldx $4a26, y
D1F9: B9 27 4A lda $4a27, y
D1FC: 20 53 E4 jsr $e453
D1FF: A5 4B    lda $4b
D201: F0 2A    beq $d22d
D203: A6 CF    ldx $cf
D205: B4 4D    ldy $4d, x
D207: B9 31 C1 lda $c131, y
D20A: C9 A8    cmp #$a8
D20C: F0 1F    beq $d22d
D20E: 20 72 D9 jsr $d972
D211: 20 BF D1 jsr $d1bf
D214: A4 CF    ldy $cf
D216: B6 4D    ldx $4d, y
D218: A0 00    ldy #$00
D21A: E0 03    cpx #$03
D21C: D0 06    bne $d224
D21E: A5 10    lda $10
D220: 10 02    bpl $d224
D222: A0 02    ldy #$02
D224: BE 66 4A ldx $4a66, y
D227: B9 67 4A lda $4a67, y
D22A: 20 53 E4 jsr $e453
D22D: 60       rts
D22E: 20 8D D9 jsr $d98d
D231: A5 D0    lda $d0
D233: F0 1C    beq $d251
D235: A6 CF    ldx $cf
D237: B5 88    lda $88, x
D239: F0 13    beq $d24e
D23B: A5 1D    lda $1d
D23D: 29 01    and #$01
D23F: F0 0D    beq $d24e
D241: 20 D7 E0 jsr $e0d7
D244: 20 BF D1 jsr $d1bf
D247: A9 45    lda #$45
D249: A2 B4    ldx #$b4
D24B: 20 53 E4 jsr $e453
D24E: 4C 55 D2 jmp $d255
D251: A5 4B    lda $4b
D253: D0 EF    bne $d244
D255: AD 6E 04 lda $046e
D258: F0 73    beq $d2cd
D25A: A6 CF    ldx $cf
D25C: B5 88    lda $88, x
D25E: F0 6D    beq $d2cd
D260: 20 8D D9 jsr $d98d
D263: A9 07    lda #$07
D265: 85 21    sta $21
D267: 20 66 E4 jsr $e466
D26A: AD 0A 60 lda $600a
D26D: 29 3F    and #$3f
D26F: 85 22    sta $22
D271: AD 0A 60 lda $600a
D274: 29 0F    and #$0f
D276: 85 23    sta $23
D278: A5 0F    lda $0f
D27A: A6 CF    ldx $cf
D27C: B4 4D    ldy $4d, x
D27E: C0 03    cpy #$03
D280: D0 10    bne $d292
D282: 24 10    bit $10
D284: 10 0C    bpl $d292
D286: 18       clc
D287: 65 22    adc $22
D289: 85 06    sta $06
D28B: A5 10    lda $10
D28D: 69 00    adc #$00
D28F: 4C 9B D2 jmp $d29b
D292: 38       sec
D293: E5 22    sbc $22
D295: 85 06    sta $06
D297: A5 10    lda $10
D299: E9 00    sbc #$00
D29B: 85 07    sta $07
D29D: A5 0D    lda $0d
D29F: 2C 0A 60 bit $600a
D2A2: 10 0C    bpl $d2b0
D2A4: 38       sec
D2A5: E5 23    sbc $23
D2A7: 85 04    sta $04
D2A9: A5 0E    lda $0e
D2AB: E9 00    sbc #$00
D2AD: 4C B9 D2 jmp $d2b9
D2B0: 18       clc
D2B1: 65 23    adc $23
D2B3: 85 04    sta $04
D2B5: A5 0E    lda $0e
D2B7: 69 00    adc #$00
D2B9: 85 05    sta $05
D2BB: A9 00    lda #$00
D2BD: 85 0A    sta $0a
D2BF: A2 04    ldx #$04
D2C1: 20 A9 E4 jsr $e4a9
D2C4: A9 E0    lda #$e0
D2C6: 20 86 E4 jsr $e486
D2C9: C6 21    dec $21
D2CB: 10 9A    bpl $d267
D2CD: 60       rts
D2CE: 20 66 E4 jsr $e466
D2D1: A9 00    lda #$00
D2D3: 38       sec
D2D4: E5 2D    sbc $2d
D2D6: 85 31    sta $31
D2D8: D0 01    bne $d2db
D2DA: 38       sec
D2DB: A9 F8    lda #$f8
D2DD: E9 00    sbc #$00
D2DF: 85 32    sta $32
D2E1: A5 2B    lda $2b
D2E3: 0A       asl a
D2E4: A8       tay
D2E5: 84 21    sty $21
D2E7: 98       tya
D2E8: 85 22    sta $22
D2EA: A5 66    lda $66
D2EC: 71 62    adc ($62), y
D2EE: 85 33    sta $33
D2F0: A5 67    lda $67
D2F2: C8       iny
D2F3: 71 62    adc ($62), y
D2F5: 88       dey
D2F6: 85 34    sta $34
D2F8: A6 CF    ldx $cf
D2FA: B5 88    lda $88, x
D2FC: F0 0C    beq $d30a
D2FE: B5 F6    lda $f6, x
D300: 29 08    and #$08
D302: F0 06    beq $d30a
D304: 20 6A D9 jsr $d96a
D307: 4C 0D D3 jmp $d30d
D30A: 20 72 D9 jsr $d972
D30D: A5 30    lda $30
D30F: D0 0F    bne $d320
D311: A5 21    lda $21
D313: 38       sec
D314: E5 22    sbc $22
D316: 29 1F    and #$1f
D318: C9 06    cmp #$06
D31A: 90 2C    bcc $d348
D31C: C9 1C    cmp #$1c
D31E: B0 28    bcs $d348
D320: A9 00    lda #$00
D322: 85 0A    sta $0a
D324: A2 03    ldx #$03
D326: B5 31    lda $31, x
D328: 95 04    sta $04, x
D32A: CA       dex
D32B: 10 F9    bpl $d326
D32D: A2 04    ldx #$04
D32F: 20 A9 E4 jsr $e4a9
D332: A4 21    ldy $21
D334: B1 64    lda ($64), y
D336: AA       tax
D337: C8       iny
D338: B1 64    lda ($64), y
D33A: F0 09    beq $d345
D33C: 20 53 E4 jsr $e453
D33F: 20 5A D6 jsr $d65a
D342: 20 B4 D6 jsr $d6b4
D345: 20 66 E4 jsr $e466
D348: A4 21    ldy $21
D34A: E6 32    inc $32
D34C: A5 33    lda $33
D34E: 18       clc
D34F: 71 5C    adc ($5c), y
D351: 85 33    sta $33
D353: A5 34    lda $34
D355: C8       iny
D356: 71 5C    adc ($5c), y
D358: 88       dey
D359: 85 34    sta $34
D35B: C8       iny
D35C: C8       iny
D35D: 98       tya
D35E: 29 1F    and #$1f
D360: 85 21    sta $21
D362: C5 22    cmp $22
D364: D0 92    bne $d2f8
D366: 4C 62 D8 jmp $d862
D369: 00       brk
D36A: 00       brk
D36B: 00       brk
D36C: FF 00 FF isb $ff00, x
D36F: E0 00    cpx #$00
D371: A0 FF    ldy #$ff
D373: C0 FE    cpy #$fe
D375: C0 FE    cpy #$fe
D377: 80 00    nop #$00
D379: C0 FF    cpy #$ff
D37B: C0 FF    cpy #$ff
D37D: 80 00    nop #$00
D37F: 00       brk
D380: 00       brk
D381: E0 FE    cpx #$fe
D383: E0 FE    cpx #$fe
D385: E0 FE    cpx #$fe
D387: 00       brk
D388: 01 00    ora ($00, x)
D38A: 00       brk
D38B: 80 FE    nop #$fe
D38D: A0 FD    ldy #$fd
D38F: A0 FD    ldy #$fd
D391: 00       brk
D392: FE E0 FE inc $fee0, x
D395: C0 FD    cpy #$fd
D397: 00       brk
D398: FE 00 00 inc $0000, x
D39B: 80 FE    nop #$fe
D39D: 40       rti
D39E: FE C0 FD inc $fdc0, x
D3A1: 40       rti
D3A2: FE 00 00 inc $0000, x
D3A5: 60       rts
D3A6: FE A0 FE inc $fea0, x
D3A9: 00       brk
D3AA: 00       brk
D3AB: 80 00    nop #$00
D3AD: 40       rti
D3AE: 00       brk
D3AF: 60       rts
D3B0: 00       brk
D3B1: 60       rts
D3B2: 00       brk
D3B3: 00       brk
D3B4: 00       brk
D3B5: 00       brk
D3B6: 00       brk
D3B7: 80 00    nop #$00
D3B9: C0 00    cpy #$00
D3BB: C0 00    cpy #$00
D3BD: 40       rti
D3BE: 00       brk
D3BF: 80 00    nop #$00
D3C1: 20 00 40 jsr $4000
D3C4: 00       brk
D3C5: 40       rti
D3C6: 00       brk
D3C7: 80 00    nop #$00
D3C9: 00       brk
D3CA: 00       brk
D3CB: 00       brk
D3CC: 00       brk
D3CD: 00       brk
D3CE: FF 00 FF isb $ff00, x
D3D1: 00       brk
D3D2: 00       brk
D3D3: 00       brk
D3D4: 00       brk
D3D5: 00       brk
D3D6: 00       brk
D3D7: 00       brk
D3D8: FF 00 FE isb $fe00, x
D3DB: 00       brk
D3DC: FE 00 FF inc $ff00, x
D3DF: 00       brk
D3E0: FF 00 00 isb $0000, x
D3E3: 00       brk
D3E4: FF 00 FF isb $ff00, x
D3E7: 00       brk
D3E8: 00       brk
D3E9: 00       brk
D3EA: 00       brk
D3EB: 00       brk
D3EC: FF 00 FF isb $ff00, x
D3EF: 00       brk
D3F0: FF 00 FF isb $ff00, x
D3F3: 00       brk
D3F4: FF 00 01 isb $0100, x
D3F7: 00       brk
D3F8: FE 00 FE inc $fe00, x
D3FB: 00       brk
D3FC: FF 00 00 isb $0000, x
D3FF: 00       brk
D400: 00       brk
D401: 00       brk
D402: 01 00    ora ($00, x)
D404: 00       brk
D405: 00       brk
D406: 00       brk
D407: 00       brk
D408: 00       brk
D409: 00       brk
D40A: 00       brk
D40B: 00       brk
D40C: 00       brk
D40D: C0 02    cpy #$02
D40F: 80 03    nop #$03
D411: 80 05    nop #$05
D413: 40       rti
D414: 01 40    ora ($40, x)
D416: 01 80    ora ($80, x)
D418: FF 80 FF isb $ff80, x
D41B: 80 00    nop #$00
D41D: 80 00    nop #$00
D41F: 80 00    nop #$00
D421: 80 00    nop #$00
D423: 80 00    nop #$00
D425: 80 00    nop #$00
D427: 80 00    nop #$00
D429: 00       brk
D42A: 00       brk
D42B: 00       brk
D42C: FF 00 FD isb $fd00, x
D42F: 00       brk
D430: FD 00 FD sbc $fd00, x
D433: 00       brk
D434: FD 00 FD sbc $fd00, x
D437: C0 FD    cpy #$fd
D439: C0 FD    cpy #$fd
D43B: 80 FE    nop #$fe
D43D: 80 FE    nop #$fe
D43F: 80 FD    nop #$fd
D441: 80 FD    nop #$fd
D443: 40       rti
D444: FC C0 FC nop $fcc0, x
D447: C0 FD    cpy #$fd
D449: 58       cli
D44A: 38       sec
D44B: E2 39    nop #$39
D44D: C2 39    nop #$39
D44F: 02       kil
D450: 39 38 3A and $3a38, y
D453: E4 38    cpx $38
D455: 52       kil
D456: 3A       nop
D457: 22       kil
D458: 39 6A 38 and $386a, y
D45B: F4 39    nop $39, x
D45D: D4 39    nop $39, x
D45F: 14 39    nop $39, x
D461: 46 3A    lsr $3a
D463: F4 38    nop $38, x
D465: 64 3A    nop $3a
D467: 34 39    nop $39, x
D469: 82 39    nop #$39
D46B: A2 39    ldx #$39
D46D: 42       kil
D46E: 39 42 39 and $3942, y
D471: C2 39    nop #$39
D473: 42       kil
D474: 39 E2 39 and $39e2, y
D477: 42       kil
D478: 39 94 39 and $3994, y
D47B: B4 39    ldy $39, x
D47D: 54 39    nop $39, x
D47F: 54 39    nop $39, x
D481: D4 39    nop $39, x
D483: 54 39    nop $39, x
D485: F4 39    nop $39, x
D487: 54 39    nop $39, x
D489: 42       kil
D48A: 39 62 39 and $3962, y
D48D: 42       kil
D48E: 39 62 39 and $3962, y
D491: 42       kil
D492: 39 62 39 and $3962, y
D495: 42       kil
D496: 39 62 39 and $3962, y
D499: 54 39    nop $39, x
D49B: 74 39    nop $39, x
D49D: 54 39    nop $39, x
D49F: 74 39    nop $39, x
D4A1: 54 39    nop $39, x
D4A3: 74 39    nop $39, x
D4A5: 54 39    nop $39, x
D4A7: 74 39    nop $39, x
D4A9: A2 39    ldx #$39
D4AB: E2 39    nop #$39
D4AD: 82 39    nop #$39
D4AF: E2 39    nop #$39
D4B1: E2 39    nop #$39
D4B3: 82 39    nop #$39
D4B5: 62       kil
D4B6: 39 82 39 and $3982, y
D4B9: B4 39    ldy $39, x
D4BB: F4 39    nop $39, x
D4BD: 94 39    sty $39, x
D4BF: F4 39    nop $39, x
D4C1: F4 39    nop $39, x
D4C3: 94 39    sty $39, x
D4C5: 74 39    nop $39, x
D4C7: 94 39    sty $39, x
D4C9: C2 39    nop #$39
D4CB: 82 39    nop #$39
D4CD: C2 39    nop #$39
D4CF: 62       kil
D4D0: 39 C2 39 and $39c2, y
D4D3: 42       kil
D4D4: 39 E2 39 and $39e2, y
D4D7: E2 39    nop #$39
D4D9: D4 39    nop $39, x
D4DB: 94 39    sty $39, x
D4DD: D4 39    nop $39, x
D4DF: 74 39    nop $39, x
D4E1: D4 39    nop $39, x
D4E3: 54 39    nop $39, x
D4E5: F4 39    nop $39, x
D4E7: F4 39    nop $39, x
D4E9: C2 39    nop #$39
D4EB: 62       kil
D4EC: 39 C2 39 and $39c2, y
D4EF: C2 39    nop #$39
D4F1: A2 39    ldx #$39
D4F3: A2 39    ldx #$39
D4F5: C2 39    nop #$39
D4F7: 62       kil
D4F8: 39 D4 39 and $39d4, y
D4FB: 74 39    nop $39, x
D4FD: D4 39    nop $39, x
D4FF: D4 39    nop $39, x
D501: B4 39    ldy $39, x
D503: B4 39    ldy $39, x
D505: D4 39    nop $39, x
D507: 74 39    nop $39, x
D509: 82 39    nop #$39
D50B: C2 39    nop #$39
D50D: A2 39    ldx #$39
D50F: E2 39    nop #$39
D511: C2 39    nop #$39
D513: 62       kil
D514: 39 E2 39 and $39e2, y
D517: 82 39    nop #$39
D519: 94 39    sty $39, x
D51B: D4 39    nop $39, x
D51D: B4 39    ldy $39, x
D51F: F4 39    nop $39, x
D521: D4 39    nop $39, x
D523: 74 39    nop $39, x
D525: F4 39    nop $39, x
D527: 94 39    sty $39, x
D529: 78       sei
D52A: 38       sec
D52B: 20 3A A8 jsr $a83a
D52E: 38       sec
D52F: 90 38    bcc $d569
D531: E2 39    nop #$39
D533: 82 39    nop #$39
D535: C2 39    nop #$39
D537: E2 39    nop #$39
D539: 84 38    sty $38
D53B: 2C 3A B6 bit $b63a
D53E: 38       sec
D53F: 9C 38 F4 shy $f438, x
D542: 39 94 39 and $3994, y
D545: D4 39    nop $39, x
D547: F4 39    nop $39, x
D549: 82 39    nop #$39
D54B: 82 39    nop #$39
D54D: E2 39    nop #$39
D54F: C2 39    nop #$39
D551: A2 39    ldx #$39
D553: A2 39    ldx #$39
D555: C2 39    nop #$39
D557: A2 39    ldx #$39
D559: 94 39    sty $39, x
D55B: 94 39    sty $39, x
D55D: F4 39    nop $39, x
D55F: D4 39    nop $39, x
D561: B4 39    ldy $39, x
D563: B4 39    ldy $39, x
D565: D4 39    nop $39, x
D567: B4 39    ldy $39, x
D569: E2 39    nop #$39
D56B: 62       kil
D56C: 39 82 39 and $3982, y
D56F: E2 39    nop #$39
D571: 82 39    nop #$39
D573: 82 39    nop #$39
D575: E2 39    nop #$39
D577: E2 39    nop #$39
D579: F4 39    nop $39, x
D57B: 74 39    nop $39, x
D57D: 94 39    sty $39, x
D57F: F4 39    nop $39, x
D581: 94 39    sty $39, x
D583: 94 39    sty $39, x
D585: F4 39    nop $39, x
D587: F4 39    nop $39, x
D589: C4 38    cpy $38
D58B: C2 39    nop #$39
D58D: 02       kil
D58E: 3A       nop
D58F: A2 39    ldx #$39
D591: C2 39    nop #$39
D593: C4 38    cpy $38
D595: C4 38    cpy $38
D597: E2 39    nop #$39
D599: D6 38    dec $38, x
D59B: D4 39    nop $39, x
D59D: 12       kil
D59E: 3A       nop
D59F: B4 39    ldy $39, x
D5A1: D4 39    nop $39, x
D5A3: D6 38    dec $38, x
D5A5: D6 38    dec $38, x
D5A7: F4 39    nop $39, x
D5A9: 82 39    nop #$39
D5AB: E2 39    nop #$39
D5AD: E2 39    nop #$39
D5AF: A2 39    ldx #$39
D5B1: E2 39    nop #$39
D5B3: E2 39    nop #$39
D5B5: C2 39    nop #$39
D5B7: E2 39    nop #$39
D5B9: 94 39    sty $39, x
D5BB: F4 39    nop $39, x
D5BD: F4 39    nop $39, x
D5BF: B4 39    ldy $39, x
D5C1: F4 39    nop $39, x
D5C3: F4 39    nop $39, x
D5C5: D4 39    nop $39, x
D5C7: F4 39    nop $39, x
D5C9: 00       brk
D5CA: 01 02    ora ($02, x)
D5CC: 03 04    slo ($04, x)
D5CE: 00       brk
D5CF: 05 00    ora $00
D5D1: 00       brk
D5D2: 06 00    asl $00
D5D4: 00       brk
D5D5: 07 00    slo $00
D5D7: 08       php
D5D8: 00       brk
D5D9: 01 00    ora ($00, x)
D5DB: 00       brk
D5DC: 02       kil
D5DD: 03 00    slo ($00, x)
D5DF: 04 00    nop $00
D5E1: 00       brk
D5E2: 00       brk
D5E3: 05 06    ora $06
D5E5: 07 00    slo $00
D5E7: 08       php
D5E8: 00       brk
D5E9: 00       brk
D5EA: 01 00    ora ($00, x)
D5EC: 02       kil
D5ED: 00       brk
D5EE: 03 00    slo ($00, x)
D5F0: 04 00    nop $00
D5F2: 05 00    ora $00
D5F4: 06 00    asl $00
D5F6: 07 00    slo $00
D5F8: 08       php
D5F9: 00       brk
D5FA: 00       brk
D5FB: 00       brk
D5FC: 00       brk
D5FD: 01 02    ora ($02, x)
D5FF: 03 04    slo ($04, x)
D601: 05 06    ora $06
D603: 07 08    slo $08
D605: 00       brk
D606: 00       brk
D607: 00       brk
D608: 00       brk
D609: 00       brk
D60A: 01 00    ora ($00, x)
D60C: 00       brk
D60D: 02       kil
D60E: 00       brk
D60F: 03 04    slo ($04, x)
D611: 00       brk
D612: 05 00    ora $00
D614: 06 07    asl $07
D616: 00       brk
D617: 00       brk
D618: 08       php
D619: 00       brk
D61A: 01 02    ora ($02, x)
D61C: 00       brk
D61D: 03 04    slo ($04, x)
D61F: 05 06    ora $06
D621: 00       brk
D622: 00       brk
D623: 00       brk
D624: 07 00    slo $00
D626: 08       php
D627: 00       brk
D628: 00       brk
D629: 00       brk
D62A: 01 02    ora ($02, x)
D62C: 00       brk
D62D: 03 04    slo ($04, x)
D62F: 00       brk
D630: 00       brk
D631: 05 00    ora $00
D633: 06 07    asl $07
D635: 08       php
D636: 00       brk
D637: 00       brk
D638: 00       brk
D639: 00       brk
D63A: 00       brk
D63B: 00       brk
D63C: 01 02    ora ($02, x)
D63E: 03 04    slo ($04, x)
D640: 00       brk
D641: 05 06    ora $06
D643: 07 08    slo $08
D645: 00       brk
D646: 00       brk
D647: 00       brk
D648: 00       brk
D649: 00       brk
D64A: 00       brk
D64B: 00       brk
D64C: 01 02    ora ($02, x)
D64E: 03 04    slo ($04, x)
D650: 05 06    ora $06
D652: 00       brk
D653: 07 00    slo $00
D655: 08       php
D656: 00       brk
D657: 00       brk
D658: 00       brk
D659: 7A       nop
D65A: 20 66 E4 jsr $e466
D65D: A5 21    lda $21
D65F: 4A       lsr a
D660: A8       tay
D661: B1 6E    lda ($6e), y
D663: F0 4C    beq $d6b1
D665: A8       tay
D666: 88       dey
D667: 84 24    sty $24
D669: B9 E4 02 lda $02e4, y
D66C: F0 43    beq $d6b1
D66E: B9 17 02 lda $0217, y
D671: 85 06    sta $06
D673: B9 00 02 lda $0200, y
D676: 85 07    sta $07
D678: B9 5C 02 lda $025c, y
D67B: 85 04    sta $04
D67D: B9 45 02 lda $0245, y
D680: 85 05    sta $05
D682: A9 00    lda #$00
D684: 85 0A    sta $0a
D686: A2 04    ldx #$04
D688: 20 A9 E4 jsr $e4a9
D68B: 20 76 D9 jsr $d976
D68E: A4 24    ldy $24
D690: B9 8F 04 lda $048f, y
D693: F0 09    beq $d69e
D695: 38       sec
D696: E9 01    sbc #$01
D698: 99 8F 04 sta $048f, y
D69B: 4C A4 D6 jmp $d6a4
D69E: 98       tya
D69F: 18       clc
D6A0: 69 08    adc #$08
D6A2: 85 24    sta $24
D6A4: A5 24    lda $24
D6A6: 0A       asl a
D6A7: A8       tay
D6A8: B1 6C    lda ($6c), y
D6AA: AA       tax
D6AB: C8       iny
D6AC: B1 6C    lda ($6c), y
D6AE: 20 53 E4 jsr $e453
D6B1: A4 21    ldy $21
D6B3: 60       rts
D6B4: 20 66 E4 jsr $e466
D6B7: 20 6E D9 jsr $d96e
D6BA: A5 21    lda $21
D6BC: 4A       lsr a
D6BD: A8       tay
D6BE: A9 00    lda #$00
D6C0: 85 39    sta $39
D6C2: B9 FB 02 lda $02fb, y
D6C5: F0 5A    beq $d721
D6C7: A5 31    lda $31
D6C9: 18       clc
D6CA: 71 6A    adc ($6a), y
D6CC: 85 04    sta $04
D6CE: A5 32    lda $32
D6D0: 85 05    sta $05
D6D2: 90 02    bcc $d6d6
D6D4: E6 05    inc $05
D6D6: B1 68    lda ($68), y
D6D8: 85 38    sta $38
D6DA: A2 03    ldx #$03
D6DC: 06 38    asl $38
D6DE: 26 39    rol $39
D6E0: CA       dex
D6E1: 10 F9    bpl $d6dc
D6E3: A5 39    lda $39
D6E5: C9 08    cmp #$08
D6E7: 90 02    bcc $d6eb
D6E9: 09 F0    ora #$f0
D6EB: 85 39    sta $39
D6ED: A5 33    lda $33
D6EF: 18       clc
D6F0: 65 38    adc $38
D6F2: 85 06    sta $06
D6F4: A5 34    lda $34
D6F6: 65 39    adc $39
D6F8: 85 07    sta $07
D6FA: A9 00    lda #$00
D6FC: 85 0A    sta $0a
D6FE: A2 04    ldx #$04
D700: 20 A9 E4 jsr $e4a9
D703: A6 CF    ldx $cf
D705: B5 4D    lda $4d, x
D707: C9 03    cmp #$03
D709: D0 0D    bne $d718
D70B: A5 07    lda $07
D70D: 10 09    bpl $d718
D70F: AD AD 3A lda $3aad
D712: AE AC 3A ldx $3aac
D715: 4C 1E D7 jmp $d71e
D718: AE AA 3A ldx $3aaa
D71B: AD AB 3A lda $3aab
D71E: 20 53 E4 jsr $e453
D721: 60       rts
D722: 20 80 80 jsr $8080
D725: A0 20    ldy #$20
D727: 60       rts
D728: 00       brk
D729: 00       brk
D72A: 60       rts
D72B: 00       brk
D72C: 00       brk
D72D: 00       brk
D72E: 60       rts
D72F: 60       rts
D730: 00       brk
D731: C0 00    cpy #$00
D733: 00       brk
D734: 24 EC    bit $ec
D736: 1A       nop
D737: 00       brk
D738: 00       brk
D739: 00       brk
D73A: 00       brk
D73B: 00       brk
D73C: 00       brk
D73D: 00       brk
D73E: 00       brk
D73F: 24 00    bit $00
D741: F0 00    beq $d743
D743: 00       brk
D744: 00       brk
D745: 00       brk
D746: 0A       asl a
D747: EE 04 00 inc $0004
D74A: 00       brk
D74B: 00       brk
D74C: F8       sed
D74D: 08       php
D74E: 08       php
D74F: 00       brk
D750: 00       brk
D751: 00       brk
D752: 00       brk
D753: 00       brk
D754: C0 40    cpy #$40
D756: 60       rts
D757: C0 80    cpy #$80
D759: 00       brk
D75A: 00       brk
D75B: 00       brk
D75C: C0 A0    cpy #$a0
D75E: 80 00    nop #$00
D760: 40       rti
D761: 40       rti
D762: 00       brk
D763: 00       brk
D764: 02       kil
D765: 00       brk
D766: 00       brk
D767: 08       php
D768: 08       php
D769: 00       brk
D76A: 00       brk
D76B: 00       brk
D76C: 00       brk
D76D: 00       brk
D76E: 00       brk
D76F: 04 04    nop $04
D771: 00       brk
D772: 00       brk
D773: 20 60 00 jsr $0060
D776: 00       brk
D777: 20 40 00 jsr $0040
D77A: 20 A0 20 jsr $20a0
D77D: 00       brk
D77E: 00       brk
D77F: 40       rti
D780: 80 00    nop #$00
D782: 00       brk
D783: 00       brk
D784: 00       brk
D785: 00       brk
D786: 00       brk
D787: 22       kil
D788: F0 00    beq $d78a
D78A: 30 30    bmi $d7bc
D78C: 04 00    nop $00
D78E: 00       brk
D78F: 00       brk
D790: 00       brk
D791: 00       brk
D792: 00       brk
D793: 00       brk
D794: 00       brk
D795: 00       brk
D796: 40       rti
D797: C0 40    cpy #$40
D799: 60       rts
D79A: 20 C0 60 jsr $60c0
D79D: 40       rti
D79E: 00       brk
D79F: 00       brk
D7A0: 00       brk
D7A1: 00       brk
D7A2: A0 00    ldy #$00
D7A4: 80 00    nop #$00
D7A6: 80 60    nop #$60
D7A8: 00       brk
D7A9: 00       brk
D7AA: 80 00    nop #$00
D7AC: 80 00    nop #$00
D7AE: 00       brk
D7AF: 80 00    nop #$00
D7B1: 60       rts
D7B2: 00       brk
D7B3: 00       brk
D7B4: 00       brk
D7B5: 00       brk
D7B6: 00       brk
D7B7: 00       brk
D7B8: 00       brk
D7B9: 00       brk
D7BA: 20 00 00 jsr $0000
D7BD: 00       brk
D7BE: 00       brk
D7BF: 00       brk
D7C0: 00       brk
D7C1: 00       brk
D7C2: 00       brk
D7C3: A0 60    ldy #$60
D7C5: 60       rts
D7C6: 80 40    nop #$40
D7C8: 00       brk
D7C9: 80 60    nop #$60
D7CB: 00       brk
D7CC: 60       rts
D7CD: 00       brk
D7CE: 60       rts
D7CF: 00       brk
D7D0: 60       rts
D7D1: 00       brk
D7D2: 60       rts
D7D3: 00       brk
D7D4: 20 00 00 jsr $0000
D7D7: 60       rts
D7D8: 00       brk
D7D9: 60       rts
D7DA: 40       rti
D7DB: 40       rti
D7DC: 40       rti
D7DD: 60       rts
D7DE: 60       rts
D7DF: 60       rts
D7E0: 00       brk
D7E1: 00       brk
D7E2: 00       brk
D7E3: 00       brk
D7E4: 00       brk
D7E5: 00       brk
D7E6: 00       brk
D7E7: 00       brk
D7E8: 00       brk
D7E9: 00       brk
D7EA: 2C 2C 12 bit $122c
D7ED: 12       kil
D7EE: 24 00    bit $00
D7F0: 00       brk
D7F1: 00       brk
D7F2: 00       brk
D7F3: 00       brk
D7F4: 00       brk
D7F5: A0 A0    ldy #$a0
D7F7: 60       rts
D7F8: 60       rts
D7F9: 00       brk
D7FA: 00       brk
D7FB: 60       rts
D7FC: 40       rti
D7FD: 80 00    nop #$00
D7FF: 00       brk
D800: 00       brk
D801: 00       brk
D802: 00       brk
D803: 00       brk
D804: 00       brk
D805: 10 40    bpl $d847
D807: 00       brk
D808: 20 00 00 jsr $0000
D80B: 00       brk
D80C: 00       brk
D80D: 20 00 00 jsr $0000
D810: 00       brk
D811: 00       brk
D812: 00       brk
D813: 00       brk
D814: 00       brk
D815: 00       brk
D816: 00       brk
D817: 60       rts
D818: 40       rti
D819: 00       brk
D81A: 00       brk
D81B: A0 80    ldy #$80
D81D: 00       brk
D81E: 00       brk
D81F: 00       brk
D820: 00       brk
D821: 00       brk
D822: 00       brk
D823: 00       brk
D824: 00       brk
D825: 00       brk
D826: 00       brk
D827: 00       brk
D828: 00       brk
D829: 00       brk
D82A: 00       brk
D82B: 00       brk
D82C: F0 00    beq $d82e
D82E: 00       brk
D82F: 00       brk
D830: 00       brk
D831: 00       brk
D832: 00       brk
D833: 00       brk
D834: 00       brk
D835: 00       brk
D836: 00       brk
D837: 00       brk
D838: 00       brk
D839: 00       brk
D83A: 20 80 00 jsr $0080
D83D: 60       rts
D83E: 60       rts
D83F: 00       brk
D840: 00       brk
D841: 00       brk
D842: C0 00    cpy #$00
D844: 00       brk
D845: 00       brk
D846: A0 00    ldy #$00
D848: 00       brk
D849: 80 00    nop #$00
D84B: 00       brk
D84C: 00       brk
D84D: 60       rts
D84E: 00       brk
D84F: A0 00    ldy #$00
D851: 00       brk
D852: 16 00    asl $00, x
D854: 00       brk
D855: 00       brk
D856: 16 00    asl $00, x
D858: 00       brk
D859: 0A       asl a
D85A: 00       brk
D85B: 00       brk
D85C: 00       brk
D85D: 0A       asl a
D85E: 00       brk
D85F: 26 00    rol $00
D861: 00       brk
D862: A6 CF    ldx $cf
D864: B5 4D    lda $4d, x
D866: AA       tax
D867: BD 31 C1 lda $c131, x
D86A: 29 20    and #$20
D86C: F0 15    beq $d883
D86E: AD 43 01 lda $0143
D871: 30 06    bmi $d879
D873: 20 8D D9 jsr $d98d
D876: 4C 7C D8 jmp $d87c
D879: 20 7E D9 jsr $d97e
D87C: A2 EC    ldx #$ec
D87E: A9 3C    lda #$3c
D880: 20 53 E4 jsr $e453
D883: 60       rts
D884: A6 CF    ldx $cf
D886: B5 00    lda $00, x
D888: C9 22    cmp #$22
D88A: F0 0B    beq $d897
D88C: C9 24    cmp #$24
D88E: F0 04    beq $d894
D890: C9 08    cmp #$08
D892: D0 03    bne $d897
D894: 4C B1 D8 jmp $d8b1
D897: BC 3C 01 ldy $013c, x
D89A: D0 14    bne $d8b0
D89C: C9 1C    cmp #$1c
D89E: D0 07    bne $d8a7
D8A0: A6 86    ldx $86
D8A2: 86 21    stx $21
D8A4: 4C CB D8 jmp $d8cb
D8A7: A2 01    ldx #$01
D8A9: 86 21    stx $21
D8AB: 20 CB D8 jsr $d8cb
D8AE: 10 FB    bpl $d8ab
D8B0: 60       rts
D8B1: A6 CF    ldx $cf
D8B3: B5 4D    lda $4d, x
D8B5: AA       tax
D8B6: BD 31 C1 lda $c131, x
D8B9: 30 0F    bmi $d8ca
D8BB: A2 01    ldx #$01
D8BD: 86 22    stx $22
D8BF: A2 03    ldx #$03
D8C1: 86 21    stx $21
D8C3: 20 CB D8 jsr $d8cb
D8C6: C6 22    dec $22
D8C8: 10 F9    bpl $d8c3
D8CA: 60       rts
D8CB: 20 66 E4 jsr $e466
D8CE: A6 21    ldx $21
D8D0: BD 34 01 lda $0134, x
D8D3: D0 2A    bne $d8ff
D8D5: BD 0C 01 lda $010c, x
D8D8: 85 07    sta $07
D8DA: BD 08 01 lda $0108, x
D8DD: 85 06    sta $06
D8DF: BD 18 01 lda $0118, x
D8E2: 85 05    sta $05
D8E4: BD 14 01 lda $0114, x
D8E7: 85 04    sta $04
D8E9: A2 04    ldx #$04
D8EB: A9 00    lda #$00
D8ED: 85 0A    sta $0a
D8EF: 20 A9 E4 jsr $e4a9
D8F2: A5 21    lda $21
D8F4: 0A       asl a
D8F5: A8       tay
D8F6: B9 7B 4A lda $4a7b, y
D8F9: BE 7A 4A ldx $4a7a, y
D8FC: 20 53 E4 jsr $e453
D8FF: C6 21    dec $21
D901: A6 21    ldx $21
D903: 60       rts
D904: A2 01    ldx #$01
D906: 86 24    stx $24
D908: 20 99 D9 jsr $d999
D90B: 20 66 E4 jsr $e466
D90E: A9 A0    lda #$a0
D910: 85 04    sta $04
D912: A9 D0    lda #$d0
D914: 85 06    sta $06
D916: A9 01    lda #$01
D918: 85 07    sta $07
D91A: A6 24    ldx $24
D91C: BD 54 D9 lda $d954, x
D91F: 85 05    sta $05
D921: A9 00    lda #$00
D923: 85 0A    sta $0a
D925: A2 04    ldx #$04
D927: 20 A9 E4 jsr $e4a9
D92A: A9 04    lda #$04
D92C: 18       clc
D92D: 65 24    adc $24
D92F: 85 21    sta $21
D931: A5 D0    lda $d0
D933: F0 09    beq $d93e
D935: A5 24    lda $24
D937: C5 CF    cmp $cf
D939: F0 03    beq $d93e
D93B: 20 A0 D9 jsr $d9a0
D93E: 38       sec
D93F: A6 21    ldx $21
D941: BD 62 01 lda $0162, x
D944: 20 47 DE jsr $de47
D947: C6 21    dec $21
D949: C6 21    dec $21
D94B: 10 F2    bpl $d93f
D94D: C6 24    dec $24
D94F: 10 B7    bpl $d908
D951: 4C 99 D9 jmp $d999
D954: FE 00 A0 inc $a000, x
D957: 01 91    ora ($91, x)
D959: 08       php
D95A: 88       dey
D95B: 8A       txa
D95C: 91 08    sta ($08), y
D95E: A5 08    lda $08
D960: 18       clc
D961: 69 02    adc #$02
D963: 85 08    sta $08
D965: 90 02    bcc $d969
D967: E6 09    inc $09
D969: 60       rts
D96A: A0 00    ldy #$00
D96C: F0 1A    beq $d988
D96E: A0 01    ldy #$01
D970: D0 16    bne $d988
D972: A0 02    ldy #$02
D974: D0 12    bne $d988
D976: A0 04    ldy #$04
D978: D0 0E    bne $d988
D97A: A0 03    ldy #$03
D97C: D0 0A    bne $d988
D97E: A0 05    ldy #$05
D980: D0 06    bne $d988
D982: A0 06    ldy #$06
D984: D0 02    bne $d988
D986: A0 07    ldy #$07
D988: A9 00    lda #$00
D98A: 4C 5F E4 jmp $e45f
D98D: AD 0A 60 lda $600a
D990: 29 0C    and #$0c
D992: D0 02    bne $d996
D994: 09 01    ora #$01
D996: A8       tay
D997: D0 EF    bne $d988
D999: A9 01    lda #$01
D99B: A0 40    ldy #$40
D99D: 4C 7F E4 jmp $e47f
D9A0: A0 68    ldy #$68
D9A2: A9 01    lda #$01
D9A4: 4C 7F E4 jmp $e47f
D9A7: A9 01    lda #$01
D9A9: 85 24    sta $24
D9AB: 20 99 D9 jsr $d999
D9AE: 20 66 E4 jsr $e466
D9B1: 20 72 D9 jsr $d972
D9B4: A9 A0    lda #$a0
D9B6: 85 04    sta $04
D9B8: 85 06    sta $06
D9BA: A9 01    lda #$01
D9BC: 85 07    sta $07
D9BE: A6 24    ldx $24
D9C0: BD F6 D9 lda $d9f6, x
D9C3: 85 05    sta $05
D9C5: A9 00    lda #$00
D9C7: 85 0A    sta $0a
D9C9: A2 04    ldx #$04
D9CB: 20 A9 E4 jsr $e4a9
D9CE: A9 04    lda #$04
D9D0: 18       clc
D9D1: 65 24    adc $24
D9D3: 85 21    sta $21
D9D5: A5 D0    lda $d0
D9D7: F0 09    beq $d9e2
D9D9: A5 24    lda $24
D9DB: C5 CF    cmp $cf
D9DD: F0 03    beq $d9e2
D9DF: 20 A0 D9 jsr $d9a0
D9E2: 38       sec
D9E3: A6 21    ldx $21
D9E5: BD 68 01 lda $0168, x
D9E8: 20 47 DE jsr $de47
D9EB: C6 21    dec $21
D9ED: C6 21    dec $21
D9EF: 10 F2    bpl $d9e3
D9F1: C6 24    dec $24
D9F3: 10 B6    bpl $d9ab
D9F5: 60       rts
D9F6: FE 00 A8 inc $a800, x
D9F9: BE 4A 4D ldx $4d4a, y
D9FC: B9 4B 4D lda $4d4b, y
D9FF: 20 56 D9 jsr $d956
DA02: 60       rts
DA03: 20 6E D9 jsr $d96e
DA06: A2 01    ldx #$01
DA08: 86 21    stx $21
DA0A: B5 42    lda $42, x
DA0C: F0 30    beq $da3e
DA0E: 30 2E    bmi $da3e
DA10: C9 05    cmp #$05
DA12: 90 02    bcc $da16
DA14: A9 05    lda #$05
DA16: 85 22    sta $22
DA18: BD 47 DA lda $da47, x
DA1B: 48       pha
DA1C: BD 45 DA lda $da45, x
DA1F: AA       tax
DA20: 68       pla
DA21: 20 EE E1 jsr $e1ee
DA24: AD C7 45 lda $45c7
DA27: AE C6 45 ldx $45c6
DA2A: 20 56 D9 jsr $d956
DA2D: A4 21    ldy $21
DA2F: B9 49 DA lda $da49, y
DA32: BE 4B DA ldx $da4b, y
DA35: A0 00    ldy #$00
DA37: 20 8A E4 jsr $e48a
DA3A: C6 22    dec $22
DA3C: D0 E6    bne $da24
DA3E: C6 21    dec $21
DA40: A6 21    ldx $21
DA42: 10 C6    bpl $da0a
DA44: 60       rts
DA45: 74 74    nop $74, x
DA47: A0 58    ldy #$58
DA49: F8       sed
DA4A: 08       php
DA4B: FB FB A6 isb $a6fb, y
DA4E: CF B5 00 dcp $00b5
DA51: C9 08    cmp #$08
DA53: D0 33    bne $da88
DA55: B5 4D    lda $4d, x
DA57: AA       tax
DA58: BD 31 C1 lda $c131, x
DA5B: 29 A8    and #$a8
DA5D: F0 29    beq $da88
DA5F: AD 3E 01 lda $013e
DA62: 30 24    bmi $da88
DA64: 20 86 D9 jsr $d986
DA67: 20 66 E4 jsr $e466
DA6A: A9 E0    lda #$e0
DA6C: AA       tax
DA6D: A0 00    ldy #$00
DA6F: 20 8A E4 jsr $e48a
DA72: AD 3E 01 lda $013e
DA75: D0 0D    bne $da84
DA77: 38       sec
DA78: 20 54 DE jsr $de54
DA7B: 18       clc
DA7C: A9 00    lda #$00
DA7E: 20 54 DE jsr $de54
DA81: 4C 88 DA jmp $da88
DA84: 38       sec
DA85: 20 47 DE jsr $de47
DA88: 60       rts
DA89: A6 CF    ldx $cf
DA8B: B5 00    lda $00, x
DA8D: C9 1A    cmp #$1a
DA8F: D0 42    bne $dad3
DA91: BD 7A 01 lda $017a, x
DA94: C9 01    cmp #$01
DA96: D0 3B    bne $dad3
DA98: 4A       lsr a
DA99: 85 39    sta $39
DA9B: B4 4D    ldy $4d, x
DA9D: B9 D4 DA lda $dad4, y
DAA0: 85 38    sta $38
DAA2: A0 03    ldy #$03
DAA4: 06 38    asl $38
DAA6: 26 39    rol $39
DAA8: 88       dey
DAA9: 10 F9    bpl $daa4
DAAB: B5 E9    lda $e9, x
DAAD: 18       clc
DAAE: 65 38    adc $38
DAB0: 85 38    sta $38
DAB2: 90 02    bcc $dab6
DAB4: E6 39    inc $39
DAB6: 20 66 E4 jsr $e466
DAB9: A9 F8    lda #$f8
DABB: A2 04    ldx #$04
DABD: A0 00    ldy #$00
DABF: 20 8A E4 jsr $e48a
DAC2: A5 39    lda $39
DAC4: 38       sec
DAC5: 20 47 DE jsr $de47
DAC8: A5 38    lda $38
DACA: 20 47 DE jsr $de47
DACD: A9 00    lda #$00
DACF: 18       clc
DAD0: 20 47 DE jsr $de47
DAD3: 60       rts
DAD4: 00       brk
DAD5: 02       kil
DAD6: 06 12    asl $12
DAD8: 20 A6 CF jsr $cfa6
DADB: B5 00    lda $00, x
DADD: C9 08    cmp #$08
DADF: D0 22    bne $db03
DAE1: 20 66 E4 jsr $e466
DAE4: A9 6F    lda #$6f
DAE6: A2 68    ldx #$68
DAE8: A0 00    ldy #$00
DAEA: 20 8A E4 jsr $e48a
DAED: A6 CF    ldx $cf
DAEF: B5 E9    lda $e9, x
DAF1: 38       sec
DAF2: 20 47 DE jsr $de47
DAF5: A9 00    lda #$00
DAF7: 20 47 DE jsr $de47
DAFA: A9 20    lda #$20
DAFC: 05 F2    ora $f2
DAFE: 85 F2    sta $f2
DB00: 4C 09 DB jmp $db09
DB03: A9 DF    lda #$df
DB05: 25 F2    and $f2
DB07: 85 F2    sta $f2
DB09: 60       rts
DB0A: A5 F5    lda $f5
DB0C: 29 02    and #$02
DB0E: F0 22    beq $db32
DB10: 20 66 E4 jsr $e466
DB13: A0 00    ldy #$00
DB15: A2 5C    ldx #$5c
DB17: A9 0C    lda #$0c
DB19: 20 8A E4 jsr $e48a
DB1C: A6 CF    ldx $cf
DB1E: BD 16 05 lda $0516, x
DB21: 38       sec
DB22: 20 47 DE jsr $de47
DB25: A6 CF    ldx $cf
DB27: BD 14 05 lda $0514, x
DB2A: 20 47 DE jsr $de47
DB2D: A9 00    lda #$00
DB2F: 20 47 DE jsr $de47
DB32: 60       rts
DB33: 20 7A D9 jsr $d97a
DB36: A9 7F    lda #$7f
DB38: 25 F4    and $f4
DB3A: 85 F4    sta $f4
DB3C: A4 CF    ldy $cf
DB3E: B9 F6 00 lda $00f6, y
DB41: 48       pha
DB42: 29 03    and #$03
DB44: AA       tax
DB45: BD F2 DB lda $dbf2, x
DB48: 18       clc
DB49: 65 CF    adc $cf
DB4B: 85 24    sta $24
DB4D: 68       pla
DB4E: 29 01    and #$01
DB50: 85 7B    sta $7b
DB52: AA       tax
DB53: BD F2 DB lda $dbf2, x
DB56: 85 7B    sta $7b
DB58: A9 04    lda #$04
DB5A: 85 23    sta $23
DB5C: 20 66 E4 jsr $e466
DB5F: A6 24    ldx $24
DB61: BD 44 01 lda $0144, x
DB64: 30 2F    bmi $db95
DB66: A6 7B    ldx $7b
DB68: BD A2 DB lda $dba2, x
DB6B: 85 07    sta $07
DB6D: BD B6 DB lda $dbb6, x
DB70: 85 06    sta $06
DB72: BD CA DB lda $dbca, x
DB75: 85 05    sta $05
DB77: BD DE DB lda $dbde, x
DB7A: 85 04    sta $04
DB7C: 86 22    stx $22
DB7E: A9 00    lda #$00
DB80: 85 0A    sta $0a
DB82: A2 04    ldx #$04
DB84: 20 A9 E4 jsr $e4a9
DB87: A6 24    ldx $24
DB89: BD 71 04 lda $0471, x
DB8C: 38       sec
DB8D: 20 47 DE jsr $de47
DB90: A9 00    lda #$00
DB92: 20 47 DE jsr $de47
DB95: C6 7B    dec $7b
DB97: C6 7B    dec $7b
DB99: C6 24    dec $24
DB9B: C6 24    dec $24
DB9D: C6 23    dec $23
DB9F: 10 BB    bpl $db5c
DBA1: 60       rts
DBA2: 02       kil
DBA3: 02       kil
DBA4: FE FE FD inc $fdfe, x
DBA7: FD 02 02 sbc $0202, x
DBAA: 00       brk
DBAB: 00       brk
DBAC: 02       kil
DBAD: 02       kil
DBAE: FF FF FD isb $fdff, x
DBB1: FD FF FF sbc $ffff, x
DBB4: 02       kil
DBB5: 02       kil
DBB6: 20 20 00 jsr $0020
DBB9: 00       brk
DBBA: 60       rts
DBBB: 60       rts
DBBC: 00       brk
DBBD: 00       brk
DBBE: 00       brk
DBBF: 00       brk
DBC0: 00       brk
DBC1: 00       brk
DBC2: 90 90    bcc $db54
DBC4: 80 80    nop #$80
DBC6: 30 30    bmi $dbf8
DBC8: 10 10    bpl $dbda
DBCA: 02       kil
DBCB: 02       kil
DBCC: 02       kil
DBCD: 02       kil
DBCE: FD FD FD sbc $fdfd, x
DBD1: FD FD FD sbc $fdfd, x
DBD4: FF FF 02 isb $02ff, x
DBD7: 02       kil
DBD8: FF FF FD isb $fdff, x
DBDB: FD 02 02 sbc $0202, x
DBDE: 60       rts
DBDF: 60       rts
DBE0: 80 80    nop #$80
DBE2: 60       rts
DBE3: 60       rts
DBE4: E0 E0    cpx #$e0
DBE6: 00       brk
DBE7: 00       brk
DBE8: A0 A0    ldy #$a0
DBEA: E0 E0    cpx #$e0
DBEC: FF FF 10 isb $10ff, x
DBEF: 10 E0    bpl $dbd1
DBF1: E0 08    cpx #$08
DBF3: 12       kil
DBF4: 1C A0 1F nop $1fa0, x
DBF7: 84 23    sty $23
DBF9: A5 F2    lda $f2
DBFB: 85 38    sta $38
DBFD: A5 F3    lda $f3
DBFF: 85 39    sta $39
DC01: A5 F4    lda $f4
DC03: 85 3A    sta $3a
DC05: A5 F5    lda $f5
DC07: 85 3B    sta $3b
DC09: 06 38    asl $38
DC0B: 26 39    rol $39
DC0D: 26 3A    rol $3a
DC0F: 26 3B    rol $3b
DC11: 90 14    bcc $dc27
DC13: A4 23    ldy $23
DC15: B9 48 DC lda $dc48, y
DC18: BE 2C DC ldx $dc2c, y
DC1B: 20 EE E1 jsr $e1ee
DC1E: A4 23    ldy $23
DC20: B9 64 DC lda $dc64, y
DC23: A8       tay
DC24: 20 FC E1 jsr $e1fc
DC27: C6 23    dec $23
DC29: 10 DE    bpl $dc09
DC2B: 60       rts
DC2C: 00       brk
DC2D: 00       brk
DC2E: C0 C0    cpy #$c0
DC30: C0 60    cpy #$60
DC32: 5C 1C 50 nop $501c, x
DC35: 44 38    nop $38
DC37: 2C 20 14 bit $1420
DC3A: 00       brk
DC3B: 5C 34 28 nop $2834, x
DC3E: C8       iny
DC3F: 28       plp
DC40: 14 F0    nop $f0, x
DC42: F0 F0    beq $dc34
DC44: 10 5C    bpl $dca2
DC46: 28       plp
DC47: 28       plp
DC48: 00       brk
DC49: 00       brk
DC4A: D0 D0    bne $dc1c
DC4C: D0 6C    bne $dcba
DC4E: D0 91    bne $dbe1
DC50: D6 CA    dec $ca, x
DC52: C7 D0    dcp $d0
DC54: D0 D9    bne $dc2f
DC56: 18       clc
DC57: EC E0 DA cpx $dae0
DC5A: D0 E0    bne $dc3c
DC5C: 08       php
DC5D: 30 C0    bmi $dc1f
DC5F: B8       clv
DC60: F0 D6    beq $dc38
DC62: D8       cld
DC63: D8       cld
DC64: 00       brk
DC65: 00       brk
DC66: 0B 09    anc #$09
DC68: 09 0A    ora #$0a
DC6A: 08       php
DC6B: 07 0C    slo $0c
DC6D: 0D 0E 0F ora $0f0e
DC70: 10 11    bpl $dc83
DC72: 1A       nop
DC73: 1B 1C 1D slo $1d1c, y
DC76: 1E 1F 20 asl $201f, x
DC79: 21 22    and ($22, x)
DC7B: 06 23    asl $23
DC7D: 24 25    bit $25
DC7F: 26 AD    rol $ad
DC81: 35 04    and $04, x
DC83: A0 07    ldy #$07
DC85: 0A       asl a
DC86: B0 03    bcs $dc8b
DC88: 88       dey
DC89: D0 FA    bne $dc85
DC8B: 84 23    sty $23
DC8D: B9 A4 DC lda $dca4, y
DC90: A2 00    ldx #$00
DC92: 20 EE E1 jsr $e1ee
DC95: A4 23    ldy $23
DC97: B9 AC DC lda $dcac, y
DC9A: A8       tay
DC9B: 20 FC E1 jsr $e1fc
DC9E: A0 1A    ldy #$1a
DCA0: 20 FC E1 jsr $e1fc
DCA3: 60       rts
DCA4: E6 E6    inc $e6
DCA6: E0 E8    cpx #$e8
DCA8: DC D4 CC nop $ccd4, x
DCAB: D0 12    bne $dcbf
DCAD: 13 14    slo ($14), y
DCAF: 15 16    ora $16, x
DCB1: 17 18    slo $18, x
DCB3: 19 A6 CF ora $cfa6, y
DCB6: B5 00    lda $00, x
DCB8: C9 12    cmp #$12
DCBA: F0 39    beq $dcf5
DCBC: C9 24    cmp #$24
DCBE: F0 0E    beq $dcce
DCC0: C9 22    cmp #$22
DCC2: F0 0A    beq $dcce
DCC4: C9 16    cmp #$16
DCC6: D0 5B    bne $dd23
DCC8: A5 F4    lda $f4
DCCA: 29 9F    and #$9f
DCCC: 85 F4    sta $f4
DCCE: A5 D6    lda $d6
DCD0: F0 18    beq $dcea
DCD2: 20 5A DD jsr $dd5a
DCD5: A9 E0    lda #$e0
DCD7: A2 34    ldx #$34
DCD9: 20 EE E1 jsr $e1ee
DCDC: A0 00    ldy #$00
DCDE: 20 FC E1 jsr $e1fc
DCE1: A5 F4    lda $f4
DCE3: 29 FE    and #$fe
DCE5: 09 08    ora #$08
DCE7: 4C F3 DC jmp $dcf3
DCEA: 20 3C DD jsr $dd3c
DCED: A9 01    lda #$01
DCEF: 05 F4    ora $f4
DCF1: 29 F7    and #$f7
DCF3: 85 F4    sta $f4
DCF5: A9 E6    lda #$e6
DCF7: A2 40    ldx #$40
DCF9: 20 EE E1 jsr $e1ee
DCFC: A0 01    ldy #$01
DCFE: 20 FC E1 jsr $e1fc
DD01: A6 CF    ldx $cf
DD03: BD 68 01 lda $0168, x
DD06: 1D 6A 01 ora $016a, x
DD09: 1D 6C 01 ora $016c, x
DD0C: D0 15    bne $dd23
DD0E: B5 00    lda $00, x
DD10: C9 12    cmp #$12
DD12: D0 0F    bne $dd23
DD14: A9 E0    lda #$e0
DD16: A2 38    ldx #$38
DD18: 20 EE E1 jsr $e1ee
DD1B: A0 02    ldy #$02
DD1D: 20 FC E1 jsr $e1fc
DD20: 4C 23 DD jmp $dd23
DD23: A2 74    ldx #$74
DD25: A9 F4    lda #$f4
DD27: 20 EE E1 jsr $e1ee
DD2A: A0 03    ldy #$03
DD2C: 20 FC E1 jsr $e1fc
DD2F: A2 68    ldx #$68
DD31: A9 F8    lda #$f8
DD33: 20 EE E1 jsr $e1ee
DD36: A0 04    ldy #$04
DD38: 20 FC E1 jsr $e1fc
DD3B: 60       rts
DD3C: A5 F1    lda $f1
DD3E: 29 03    and #$03
DD40: A8       tay
DD41: C0 02    cpy #$02
DD43: F0 0A    beq $dd4f
DD45: B9 56 DD lda $dd56, y
DD48: 05 F5    ora $f5
DD4A: 85 F5    sta $f5
DD4C: 4C 55 DD jmp $dd55
DD4F: A5 F4    lda $f4
DD51: 09 02    ora #$02
DD53: 85 F4    sta $f4
DD55: 60       rts
DD56: 00       brk
DD57: 04 00    nop $00
DD59: 08       php
DD5A: A5 F5    lda $f5
DD5C: 29 F3    and #$f3
DD5E: 85 F5    sta $f5
DD60: A5 F4    lda $f4
DD62: 29 FD    and #$fd
DD64: 85 F4    sta $f4
DD66: 60       rts
DD67: A5 D0    lda $d0
DD69: D0 3B    bne $dda6
DD6B: A6 CF    ldx $cf
DD6D: B5 00    lda $00, x
DD6F: C9 1E    cmp #$1e
DD71: F0 33    beq $dda6
DD73: A5 D6    lda $d6
DD75: F0 19    beq $dd90
DD77: A2 29    ldx #$29
DD79: A9 08    lda #$08
DD7B: A0 00    ldy #$00
DD7D: 20 EE E1 jsr $e1ee
DD80: A5 D6    lda $d6
DD82: 20 A7 DD jsr $dda7
DD85: A5 22    lda $22
DD87: 38       sec
DD88: 20 47 DE jsr $de47
DD8B: A5 23    lda $23
DD8D: 20 47 DE jsr $de47
DD90: A6 CF    ldx $cf
DD92: B5 00    lda $00, x
DD94: C9 22    cmp #$22
DD96: D0 0E    bne $dda6
DD98: A9 C4    lda #$c4
DD9A: A2 C6    ldx #$c6
DD9C: 20 EE E1 jsr $e1ee
DD9F: A2 2E    ldx #$2e
DDA1: A9 56    lda #$56
DDA3: 20 53 E4 jsr $e453
DDA6: 60       rts
DDA7: 85 24    sta $24
DDA9: A0 07    ldy #$07
DDAB: A9 00    lda #$00
DDAD: 85 23    sta $23
DDAF: 85 22    sta $22
DDB1: F8       sed
DDB2: 06 24    asl $24
DDB4: A5 23    lda $23
DDB6: 65 23    adc $23
DDB8: 85 23    sta $23
DDBA: A5 22    lda $22
DDBC: 65 22    adc $22
DDBE: 85 22    sta $22
DDC0: 88       dey
DDC1: 10 EF    bpl $ddb2
DDC3: D8       cld
DDC4: 60       rts
DDC5: A9 07    lda #$07
DDC7: 85 21    sta $21
DDC9: 20 EB DD jsr $ddeb
DDCC: 20 66 E4 jsr $e466
DDCF: A6 21    ldx $21
DDD1: BC AA 04 ldy $04aa, x
DDD4: A9 02    lda #$02
DDD6: 20 7F E4 jsr $e47f
DDD9: A5 21    lda $21
DDDB: 0A       asl a
DDDC: A8       tay
DDDD: BE 6A 4A ldx $4a6a, y
DDE0: B9 6B 4A lda $4a6b, y
DDE3: 20 53 E4 jsr $e453
DDE6: C6 21    dec $21
DDE8: 10 E2    bpl $ddcc
DDEA: 60       rts
DDEB: AD AA 04 lda $04aa
DDEE: 10 0D    bpl $ddfd
DDF0: AD 7F 01 lda $017f
DDF3: 30 08    bmi $ddfd
DDF5: CE 7F 01 dec $017f
DDF8: 10 03    bpl $ddfd
DDFA: 20 2D DE jsr $de2d
DDFD: A2 07    ldx #$07
DDFF: BD AA 04 lda $04aa, x
DE02: 18       clc
DE03: 7D B2 04 adc $04b2, x
DE06: 9D AA 04 sta $04aa, x
DE09: 10 0E    bpl $de19
DE0B: A9 00    lda #$00
DE0D: 38       sec
DE0E: FD B2 04 sbc $04b2, x
DE11: 9D B2 04 sta $04b2, x
DE14: 30 03    bmi $de19
DE16: 9D AA 04 sta $04aa, x
DE19: CA       dex
DE1A: 10 E3    bpl $ddff
DE1C: 60       rts
DE1D: A2 07    ldx #$07
DE1F: A9 7F    lda #$7f
DE21: 9D AA 04 sta $04aa, x
DE24: A9 03    lda #$03
DE26: 9D B2 04 sta $04b2, x
DE29: CA       dex
DE2A: 10 F3    bpl $de1f
DE2C: 60       rts
DE2D: A2 07    ldx #$07
DE2F: A9 7F    lda #$7f
DE31: 9D AA 04 sta $04aa, x
DE34: CA       dex
DE35: 10 F8    bpl $de2f
DE37: A2 07    ldx #$07
DE39: AD 0A 60 lda $600a
DE3C: 29 07    and #$07
DE3E: 09 01    ora #$01
DE40: 9D B2 04 sta $04b2, x
DE43: CA       dex
DE44: 10 F3    bpl $de39
DE46: 60       rts
DE47: 48       pha
DE48: 08       php
DE49: 4A       lsr a
DE4A: 4A       lsr a
DE4B: 4A       lsr a
DE4C: 4A       lsr a
DE4D: 28       plp
DE4E: 20 54 DE jsr $de54
DE51: 68       pla
DE52: 29 0F    and #$0f
DE54: 90 05    bcc $de5b
DE56: 29 0F    and #$0f
DE58: F0 08    beq $de62
DE5A: 18       clc
DE5B: 0A       asl a
DE5C: 08       php
DE5D: 20 F8 D9 jsr $d9f8
DE60: 28       plp
DE61: 60       rts
DE62: AE 48 4D ldx $4d48
DE65: AD 49 4D lda $4d49
DE68: 08       php
DE69: 20 56 D9 jsr $d956
DE6C: 28       plp
DE6D: 60       rts

multiply_de6e:
DE6E: A9 00    lda #$00
DE70: 85 1B    sta resl_1b
DE72: 85 1C    sta resh_1c
DE74: A0 07    ldy #$07
DE76: 06 1B    asl resl_1b
DE78: 26 1C    rol resh_1c
DE7A: 06 19    asl $19
DE7C: 90 0B    bcc $de89
DE7E: A5 1A    lda $1a
DE80: 18       clc
DE81: 65 1B    adc resl_1b		;ADD IN MULTIPLICAND
DE83: 85 1B    sta resl_1b
DE85: 90 02    bcc $de89
DE87: E6 1C    inc resh_1c
DE89: 88       dey
DE8A: 10 EA    bpl $de76
DE8C: 60       rts



E0D3: A9 8F    lda #$8f
E0D5: D0 38    bne $e10f
E0D7: A9 BF    lda #$bf
E0D9: D0 34    bne $e10f
E0DB: A9 0F    lda #$0f
E0DD: D0 30    bne $e10f
E0DF: A9 1F    lda #$1f
E0E1: D0 2C    bne $e10f
E0E3: A9 2F    lda #$2f
E0E5: D0 28    bne $e10f
E0E7: A9 5F    lda #$5f
E0E9: D0 24    bne $e10f
E0EB: A9 6F    lda #$6f
E0ED: D0 20    bne $e10f
E0EF: A9 7F    lda #$7f
E0F1: D0 1C    bne $e10f
E0F3: A9 3F    lda #$3f
E0F5: D0 18    bne $e10f
E0F7: A9 4F    lda #$4f
E0F9: D0 14    bne $e10f
E0FB: A9 9F    lda #$9f
E0FD: D0 10    bne $e10f
E0FF: A9 AF    lda #$af
E101: D0 11    bne $e114
E103: A9 CF    lda #$cf
E105: D0 08    bne $e10f
E107: A9 DF    lda #$df
E109: D0 04    bne $e10f
E10B: A9 EF    lda #$ef
E10D: D0 00    bne $e10f
E10F: 24 D0    bit $d0
E111: D0 01    bne $e114
E113: 60       rts
E114: 86 25    stx $25
E116: 84 26    sty $26
E118: A8       tay
E119: A2 0F    ldx #$0f
E11B: B9 8D DE lda $de8d, y
E11E: F0 0E    beq $e12e
E120: 86 8C    stx $8c
E122: 95 8E    sta $8e, x
E124: A9 01    lda #$01
E126: 95 AE    sta $ae, x
E128: 95 BE    sta $be, x
E12A: A9 FF    lda #$ff
E12C: 85 8C    sta $8c
E12E: 88       dey
E12F: CA       dex
E130: 10 E9    bpl $e11b
E132: A6 25    ldx $25
E134: A4 26    ldy $26
E136: 60       rts
E137: A2 0F    ldx #$0f
E139: B5 8E    lda $8e, x
E13B: F0 7E    beq $e1bb
E13D: E4 8C    cpx $8c
E13F: F0 7A    beq $e1bb
E141: D6 AE    dec $ae, x
E143: D0 76    bne $e1bb
E145: D6 BE    dec $be, x
E147: D0 38    bne $e181
E149: F6 8E    inc $8e, x
E14B: F6 8E    inc $8e, x
E14D: B5 8E    lda $8e, x
E14F: 0A       asl a
E150: A8       tay
E151: B0 10    bcs $e163
E153: B9 77 DF lda $df77, y
E156: 95 9E    sta $9e, x
E158: B9 7A DF lda $df7a, y
E15B: 95 BE    sta $be, x
E15D: B9 78 DF lda $df78, y
E160: 4C 70 E1 jmp $e170
E163: B9 77 E0 lda $e077, y
E166: 95 9E    sta $9e, x
E168: B9 7A E0 lda $e07a, y
E16B: 95 BE    sta $be, x
E16D: B9 78 E0 lda $e078, y
E170: 95 AE    sta $ae, x
E172: D0 0A    bne $e17e
E174: 95 8E    sta $8e, x
E176: B5 9E    lda $9e, x
E178: F0 04    beq $e17e
E17A: 95 8E    sta $8e, x
E17C: D0 CB    bne $e149
E17E: 4C AC E1 jmp $e1ac
E181: 0A       asl a
E182: A8       tay
E183: B0 0B    bcs $e190
E185: B9 78 DF lda $df78, y
E188: 95 AE    sta $ae, x
E18A: B9 79 DF lda $df79, y
E18D: 4C 98 E1 jmp $e198
E190: B9 78 E0 lda $e078, y
E193: 95 AE    sta $ae, x
E195: B9 79 E0 lda $e079, y
E198: B4 9E    ldy $9e, x
E19A: 18       clc
E19B: 75 9E    adc $9e, x
E19D: 95 9E    sta $9e, x
E19F: 8A       txa
E1A0: 4A       lsr a
E1A1: 90 09    bcc $e1ac
E1A3: 98       tya
E1A4: 55 9E    eor $9e, x
E1A6: 29 F0    and #$f0
E1A8: 55 9E    eor $9e, x
E1AA: 95 9E    sta $9e, x
E1AC: B5 9E    lda $9e, x
E1AE: E0 08    cpx #$08
E1B0: 90 06    bcc $e1b8
E1B2: 9D F8 67 sta $67f8, x
E1B5: 4C BB E1 jmp $e1bb
E1B8: 9D 00 60 sta $6000, x
E1BB: CA       dex
E1BC: 30 03    bmi $e1c1
E1BE: 4C 39 E1 jmp $e139
E1C1: 60       rts
E1C2: A9 00    lda #$00
E1C4: 8D 0F 60 sta $600f
E1C7: 8D 0F 68 sta $680f
E1CA: A9 07    lda #$07
E1CC: 8D 0F 60 sta $600f
E1CF: 8D 0F 68 sta $680f
E1D2: A2 0F    ldx #$0f
E1D4: A9 00    lda #$00
E1D6: 9D 00 60 sta $6000, x
E1D9: 9D 00 68 sta $6800, x
E1DC: 95 8E    sta $8e, x
E1DE: 95 9E    sta $9e, x
E1E0: CA       dex
E1E1: 10 F3    bpl $e1d6
E1E3: A9 00    lda #$00
E1E5: 8D 08 60 sta $6008
E1E8: A2 00    ldx #$00
E1EA: 8E 08 68 stx $6808
E1ED: 60       rts
E1EE: 48       pha
E1EF: 8A       txa
E1F0: 48       pha
E1F1: 20 66 E4 jsr $e466
E1F4: 68       pla
E1F5: AA       tax
E1F6: 68       pla
E1F7: A0 00    ldy #$00
E1F9: 4C 8A E4 jmp $e48a
E1FC: 84 22    sty $22
E1FE: A9 00    lda #$00
E200: A0 03    ldy #$03
E202: 20 5F E4 jsr $e45f
E205: A4 22    ldy $22
E207: A9 00    lda #$00
E209: 0A       asl a
E20A: 0A       asl a
E20B: C0 1D    cpy #$1d
E20D: 90 0A    bcc $e219
E20F: 69 01    adc #$01
E211: AA       tax
E212: 98       tya
E213: 38       sec
E214: E9 1D    sbc #$1d
E216: A8       tay
E217: 10 01    bpl $e21a
E219: AA       tax
E21A: BD 7B E2 lda $e27b, x
E21D: 85 20    sta $20
E21F: BD 7A E2 lda $e27a, x
E222: 85 1F    sta $1f
E224: 18       clc
E225: 71 1F    adc ($1f), y
E227: 85 1F    sta $1f
E229: 90 02    bcc $e22d
E22B: E6 20    inc $20
E22D: A0 00    ldy #$00
E22F: A2 00    ldx #$00
E231: A1 1F    lda ($1f, x)
E233: 85 22    sta $22
E235: 4A       lsr a
E236: 4A       lsr a
E237: 20 56 E2 jsr $e256
E23A: A1 1F    lda ($1f, x)
E23C: 2A       rol a
E23D: 26 22    rol $22
E23F: 2A       rol a
E240: A5 22    lda $22
E242: 2A       rol a
E243: 0A       asl a
E244: 20 5C E2 jsr $e25c
E247: A1 1F    lda ($1f, x)
E249: 85 22    sta $22
E24B: 20 56 E2 jsr $e256
E24E: 46 22    lsr $22
E250: 90 DF    bcc $e231
E252: 88       dey
E253: 4C 72 E4 jmp $e472
E256: E6 1F    inc $1f
E258: D0 02    bne $e25c
E25A: E6 20    inc $20
E25C: 29 3E    and #$3e
E25E: D0 04    bne $e264
E260: 68       pla
E261: 68       pla
E262: D0 EE    bne $e252
E264: C9 0A    cmp #$0a
E266: 90 02    bcc $e26a
E268: 69 0D    adc #$0d
E26A: AA       tax
E26B: BD 46 4D lda $4d46, x
E26E: 91 08    sta ($08), y
E270: C8       iny
E271: BD 47 4D lda $4d47, x
E274: 91 08    sta ($08), y
E276: C8       iny
E277: A2 00    ldx #$00
E279: 60       rts
E27A: 7E E2 71 ror $71e2, x
E27D: E3 1D    isb ($1d, x)
E27F: 25 2B    and $2b
E281: 33 37    rla ($37), y
E283: 3B 3F 47 rla $473f, y
E286: 4B 57    asr #$57
E288: 61 65    adc ($65, x)
E28A: 6F 79 87 rra $8779
E28D: 95 A1    sta $a1, x
E28F: AD AD B1 lda $b1ad
E292: B5 BB    lda $bb, x
E294: BF C5 CD lax $cdc5, y
E297: D7 E1    dcp $e1, x
E299: E5 EB    sbc $eb
E29B: A5 92    lda $92
E29D: BD C2 BE lda $bec2, x
E2A0: 0A       asl a
E2A1: B6 00    ldx $00, y
E2A3: 59 62 48 eor $4862, y
E2A6: 66 D2    ror $d2
E2A8: 6D 9E 70 adc $709e
E2AB: 0C D4 0A nop $0ad4
E2AE: B2       kil
E2AF: 4C 00 B9 jmp $b900
E2B2: E6 B2    inc $b2
E2B4: 40       rti
E2B5: 56 52    lsr $52, x
E2B7: 80 00    nop #$00
E2B9: 83 74    sax ($74, x)
E2BB: 4D C0 4D eor $4dc0
E2BE: CE 2D 12 dec $122d
E2C1: 0E 1A 8A asl $8a1a
E2C4: 40       rti
E2C5: 83 64    sax ($64, x)
E2C7: 78       sei
E2C8: 00       brk
E2C9: 8B 6E    ane #$6e
E2CB: BB 66 90 las $9066, y
E2CE: 4E 9C 68 lsr $689c
E2D1: 82 70    nop #$70
E2D3: 48       pha
E2D4: 00       brk
E2D5: BB 26 9E las $9e26, y
E2D8: 02       kil
E2D9: B2       kil
E2DA: 4A       lsr a
E2DB: 3E 26 B0 rol $b026, x
E2DE: 00       brk
E2DF: 34 E4    nop $e4, x
E2E1: CD C0 83 cmp $83c0
E2E4: 64 78    nop $78
E2E6: 4A       lsr a
E2E7: 3E 1A D1 rol $d11a, x
E2EA: 70 4A    bvs $e336
E2EC: 00       brk
E2ED: 3C E4 5D nop $5de4, x
E2F0: 8A       txa
E2F1: C6 60    dec $60
E2F3: 2E 1A 9C rol $9c1a
E2F6: AF 4C B0 lax $b04c
E2F9: 4D 82 EC eor $ec82
E2FC: F2       kil
E2FD: B0 5A    bcs $e359
E2FF: 93 70    sha ($70), y
E301: 69 60    adc #$60
E303: B8       clv
E304: 00       brk
E305: A5 92    lda $92
E307: BD C2 B4 lda $b4c2, x
E30A: F0 2E    beq $e33a
E30C: 12       kil
E30D: 09 B2    ora #$b2
E30F: C6 26    dec $26
E311: 95 C0    sta $c0, x
E313: C4 C2    cpy $c2
E315: 3B 0A 92 rla $920a, y
E318: D2       kil
E319: 0C 12 C6 nop $c612
E31C: 12       kil
E31D: B5 C0    lda $c0, x
E31F: C5 8A    cmp $8a
E321: 3E 26 B0 rol $b026, x
E324: 70 98    bvs $e2be
E326: 6E 4C 12 ror $124c
E329: 3E 00 54 rol $5400, x
E32C: 32       kil
E32D: 93 FB    sha ($fb), y
E32F: 5E 64 92 lsr $9264, x
E332: 6D 3C C2 adc $c23c
E335: A3 60    lax ($60, x)
E337: 9E 00 A3 shx $a300, y
E33A: 60       rts
E33B: 9E 00 29 shx $2900, y
E33E: D2       kil
E33F: 0D 1A 84 ora $841a
E342: F1 7B    sbc ($7b), y
E344: 60       rts
E345: 82 6C    nop #$6c
E347: 0D 1A 84 ora $841a
E34A: F1 A4    sbc ($a4), y
E34C: E4 C3    cpx $c3
E34E: 72       kil
E34F: B8       clv
E350: 68       pla
E351: 6C 0A C2 jmp ($c20a)
E354: 40       rti
E355: 5C F0 C1 nop $c1f0, x
E358: 42       kil
E359: 32       kil
E35A: 42       kil
E35B: 86 4E    stx $4e
E35D: 7F 40 0C rra $0c40, x
E360: 1A       nop
E361: BE 00 A4 ldx $a400, y
E364: 0A       asl a
E365: EA       nop
E366: 6C 08 00 jmp ($0008)
E369: 6C AE 4D jmp ($4dae)
E36C: B0 09    bcs $e377
E36E: E6 6C    inc $6c
E370: 80 10    nop #$10
E372: 1A       nop
E373: 24 2A    bit $2a
E375: 2E 38 40 rol $4038
E378: 48       pha
E379: 4E 58 62 lsr $6258
E37C: 68       pla
E37D: 6E 7E 86 ror $867e
E380: 8E 18 4E stx $4e18
E383: 9B 64 08 shs $0864, y
E386: C2 A4    nop #$a4
E388: 0A       asl a
E389: E8       inx
E38A: 00       brk
E38B: 2E 0A B3 rol $b30a
E38E: 42       kil
E38F: 89 E2    nop #$e2
E391: 87 38    sax $38
E393: E3 5B    isb ($5b, x)
E395: 3D 92 43 and $4392, x
E398: 70 B8    bvs $e352
E39A: 40       rti
E39B: 41 64    eor ($64, x)
E39D: 5A       nop
E39E: 6D BB 26 adc $26bb
E3A1: 9E 02 36 shx $3602, y
E3A4: 64 7A    nop $7a
E3A6: 6C B8 00 jmp ($00b8)
E3A9: C5 8A    cmp $8a
E3AB: 3E 26 B0 rol $b026, x
E3AE: 54 CA    nop $ca, x
E3B0: 61 BE    adc ($be, x)
E3B2: 68       pla
E3B3: 4D 82 34 eor $3482
E3B6: E4 CD    cpx $cd
E3B8: C0 92    cpy #$92
E3BA: 78       sei
E3BB: C0 6E    cpy #$6e
E3BD: 63 69    rra ($69, x)
E3BF: 18       clc
E3C0: 4E 9B 64 lsr $649b
E3C3: 09 02    ora #$02
E3C5: A4 0A    ldy $0a
E3C7: ED C0 20 sbc $20c0
E3CA: 4E 9B 64 lsr $649b
E3CD: B8       clv
E3CE: 46 0D    lsr $0d
E3D0: 20 2F 40 jsr $402f
E3D3: 4D 8A BB eor $bb8a
E3D6: 64 58    nop $58
E3D8: 00       brk
E3D9: 54 EC    nop $ec, x
E3DB: 0E 12 BE asl $be12
E3DE: 00       brk
E3DF: A5 92    lda $92
E3E1: BD C2 BE lda $bec2, x
E3E4: 0A       asl a
E3E5: B6 02    ldx $02, y
E3E7: 18       clc
E3E8: 4A       lsr a
E3E9: 92       kil
E3EA: 02       kil
E3EB: 53 6C    sre ($6c), y
E3ED: 48       pha
E3EE: 00       brk
E3EF: 3C 12 2D nop $2d12, x
E3F2: 82 B9    nop #$b9
E3F4: E6 B2    inc $b2
E3F6: 6F 3C 12 rra $123c
E3F9: 2D 82 C3 and $c382
E3FC: 62       kil
E3FD: 4D C0 3C eor $3cc0
E400: 12       kil
E401: 2D 82 C3 and $c382
E404: 62       kil
E405: 4D C2 2C eor $2cc2
E408: 90 0D    bcc $e417
E40A: CE 9D 92 dec $929d
E40D: B8       clv
E40E: 00       brk
E40F: A9 C0    lda #$c0
E411: D0 05    bne $e418
E413: 20 66 E4 jsr $e466
E416: A9 20    lda #$20
E418: A0 00    ldy #$00
E41A: 91 08    sta ($08), y
E41C: 4C C3 E4 jmp $e4c3
E41F: 90 04    bcc $e425
E421: 29 0F    and #$0f
E423: F0 05    beq $e42a
E425: 29 0F    and #$0f
E427: 18       clc
E428: 69 01    adc #$01
E42A: 08       php
E42B: 0A       asl a
E42C: A0 00    ldy #$00
E42E: AA       tax
E42F: BD 48 4D lda $4d48, x
E432: 91 08    sta ($08), y
E434: BD 49 4D lda $4d49, x
E437: C8       iny
E438: 91 08    sta ($08), y
E43A: 20 72 E4 jsr $e472
E43D: 28       plp
E43E: 60       rts
E43F: 38       sec
E440: E9 20    sbc #$20
E442: 4A       lsr a
E443: 29 1F    and #$1f
E445: 09 E0    ora #$e0
E447: A0 01    ldy #$01
E449: 91 08    sta ($08), y
E44B: 88       dey
E44C: 8A       txa
E44D: 6A       ror a
E44E: 91 08    sta ($08), y
E450: C8       iny
E451: D0 1F    bne $e472
E453: 38       sec
E454: E9 20    sbc #$20
E456: 4A       lsr a
E457: 29 1F    and #$1f
E459: 09 A0    ora #$a0
E45B: D0 EA    bne $e447
E45D: A4 0A    ldy $0a
E45F: 09 60    ora #$60
E461: AA       tax
E462: 98       tya
E463: 4C 6A E4 jmp $e46a
E466: A9 40    lda #$40
E468: A2 80    ldx #$80
E46A: A0 00    ldy #$00
E46C: 91 08    sta ($08), y
E46E: C8       iny
E46F: 8A       txa
E470: 91 08    sta ($08), y
E472: 98       tya
E473: 38       sec
E474: 65 08    adc $08
E476: 85 08    sta $08
E478: 90 02    bcc $e47c
E47A: E6 09    inc $09
E47C: 60       rts
E47D: A0 00    ldy #$00
E47F: 09 70    ora #$70
E481: AA       tax
E482: 98       tya
E483: 4C 6A E4 jmp $e46a
E486: A8       tay
E487: A9 00    lda #$00
E489: AA       tax
E48A: 84 0A    sty $0a
E48C: A0 00    ldy #$00
E48E: 0A       asl a
E48F: 90 01    bcc $e492
E491: 88       dey
E492: 84 05    sty $05
E494: 0A       asl a
E495: 26 05    rol $05
E497: 85 04    sta $04
E499: 8A       txa
E49A: 0A       asl a
E49B: A0 00    ldy #$00
E49D: 90 01    bcc $e4a0
E49F: 88       dey
E4A0: 84 07    sty $07
E4A2: 0A       asl a
E4A3: 26 07    rol $07
E4A5: 85 06    sta $06
E4A7: A2 04    ldx #$04
E4A9: A0 00    ldy #$00
E4AB: B5 02    lda $02, x
E4AD: 91 08    sta ($08), y
E4AF: B5 03    lda $03, x
E4B1: 29 1F    and #$1f
E4B3: C8       iny
E4B4: 91 08    sta ($08), y
E4B6: B5 00    lda $00, x
E4B8: C8       iny
E4B9: 91 08    sta ($08), y
E4BB: B5 01    lda $01, x
E4BD: 45 0A    eor $0a
E4BF: 29 1F    and #$1f
E4C1: 45 0A    eor $0a
E4C3: C8       iny
E4C4: 91 08    sta ($08), y
E4C6: D0 AA    bne $e472
E4C8: 00       brk
E4C9: 09 0A    ora #$0a
E4CB: 13 14    slo ($14), y
E4CD: 24 63    bit $63
E4CF: 04 5A    nop $5a
E4D1: 04 50    nop $50
E4D3: 04 A9    nop $a9
E4D5: 04 D0    nop $d0
E4D7: 06 A9    asl $a9
E4D9: 03 D0    slo ($d0, x)
E4DB: 02       kil
E4DC: A9 07    lda #$07
E4DE: A0 FF    ldy #$ff
E4E0: D0 08    bne $e4ea
E4E2: A9 03    lda #$03
E4E4: D0 02    bne $e4e8
E4E6: A9 04    lda #$04
E4E8: A0 00    ldy #$00
E4EA: 8C 70 01 sty $0170
E4ED: 48       pha
E4EE: 0D 71 01 ora $0171
E4F1: 8D 71 01 sta $0171
E4F4: 68       pla
E4F5: 0D 72 01 ora $0172
E4F8: 8D 72 01 sta $0172
E4FB: 60       rts
E4FC: A9 07    lda #$07
E4FE: 8D 71 01 sta $0171
E501: A9 00    lda #$00
E503: 8D 72 01 sta $0172
E506: AD 74 01 lda $0174
E509: D0 4B    bne $e556
E50B: AD 71 01 lda $0171
E50E: F0 46    beq $e556
E510: A2 00    ldx #$00
E512: 8E 75 01 stx $0175
E515: 8E 79 01 stx $0179
E518: 8E 78 01 stx $0178
E51B: A2 08    ldx #$08
E51D: 38       sec
E51E: 6E 78 01 ror $0178
E521: 0A       asl a
E522: CA       dex
E523: 90 F9    bcc $e51e
E525: A0 80    ldy #$80
E527: AD 78 01 lda $0178
E52A: 2D 72 01 and $0172
E52D: D0 02    bne $e531
E52F: A0 20    ldy #$20
E531: 8C 74 01 sty $0174
E534: AD 78 01 lda $0178
E537: 4D 71 01 eor $0171
E53A: 8D 71 01 sta $0171
E53D: 8A       txa
E53E: 0A       asl a
E53F: AA       tax
E540: BD C8 E4 lda $e4c8, x
E543: 8D 76 01 sta $0176
E546: BD C9 E4 lda $e4c9, x
E549: 8D 77 01 sta $0177
E54C: BD CE E4 lda $e4ce, x
E54F: 85 E1    sta $e1
E551: BD CF E4 lda $e4cf, x
E554: 85 E2    sta $e2
E556: A0 00    ldy #$00
E558: 8C 00 89 sty $8900
E55B: AD 74 01 lda $0174
E55E: D0 01    bne $e561
E560: 60       rts
E561: AC 75 01 ldy $0175
E564: AE 76 01 ldx $0176
E567: 0A       asl a
E568: 90 0D    bcc $e577
E56A: 9D 40 89 sta $8940, x
E56D: A9 40    lda #$40
E56F: 8D 74 01 sta $0174
E572: A0 0E    ldy #$0e
E574: 4C EA E5 jmp $e5ea
E577: 10 25    bpl $e59e
E579: A9 80    lda #$80
E57B: 8D 74 01 sta $0174
E57E: AD 70 01 lda $0170
E581: F0 04    beq $e587
E583: A9 00    lda #$00
E585: 91 E1    sta ($e1), y
E587: B1 E1    lda ($e1), y
E589: EC 77 01 cpx $0177
E58C: 90 08    bcc $e596
E58E: A9 00    lda #$00
E590: 8D 74 01 sta $0174
E593: AD 79 01 lda $0179
E596: 9D 40 89 sta $8940, x
E599: A0 0C    ldy #$0c
E59B: 4C DD E5 jmp $e5dd
E59E: A9 08    lda #$08
E5A0: 8D 00 89 sta $8900
E5A3: 9D 40 89 sta $8940, x
E5A6: A9 09    lda #$09
E5A8: 8D 00 89 sta $8900
E5AB: EA       nop
E5AC: A9 08    lda #$08
E5AE: 8D 00 89 sta $8900
E5B1: EC 77 01 cpx $0177
E5B4: AD 00 70 lda $7000
E5B7: 90 20    bcc $e5d9
E5B9: 4D 79 01 eor $0179
E5BC: F0 13    beq $e5d1
E5BE: A9 00    lda #$00
E5C0: AC 75 01 ldy $0175
E5C3: 91 E1    sta ($e1), y
E5C5: 88       dey
E5C6: 10 FB    bpl $e5c3
E5C8: AD 78 01 lda $0178
E5CB: 0D 73 01 ora $0173
E5CE: 8D 73 01 sta $0173
E5D1: A9 00    lda #$00
E5D3: 8D 74 01 sta $0174
E5D6: 4C DB E5 jmp $e5db
E5D9: 91 E1    sta ($e1), y
E5DB: A0 00    ldy #$00
E5DD: 18       clc
E5DE: 6D 79 01 adc $0179
E5E1: 8D 79 01 sta $0179
E5E4: EE 75 01 inc $0175
E5E7: EE 76 01 inc $0176
E5EA: 8C 00 89 sty $8900
E5ED: 98       tya
E5EE: D0 03    bne $e5f3
E5F0: 4C 06 E5 jmp $e506
E5F3: 60       rts
E5F4: 78       sei
E5F5: D8       cld
E5F6: A9 FF    lda #$ff
E5F8: 85 02    sta $02
E5FA: D0 11    bne $e60d
E5FC: A5 00    lda $00
E5FE: F0 0D    beq $e60d
E600: AD 00 78 lda $7800
E603: 29 40    and #$40
E605: F0 06    beq $e60d
E607: 8D 80 88 sta $8880
E60A: 8D 40 88 sta $8840
E60D: 8D 80 89 sta $8980
E610: AD 00 78 lda $7800
E613: 29 10    and #$10
E615: F0 03    beq $e61a
E617: 4C 3A E8 jmp $e83a
E61A: AD 00 80 lda $8000
E61D: 18       clc
E61E: 2A       rol a
E61F: 2A       rol a
E620: 2A       rol a
E621: 2A       rol a
E622: 49 FF    eor #$ff
E624: 29 07    and #$07
E626: 85 00    sta $00
E628: A5 00    lda $00
E62A: C5 02    cmp $02
E62C: F0 CE    beq $e5fc
E62E: 85 02    sta $02
E630: AA       tax
E631: F0 21    beq $e654
E633: A9 C7    lda #$c7
E635: 8D 00 20 sta $2000
E638: A9 60    lda #$60
E63A: 8D 01 20 sta $2001
E63D: BC A8 E6 ldy $e6a8, x
E640: BD B0 E6 lda $e6b0, x
E643: AA       tax
E644: B9 B8 E6 lda $e6b8, y
E647: 9D 02 20 sta $2002, x
E64A: 88       dey
E64B: CA       dex
E64C: 10 F6    bpl $e644
E64E: 8D 80 88 sta $8880
E651: 4C FC E5 jmp $e5fc
E654: A9 20    lda #$20
E656: 85 04    sta $04
E658: A9 00    lda #$00
E65A: 85 03    sta $03
E65C: 85 01    sta $01
E65E: A8       tay
E65F: A9 08    lda #$08
E661: 85 00    sta $00
E663: 18       clc
E664: A5 01    lda $01
E666: 91 03    sta ($03), y
E668: 69 05    adc #$05
E66A: 85 01    sta $01
E66C: C8       iny
E66D: D0 F4    bne $e663
E66F: E6 04    inc $04
E671: C6 00    dec $00
E673: D0 EE    bne $e663
E675: A0 07    ldy #$07
E677: A2 00    ldx #$00
E679: A9 11    lda #$11
E67B: 9D 80 27 sta $2780, x
E67E: 9D 80 26 sta $2680, x
E681: 48       pha
E682: 8A       txa
E683: 18       clc
E684: 69 10    adc #$10
E686: AA       tax
E687: 68       pla
E688: 88       dey
E689: 10 F0    bpl $e67b
E68B: 8D B2 26 sta $26b2
E68E: 8D B2 27 sta $27b2
E691: 8D DE 26 sta $26de
E694: 8D EE 26 sta $26ee
E697: 8D DE 27 sta $27de
E69A: 8D EE 27 sta $27ee
E69D: A9 80    lda #$80
E69F: 8D FE 26 sta $26fe
E6A2: 8D FE 27 sta $27fe
E6A5: 4C 4E E6 jmp $e64e
E6A8: 01 01    ora ($01, x)
E6AA: 15 2B    ora $2b, x


E72C: AD 00 78 lda $7800            ;GET COIN SWITCHES
E72F: E0 01    cpx #$01
E731: F0 03    beq $e736
E733: B0 02    bcs $e737
E735: 4A       lsr a		;ELSE LEFT, SHIFT THRICE
E736: 4A       lsr a
E737: 4A       lsr a
E738: B5 DB    lda $db, x
E73A: 29 1F    and #$1f
E73C: B0 37    bcs $e775
E73E: F0 10    beq $e750
E740: C9 1B    cmp #$1b
E742: B0 0A    bcs $e74e
E744: A8       tay
E745: A5 E0    lda $e0
E747: 29 07    and #$07
E749: C9 07    cmp #$07
E74B: 98       tya
E74C: 90 02    bcc $e750
E74E: E9 01    sbc #$01
E750: 95 DB    sta $db, x
E752: AD 00 78 lda $7800
E755: 29 08    and #$08
E757: D0 04    bne $e75d
E759: A9 F0    lda #$f0
E75B: 85 DE    sta $de
E75D: A5 DE    lda $de
E75F: F0 08    beq $e769
E761: C6 DE    dec $de
E763: A9 00    lda #$00
E765: 95 DB    sta $db, x
E767: 95 D8    sta $d8, x
E769: 18       clc
E76A: B5 D8    lda $d8, x
E76C: F0 23    beq $e791
E76E: D6 D8    dec $d8, x
E770: D0 1F    bne $e791
E772: 38       sec
E773: B0 1C    bcs $e791
E775: C9 1B    cmp #$1b
E777: B0 09    bcs $e782
E779: B5 DB    lda $db, x
E77B: 69 20    adc #$20
E77D: 90 D1    bcc $e750
E77F: F0 01    beq $e782
E781: 18       clc
E782: A9 1F    lda #$1f
E784: B0 CA    bcs $e750
E786: 95 DB    sta $db, x
E788: B5 D8    lda $d8, x
E78A: F0 01    beq $e78d
E78C: 38       sec
E78D: A9 78    lda #$78
E78F: 95 D8    sta $d8, x
E791: 90 2A    bcc $e7bd
E793: A9 00    lda #$00
E795: E0 01    cpx #$01
E797: 90 16    bcc $e7af
E799: F0 0C    beq $e7a7
E79B: A5 DF    lda $df
E79D: 29 0C    and #$0c
E79F: 4A       lsr a
E7A0: 4A       lsr a
E7A1: F0 0C    beq $e7af
E7A3: 69 02    adc #$02
E7A5: D0 08    bne $e7af
E7A7: A5 DF    lda $df
E7A9: 29 10    and #$10
E7AB: F0 02    beq $e7af
E7AD: A9 01    lda #$01
E7AF: 38       sec
E7B0: 48       pha
E7B1: 65 D1    adc $d1
E7B3: 85 D1    sta $d1
E7B5: 68       pla
E7B6: 38       sec
E7B7: 65 D7    adc $d7
E7B9: 85 D7    sta $d7
E7BB: F6 D3    inc $d3, x
E7BD: CA       dex
E7BE: 30 03    bmi $e7c3
E7C0: 4C 2C E7 jmp $e72c
E7C3: A5 DF    lda $df
E7C5: 4A       lsr a
E7C6: 4A       lsr a
E7C7: 4A       lsr a
E7C8: 4A       lsr a
E7C9: 4A       lsr a
E7CA: A8       tay
E7CB: A5 D1    lda $d1
E7CD: 38       sec
E7CE: F9 DF E7 sbc $e7df, y
E7D1: 30 14    bmi $e7e7
E7D3: 85 D1    sta $d1
E7D5: E6 D2    inc $d2
E7D7: C0 03    cpy #$03
E7D9: D0 0C    bne $e7e7
E7DB: E6 D2    inc $d2
E7DD: D0 08    bne $e7e7
E7DF: 7F 02 04 rra $0402, x
E7E2: 04 05    nop $05
E7E4: 03 7F    slo ($7f, x)
E7E6: 7F A5 DF rra $dfa5, x
E7E9: 29 03    and #$03
E7EB: A8       tay
E7EC: F0 1A    beq $e808
E7EE: 4A       lsr a
E7EF: 69 00    adc #$00
E7F1: 49 FF    eor #$ff
E7F3: 38       sec
E7F4: 65 D7    adc $d7
E7F6: B0 08    bcs $e800
E7F8: 65 D2    adc $d2
E7FA: 30 0E    bmi $e80a
E7FC: 85 D2    sta $d2
E7FE: A9 00    lda #$00
E800: C0 02    cpy #$02
E802: B0 02    bcs $e806
E804: E6 D6    inc $d6
E806: E6 D6    inc $d6
E808: 85 D7    sta $d7
E80A: E6 E0    inc $e0
E80C: A5 E0    lda $e0
E80E: 4A       lsr a
E80F: B0 27    bcs $e838
E811: A0 00    ldy #$00
E813: A2 02    ldx #$02
E815: B5 D3    lda $d3, x
E817: F0 09    beq $e822
E819: C9 10    cmp #$10
E81B: 90 05    bcc $e822
E81D: 69 EF    adc #$ef
E81F: C8       iny
E820: 95 D3    sta $d3, x
E822: CA       dex
E823: 10 F0    bpl $e815
E825: 98       tya
E826: D0 10    bne $e838
E828: A2 02    ldx #$02
E82A: B5 D3    lda $d3, x
E82C: F0 07    beq $e835
E82E: 18       clc
E82F: 69 EF    adc #$ef
E831: 95 D3    sta $d3, x
E833: 30 03    bmi $e838
E835: CA       dex
E836: 10 F2    bpl $e82a
E838: 60       rts
E839: CD 78 A2 cmp $a278
E83C: FE 9A A9 inc $a99a, x
E83F: 00       brk
E840: 8D 80 88 sta $8880
E843: D8       cld
E844: AA       tax
E845: 95 00    sta $00, x
E847: 9D 00 01 sta $0100, x
E84A: 9D 00 02 sta $0200, x
E84D: 9D 00 03 sta $0300, x
E850: 9D 00 04 sta $0400, x
E853: 9D 00 05 sta $0500, x
E856: 9D 00 06 sta $0600, x
E859: 9D 00 07 sta $0700, x
E85C: 9D 00 20 sta $2000, x
E85F: 9D 00 21 sta $2100, x
E862: 9D 00 22 sta $2200, x
E865: 9D 00 23 sta $2300, x
E868: 9D 00 24 sta $2400, x
E86B: 9D 00 25 sta $2500, x
E86E: 9D 00 26 sta $2600, x
E871: 9D 00 27 sta $2700, x
E874: 9D 00 60 sta $6000, x
E877: 9D 00 68 sta $6800, x
E87A: 8D 80 89 sta $8980
E87D: E8       inx
E87E: D0 C5    bne $e845
E880: A9 C0    lda #$c0
E882: 8D 00 88 sta $8800
E885: A9 07    lda #$07
E887: 8D 0F 60 sta $600f
E88A: 8D 0F 68 sta $680f
E88D: AD 00 78 lda $7800
E890: 29 10    and #$10
E892: D0 03    bne $e897
E894: 4C D2 E8 jmp $e8d2
E897: A9 01    lda #$01
E899: 8D 00 20 sta $2000
E89C: A9 E2    lda #$e2
E89E: 8D 01 20 sta $2001
E8A1: A9 20    lda #$20
E8A3: 8D 03 20 sta $2003
E8A6: 8D 03 24 sta $2403
E8A9: A9 24    lda #$24
E8AB: 85 09    sta $09
E8AD: A9 02    lda #$02
E8AF: 85 08    sta $08
E8B1: 58       cli
E8B2: E6 FB    inc $fb
E8B4: A5 FB    lda $fb
E8B6: 8D 80 89 sta $8980
E8B9: D0 F9    bne $e8b4
E8BB: 20 FC E4 jsr $e4fc
E8BE: AD 74 01 lda $0174
E8C1: 8D 80 89 sta $8980
E8C4: D0 F8    bne $e8be
E8C6: AD 73 01 lda $0173
E8C9: 4A       lsr a
E8CA: B0 03    bcs $e8cf
E8CC: 20 9E CB jsr $cb9e
E8CF: 4C 00 90 jmp $9000
E8D2: A2 11    ldx #$11
E8D4: 9A       txs
E8D5: 8A       txa
E8D6: 86 00    stx $00
E8D8: A0 00    ldy #$00
E8DA: A2 01    ldx #$01
E8DC: C8       iny
E8DD: B9 00 00 lda $0000, y
E8E0: D0 21    bne $e903
E8E2: E8       inx
E8E3: D0 F7    bne $e8dc
E8E5: BA       tsx
E8E6: 8A       txa
E8E7: 8D 80 89 sta $8980
E8EA: C8       iny
E8EB: 59 00 00 eor $0000, y
E8EE: D0 13    bne $e903
E8F0: 8A       txa
E8F1: A2 00    ldx #$00
E8F3: 96 00    stx $00, y
E8F5: C8       iny
E8F6: D0 05    bne $e8fd
E8F8: 0A       asl a
E8F9: A2 00    ldx #$00
E8FB: B0 4B    bcs $e948
E8FD: AA       tax
E8FE: 9A       txs
E8FF: 96 00    stx $00, y
E901: D0 D7    bne $e8da
E903: AA       tax
E904: 8A       txa
E905: A0 82    ldy #$82
E907: 29 0F    and #$0f
E909: F0 02    beq $e90d
E90B: A0 12    ldy #$12
E90D: 8A       txa
E90E: A2 82    ldx #$82
E910: 29 F0    and #$f0
E912: F0 02    beq $e916
E914: A2 12    ldx #$12
E916: 98       tya
E917: 9A       txs
E918: AA       tax
E919: 8E 00 60 stx $6000
E91C: A2 A8    ldx #$a8
E91E: 8E 01 60 stx $6001
E921: A0 0C    ldy #$0c
E923: A2 64    ldx #$64
E925: 2C 00 78 bit $7800
E928: 30 FB    bmi $e925
E92A: 2C 00 78 bit $7800
E92D: 10 FB    bpl $e92a
E92F: 8D 80 89 sta $8980
E932: CA       dex
E933: D0 F0    bne $e925
E935: C0 05    cpy #$05
E937: D0 03    bne $e93c
E939: 8E 01 60 stx $6001
E93C: 88       dey
E93D: D0 E4    bne $e923
E93F: 4A       lsr a
E940: B0 03    bcs $e945
E942: BA       tsx
E943: D0 D4    bne $e919
E945: 4C FF E9 jmp $e9ff
E948: A2 FF    ldx #$ff
E94A: 9A       txs
E94B: A2 00    ldx #$00
E94D: 8A       txa
E94E: 95 00    sta $00, x
E950: E8       inx
E951: D0 FB    bne $e94e
E953: A8       tay
E954: A9 01    lda #$01
E956: 85 01    sta $01
E958: A2 11    ldx #$11
E95A: B1 00    lda ($00), y
E95C: D0 27    bne $e985
E95E: 8A       txa
E95F: 91 00    sta ($00), y
E961: 51 00    eor ($00), y
E963: D0 20    bne $e985
E965: 8A       txa
E966: 0A       asl a
E967: AA       tax
E968: 90 F5    bcc $e95f
E96A: C8       iny
E96B: D0 EB    bne $e958
E96D: 8D 80 89 sta $8980
E970: E6 01    inc $01
E972: A6 01    ldx $01
E974: E0 04    cpx #$04
E976: 90 E0    bcc $e958
E978: A9 20    lda #$20
E97A: E0 20    cpx #$20
E97C: 90 D8    bcc $e956
E97E: E0 28    cpx #$28
E980: 90 D6    bcc $e958
E982: 4C 06 EA jmp $ea06
E985: A6 01    ldx $01
E987: E0 20    cpx #$20
E989: 85 02    sta $02
E98B: 90 03    bcc $e990
E98D: 8A       txa
E98E: E9 1C    sbc #$1c
E990: 4A       lsr a
E991: 4A       lsr a
E992: 29 07    and #$07
E994: A8       tay
E995: A5 02    lda $02
E997: 84 00    sty $00
E999: 85 01    sta $01
E99B: A9 01    lda #$01
E99D: 85 02    sta $02
E99F: A2 A8    ldx #$a8
E9A1: A0 82    ldy #$82
E9A3: A5 00    lda $00
E9A5: D0 08    bne $e9af
E9A7: A5 01    lda $01
E9A9: 29 0F    and #$0f
E9AB: F0 02    beq $e9af
E9AD: A0 12    ldy #$12
E9AF: 8E 01 60 stx $6001
E9B2: 8C 00 60 sty $6000
E9B5: A9 09    lda #$09
E9B7: C0 12    cpy #$12
E9B9: F0 02    beq $e9bd
E9BB: A9 01    lda #$01
E9BD: A8       tay
E9BE: A2 00    ldx #$00
E9C0: 2C 00 78 bit $7800
E9C3: 30 FB    bmi $e9c0
E9C5: 2C 00 78 bit $7800
E9C8: 10 FB    bpl $e9c5
E9CA: 8D 80 89 sta $8980
E9CD: CA       dex
E9CE: D0 F0    bne $e9c0
E9D0: 88       dey
E9D1: D0 ED    bne $e9c0
E9D3: 8E 01 60 stx $6001
E9D6: A0 09    ldy #$09
E9D8: 2C 00 78 bit $7800
E9DB: 30 FB    bmi $e9d8
E9DD: 2C 00 78 bit $7800
E9E0: 10 FB    bpl $e9dd
E9E2: 8D 80 89 sta $8980
E9E5: CA       dex
E9E6: D0 F0    bne $e9d8
E9E8: 88       dey
E9E9: D0 ED    bne $e9d8
E9EB: A5 00    lda $00
E9ED: D0 08    bne $e9f7
E9EF: A5 01    lda $01
E9F1: 4A       lsr a
E9F2: 4A       lsr a
E9F3: 4A       lsr a
E9F4: 4A       lsr a
E9F5: 85 01    sta $01
E9F7: C6 02    dec $02
E9F9: F0 A4    beq $e99f
E9FB: C6 00    dec $00
E9FD: 10 9C    bpl $e99b
E9FF: 8D 80 89 sta $8980
EA02: A9 FF    lda #$ff
EA04: 85 74    sta $74
EA06: A9 00    lda #$00
EA08: AA       tax
EA09: 9D 00 01 sta $0100, x
EA0C: 9D 00 02 sta $0200, x
EA0F: 9D 00 03 sta $0300, x
EA12: CA       dex
EA13: D0 F4    bne $ea09
EA15: A8       tay
EA16: 85 21    sta $21
EA18: A9 30    lda #$30
EA1A: 85 22    sta $22
EA1C: A9 10    lda #$10
EA1E: 85 23    sta $23
EA20: 8A       txa
EA21: 51 21    eor ($21), y
EA23: C8       iny
EA24: D0 FB    bne $ea21
EA26: E6 22    inc $22
EA28: 8D 80 89 sta $8980
EA2B: C6 23    dec $23
EA2D: D0 F2    bne $ea21
EA2F: 95 6B    sta $6b, x
EA31: E8       inx
EA32: F0 18    beq $ea4c
EA34: A5 22    lda $22
EA36: C9 60    cmp #$60
EA38: D0 04    bne $ea3e
EA3A: A9 90    lda #$90
EA3C: 85 22    sta $22
EA3E: C9 F0    cmp #$f0
EA40: 90 D8    bcc $ea1a
EA42: A2 FF    ldx #$ff
EA44: A9 28    lda #$28
EA46: 85 22    sta $22
EA48: A9 08    lda #$08
EA4A: D0 D2    bne $ea1e
EA4C: A5 6A    lda $6a
EA4E: 05 6B    ora $6b
EA50: F0 0A    beq $ea5c
EA52: A9 F0    lda #$f0
EA54: A2 A2    ldx #$a2
EA56: 8D 04 60 sta $6004
EA59: 8E 05 60 stx $6005
EA5C: A2 05    ldx #$05
EA5E: AD 0A 68 lda $680a
EA61: CD 0A 68 cmp $680a
EA64: D0 05    bne $ea6b
EA66: CA       dex
EA67: 10 F8    bpl $ea61
EA69: 85 75    sta $75
EA6B: A2 05    ldx #$05
EA6D: AD 0A 60 lda $600a
EA70: CD 0A 60 cmp $600a
EA73: D0 05    bne $ea7a
EA75: CA       dex
EA76: 10 F8    bpl $ea70
EA78: 85 76    sta $76
EA7A: 58       cli
EA7B: 20 FC E4 jsr $e4fc
EA7E: A0 02    ldy #$02
EA80: AD 73 01 lda $0173
EA83: F0 0A    beq $ea8f
EA85: 85 77    sta $77
EA87: 20 DC E4 jsr $e4dc
EA8A: A0 00    ldy #$00
EA8C: 8C 73 01 sty $0173
EA8F: 84 69    sty $69
EA91: 4C D7 EC jmp $ecd7
EA94: AD 74 01 lda $0174
EA97: 0D 71 01 ora $0171
EA9A: D0 0C    bne $eaa8
EA9C: 20 FC E4 jsr $e4fc
EA9F: AD 73 01 lda $0173
EAA2: 85 77    sta $77
EAA4: A9 02    lda #$02
EAA6: 85 69    sta $69
EAA8: 60       rts
EAA9: A0 A7    ldy #$a7
EAAB: A9 04    lda #$04
EAAD: 20 5F E4 jsr $e45f
EAB0: A2 8E    ldx #$8e
EAB2: A9 4A    lda #$4a
EAB4: 20 53 E4 jsr $e453
EAB7: A9 48    lda #$48
EAB9: A2 40    ldx #$40
EABB: A0 00    ldy #$00
EABD: 20 8A E4 jsr $e48a
EAC0: 20 41 EC jsr $ec41
EAC3: A9 01    lda #$01
EAC5: 20 7F E4 jsr $e47f
EAC8: A2 46    ldx #$46
EACA: 86 23    stx $23
EACC: A2 09    ldx #$09
EACE: B5 6A    lda $6a, x
EAD0: F0 1B    beq $eaed
EAD2: 86 22    stx $22
EAD4: 20 66 E4 jsr $e466
EAD7: A6 23    ldx $23
EAD9: 8A       txa
EADA: 38       sec
EADB: E9 08    sbc #$08
EADD: 85 23    sta $23
EADF: A9 F6    lda #$f6
EAE1: A0 00    ldy #$00
EAE3: 20 8A E4 jsr $e48a
EAE6: A5 22    lda $22
EAE8: 20 54 DE jsr $de54
EAEB: A6 22    ldx $22
EAED: CA       dex
EAEE: 10 DE    bpl $eace
EAF0: 20 66 E4 jsr $e466
EAF3: A9 F6    lda #$f6
EAF5: A2 58    ldx #$58
EAF7: A0 00    ldy #$00
EAF9: 20 8A E4 jsr $e48a
EAFC: A2 03    ldx #$03
EAFE: 86 22    stx $22
EB00: A6 22    ldx $22
EB02: A0 00    ldy #$00
EB04: B5 74    lda $74, x
EB06: F0 03    beq $eb0b
EB08: BC C9 EB ldy $ebc9, x
EB0B: B9 48 4D lda $4d48, y
EB0E: BE 49 4D ldx $4d49, y
EB11: 20 6A E4 jsr $e46a
EB14: C6 22    dec $22
EB16: 10 E8    bpl $eb00
EB18: 20 A7 EC jsr $eca7
EB1B: 60       rts
EB1C: A2 5C    ldx #$5c
EB1E: A9 4B    lda #$4b
EB20: 4C 53 E4 jmp $e453
EB23: E6 30    inc $30
EB25: 10 06    bpl $eb2d
EB27: A9 00    lda #$00
EB29: 85 30    sta $30
EB2B: E6 23    inc $23
EB2D: A5 23    lda $23
EB2F: 29 07    and #$07
EB31: AA       tax
EB32: BC 68 EB ldy $eb68, x
EB35: A9 00    lda #$00
EB37: 99 F1 67 sta $67f1, y
EB3A: BC 69 EB ldy $eb69, x
EB3D: BD 72 EB lda $eb72, x
EB40: 99 F0 67 sta $67f0, y
EB43: A9 A8    lda #$a8
EB45: 99 F1 67 sta $67f1, y
EB48: A2 62    ldx #$62
EB4A: A9 4B    lda #$4b
EB4C: 20 53 E4 jsr $e453
EB4F: 20 66 E4 jsr $e466
EB52: A4 30    ldy $30
EB54: A5 23    lda $23
EB56: 29 07    and #$07
EB58: D0 04    bne $eb5e
EB5A: A9 01    lda #$01
EB5C: 85 23    sta $23
EB5E: 20 7F E4 jsr $e47f
EB61: A2 90    ldx #$90
EB63: A9 4A    lda #$4a
EB65: 4C 53 E4 jmp $e453
EB68: 16 00    asl $00, x
EB6A: 10 02    bpl $eb6e
EB6C: 12       kil
EB6D: 04 14    nop $14
EB6F: 06 16    asl $16
EB71: 00       brk
EB72: 10 10    bpl $eb84
EB74: 40       rti
EB75: 40       rti
EB76: 90 90    bcc $eb08
EB78: FF FF A2 isb $a2ff, x
EB7B: 8E A9 4A stx $4aa9
EB7E: 20 53 E4 jsr $e453
EB81: A0 06    ldy #$06
EB83: 84 23    sty $23
EB85: 20 66 E4 jsr $e466
EB88: A4 23    ldy $23
EB8A: B9 BB EB lda $ebbb, y
EB8D: BE C2 EB ldx $ebc2, y
EB90: 20 8A E4 jsr $e48a
EB93: A5 23    lda $23
EB95: 49 FF    eor #$ff
EB97: 29 07    and #$07
EB99: A8       tay
EB9A: 20 5F E4 jsr $e45f
EB9D: A5 23    lda $23
EB9F: D0 07    bne $eba8
EBA1: A2 1E    ldx #$1e
EBA3: A9 4B    lda #$4b
EBA5: 4C AC EB jmp $ebac
EBA8: A2 18    ldx #$18
EBAA: A9 4B    lda #$4b
EBAC: 20 53 E4 jsr $e453
EBAF: C6 23    dec $23
EBB1: 10 D2    bpl $eb85
EBB3: A2 3C    ldx #$3c
EBB5: A9 4B    lda #$4b
EBB7: 20 53 E4 jsr $e453
EBBA: 60       rts
EBBB: DE 9D 1F dec $1f9d, x
EBBE: 9D DE 1F sta $1fde, x
EBC1: DE F4 D8 dec $d8f4, x
EBC4: D8       cld
EBC5: 10 D8    bpl $eb9f
EBC7: 10 10    bpl $ebd9
EBC9: 38       sec
EBCA: 34 36    nop $36, x
EBCC: 1E 20 66 asl $6620, x
EBCF: E4 A9    cpx $a9
EBD1: 01 20    ora ($20, x)
EBD3: 7D E4 A2 adc $a2e4, x
EBD6: 06 86    asl $86
EBD8: 22       kil
EBD9: A4 22    ldy $22
EBDB: A9 98    lda #$98
EBDD: BE 1C EC ldx $ec1c, y
EBE0: 20 8A E4 jsr $e48a
EBE3: A2 54    ldx #$54
EBE5: A9 4B    lda #$4b
EBE7: 20 53 E4 jsr $e453
EBEA: C6 22    dec $22
EBEC: 10 EB    bpl $ebd9
EBEE: A2 06    ldx #$06
EBF0: 86 22    stx $22
EBF2: A4 22    ldy $22
EBF4: B9 23 EC lda $ec23, y
EBF7: A2 60    ldx #$60
EBF9: 20 8A E4 jsr $e48a
EBFC: A2 4C    ldx #$4c
EBFE: A9 4B    lda #$4b
EC00: 20 53 E4 jsr $e453
EC03: C6 22    dec $22
EC05: 10 EB    bpl $ebf2
EC07: AD 00 88 lda $8800
EC0A: 29 20    and #$20
EC0C: D0 09    bne $ec17
EC0E: 06 21    asl $21
EC10: 90 02    bcc $ec14
EC12: E6 38    inc $38
EC14: 4C 1B EC jmp $ec1b
EC17: A9 20    lda #$20
EC19: 85 21    sta $21
EC1B: 60       rts
EC1C: B8       clv
EC1D: D0 E8    bne $ec07
EC1F: 00       brk
EC20: 18       clc
EC21: 30 48    bmi $ec6b
EC23: B2       kil
EC24: CC E6 00 cpy $00e6
EC27: 1A       nop
EC28: 34 4E    nop $4e, x
EC2A: A2 CE    ldx #$ce
EC2C: A9 4B    lda #$4b
EC2E: 20 53 E4 jsr $e453
EC31: A9 20    lda #$20
EC33: 85 21    sta $21
EC35: A2 C2    ldx #$c2
EC37: A9 4B    lda #$4b
EC39: 20 53 E4 jsr $e453
EC3C: C6 21    dec $21
EC3E: 10 F5    bpl $ec35
EC40: 60       rts
EC41: A2 0F    ldx #$0f
EC43: 86 22    stx $22
EC45: 8D 0B 60 sta $600b
EC48: EA       nop
EC49: AD 08 60 lda $6008
EC4C: 85 24    sta $24
EC4E: 8D 0B 68 sta $680b
EC51: EA       nop
EC52: AD 08 68 lda $6808
EC55: 48       pha
EC56: 29 01    and #$01
EC58: 18       clc
EC59: 20 54 DE jsr $de54
EC5C: 46 24    lsr $24
EC5E: 68       pla
EC5F: 6A       ror a
EC60: C6 22    dec $22
EC62: 10 F1    bpl $ec55
EC64: A9 D0    lda #$d0
EC66: A0 00    ldy #$00
EC68: A2 F8    ldx #$f8
EC6A: 20 8A E4 jsr $e48a
EC6D: A2 07    ldx #$07
EC6F: 86 22    stx $22
EC71: A9 78    lda #$78
EC73: 85 39    sta $39
EC75: A9 07    lda #$07
EC77: 85 3A    sta $3a
EC79: A9 00    lda #$00
EC7B: 85 38    sta $38
EC7D: A8       tay
EC7E: B1 38    lda ($38), y
EC80: 49 FF    eor #$ff
EC82: 29 7F    and #$7f
EC84: 48       pha
EC85: 29 01    and #$01
EC87: 18       clc
EC88: 20 54 DE jsr $de54
EC8B: 68       pla
EC8C: 6A       ror a
EC8D: C8       iny
EC8E: C6 3A    dec $3a
EC90: 10 F2    bpl $ec84
EC92: A9 D0    lda #$d0
EC94: A0 00    ldy #$00
EC96: A2 F8    ldx #$f8
EC98: 20 8A E4 jsr $e48a
EC9B: A5 39    lda $39
EC9D: 18       clc
EC9E: 69 08    adc #$08
ECA0: 85 39    sta $39
ECA2: C9 90    cmp #$90
ECA4: 90 CF    bcc $ec75
ECA6: 60       rts
ECA7: 84 24    sty $24
ECA9: AD 00 78 lda $7800
ECAC: 29 0F    and #$0f
ECAE: 85 21    sta $21
ECB0: AD 00 80 lda $8000
ECB3: 29 1F    and #$1f
ECB5: 85 22    sta $22
ECB7: AD 00 88 lda $8800
ECBA: 29 7F    and #$7f
ECBC: 85 23    sta $23
ECBE: A5 21    lda $21
ECC0: 09 10    ora #$10
ECC2: 25 22    and $22
ECC4: 09 60    ora #$60
ECC6: 25 23    and $23
ECC8: 49 7F    eor #$7f
ECCA: F0 07    beq $ecd3
ECCC: 69 40    adc #$40
ECCE: 8D 00 60 sta $6000
ECD1: A0 A4    ldy #$a4
ECD3: 8C 01 60 sty $6001
ECD6: 60       rts
ECD7: A2 18    ldx #$18
ECD9: 2C 00 78 bit $7800
ECDC: 10 FB    bpl $ecd9
ECDE: 2C 00 78 bit $7800
ECE1: 30 FB    bmi $ecde
ECE3: CA       dex
ECE4: 10 F3    bpl $ecd9
ECE6: E6 4F    inc $4f
ECE8: 2C 00 78 bit $7800
ECEB: 50 FB    bvc $ece8
ECED: A9 00    lda #$00
ECEF: 85 08    sta $08
ECF1: A9 20    lda #$20
ECF3: 85 09    sta $09
ECF5: AD 00 78 lda $7800
ECF8: 49 FF    eor #$ff
ECFA: 29 24    and #$24
ECFC: F0 26    beq $ed24
ECFE: 06 7B    asl $7b
ED00: 90 1F    bcc $ed21
ED02: AD 00 88 lda $8800
ED05: 29 40    and #$40
ED07: D0 06    bne $ed0f
ED09: 20 C2 E1 jsr $e1c2
ED0C: 20 F4 E5 jsr $e5f4
ED0F: E6 69    inc $69
ED11: E6 69    inc $69
ED13: A9 00    lda #$00
ED15: A2 06    ldx #$06
ED17: 9D 00 60 sta $6000, x
ED1A: 9D 00 68 sta $6800, x
ED1D: CA       dex
ED1E: CA       dex
ED1F: 10 F6    bpl $ed17
ED21: 4C 28 ED jmp $ed28
ED24: A9 20    lda #$20
ED26: 85 7B    sta $7b
ED28: A5 69    lda $69
ED2A: C9 0C    cmp #$0c
ED2C: D0 0E    bne $ed3c
ED2E: A5 38    lda $38
ED30: 29 07    and #$07
ED32: D0 02    bne $ed36
ED34: A9 01    lda #$01
ED36: 09 C0    ora #$c0
ED38: A8       tay
ED39: 4C 3E ED jmp $ed3e
ED3C: A0 A7    ldy #$a7
ED3E: A9 04    lda #$04
ED40: 20 5F E4 jsr $e45f
ED43: A2 8E    ldx #$8e
ED45: A9 4A    lda #$4a
ED47: 20 53 E4 jsr $e453
ED4A: 20 78 ED jsr $ed78
ED4D: 20 66 E4 jsr $e466
ED50: 20 13 E4 jsr $e413
ED53: A9 C0    lda #$c0
ED55: 85 F8    sta $f8
ED57: 8D 40 88 sta $8840
ED5A: 8D 80 89 sta $8980
ED5D: AD 00 78 lda $7800
ED60: 29 10    and #$10
ED62: D0 03    bne $ed67
ED64: 4C D7 EC jmp $ecd7
ED67: 4C 3A E8 jmp $e83a
ED6A: 93 EA    sha ($ea), y
ED6C: A8       tay
ED6D: EA       nop
ED6E: 1B EB 22 slo $22eb, y
ED71: EB 29    sbc #$29
ED73: EC 79 EB cpx $eb79
ED76: CC EB A6 cpy $a6eb
ED79: 69 E0    adc #$e0
ED7B: 0E 90 04 asl $0490
ED7E: A2 02    ldx #$02
ED80: 86 69    stx $69
ED82: BD 6B ED lda $ed6b, x
ED85: 48       pha
ED86: BD 6A ED lda $ed6a, x
ED89: 48       pha
ED8A: 60       rts
ED8B: A9 00    lda #$00
ED8D: 85 00    sta $00
ED8F: 8D 13 E4 sta $e413
ED92: 20 C2 E1 jsr $e1c2
ED95: 20 FC E4 jsr $e4fc
ED98: AD 74 01 lda $0174
ED9B: 30 32    bmi $edcf
ED9D: A6 35    ldx $35
ED9F: AD 00 88 lda $8800
EDA2: 29 20    and #$20
EDA4: 85 35    sta $35
EDA6: D0 27    bne $edcf
EDA8: AD 00 80 lda $8000
EDAB: 29 02    and #$02
EDAD: D0 0D    bne $edbc
EDAF: A5 00    lda $00
EDB1: D0 03    bne $edb6
EDB3: 4C 3A E8 jmp $e83a
EDB6: 20 DF ED jsr $eddf
EDB9: 4C CF ED jmp $edcf
EDBC: 8A       txa
EDBD: 29 20    and #$20
EDBF: F0 0E    beq $edcf
EDC1: E6 00    inc $00
EDC3: E6 00    inc $00
EDC5: A5 00    lda $00
EDC7: C9 08    cmp #$08
EDC9: 90 04    bcc $edcf
EDCB: A9 00    lda #$00
EDCD: 85 00    sta $00
EDCF: 20 03 EE jsr $ee03
EDD2: 20 11 EE jsr $ee11
EDD5: AD 00 78 lda $7800
EDD8: 29 10    and #$10
EDDA: F0 BC    beq $ed98
EDDC: 4C 3A E8 jmp $e83a
EDDF: A6 00    ldx $00
EDE1: E0 08    cpx #$08
EDE3: 90 04    bcc $ede9
EDE5: A2 00    ldx #$00
EDE7: 86 00    stx $00
EDE9: BD F3 ED lda $edf3, x
EDEC: 48       pha
EDED: BD F2 ED lda $edf2, x
EDF0: 48       pha
EDF1: 60       rts
EDF2: F9 ED F9 sbc $f9ed, y
EDF5: ED FC ED sbc $edfc
EDF8: FF ED 4C isb $4ced, x
EDFB: D8       cld
EDFC: E4 4C    cpx $4c
EDFE: D4 E4    nop $e4, x
EE00: 4C DC E4 jmp $e4dc
EE03: A5 1D    lda $1d
EE05: 29 1F    and #$1f
EE07: C9 1F    cmp #$1f
EE09: D0 05    bne $ee10
EE0B: 68       pla
EE0C: 68       pla
EE0D: 4C E1 90 jmp $90e1
EE10: 60       rts
EE11: 2C 00 78 bit $7800
EE14: 50 FB    bvc $ee11
EE16: A9 20    lda #$20
EE18: 85 09    sta $09
EE1A: A9 00    lda #$00
EE1C: 85 08    sta $08
EE1E: A2 A6    ldx #$a6
EE20: A9 4B    lda #$4b
EE22: 20 53 E4 jsr $e453
EE25: A9 01    lda #$01
EE27: A0 40    ldy #$40
EE29: 20 7F E4 jsr $e47f
EE2C: 20 32 EF jsr $ef32
EE2F: 20 49 EF jsr $ef49
EE32: 20 68 EF jsr $ef68
EE35: 20 A1 EF jsr $efa1
EE38: A2 40    ldx #$40
EE3A: A9 B0    lda #$b0
EE3C: 20 EE E1 jsr $e1ee
EE3F: A0 29    ldy #$29
EE41: 20 FC E1 jsr $e1fc
EE44: A5 00    lda $00
EE46: 4A       lsr a
EE47: A8       tay
EE48: B9 98 EE lda $ee98, y
EE4B: AA       tax
EE4C: B9 94 EE lda $ee94, y
EE4F: 48       pha
EE50: A9 E0    lda #$e0
EE52: 20 EE E1 jsr $e1ee
EE55: 68       pla
EE56: A8       tay
EE57: 20 FC E1 jsr $e1fc
EE5A: 20 ED EE jsr $eeed
EE5D: A9 F0    lda #$f0
EE5F: A2 D0    ldx #$d0
EE61: 20 EE E1 jsr $e1ee
EE64: 20 9C EE jsr $ee9c
EE67: 20 AD EE jsr $eead
EE6A: A2 C0    ldx #$c0
EE6C: A9 F0    lda #$f0
EE6E: 20 EE E1 jsr $e1ee
EE71: 18       clc
EE72: A5 22    lda $22
EE74: 20 47 DE jsr $de47
EE77: A5 21    lda $21
EE79: 20 47 DE jsr $de47
EE7C: AD 74 01 lda $0174
EE7F: 10 0C    bpl $ee8d
EE81: A9 F0    lda #$f0
EE83: A2 50    ldx #$50
EE85: 20 EE E1 jsr $e1ee
EE88: A0 27    ldy #$27
EE8A: 20 FC E1 jsr $e1fc
EE8D: 20 13 E4 jsr $e413
EE90: 8D 40 88 sta $8840
EE93: 60       rts
EE94: 28       plp
EE95: 2A       rol a
EE96: 2B 2C    anc #$2c
EE98: 30 30    bmi $eeca
EE9A: 30 30    bmi $eecc
EE9C: A5 3A    lda $3a
EE9E: 18       clc
EE9F: 20 47 DE jsr $de47
EEA2: A5 39    lda $39
EEA4: 20 47 DE jsr $de47
EEA7: A5 38    lda $38
EEA9: 20 47 DE jsr $de47
EEAC: 60       rts
EEAD: A9 00    lda #$00
EEAF: 85 21    sta $21
EEB1: 85 22    sta $22
EEB3: AD 54 04 lda $0454
EEB6: 85 38    sta $38
EEB8: AD 55 04 lda $0455
EEBB: 85 39    sta $39
EEBD: AD 56 04 lda $0456
EEC0: 85 3A    sta $3a
EEC2: A5 23    lda $23
EEC4: 05 24    ora $24
EEC6: F0 24    beq $eeec
EEC8: F8       sed
EEC9: A5 21    lda $21
EECB: 18       clc
EECC: 69 01    adc #$01
EECE: 85 21    sta $21
EED0: A5 22    lda $22
EED2: 69 00    adc #$00
EED4: 85 22    sta $22
EED6: D8       cld
EED7: A5 38    lda $38
EED9: 38       sec
EEDA: E5 23    sbc $23
EEDC: 85 38    sta $38
EEDE: A5 39    lda $39
EEE0: E5 24    sbc $24
EEE2: 85 39    sta $39
EEE4: A5 3A    lda $3a
EEE6: E9 00    sbc #$00
EEE8: 85 3A    sta $3a
EEEA: 10 DC    bpl $eec8
EEEC: 60       rts
EEED: AD 52 04 lda $0452
EEF0: 0A       asl a
EEF1: 85 21    sta $21
EEF3: AD 53 04 lda $0453
EEF6: 2A       rol a
EEF7: 85 22    sta $22
EEF9: AD 50 04 lda $0450
EEFC: 18       clc
EEFD: 65 21    adc $21
EEFF: 85 21    sta $21
EF01: 85 23    sta $23
EF03: AD 51 04 lda $0451
EF06: 65 22    adc $22
EF08: 85 22    sta $22
EF0A: 85 24    sta $24
EF0C: A0 0F    ldy #$0f
EF0E: A9 00    lda #$00
EF10: 85 38    sta $38
EF12: 85 39    sta $39
EF14: 85 3A    sta $3a
EF16: F8       sed
EF17: 06 21    asl $21
EF19: 26 22    rol $22
EF1B: A5 38    lda $38
EF1D: 65 38    adc $38
EF1F: 85 38    sta $38
EF21: A5 39    lda $39
EF23: 65 39    adc $39
EF25: 85 39    sta $39
EF27: A5 3A    lda $3a
EF29: 65 3A    adc $3a
EF2B: 85 3A    sta $3a
EF2D: 88       dey
EF2E: 10 E7    bpl $ef17
EF30: D8       cld
EF31: 60       rts
EF32: A2 68    ldx #$68
EF34: A9 FC    lda #$fc
EF36: 20 EE E1 jsr $e1ee
EF39: A5 F0    lda $f0
EF3B: 29 10    and #$10
EF3D: F0 05    beq $ef44
EF3F: A9 1C    lda #$1c
EF41: 4C 46 EF jmp $ef46
EF44: A9 22    lda #$22
EF46: 4C F8 D9 jmp $d9f8
EF49: A9 F0    lda #$f0
EF4B: A2 58    ldx #$58
EF4D: 20 EE E1 jsr $e1ee
EF50: A5 F1    lda $f1
EF52: 4A       lsr a
EF53: 4A       lsr a
EF54: 4A       lsr a
EF55: 4A       lsr a
EF56: 4A       lsr a
EF57: A8       tay
EF58: B9 60 EF lda $ef60, y
EF5B: 18       clc
EF5C: 20 47 DE jsr $de47
EF5F: 60       rts
EF60: 00       brk
EF61: 00       brk
EF62: 14 24    nop $24, x
EF64: 15 13    ora $13, x
EF66: 00       brk
EF67: 00       brk
EF68: A9 F0    lda #$f0
EF6A: A2 60    ldx #$60
EF6C: 20 EE E1 jsr $e1ee
EF6F: A5 F1    lda $f1
EF71: 29 03    and #$03
EF73: A8       tay
EF74: B9 9D EF lda $ef9d, y
EF77: 18       clc
EF78: 20 54 DE jsr $de54
EF7B: A5 F1    lda $f1
EF7D: 29 0C    and #$0c
EF7F: 4A       lsr a
EF80: 4A       lsr a
EF81: A8       tay
EF82: B9 99 EF lda $ef99, y
EF85: 20 54 DE jsr $de54
EF88: A5 F1    lda $f1
EF8A: 29 10    and #$10
EF8C: D0 05    bne $ef93
EF8E: A9 01    lda #$01
EF90: 4C 95 EF jmp $ef95
EF93: A9 02    lda #$02
EF95: 20 54 DE jsr $de54
EF98: 60       rts
EF99: 01 04    ora ($04, x)
EF9B: 05 06    ora $06
EF9D: 00       brk
EF9E: 02       kil
EF9F: 01 00    ora ($00, x)
EFA1: A9 C0    lda #$c0
EFA3: A2 D0    ldx #$d0
EFA5: 20 EE E1 jsr $e1ee
EFA8: A5 F0    lda $f0
EFAA: 4A       lsr a
EFAB: 4A       lsr a
EFAC: 29 03    and #$03
EFAE: A8       tay
EFAF: B9 F0 EF lda $eff0, y
EFB2: 85 21    sta $21
EFB4: AD C6 45 lda $45c6
EFB7: AE C7 45 ldx $45c7
EFBA: 20 6A E4 jsr $e46a
EFBD: A2 FB    ldx #$fb
EFBF: A9 F8    lda #$f8
EFC1: A0 00    ldy #$00
EFC3: 20 8A E4 jsr $e48a
EFC6: C6 21    dec $21
EFC8: 10 EA    bpl $efb4
EFCA: AD 00 88 lda $8800
EFCD: 30 20    bmi $efef
EFCF: A9 C0    lda #$c0
EFD1: A2 B0    ldx #$b0
EFD3: 20 EE E1 jsr $e1ee
EFD6: A9 18    lda #$18
EFD8: 20 F8 D9 jsr $d9f8
EFDB: A6 18    ldx $18
EFDD: AD 00 88 lda $8800
EFE0: 29 40    and #$40
EFE2: 85 18    sta $18
EFE4: D0 09    bne $efef
EFE6: 8A       txa
EFE7: F0 06    beq $efef
EFE9: A5 F8    lda $f8
EFEB: 49 C0    eor #$c0
EFED: 85 F8    sta $f8
EFEF: 60       rts
EFF0: 02       kil
EFF1: 03 04    slo ($04, x)
EFF3: 05 00    ora $00
EFF5: 00       brk
EFF6: 00       brk
EFF7: 00       brk
EFF8: 00       brk
EFF9: 00       brk
EFFA: 3A       nop
EFFB: E8       inx
EFFC: 3A       nop
EFFD: E8       inx
EFFE: EA       nop
EFFF: CB 0F    sbx #$0f
F001: 00       brk
F002: 00       brk
F003: A0 01    ldy #$01
F005: FE 08 A0 inc $a008, x
F008: 01 FE    ora ($fe, x)
F00A: 04 98    nop $98
F00C: 10 04    bpl $f012
F00E: 10 00    bpl $f010
F010: 00       brk
F011: 82 02    nop #$02
F013: 01 04    ora ($04, x)
F015: 8C 08 FF sty $ff08
F018: 03 80    slo ($80, x)
F01A: 04 00    nop $00
F01C: 01 8C    ora ($8c, x)
F01E: 20 FF 01 jsr $01ff
F021: 86 40    stx $40
F023: FF 01 82 isb $8201, x
F026: 40       rti
F027: FF 01 81 isb $8101, x
F02A: 40       rti
F02B: FF 01 00 isb $0001, x
F02E: 00       brk
F02F: C0 10    cpy #$10
F031: 04 10    nop $10
F033: 00       brk
F034: 00       brk
F035: 86 50    stx $50
F037: FE 03 00 inc $0003, x
F03A: 00       brk
F03B: 98       tya
F03C: 07 00    slo $00
F03E: 01 00    ora ($00, x)
F040: 00       brk
F041: 84 07    sty $07
F043: 00       brk
F044: 01 00    ora ($00, x)
F046: 00       brk
F047: A1 11    lda ($11, x)
F049: 01 03    ora ($03, x)
F04B: A3 11    lax ($11, x)
F04D: FF 01 66 isb $6601, x
F050: 00       brk
F051: FF 08 00 isb $0008, x
F054: 05 6B    ora $6b
F056: 00       brk
F057: A1 08    lda ($08, x)
F059: 01 03    ora ($03, x)
F05B: A3 08    lax ($08, x)
F05D: FF 01 6E isb $6e01, x
F060: 00       brk
F061: FF 08 00 isb $0008, x
F064: 05 73    ora $73
F066: 00       brk
F067: A2 10    ldx #$10
F069: 00       brk
F06A: 16 00    asl $00, x
F06C: 00       brk
F06D: F6 10    inc $10, x
F06F: F7 0A    isb $0a, x
F071: 93 10    sha ($10), y
F073: 09 0B    ora #$0b
F075: 00       brk
F076: 00       brk
F077: A7 A1    lax $a1
F079: 00       brk
F07A: 03 00    slo ($00, x)
F07C: 00       brk
F07D: FF A1 00 isb $00a1, x
F080: 03 00    slo ($00, x)
F082: 00       brk
F083: A7 A1    lax $a1
F085: 00       brk
F086: 03 00    slo ($00, x)
F088: 00       brk
F089: FD A1 00 sbc $00a1, x
F08C: 03 00    slo ($00, x)
F08E: 00       brk
F08F: A4 11    ldy $11
F091: 00       brk
F092: 05 8A    ora $8a
F094: 00       brk
F095: FF 11 F8 isb $f811, x
F098: 05 8D    ora $8d
F09A: 00       brk
F09B: A4 11    ldy $11
F09D: 00       brk
F09E: 05 90    ora $90
F0A0: 00       brk
F0A1: FE 11 F8 inc $f811, x
F0A4: 05 93    ora $93
F0A6: 00       brk
F0A7: F6 08    inc $08, x
F0A9: F7 0A    isb $0a, x
F0AB: 93 08    sha ($08), y
F0AD: 09 0B    ora #$0b
F0AF: 96 00    stx $00, y
F0B1: A2 08    ldx #$08
F0B3: 00       brk
F0B4: 15 9B    ora $9b, x
F0B6: 00       brk
F0B7: 80 08    nop #$08
F0B9: F8       sed
F0BA: 03 70    slo ($70, x)
F0BC: 08       php
F0BD: F8       sed
F0BE: 03 60    slo ($60, x)
F0C0: 08       php
F0C1: F8       sed
F0C2: 03 50    slo ($50, x)
F0C4: 08       php
F0C5: F8       sed
F0C6: 03 40    slo ($40, x)
F0C8: 08       php
F0C9: F8       sed
F0CA: 03 00    slo ($00, x)
F0CC: 00       brk
F0CD: A4 08    ldy $08
F0CF: 00       brk
F0D0: 14 00    nop $00, x
F0D2: 00       brk
F0D3: A9 8F    lda #$8f
F0D5: D0 38    bne $f10f
F0D7: A9 BF    lda #$bf
F0D9: D0 34    bne $f10f
F0DB: A9 0F    lda #$0f
F0DD: D0 30    bne $f10f
F0DF: A9 1F    lda #$1f
F0E1: D0 2C    bne $f10f
F0E3: A9 2F    lda #$2f
F0E5: D0 28    bne $f10f
F0E7: A9 5F    lda #$5f
F0E9: D0 24    bne $f10f
F0EB: A9 6F    lda #$6f
F0ED: D0 20    bne $f10f
F0EF: A9 7F    lda #$7f
F0F1: D0 1C    bne $f10f
F0F3: A9 3F    lda #$3f
F0F5: D0 18    bne $f10f
F0F7: A9 4F    lda #$4f
F0F9: D0 14    bne $f10f
F0FB: A9 9F    lda #$9f
F0FD: D0 10    bne $f10f
F0FF: A9 AF    lda #$af
F101: D0 11    bne $f114
F103: A9 CF    lda #$cf
F105: D0 08    bne $f10f
F107: A9 DF    lda #$df
F109: D0 04    bne $f10f
F10B: A9 EF    lda #$ef
F10D: D0 00    bne $f10f
F10F: 24 D0    bit $d0
F111: D0 01    bne $f114
F113: 60       rts
F114: 86 25    stx $25
F116: 84 26    sty $26
F118: A8       tay
F119: A2 0F    ldx #$0f
F11B: B9 8D DE lda $de8d, y
F11E: F0 0E    beq $f12e
F120: 86 8C    stx $8c
F122: 95 8E    sta $8e, x
F124: A9 01    lda #$01
F126: 95 AE    sta $ae, x
F128: 95 BE    sta $be, x
F12A: A9 FF    lda #$ff
F12C: 85 8C    sta $8c
F12E: 88       dey
F12F: CA       dex
F130: 10 E9    bpl $f11b
F132: A6 25    ldx $25
F134: A4 26    ldy $26
F136: 60       rts
F137: A2 0F    ldx #$0f
F139: B5 8E    lda $8e, x
F13B: F0 7E    beq $f1bb
F13D: E4 8C    cpx $8c
F13F: F0 7A    beq $f1bb
F141: D6 AE    dec $ae, x
F143: D0 76    bne $f1bb
F145: D6 BE    dec $be, x
F147: D0 38    bne $f181
F149: F6 8E    inc $8e, x
F14B: F6 8E    inc $8e, x
F14D: B5 8E    lda $8e, x
F14F: 0A       asl a
F150: A8       tay
F151: B0 10    bcs $f163
F153: B9 77 DF lda $df77, y
F156: 95 9E    sta $9e, x
F158: B9 7A DF lda $df7a, y
F15B: 95 BE    sta $be, x
F15D: B9 78 DF lda $df78, y
F160: 4C 70 E1 jmp $e170
F163: B9 77 E0 lda $e077, y
F166: 95 9E    sta $9e, x
F168: B9 7A E0 lda $e07a, y
F16B: 95 BE    sta $be, x
F16D: B9 78 E0 lda $e078, y
F170: 95 AE    sta $ae, x
F172: D0 0A    bne $f17e
F174: 95 8E    sta $8e, x
F176: B5 9E    lda $9e, x
F178: F0 04    beq $f17e
F17A: 95 8E    sta $8e, x
F17C: D0 CB    bne $f149
F17E: 4C AC E1 jmp $e1ac
F181: 0A       asl a
F182: A8       tay
F183: B0 0B    bcs $f190
F185: B9 78 DF lda $df78, y
F188: 95 AE    sta $ae, x
F18A: B9 79 DF lda $df79, y
F18D: 4C 98 E1 jmp $e198
F190: B9 78 E0 lda $e078, y
F193: 95 AE    sta $ae, x
F195: B9 79 E0 lda $e079, y
F198: B4 9E    ldy $9e, x
F19A: 18       clc
F19B: 75 9E    adc $9e, x
F19D: 95 9E    sta $9e, x
F19F: 8A       txa
F1A0: 4A       lsr a
F1A1: 90 09    bcc $f1ac
F1A3: 98       tya
F1A4: 55 9E    eor $9e, x
F1A6: 29 F0    and #$f0
F1A8: 55 9E    eor $9e, x
F1AA: 95 9E    sta $9e, x
F1AC: B5 9E    lda $9e, x
F1AE: E0 08    cpx #$08
F1B0: 90 06    bcc $f1b8
F1B2: 9D F8 67 sta $67f8, x
F1B5: 4C BB E1 jmp $e1bb
F1B8: 9D 00 60 sta $6000, x
F1BB: CA       dex
F1BC: 30 03    bmi $f1c1
F1BE: 4C 39 E1 jmp $e139
F1C1: 60       rts
F1C2: A9 00    lda #$00
F1C4: 8D 0F 60 sta $600f
F1C7: 8D 0F 68 sta $680f
F1CA: A9 07    lda #$07
F1CC: 8D 0F 60 sta $600f
F1CF: 8D 0F 68 sta $680f
F1D2: A2 0F    ldx #$0f
F1D4: A9 00    lda #$00
F1D6: 9D 00 60 sta $6000, x
F1D9: 9D 00 68 sta $6800, x
F1DC: 95 8E    sta $8e, x
F1DE: 95 9E    sta $9e, x
F1E0: CA       dex
F1E1: 10 F3    bpl $f1d6
F1E3: A9 00    lda #$00
F1E5: 8D 08 60 sta $6008
F1E8: A2 00    ldx #$00
F1EA: 8E 08 68 stx $6808
F1ED: 60       rts
F1EE: 48       pha
F1EF: 8A       txa
F1F0: 48       pha
F1F1: 20 66 E4 jsr $e466
F1F4: 68       pla
F1F5: AA       tax
F1F6: 68       pla
F1F7: A0 00    ldy #$00
F1F9: 4C 8A E4 jmp $e48a
F1FC: 84 22    sty $22
F1FE: A9 00    lda #$00
F200: A0 03    ldy #$03
F202: 20 5F E4 jsr $e45f
F205: A4 22    ldy $22
F207: A9 00    lda #$00
F209: 0A       asl a
F20A: 0A       asl a
F20B: C0 1D    cpy #$1d
F20D: 90 0A    bcc $f219
F20F: 69 01    adc #$01
F211: AA       tax
F212: 98       tya
F213: 38       sec
F214: E9 1D    sbc #$1d
F216: A8       tay
F217: 10 01    bpl $f21a
F219: AA       tax
F21A: BD 7B E2 lda $e27b, x
F21D: 85 20    sta $20
F21F: BD 7A E2 lda $e27a, x
F222: 85 1F    sta $1f
F224: 18       clc
F225: 71 1F    adc ($1f), y
F227: 85 1F    sta $1f
F229: 90 02    bcc $f22d
F22B: E6 20    inc $20
F22D: A0 00    ldy #$00
F22F: A2 00    ldx #$00
F231: A1 1F    lda ($1f, x)
F233: 85 22    sta $22
F235: 4A       lsr a
F236: 4A       lsr a
F237: 20 56 E2 jsr $e256
F23A: A1 1F    lda ($1f, x)
F23C: 2A       rol a
F23D: 26 22    rol $22
F23F: 2A       rol a
F240: A5 22    lda $22
F242: 2A       rol a
F243: 0A       asl a
F244: 20 5C E2 jsr $e25c
F247: A1 1F    lda ($1f, x)
F249: 85 22    sta $22
F24B: 20 56 E2 jsr $e256
F24E: 46 22    lsr $22
F250: 90 DF    bcc $f231
F252: 88       dey
F253: 4C 72 E4 jmp $e472
F256: E6 1F    inc $1f
F258: D0 02    bne $f25c
F25A: E6 20    inc $20
F25C: 29 3E    and #$3e
F25E: D0 04    bne $f264
F260: 68       pla
F261: 68       pla
F262: D0 EE    bne $f252
F264: C9 0A    cmp #$0a
F266: 90 02    bcc $f26a
F268: 69 0D    adc #$0d
F26A: AA       tax
F26B: BD 46 4D lda $4d46, x
F26E: 91 08    sta ($08), y
F270: C8       iny
F271: BD 47 4D lda $4d47, x
F274: 91 08    sta ($08), y
F276: C8       iny
F277: A2 00    ldx #$00
F279: 60       rts
F27A: 7E E2 71 ror $71e2, x
F27D: E3 1D    isb ($1d, x)
F27F: 25 2B    and $2b
F281: 33 37    rla ($37), y
F283: 3B 3F 47 rla $473f, y
F286: 4B 57    asr #$57
F288: 61 65    adc ($65, x)
F28A: 6F 79 87 rra $8779
F28D: 95 A1    sta $a1, x
F28F: AD AD B1 lda $b1ad
F292: B5 BB    lda $bb, x
F294: BF C5 CD lax $cdc5, y
F297: D7 E1    dcp $e1, x
F299: E5 EB    sbc $eb
F29B: A5 92    lda $92
F29D: BD C2 BE lda $bec2, x
F2A0: 0A       asl a
F2A1: B6 00    ldx $00, y
F2A3: 59 62 48 eor $4862, y
F2A6: 66 D2    ror $d2
F2A8: 6D 9E 70 adc $709e
F2AB: 0C D4 0A nop $0ad4
F2AE: B2       kil
F2AF: 4C 00 B9 jmp $b900
F2B2: E6 B2    inc $b2
F2B4: 40       rti
F2B5: 56 52    lsr $52, x
F2B7: 80 00    nop #$00
F2B9: 83 74    sax ($74, x)
F2BB: 4D C0 4D eor $4dc0
F2BE: CE 2D 12 dec $122d
F2C1: 0E 1A 8A asl $8a1a
F2C4: 40       rti
F2C5: 83 64    sax ($64, x)
F2C7: 78       sei
F2C8: 00       brk
F2C9: 8B 6E    ane #$6e
F2CB: BB 66 90 las $9066, y
F2CE: 4E 9C 68 lsr $689c
F2D1: 82 70    nop #$70
F2D3: 48       pha
F2D4: 00       brk
F2D5: BB 26 9E las $9e26, y
F2D8: 02       kil
F2D9: B2       kil
F2DA: 4A       lsr a
F2DB: 3E 26 B0 rol $b026, x
F2DE: 00       brk
F2DF: 34 E4    nop $e4, x
F2E1: CD C0 83 cmp $83c0
F2E4: 64 78    nop $78
F2E6: 4A       lsr a
F2E7: 3E 1A D1 rol $d11a, x
F2EA: 70 4A    bvs $f336
F2EC: 00       brk
F2ED: 3C E4 5D nop $5de4, x
F2F0: 8A       txa
F2F1: C6 60    dec $60
F2F3: 2E 1A 9C rol $9c1a
F2F6: AF 4C B0 lax $b04c
F2F9: 4D 82 EC eor $ec82
F2FC: F2       kil
F2FD: B0 5A    bcs $f359
F2FF: 93 70    sha ($70), y
F301: 69 60    adc #$60
F303: B8       clv
F304: 00       brk
F305: A5 92    lda $92
F307: BD C2 B4 lda $b4c2, x
F30A: F0 2E    beq $f33a
F30C: 12       kil
F30D: 09 B2    ora #$b2
F30F: C6 26    dec $26
F311: 95 C0    sta $c0, x
F313: C4 C2    cpy $c2
F315: 3B 0A 92 rla $920a, y
F318: D2       kil
F319: 0C 12 C6 nop $c612
F31C: 12       kil
F31D: B5 C0    lda $c0, x
F31F: C5 8A    cmp $8a
F321: 3E 26 B0 rol $b026, x
F324: 70 98    bvs $f2be
F326: 6E 4C 12 ror $124c
F329: 3E 00 54 rol $5400, x
F32C: 32       kil
F32D: 93 FB    sha ($fb), y
F32F: 5E 64 92 lsr $9264, x
F332: 6D 3C C2 adc $c23c
F335: A3 60    lax ($60, x)
F337: 9E 00 A3 shx $a300, y
F33A: 60       rts
F33B: 9E 00 29 shx $2900, y
F33E: D2       kil
F33F: 0D 1A 84 ora $841a
F342: F1 7B    sbc ($7b), y
F344: 60       rts
F345: 82 6C    nop #$6c
F347: 0D 1A 84 ora $841a
F34A: F1 A4    sbc ($a4), y
F34C: E4 C3    cpx $c3
F34E: 72       kil
F34F: B8       clv
F350: 68       pla
F351: 6C 0A C2 jmp ($c20a)
F354: 40       rti
F355: 5C F0 C1 nop $c1f0, x
F358: 42       kil
F359: 32       kil
F35A: 42       kil
F35B: 86 4E    stx $4e
F35D: 7F 40 0C rra $0c40, x
F360: 1A       nop
F361: BE 00 A4 ldx $a400, y
F364: 0A       asl a
F365: EA       nop
F366: 6C 08 00 jmp ($0008)
F369: 6C AE 4D jmp ($4dae)
F36C: B0 09    bcs $f377
F36E: E6 6C    inc $6c
F370: 80 10    nop #$10
F372: 1A       nop
F373: 24 2A    bit $2a
F375: 2E 38 40 rol $4038
F378: 48       pha
F379: 4E 58 62 lsr $6258
F37C: 68       pla
F37D: 6E 7E 86 ror $867e
F380: 8E 18 4E stx $4e18
F383: 9B 64 08 shs $0864, y
F386: C2 A4    nop #$a4
F388: 0A       asl a
F389: E8       inx
F38A: 00       brk
F38B: 2E 0A B3 rol $b30a
F38E: 42       kil
F38F: 89 E2    nop #$e2
F391: 87 38    sax $38
F393: E3 5B    isb ($5b, x)
F395: 3D 92 43 and $4392, x
F398: 70 B8    bvs $f352
F39A: 40       rti
F39B: 41 64    eor ($64, x)
F39D: 5A       nop
F39E: 6D BB 26 adc $26bb
F3A1: 9E 02 36 shx $3602, y
F3A4: 64 7A    nop $7a
F3A6: 6C B8 00 jmp ($00b8)
F3A9: C5 8A    cmp $8a
F3AB: 3E 26 B0 rol $b026, x
F3AE: 54 CA    nop $ca, x
F3B0: 61 BE    adc ($be, x)
F3B2: 68       pla
F3B3: 4D 82 34 eor $3482
F3B6: E4 CD    cpx $cd
F3B8: C0 92    cpy #$92
F3BA: 78       sei
F3BB: C0 6E    cpy #$6e
F3BD: 63 69    rra ($69, x)
F3BF: 18       clc
F3C0: 4E 9B 64 lsr $649b
F3C3: 09 02    ora #$02
F3C5: A4 0A    ldy $0a
F3C7: ED C0 20 sbc $20c0
F3CA: 4E 9B 64 lsr $649b
F3CD: B8       clv
F3CE: 46 0D    lsr $0d
F3D0: 20 2F 40 jsr $402f
F3D3: 4D 8A BB eor $bb8a
F3D6: 64 58    nop $58
F3D8: 00       brk
F3D9: 54 EC    nop $ec, x
F3DB: 0E 12 BE asl $be12
F3DE: 00       brk
F3DF: A5 92    lda $92
F3E1: BD C2 BE lda $bec2, x
F3E4: 0A       asl a
F3E5: B6 02    ldx $02, y
F3E7: 18       clc
F3E8: 4A       lsr a
F3E9: 92       kil
F3EA: 02       kil
F3EB: 53 6C    sre ($6c), y
F3ED: 48       pha
F3EE: 00       brk
F3EF: 3C 12 2D nop $2d12, x
F3F2: 82 B9    nop #$b9
F3F4: E6 B2    inc $b2
F3F6: 6F 3C 12 rra $123c
F3F9: 2D 82 C3 and $c382
F3FC: 62       kil
F3FD: 4D C0 3C eor $3cc0
F400: 12       kil
F401: 2D 82 C3 and $c382
F404: 62       kil
F405: 4D C2 2C eor $2cc2
F408: 90 0D    bcc $f417
F40A: CE 9D 92 dec $929d
F40D: B8       clv
F40E: 00       brk
F40F: A9 C0    lda #$c0
F411: D0 05    bne $f418
F413: 20 66 E4 jsr $e466
F416: A9 20    lda #$20
F418: A0 00    ldy #$00
F41A: 91 08    sta ($08), y
F41C: 4C C3 E4 jmp $e4c3
F41F: 90 04    bcc $f425
F421: 29 0F    and #$0f
F423: F0 05    beq $f42a
F425: 29 0F    and #$0f
F427: 18       clc
F428: 69 01    adc #$01
F42A: 08       php
F42B: 0A       asl a
F42C: A0 00    ldy #$00
F42E: AA       tax
F42F: BD 48 4D lda $4d48, x
F432: 91 08    sta ($08), y
F434: BD 49 4D lda $4d49, x
F437: C8       iny
F438: 91 08    sta ($08), y
F43A: 20 72 E4 jsr $e472
F43D: 28       plp
F43E: 60       rts
F43F: 38       sec
F440: E9 20    sbc #$20
F442: 4A       lsr a
F443: 29 1F    and #$1f
F445: 09 E0    ora #$e0
F447: A0 01    ldy #$01
F449: 91 08    sta ($08), y
F44B: 88       dey
F44C: 8A       txa
F44D: 6A       ror a
F44E: 91 08    sta ($08), y
F450: C8       iny
F451: D0 1F    bne $f472
F453: 38       sec
F454: E9 20    sbc #$20
F456: 4A       lsr a
F457: 29 1F    and #$1f
F459: 09 A0    ora #$a0
F45B: D0 EA    bne $f447
F45D: A4 0A    ldy $0a
F45F: 09 60    ora #$60
F461: AA       tax
F462: 98       tya
F463: 4C 6A E4 jmp $e46a
F466: A9 40    lda #$40
F468: A2 80    ldx #$80
F46A: A0 00    ldy #$00
F46C: 91 08    sta ($08), y
F46E: C8       iny
F46F: 8A       txa
F470: 91 08    sta ($08), y
F472: 98       tya
F473: 38       sec
F474: 65 08    adc $08
F476: 85 08    sta $08
F478: 90 02    bcc $f47c
F47A: E6 09    inc $09
F47C: 60       rts
F47D: A0 00    ldy #$00
F47F: 09 70    ora #$70
F481: AA       tax
F482: 98       tya
F483: 4C 6A E4 jmp $e46a
F486: A8       tay
F487: A9 00    lda #$00
F489: AA       tax
F48A: 84 0A    sty $0a
F48C: A0 00    ldy #$00
F48E: 0A       asl a
F48F: 90 01    bcc $f492
F491: 88       dey
F492: 84 05    sty $05
F494: 0A       asl a
F495: 26 05    rol $05
F497: 85 04    sta $04
F499: 8A       txa
F49A: 0A       asl a
F49B: A0 00    ldy #$00
F49D: 90 01    bcc $f4a0
F49F: 88       dey
F4A0: 84 07    sty $07
F4A2: 0A       asl a
F4A3: 26 07    rol $07
F4A5: 85 06    sta $06
F4A7: A2 04    ldx #$04
F4A9: A0 00    ldy #$00
F4AB: B5 02    lda $02, x
F4AD: 91 08    sta ($08), y
F4AF: B5 03    lda $03, x
F4B1: 29 1F    and #$1f
F4B3: C8       iny
F4B4: 91 08    sta ($08), y
F4B6: B5 00    lda $00, x
F4B8: C8       iny
F4B9: 91 08    sta ($08), y
F4BB: B5 01    lda $01, x
F4BD: 45 0A    eor $0a
F4BF: 29 1F    and #$1f
F4C1: 45 0A    eor $0a
F4C3: C8       iny
F4C4: 91 08    sta ($08), y
F4C6: D0 AA    bne $f472
F4C8: 00       brk
F4C9: 09 0A    ora #$0a
F4CB: 13 14    slo ($14), y
F4CD: 24 63    bit $63
F4CF: 04 5A    nop $5a
F4D1: 04 50    nop $50
F4D3: 04 A9    nop $a9
F4D5: 04 D0    nop $d0
F4D7: 06 A9    asl $a9
F4D9: 03 D0    slo ($d0, x)
F4DB: 02       kil
F4DC: A9 07    lda #$07
F4DE: A0 FF    ldy #$ff
F4E0: D0 08    bne $f4ea
F4E2: A9 03    lda #$03
F4E4: D0 02    bne $f4e8
F4E6: A9 04    lda #$04
F4E8: A0 00    ldy #$00
F4EA: 8C 70 01 sty $0170
F4ED: 48       pha
F4EE: 0D 71 01 ora $0171
F4F1: 8D 71 01 sta $0171
F4F4: 68       pla
F4F5: 0D 72 01 ora $0172
F4F8: 8D 72 01 sta $0172
F4FB: 60       rts
F4FC: A9 07    lda #$07
F4FE: 8D 71 01 sta $0171
F501: A9 00    lda #$00
F503: 8D 72 01 sta $0172
F506: AD 74 01 lda $0174
F509: D0 4B    bne $f556
F50B: AD 71 01 lda $0171
F50E: F0 46    beq $f556
F510: A2 00    ldx #$00
F512: 8E 75 01 stx $0175
F515: 8E 79 01 stx $0179
F518: 8E 78 01 stx $0178
F51B: A2 08    ldx #$08
F51D: 38       sec
F51E: 6E 78 01 ror $0178
F521: 0A       asl a
F522: CA       dex
F523: 90 F9    bcc $f51e
F525: A0 80    ldy #$80
F527: AD 78 01 lda $0178
F52A: 2D 72 01 and $0172
F52D: D0 02    bne $f531
F52F: A0 20    ldy #$20
F531: 8C 74 01 sty $0174
F534: AD 78 01 lda $0178
F537: 4D 71 01 eor $0171
F53A: 8D 71 01 sta $0171
F53D: 8A       txa
F53E: 0A       asl a
F53F: AA       tax
F540: BD C8 E4 lda $e4c8, x
F543: 8D 76 01 sta $0176
F546: BD C9 E4 lda $e4c9, x
F549: 8D 77 01 sta $0177
F54C: BD CE E4 lda $e4ce, x
F54F: 85 E1    sta $e1
F551: BD CF E4 lda $e4cf, x
F554: 85 E2    sta $e2
F556: A0 00    ldy #$00
F558: 8C 00 89 sty $8900
F55B: AD 74 01 lda $0174
F55E: D0 01    bne $f561
F560: 60       rts
F561: AC 75 01 ldy $0175
F564: AE 76 01 ldx $0176
F567: 0A       asl a
F568: 90 0D    bcc $f577
F56A: 9D 40 89 sta $8940, x
F56D: A9 40    lda #$40
F56F: 8D 74 01 sta $0174
F572: A0 0E    ldy #$0e
F574: 4C EA E5 jmp $e5ea
F577: 10 25    bpl $f59e
F579: A9 80    lda #$80
F57B: 8D 74 01 sta $0174
F57E: AD 70 01 lda $0170
F581: F0 04    beq $f587
F583: A9 00    lda #$00
F585: 91 E1    sta ($e1), y
F587: B1 E1    lda ($e1), y
F589: EC 77 01 cpx $0177
F58C: 90 08    bcc $f596
F58E: A9 00    lda #$00
F590: 8D 74 01 sta $0174
F593: AD 79 01 lda $0179
F596: 9D 40 89 sta $8940, x
F599: A0 0C    ldy #$0c
F59B: 4C DD E5 jmp $e5dd
F59E: A9 08    lda #$08
F5A0: 8D 00 89 sta $8900
F5A3: 9D 40 89 sta $8940, x
F5A6: A9 09    lda #$09
F5A8: 8D 00 89 sta $8900
F5AB: EA       nop
F5AC: A9 08    lda #$08
F5AE: 8D 00 89 sta $8900
F5B1: EC 77 01 cpx $0177
F5B4: AD 00 70 lda $7000
F5B7: 90 20    bcc $f5d9
F5B9: 4D 79 01 eor $0179
F5BC: F0 13    beq $f5d1
F5BE: A9 00    lda #$00
F5C0: AC 75 01 ldy $0175
F5C3: 91 E1    sta ($e1), y
F5C5: 88       dey
F5C6: 10 FB    bpl $f5c3
F5C8: AD 78 01 lda $0178
F5CB: 0D 73 01 ora $0173
F5CE: 8D 73 01 sta $0173
F5D1: A9 00    lda #$00
F5D3: 8D 74 01 sta $0174
F5D6: 4C DB E5 jmp $e5db
F5D9: 91 E1    sta ($e1), y
F5DB: A0 00    ldy #$00
F5DD: 18       clc
F5DE: 6D 79 01 adc $0179
F5E1: 8D 79 01 sta $0179
F5E4: EE 75 01 inc $0175
F5E7: EE 76 01 inc $0176
F5EA: 8C 00 89 sty $8900
F5ED: 98       tya
F5EE: D0 03    bne $f5f3
F5F0: 4C 06 E5 jmp $e506
F5F3: 60       rts
F5F4: 78       sei
F5F5: D8       cld
F5F6: A9 FF    lda #$ff
F5F8: 85 02    sta $02
F5FA: D0 11    bne $f60d
F5FC: A5 00    lda $00
F5FE: F0 0D    beq $f60d
F600: AD 00 78 lda $7800
F603: 29 40    and #$40
F605: F0 06    beq $f60d
F607: 8D 80 88 sta $8880
F60A: 8D 40 88 sta $8840
F60D: 8D 80 89 sta $8980
F610: AD 00 78 lda $7800
F613: 29 10    and #$10
F615: F0 03    beq $f61a
F617: 4C 3A E8 jmp $e83a
F61A: AD 00 80 lda $8000
F61D: 18       clc
F61E: 2A       rol a
F61F: 2A       rol a
F620: 2A       rol a
F621: 2A       rol a
F622: 49 FF    eor #$ff
F624: 29 07    and #$07
F626: 85 00    sta $00
F628: A5 00    lda $00
F62A: C5 02    cmp $02
F62C: F0 CE    beq $f5fc
F62E: 85 02    sta $02
F630: AA       tax
F631: F0 21    beq $f654
F633: A9 C7    lda #$c7
F635: 8D 00 20 sta $2000
F638: A9 60    lda #$60
F63A: 8D 01 20 sta $2001
F63D: BC A8 E6 ldy $e6a8, x
F640: BD B0 E6 lda $e6b0, x
F643: AA       tax
F644: B9 B8 E6 lda $e6b8, y
F647: 9D 02 20 sta $2002, x
F64A: 88       dey
F64B: CA       dex
F64C: 10 F6    bpl $f644
F64E: 8D 80 88 sta $8880
F651: 4C FC E5 jmp $e5fc
F654: A9 20    lda #$20
F656: 85 04    sta $04
F658: A9 00    lda #$00
F65A: 85 03    sta $03
F65C: 85 01    sta $01
F65E: A8       tay
F65F: A9 08    lda #$08
F661: 85 00    sta $00
F663: 18       clc
F664: A5 01    lda $01
F666: 91 03    sta ($03), y
F668: 69 05    adc #$05
F66A: 85 01    sta $01
F66C: C8       iny
F66D: D0 F4    bne $f663
F66F: E6 04    inc $04
F671: C6 00    dec $00
F673: D0 EE    bne $f663
F675: A0 07    ldy #$07
F677: A2 00    ldx #$00
F679: A9 11    lda #$11
F67B: 9D 80 27 sta $2780, x
F67E: 9D 80 26 sta $2680, x
F681: 48       pha
F682: 8A       txa
F683: 18       clc
F684: 69 10    adc #$10
F686: AA       tax
F687: 68       pla
F688: 88       dey
F689: 10 F0    bpl $f67b
F68B: 8D B2 26 sta $26b2
F68E: 8D B2 27 sta $27b2
F691: 8D DE 26 sta $26de
F694: 8D EE 26 sta $26ee
F697: 8D DE 27 sta $27de
F69A: 8D EE 27 sta $27ee
F69D: A9 80    lda #$80
F69F: 8D FE 26 sta $26fe
F6A2: 8D FE 27 sta $27fe
F6A5: 4C 4E E6 jmp $e64e
F6A8: 01 01    ora ($01, x)
F6AA: 15 2B    ora $2b, x
F6AC: 45 71    eor $71
F6AE: 01 01    ora ($01, x)
F6B0: 01 01    ora ($01, x)
F6B2: 13 15    slo ($15), y
F6B4: 19 2B 01 ora $012b, y
F6B7: 01 00    ora ($00, x)
F6B9: 20 40 80 jsr $8040
F6BC: 00       brk
F6BD: 71 80    adc ($80), y
F6BF: 01 00    ora ($00, x)
F6C1: 22       kil
F6C2: 40       rti
F6C3: 80 00    nop #$00
F6C5: 60       rts
F6C6: 80 1E    nop #$1e
F6C8: 00       brk
F6C9: 3E 40 80 rol $8040, x
F6CC: 00       brk
F6CD: 20 40 80 jsr $8040
F6D0: 00       brk
F6D1: 71 80    adc ($80), y
F6D3: 01 00    ora ($00, x)
F6D5: 22       kil
F6D6: 07 E0    slo $e0
F6D8: 00       brk
F6D9: 20 40 80 jsr $8040
F6DC: 80 1E    nop #$1e
F6DE: 00       brk
F6DF: 3E 40 80 rol $8040, x
F6E2: 00       brk
F6E3: 20 40 80 jsr $8040
F6E6: 00       brk
F6E7: 71 80    adc ($80), y
F6E9: 01 00    ora ($00, x)
F6EB: 22       kil
F6EC: 07 E0    slo $e0
F6EE: 00       brk
F6EF: 20 40 80 jsr $8040
F6F2: 80 1E    nop #$1e
F6F4: 00       brk
F6F5: 3E 40 80 rol $8040, x
F6F8: 2F 51 40 rla $4051
F6FB: 80 00    nop #$00
F6FD: 20 40 80 jsr $8040
F700: 00       brk
F701: 71 80    adc ($80), y
F703: 01 00    ora ($00, x)
F705: 22       kil
F706: 07 E0    slo $e0
F708: 00       brk
F709: 20 40 80 jsr $8040
F70C: 80 1E    nop #$1e
F70E: 00       brk
F70F: 3E 40 80 rol $8040, x
F712: 2F 51 40 rla $4051
F715: 80 11    nop #$11
F717: A0 20    ldy #$20
F719: 51 40    eor ($40), y
F71B: 80 00    nop #$00
F71D: 20 13 A0 jsr $a013
F720: 00       brk
F721: C0 15    cpy #$15
F723: A0 00    ldy #$00
F725: C0 2F    cpy #$2f
F727: 40       rti
F728: 00       brk
F729: C0 A2    cpy #$a2
F72B: 02       kil
F72C: AD 00 78 lda $7800
F72F: E0 01    cpx #$01
F731: F0 03    beq $f736
F733: B0 02    bcs $f737
F735: 4A       lsr a
F736: 4A       lsr a
F737: 4A       lsr a
F738: B5 DB    lda $db, x
F73A: 29 1F    and #$1f
F73C: B0 37    bcs $f775
F73E: F0 10    beq $f750
F740: C9 1B    cmp #$1b
F742: B0 0A    bcs $f74e
F744: A8       tay
F745: A5 E0    lda $e0
F747: 29 07    and #$07
F749: C9 07    cmp #$07
F74B: 98       tya
F74C: 90 02    bcc $f750
F74E: E9 01    sbc #$01
F750: 95 DB    sta $db, x
F752: AD 00 78 lda $7800
F755: 29 08    and #$08
F757: D0 04    bne $f75d
F759: A9 F0    lda #$f0
F75B: 85 DE    sta $de
F75D: A5 DE    lda $de
F75F: F0 08    beq $f769
F761: C6 DE    dec $de
F763: A9 00    lda #$00
F765: 95 DB    sta $db, x
F767: 95 D8    sta $d8, x
F769: 18       clc
F76A: B5 D8    lda $d8, x
F76C: F0 23    beq $f791
F76E: D6 D8    dec $d8, x
F770: D0 1F    bne $f791
F772: 38       sec
F773: B0 1C    bcs $f791
F775: C9 1B    cmp #$1b
F777: B0 09    bcs $f782
F779: B5 DB    lda $db, x
F77B: 69 20    adc #$20
F77D: 90 D1    bcc $f750
F77F: F0 01    beq $f782
F781: 18       clc
F782: A9 1F    lda #$1f
F784: B0 CA    bcs $f750
F786: 95 DB    sta $db, x
F788: B5 D8    lda $d8, x
F78A: F0 01    beq $f78d
F78C: 38       sec
F78D: A9 78    lda #$78
F78F: 95 D8    sta $d8, x
F791: 90 2A    bcc $f7bd
F793: A9 00    lda #$00
F795: E0 01    cpx #$01
F797: 90 16    bcc $f7af
F799: F0 0C    beq $f7a7
F79B: A5 DF    lda $df
F79D: 29 0C    and #$0c
F79F: 4A       lsr a
F7A0: 4A       lsr a
F7A1: F0 0C    beq $f7af
F7A3: 69 02    adc #$02
F7A5: D0 08    bne $f7af
F7A7: A5 DF    lda $df
F7A9: 29 10    and #$10
F7AB: F0 02    beq $f7af
F7AD: A9 01    lda #$01
F7AF: 38       sec
F7B0: 48       pha
F7B1: 65 D1    adc $d1
F7B3: 85 D1    sta $d1
F7B5: 68       pla
F7B6: 38       sec
F7B7: 65 D7    adc $d7
F7B9: 85 D7    sta $d7
F7BB: F6 D3    inc $d3, x
F7BD: CA       dex
F7BE: 30 03    bmi $f7c3
F7C0: 4C 2C E7 jmp $e72c
F7C3: A5 DF    lda $df
F7C5: 4A       lsr a
F7C6: 4A       lsr a
F7C7: 4A       lsr a
F7C8: 4A       lsr a
F7C9: 4A       lsr a
F7CA: A8       tay
F7CB: A5 D1    lda $d1
F7CD: 38       sec
F7CE: F9 DF E7 sbc $e7df, y
F7D1: 30 14    bmi $f7e7
F7D3: 85 D1    sta $d1
F7D5: E6 D2    inc $d2
F7D7: C0 03    cpy #$03
F7D9: D0 0C    bne $f7e7
F7DB: E6 D2    inc $d2
F7DD: D0 08    bne $f7e7
F7DF: 7F 02 04 rra $0402, x
F7E2: 04 05    nop $05
F7E4: 03 7F    slo ($7f, x)
F7E6: 7F A5 DF rra $dfa5, x
F7E9: 29 03    and #$03
F7EB: A8       tay
F7EC: F0 1A    beq $f808
F7EE: 4A       lsr a
F7EF: 69 00    adc #$00
F7F1: 49 FF    eor #$ff
F7F3: 38       sec
F7F4: 65 D7    adc $d7
F7F6: B0 08    bcs $f800
F7F8: 65 D2    adc $d2
F7FA: 30 0E    bmi $f80a
F7FC: 85 D2    sta $d2
F7FE: A9 00    lda #$00
F800: C0 02    cpy #$02
F802: B0 02    bcs $f806
F804: E6 D6    inc $d6
F806: E6 D6    inc $d6
F808: 85 D7    sta $d7
F80A: E6 E0    inc $e0
F80C: A5 E0    lda $e0
F80E: 4A       lsr a
F80F: B0 27    bcs $f838
F811: A0 00    ldy #$00
F813: A2 02    ldx #$02
F815: B5 D3    lda $d3, x
F817: F0 09    beq $f822
F819: C9 10    cmp #$10
F81B: 90 05    bcc $f822
F81D: 69 EF    adc #$ef
F81F: C8       iny
F820: 95 D3    sta $d3, x
F822: CA       dex
F823: 10 F0    bpl $f815
F825: 98       tya
F826: D0 10    bne $f838
F828: A2 02    ldx #$02
F82A: B5 D3    lda $d3, x
F82C: F0 07    beq $f835
F82E: 18       clc
F82F: 69 EF    adc #$ef
F831: 95 D3    sta $d3, x
F833: 30 03    bmi $f838
F835: CA       dex
F836: 10 F2    bpl $f82a
F838: 60       rts
F839: CD 78 A2 cmp $a278
F83C: FE 9A A9 inc $a99a, x
F83F: 00       brk
F840: 8D 80 88 sta $8880
F843: D8       cld
F844: AA       tax
F845: 95 00    sta $00, x
F847: 9D 00 01 sta $0100, x
F84A: 9D 00 02 sta $0200, x
F84D: 9D 00 03 sta $0300, x
F850: 9D 00 04 sta $0400, x
F853: 9D 00 05 sta $0500, x
F856: 9D 00 06 sta $0600, x
F859: 9D 00 07 sta $0700, x
F85C: 9D 00 20 sta $2000, x
F85F: 9D 00 21 sta $2100, x
F862: 9D 00 22 sta $2200, x
F865: 9D 00 23 sta $2300, x
F868: 9D 00 24 sta $2400, x
F86B: 9D 00 25 sta $2500, x
F86E: 9D 00 26 sta $2600, x
F871: 9D 00 27 sta $2700, x
F874: 9D 00 60 sta $6000, x
F877: 9D 00 68 sta $6800, x
F87A: 8D 80 89 sta $8980
F87D: E8       inx
F87E: D0 C5    bne $f845
F880: A9 C0    lda #$c0
F882: 8D 00 88 sta $8800
F885: A9 07    lda #$07
F887: 8D 0F 60 sta $600f
F88A: 8D 0F 68 sta $680f
F88D: AD 00 78 lda $7800
F890: 29 10    and #$10
F892: D0 03    bne $f897
F894: 4C D2 E8 jmp $e8d2
F897: A9 01    lda #$01
F899: 8D 00 20 sta $2000
F89C: A9 E2    lda #$e2
F89E: 8D 01 20 sta $2001
F8A1: A9 20    lda #$20
F8A3: 8D 03 20 sta $2003
F8A6: 8D 03 24 sta $2403
F8A9: A9 24    lda #$24
F8AB: 85 09    sta $09
F8AD: A9 02    lda #$02
F8AF: 85 08    sta $08
F8B1: 58       cli
F8B2: E6 FB    inc $fb
F8B4: A5 FB    lda $fb
F8B6: 8D 80 89 sta $8980
F8B9: D0 F9    bne $f8b4
F8BB: 20 FC E4 jsr $e4fc
F8BE: AD 74 01 lda $0174
F8C1: 8D 80 89 sta $8980
F8C4: D0 F8    bne $f8be
F8C6: AD 73 01 lda $0173
F8C9: 4A       lsr a
F8CA: B0 03    bcs $f8cf
F8CC: 20 9E CB jsr $cb9e
F8CF: 4C 00 90 jmp $9000
F8D2: A2 11    ldx #$11
F8D4: 9A       txs
F8D5: 8A       txa
F8D6: 86 00    stx $00
F8D8: A0 00    ldy #$00
F8DA: A2 01    ldx #$01
F8DC: C8       iny
F8DD: B9 00 00 lda $0000, y
F8E0: D0 21    bne $f903
F8E2: E8       inx
F8E3: D0 F7    bne $f8dc
F8E5: BA       tsx
F8E6: 8A       txa
F8E7: 8D 80 89 sta $8980
F8EA: C8       iny
F8EB: 59 00 00 eor $0000, y
F8EE: D0 13    bne $f903
F8F0: 8A       txa
F8F1: A2 00    ldx #$00
F8F3: 96 00    stx $00, y
F8F5: C8       iny
F8F6: D0 05    bne $f8fd
F8F8: 0A       asl a
F8F9: A2 00    ldx #$00
F8FB: B0 4B    bcs $f948
F8FD: AA       tax
F8FE: 9A       txs
F8FF: 96 00    stx $00, y
F901: D0 D7    bne $f8da
F903: AA       tax
F904: 8A       txa
F905: A0 82    ldy #$82
F907: 29 0F    and #$0f
F909: F0 02    beq $f90d
F90B: A0 12    ldy #$12
F90D: 8A       txa
F90E: A2 82    ldx #$82
F910: 29 F0    and #$f0
F912: F0 02    beq $f916
F914: A2 12    ldx #$12
F916: 98       tya
F917: 9A       txs
F918: AA       tax
F919: 8E 00 60 stx $6000
F91C: A2 A8    ldx #$a8
F91E: 8E 01 60 stx $6001
F921: A0 0C    ldy #$0c
F923: A2 64    ldx #$64
F925: 2C 00 78 bit $7800
F928: 30 FB    bmi $f925
F92A: 2C 00 78 bit $7800
F92D: 10 FB    bpl $f92a
F92F: 8D 80 89 sta $8980
F932: CA       dex
F933: D0 F0    bne $f925
F935: C0 05    cpy #$05
F937: D0 03    bne $f93c
F939: 8E 01 60 stx $6001
F93C: 88       dey
F93D: D0 E4    bne $f923
F93F: 4A       lsr a
F940: B0 03    bcs $f945
F942: BA       tsx
F943: D0 D4    bne $f919
F945: 4C FF E9 jmp $e9ff
F948: A2 FF    ldx #$ff
F94A: 9A       txs
F94B: A2 00    ldx #$00
F94D: 8A       txa
F94E: 95 00    sta $00, x
F950: E8       inx
F951: D0 FB    bne $f94e
F953: A8       tay
F954: A9 01    lda #$01
F956: 85 01    sta $01
F958: A2 11    ldx #$11
F95A: B1 00    lda ($00), y
F95C: D0 27    bne $f985
F95E: 8A       txa
F95F: 91 00    sta ($00), y
F961: 51 00    eor ($00), y
F963: D0 20    bne $f985
F965: 8A       txa
F966: 0A       asl a
F967: AA       tax
F968: 90 F5    bcc $f95f
F96A: C8       iny
F96B: D0 EB    bne $f958
F96D: 8D 80 89 sta $8980
F970: E6 01    inc $01
F972: A6 01    ldx $01
F974: E0 04    cpx #$04
F976: 90 E0    bcc $f958
F978: A9 20    lda #$20
F97A: E0 20    cpx #$20
F97C: 90 D8    bcc $f956
F97E: E0 28    cpx #$28
F980: 90 D6    bcc $f958
F982: 4C 06 EA jmp $ea06
F985: A6 01    ldx $01
F987: E0 20    cpx #$20
F989: 85 02    sta $02
F98B: 90 03    bcc $f990
F98D: 8A       txa
F98E: E9 1C    sbc #$1c
F990: 4A       lsr a
F991: 4A       lsr a
F992: 29 07    and #$07
F994: A8       tay
F995: A5 02    lda $02
F997: 84 00    sty $00
F999: 85 01    sta $01
F99B: A9 01    lda #$01
F99D: 85 02    sta $02
F99F: A2 A8    ldx #$a8
F9A1: A0 82    ldy #$82
F9A3: A5 00    lda $00
F9A5: D0 08    bne $f9af
F9A7: A5 01    lda $01
F9A9: 29 0F    and #$0f
F9AB: F0 02    beq $f9af
F9AD: A0 12    ldy #$12
F9AF: 8E 01 60 stx $6001
F9B2: 8C 00 60 sty $6000
F9B5: A9 09    lda #$09
F9B7: C0 12    cpy #$12
F9B9: F0 02    beq $f9bd
F9BB: A9 01    lda #$01
F9BD: A8       tay
F9BE: A2 00    ldx #$00
F9C0: 2C 00 78 bit $7800
F9C3: 30 FB    bmi $f9c0
F9C5: 2C 00 78 bit $7800
F9C8: 10 FB    bpl $f9c5
F9CA: 8D 80 89 sta $8980
F9CD: CA       dex
F9CE: D0 F0    bne $f9c0
F9D0: 88       dey
F9D1: D0 ED    bne $f9c0
F9D3: 8E 01 60 stx $6001
F9D6: A0 09    ldy #$09
F9D8: 2C 00 78 bit $7800
F9DB: 30 FB    bmi $f9d8
F9DD: 2C 00 78 bit $7800
F9E0: 10 FB    bpl $f9dd
F9E2: 8D 80 89 sta $8980
F9E5: CA       dex
F9E6: D0 F0    bne $f9d8
F9E8: 88       dey
F9E9: D0 ED    bne $f9d8
F9EB: A5 00    lda $00
F9ED: D0 08    bne $f9f7
F9EF: A5 01    lda $01
F9F1: 4A       lsr a
F9F2: 4A       lsr a
F9F3: 4A       lsr a
F9F4: 4A       lsr a
F9F5: 85 01    sta $01
F9F7: C6 02    dec $02
F9F9: F0 A4    beq $f99f
F9FB: C6 00    dec $00
F9FD: 10 9C    bpl $f99b
F9FF: 8D 80 89 sta $8980
FA02: A9 FF    lda #$ff
FA04: 85 74    sta $74
FA06: A9 00    lda #$00
FA08: AA       tax
FA09: 9D 00 01 sta $0100, x
FA0C: 9D 00 02 sta $0200, x
FA0F: 9D 00 03 sta $0300, x
FA12: CA       dex
FA13: D0 F4    bne $fa09
FA15: A8       tay
FA16: 85 21    sta $21
FA18: A9 30    lda #$30
FA1A: 85 22    sta $22
FA1C: A9 10    lda #$10
FA1E: 85 23    sta $23
FA20: 8A       txa
FA21: 51 21    eor ($21), y
FA23: C8       iny
FA24: D0 FB    bne $fa21
FA26: E6 22    inc $22
FA28: 8D 80 89 sta $8980
FA2B: C6 23    dec $23
FA2D: D0 F2    bne $fa21
FA2F: 95 6B    sta $6b, x
FA31: E8       inx
FA32: F0 18    beq $fa4c
FA34: A5 22    lda $22
FA36: C9 60    cmp #$60
FA38: D0 04    bne $fa3e
FA3A: A9 90    lda #$90
FA3C: 85 22    sta $22
FA3E: C9 F0    cmp #$f0
FA40: 90 D8    bcc $fa1a
FA42: A2 FF    ldx #$ff
FA44: A9 28    lda #$28
FA46: 85 22    sta $22
FA48: A9 08    lda #$08
FA4A: D0 D2    bne $fa1e
FA4C: A5 6A    lda $6a
FA4E: 05 6B    ora $6b
FA50: F0 0A    beq $fa5c
FA52: A9 F0    lda #$f0
FA54: A2 A2    ldx #$a2
FA56: 8D 04 60 sta $6004
FA59: 8E 05 60 stx $6005
FA5C: A2 05    ldx #$05
FA5E: AD 0A 68 lda $680a
FA61: CD 0A 68 cmp $680a
FA64: D0 05    bne $fa6b
FA66: CA       dex
FA67: 10 F8    bpl $fa61
FA69: 85 75    sta $75
FA6B: A2 05    ldx #$05
FA6D: AD 0A 60 lda $600a
FA70: CD 0A 60 cmp $600a
FA73: D0 05    bne $fa7a
FA75: CA       dex
FA76: 10 F8    bpl $fa70
FA78: 85 76    sta $76
FA7A: 58       cli
FA7B: 20 FC E4 jsr $e4fc
FA7E: A0 02    ldy #$02
FA80: AD 73 01 lda $0173
FA83: F0 0A    beq $fa8f
FA85: 85 77    sta $77
FA87: 20 DC E4 jsr $e4dc
FA8A: A0 00    ldy #$00
FA8C: 8C 73 01 sty $0173
FA8F: 84 69    sty $69
FA91: 4C D7 EC jmp $ecd7
FA94: AD 74 01 lda $0174
FA97: 0D 71 01 ora $0171
FA9A: D0 0C    bne $faa8
FA9C: 20 FC E4 jsr $e4fc
FA9F: AD 73 01 lda $0173
FAA2: 85 77    sta $77
FAA4: A9 02    lda #$02
FAA6: 85 69    sta $69
FAA8: 60       rts
FAA9: A0 A7    ldy #$a7
FAAB: A9 04    lda #$04
FAAD: 20 5F E4 jsr $e45f
FAB0: A2 8E    ldx #$8e
FAB2: A9 4A    lda #$4a
FAB4: 20 53 E4 jsr $e453
FAB7: A9 48    lda #$48
FAB9: A2 40    ldx #$40
FABB: A0 00    ldy #$00
FABD: 20 8A E4 jsr $e48a
FAC0: 20 41 EC jsr $ec41
FAC3: A9 01    lda #$01
FAC5: 20 7F E4 jsr $e47f
FAC8: A2 46    ldx #$46
FACA: 86 23    stx $23
FACC: A2 09    ldx #$09
FACE: B5 6A    lda $6a, x
FAD0: F0 1B    beq $faed
FAD2: 86 22    stx $22
FAD4: 20 66 E4 jsr $e466
FAD7: A6 23    ldx $23
FAD9: 8A       txa
FADA: 38       sec
FADB: E9 08    sbc #$08
FADD: 85 23    sta $23
FADF: A9 F6    lda #$f6
FAE1: A0 00    ldy #$00
FAE3: 20 8A E4 jsr $e48a
FAE6: A5 22    lda $22
FAE8: 20 54 DE jsr $de54
FAEB: A6 22    ldx $22
FAED: CA       dex
FAEE: 10 DE    bpl $face
FAF0: 20 66 E4 jsr $e466
FAF3: A9 F6    lda #$f6
FAF5: A2 58    ldx #$58
FAF7: A0 00    ldy #$00
FAF9: 20 8A E4 jsr $e48a
FAFC: A2 03    ldx #$03
FAFE: 86 22    stx $22
FB00: A6 22    ldx $22
FB02: A0 00    ldy #$00
FB04: B5 74    lda $74, x
FB06: F0 03    beq $fb0b
FB08: BC C9 EB ldy $ebc9, x
FB0B: B9 48 4D lda $4d48, y
FB0E: BE 49 4D ldx $4d49, y
FB11: 20 6A E4 jsr $e46a
FB14: C6 22    dec $22
FB16: 10 E8    bpl $fb00
FB18: 20 A7 EC jsr $eca7
FB1B: 60       rts
FB1C: A2 5C    ldx #$5c
FB1E: A9 4B    lda #$4b
FB20: 4C 53 E4 jmp $e453
FB23: E6 30    inc $30
FB25: 10 06    bpl $fb2d
FB27: A9 00    lda #$00
FB29: 85 30    sta $30
FB2B: E6 23    inc $23
FB2D: A5 23    lda $23
FB2F: 29 07    and #$07
FB31: AA       tax
FB32: BC 68 EB ldy $eb68, x
FB35: A9 00    lda #$00
FB37: 99 F1 67 sta $67f1, y
FB3A: BC 69 EB ldy $eb69, x
FB3D: BD 72 EB lda $eb72, x
FB40: 99 F0 67 sta $67f0, y
FB43: A9 A8    lda #$a8
FB45: 99 F1 67 sta $67f1, y
FB48: A2 62    ldx #$62
FB4A: A9 4B    lda #$4b
FB4C: 20 53 E4 jsr $e453
FB4F: 20 66 E4 jsr $e466
FB52: A4 30    ldy $30
FB54: A5 23    lda $23
FB56: 29 07    and #$07
FB58: D0 04    bne $fb5e
FB5A: A9 01    lda #$01
FB5C: 85 23    sta $23
FB5E: 20 7F E4 jsr $e47f
FB61: A2 90    ldx #$90
FB63: A9 4A    lda #$4a
FB65: 4C 53 E4 jmp $e453
FB68: 16 00    asl $00, x
FB6A: 10 02    bpl $fb6e
FB6C: 12       kil
FB6D: 04 14    nop $14
FB6F: 06 16    asl $16
FB71: 00       brk
FB72: 10 10    bpl $fb84
FB74: 40       rti
FB75: 40       rti
FB76: 90 90    bcc $fb08
FB78: FF FF A2 isb $a2ff, x
FB7B: 8E A9 4A stx $4aa9
FB7E: 20 53 E4 jsr $e453
FB81: A0 06    ldy #$06
FB83: 84 23    sty $23
FB85: 20 66 E4 jsr $e466
FB88: A4 23    ldy $23
FB8A: B9 BB EB lda $ebbb, y
FB8D: BE C2 EB ldx $ebc2, y
FB90: 20 8A E4 jsr $e48a
FB93: A5 23    lda $23
FB95: 49 FF    eor #$ff
FB97: 29 07    and #$07
FB99: A8       tay
FB9A: 20 5F E4 jsr $e45f
FB9D: A5 23    lda $23
FB9F: D0 07    bne $fba8
FBA1: A2 1E    ldx #$1e
FBA3: A9 4B    lda #$4b
FBA5: 4C AC EB jmp $ebac
FBA8: A2 18    ldx #$18
FBAA: A9 4B    lda #$4b
FBAC: 20 53 E4 jsr $e453
FBAF: C6 23    dec $23
FBB1: 10 D2    bpl $fb85
FBB3: A2 3C    ldx #$3c
FBB5: A9 4B    lda #$4b
FBB7: 20 53 E4 jsr $e453
FBBA: 60       rts
FBBB: DE 9D 1F dec $1f9d, x
FBBE: 9D DE 1F sta $1fde, x
FBC1: DE F4 D8 dec $d8f4, x
FBC4: D8       cld
FBC5: 10 D8    bpl $fb9f
FBC7: 10 10    bpl $fbd9
FBC9: 38       sec
FBCA: 34 36    nop $36, x
FBCC: 1E 20 66 asl $6620, x
FBCF: E4 A9    cpx $a9
FBD1: 01 20    ora ($20, x)
FBD3: 7D E4 A2 adc $a2e4, x
FBD6: 06 86    asl $86
FBD8: 22       kil
FBD9: A4 22    ldy $22
FBDB: A9 98    lda #$98
FBDD: BE 1C EC ldx $ec1c, y
FBE0: 20 8A E4 jsr $e48a
FBE3: A2 54    ldx #$54
FBE5: A9 4B    lda #$4b
FBE7: 20 53 E4 jsr $e453
FBEA: C6 22    dec $22
FBEC: 10 EB    bpl $fbd9
FBEE: A2 06    ldx #$06
FBF0: 86 22    stx $22
FBF2: A4 22    ldy $22
FBF4: B9 23 EC lda $ec23, y
FBF7: A2 60    ldx #$60
FBF9: 20 8A E4 jsr $e48a
FBFC: A2 4C    ldx #$4c
FBFE: A9 4B    lda #$4b
FC00: 20 53 E4 jsr $e453
FC03: C6 22    dec $22
FC05: 10 EB    bpl $fbf2
FC07: AD 00 88 lda $8800
FC0A: 29 20    and #$20
FC0C: D0 09    bne $fc17
FC0E: 06 21    asl $21
FC10: 90 02    bcc $fc14
FC12: E6 38    inc $38
FC14: 4C 1B EC jmp $ec1b
FC17: A9 20    lda #$20
FC19: 85 21    sta $21
FC1B: 60       rts
FC1C: B8       clv
FC1D: D0 E8    bne $fc07
FC1F: 00       brk
FC20: 18       clc
FC21: 30 48    bmi $fc6b
FC23: B2       kil
FC24: CC E6 00 cpy $00e6
FC27: 1A       nop
FC28: 34 4E    nop $4e, x
FC2A: A2 CE    ldx #$ce
FC2C: A9 4B    lda #$4b
FC2E: 20 53 E4 jsr $e453
FC31: A9 20    lda #$20
FC33: 85 21    sta $21
FC35: A2 C2    ldx #$c2
FC37: A9 4B    lda #$4b
FC39: 20 53 E4 jsr $e453
FC3C: C6 21    dec $21
FC3E: 10 F5    bpl $fc35
FC40: 60       rts
FC41: A2 0F    ldx #$0f
FC43: 86 22    stx $22
FC45: 8D 0B 60 sta $600b
FC48: EA       nop
FC49: AD 08 60 lda $6008
FC4C: 85 24    sta $24
FC4E: 8D 0B 68 sta $680b
FC51: EA       nop
FC52: AD 08 68 lda $6808
FC55: 48       pha
FC56: 29 01    and #$01
FC58: 18       clc
FC59: 20 54 DE jsr $de54
FC5C: 46 24    lsr $24
FC5E: 68       pla
FC5F: 6A       ror a
FC60: C6 22    dec $22
FC62: 10 F1    bpl $fc55
FC64: A9 D0    lda #$d0
FC66: A0 00    ldy #$00
FC68: A2 F8    ldx #$f8
FC6A: 20 8A E4 jsr $e48a
FC6D: A2 07    ldx #$07
FC6F: 86 22    stx $22
FC71: A9 78    lda #$78
FC73: 85 39    sta $39
FC75: A9 07    lda #$07
FC77: 85 3A    sta $3a
FC79: A9 00    lda #$00
FC7B: 85 38    sta $38
FC7D: A8       tay
FC7E: B1 38    lda ($38), y
FC80: 49 FF    eor #$ff
FC82: 29 7F    and #$7f
FC84: 48       pha
FC85: 29 01    and #$01
FC87: 18       clc
FC88: 20 54 DE jsr $de54
FC8B: 68       pla
FC8C: 6A       ror a
FC8D: C8       iny
FC8E: C6 3A    dec $3a
FC90: 10 F2    bpl $fc84
FC92: A9 D0    lda #$d0
FC94: A0 00    ldy #$00
FC96: A2 F8    ldx #$f8
FC98: 20 8A E4 jsr $e48a
FC9B: A5 39    lda $39
FC9D: 18       clc
FC9E: 69 08    adc #$08
FCA0: 85 39    sta $39
FCA2: C9 90    cmp #$90
FCA4: 90 CF    bcc $fc75
FCA6: 60       rts
FCA7: 84 24    sty $24
FCA9: AD 00 78 lda $7800
FCAC: 29 0F    and #$0f
FCAE: 85 21    sta $21
FCB0: AD 00 80 lda $8000
FCB3: 29 1F    and #$1f
FCB5: 85 22    sta $22
FCB7: AD 00 88 lda $8800
FCBA: 29 7F    and #$7f
FCBC: 85 23    sta $23
FCBE: A5 21    lda $21
FCC0: 09 10    ora #$10
FCC2: 25 22    and $22
FCC4: 09 60    ora #$60
FCC6: 25 23    and $23
FCC8: 49 7F    eor #$7f
FCCA: F0 07    beq $fcd3
FCCC: 69 40    adc #$40
FCCE: 8D 00 60 sta $6000
FCD1: A0 A4    ldy #$a4
FCD3: 8C 01 60 sty $6001
FCD6: 60       rts
FCD7: A2 18    ldx #$18
FCD9: 2C 00 78 bit $7800
FCDC: 10 FB    bpl $fcd9
FCDE: 2C 00 78 bit $7800
FCE1: 30 FB    bmi $fcde
FCE3: CA       dex
FCE4: 10 F3    bpl $fcd9
FCE6: E6 4F    inc $4f
FCE8: 2C 00 78 bit $7800
FCEB: 50 FB    bvc $fce8
FCED: A9 00    lda #$00
FCEF: 85 08    sta $08
FCF1: A9 20    lda #$20
FCF3: 85 09    sta $09
FCF5: AD 00 78 lda $7800
FCF8: 49 FF    eor #$ff
FCFA: 29 24    and #$24
FCFC: F0 26    beq $fd24
FCFE: 06 7B    asl $7b
FD00: 90 1F    bcc $fd21
FD02: AD 00 88 lda $8800
FD05: 29 40    and #$40
FD07: D0 06    bne $fd0f
FD09: 20 C2 E1 jsr $e1c2
FD0C: 20 F4 E5 jsr $e5f4
FD0F: E6 69    inc $69
FD11: E6 69    inc $69
FD13: A9 00    lda #$00
FD15: A2 06    ldx #$06
FD17: 9D 00 60 sta $6000, x
FD1A: 9D 00 68 sta $6800, x
FD1D: CA       dex
FD1E: CA       dex
FD1F: 10 F6    bpl $fd17
FD21: 4C 28 ED jmp $ed28
FD24: A9 20    lda #$20
FD26: 85 7B    sta $7b
FD28: A5 69    lda $69
FD2A: C9 0C    cmp #$0c
FD2C: D0 0E    bne $fd3c
FD2E: A5 38    lda $38
FD30: 29 07    and #$07
FD32: D0 02    bne $fd36
FD34: A9 01    lda #$01
FD36: 09 C0    ora #$c0
FD38: A8       tay
FD39: 4C 3E ED jmp $ed3e
FD3C: A0 A7    ldy #$a7
FD3E: A9 04    lda #$04
FD40: 20 5F E4 jsr $e45f
FD43: A2 8E    ldx #$8e
FD45: A9 4A    lda #$4a
FD47: 20 53 E4 jsr $e453
FD4A: 20 78 ED jsr $ed78
FD4D: 20 66 E4 jsr $e466
FD50: 20 13 E4 jsr $e413
FD53: A9 C0    lda #$c0
FD55: 85 F8    sta $f8
FD57: 8D 40 88 sta $8840
FD5A: 8D 80 89 sta $8980
FD5D: AD 00 78 lda $7800
FD60: 29 10    and #$10
FD62: D0 03    bne $fd67
FD64: 4C D7 EC jmp $ecd7
FD67: 4C 3A E8 jmp $e83a
FD6A: 93 EA    sha ($ea), y
FD6C: A8       tay
FD6D: EA       nop
FD6E: 1B EB 22 slo $22eb, y
FD71: EB 29    sbc #$29
FD73: EC 79 EB cpx $eb79
FD76: CC EB A6 cpy $a6eb
FD79: 69 E0    adc #$e0
FD7B: 0E 90 04 asl $0490
FD7E: A2 02    ldx #$02
FD80: 86 69    stx $69
FD82: BD 6B ED lda $ed6b, x
FD85: 48       pha
FD86: BD 6A ED lda $ed6a, x
FD89: 48       pha
FD8A: 60       rts
FD8B: A9 00    lda #$00
FD8D: 85 00    sta $00
FD8F: 8D 13 E4 sta $e413
FD92: 20 C2 E1 jsr $e1c2
FD95: 20 FC E4 jsr $e4fc
FD98: AD 74 01 lda $0174
FD9B: 30 32    bmi $fdcf
FD9D: A6 35    ldx $35
FD9F: AD 00 88 lda $8800
FDA2: 29 20    and #$20
FDA4: 85 35    sta $35
FDA6: D0 27    bne $fdcf
FDA8: AD 00 80 lda $8000
FDAB: 29 02    and #$02
FDAD: D0 0D    bne $fdbc
FDAF: A5 00    lda $00
FDB1: D0 03    bne $fdb6
FDB3: 4C 3A E8 jmp $e83a
FDB6: 20 DF ED jsr $eddf
FDB9: 4C CF ED jmp $edcf
FDBC: 8A       txa
FDBD: 29 20    and #$20
FDBF: F0 0E    beq $fdcf
FDC1: E6 00    inc $00
FDC3: E6 00    inc $00
FDC5: A5 00    lda $00
FDC7: C9 08    cmp #$08
FDC9: 90 04    bcc $fdcf
FDCB: A9 00    lda #$00
FDCD: 85 00    sta $00
FDCF: 20 03 EE jsr $ee03
FDD2: 20 11 EE jsr $ee11
FDD5: AD 00 78 lda $7800
FDD8: 29 10    and #$10
FDDA: F0 BC    beq $fd98
FDDC: 4C 3A E8 jmp $e83a
FDDF: A6 00    ldx $00
FDE1: E0 08    cpx #$08
FDE3: 90 04    bcc $fde9
FDE5: A2 00    ldx #$00
FDE7: 86 00    stx $00
FDE9: BD F3 ED lda $edf3, x
FDEC: 48       pha
FDED: BD F2 ED lda $edf2, x
FDF0: 48       pha
FDF1: 60       rts
FDF2: F9 ED F9 sbc $f9ed, y
FDF5: ED FC ED sbc $edfc
FDF8: FF ED 4C isb $4ced, x
FDFB: D8       cld
FDFC: E4 4C    cpx $4c
FDFE: D4 E4    nop $e4, x
FE00: 4C DC E4 jmp $e4dc
FE03: A5 1D    lda $1d
FE05: 29 1F    and #$1f
FE07: C9 1F    cmp #$1f
FE09: D0 05    bne $fe10
FE0B: 68       pla
FE0C: 68       pla
FE0D: 4C E1 90 jmp $90e1
FE10: 60       rts
FE11: 2C 00 78 bit $7800
FE14: 50 FB    bvc $fe11
FE16: A9 20    lda #$20
FE18: 85 09    sta $09
FE1A: A9 00    lda #$00
FE1C: 85 08    sta $08
FE1E: A2 A6    ldx #$a6
FE20: A9 4B    lda #$4b
FE22: 20 53 E4 jsr $e453
FE25: A9 01    lda #$01
FE27: A0 40    ldy #$40
FE29: 20 7F E4 jsr $e47f
FE2C: 20 32 EF jsr $ef32
FE2F: 20 49 EF jsr $ef49
FE32: 20 68 EF jsr $ef68
FE35: 20 A1 EF jsr $efa1
FE38: A2 40    ldx #$40
FE3A: A9 B0    lda #$b0
FE3C: 20 EE E1 jsr $e1ee
FE3F: A0 29    ldy #$29
FE41: 20 FC E1 jsr $e1fc
FE44: A5 00    lda $00
FE46: 4A       lsr a
FE47: A8       tay
FE48: B9 98 EE lda $ee98, y
FE4B: AA       tax
FE4C: B9 94 EE lda $ee94, y
FE4F: 48       pha
FE50: A9 E0    lda #$e0
FE52: 20 EE E1 jsr $e1ee
FE55: 68       pla
FE56: A8       tay
FE57: 20 FC E1 jsr $e1fc
FE5A: 20 ED EE jsr $eeed
FE5D: A9 F0    lda #$f0
FE5F: A2 D0    ldx #$d0
FE61: 20 EE E1 jsr $e1ee
FE64: 20 9C EE jsr $ee9c
FE67: 20 AD EE jsr $eead
FE6A: A2 C0    ldx #$c0
FE6C: A9 F0    lda #$f0
FE6E: 20 EE E1 jsr $e1ee
FE71: 18       clc
FE72: A5 22    lda $22
FE74: 20 47 DE jsr $de47
FE77: A5 21    lda $21
FE79: 20 47 DE jsr $de47
FE7C: AD 74 01 lda $0174
FE7F: 10 0C    bpl $fe8d
FE81: A9 F0    lda #$f0
FE83: A2 50    ldx #$50
FE85: 20 EE E1 jsr $e1ee
FE88: A0 27    ldy #$27
FE8A: 20 FC E1 jsr $e1fc
FE8D: 20 13 E4 jsr $e413
FE90: 8D 40 88 sta $8840
FE93: 60       rts
FE94: 28       plp
FE95: 2A       rol a
FE96: 2B 2C    anc #$2c
FE98: 30 30    bmi $feca
FE9A: 30 30    bmi $fecc
FE9C: A5 3A    lda $3a
FE9E: 18       clc
FE9F: 20 47 DE jsr $de47
FEA2: A5 39    lda $39
FEA4: 20 47 DE jsr $de47
FEA7: A5 38    lda $38
FEA9: 20 47 DE jsr $de47
FEAC: 60       rts
FEAD: A9 00    lda #$00
FEAF: 85 21    sta $21
FEB1: 85 22    sta $22
FEB3: AD 54 04 lda $0454
FEB6: 85 38    sta $38
FEB8: AD 55 04 lda $0455
FEBB: 85 39    sta $39
FEBD: AD 56 04 lda $0456
FEC0: 85 3A    sta $3a
FEC2: A5 23    lda $23
FEC4: 05 24    ora $24
FEC6: F0 24    beq $feec
FEC8: F8       sed
FEC9: A5 21    lda $21
FECB: 18       clc
FECC: 69 01    adc #$01
FECE: 85 21    sta $21
FED0: A5 22    lda $22
FED2: 69 00    adc #$00
FED4: 85 22    sta $22
FED6: D8       cld
FED7: A5 38    lda $38
FED9: 38       sec
FEDA: E5 23    sbc $23
FEDC: 85 38    sta $38
FEDE: A5 39    lda $39
FEE0: E5 24    sbc $24
FEE2: 85 39    sta $39
FEE4: A5 3A    lda $3a
FEE6: E9 00    sbc #$00
FEE8: 85 3A    sta $3a
FEEA: 10 DC    bpl $fec8
FEEC: 60       rts
FEED: AD 52 04 lda $0452
FEF0: 0A       asl a
FEF1: 85 21    sta $21
FEF3: AD 53 04 lda $0453
FEF6: 2A       rol a
FEF7: 85 22    sta $22
FEF9: AD 50 04 lda $0450
FEFC: 18       clc
FEFD: 65 21    adc $21
FEFF: 85 21    sta $21
FF01: 85 23    sta $23
FF03: AD 51 04 lda $0451
FF06: 65 22    adc $22
FF08: 85 22    sta $22
FF0A: 85 24    sta $24
FF0C: A0 0F    ldy #$0f
FF0E: A9 00    lda #$00
FF10: 85 38    sta $38
FF12: 85 39    sta $39
FF14: 85 3A    sta $3a
FF16: F8       sed
FF17: 06 21    asl $21
FF19: 26 22    rol $22
FF1B: A5 38    lda $38
FF1D: 65 38    adc $38
FF1F: 85 38    sta $38
FF21: A5 39    lda $39
FF23: 65 39    adc $39
FF25: 85 39    sta $39
FF27: A5 3A    lda $3a
FF29: 65 3A    adc $3a
FF2B: 85 3A    sta $3a
FF2D: 88       dey
FF2E: 10 E7    bpl $ff17
FF30: D8       cld
FF31: 60       rts
FF32: A2 68    ldx #$68
FF34: A9 FC    lda #$fc
FF36: 20 EE E1 jsr $e1ee
FF39: A5 F0    lda $f0
FF3B: 29 10    and #$10
FF3D: F0 05    beq $ff44
FF3F: A9 1C    lda #$1c
FF41: 4C 46 EF jmp $ef46
FF44: A9 22    lda #$22
FF46: 4C F8 D9 jmp $d9f8
FF49: A9 F0    lda #$f0
FF4B: A2 58    ldx #$58
FF4D: 20 EE E1 jsr $e1ee
FF50: A5 F1    lda $f1
FF52: 4A       lsr a
FF53: 4A       lsr a
FF54: 4A       lsr a
FF55: 4A       lsr a
FF56: 4A       lsr a
FF57: A8       tay
FF58: B9 60 EF lda $ef60, y
FF5B: 18       clc
FF5C: 20 47 DE jsr $de47
FF5F: 60       rts
FF60: 00       brk
FF61: 00       brk
FF62: 14 24    nop $24, x
FF64: 15 13    ora $13, x
FF66: 00       brk
FF67: 00       brk
FF68: A9 F0    lda #$f0
FF6A: A2 60    ldx #$60
FF6C: 20 EE E1 jsr $e1ee
FF6F: A5 F1    lda $f1
FF71: 29 03    and #$03
FF73: A8       tay
FF74: B9 9D EF lda $ef9d, y
FF77: 18       clc
FF78: 20 54 DE jsr $de54
FF7B: A5 F1    lda $f1
FF7D: 29 0C    and #$0c
FF7F: 4A       lsr a
FF80: 4A       lsr a
FF81: A8       tay
FF82: B9 99 EF lda $ef99, y
FF85: 20 54 DE jsr $de54
FF88: A5 F1    lda $f1
FF8A: 29 10    and #$10
FF8C: D0 05    bne $ff93
FF8E: A9 01    lda #$01
FF90: 4C 95 EF jmp $ef95
FF93: A9 02    lda #$02
FF95: 20 54 DE jsr $de54
FF98: 60       rts
FF99: 01 04    ora ($04, x)
FF9B: 05 06    ora $06
FF9D: 00       brk
FF9E: 02       kil
FF9F: 01 00    ora ($00, x)
FFA1: A9 C0    lda #$c0
FFA3: A2 D0    ldx #$d0
FFA5: 20 EE E1 jsr $e1ee
FFA8: A5 F0    lda $f0
FFAA: 4A       lsr a
FFAB: 4A       lsr a
FFAC: 29 03    and #$03
FFAE: A8       tay
FFAF: B9 F0 EF lda $eff0, y
FFB2: 85 21    sta $21
FFB4: AD C6 45 lda $45c6
FFB7: AE C7 45 ldx $45c7
FFBA: 20 6A E4 jsr $e46a
FFBD: A2 FB    ldx #$fb
FFBF: A9 F8    lda #$f8
FFC1: A0 00    ldy #$00
FFC3: 20 8A E4 jsr $e48a
FFC6: C6 21    dec $21
FFC8: 10 EA    bpl $ffb4
FFCA: AD 00 88 lda $8800
FFCD: 30 20    bmi $ffef
FFCF: A9 C0    lda #$c0
FFD1: A2 B0    ldx #$b0
FFD3: 20 EE E1 jsr $e1ee
FFD6: A9 18    lda #$18
FFD8: 20 F8 D9 jsr $d9f8
FFDB: A6 18    ldx $18
FFDD: AD 00 88 lda $8800
FFE0: 29 40    and #$40
FFE2: 85 18    sta $18
FFE4: D0 09    bne $ffef
FFE6: 8A       txa
FFE7: F0 06    beq $ffef
FFE9: A5 F8    lda $f8
FFEB: 49 C0    eor #$c0
FFED: 85 F8    sta $f8
FFEF: 60       rts

