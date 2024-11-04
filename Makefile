AS = ca65
CC = cc65
LD = ld65

.PHONY: clean
build: smb2j-mmc1.nes

%.o: %.asm
	$(AS) --create-dep "$@.dep" -g --debug-info $< -o $@

smb2j-mmc1.nes: layout sm2main.o
	$(LD) --dbgfile $@.dbg -C layout sm2main.o -o $@

clean:
	rm -f smb2j-mmc1*.nes *.o *.o.bin *.o.dep *.nes.dbg

include $(wildcard ./*.dep)
