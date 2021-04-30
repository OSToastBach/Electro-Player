; Electro-Player v.1.0 - Oscar C-R/TôBach 2021
; Developed since no other open source Acorn Electron player was available
; This is my first proper 6502 assembly program so it may have a couple problems!

            org &50         ;zeropage variable stuff

.pitch      skip 1
.pointer    skip 1

            org &2000

.start
            lda text,Y      ;start message
            INY
            jsr &FFE3
            cmp #&00
            bne start

            lda #&32        ;enable sound output
            sta &FE07
            
            lda #&30        ;music data pointer start location
            sta pointer+1
            lda #&00
            sta pointer

.loop                       ;this loop fetches the binary file with the music data-
            clc             ;increments the address and then sends it off to the speaker
            lda pointer     ;special thanks to Rytone for help on this one
            adc #&01
            sta pointer
            lda pointer+1
            adc #$00
            sta pointer+1

            lda (pointer),y
            sta pitch       ;final pitch value stored here!

            cmp #&00        ;is pitch value = 0?
            beq wait        ;couldn't figure out how to silence so it just holds the note

            cmp #&FF        ;is pitch value = 255?
            beq reset       ;end of song, reset!

            lda pitch
            sta &FE06       ;store pitch

            jsr delay1      ;wait
            jmp loop

.wait
            jsr delay1
.incx
            inx
            jmp loop
.reset
            jmp (&FFFC)

.delay1                     ;this delay loop was originally for just one second-
            lda #30         ;triggered via vsync, so ~50Hz
            sta &70
.delay2
            jsr &FFF4
            dec &70
            bne delay2
            rts

            org &3000

.music                              ;music in bin format from the converter
            incbin "caramelldansen.bin"     ;replace with your chosen exported song
            EQUB &FF                ;end of song

.text
            EQUS "    Electro-Player v1.0 - ToBach 2021", 0
.end
            save "Main", start, end