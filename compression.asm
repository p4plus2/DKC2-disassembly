;Command set 1 jump table
CODE_BB8000:
	NOP
	JMP CODE_BB8E2A
	
CODE_BB8004:
	NOP
	JMP CODE_BB8E96
	
CODE_BB8008:
	NOP
	JMP CODE_BB8EB4
	
CODE_BB800C:
	NOP
	JMP CODE_BB8EEB
	
CODE_BB8010:
	NOP
	JMP CODE_BB8F26
	
CODE_BB8014:
	NOP
	JMP CODE_BB8F53
	
CODE_BB8018:
	NOP
	JMP CODE_BB8F80
	
CODE_BB801C:
	NOP
	JMP CODE_BB8F9C
	
CODE_BB8020:
	NOP
	JMP CODE_BB8FAE
	
CODE_BB8024:
	NOP
	JMP CODE_BB8FC0
	
CODE_BB8028:
	NOP
	JMP CODE_BB8FFF
	
CODE_BB802C:
	NOP
	JMP CODE_BB9062
	
CODE_BB8030:
	NOP
	JMP CODE_BB90C9
	
CODE_BB8034:
	NOP
	JMP CODE_BB9138
	
CODE_BB8038:
	NOP
	JMP CODE_BB9150
	
CODE_BB803C:
	NOP
	JMP CODE_BB9176

;Command set 2 jump table
CODE_BB8040:
	JMP CODE_BB8E6F
	
CODE_BB8043:
	NOP
	JMP CODE_BB8EAA
	
CODE_BB8047:
	NOP
	JMP CODE_BB8EDB
	
CODE_BB804B:
	NOP
	JMP CODE_BB8F01
	
CODE_BB804F:
	NOP
	JMP CODE_BB8F3B
	
CODE_BB8053:
	NOP
	JMP CODE_BB8F68
	
CODE_BB8057:
	NOP
	JMP CODE_BB8F8E
	
CODE_BB805B:
	NOP
	JMP CODE_BB8FA5
	
CODE_BB805F:
	NOP
	JMP CODE_BB8FB7
	
CODE_BB8063:
	NOP
	JMP CODE_BB8FDE
	
CODE_BB8067:
	NOP
	JMP CODE_BB9029
	
CODE_BB806B:
	NOP
	JMP CODE_BB9097
	
CODE_BB806F:
	NOP
	JMP CODE_BB90F2
	
CODE_BB8073:
	NOP
	JMP CODE_BB9144
	
CODE_BB8077:
	NOP
	JMP CODE_BB9163
	
CODE_BB807B:
	NOP
	JMP CODE_BB9190
	
	
;$38  -- destination
;$34 -- source
;$32 -- run dma after upload (always #$FFFF so never)
;The follow two tables map to the opposite intended nibbles.
;$42 -- index >> 4  (look up table pointer, set low byte and read for value)
;	This table allow direct indexing of low nibbles
;$46 -- (index & 0x0F) << 4 (look up table pointer, set low byte and read for value)
;	This table allow direct indexing of high nibbles
;$4A -- command set starting at $BB8040
;$4E -- command set starting at $BB8000
;These are the 6 header bytes of compressed data
;$52 -- fill byte 1
;$53 -- fill byte 2
;$56 -- direct byte 1
;$57 -- direct byte 2
;$54 -- direct word
;Misc addresses
;$3C -- operand 1 (usually count)
;$3E -- operand 2 (usually offset)

;Extra notes
;All commands are return addresses - 1 so RTS can be used
	
CODE_BB8D91:			;
	STA $38			;\ Set decompression parameters
	LDA #$007F		; |
	STA $3A			; |
	STX $34			; |
	STY $36			; |
	BRA CODE_BB8DAE		;/
				;
CODE_BB8D9E:			;
	TXA			;\ Set decompression parameters
	TYX			; |
	STA $34			; |
	STX $36			; |
	LDA #$0000		; | Default destination $7F0000
	STA $38			; |
	LDA #$007F		; |
	STA $3A			;/
CODE_BB8DAE:			;
	LDA #$FFFF		;\ Disble auto DMA of data
	STA $32			;/
	PHB			;\ Preserve call bank/Y
	PHY			;/
	LDA #$2100		;\ Setup pointers to nibble look up tables
	STA $46			; |
	LDA #$007E		; |
	STA $48			; |
	STA $44			; |
	LDA #$2000		; |
	STA $42			;/
	JSL CODE_BB91AF		; Generate nibble offset table at RAM $7E2000
	LDX $38			; Load the decompression index
	LDY #$0001		; Load the compression index
	LDA #$8001		;\ Load default decompression function A 8001
	STA $4E			;/ The high byte will never change.
	LDA #$8040		;\ Load default decompression function B 8040
	STA $4A			;/
	SEP #$20		;
	LDA $3A			;\ Set the data bank to the destination bank 
	PHA			; |
	PLB			;/
	LDA [$34],y		;\ Read fill byte 1
	STA $52			; |
	INY			;/
	LDA [$34],y		;\ Read fill byte 2
	STA $53			; |
	INY			;/
	LDA [$34],y		;\ Read direct byte 1
	STA $56			; |
	INY			;/
	LDA [$34],y		;\ Read direct byte 2
	STA $57			; |
	INY			;/
	REP #$20		;\ Read direct word
	LDA [$34],y		; |
	STA $54			;/
	LDY #$0027		; Skip to compressed byte #$27
	STZ $3C			;\ Clear generic operand 1
	STZ $3E			;/ Clean generic operand 2
	SEP #$20		; Return to 8 bit
CODE_BB8E02:			;
	LDA [$34],y		;\ Read the first command byte
	INY			; |
	STA $46			;/
	AND #$F0		;\ Command = (byte & 0xF0) >> 2
	LSR A			; | Range $00-$3C
	LSR A			; |
	STA $4E			;/
	PEI ($4E)		;\ Push and execute command
	RTS			;/
				;
CODE_BB8E10:			;
	LDA $46			; Read next command byte
	AND #$0F		;\ Command = (byte & 0xF0) >> 2
	ASL A			; | Range $3F-$7B
	ASL A			; |
	ADC #$3F		;/
	STA $4A			;
	PEI ($4A)		;\ Push and execute command
	RTS			;/
				;
CODE_BB8E1D:			;
	LDA $42			; Read next command byte
	AND #$0F		;\ Command = (byte & 0xF0) >> 2
	ASL A			; | Range $3F-$7B
	ASL A			; |
	ADC #$3F		; |
	STA $4A			;/
	PEI ($4A)		;\ Push and execute command
	RTS			;/
				;
CODE_BB8E2A:			;
	LDA $46			;\ Read number of bytes to copy
	AND #$0F		; |
	BEQ CODE_BB8E40		;/ If zero bytes, conclude decompression
	STA $3C			; Store number of bytes to copy
CODE_BB8E32:			;
	LDA [$34],y		;\ Direct copy of up to 16 bytes
	INY			; |
	STA $0000,x		; |
	INX			; |
	DEC $3C			; |
	BNE CODE_BB8E32		;/
	JMP CODE_BB8E02		; Read new command
				;
CODE_BB8E40:			;
	REP #$20		;\ Restore 16 bit A, data bank and Y
	PLY			; |
	PLB			;/
	TXA			;\ Calculate the number of decompressed bytes (stored in X)
	SEC			; | X = X - destination (Where X as an operand is the destination offset)
	SBC $38			; |
	TAX			;/
	LDA $32			;\ Check if DMA should run
	BMI CODE_BB8E6E		;/
	LDA $58			;\ This would be a be a DMA to VRAM
	STA $2116		; | However $32 is a constant and will always be skipped (0xFFFF)
	LDA $38			; |
	STA $4302		; |
	LDA $3A			; |
	STA $4304		; |
	STX $4305		; |
	LDA #$1801		; |
	STA $4300		; |
	SEP #$20		; |
	LDA #$01		; |
	STA $420B		; |
	REP #$20		;/
CODE_BB8E6E:			;
	RTL			; Done with decompression
				;
CODE_BB8E6F:			;
	LDA [$34],y		;\ Load next operand
	INY			;/
	STA $42			;\ Store in nibble lookup tables
	STA $46			;/
	LDA [$42]		;\ Load number of bytes to write
	BEQ CODE_BB8E40		; | If zero bytes, conclude decompression
	STA $3C			;/ Store number of bytes to write
CODE_BB8E7C:			;
	LDA [$46]		;\ operand2 = high byte
	STA $3E			;/
	LDA [$34],y		;\ Load next operand
	INY			;/
	STA $42			;\ Store in nibble lookup tables
	STA $46			;/
	LDA $3E			; Load operand2
	ORA [$42]		;\ write operand2 | low nibble
	STA $0000,x		;/
	INX			;\ Continue until no there are no more bytes
	DEC $3C			; |
	BNE CODE_BB8E7C		;/
	JMP CODE_BB8E10		; Run next command
				;
CODE_BB8E96:			;
	LDA [$46]		;\ Load operand high nibble
	STA $3E			;/
	LDA [$34],y		;\ Load next operand
	INY			; |
	STA $42			;/
	LDA $3E			; Load operand high nibble
	ORA [$42]		;\ write high nibble | low nibble
	STA $0000,x		; |
	INX			;/
	JMP CODE_BB8E1D		; Run next command
				;
CODE_BB8EAA:			;
	LDA [$34],y		;\ Copy one byte from the compression stream
	INY			; |
	STA $0000,x		; |
	INX			;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB8EB4:			;
	LDA [$46]		;\ Load operand high nibble into operand2
	STA $3E			;/
	LDA [$34],y		;\ Load next operand
	INY			;/
	STA $42			;\ Store in nibble lookup tables
	STA $46			;/
	LDA $3E			; Load operand2
	ORA [$42]		;\  write operand2 | low nibble
	STA $0000,x		; |
	INX			;/
	LDA [$46]		;\ Load operand high nibble into operand2
	STA $3E			;/
	LDA [$34],y		;\ Load next operand
	INY			;/
	STA $42			; Store in low nibble lookup table
	LDA $3E			; Load operand2 
	ORA [$42]		;\  write operand2 | low nibble
	STA $0000,x		; |
	INX			;/
	JMP CODE_BB8E1D		; Run next command
				;
CODE_BB8EDB:			;
	REP #$20		;\ Copy one word from the compression stream
	LDA [$34],y		; |
	STA $0000,x		; |
	INY			; |
	INY			; |
	INX			; |
	INX			; |
	SEP #$20		;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB8EEB:			;
	LDA $46			;\ Load operand
	AND #$0F		; | Count = operand & 0x0F + 3
	ADC #$03		; |
	STA $3C			;/
	LDA [$34],y		;\  Load fill byte
	INY			;/
CODE_BB8EF6:			;
	STA $0000,x		;\ Store and repeat with fill byte.
	INX			; |
	DEC $3C			; |
	BNE CODE_BB8EF6		;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB8F01:			;
	LDA [$34],y		;\ Load next operand 
	INY			;/
	STA $42			;\ Store in nibble lookup tables
	STA $46			;/
	LDA [$42]		;\ Count = low nibble + 3
	ADC #$03		; |
	STA $3C			;/
	LDA [$46]		;\ Operand2 = high nibble
	STA $3E			;/
	LDA [$34],y		;\ Load next operand
	INY			; |
	STA $42			;/ Store low nibble look up
	LDA $3E			;\ Load operand2
	ORA [$42]		;/ fill byte =  operand2 | low nibble 
CODE_BB8F1B:			;
	STA $0000,x		;\ Store and repeat with fill byte.
	INX			; |
	DEC $3C			; |
	BNE CODE_BB8F1B		;/
	JMP CODE_BB8E1D		; Run next command
				;
CODE_BB8F26:			;
	LDA $46			;\ Load operand
	AND #$0F		; | Count = operand & 0x0F + 3
	ADC #$03		; |
	STA $3C			;/
	LDA $52			; Load fill byte 1
CODE_BB8F30:			;
	STA $0000,x		;\ Store and repeat with fill byte.
	INX			; |
	DEC $3C			; |
	BNE CODE_BB8F30		;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB8F3B:			;
	LDA [$34],y		;\ Load next operand
	INY			; |
	STA $42			;/ Store in low nibble lookup
	LDA [$42]		;\ Count = low nibble + 3
	ADC #$03		; |
	STA $3C			;/
	LDA $52			; Load fill byte 1
CODE_BB8F48:			;
	STA $0000,x		;\ Store and repeat with fill byte.
	INX			; |
	DEC $3C			; |
	BNE CODE_BB8F48		;/
	JMP CODE_BB8E1D		; Run next command
				;
CODE_BB8F53:			;
	LDA $46			;\  Load operand
	AND #$0F		; | Count = (operand & 0x0F) + 3
	ADC #$03		; |
	STA $3C			;/
	LDA $53			; Load fill byte 2
CODE_BB8F5D:			;
	STA $0000,x		;\ Store and repeat with fill byte.
	INX			; |
	DEC $3C			; |
	BNE CODE_BB8F5D		;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB8F68:			;
	LDA [$34],y		;\ Load next operand
	INY			; |
	STA $42			;/ Store in low nibble lookup
	LDA [$42]		;\ Count = low nibble + 3
	ADC #$03		; |
	STA $3C			;/
	LDA $53			; Load fill byte 2
CODE_BB8F75:			;
	STA $0000,x		;\ Store and repeat with fill byte.
	INX			; |
	DEC $3C			; |
	BNE CODE_BB8F75		;/
	JMP CODE_BB8E1D		; Run next command
				;
CODE_BB8F80:			;
	REP #$20		;\ Store direct word
	LDA $54			; |
	STA $0000,x		; |
	INX			; |
	INX			; |
	SEP #$20		;/
	JMP CODE_BB8E10		; Run next command
				;
CODE_BB8F8E:			;
	REP #$20		;\ Store direct word
	LDA $54			; |
	STA $0000,x		; |
	INX			; |
	INX			; |
	SEP #$20		;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB8F9C:			;
	LDA $56			;\ Store direct byte 1
	STA $0000,x		; |
	INX			;/
	JMP CODE_BB8E10		; Run next command
				;
CODE_BB8FA5:			;
	LDA $56			;\ Store direct byte 1
	STA $0000,x		; |
	INX			;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB8FAE:			;
	LDA $57			;\ Store direct byte 2
	STA $0000,x		; |
	INX			;/
	JMP CODE_BB8E10		; Run next command
				;
CODE_BB8FB7:			;
	LDA $57			;\ Store direct byte 2
	STA $0000,x		; |
	INX			;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB8FC0:			;
	PHY			; Preserve compression index
	LDA $46			; Load operand
	AND #$0F		;\  Offset = (operand & 0x0F) + 2
	ADC #$02		; |
	STA $3E			;/
	REP #$20		;\ Prepare to copy (1 word) from a previous point in decompressed data
	TXA			; | The new offset is stored in Y
	SEC			; | Y = X - offset
	SBC $3E			; |
	TAY			;/
	LDA $0000,y		;\ Copy from previous data
	STA $0000,x		; |
	INX			; |
	INX			;/
	SEP #$20		; Return to 8 bit A
	PLY			; Restore compression index
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB8FDE:			;
	LDA [$34],y		;\ Load next operand
	INY			; |
	STA $42			;/
	LDA [$42]		;\  Offset = low nibble + 2
	ADC #$02		; |
	STA $3E			;/
	PHY			; Preserve compression index
	REP #$20		;\ Prepare to copy (1 word) from a previous point in decompressed data
	TXA			; | The new offset is stored in Y
	SEC			; | Y = X - offset
	SBC $3E			; |
	TAY			;/
	LDA $0000,y		;\ Copy from previous data
	STA $0000,x		; |
	INX			; |
	INX			;/
	SEP #$20		; Return to 8 bit A
	PLY			; Restore compression index
	JMP CODE_BB8E1D		; Run next command
				;
CODE_BB8FFF:			;
	LDA $46			; Load next operand
	AND #$0F		;\  Count = (operand & 0x0F) + 3
	ADC #$03		; |
	STA $3C			;/
	LDA [$34],y		;\ Load next operand
	STA $3E			; |
	INY			;/
	PHY			; Preserve compression index
	REP #$20		;\ Prepare to copy from a previous point in decompressed data
	TXA			; | The new offset is stored in Y
	SEC			; | Y = X - count - offset
	SBC $3C			; |
	SEC			; |
	SBC $3E			; |
	TAY			;/
	SEP #$20		; Back to 8 bit A
CODE_BB9019:			;
	LDA $0000,y		;\ Copy from previous data
	INY			; |
	STA $0000,x		; |
	INX			;/
	DEC $3C			;\ Copy count number of bytes
	BNE CODE_BB9019		;/
	PLY			; Restore compression index
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB9029:			;
	LDA [$34],y		;\ Load next operand
	INY			;/
	STA $42			;\ Store in nibble look up tables
	STA $46			;/
	LDA [$42]		;\ Count = low nibble + 3
	ADC #$03		; |
	STA $3C			;/
	LDA [$46]		;\ Store high nibble in offset 
	STA $3E			;/
	LDA [$34],y		;\ Load next operand and store in the low nibble lookup
	INY			; |
	STA $42			;/
	LDA [$42]		;\ offset = low nibble | offset
	ORA $3E			; |
	STA $3E			;/
	PHY			; Preserve compression index
	REP #$20		;\ Prepare to copy from a previous point in decompressed data
	TXA			; | The new offset is stored in Y
	SEC			; | Y = X - count - offset
	SBC $3C			; |
	SEC			; |
	SBC $3E			; |
	TAY			;/
	SEP #$20		; Back to 8 bit A
CODE_BB9052:			;
	LDA $0000,y		;\ Copy from previous data
	INY			; |
	STA $0000,x		; |
	INX			;/
	DEC $3C			;\ Copy count number of bytes
	BNE CODE_BB9052		;/
	PLY			; Restore compression index
	JMP CODE_BB8E1D		; Run next command
				;
CODE_BB9062:			;
	LDA $46			; Load next operand
	AND #$0F		;\  Count = (operand & 0x0F) + 3
	ADC #$03		; |
	STA $3C			;/
	LDA [$34],y		;\ Load next operand 
	INY			; |
	XBA			;/ Store as high byte for the full operand
	LDA [$34],y		;\ Load next operand store in high byte look up
	INY			; |
	STA $46			;/
	REP #$20		; Switch to 16 bit A
	LSR A			;\ Offset = (operand >> 4) + 0x0103
	LSR A			; |
	LSR A			; |
	LSR A			; |
	CLC			; | 
	ADC #$0103		; |
	STA $40			;/
	PHY			; Preserve compression index
	TXA			;\ Prepare to copy from a previous point in decompressed data
	SEC			; | Y = X - offset
	SBC $40			; |
	TAY			;/
	SEP #$20		; Back to 8 bit A
CODE_BB9087:			;
	LDA $0000,y		;\ Copy from previous data
	INY			; |
	STA $0000,x		; |
	INX			;/
	DEC $3C			;\ Copy count number of bytes
	BNE CODE_BB9087		;/
	PLY			; Restore compression index
	JMP CODE_BB8E10		; Run next command
				;
CODE_BB9097:			;
	LDA [$34],y		;\ Load next operand
	INY			; |
	STA $42			;/ Store in low nibble look up table
	LDA [$42]		;\ Count = low nibble + 3
	ADC #$03		; | 
	STA $3C			;/
	LDA $42			;\ Copy the low nibble to the operand high byte
	AND #$0F		; |
	XBA			;/
	LDA [$34],y		;\ Load the operand low byte
	INY			;/
	REP #$20		;\ Offset = operand + 0x0103
	ADC #$0103		; |
	STA $40			;/
	PHY			; Preserve compression index
	TXA			;\ Prepare to copy from a previous point in decompressed data
	SEC			; | Y = X - offset
	SBC $40			; |
	TAY			;/
	SEP #$20		; Back to 8 bit A
CODE_BB90B9:			;
	LDA $0000,y		;\ Copy from previous data
	INY			; |
	STA $0000,x		; |
	INX			;/
	DEC $3C			;\ Copy count number of bytes
	BNE CODE_BB90B9		;/
	PLY			; Restore compression index
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB90C9:			;
	LDA $46			; Load next operand
	AND #$0F		;\  Count = (operand & 0x0F) + 3
	ADC #$03		; |
	STA $3C			;/
	REP #$20		;\ Read a big endian word for the offset
	LDA [$34],y		; |
	XBA			; |
	STA $40			;/
	INY			;\ Increment the compression index
	INY			;/
	PHY			; Preserve compression index
	TXA			;\ Prepare to copy from a previous point in decompressed data
	SEC			; | Y = X - offset
	SBC $40			; |
	TAY			;/
	SEP #$20		; Back to 8 bit A
CODE_BB90E2:			;
	LDA $0000,y		;\ Copy from previous data
	INY			; |
	STA $0000,x		; |
	INX			;/
	DEC $3C			;\ Copy count number of bytes
	BNE CODE_BB90E2		;/
	PLY			; Restore compression index
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB90F2:			;
	LDA [$34],y		;\ Load next operand
	INY			; |
	STA $42			;/ Store in low nibble look up table
	LDA [$42]		;\ Count = low nibble + 3
	ADC #$03		; | 
	STA $3C			;/
	LDA $42			;\ Copy as the operand high byte
	XBA			;/
	LDA [$34],y		;\ Load the operand low byte
	INY			;/
	REP #$20		; Set A to 16 bit
	ASL A			;\ Offset = (operand << 4)
	ASL A			; |
	ASL A			; |
	ASL A			; |
	STA $40			;/
	AND #$00FF		; Clear the high byte of the offset
	SEP #$20		; Resume 8 bit A
	LDA [$34],y		;\ Load next operand
	INY			;/
	PHY			; Preserve compression index
	STA $42			; Store the operand in the low nibble look up table
	LDA [$42]		;\ Load low nibble
	REP #$20		; |
	AND #$000F		;/
	ORA $40			;\ offset = offset | low nibble
	STA $40			;/
	TXA			;\ Prepare to copy from a previous point in decompressed data
	SEC			; | Y = X - offset
	SBC $40			; |
	TAY			;/
	SEP #$20		; Back to 8 bit A
CODE_BB9128:			;
	LDA $0000,y		;\ Copy from previous data
	INY			; |
	STA $0000,x		; |
	INX			;/
	DEC $3C			;\ Copy count number of bytes
	BNE CODE_BB9128		;/
	PLY			; Restore compression index
	JMP CODE_BB8E1D		; Run next command Run next command
				;
CODE_BB9138:			;
	DEX			;\ Copy previous byte to the decompression stream
	LDA $0000,x		; |
	STA $0001,x		; |
	INX			; |
	INX			;/
	JMP CODE_BB8E10		; Run next command
				;
CODE_BB9144:			;
	DEX			;\ Copy previous byte to the decompression stream
	LDA $0000,x		; |
	STA $0001,x		; |
	INX			; |
	INX			;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB9150:			;
	REP #$20		;\ Copy the previous word to the decompression stream
	DEX			; |
	DEX			; | First go back two bytes
	LDA $0000,x		; |
	STA $0002,x		; |
	SEP #$20		; |
	INX			; | Then jump ahead four bytes
	INX			; |
	INX			; |
	INX			;/
	JMP CODE_BB8E10		; Run next command
				;
CODE_BB9163:			;
	REP #$20		;\ Copy the previous word to the decompression stream
	DEX			; |
	DEX			; | First go back two bytes
	LDA $0000,x		; |
	STA $0002,x		; |
	SEP #$20		; |
	INX			; | Then jump ahead four bytes
	INX			; |
	INX			; |
	INX			;/
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB9176:			;
	PHY			; Preserve compression index
	LDA $46			; Load next operand
	REP #$20		; Set A to 16 bit
	AND #$000F		;\ Y = (operand << 1) + 7
	ASL A			; |
	ADC #$0007		; |
	TAY			;/
	LDA [$34],y		;\ Copy word from compression stream to the decompression stream
	STA $0000,x		;/
	SEP #$20		;\ Return to 8 bit A and increment the decompression index
	INX			; |
	INX			;/
	PLY			; Restore compression index
	JMP CODE_BB8E02		; Run next command
				;
CODE_BB9190:			;
	LDA [$34],y		;\ Load next operand
	INY			; |
	STA $46			;/ Store to high nibble look up table
	REP #$20		; Set A to 16 bit
	AND #$00F0		;\ Operand = operand >> 3
	LSR A			; |
	LSR A			; |
	LSR A			;/
	PHY			; Preserve compression index
	ADC #$0007		;\ Y = operand + 7
	TAY			;/
	LDA [$34],y		;\ Copy word from compression stream to the decompression stream
	STA $0000,x		;/
	SEP #$20		;\ Return to 8 bit A and increment the decompression index
	INX			; |
	INX			;/
	PLY			; Restore compression index
	JMP CODE_BB8E10		; Run next command
				;
CODE_BB91AF:			;
	LDY #$0100		; Prepare to generate the high nibble table
	TDC			;\ Zero A and X and set 8 bit A
	TAX			; |
	SEP #$20		;/
CODE_BB91B6:			;
	STA $7E2100,x		;\ Store look up value (index & 0x0F) << 4
	CLC			; |
	ADC #$10		; |
	AND #$F0		;/
	INX			;\ Loop through all 256 values
	DEY			; |
	BNE CODE_BB91B6		;/
	LDY #$0100		; Prepare to generate the low nibble table
	LDX #$0000		;
CODE_BB91C9:			;
	TXA			;\ Store look up value (index >> 4)
	LSR A			; |
	LSR A			; |
	LSR A			; |
	LSR A			; |
	STA $7E2000,x		;/
	INX			;\ Loop through all 256 values
	DEY			; |
	BNE CODE_BB91C9		;/
	REP #$20		; Return to 16 bit A
	RTL			; Done
