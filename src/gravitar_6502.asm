; Gravitar (aka Moon Battle) (c) Atari
; 
; JOTD: disassembled & merged original source info
; the service mode/self-tests are less documented (if you need that consult the original
; sources) because I'm going to skip those when I remake it


;	map(0x0000, 0x07ff).ram();
;	map(0x2000, 0x27ff).ram(); // vector RAM
;	map(0x2800, 0x5fff).rom(); // vector ROM
;	map(0x6000, 0x67ff).rw("pokey1", FUNC(pokey_device::read), FUNC(pokey_device::write));
;	map(0x6800, 0x6fff).rw("pokey2", FUNC(pokey_device::read), FUNC(pokey_device::write));
;	map(0x7000, 0x7000).r(FUNC(bwidow_state::earom_read));
;	map(0x7800, 0x7800).portr("IN0");
;	map(0x8000, 0x8000).portr("IN3");
;	map(0x8800, 0x8800).portr("IN4");
;	map(0x8800, 0x8800).w(FUNC(bwidow_state::bwidow_misc_w)); // coin counters, LEDs
;	map(0x8840, 0x8840).w(m_avg, FUNC(avg_device::go_w));
;	map(0x8880, 0x8880).w(m_avg, FUNC(avg_device::reset_w));
;	map(0x88c0, 0x88c0).w(FUNC(bwidow_state::irq_ack_w)); // interrupt acknowledge
;	map(0x8900, 0x8900).w(FUNC(bwidow_state::earom_control_w));
;	map(0x8940, 0x897f).w(FUNC(bwidow_state::earom_write));
;	map(0x8980, 0x89ed).nopw(); // watchdog clear
;	map(0x9000, 0xffff).rom();

;	PORT_START("IN0")
;	PORT_BIT( 0x01, IP_ACTIVE_LOW, IPT_COIN2 )  // To fit "Coin B" Dip Switch
;	PORT_BIT( 0x02, IP_ACTIVE_LOW, IPT_COIN1 )  // To fit "Coin A" Dip Switch
;	PORT_BIT( 0x0c, IP_ACTIVE_LOW, IPT_UNUSED )
;	PORT_SERVICE( 0x10, IP_ACTIVE_LOW )
;	PORT_BIT( 0x20, IP_ACTIVE_LOW, IPT_SERVICE1 ) PORT_NAME("Diagnostic Step")
;	/* bit 6 is the VG HALT bit. We set it to "low" */
;	/* per default (busy vector processor). */
;	PORT_BIT( 0x40, IP_ACTIVE_HIGH, IPT_CUSTOM ) PORT_READ_LINE_DEVICE_MEMBER("avg", avg_device, done_r)
;	/* bit 7 is tied to a 3kHz clock */
;	PORT_BIT( 0x80, IP_ACTIVE_HIGH, IPT_CUSTOM ) PORT_READ_LINE_MEMBER(bwidow_state, clock_r)
;
;	PORT_START("DSW0")
;	PORT_DIPUNUSED_DIPLOC( 0x03, IP_ACTIVE_HIGH, "D4:!7,!8" )
;	PORT_DIPNAME(0x0c, 0x04, DEF_STR( Lives ) ) PORT_DIPLOCATION("D4:!5,!6")
;	PORT_DIPSETTING (  0x00, "3" )
;	PORT_DIPSETTING (  0x04, "4" )
;	PORT_DIPSETTING (  0x08, "5" )
;	PORT_DIPSETTING (  0x0c, "6" )
;	PORT_DIPNAME(0x10, 0x00, DEF_STR( Difficulty ) ) PORT_DIPLOCATION("D4:!4")
;	PORT_DIPSETTING (  0x00, DEF_STR( Easy ) )
;	PORT_DIPSETTING (  0x10, DEF_STR( Hard ) )
;	PORT_DIPUNUSED_DIPLOC( 0x20, IP_ACTIVE_HIGH, "D4:!3" )
;	PORT_DIPNAME(0xc0, 0x00, DEF_STR( Bonus_Life ) ) PORT_DIPLOCATION("D4:!1,!2")
;	PORT_DIPSETTING (  0x00, "10000" )
;	PORT_DIPSETTING (  0x40, "20000" )
;	PORT_DIPSETTING (  0x80, "30000" )
;	PORT_DIPSETTING (  0xc0, DEF_STR( None ) )
;
;	PORT_START("DSW1")
;	PORT_DIPNAME(0x03, 0x00, DEF_STR( Coinage ) ) PORT_DIPLOCATION("B4:!7,!8")
;	PORT_DIPSETTING (  0x01, DEF_STR( 2C_1C ) )
;	PORT_DIPSETTING (  0x00, DEF_STR( 1C_1C ) )
;	PORT_DIPSETTING (  0x03, DEF_STR( 1C_2C ) )
;	PORT_DIPSETTING (  0x02, DEF_STR( Free_Play ) )
;	PORT_DIPNAME(0x0c, 0x00, DEF_STR( Coin_B ) ) PORT_DIPLOCATION("B4:!5,!6")
;	PORT_DIPSETTING (  0x00, "*1" )
;	PORT_DIPSETTING (  0x04, "*4" )
;	PORT_DIPSETTING (  0x08, "*5" )
;	PORT_DIPSETTING (  0x0c, "*6" )
;	PORT_DIPNAME(0x10, 0x00, DEF_STR( Coin_A ) ) PORT_DIPLOCATION("B4:!4")
;	PORT_DIPSETTING (  0x00, "*1" )
;	PORT_DIPSETTING (  0x10, "*2" )
;	PORT_DIPNAME(0xe0, 0x00, "Bonus Coins" ) PORT_DIPLOCATION("B4:!1,!2,!3")
;	PORT_DIPSETTING (  0x80, "1 each 5" )
;	PORT_DIPSETTING (  0x60, "2 each 4" )
;	PORT_DIPSETTING (  0x40, "1 each 4" )
;	PORT_DIPSETTING (  0xa0, "1 each 3" )
;	PORT_DIPSETTING (  0x20, "1 each 2" )
;	PORT_DIPSETTING (  0x00, DEF_STR( None ) )
;
;	PORT_START("IN3")
;	PORT_BIT( 0x01, IP_ACTIVE_LOW, IPT_BUTTON3 )
;	PORT_BIT( 0x02, IP_ACTIVE_LOW, IPT_BUTTON1 )
;	PORT_BIT( 0x04, IP_ACTIVE_LOW, IPT_JOYSTICK_RIGHT ) PORT_2WAY
;	PORT_BIT( 0x08, IP_ACTIVE_LOW, IPT_JOYSTICK_LEFT ) PORT_2WAY
;	PORT_BIT( 0x10, IP_ACTIVE_LOW, IPT_BUTTON2 )
;	PORT_BIT( 0x20, IP_ACTIVE_LOW, IPT_UNUSED )
;	PORT_BIT( 0x40, IP_ACTIVE_LOW, IPT_UNUSED )
;	PORT_BIT( 0x80, IP_ACTIVE_LOW, IPT_UNUSED )
;
;	PORT_START("IN4")
;	PORT_BIT( 0x01, IP_ACTIVE_LOW, IPT_UNUSED )
;	PORT_BIT( 0x02, IP_ACTIVE_LOW, IPT_UNUSED )
;	PORT_BIT( 0x04, IP_ACTIVE_LOW, IPT_UNUSED )
;	PORT_BIT( 0x08, IP_ACTIVE_LOW, IPT_UNUSED )
;	PORT_BIT( 0x10, IP_ACTIVE_LOW, IPT_UNUSED )
;	PORT_BIT( 0x20, IP_ACTIVE_LOW, IPT_START1 )
;	PORT_BIT( 0x40, IP_ACTIVE_LOW, IPT_START2 )
;	PORT_BIT( 0x80, IP_ACTIVE_LOW, IPT_UNUSED )



; file LOOSEU.MAC

5000: 20 9B 50 jsr $509b
5003: C6 D6    dec $d6
5005: C6 D6    dec $d6
5007: EE 52 04 inc $0452
500A: D0 03    bne $500f
500C: EE 53 04 inc $0453
500F: A2 01    ldx #$01
5011: 20 DF 50 jsr $50df
5014: 95 42    sta $42, x
5016: A9 02    lda #$02
5018: 95 E3    sta $e3, x
501A: A9 01    lda #$01
501C: 9D 6C 01 sta $016c, x
501F: A9 04    lda #$04
5021: 95 00    sta $00, x
5023: A9 00    lda #$00
5025: 95 EB    sta $eb, x
5027: CA       dex
5028: 10 E7    bpl $5011
502A: 86 88    stx $88
502C: 86 89    stx $89
502E: 20 A9 50 jsr $50a9
5031: A2 01    ldx #$01
5033: A9 00    lda #$00
5035: 95 49    sta $49, x
5037: 95 EE    sta $ee, x
5039: 9D 4E 04 sta $044e, x
503C: 9D 7A 01 sta $017a, x
503F: 95 F6    sta $f6, x
5041: 9D 3C 01 sta $013c, x
5044: CA       dex
5045: 10 EE    bpl $5035
5047: 85 D1    sta $d1
5049: 85 D2    sta $d2
504B: 85 CF    sta $cf
504D: A2 02    ldx #$02
504F: 86 D0    stx $d0
5051: 60       rts
5052: 20 DF 50 jsr $50df
5055: 85 42    sta $42
5057: A9 02    lda #$02
5059: 85 E3    sta $e3
505B: C6 D6    dec $d6
505D: EE 50 04 inc $0450
5060: D0 03    bne $5065
5062: EE 51 04 inc $0451
5065: 20 9B 50 jsr $509b
5068: A9 01    lda #$01
506A: 85 D0    sta $d0
506C: 8D 6C 01 sta $016c
506F: A9 00    lda #$00
5071: 8D 4E 04 sta $044e
5074: 8D 4F 04 sta $044f
5077: 85 49    sta $49
5079: 85 EE    sta $ee
507B: 85 CF    sta $cf
507D: 8D 7A 01 sta $017a
5080: 85 F6    sta $f6
5082: 8D 3C 01 sta $013c
5085: 85 D1    sta $d1
5087: 85 D2    sta $d2
5089: 20 A9 50 jsr $50a9
508C: A9 FF    lda #$ff
508E: 85 88    sta $88
5090: 85 43    sta $43
5092: A9 04    lda #$04
5094: 85 00    sta $00
5096: A9 00    lda #$00
5098: 85 EB    sta $eb
509A: 60       rts
509B: A2 05    ldx #$05
509D: A9 00    lda #$00
509F: 9D 68 01 sta $0168, x
50A2: 9D 62 01 sta $0162, x
50A5: CA       dex
50A6: 10 F7    bpl $509f
50A8: 60       rts
50A9: A0 1D    ldy #$1d
50AB: A2 0E    ldx #$0e
50AD: BD D0 50 lda $50d0, x
50B0: 99 44 01 sta $0144, y
50B3: 48       pha
50B4: 0A       asl a
50B5: 0A       asl a
50B6: 0A       asl a
50B7: 0A       asl a
50B8: 99 71 04 sta $0471, y
50BB: 88       dey
50BC: 99 71 04 sta $0471, y
50BF: 68       pla
50C0: 99 44 01 sta $0144, y
50C3: 88       dey
50C4: CA       dex
50C5: 10 E6    bpl $50ad
50C7: A9 FF    lda #$ff
50C9: 8D 58 01 sta $0158
50CC: 8D 59 01 sta $0159	; NO ROOM LEFT FOR THIS GUY
50CF: 60       rts

;50D0:
;	.BYTE 2,4,6,8,9,9,9,9
;	.BYTE 9,9,9,9,9,9,9
	
50DF: A5 F0    lda $f0
50E1: 29 0C    and #$0c
50E3: 4A       lsr a
50E4: 4A       lsr a
50E5: A8       tay
50E6: B9 EA 50 lda $50ea, y
50E9: 60       rts
;50ea:
;	.BYTE 2,3,4,5
	
50EE: 20 19 54 jsr $5419                                           
50F1: 20 67 54 jsr $5467                                           
50F4: 20 72 93 jsr $9372
50F7: 20 C2 E1 jsr $e1c2
50FA: A6 CF    ldx $cf
50FC: D6 42    dec $42, x
50FE: 10 1C    bpl $511c
5100: A9 02    lda #$02
5102: 8D 6D 04 sta $046d
5105: A9 00    lda #$00
5107: 85 F4    sta $f4
5109: A9 1A    lda #$1a
510B: 9D 6F 04 sta $046f, x
510E: A9 12    lda #$12
5110: 95 00    sta $00, x
5112: A9 04    lda #$04
5114: 95 EB    sta $eb, x
5116: 8E 6C 04 stx $046c
5119: 4C 31 51 jmp $5131
511C: A9 1A    lda #$1a
511E: 95 00    sta $00, x
5120: A9 0C    lda #$0c
5122: 95 EB    sta $eb, x
5124: A9 FF    lda #$ff
5126: 95 88    sta $88, x
5128: 20 56 53 jsr $5356
512B: 20 6F 53 jsr $536f
512E: 20 D7 51 jsr $51d7
5131: A9 01    lda #$01
5133: 85 CE    sta $ce
5135: A9 00    lda #$00
5137: A2 0C    ldx #$0c
5139: 95 0B    sta $0b, x
513B: CA       dex
513C: 10 FB    bpl $5139
513E: 85 4B    sta $4b
5140: 85 4C    sta $4c
5142: 85 F4    sta $f4
5144: 85 F5    sta $f5
5146: 85 11    sta $11
5148: 85 27    sta $27
514A: 8D 6E 04 sta $046e
514D: 8E 43 01 stx $0143
5150: 86 30    stx $30
5152: A9 38    lda #$38
5154: 85 0F    sta $0f
5156: 86 10    stx $10
5158: 60       rts
5159: 20 19 54 jsr $5419
515C: 20 67 54 jsr $5467
515F: 20 72 93 jsr $9372
5162: 20 C2 E1 jsr $e1c2
5165: 20 F8 51 jsr $51f8
5168: A9 FF    lda #$ff
516A: A6 CF    ldx $cf
516C: 95 88    sta $88, x
516E: B5 4D    lda $4d, x
5170: A8       tay
5171: B9 31 C1 lda $c131, y
5174: C9 A8    cmp #$a8
5176: D0 0C    bne $5184
5178: A9 FF    lda #$ff
517A: 8D 3E 01 sta $013e
517D: A0 0C    ldy #$0c
517F: A9 1A    lda #$1a
5181: 4C 88 51 jmp $5188
5184: A9 06    lda #$06
5186: A0 00    ldy #$00
5188: 48       pha
5189: D6 42    dec $42, x
518B: 10 18    bpl $51a5
518D: A9 00    lda #$00
518F: 85 F4    sta $f4
5191: A9 02    lda #$02
5193: 8D 6D 04 sta $046d
5196: A9 12    lda #$12
5198: 95 00    sta $00, x
519A: 68       pla
519B: 9D 6F 04 sta $046f, x
519E: A9 04    lda #$04
51A0: 95 EB    sta $eb, x
51A2: 4C B0 51 jmp $51b0
51A5: 68       pla
51A6: 95 00    sta $00, x
51A8: 94 EB    sty $eb, x
51AA: 8E 6C 04 stx $046c
51AD: 20 D7 51 jsr $51d7
51B0: A9 38    lda #$38
51B2: 85 0F    sta $0f
51B4: A9 FF    lda #$ff
51B6: 85 30    sta $30
51B8: 8D 43 01 sta $0143
51BB: 85 10    sta $10
51BD: A9 01    lda #$01
51BF: 85 CE    sta $ce
51C1: A9 00    lda #$00
51C3: 85 0E    sta $0e
51C5: 85 0D    sta $0d
51C7: 85 F4    sta $f4
51C9: 85 F5    sta $f5
51CB: 85 4B    sta $4b
51CD: 85 4C    sta $4c
51CF: 85 27    sta $27
51D1: 8D 6E 04 sta $046e
51D4: 85 11    sta $11
51D6: 60       rts
51D7: A6 CF    ldx $cf
51D9: B5 42    lda $42, x
51DB: 10 0D    bpl $51ea
51DD: 25 42    and $42
51DF: 25 43    and $43
51E1: 10 07    bpl $51ea
51E3: A9 10    lda #$10
51E5: 85 00    sta $00
51E7: 85 01    sta $01
51E9: 60       rts
51EA: A5 CF    lda $cf
51EC: 49 01    eor #$01
51EE: AA       tax
51EF: B4 42    ldy $42, x
51F1: 10 02    bpl $51f5
51F3: 49 01    eor #$01
51F5: 85 CF    sta $cf
51F7: 60       rts
51F8: A6 CF    ldx $cf
51FA: B5 4D    lda $4d, x
51FC: 0A       asl a
51FD: 18       clc
51FE: 65 CF    adc $cf
5200: A8       tay
5201: B5 E9    lda $e9, x
5203: 99 71 04 sta $0471, y
5206: 60       rts
5207: 20 67 54 jsr $5467
520A: A6 CF    ldx $cf
520C: B5 4D    lda $4d, x
520E: AA       tax
520F: BD ED C0 lda $c0ed, x
5212: 7D 14 53 adc $5314, x
5215: 85 0F    sta $0f
5217: BD DC C0 lda $c0dc, x
521A: 7D 23 53 adc $5323, x
521D: 85 10    sta $10
521F: BD FE C0 lda $c0fe, x
5222: 7D F6 52 adc $52f6, x
5225: 85 0D    sta $0d
5227: BD 0F C1 lda $c10f, x
522A: 7D 05 53 adc $5305, x
522D: 85 0E    sta $0e
522F: BD 32 53 lda $5332, x
5232: 85 11    sta $11
5234: 85 27    sta $27
5236: 4A       lsr a
5237: 4A       lsr a
5238: 4A       lsr a
5239: 29 06    and #$06
523B: 85 1E    sta $1e
523D: BD 31 C1 lda $c131, x
5240: C9 A8    cmp #$a8
5242: D0 26    bne $526a
5244: A5 FA    lda $fa
5246: 30 0A    bmi $5252
5248: A9 FF    lda #$ff
524A: 8D 3E 01 sta $013e
524D: AD 43 01 lda $0143
5250: 30 15    bmi $5267
5252: 8A       txa
5253: 0A       asl a
5254: 65 CF    adc $cf
5256: AA       tax
5257: BD 44 01 lda $0144, x
525A: 85 21    sta $21
525C: A9 FF    lda #$ff
525E: 20 EF 54 jsr $54ef
5261: A9 09    lda #$09
5263: A6 CF    ldx $cf
5265: 95 49    sta $49, x
5267: 4C 8C 52 jmp $528c
526A: A6 CF    ldx $cf
526C: B5 4D    lda $4d, x
526E: 0A       asl a
526F: 18       clc
5270: 65 CF    adc $cf
5272: AA       tax
5273: BD 44 01 lda $0144, x
5276: 30 14    bmi $528c
5278: A5 FA    lda $fa
527A: 30 0D    bmi $5289
527C: A9 00    lda #$00
527E: A2 07    ldx #$07
5280: 1D E4 02 ora $02e4, x
5283: CA       dex
5284: 10 FA    bpl $5280
5286: AA       tax
5287: D0 03    bne $528c
5289: 20 7A 54 jsr $547a
528C: 20 72 93 jsr $9372
528F: A6 CF    ldx $cf
5291: B5 4D    lda $4d, x
5293: AA       tax
5294: BD 31 C1 lda $c131, x
5297: C9 A8    cmp #$a8
5299: D0 19    bne $52b4
529B: A9 7F    lda #$7f
529D: 25 F4    and $f4
529F: 85 F4    sta $f4
52A1: AD 43 01 lda $0143
52A4: 30 0E    bmi $52b4
52A6: 20 41 BF jsr $bf41
52A9: 20 41 BF jsr $bf41
52AC: 20 41 BF jsr $bf41
52AF: A9 FF    lda #$ff
52B1: 8D 43 01 sta $0143
52B4: A4 CF    ldy $cf
52B6: D0 06    bne $52be
52B8: 2C 3C 01 bit $013c
52BB: 4C C1 52 jmp $52c1
52BE: 2C 3D 01 bit $013d
52C1: 50 05    bvc $52c8
52C3: A9 00    lda #$00
52C5: 99 3C 01 sta $013c, y
52C8: 20 56 53 jsr $5356
52CB: 20 6F 53 jsr $536f
52CE: A9 01    lda #$01
52D0: 85 CE    sta $ce
52D2: A9 FF    lda #$ff
52D4: 85 30    sta $30
52D6: A9 1A    lda #$1a
52D8: A6 CF    ldx $cf
52DA: 95 00    sta $00, x
52DC: A9 0C    lda #$0c
52DE: 95 EB    sta $eb, x
52E0: B5 F6    lda $f6, x
52E2: 29 01    and #$01
52E4: D0 06    bne $52ec
52E6: 20 F3 53 jsr $53f3
52E9: 4C EF 52 jmp $52ef
52EC: 20 04 54 jsr $5404
52EF: A9 00    lda #$00
52F1: 85 4B    sta $4b
52F3: 85 4C    sta $4c
52F5: 60       rts

;52F6: .BYTE -60,-60,60,60,$A0,0,-60,0
;	.BYTE 60,-$A0,-60,-60,60,60,$A0
;5305:
;      .BYTE -1,-1,0,0,0,0,-1,0
;	.BYTE 0,-1,-1,-1,0,0,0
;
;5314:
;	.BYTE -60,60,60,-60,0,-60,0,60
;	.BYTE 0,-$0A0,-60,60,60,-60,0	
;
;5323:
;     .BYTE -1,0,0,-1,0,-1,0,0
;	.BYTE 0,-1,-1,0,0,-1,0
;5332:
;	.BYTE 28,38,8,18,10,20,30,0
;	.BYTE 10,28,28,38,8,18,10

5346: BD DC C0 lda $c0dc, x
5349: 85 39    sta $39
534B: BD FE C0 lda $c0fe, x
534E: 85 3A    sta $3a
5350: BD 0F C1 lda $c10f, x
5353: 85 3B    sta $3b
5355: 60       rts
5356: A0 07    ldy #$07
5358: A6 CF    ldx $cf
535A: B5 4D    lda $4d, x
535C: 0A       asl a
535D: 18       clc
535E: 65 CF    adc $cf
5360: AA       tax
5361: B9 E4 02 lda $02e4, y
5364: 18       clc
5365: F0 01    beq $5368
5367: 38       sec
5368: 3E F6 04 rol $04f6, x
536B: 88       dey
536C: 10 F3    bpl $5361
536E: 60       rts
536F: A0 07    ldy #$07
5371: A6 CF    ldx $cf
5373: B5 4D    lda $4d, x
5375: 0A       asl a
5376: 18       clc
5377: 65 CF    adc $cf
5379: AA       tax
537A: B9 03 03 lda $0303, y
537D: 18       clc
537E: F0 01    beq $5381
5380: 38       sec
5381: 7E BA 04 ror $04ba, x
5384: B9 FB 02 lda $02fb, y
5387: 18       clc
5388: F0 01    beq $538b
538A: 38       sec
538B: 7E D8 04 ror $04d8, x
538E: 88       dey
538F: 10 E9    bpl $537a
5391: 60       rts
5392: A9 FF    lda #$ff
5394: 8D 3A 01 sta $013a
5397: 85 30    sta $30
5399: 8D 43 01 sta $0143
539C: 85 10    sta $10
539E: 8D 3E 01 sta $013e
53A1: A9 01    lda #$01
53A3: 85 CE    sta $ce
53A5: A9 38    lda #$38
53A7: 85 0F    sta $0f
53A9: 20 67 54 jsr $5467
53AC: 20 72 93 jsr $9372
53AF: A5 F0    lda $f0
53B1: 0A       asl a
53B2: 2A       rol a
53B3: 2A       rol a
53B4: 29 03    and #$03
53B6: A8       tay
53B7: B9 D2 C3 lda $c3d2, y
53BA: A6 CF    ldx $cf
53BC: 9D 16 05 sta $0516, x
53BF: A9 00    lda #$00
53C1: 8D 6E 01 sta $016e
53C4: 8D 6F 01 sta $016f
53C7: 85 0E    sta $0e
53C9: 85 0D    sta $0d
53CB: 85 F3    sta $f3
53CD: 85 F4    sta $f4
53CF: 85 4B    sta $4b
53D1: 85 4C    sta $4c
53D3: 85 11    sta $11
53D5: 8D 6E 04 sta $046e
53D8: 85 27    sta $27
53DA: 20 C2 E1 jsr $e1c2
53DD: 20 F3 53 jsr $53f3
53E0: AD BE 59 lda $59be
53E3: 85 18    sta $18
53E5: 20 19 54 jsr $5419
53E8: A6 CF    ldx $cf
53EA: A9 1A    lda #$1a
53EC: 95 00    sta $00, x
53EE: A9 0C    lda #$0c
53F0: 95 EB    sta $eb, x
53F2: 60       rts
53F3: A9 C8    lda #$c8
53F5: 85 52    sta $52
53F7: A9 00    lda #$00
53F9: 85 51    sta $51
53FB: A9 96    lda #$96
53FD: 85 54    sta $54
53FF: A9 00    lda #$00
5401: 85 53    sta $53
5403: 60       rts
5404: AD FD C0 lda $c0fd
5407: 85 52    sta $52
5409: AD EC C0 lda $c0ec
540C: 85 51    sta $51
540E: AD 0E C1 lda $c10e
5411: 85 54    sta $54
5413: AD 1F C1 lda $c11f
5416: 85 53    sta $53
5418: 60       rts
5419: A2 01    ldx #$01
541B: A4 CF    ldy $cf
541D: B9 F6 00 lda $00f6, y
5420: 29 01    and #$01
5422: D0 06    bne $542a
5424: 20 37 54 jsr $5437
5427: 4C 2D 54 jmp $542d
542A: 20 4C 54 jsr $544c
542D: BD 65 54 lda $5465, x
5430: 9D 34 01 sta $0134, x
5433: CA       dex
5434: 10 E5    bpl $541b
5436: 60       rts
5437: A9 37    lda #$37
5439: 9D 08 01 sta $0108, x
543C: A9 00    lda #$00
543E: 9D 0C 01 sta $010c, x
5441: A9 A8    lda #$a8
5443: 9D 14 01 sta $0114, x
5446: A9 FD    lda #$fd
5448: 9D 18 01 sta $0118, x
544B: 60       rts
544C: AD 07 C1 lda $c107
544F: 9D 14 01 sta $0114, x
5452: AD 18 C1 lda $c118
5455: 9D 18 01 sta $0118, x
5458: AD F6 C0 lda $c0f6
545B: 9D 08 01 sta $0108, x
545E: AD E5 C0 lda $c0e5
5461: 9D 0C 01 sta $010c, x
5464: 60       rts

;5465: .BYTE 10,18

5467: A0 0E    ldy #$0e		;ASHOTS+PSHOTS+1
5469: A9 00    lda #$00
546B: 99 EC 02 sta $02ec, y
546E: 88       dey
546F: 10 FA    bpl $546b
5471: A2 0F    ldx #$0f
5473: 9D BF 03 sta $03bf, x
5476: CA       dex
5477: 10 FA    bpl $5473
5479: 60       rts
547A: A6 CF    ldx $cf
547C: B4 4D    ldy $4d, x
547E: B9 31 C1 lda $c131, y
5481: 84 21    sty $21
5483: C9 A8    cmp #$a8
5485: D0 01    bne $5488
5487: 60       rts
5488: 20 D0 C1 jsr $c1d0
548B: 20 C0 C8 jsr $c8c0
548E: 20 C0 C8 jsr $c8c0
5491: 20 C0 C8 jsr $c8c0
5494: 20 EB E0 jsr $e0eb
5497: A4 21    ldy $21
5499: 98       tya
549A: 0A       asl a
549B: 18       clc
549C: 65 CF    adc $cf
549E: AA       tax
549F: BD 44 01 lda $0144, x
54A2: 85 21    sta $21
54A4: A9 FF    lda #$ff
54A6: 9D 44 01 sta $0144, x
54A9: A9 1C    lda #$1c
54AB: 18       clc
54AC: 65 CF    adc $cf
54AE: AA       tax
54AF: A0 1C    ldy #$1c
54B1: BD 44 01 lda $0144, x
54B4: 30 16    bmi $54cc
54B6: C5 21    cmp $21
54B8: D0 01    bne $54bb
54BA: 18       clc
54BB: B0 05    bcs $54c2
54BD: C8       iny
54BE: B9 98 55 lda $5598, y
54C1: 88       dey
54C2: 9D 44 01 sta $0144, x
54C5: 0A       asl a
54C6: 0A       asl a
54C7: 0A       asl a
54C8: 0A       asl a
54C9: 9D 71 04 sta $0471, x
54CC: 88       dey
54CD: 88       dey
54CE: CA       dex
54CF: CA       dex
54D0: 10 DF    bpl $54b1
54D2: A6 CF    ldx $cf
54D4: B5 F6    lda $f6, x
54D6: 29 03    and #$03
54D8: A8       tay
54D9: F0 08    beq $54e3
54DB: 8A       txa
54DC: 18       clc
54DD: 69 0A    adc #$0a
54DF: 88       dey
54E0: D0 FA    bne $54dc
54E2: AA       tax
54E3: BD 44 01 lda $0144, x
54E6: 3D 46 01 and $0146, x
54E9: 3D 48 01 and $0148, x
54EC: 3D 4A 01 and $014a, x
54EF: 10 53    bpl $5544
54F1: A6 CF    ldx $cf
54F3: A9 00    lda #$00
54F5: 95 EE    sta $ee, x
54F7: 9D 3C 01 sta $013c, x
54FA: A9 1C    lda #$1c
54FC: 18       clc
54FD: 65 CF    adc $cf
54FF: AA       tax
5500: A5 21    lda $21
5502: 18       clc
5503: 69 01    adc #$01
5505: C9 09    cmp #$09
5507: 90 02    bcc $550b
5509: A9 09    lda #$09
550B: 9D 44 01 sta $0144, x
550E: 0A       asl a
550F: 0A       asl a
5510: 0A       asl a
5511: 0A       asl a
5512: 9D 71 04 sta $0471, x
5515: CA       dex
5516: CA       dex
5517: 10 E7    bpl $5500
5519: A9 38    lda #$38
551B: 85 0F    sta $0f
551D: A9 FF    lda #$ff
551F: 85 10    sta $10
5521: 8D 58 01 sta $0158
5524: 8D 59 01 sta $0159
5527: A9 00    lda #$00
5529: 85 27    sta $27
552B: 85 11    sta $11
552D: 85 1E    sta $1e
552F: 85 0D    sta $0d
5531: 85 0E    sta $0e
5533: A6 CF    ldx $cf
5535: B5 F6    lda $f6, x
5537: 48       pha
5538: 29 03    and #$03
553A: C9 02    cmp #$02
553C: 68       pla
553D: 69 01    adc #$01
553F: 95 F6    sta $f6, x
5541: 20 19 54 jsr $5419
5544: A6 CF    ldx $cf
5546: B4 4D    ldy $4d, x
5548: 98       tya
5549: 0A       asl a
554A: 65 CF    adc $cf
554C: 9D 3A 01 sta $013a, x
554F: 85 21    sta $21
5551: B5 EE    lda $ee, x
5553: A4 21    ldy $21
5555: 39 C2 5A and $5ac2, y
5558: 95 EE    sta $ee, x
555A: 60       rts
555B: A9 FF    lda #$ff
555D: 85 88    sta $88
555F: 85 89    sta $89
5561: 85 4D    sta $4d
5563: A5 F1    lda $f1
5565: 85 DF    sta $df
5567: A9 00    lda #$00
5569: 85 F3    sta $f3
556B: A5 4F    lda $4f
556D: 29 03    and #$03
556F: D0 02    bne $5573
5571: C6 3F    dec $3f
5573: A5 3F    lda $3f
5575: C9 C0    cmp #$c0
5577: 90 07    bcc $5580
5579: A9 40    lda #$40
557B: A0 01    ldy #$01
557D: 4C 84 55 jmp $5584
5580: A9 00    lda #$00
5582: A0 02    ldy #$02
5584: 85 30    sta $30
5586: 84 CE    sty $ce
5588: A5 3F    lda $3f
558A: D0 04    bne $5590
558C: A9 20    lda #$20
558E: 85 00    sta $00
5590: 20 67 54 jsr $5467
5593: A9 08    lda #$08
5595: 85 EB    sta $eb
5597: 60       rts
;5598: .BYTE 2,9,4,9,6,9,8,9,9,9
;	.BYTE 9,9,9,9,9,9,9,9,9,9
;	.BYTE 9,9,9,9,9,9,9,9,9,9
	
55B6: A9 FF    lda #$ff
55B8: 18       clc
55B9: 69 08    adc #$08
55BB: CA       dex
55BC: 10 FA    bpl $55b8
55BE: A8       tay
55BF: A2 07    ldx #$07
55C1: B9 DE 55 lda $55de, y
55C4: 9D 17 02 sta $0217, x    ;TAKE INITIAL BASE COORDS
55C7: B9 56 56 lda $5656, y    ;FROM ROM AND STORE INTO RAM
55CA: 9D 00 02 sta $0200, x
55CD: B9 CE 56 lda $56ce, y
55D0: 9D 5C 02 sta $025c, x
55D3: B9 46 57 lda $5746, y
55D6: 9D 45 02 sta $0245, x
55D9: 88       dey
55DA: CA       dex
55DB: 10 E4    bpl $55c1
55DD: 60       rts

;55F0: 20 60 20 jsr $2060    ; THIS IS BAD - NO  ITS KINKY BAD
;55F3: 60       rts
;INPUTS:NONE
;
;
;OUTPUTS:LANDER POSITIONING INITIALIZED
;	 LANDER VELOCITIES INITIALIZED
;	 GRAVITY INITIALIZED
;	 A, X, BLITZED

57BE: A9 00    lda #$00                                            
57C0: A2 0D    ldx #$0d
57C2: 95 0B    sta $0b, x
57C4: CA       dex
57C5: 10 FB    bpl $57c2
57C7: A2 A7    ldx #$a7
57C9: 9D 00 02 sta $0200, x
57CC: CA       dex
57CD: D0 FA    bne $57c9
57CF: 20 67 54 jsr $5467
57D2: A9 04    lda #$04
57D4: 85 1E    sta $1e
57D6: 20 C2 E1 jsr $e1c2
57D9: A9 20    lda #$20
57DB: 85 11    sta $11
57DD: 85 27    sta $27
57DF: 8D 36 01 sta $0136
57E2: 8D 37 01 sta $0137
57E5: A6 CF    ldx $cf
57E7: B5 4D    lda $4d, x
57E9: AA       tax
57EA: BD AF 59 lda $59af, x
57ED: 85 10    sta $10
57EF: A5 D0    lda $d0
57F1: F0 10    beq $5803
57F3: BD 31 C1 lda $c131, x
57F6: C9 A8    cmp #$a8
57F8: F0 06    beq $5800
57FA: 20 19 5B jsr $5b19
57FD: 4C 03 58 jmp $5803
5800: 20 F3 E0 jsr $e0f3
5803: 20 31 5B jsr $5b31
5806: A6 CF    ldx $cf
5808: B4 49    ldy $49, x
580A: A5 F0    lda $f0
580C: 29 10    and #$10
580E: D0 06    bne $5816
5810: B9 BE 59 lda $59be, y
5813: 4C 19 58 jmp $5819
5816: B9 C8 59 lda $59c8, y
5819: 85 18    sta $18		;INITIALIZE GRAVITY
581B: B9 A5 59 lda $59a5, y
581E: 95 E5    sta $e5, x
5820: A9 10    lda #$10
5822: 8D 38 01 sta $0138
5825: A9 F0    lda #$f0
5827: 8D 39 01 sta $0139
582A: 95 88    sta $88, x
582C: B9 9B 59 lda $599b, y
582F: 95 E7    sta $e7, x
5831: A9 00    lda #$00
5833: 85 51    sta $51
5835: 85 52    sta $52
5837: 85 53    sta $53
5839: 85 54    sta $54
583B: 85 7A    sta $7a
583D: 85 4C    sta $4c
583F: 85 4B    sta $4b
5841: 8D 0F 60 sta $600f
5844: 85 37    sta $37
5846: 85 48    sta $48
5848: 85 2B    sta $2b
584A: A9 FF    lda #$ff
584C: 85 0E    sta $0e
584E: 85 15    sta $15
5850: 85 16    sta $16
5852: 85 36    sta $36
5854: 85 30    sta $30
5856: 8D 3E 01 sta $013e
5859: 85 2D    sta $2d
585B: B5 4D    lda $4d, x
585D: AA       tax
585E: BD 31 C1 lda $c131, x
5861: 10 09    bpl $586c
5863: A9 00    lda #$00
5865: 85 2D    sta $2d
5867: A9 07    lda #$07
5869: 4C 6E 58 jmp $586e
586C: A9 08    lda #$08
586E: 85 2A    sta $2a
5870: E0 0C    cpx #$0c
5872: D0 04    bne $5878
5874: A9 FF    lda #$ff
5876: 85 51    sta $51
5878: A9 03    lda #$03
587A: 8D 0F 60 sta $600f
587D: A9 04    lda #$04
587F: 85 28    sta $28
5881: 85 29    sta $29
5883: A9 40    lda #$40
5885: 85 2F    sta $2f
5887: 85 0D    sta $0d
5889: 20 B6 55 jsr $55b6
588C: A6 CF    ldx $cf
588E: B5 4D    lda $4d, x
5890: 0A       asl a
5891: 18       clc
5892: 65 CF    adc $cf
5894: A8       tay
5895: B9 44 01 lda $0144, y
5898: 30 58    bmi $58f2
589A: B5 EE    lda $ee, x
589C: 39 C2 5A and $5ac2, y
589F: D0 4C    bne $58ed
58A1: B9 C2 5A lda $5ac2, y
58A4: 15 EE    ora $ee, x
58A6: 95 EE    sta $ee, x
58A8: B9 44 01 lda $0144, y
58AB: 0A       asl a
58AC: 0A       asl a
58AD: 0A       asl a
58AE: 0A       asl a
58AF: 95 E9    sta $e9, x
58B1: B5 49    lda $49, x
58B3: C9 07    cmp #$07
58B5: 90 02    bcc $58b9
58B7: A9 07    lda #$07
58B9: A4 CF    ldy $cf
58BB: B6 4D    ldx $4d, y
58BD: F0 06    beq $58c5
58BF: 18       clc
58C0: 69 08    adc #$08
58C2: CA       dex
58C3: D0 FA    bne $58bf
58C5: A8       tay
58C6: A6 CF    ldx $cf
58C8: B5 4D    lda $4d, x
58CA: 0A       asl a
58CB: 18       clc
58CC: 65 CF    adc $cf
58CE: AA       tax
58CF: B9 D2 59 lda $59d2, y
58D2: 9D BA 04 sta $04ba, x
58D5: B9 4A 5A lda $5a4a, y
58D8: 9D D8 04 sta $04d8, x
58DB: C0 20    cpy #$20
58DD: 90 05    bcc $58e4
58DF: A9 FF    lda #$ff
58E1: 4C E7 58 jmp $58e7
58E4: B9 F9 5A lda $5af9, y
58E7: 9D F6 04 sta $04f6, x
58EA: 4C F2 58 jmp $58f2
58ED: B9 71 04 lda $0471, y
58F0: 95 E9    sta $e9, x
58F2: A6 CF    ldx $cf
58F4: B4 49    ldy $49, x
58F6: A5 F0    lda $f0
58F8: 29 10    and #$10
58FA: D0 06    bne $5902
58FC: B9 87 59 lda $5987, y
58FF: 4C 05 59 jmp $5905
5902: B9 91 59 lda $5991, y
5905: 18       clc
5906: 75 F6    adc $f6, x
5908: C9 08    cmp #$08
590A: 90 02    bcc $590e
590C: A9 08    lda #$08
590E: 85 ED    sta $ed
5910: B5 4D    lda $4d, x
5912: AA       tax
5913: BD 31 C1 lda $c131, x
5916: 29 20    and #$20
5918: D0 1B    bne $5935
591A: A6 CF    ldx $cf
591C: B5 4D    lda $4d, x
591E: 0A       asl a
591F: 18       clc
5920: 65 CF    adc $cf
5922: AA       tax
5923: BD BA 04 lda $04ba, x
5926: 85 23    sta $23
5928: BD D8 04 lda $04d8, x
592B: 85 24    sta $24
592D: BD F6 04 lda $04f6, x
5930: 85 21    sta $21
5932: 4C 56 59 jmp $5956
5935: A6 CF    ldx $cf
5937: B4 F6    ldy $f6, x
5939: C0 06    cpy #$06
593B: 90 02    bcc $593f
593D: A0 06    ldy #$06
593F: B9 80 59 lda $5980, y
5942: 8D 3E 01 sta $013e
5945: A9 00    lda #$00
5947: 85 23    sta $23
5949: 85 24    sta $24
594B: A0 FF    ldy #$ff
594D: B5 F6    lda $f6, x
594F: C9 02    cmp #$02
5951: B0 01    bcs $5954
5953: C8       iny
5954: 84 21    sty $21
5956: 20 E0 5A jsr $5ae0
5959: A2 0F    ldx #$0f
595B: 46 24    lsr $24
595D: 66 23    ror $23
595F: 90 08    bcc $5969
5961: A9 08    lda #$08
5963: 9D FB 02 sta $02fb, x
5966: 4C 6E 59 jmp $596e
5969: A9 00    lda #$00
596B: 9D FB 02 sta $02fb, x
596E: CA       dex
596F: 10 EA    bpl $595b
5971: A9 02    lda #$02
5973: 85 CE    sta $ce
5975: A6 CF    ldx $cf
5977: A9 14    lda #$14
5979: 95 00    sta $00, x
597B: A9 06    lda #$06
597D: 95 EB    sta $eb, x
597F: 60       rts

5AE0: A9 7F    lda #$7f
5AE2: A2 07    ldx #$07
5AE4: 06 21    asl $21
5AE6: 90 08    bcc $5af0
5AE8: A9 7F    lda #$7f
5AEA: 9D E4 02 sta $02e4, x
5AED: 4C F5 5A jmp $5af5
5AF0: A9 00    lda #$00
5AF2: 9D E4 02 sta $02e4, x
5AF5: CA       dex
5AF6: 10 EC    bpl $5ae4
5AF8: 60       rts

5B19: A6 CF    ldx $cf
5B1B: B5 4D    lda $4d, x
5B1D: 0A       asl a
5B1E: 18       clc
5B1F: 65 CF    adc $cf
5B21: AA       tax
5B22: A4 CF    ldy $cf
5B24: BD 44 01 lda $0144, x
5B27: C9 09    cmp #$09
5B29: 90 02    bcc $5b2d
5B2B: A9 09    lda #$09
5B2D: 99 49 00 sta $0049, y
5B30: 60       rts
5B31: A6 CF    ldx $cf
5B33: B5 4D    lda $4d, x
5B35: 0A       asl a
5B36: 18       clc
5B37: 69 96    adc #$96    ; SIXPTR-XDPNTR
5B39: 85 22    sta $22
5B3B: A9 0A    lda #$0a		; SGTBIX-XDELTA
5B3D: 85 23    sta $23
5B3F: A4 22    ldy $22
5B41: B9 72 5B lda $5b72, y
5B44: A6 23    ldx $23
5B46: 95 56    sta $56, x
5B48: B9 73 5B lda $5b73, y
5B4B: 95 57    sta $57, x
5B4D: B9 26 5C lda $5c26, y
5B50: 95 62    sta $62, x
5B52: B9 27 5C lda $5c27, y
5B55: 95 63    sta $63, x
5B57: B9 DA 5C lda $5cda, y
5B5A: 95 6E    sta $6e, x
5B5C: B9 DB 5C lda $5cdb, y
5B5F: 95 6F    sta $6f, x
5B61: A5 22    lda $22
5B63: 38       sec
5B64: E9 1E    sbc #$1e   ; YDPNTR-XDPNTR
5B66: 85 22    sta $22
5B68: A5 23    lda $23
5B6A: 38       sec
5B6B: E9 02    sbc #$02
5B6D: 85 23    sta $23
5B6F: B0 CE    bcs $5b3f
5B71: 60       rts


	; ADAPTATION,DISTRIBUTION,PERFORMANCE OR DISPLAY OF
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
904A: BD 54 90 lda $9054, x		; [jump_table]
904D: 48       pha
904E: BD 53 90 lda $9053, x
9051: 48       pha
9052: 60       rts
9053:
	.word	$5052-1    ; $9053
	.word	$5000-1    ; $9055
	.word	$5392-1    ; $9057
	.word	$57be-1    ; $9059
	.word	$93d4-1    ; $905b
	.word	$50ee-1    ; $905d
	.word	$5159-1    ; $905f
	.word	$5207-1    ; $9061
	.word	$92a3-1    ; $9063
	.word	$92b5-1    ; $9065
	.word	$937c-1    ; $9067
	.word	$555b-1    ; $9069
	.word	$91f3-1    ; $906b
	.word	$930c-1    ; $906d
	.word	$924b-1    ; $906f
	.word	$cb14-1    ; $9071
	.word	$9435-1    ; $9073
	.word	$94a9-1    ; $9075
	.word	$9502-1    ; $9077
9079:
	.word	$5052-1    ; $9079
	.word	$5000-1    ; $907b
	.word	$5392-1    ; $907d
	.word	$57be-1    ; $907f
	.word	$9122-1    ; $9081
	.word	$50ee-1    ; $9083
	.word	$5159-1    ; $9085
	.word	$5207-1    ; $9087
	.word	$92a3-1    ; $9089
	.word	$92b5-1    ; $908b
	.word	$937c-1    ; $908d
	.word	$555b-1    ; $908f
	.word	$9176-1    ; $9091
	.word	$930c-1    ; $9093
	.word	$91b6-1    ; $9095

  
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
91FD: 20 D1 98 jsr $98d1 ; UP SHIP POS.
9200: 20 98 95 jsr $9598	; UP VELOCITY
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
93A9: A9 FD    lda #$fd    ; MDANGR!MATARI?0FF
93AB: 25 F5    and $f5
93AD: 85 F5    sta $f5
93AF: A6 CF    ldx $cf
93B1: A9 06    lda #$06
93B3: 95 EB    sta $eb, x
93B5: 60       rts
;93B6: 
;   .BYTE 81,81,81,64,60,81,81,81
;   .BYTE 50,60,81,81,70,81,60

;PBSCAL:	.BYTE 2,2,2,3,3,2,2,2
;	.BYTE 3,3,2,2,3,2,3


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
94C7: A9 14    lda #$14  ; MDANGR!MATARI
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

;COMAND: .BYTE 8,1,4,0,2,8,1,0
;FRACNT: .BYTE 4,2,20,20,36,0E,1,0FF

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
95CB: 20 6E DE jsr $DE6E
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
961B: 20 6E DE jsr $DE6E
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

9665: A9 00    lda #$00
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

;INPUTS:LAVEV,LAVEH=SHIP VELOCITIES
;
;
;OUTPUTS:

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

;INPUTS:SWITCHS:STATE OF SWITCHES
;	LANGLE:CURRENT LANDER ANGLE
;	QUADRANT:CURRENT LANDER QUADRANT
;OUTPUTS:LANGLE,QUADRANT UPDATED
;	   A DESTROYED

9711: A6 CF    ldx $cf
9713: BD 68 01 lda $0168, x
9716: 1D 6A 01 ora $016a, x
9719: 1D 6C 01 ora $016c, x
971C: F0 25    beq $9743
971E: A5 1D    lda $1d
9720: 29 04    and #$04
9722: F0 08    beq $972c
9724: E6 27    inc $27
9726: A5 27    lda $27          ;YES CHANGE ANGLE
9728: 29 3F    and #$3f
972A: 85 11    sta $11
972C: A5 1D    lda $1d
972E: 29 08    and #$08
9730: F0 08    beq $973a
9732: C6 27    dec $27
9734: A5 27    lda $27
9736: 29 3F    and #$3f
9738: 85 11    sta $11
973A: A5 11    lda $11   ;SET QUADRANT
973C: 4A       lsr a
973D: 4A       lsr a     ;D1 & D2 DEFINE QUADRANT
973E: 4A       lsr a
973F: 29 06    and #$06
9741: 85 1E    sta $1e
9743: 60       rts
9764: A6 CF    ldx $cf
9766: B5 4D    lda $4d, x
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

;INPUTS:DRGCNT:TIMER FOR ADDING INDRAG
;	LAVEXX:LANDER VELOCITIES
;	STICKY:DRAG CONSTANT
;
;
;OUTPUTS:DRGCNT UPDATED
;	LAVEXX UPDATED
;	A,X UPDATED

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
;INPUTS:LACPV,LACPH,SHIP CORRDINATES
;	LAVEV,LAVEH SHIP VELOCITY
;
;
;OUTPUTS:POSITION ARRAY UPDATED
;	 ACC DESTROYED

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
99CB: 20 A5 9A jsr $9aa5    ;GET HERE IF TRAVELLING LEFT
99CE: 68       pla          ;AND AT LEFT LIMIT
99CF: 68       pla          ;SO GO SCROLL TERRAIN INSTEAD
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
;99fa:	
;.BYTE 0,0,0,0FA,0F8,0,0,0,
;	.BYTE 0,0F8,0,0,-6,0,-8
;9a0a:	
;  .BYTE 0,0,0,6,3,0,0,0
;	.BYTE 4,3,0,0,6,0,8
;9a19:
;  .BYTE 0,0,0,6,8,0,0,0
;	.BYTE 8,8,0,0,8,0,8
;9a28:
;   .BYTE 0,0,0,0FA,0F8,0,0,0
;	.BYTE 0,-8,0,0,-8,0,-8
	
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

;INPUTS:	OVRSCN = AMOUNT OF SCAN PAST LEFT
;		HDIR = AMOUNT TO BUMP OVERSCAN
;		SECTOR = RESIDENT SECTOR OF LANDER
;		LFTSCT = LEFTMOST SECTOR #
;OUTPUTS:	OVRSCN,SECTOR,LFTSCT,A UPDATED

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
9AC8: A2 16    ldx #$16      ; ASHOTS+PSHOTS+NBASES+1
9ACA: BD 73 02 lda $0273, x   	;ADD IN H VELOCITY TO POSITIONS
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
;9c5b:
;	.BYTE 1,2,3,4,5,6,7,8
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
;9C93: 
;  .BYTE 3,3,3,0,0,4,3,3
;	.BYTE 3,3,3,3,3,3,3

;9ca2:
; .BYTE -1,-1,-1,-1,0,3,1,-1
;	.BYTE 0,0,1,0,0,0,0

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
; FUNCTION:	UPDATE LINEAR SCALE TO ZOOM IN OR
;		OUT PICTURE
; INPUTS:	LACPVH: LANDER V POSITION HI BYTE
;		LSCALE: CURRENT LINEAR SCALE FACTOR
;		ZUMIN:	V COORD TO START ZOOMING IN
;		ZUMOUT:	V COORD TO START ZOOMING OUT
; OUTPUTS:	LSCALE:	UPDATED
;		ZOOMST:	UPDATED (IF NECESSARY)
;		LANDER COORDS: UPDATED (IF NECESSARY)

9E05: 24 37    bit $37
9E07: 10 26    bpl $9e2f
9E09: A5 30    lda $30   ;IF CURRENTLY ZOOMING IN
9E0B: F0 20    beq $9e2d
9E0D: 38       sec     ;IF NOT ZOOMED ALL THE WAY IN
9E0E: E9 04    sbc #$04
9E10: 85 30    sta $30
9E12: 20 5C 9E jsr $9e5c
9E15: A5 0E    lda $0e
9E17: 10 0A    bpl $9e23
9E19: C9 FF    cmp #$ff
9E1B: B0 03    bcs $9e20
9E1D: 20 AD 9E jsr $9ead   ;IF HPOS PAST READJUST LIMITS
9E20: 4C 2A 9E jmp $9e2a   ;GO READJUST
9E23: C9 01    cmp #$01
9E25: 90 03    bcc $9e2a
9E27: 20 8E 9E jsr $9e8e
9E2A: 4C 2F 9E jmp $9e2f
9E2D: 85 37    sta $37     ;SET ZOOM STATUS INACTIVE
9E2F: 24 37    bit $37
9E31: 50 28    bvc $9e5b
9E33: A5 30    lda $30    ;IF ZOOMING OUT
9E35: 30 20    bmi $9e57
9E37: 18       clc      ; IF NOT AT ZOOM OUT LIMIT
9E38: 69 04    adc #$04
9E3A: 85 30    sta $30
9E3C: 20 75 9E jsr $9e75  ;ADJUST VCOORD
9E3F: A5 0E    lda $0e
9E41: 10 0A    bpl $9e4d
9E43: C9 FF    cmp #$ff
9E45: B0 03    bcs $9e4a
9E47: 20 8E 9E jsr $9e8e  ;IF PAST NEGATIVE ADJUST LIMIT
9E4A: 4C 54 9E jmp $9e54
9E4D: C9 01    cmp #$01
9E4F: 90 03    bcc $9e54
9E51: 20 AD 9E jsr $9ead    ;IF PAST POSITIVE ADJUST LIMIT
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
9ECC: A2 16    ldx #$16   ; ASHOTS+PSHOTS+NBASES+1
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
A00A: 20 6E DE jsr $DE6E
A00D: A5 1C    lda resh_1c
A00F: 85 38    sta $38
A011: A4 22    ldy $22
A013: C8       iny
A014: B1 5A    lda ($5a), y
A016: 88       dey
A017: 29 7F    and #$7f
A019: 85 19    sta $19
A01B: 20 6E DE jsr $DE6E
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
A063: 10 10    bpl $a075                                           
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
; INPUTS:	LACPV,LACPH=LANDER POSITION
;
;		SECTOR=RESIDENT SECTOR OF LANDER
;
;		SECADR=TABLE OF ADDRESSES OF
;			ROUTINES THAT DRAW A SECTOR
;
; OUTPUTS:
;
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
A151: 20 6E DE jsr $DE6E
A154: A4 22    ldy $22
A156: A5 1C    lda resh_1c
A158: 85 38    sta $38
A15A: C8       iny
A15B: B1 5A    lda ($5a), y
A15D: 29 7F    and #$7f
A15F: 85 19    sta $19
A161: 20 6E DE jsr $DE6E
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

; $a4cf: .BYTE 1,0,2

;COLTST
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
;TSTBAS
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

;BASIZV: .BYTE 24,24,24,24,24,24,24,24
;
;BASIZH: .BYTE 2E,2E,2E,2E,2E,2E,2E,2E
;
;BASIZD: .BYTE 40,40,40,40,40,40,40,40
;VSIZE:	.BYTE 13,10,23,30
;HSIZE:	.BYTE 11,14,24,50
;DSIZE:	.BYTE 18,1C,32,70

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
;PSVSEB
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
;INPUTS: TRACTV: TASK ACTIVE FLAG
;	 ONTIME: TIMER FOR DEPOSIT ON
;	 OFTIME:    "   "    "     OFF
;	 SECTOR: RESIDENT SECTOR OF LANDER
;	 FSTAT:  DEPOSIT STATUS BYTE
;
;OUTPUTS:
;
;
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
BEFC: C9 04    cmp #$04   ; useless cmp, call to $c2c5 returns carry
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
BF1F: C9 1C    cmp #$1c   ; useless cmp, call to $c2c5 returns carry
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
;PVEXIT:	.BYTE 5,5,5,5,3,5,5,5
;	.BYTE 4,3,5,5,4,5,3
;NVEXIT:	.BYTE -5,-5,-5,-6,-5,-6,-6,-6
;	.BYTE -6,-6,-5,-5,-6,-5,-6
;HEXIT:	.BYTE 6,6,6,6,8,8,8,8
;	.BYTE 8,8,8,8,8,8,8

;AWDBON
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

;SKPBON:	.BYTE 0,1,5,0B,13
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


;PLCPVH: .BYTE 1,0FE,0FD,1,0,1,0FF,0FD
;	.BYTE -1,1,1,-2,-3,1,0,0,0
;PLCPVL:	.BYTE 0F4,70,0BC,0C2,37,0C2,9C,0C0
;	.BYTE 40,0C0,0F4,070,0BC,0C2,37,0C8,0C8
;PLCPHL:	.BYTE 40,66,0A8,60,0A8,0CE,58,14
;	.BYTE 0D0,60,40,66,0A8,60,0A8,96,20
;PLCPHH: .BYTE  2,2,0FD,0FE,0FD,0FF,2,0
;	.BYTE 0FD,2,2,2,0FD,0FE,0FD,0,0FF
;PLSIZE:	.BYTE 50,50,50,50,50,50,50,50
;	.BYTE 50,50,50,50,50,50,50,20,20
;PLANID:	.BYTE 0,0,0,98,0A8,8,0,0
;	.BYTE 88,0A8,0,0,98,0,0A8,40,40
;SSINDX:	.BYTE 4,9,0E

C145: A6 CF    ldx $cf
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
;RNGECK
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
;DEABAS
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
;BOLEVL: .BYTE 1,2,3

C3D5: A6 CF    ldx  $cf
C3D7: B5 00    lda $00, x                                          
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

C43D: A6 35    ldx $35                                             
C43F: A5 1D    lda $1d                                             
C441: 29 02    and #$02                                            
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

;NIFIRX:	.BYTE 6,7,5,7,0,4,1,3
C58E: A6 CF    ldx $cf                                             
C590: BD 3C 01 lda $013c, x                                        
C593: D0 08    bne $c59d                                           
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

;ASHPRO: .BYTE 8,10,20,40,50,60,70,80


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

;ANGTBL: .BYTE 20,28,38,30,10,18,0,8
;SHPRNG:	.BYTE 28,28,1C,0,0,8,18,28,0

; INPUTS: X= INDEX OF SHOT SLOT
; 	Y=     "   "  BASE
; OUTPUTS: POSITION AND VELOCTIY ARRAYS SET UP


C68F: A9 00    lda #$00
C691: 9D 3A 02 sta $023a, x
C694: 9D 7F 02 sta $027f, x   	; ZERO FRACTIONAL PORTIONS
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
C6CD: B9 2F C8 lda $c82f, y     	;SETUP SHOOT VELOCITIES
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
; INPUTS:	SHVEVI,SHVEHI=SHOT V VELOCITIES
;		SHVEHI,SHVEHF=SHOT V VELOCITIES
;
;		SHCPH=CURRENT SHOT POSITION
;
; OUTPUTS:	SHOT POSITION ARRAY UPDATED
;		SHOT ACTIVE TIMER UPDATED
;		DEACTIVATE SHOT IF TIME OUT

C707: A2 0E    ldx #$0e
C709: BD EC 02 lda $02ec, x
C70C: F0 6E    beq $c77c
C70E: BD 36 02 lda $0236, x  		;ADD IN FRACTIONAL DELTA
C711: 18       clc
C712: 7D A8 02 adc $02a8, x
C715: 9D 36 02 sta $0236, x
C718: BD 1F 02 lda $021f, x		;ADD IN LSB INTEGER
C71B: 7D 8A 02 adc $028a, x
C71E: 9D 1F 02 sta $021f, x
C721: BD 08 02 lda $0208, x
C724: 7D 99 02 adc $0299, x		;ADD IN MSB INTEGER
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
;		;VERTICAL SHOT VELOCITIES
;SHVELV:	.BYTE 10,0F,0F,0E,0E,0D,0C,0B
;	.BYTE 0A,8,7,6,4,3,1,0
;	.BYTE 0,0FE,0FD,0FB,0F9,0F8,0F7,0F5
;	.BYTE 0F4,0F3,0F2,0F1,0F1,0F0,0F0,0F0
;	.BYTE 0F0,0F0,0F0,0F1,0F1,0F2,0F3,0F4
;	.BYTE 0F5,0F7,0F8,0F9,0FB,0FD,0FE,0FF
;SHVHL:	.BYTE 0,1,3,4,6,7,8,0A
;	.BYTE 0B,0C,0D,0E,0E,0F,0F,0F
;	.BYTE 10,0F,0F,0E,0E,0D,0C,0B
;	.BYTE 0A,8,7,6,4,3,1,0
;	.BYTE 0,0FE,0FD,0FB,0F9,0F8,0F7,0F5
;	.BYTE 0F4,0F3,0F2,0F1,0F1,0F0,0F0,0F0
;	.BYTE 0F0,0F0,0F0,0F1,0F1,0F2,0F3,0F4
;	.BYTE 0F5,0F7,0F8,0F9,0FB,0FD,0FE,0FF
;		;HORIZONTAL SHOT VELOCITIES
;SHVEFV:	.BYTE 0,0B0,50,0D0,20,50,60,50
;	.BYTE 20,0E0,90,20,0A0,20,90,10
;	.BYTE 0,70,0E0,60,0E0,70,20,0E0
;	.BYTE 0B0,0A0,0B0,0E0,30,0B0,50,10
;	.BYTE 0,50,0B0,30,0E0,0B0,0A0,0B0
;	.BYTE 0E0,20,70,0E0,60,0E0,70,0FF
;SHVHF:	.BYTE 0,90,20,0A0,20,90,0E0,20
;	.BYTE 50,60,50,20,0D0,50,0B0,0F0
;	.BYTE 0,0B0,50,0D0,20,50,60,50
;	.BYTE 20,0E0,90,20,0A0,20,90,10
;	.BYTE 0,70,0E0,60,0E0,70,20,0E0
;	.BYTE 0B0,0A0,0B0,0E0,30,0B0,50,10
;	.BYTE 0,50,0B0,30,0E0,0B0,0A0,0B0
;	.BYTE 0E0,20,70,0E0,60,0E0,70,0FF


C86F: A2 07    ldx #$07		; NEXPLO*DOTS/2
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

;EXPIX:  .BYTE 0,5,0A
;SHTLF
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
;DHISCM: .BYTE 13,38,53,72,75,80,92,99
;DHISCL: .BYTE 50,0,50,50,0,0,50,0
;DHIINH: .BYTE 2,0F,0A,0D,12,0D,13,1
;DHIINM: .BYTE 12,12,0F,0C,4,5,4,3
;DHIINL: .BYTE 4,12,5,8,1,3,0D,5

CBEA: 48       pha
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
CC5F: A5 03    lda $03     ; TIME TO SWAP BUFFERS?
CC61: D0 14    bne $cc77
CC63: 85 02    sta $02    ;RESET SYNC
CC65: AD 01 20 lda $2001
CC68: 49 02    eor #$02
CC6A: 8D 01 20 sta $2001  ;POINT TO NEW BUFFER
CC6D: A0 24    ldy #$24   ; <VECRAM+BUFR2>/100
CC6F: 29 02    and #$02
CC71: F0 02    beq $cc75
CC73: A0 20    ldy #$20
CC75: 84 03    sty $03   ;POINT TO OPEN BUFFER
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


;INPUTS:GAMESW:ADDRESS OF ROTATE,
;	FIRE,TRACTOR,THRUST SWITCHES
;
;	POTGO:CONTROL PORT FOR READING
;	      SWITCHES
;
;
;OUTPUTS:SWITCH:STATE OF SWITCHES
;	 SAVED IN SWITCHS

;READSW
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
CD0E: 8D 00 88 sta $8800    ; OUT0
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
CD88: BD 92 CD lda $cd92, x		; [jump_table]
CD8B: 48       pha
CD8C: BD 91 CD lda $cd91, x
CD8F: 48       pha
CD90: 60       rts
CD91:
	.word	$cda5-1    ; $cd91
	.word	$cdd4-1    ; $cd93
	.word	$cda5-1    ; $cd95
	.word	$cde9-1    ; $cd97
	.word	$ce31-1    ; $cd99
	.word	$cdf5-1    ; $cd9b
	.word	$ce10-1    ; $cd9d
	.word	$ce28-1    ; $cd9f
	.word	$cdf5-1    ; $cda1
	.word	$cdd4-1    ; $cda3

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
CE5B: A9 9F    lda #$9f   ; MCONGR!MENTER!MPROTA!MTOCHG!MTRSEL!MPLAYR
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

;DSTRFD
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
D320: A9 00    lda #$00    ;DRAW BLANK VECTOR TO STARTING POINT OF
D322: 85 0A    sta $0a     ;CURRENT SECTOR TO DRAW
D324: A2 03    ldx #$03 
D326: B5 31    lda $31, x   ;PUT COORDS INTO XCOMP - FOR VGVCTR
D328: 95 04    sta $04, x
D32A: CA       dex
D32B: 10 F9    bpl $d326
D32D: A2 04    ldx #$04
D32F: 20 A9 E4 jsr $e4a9   ;DRAW VECTOR
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

; INPUTS:	TEMP1: SECTOR POINTER
;		*2
;		BASTAT: CURRENT STATUS OF BASES
;		XACCL,XACCH=POINTER TO LEFT MOST POINT OF
;		SECTOR HORIZONTAL
;		YACCL,YACCH=SAME POINTER FOR VERTICAL
;
; OUTPUTS:	BASES DRAWN
;DBASE
D65A: 20 66 E4 jsr $e466		;CENTER BEAM
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
D6FC: 85 0A    sta $0a    		;DRAW BLANK VECTOR THERE
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
D71E: 20 53 E4 jsr $e453   ;PUT JSRL INTO OPEN BUFFER
D721: 60       rts
;SIFHOS:	.BYTE 32.,128.,128.,160.
;	.BYTE 32.,96.,0,0
;	.BYTE 96.,0,0,0
;	.BYTE 96.,96.,0,192.
;SIFVOS:	.BYTE 0,0,24,0EC
;	.BYTE 1A,0,0,0
;	.BYTE 0,0,0,0
;	.BYTE 0,24,0,0F0
;
;DUFVOS: .BYTE 0,0,0,0
;	.BYTE 0A,0EE,4,0
;	.BYTE 0,0,0F8,8



;CTFVOS: .BYTE 0,0,2,0
;	.BYTE 0,8,8,0
;	.BYTE 0,0,0,0
;	.BYTE 0,4,4,0
;
;CTFHOS: .BYTE 0,20,60,0
;	.BYTE 0,20,40,0
;	.BYTE 20,0A0,20,0
;	.BYTE 0,40,80,0
;
;
;NIFVOS: .BYTE 0,0,0,0
;	 .BYTE 0,22,0F0,0
;	.BYTE 30,30,4,0
;	.BYTE 0,0,0,0
;
;NIFHOS: .BYTE 0,0,0,0
;	 .BYTE 40,0C0,40,60
;	.BYTE 20,0C0,60,40
;	.BYTE 0,0,0,0
;
;EAFHOS:	.BYTE 0A0,0,80,0,80,60,0,0
;	.BYTE 80,0,80,0,0,80,0,60
;	DFFVOS=VDDUCA
;	NOFID=VDDUCA
;	EAFVOS=VDDUCA
;
;BZFVOS: .BYTE 0,0,0,0
;	.BYTE 0,0,0,0
;	.BYTE 20,0,0,0
;	.BYTE 0,0,0,0
;
;BZFHOS: .BYTE 0,0A0,60,60
;	.BYTE 80,40,0,80
;	.BYTE 60,0,60,0
;	.BYTE 60,0,60,0
;ERFHOS:	.BYTE 60,0,20,0
;	.BYTE 0,60,0,60
;	.BYTE 40,40,40,60
;	.BYTE 60,60,0,0
;ERFVOS:	.BYTE 0,0,0,0
;	.BYTE 0,0,0,0
;	.BYTE 2C,2C,12,12
;	.BYTE 24,0,0,0
;VLFHOS:	.BYTE 0,0,0,0A0
;	.BYTE 0A0,60,60,0
;	.BYTE 0,60,40,80
;	.BYTE 0,0,0,0
;VLFVOS:	.BYTE 0,0,0,10
;	.BYTE 40,0,20,0
;	.BYTE 0,0,0,20
;	.BYTE 0,0,0,0
;SUFHOS:	.BYTE 0,0,0,0,0,60,40,0
;	.BYTE 0,0A0,80,0,0,0,0,0
;SUFVOS:	.BYTE 0,0,0,0,0,0,0,0
;	.BYTE 0,0,0F0,0,0,0,0,0
;DFFHOS:	.BYTE 0,0,0,0,0,0,0,0
;	.BYTE 20,80,0,60,60,0,0,0
;DCFVOS:
;DCFHOS:
;FLFHOS:	.BYTE 0C0,0,0,0,0A0,0,0,80
;	.BYTE 0,0,0,60,0,0A0,0,0
;FLFVOS:	.BYTE 16,0,0,0,16,0,0,0A
;	.BYTE 0,0,0,0A,0,26,0,0
;	.BYTE 8,0,0,0
;
;DUFHOS: .BYTE 0,0,0C0,40
;	.BYTE 60,0C0,80,0
;	.BYTE 0,0,0C0,0A0
;	.BYTE 80,0,40,40


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
D888: C9 22    cmp #$22		; CATRM1
D88A: F0 0B    beq $d897
D88C: C9 24    cmp #$24		; CATRM2
D88E: F0 04    beq $d894
D890: C9 08    cmp #$08		; CPLAY
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

;SCPHH:  .BYTE -2,0

D956: A0 01    ldy #$01
D958: 91 08    sta ($08), y
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
;FCPHH:  .BYTE -2,0
D9F8: A8       tay
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

;LIVCOV: .BYTE 74,74
;LIVCOH: .BYTE 0A0,58
;LIVOSV: .BYTE 0F8,8
;LIVOSH: .BYTE 0FB,0FB

DA4D: A6 CF    ldx $cf                                             
DA4F: B5 00    lda $00, x
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

;SUBONS: .BYTE 0,2,6,12,20

DAD9: A6 CF    ldx $cf
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

;MPOSVH: .BYTE 2,2,0FE,0FE,0FD,0FD,2,2,0,0
;	.BYTE 2,2,0FF,0FF,0FD,0FD,0FF,0FF,2,2
;
;MPOSVL: .BYTE 20,20,0,0,60,60,0,0,0,0
;
;	.BYTE 0,0,90,90,80,80,30,30,10,10
;
;MPOSHH: .BYTE 2,2,2,2,0FD,0FD,0FD,0FD,0FD,0FD
;	.BYTE -1,-1,2,2,-1,-1,-3,-3,2,2
;
;MPOSHL: .BYTE 60,60,80,80,60,60,0E0,0E0,0,0
;	.BYTE 0A0,0A0,0E0,0E0,-1,-1,10,10,0E0,0E0
;BOINDX: .BYTE 8,12,1C



DBF5: A0 1F    ldy #$1f                                            
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

;MSGCOV: .BYTE 0,0,0C0,0C0,0C0,60,5C,1C
;	.BYTE 50,44,38,2C,20,14,00,5C
;	.BYTE 34,28,0C8,28,14,0F0,0F0,0F0
;	.BYTE 10,5C,28,28
;
;MSGCOH: .BYTE 0,0,0D0,0D0,0D0,6C,0D0,91
;	.BYTE 0D6,0CA,0C7,0D0,0D0,0D9,18,0EC
;	.BYTE 0E0,0DA,0D0,0E0,8,30,0C0,0B8
;	.BYTE 0F0,0D6,0D8,0D8
;
;MSGNUM:	.BYTE 0,0,0B,9,9,0A,8,7
;	.BYTE 0C,0D,0E,0F,10,11,1A,1B
;	.BYTE 1C,1D,1E,1F,20,21,22,6
;	.BYTE 23,24,25,26

;DRANK
DC80: AD 35 04 lda $0435                                          
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

;RANKH:	.BYTE 0E6,0E6,0E0,0E8,0DC,0D4,0CC,0D0

;RANKNO: .BYTE 12,13,14,15,16,17,18,19

	
DCB4: A6 CF    ldx $cf                                             
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

;COITBL: .BYTE 0,4,0,8
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

; end of file "LOONYM.MAC"

; start of file "LOOSND.MAC" (sounds)
E0D3: A9 8F    lda #$8f   		;FUSE, PLYR 0
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
;
;CONTINUES A PREVIOUSLY STARTED SOUND
;WHEN CHANNEL 1 GOES IDLE, ALL SOUND ENDS
;
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
; end of file "LOOSND.MAC"
; start of file "LOOMSG.MAC"


;********************************
;*
;*THIS PROGRAM HANDLES ALL MESSAGES FOR THE GAME OF LUNAR BATTLE.
;*
;********************************
;	.SBTTL ******************
;	.SBTTL *
;	.SBTTL *PROGRAMMER: OWEN RUBIN
;	.SBTTL * IMPROVER: RICH ADAM
;	.SBTTL * MODELLED AFTER ED LOGG'S
;	.SBTTL * DISK 77 & B49
;	.SBTTL ******************
;
;
;
; PASS XPOS=A, YPOS=X
; WILL DO A CENTER THEN A CLEAR VECTOR TO POSITION
;


E1EE: 48       pha
E1EF: 8A       txa
E1F0: 48       pha
E1F1: 20 66 E4 jsr $e466
E1F4: 68       pla
E1F5: AA       tax
E1F6: 68       pla
E1F7: A0 00    ldy #$00
E1F9: 4C 8A E4 jmp $e48a
;VGMSG-VECTOR GENERATOR MESSAGE PROCESSOR
;
;ENTRY	(Y)=MESSAGE NUMBER (0,1,2,...)
;(X)=BRIGHTNESS
;USES	A,X,Y(POINTR,POINTR+1),TEMP2,(VGLIST,VGLIST+1)

E1FC: 84 22    sty $22
E1FE: A9 00    lda #$00
E200: A0 03    ldy #$03
E202: 20 5F E4 jsr $e45f
E205: A4 22    ldy $22
E207: A9 00    lda #$00
E209: 0A       asl a
;MESSAGES MAY OVERFLOW ONE PAGE
E20A: 0A       asl a
E20B: C0 1D    cpy #$1d
E20D: 90 0A    bcc $e219   ;NO OVERFLOW
E20F: 69 01    adc #$01    ;ADD TWO
E211: AA       tax
E212: 98       tya
E213: 38       sec
E214: E9 1D    sbc #$1d      ;REDUCE RELATIVE MESSAGE NUMBER
E216: A8       tay
E217: 10 01    bpl $e21a
E219: AA       tax         ;4*LANGUAGE (0,4,8,OR 12.)
E21A: BD 7B E2 lda $e27b, x
E21D: 85 20    sta $20
E21F: BD 7A E2 lda $e27a, x   ;CARRY IS CLEAR FROM ASL ABOVE
E222: 85 1F    sta $1f        ;POINTR SETUP NOW
E224: 18       clc
E225: 71 1F    adc ($1f), y   ;RELATIVE ADDRESS TO START OF MESSAGE
E227: 85 1F    sta $1f
E229: 90 02    bcc $e22d      ;NO OVERFLOW
E22B: E6 20    inc $20
E22D: A0 00    ldy #$00      ;Y DOUBLES AS INDEX FOR VGLIST AND POINTR
E22F: A2 00    ldx #$00
E231: A1 1F    lda ($1f, x)
E233: 85 22    sta $22
E235: 4A       lsr a
E236: 4A       lsr a     ;2*INDEX
E237: 20 56 E2 jsr $e256   ;PUT OUT CHARACTER AND UPDATE POINTR
E23A: A1 1F    lda ($1f, x)
E23C: 2A       rol a
E23D: 26 22    rol $22
E23F: 2A       rol a
E240: A5 22    lda $22
E242: 2A       rol a
E243: 0A       asl a
E244: 20 5C E2 jsr $e25c		;PUT OUT CHARACTER
E247: A1 1F    lda ($1f, x)
E249: 85 22    sta $22
E24B: 20 56 E2 jsr $e256		;PUT OUT CHARACTER AND UPDATE POINTR
E24E: 46 22    lsr $22
E250: 90 DF    bcc $e231       ;NOT END OF LIST
E252: 88       dey
E253: 4C 72 E4 jmp $e472         ;UPDATE VGLIST POINTER
E256: E6 1F    inc $1f      ;UPDATE INDIRECT POINTER TO CHARACTERS
E258: D0 02    bne $e25c    ;NO OVERFLOW
E25A: E6 20    inc $20
E25C: 29 3E    and #$3e
E25E: D0 04    bne $e264      ;NOT END OF LIST
E260: 68       pla
E261: 68       pla    ;PURGE RTS
E262: D0 EE    bne $e252   ;RETURN
E264: C9 0A    cmp #$0a
E266: 90 02    bcc $e26a
E268: 69 0D    adc #$0d
E26A: AA       tax
E26B: BD 46 4D lda $4d46, x   ;VGMSGA-2 10. FOR A, 12. FOR B, ....
E26E: 91 08    sta ($08), y		;PUT JSRL INTO VECTOR LIST
E270: C8       iny
E271: BD 47 4D lda $4d47, x
E274: 91 08    sta ($08), y
E276: C8       iny
E277: A2 00    ldx #$00
E279: 60       rts

;VGMSGT:	.WORD L0		;LANGUAGE TABLE POINTERS (SEE OPTSW 1)
;	.WORD L02
	
;L0:	.BYTE 10$-L0,11$-L0,12$-L0,13$-L0
;	.BYTE 14$-L0,15$-L0,16$-L0,17$-L0
;	.BYTE 18$-L0,19$-L0,20$-L0,21$-L0
;	.BYTE 22$-L0,23$-L0,24$-L0,25$-L0
;	.BYTE 26$-L0,27$-L0,28$-L0,29$-L0
;	.BYTE 30$-L0,31$-L0,32$-L0,33$-L0
;	.BYTE 34$-L0,35$-L0,36$-L0,37$-L0
;	.BYTE 38$-L0
;
;
;10$:	ASCIN	^/PRESS START/
;11$:	ASCIN	^/GAME OVER/
;12$:	ASCIN	^/OUT OF FUEL/
;13$:	ASCIN	^/SCORE/
;14$:	ASCIN	^/FUEL/
;15$:	ASCIN	^/LIVES/
;16$:	ASCIN	^/ESCAPE TIME/
;17$:	ASCIN	^/LINK/
;18$:	ASCIN 	^/MISSION COMPLETE/
;19$:	ASCIN	^/SHOOT REACTOR/
;20$:	ASCIN	^/BONUS/
;21$:	ASCIN	^/LINK ACTIVATED/
;22$:	ASCIN	^/CONGRATULATIONS/
;23$: 	ASCIN 	^/ENTER YOUR INITIALS/
;24$: 	ASCIN	^/PRESS ROTATE BUTTONS/
;25$:	ASCIN	^/TO CHANGE LETTERS/
;26$:	ASCIN	^/TRACTOR TO SELECT/
;27$:
;28$:	ASCIN	^/FLUNKY/
;29$:	ASCIN	^/GUNNER/
;30$:	ASCIN	^/CO PILOT/
;31$:	ASCIN	^/PILOT/
;32$:	ASCIN	^/ACE PILOT/
;33$:	ASCIN	^/KILLER PILOT/
;34$:	ASCIN	^/PONTIUS PILATE/
;35$:	ASCIN	^/GOTTA BE LUCKY/
;36$:	ASCIN	^/ LIST/
;37$:	ASCIN	^/PLAYER /
;38$:	ASCIN	^/INSERT COIN/
;L02:	.BYTE 39$-L02,40$-L02,41$-L02
;	.BYTE 42$-L02,43$-L02,44$-L02,45$-L02
;	.BYTE 46$-L02,47$-L02,48$-L02,49$-L02
;	.BYTE 50$-L02,51$-L02,52$-L02,53$-L02
;	.BYTE 54$-L02
;39$:	ASCIN	^/1 COIN 1 PLAY/
;40$:	ASCIN	^/ATARI MCMLXXXII/
;41$:	ASCIN	^/CREDITS /
;42$:	ASCIN	^/DANGER/
;43$:	ASCIN	^/SHOOT BUNKERS/
;44$:	ASCIN	^/TRACTOR FUEL/
;45$:	ASCIN	^/SUPER BONUS/
;46$:	ASCIN	^/NEXT SHIP/
;47$: 	ASCIN	^/1 COIN 2 PLAYS/
;48$:	ASCIN	^/2 COINS 1 PLAY/
;49$:	ASCIN	^/ERASING/
;50$:	ASCIN	^/FOR TEST/
;51$:	ASCIN	^/PRESS START 1 AND FIRE/
;52$:	ASCIN	^/CLEAR SCORES/
;53$:	ASCIN	^/CLEAR TIMES/
;54$:	ASCIN	^/CLEAR TIMES AND SCORES/

; end of file 
; start of file "VGUT.MAC"
; VGUT-VECTOR GENERATOR UTILITIES

;
;DATE INITIATED:	10-OCT-79
;PROJECT CHARGE #:	23803
;
;DISK #:	 	105, B46
;
;HARWARE REQUIREMENTS:	ANALOG AUTO-NORMALIZING VECTOR GENERATOR
;
;MEMORY REQUIREMENTS:	
;	NOT APPLICABLE - SUBROUTINE
;
;INTERRUPT REQUIREMENTS:
;	NOT APPLICABLE - SUBROUTINE
;
;ASSEMBLY COMMAND STRING:
;	R MAC65
;	DX1:VGUT,DK1:VGUT=DX1:VGUT/C
;
;LINK COMMAND STRING:
;	NOT APPLICABLE - SUBROUTINE
;
;PROGRAM DESCRIPTION:
;	A SET OF UTILITY ROUTINES FOR GENERATING
;	VECTORS USING THE ANALOG AUTO-NORMALIZING VECTOR GENERATOR.
;ZERO PAGE GLOBALS REQUIRED:
;
;	VGLIST:	THIS 2 BYTE VARIABLE CONTAINS THE CURRENT VECTOR GENERATOR RAM
;		ADDRESS USED TO BUILD INSTRUCTIONS FOR THE VECTOR GENERATOR.
;		IT SHOULD BE INITIALIZED BEFORE CALLING ANY OF THESE ROUTINES.
;
;	XCOMP:	THIS 4 BYTE VARIABLE IS USED TO CONTAIN THE X (LSB,MSB) COMPONENT
;		AND Y (LSB,MSB) COMPONENT USED IN SEVERAL OF THE VECTOR INSTRUC-
;		TIONS.  FOR THE VGVCTR ROUTINE THESE FIELDS ARE SIGNED 2'S
;		COMPLEMENT NUMBERS.
;
;	VGBRIT: THIS VARIABLE IS USED BY VGVCTR AND VGSTAT TO GENERATE VECTORS
;		WITH THE GIVEN BRIGHTNESS. IT'S VALUES ARE 0,10,20,30,
;		40,...F0 WHERE 0 IS OFF AND F0 IS MAX BRIGHTNESS.
;		IN THE VECTOR INSTRUCTIONS ONLY THE UPPER 3 BITS IS USED
;		IF Z=1 IN THE VECTOR INSTRUCTIONS THEN THE LAST NON-ZERO
;		Z IS USED.
;
;
;EXTERNAL ENTRY POINTS REQUIRED:
;
;	VGMSGA:	THIS ENTRY POINT PROVIDES JSRL INSTRUCTIONS TO THE CHAR.X
;		ROUTINES.  THIS ENTRY POINT IS PROVIDED BY VECAN.MAC.
;
;THESE ROUTINES WERE WRITTEN TO PROVIDE PROGRAMMERS USING LYLE RAIN'S VECTOR
;GENERATOR A MEANS OF:
;	1)	DYNAMICALLY GENERATING VECTORS JUST AS VECMAC ALLOWS STATIC
;		GENERATION OF VECTORS.
;	2)	DISPLAY NUMBERS WITH OR WITHOUT ZERO SUPPRESSION.
;
;EXAMPLE 1:
;
;	LDA I,VECRAM&0FF	;INITIALIZE VECTOR RAM POINTER
;	STA VGLIST
;	LDA I,VECRAM/100
;	STA VGLIST+1
;	JSR CENTER		;CENTER BEAM IN MIDDLE OF SCREEN.
;	LDA I,256./4		;POSITION BEAM AT (256,256)
;	LDX I,256./4
;	JSR VGSVTR
;	ETC....
;
;
;EXAMPLE 2:
;
;	LDA PLAYER		;DISPLAY PLAYER NUMBER
;	JSR VGHEX		;REMEMBER BEAM MUST BE POSITIONED CORRECTLY
;	LDA SCORE1		;MSB OF SCORE
;	LSR
;	LSR
;	LSR
;	LSR
;	SEC
;	JSR VGHEXZ		;DISPLAY UPPER DIGIT WITH ZERO SUPPRESSION
;	LDA SCORE1
;	JSR VGHEXZ		;DISPLAY SECOND DIGIT WITH ZERO SUPPRESSION
;	LDA SCORE0		;LSB OF SCORE
;	PHP			;SAVE ZERO SUPPRESSION FLAG
;	LSR
;	LSR
;	LSR
;	LSR
;	PLP
;	JSR VGHEXZ		;DISPLAY THIRD DIGIT WITH ZERO SUPPRESSION
;	LDA SCORE0
;	JSR VGHEX		;DISPLAY LAST DIGIT
;	ETC....

;VGRTSL - ADD RTSL TO VECTOR LIST
;
;ENTRY	(VGLIST,VGLIST+1) = VECTOR LIST ADDRESS
;EXIT	(VGLIST,VGLIST+1) = NEW VECTOR LIST ADDRESS
;USES	A,Y,(VGLIST,VGLIST+1)

;VGRTSL
E40F: A9 C0    lda #$c0
E411: D0 05    bne $e418
;
;ENTRY	(VGLIST,VGLIST+1) = VECTOR LIST ADDRESS
;EXIT	(VGLIST,VGLIST+1) = NEW VECTOR LIST ADDRESS
;USES	A,X,Y,(VGLIST,VGLIST+1)
;VGHALT
E413: 20 66 E4 jsr $e466   ;CENTER FIRST
E416: A9 20    lda #$20    ;BXXX IS HALT
E418: A0 00    ldy #$00
E41A: 91 08    sta ($08), y
E41C: 4C C3 E4 jmp $e4c3    ;ADD LAST BYTE

;VGHEXZ - DISPLAY DIGIT WITH ZERO SUPPRESSION
;
;THIS ROUTINE WILL DISPLAY A DIGIT USING THE DEFAULT CHARACTER SIZE.
;NO ATTEMPT IS MADE TO USE THE VARIABLE VGSIZE.
;
;ENTRY	(A) = LOWER 4 BITS TO BE DISPLAYED
;	(C) = CARRY CLEAR IF NO ZERO SUPPRESSION
;EXIT	(C) = CARRY CLEARED IF NON-ZERO DIGIT DISPLAYED
;USES	A,X,Y,(VGLIST,VGLIST+1)

;VGHEXZ (this seems uncalled/unused)
E41F: 90 04    bcc $e425    ;IF NO ZERO SUPPRESSION
E421: 29 0F    and #$0f
E423: F0 05    beq $e42a    ;LEAVE C SET

;VGHEX - DISPLAY DIGIT
;
;THIS ROUTINE WILL DISPLAY A DIGIT USING THE DEFAULT CHARACTER SIZE.
;NO ATTEMPT IS MADE TO USE THE VARIABLE VGSIZE.
;
;ENTRY	(VGLIST,VGLIST+1) = VECTOR LIST ADDRESS
;	(A) = LOWER 4 BITS TO BE DISPLAYED
;EXIT	(VGLIST,VGLIST+1) = NEW VECTOR LIST ADDRESS
;	(C) = CARRY IS CLEAR
;USES	A,X,Y,(VGLIST,VGLIST+1)
;VGHEX
E425: 29 0F    and #$0f
E427: 18       clc
E428: 69 01    adc #$01  ;CLEARS C BIT
E42A: 08       php      ;SAVE C FLAG
E42B: 0A       asl a
E42C: A0 00    ldy #$00
E42E: AA       tax
E42F: BD 48 4D lda $4d48, x
E432: 91 08    sta ($08), y
E434: BD 49 4D lda $4d49, x   ;COPY JSRL TO CHARACTER ROUTINE
E437: C8       iny
E438: 91 08    sta ($08), y
E43A: 20 72 E4 jsr $e472    ;UPDATE VECTOR LIST POINTER
E43D: 28       plp    ;RESTORE C FLAG
E43E: 60       rts

;VGJMPL - ADD JMPL TO VECTOR LIST
;
;ENTRY	(VGLIST,VGLIST+1) = VECTOR LIST ADDRESS
;	(A) = MSB OF ADDRESS
;	(X) = LSB OF ADDRESS
;EXIT	(VGLIST,VGLIST+1) = NEW VECTOR LIST ADDRESS
;USES	A,Y,(VGLIST,VGLIST+1)

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

;VGJSRL - ADD JSRL TO VECTOR LIST
;
;ENTRY	(VGLIST,VGLIST+1) = VECTOR LIST ADDRESS
;	(A) = MSB OF ADDRESS
;	(X) = LSB OF ADDRESS
;EXIT	(VGLIST,VGLIST+1) = NEW VECTOR LIST ADDRESS
;USES	A,Y,(VGLIST,VGLIST+1)

E453: 38       sec
E454: E9 20    sbc #$20			; reframe to remove $2000 for AVG address
E456: 4A       lsr a
E457: 29 1F    and #$1f         ;BASE ADDRESS IS RELATIVE
E459: 09 A0    ora #$a0
E45B: D0 EA    bne $e447        ;MOVE INTO VECTOR LIST

;VGSTAT - SET VECTOR GENERATOR STATUS
;
;ENTRY	(A)=HI/LOW AND IN/OUT FLAGS AND ENABLE (0,1,2,3,OR 4)
;	(Y)=VECTOR BRIGHTNESS (0,10,20,...,F0)
;	(VGLIST,VGLIST+1)=VECTOR LIST ADDRESS
;EXIT	(VGLIST,VGLIST+1)=NEW VECTOR LIST ADDRESS
;USES	A,X,Y,(VGLIST,VGLIST+1)

E45D: A4 0A    ldy $0a
;VGSTAT
E45F: 09 60    ora #$60
E461: AA       tax      ;OPCODE + LIMIT BITS
E462: 98       tya
E463: 4C 6A E4 jmp $e46a     ;ADD 2 BYTES TO VECTOR LIST
;VGCNTR - CENTER BEAM IN MIDDLE OF SCREEN
;
;ENTRY	(VGLIST,VGLIST+1)=VECTOR LIST ADDRESS
;USES	A,X,Y,(VGLIST,VGLIST+1)
;
E466: A9 40    lda #$40
E468: A2 80    ldx #$80

E46A: A0 00    ldy #$00
E46C: 91 08    sta ($08), y
E46E: C8       iny
E46F: 8A       txa
E470: 91 08    sta ($08), y

;VGADD - ADD Y+1 TO VECTOR LIST ADDRESS
;
;ENTRY	(VGLIST,VGLIST+1) = VECTOR LIST ADDRESS
;	(Y) = VALUE+1 TO BE ADDED TO VECTOR LIST
;EXIT	(VGLIST,VGLIST+1) = NEW VECTOR LIST ADDRESS
;USES	A,(VGLIST,VGLIST+1)

E472: 98       tya    ;ADD 1+(Y) TO VGLIST
E473: 38       sec
E474: 65 08    adc $08
E476: 85 08    sta $08
E478: 90 02    bcc $e47c
E47A: E6 09    inc $09
E47C: 60       rts

;VGSCAL-SET VECTOR GENERATOR SCALE
;
;ENTRY	(Y)=LINEAR SCALE FACTOR (0=FULL SIZE, FF=1/256 SIZE)
;	(A)=POWER OF 2 SCALE FACTOR (0=FULL SIZE,1=1/2 SIZE,...)
;	(VGLIST,VGLIST+1)=VECTOR LIST ADDRESS
;EXIT	(VGLIST,VGLIST+1)=NEW VECTOR LIST ADDRESS
;USES	A,X,Y(VGLIST,VGLIST+1)

E47D: A0 00    ldy #$00   ;USE FULL SIZE
E47F: 09 70    ora #$70   ;OPCODE + SCALE SIZE
E481: AA       tax
E482: 98       tya
E483: 4C 6A E4 jmp $e46a   ;ADD 2 BYTES TO VECTOR LIST
;VGDOT - DRAW A DOT AT CURRENT POSITION
;
;ENTRY	(VGLIST,VGLIST+1) = VECTOR LIST ADDRESS
;	(A) = INTENSITY (0 = OFF, EQ = MAX, 20 = INCREMENT)
;EXIT	(VGLIST,VGLIST+1) = NEW VECTOR LIST ADDRESS
;	(VGBRIT) = NEW INTENSITY
;USES	A,Y,(VGLIST,VGLIST+1)
E486: A8       tay
E487: A9 00    lda #$00
E489: AA       tax

;VGVTR - SHORT FORM VGVCTR CALL
;
;ENTRY	(VGLIST,VGLIST+1) = VECTOR LIST ADDRESS
;	(A) = CHANGE IN X/4 (-80 TO +7F)
;	(X) = CHANGE IN Y/4 (-80 TO +7F)
;	(Y) = VECTOR BRIGHTNESS (0,10,20,...,F0)
;EXIT	(VGLIST,VGLIST+1) = NEW VECTOR LIST ADDRESS
;	(VGBRIT)=NEW VECTOR BRIGHTNESS
;USES	A,X,Y,(VGLIST,VGLIST+1),(XCOMP,XCOMP+3)

E48A: 84 0A    sty $0a
E48C: A0 00    ldy #$00
E48E: 0A       asl a
E48F: 90 01    bcc $e492   ;SIGN EXTEND
E491: 88       dey
E492: 84 05    sty $05     ;WITH SCALE=0 A=1 MEANS=DOTS ON XY
E494: 0A       asl a
E495: 26 05    rol $05
E497: 85 04    sta $04
E499: 8A       txa     ;WRITE Y VALUE TO XCOMP+2,XCOMP+3
E49A: 0A       asl a
E49B: A0 00    ldy #$00
E49D: 90 01    bcc $e4a0   ;SIGN EXTEND
E49F: 88       dey    ;Y=-1
E4A0: 84 07    sty $07
E4A2: 0A       asl a
E4A3: 26 07    rol $07
E4A5: 85 06    sta $06
E4A7: A2 04    ldx #$04

;VGVCTR - ADD VECTOR TO VECTOR LIST
;
;NOTE:	IF THE NUMBERS GIVEN ARE MORE THAN
;	15 BITS IN SIGNIFICANCE THEN AN
;	INCORRECT VECTOR WILL BE GENERATED
;
;ENTRY	(X) =4 ZERO PAGE LOCN.  CONTAINING (X LSB,X MSB,Y MSB,Y LSB)
;	(VGLIST,VGLIST+1) = VECTOR LIST ADDRESS
;	(VGBRIT)=VECTOR BRIGHTNESS (ONLY THE UPPER 3 BITS ARE USED)
;EXIT	(VGLIST,VGLIST+1) = NEW VECTOR LIST ADDRESS
;USES	A,X,Y,(VGLIST,VGLIST+1)

E4A9: A0 00    ldy #$00
E4AB: B5 02    lda $02, x
E4AD: 91 08    sta ($08), y		; Y LSB
E4AF: B5 03    lda $03, x
E4B1: 29 1F    and #$1f
E4B3: C8       iny
E4B4: 91 08    sta ($08), y		; Y MSB
E4B6: B5 00    lda $00, x		; X LSB
E4B8: C8       iny
E4B9: 91 08    sta ($08), y
E4BB: B5 01    lda $01, x
E4BD: 45 0A    eor $0a
E4BF: 29 1F    and #$1f    ;CLEAR SIGN EXTENSION
E4C1: 45 0A    eor $0a     ;COMBINE UPPER 3 BITS OF VGBRIT WITH X MSB
E4C3: C8       iny
E4C4: 91 08    sta ($08), y     ;SET INTENSITY
E4C6: D0 AA    bne $e472    ;ALWAYS - UPDATE VGLIST POINTER

; end of file "VGUT.MAC"
; start of file "LOOEAR.MAC"

;	.TITLE	LOOEAR-LUNAR BATTLE EAROM
;	.SBTTL	**************************
;	.SBTTL	*			 *
;	.SBTTL	*MODULE-LOOEAR		 *
;	.SBTTL	*PROGRAMMER:DAVE THEURER *
;	.SBTTL	*FUNCTION:LOONY EAROM	 *
;	.SBTTL	*			 *
;	.SBTTL	**************************
;	.NLIST

E4D4: A9 04    lda #$04
E4D6: D0 06    bne $e4de
E4D8: A9 03    lda #$03
E4DA: D0 02    bne $e4de

E4DC: A9 07    lda #$07
E4DE: A0 FF    ldy #$ff
E4E0: D0 08    bne $e4ea
E4E2: A9 03    lda #$03     ;WRITE HIGH SCORES & INITIALS
E4E4: D0 02    bne $e4e8
E4E6: A9 04    lda #$04    ;REQUEST BOOKKEEPING UPDATE
E4E8: A0 00    ldy #$00
E4EA: 8C 70 01 sty $0170   ;DO NOT ZERO EAROM
E4ED: 48       pha
E4EE: 0D 71 01 ora $0171
E4F1: 8D 71 01 sta $0171
E4F4: 68       pla
E4F5: 0D 72 01 ora $0172
E4F8: 8D 72 01 sta $0172
E4FB: 60       rts
E4FC: A9 07    lda #$07		;READ IN EVERYTHING
E4FE: 8D 71 01 sta $0171
E501: A9 00    lda #$00
E503: 8D 72 01 sta $0172
;INPUT:EAFLG:0=NO ACTIVITY;80=ERASE;40=WRITE;20=READ
;      EAX:INDEX INTO EADAL OF LOC TO ACCESS IN EAROM
;      EABC:OFFSET FROM @EASRCE OF RAM DATA TO ACCESS
;      EACNT:EAROM OFFSET OF LAST BYTE TO MODIFY (STOP WHEN EAX>EACNT)
;
;OUTPUT:EAROM ERASED, WRITTEN TOO, OR READ
;
;EAUPD
E506: AD 74 01 lda $0174
E509: D0 4B    bne $e556
E50B: AD 71 01 lda $0171
E50E: F0 46    beq $e556
E510: A2 00    ldx #$00
E512: 8E 75 01 stx $0175    ;ZERO SOURCE INDEX
E515: 8E 79 01 stx $0179    ;ZERO CHECKSUM
E518: 8E 78 01 stx $0178    ;ZERO SELECT BIT
E51B: A2 08    ldx #$08
E51D: 38       sec
E51E: 6E 78 01 ror $0178   ;LOOP UNTIL 1ST BIT ON LEFT IS FOUND
E521: 0A       asl a
E522: CA       dex
E523: 90 F9    bcc $e51e
E525: A0 80    ldy #$80
E527: AD 78 01 lda $0178
E52A: 2D 72 01 and $0172
E52D: D0 02    bne $e531
E52F: A0 20    ldy #$20   ;DEFAULT TO ERASE/WRITE
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
E5AE: 8D 00 89 sta $8900     ;SELECT CHIP
E5B1: EC 77 01 cpx $0177
E5B4: AD 00 70 lda $7000     ;READ EAROM
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
E5F0: 4C 06 E5 jmp $e506    ;YES. DO ALL READS AT ONCE
E5F3: 60       rts

; end of file "LOOEAR.MAC"

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

; start of file "COIN65.MAC"
;        .SBTTL COIN65 - 650X "UNIVERSAL" COIN ROUTINE
;        .SBTTL *********************************
;        .SBTTL * PROGRAMERS: DOWNEND & ALBAUGH *
;        .SBTTL *                               *
;        .SBTTL * CHECKER:                      *
;        .SBTTL *                               *
;        .SBTTL *********************************
;
;	SLAM=0
;	BONADD=1
;	MECHS=3
;	EMCTRS=3
;	COIN=0
;	COIN01=1
;        .SBTTL EXPLANATION
;	.RAD=10
;        .RADIX 16
;	.ENABL LC
;        .LIST MEB
;;THIS IS A MAJOR REVISION OF THE COIN ROUTINE DERIVED FROM PENNY.
;;ALL NEW PROGRAMS SHOULD USE THIS ROUTINE.  OLD PROGRAMS CAN CONTINUE
;;TO USE PENNY, BUT NO FURTHER OPTIONS WILL BE SUPPORTED IN PENNY.
;;REVISED 7/80 TO SUPPORT BONUS-ADDER
;        .SBTTL DEFAULT ASSIGNMENTS
;        .LIST CND
;	.IIF NDF,FTEST,FTEST=0		;NOT FIELD TEST
;        .IIF NDF,MODES,MODES=4          ;FOUR COIN MODES STANDARD
;					;ALTERNATE IS MODES=0
;	.IIF NDF,MECHS,MECHS=3		;# OF MECHS (1,2 OR 3)
;	.IIF NDF,INCLUDE,INCLUDE=0	;NOT ".INCLUDE"'D
;;IF "INCLUDE=1",THE ".END" IS SUPPRESSED
;	.IIF NDF,RTS,RTS=1		;EXIT VIA RTS
;;IF RTS=0,EXITS BY FALLING OUT
;	.IIF NDF,BONADD,BONADD=0	;DO NOT BONUS-ADDER,BONADD=1 TO DO BONUS ADDER
;	.IF EQ,MECHS-3			;DEFAULTS FOR MECHS=3
;	.IIF NDF,MULTS,MULTS=1   		;IMPLEMENT H.DELMAN STANDARD MULTIPLIERS
;					        ;(SEE GHM,GDM BELOW)
;	.IIF NDF,EMCTRS,EMCTRS=3         	;3 ELECTRO-MECH COUNTERS
;	.IIF NDF,OFFSET,OFFSET=1		;OFFSET BY 1
;	.ENDC				;EQ,MECHS-3
;	
;	.IF EQ,MECHS-2			;DEFAULTS FOR MECHS=2
;	.IIF NDF,MULTS,MULTS=0	   		;MULTIPLIERS DO NOT APPLY
;	.IIF NDF,EMCTRS,EMCTRS=0	   	;NO E.M. COUNTERS
;        .IIF NDF,OFFSET,OFFSET=2	   	;SWITCHES AND STATUS BYTES TWO-APART
;	.ENDC				;EQ, MECHS-2
;
;	.IF EQ,MECHS-1			;DEFAULTS FOR MECHS=1
;	.IIF NDF,MULTS,MULTS=1			;H. DELMAN STD. MULTS
;	.IIF NDF,EMCTRS,EMCTRS=1		;1 COUNTER
;	.IIF NDF,OFFSET,OFFSET=1		;OFFSET FOR COUNTERS
;	.ENDC				;EQ,MECHS-1
;
;	.IIF NDF,SEPCCT,SEPCCT=0	;DO NOT IMPLEMENT SEPARATE $CNCT'S
;;USE SEPCCT=1 ONLY FOR WIERD,NON-STANDARD MECH-MULTIPLIERS
;        .IIF NDF,COIN,COIN=0            ;COIN IS LOW-TRUE
;        .IIF NDF,CNTINT,CNTINT=1        ;COUNT INTERRUPTS (IN $INTCT)
;        .IIF NDF,SLAM,SLAM=1            ;SLAM IS HIGH-TRUE
;        .IIF NDF,CMZP,CMZP=1            ;COIN MODE IS IN ZERO-PAGE
;;D0,D1=0,1,2,3 FOR FREE, 2 PLAY/COIN, 1 PLAY/COIN,2 COIN/PLAY
;;D2,D3=0,1,2,3 FOR 1,4,5,6 "UNITS"/RIGHT COIN
;;D4=0,1 FOR 1,2 "UNITS"/MIDDLE COIN
;;ONLY D2,3,4 USED IF MODES=0
;        .IIF NDF,COIN67,COIN67=0        ;COINS NOT IN D7,D6 OF SAME BYTE
;	.IIF NDF,COIN01,COIN01=0	;COINS NOT IN D0,D1 EITHER
;        .IIF NDF,PRST,PRST=30.          ;PRE-COIN SLAM KILLS COINS FOR 30 FRAMES
;        .IIF NDF,POST,POST=30.          ;POST-COIN SLAM KILLS COINS WITHIN 30 FRAMES
;	.IF NE,<EMCTRS>*<EMCTRS-1>*<EMCTRS-3>*<EMCTRS-4>
;	.ERROR		;NONE,ONE,THREE, OR FOUR E.M.CTRS ONLY
;	.ENDC
;	.IF NE,FTEST
;	CCTRS	=1			;FIELD TEST, 1 COIN COUNTER
;	.IFF
;	CCTRS	=EMCTRS			;NORMALLY
;	.ENDC
;        .IF NE,CMZP
;;IF YOU USE CMZP=0, DEFINE EQUIVALENT MACROS
;;(GCM NOT NEEDED IF MODES=0)
;        .MACRO GCM
;;ACC0,ACC1:=COIN OPTION ACC 2-7=0,Z-FLAG SET PER ACC  CARRY IS DON'T CARE.
;        LDA Z,$CMODE			;GET COIN MODE FROM ZERO-PAGE
;	.IF NE,MULTS
;	AND I,3				;ISOLATE COINS-CREDITS OPTION
;	.ENDC				;NE,MULTS
;        .ENDM
;
;;GHM, GDM NOT NEEDED IF MULTS=0
;	.MACRO GHM
;;ACC=0 FOR 1 "UNIT" ,<>0 FOR 2 "UNITS" PER MIDDLE-MECH COIN.
;;  Z FLAG SET PER ACC.  CARRY IS DON'T CARE
;	LDA Z,$CMODE			;GET COIN MODE FROM ZERO-PAGE
;	AND I,10			;ISOLATE HALF-MULTIPLIER
;	.ENDM
;
;	.MACRO GDM
;;ACC=0,1,2,3 FOR 1,4,5,6 "UNITS" PER RIGHT-MECH COIN.  CARRY CLEAR.  Z-FLAG SET PER ACC
;	LDA Z,$CMODE
;	AND I,0C
;	LSR
;	LSR
;	.ENDM
;        .ENDC			;NE,CMZP
;	.MACRO GBAM
;;ACC= 0,1,2,3,4,5,6,7 FOR BONUS-ADDER MODE
;	LDA Z,$CMODE
;	LSR
;	LSR
;	LSR
;	LSR
;	LSR			;ISOLATE BONUS-ADDER MODE IN BITS 0-2
;	.ENDM
;        .NLIST CND
;	.NLIST CND
;;ENTRY POINT
;        .GLOBL MOOLAH
;;
;;EXTERNAL REFERENCES
;	.IF NE,BONADD
;	.GLOBL $BCCNT
;	.GLOBL $BC
;	.ENDC
;	.IF NE,MODES!MULTS
;	.IF NE,CMZP
;        .GLOBL $CMODE                   ;INPUT COIN MODE
;	.ENDC				;NE, CMZP
;	.ENDC				;NE,MODES!MULTS
;        .GLOBL $COINA,$LAM              ;SWITCH LOCATIONS (COIN & SLAM)
;        .GLOBL $LMBIT                   ;MASK WITH 1 IN BIT WHERE SLAM SW. IS
;        .GLOBL $CNSTT,$PSTSL		;INTERNAL LOCATIONS
;	.GLOBL $INTCT			;INTERRUPT COUNTER
;        .GLOBL $LMTIM,$CNCT             ;SLAM-TIMER, COINCOUNT
;	.IF NE,MODES
;        .GLOBL $$CRDT                   ;RESULT OF ALL THIS
;	.ENDC				;NE,MODES
;	.IF NE,EMCTRS
;	.GLOBL $CCTIM			;COIN-COUNTER TIMER BYTE(S)
;	.ENDC				;NE,EMCTRS
;        .IF NE,MODES*<MODES-4>
;        .ERROR   ;2 FLAVORS-0 OR 4 MODES
;        .ENDC				;NE,MODES*<MODES-4>
;	.IF NE,<MECHS-2>*<MECHS-3>*<MECHS-1>	;CHECK # OF MECHS SPEC'D
;	.ERROR ;1, 2 OR 3 MECHS ONLY, PLEASE
;	.ENDC				;NE,<MECHS-2>*<CMECHS-3>*<MECHS-1>
;	.IF EQ,RTS!INCLUDE
;	.ERROR ;NO RTS, NO INCLUDE???
;	.ENDC			;RTS!INCLUDE
;	.IF NE,MULTS*SEPCCT
;	.ERROR ;BOTH MULTS AND SEPCCT?!?
;	.ENDC				;NE,MULTS*SEPCCT
;	.IF NE,MODES*SEPCCT
;	.ERROR ;SEPCCT AND MODES TOO?!?
;	.ENDC				;NE,MODES*SEPCCT
;        .IIF GT,PRST-31.,PRST=31.
;        .IIF GT,POST-63.,POST=63.
;;        The coin routine assumes the presence of the following .GLOBL variables:
;	.IF NE,BONADD
;	.REPT 0
;$BCCNT:	ONE BASE PAGE BYTE USED TO COUNT COINS TOWARDS
;	BONUS COINS. IT MUST BE INITIALIZED TO ZERO ON
;	POWER-ON. IT MUST ALSO BE INITIALIZED TO ZERO
;	WHEN A START-BUTTON IA PUSHED.
;$BC:	ONE BASE-PAGE BYTE USED TO
;	HOLD ACTUAL BONUS COINS ACCRUED.
;	INITIALIZE TO ZERO AT POWER-ON
;	AND EACH TIME A START BUTTON IS
;	PUSED.***CLEAR $BCCNT, THEN & BC.
;	.ENDR
;	.ENDC
;	.IF NE,MODES
;	.REPT 0
;$$CRDT:   Base page byte initialized to 0 on restart.  This is where accrued  credit
;        is  kept.   Should  be  decremented  for each player-start.  Note that a DECREMENT
;        instruction must be used to insure  mutual  exclusion  between  the  main  program
;        accessing  $$CRDT  and  the  interrupt-driven coin routine accessing $$CRDT".  Not
;        used if MODES=0
;	.ENDR
;	.ENDC			;NE,MODES
;	.IF NE,CMZP
;	.REPT 0
;	.IIF NDF,SEPCCT,SEPCCT=0	;DO NOT IMPLEMENT SEPARATE $CNCT'S
;$CMODE:   Base page byte that contains the coin option  switches  in  its  low-order
;        bits  (high true).  You must put them there.  This is not used if flag CMZP=0.
;	See bit definitions in DEFAULT ASSIGNMENTS, and Macro definitions GCM,GHM,GDM.
;	.ENDR
;	.ENDC			;NE,CMZP
;	.REPT 0
;$CNSTT:   "MECHS" base page bytes ($CNSTT, $CNSTT+OFFSET,$CNSTT+2*OFFSET) which should be
;	initialized to 00 (the timers for coin detection).
;$COINA:   "MECHS" locations containing coin switches in D7. Left mech is at  $COINA,  Right
;        mech is  at  $COINA+(2*OFFSET). If COIN67=1, Switches  are  all in $COINA, D7-Right,
;	D6-Mid, D5-Left. If Coin01=1, D0-Right,	D1-MId, D2-Left.
;	.ENDR
;	.IF NE,SEPCCT
;	.REPT 0
;$CNCT:    "MECHS" base page bytes ($CNCT, $CNCT+OFFSET, $CNCT+(2*OFFSET)) which must be zeroed
;	 on pwron - coin counters for program (As distinct from $CCTIM,Below). Only one is used
;	if SEPCCT=0.
;	.ENDR
;	.IFF
;	.REPT 0
;$CNCT:	  Base page byte which must be initialized to zero on pwron. This is used to count
;	coins for program (As distinct from $CCTIM, below).
;	.ENDR
;	.ENDC			;NE,SEPCCT
;	.REPT 0
;$PSTSL:   "MECHS" base page bytes  ($PSTSL, $PSTSL+OFFSET,$PSTSL+(2*OFFSET)used to
;	time post-coin slam.
;$LAM:     Address of the SLAM switch.  The bit position inside $LAM is specified  by
;       $LMBIT (see below)
;$LMBIT:  Mask used to select which bit in the slam switch  byte  should  be  tested
;        (used as I,$LMBIT).  NOT A LOCATION, JUST A VALUE!!
;$LMTIM:   Base  page  byte  used  as  a  timer  for  pre-slam  protection.   May  be
;        initialized  to  0FF  at  pwron  to  disallow  coin input for 4 seconds.  Coins are
;        disallowed for two frames anyway.  This will be non-zero if SLAM was
;	true within PRST*4 frames.
;$INTCT:  Interrupt counter for  long  string-timer.   If  CNTINT=1,  this  will  be
;        incremented  (default  case).   If CNTINT=0, this should be equated to an existing
;        counter.
;$CCTIM:  Timers(s) for pulses output to electro-mechanical counters, if EMCTRS > 0.
;	Sign of $CCTIM(X) set if assoc. coin counter should be turned on, cleared
;	for off. If 3 used, they are Left @ $CCTIM, Mid @ $CCTIM+OFFSET,
;	Right @ $CCTIM+(2*OFFSET)
;Space requirements:
;                RAM: 3+CMZP+2*MECHS+EMCTRS (13. TYPICAL)
;                ROM: About 200. bytes
;The coin routine also assumes it will be called 4 times  a  frame,  where  one  frame=1/60
;second.   In  most  cases  this may be accomplished by making the coin routine part of the
;interrupt routine.
;	.ENDR
;	.IF EQ,OFFSET-2
;	.REPT 0
;SAMPLE BASE PAGE ALLOCATION:  (WHERE OFFSET=2,MECHS=3)
;	$BCCNT:	.BLKB 1		;COUNT TOWARDS BONUS COIN
;	$BC:	.BLKB 1		;BONUS COINS
;	$CCTIM:	.BLKB 1		;COIN COUNTER TIMER (IF 1 USED)
;        $$CRDT: .BLKB 1		;CREDIT TOTAL
;        $CNCT:  .BLKB 1		;COIN COUNT
;	$LMTIM:	.BLKB 1		;PRE-COIN SLAM-TIMER
;	$CMODE:	.BLKB 1		;COIN MODE
;        $PSTSL: .BLKB 6		;POST-COIN SLAM TIMERS (@ 0,2,4)
;        $CNSTT  =$PSTSL+1	;COIN STATUS/TIMERS (@ 1,3,5)
;        .ENDR
;	.ENDC			;EQ,OFFSET-2
;	.IF EQ,OFFSET-1
;	.REPT 0
;SAMPLE BASE PAGE ALLOCATION: (WHERE OFFSET=1,MODES=4)
;	$BCCNT:	.BLKB 1		;COUNT TOWARDS BONUS COIN
;	$BC:	.BLKB 1		;BONUS COINS
;	$CCTIM:	.BLKB EMCTRS	;E.M. COUNTER TIMERS (-FOR ON)
;	$$CRDT:	.BLKB 1		;CREDIT TOTAL
;	$CNCT:	.BLKB 1		;"UNIT-COIN" COUNT
;	$PSTSL:	.BLKB MECHS	;POST-COIN SLAM TIMERS
;	$CNSTT:	.BLKB MECHS	;COIN-STATUS/TIMER
;	$LMTIM:	.BLKB 1		;PRE-COIN SLAM TIMER
;	$CMODE:	.BLKB 1		;COIN MODE
;	.ENDR
;	.ENDC			;EQ,OFFSET-1
;        .IF EQ,MODES-4
;        .REPT 0
;THE COIN MODES ARE:
;  0:    FREE PLAY- $CNCT is zeroed, $$CRDT is not changed
;  1:    2 PLAYS PER COIN
;  2:    1 PLAY PER COIN
;  3:    2 COINS PER PLAY
;        .ENDR
;        .ENDC			;EQ,MODES-4
;        .REPT 0
;                   *** COIN DETECTION ***
;Coin detection, courtesy of Mike Albaugh, uses two counters in one  byte  ($CNSTT).   This
;byte  is  used to remember the condition of the coin switch.  The upper counter (D7,D6,D5)
;runs when the coin is absent and is reset when the coin is  present.   The  lower  counter
;(D4-D0)  runs  when  the  coin is present and is reset when the coin is absent, unless the
;coin was present for 5 successive samples.  This "unless"  enables  $CNSTT  to  "remember"
;that a coin has been VALID-HIGH while waiting for VALID-LOW.
;Basically, a valid coin is defined as between 16 and 800 ms of coin present, preceded  and
;followed  by  33 ms of coin absent.  The 33 ms lows need not immediately precede or follow
;the high.  The lower five bits count  down  from  31  when  the  coin  is  present.   This
;countdown  is  fast  (once  per  interupt)  for the first five samples (31-26, about 16-20
;milliseconds) then slow (once per EIGHT interrupts) for the remaining counts (26-0,  about
;800  ms).   The  count  then  stops  at zero.  This counter is reset if the coin goes away
;during the first five counts, I.E., the coin must be present for at least  16  ms.   After
;that  the coin must go away for eight counts to reset it.  This is because after the first
;five counts a coin is VALID HIGH and must not be reset until VALID LOW occurs  to  prevent
;mid-coin glitches from making a valid coin into 0 or 2 (or more) coins.
;
;The upper three bits count up from zero when the coin is absent.  The count  is  reset  if
;coin  is  ever  found  present.   When  the  count  finally wraps (8 samples, 33 ms).  The
;coin-present counter is checked.  A count from 27-31 (less than 16-20 ms) is too short.  A
;count of 0 (more than 800 ms) is too long.  Both of these cases are simply reset to 31.  A
;count of 1-26 is a (tentatively) valid coin.  The counter is again set to 31, but  another
;counter ($PSTSL) is started.
;
;$PSTSL is the POST-COIN-SLAM timer.  Initially  set  to  120,  it  counts  down  once  per
;interrupt  (4  times per frame) to give a nominal 1/2 second delay.  If the slam switch is
;seen during this time, $PSTSL is cleared, invalidating the coin.  The length of the  delay
;(in  frames)  is  defined by POST which defaults to 30.  It may be set as high as 63 (1.05
;seconds) by definition E.G.
;
;        POST=50         ;POST-SLAM=50 FRAMES
;
;SIMILARY A SLAM IS "REMEMBERED" FOR PRST frames (default=30, max=31) and no  coin  can  be
;"seen" during this time.
;
;Note that the proper initial  state  of  all  these  counters  etc  is  0,  therefore  the
;traditional power-on clear does the trick.  Since coins "transit" from $CNSTT to $PSTSL to
;$CNCT to $$CRDT, locations should be cleared in that order, I.E.   $$CRDT  should  be  the
;last location cleared. ($$CRDT, of course, exists only if MODES=4)


E72A: A2 02    ldx #$02       ;X IS USED TO INDEX FROM RIGHT TO LEFT COIN MECH
E72C: AD 00 78 lda $7800            ;GET COIN SWITCHES
E72F: E0 01    cpx #$01          ;WHICH MECH ARE WE DOING
E731: F0 03    beq $e736     ;MIDDLE (X=OFFSET) SHIFT TWICE
E733: B0 02    bcs $e737     ;RIGHT (X=2*OFFSET) SHIFT ONCE
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
E752: AD 00 78 lda $7800     ;CHECK SLAM SWITCH
E755: 29 08    and #$08
E757: D0 04    bne $e75d
E759: A9 F0    lda #$f0     ;ELSE SET PRE-COIN SLAM TIMER
E75B: 85 DE    sta $de     ;DECR. 8 TIMES/FRAME=PRST FRAMES
E75D: A5 DE    lda $de     ;CHECK PRE-COIN SLAM TIMER
E75F: F0 08    beq $e769
E761: C6 DE    dec $de
E763: A9 00    lda #$00
E765: 95 DB    sta $db, x
E767: 95 D8    sta $d8, x  ;CLEAR POST-COIN SLAM TIMER
E769: 18       clc         ;DEFAULT "NO COIN DETECTED"
E76A: B5 D8    lda $d8, x  ;CHECK POST-COIN SLAM TIMER
E76C: F0 23    beq $e791   ;EMPTY, PROCEED
E76E: D6 D8    dec $d8, x  ;ELSE RUN TIMER
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
; unreached!

E7E7: A5 DF    lda $df                                             
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

; end of file "COIN65.MAC"
; start of file "LOOTS2.MAC"

; this is where the game boots

E83A: 78       sei
E83B: A2 FE    ldx #$fe
E83D: 9A       txs
E83E: A9 00    lda #$00
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
E890: 29 10    and #$10		; service mode?
E892: D0 03    bne $e897
; all tests...
E894: 4C D2 E8 jmp $e8d2
; boots without tests
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
E8C6: AD 73 01 lda $0173    ;DATA OK?
E8C9: 4A       lsr a      ;BIT 0
E8CA: B0 03    bcs $e8cf
E8CC: 20 9E CB jsr $cb9e
E8CF: 4C 00 90 jmp $9000

;SET UP INITIALS AND HIGH SCORE FOR EACH GAME
E8D2: A2 11    ldx #$11   ;BEGINNING PATTERN
E8D4: 9A       txs    ;S HOLDS PATTERN
E8D5: 8A       txa
E8D6: 86 00    stx $00   ;TEST CELL START @ 0
E8D8: A0 00    ldy #$00
E8DA: A2 01    ldx #$01
;SCAN ALL FURLTE BYTES TO
;SEE IF ANY ARE ON AS A
;RESULT OF THIS LOAD

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
E945: 4C FF E9 jmp $e9ff  ;WAIT FOR SWITCH
E948: A2 FF    ldx #$ff
E94A: 9A       txs
E94B: A2 00    ldx #$00
E94D: 8A       txa
E94E: 95 00    sta $00, x		;ZERO ZERO-PAGE
E950: E8       inx
E951: D0 FB    bne $e94e

;
;	VECTOR GEN RAM TEST
;
;
;
;

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
EA04: 85 74    sta $74    ;BAD RAM

;
;	ROM TEST
;

EA06: A9 00    lda #$00
EA08: AA       tax
EA09: 9D 00 01 sta $0100, x
EA0C: 9D 00 02 sta $0200, x
EA0F: 9D 00 03 sta $0300, x		;CLEAR RAM
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
;JUST FINISHED 4K ROMS...........
;MUST NOW DO SPECIAL CASE 2K ROM AT 2800

EA42: A2 FF    ldx #$ff
EA44: A9 28    lda #$28
EA46: 85 22    sta $22
EA48: A9 08    lda #$08   ;ONLY 8 PAGES HERE
EA4A: D0 D2    bne $ea1e
EA4C: A5 6A    lda $6a
EA4E: 05 6B    ora $6b   ;ANY VGROM ERROR?
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
;
; (TEMP2,+1) = SCRATCH
; (PNTTBL,+6) = 7 CHKSUMS FOR ROMS
; (TEMP3)    = DIAG STEP #
; (ERPLC,+3) = ERROR FLAGS FOR:
;	ERPLC:		RAM ERROR
;	ERPLC+1:	POKEY1
;	ERPLC+2:	POKEY2
;	ERPLC+3:	EAROM

; TEST POKEY & EAROM
EA6B: A2 05    ldx #$05
EA6D: AD 0A 60 lda $600a
EA70: CD 0A 60 cmp $600a    ;MAKE SURE ITS RUNNING
EA73: D0 05    bne $ea7a
EA75: CA       dex
EA76: 10 F8    bpl $ea70
EA78: 85 76    sta $76
EA7A: 58       cli
EA7B: 20 FC E4 jsr $e4fc    ;READ EAROM
EA7E: A0 02    ldy #$02    ;DEFAULT GOOD
EA80: AD 73 01 lda $0173   ;ERROR??
EA83: F0 0A    beq $ea8f
EA85: 85 77    sta $77     ;BAD EAROM
EA87: 20 DC E4 jsr $e4dc   ;CLEAR IT IF BAD
EA8A: A0 00    ldy #$00
EA8C: 8C 73 01 sty $0173
EA8F: 84 69    sty $69    ;WHICH STATE FIRST?
EA91: 4C D7 EC jmp $ecd7   ;DO DIAG MAIN LINE
; BAD EAROM RECOVERY
EA94: AD 74 01 lda $0174
EA97: 0D 71 01 ora $0171
EA9A: D0 0C    bne $eaa8
EA9C: 20 FC E4 jsr $e4fc
EA9F: AD 73 01 lda $0173
EAA2: 85 77    sta $77
EAA4: A9 02    lda #$02
EAA6: 85 69    sta $69     ;GO STRAIGHT TO REPORT
EAA8: 60       rts
;REPORT PROBLEMS & DISPLAY SWITCHES
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
EB18: 20 A7 EC jsr $eca7    ;BEEP ON SWITCH CLOSURE
EB1B: 60       rts

; PATTERN TEST & ALPEHBET (TELL A FRIEND)
EB1C: A2 5C    ldx #$5c
EB1E: A9 4B    lda #$4b
EB20: 4C 53 E4 jmp $e453
; HYSTERSIS & SOUND TEST
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
EB40: 99 F0 67 sta $67f0, y    ; ;FAKE POKEY ADDRESS
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

; COLOR BARS
EB7A: A2 8E    ldx #$8e                                            
EB7C: A9 4A    lda #$4a                                            

EB7E: 20 53 E4 jsr $e453
EB81: A0 06    ldy #$06
EB83: 84 23    sty $23
EB85: 20 66 E4 jsr $e466
EB88: A4 23    ldy $23
EB8A: B9 BB EB lda $ebbb, y    ;POSITION THIS GROUP
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
EC17: A9 20    lda #$20     ;RESET NOT PUSHED
EC19: 85 21    sta $21
EC1B: 60       rts

; RASTER TEST
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
; DISPLAY OPTION SWITCHES

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
; SWITCH TEST (BEEP)

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

ED6A:
	.word	$ea94-1    ; $ed6a   ;EAROM ERROR CORRECTION
	.word	$eaa9-1    ; $ed6c   ;DISPLAY SWITCHES & REPORT PROBLEMS
	.word	$eb1c-1    ; $ed6e   ;CROSS HATCH $ ALPHA
	.word	$eb23-1    ; $ed70   ;SOUND & HYSTERSIS
	.word	$ec2a-1    ; $ed72   
	.word	$eb7a-1    ; $ed74   ;COLOR BARS
	.word	$ebcd-1    ; $ed76   ;HATCH



ED78: A6 69    ldx $69
ED7A: E0 0E    cpx #$0e
ED7C: 90 04    bcc $ed82
ED7E: A2 02    ldx #$02
ED80: 86 69    stx $69
ED82: BD 6B ED lda $ed6b, x   ; [jump_table]
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
EDE9: BD F3 ED lda $edf3, x   ; [jump_table]
EDEC: 48       pha
EDED: BD F2 ED lda $edf2, x
EDF0: 48       pha
EDF1: 60       rts

EDF2:
	.word	$edfa-1    ; $edf2
	.word	$edfa-1    ; $edf4
	.word	$edfd-1    ; $edf6
	.word	$ee00-1    ; $edf8
	
EDFA: 4C D8 E4 jmp $e4d8
EDFD: 4C D4 E4 jmp $e4d4
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


;RMULT:	.BYTE 1,4,5,6
;CMTABL: .BYTE 0,2,1,0


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
; end of file "LOOTS2.MAC"
; start of file "LOOSND.MAC"
; seems that $F000 repeats $E000-$EFFF so let's drop that

