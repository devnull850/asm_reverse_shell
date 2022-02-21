all: exe

exe: min
	chmod +x a.out

min: test
	dd if=test of=a.out bs=1 count=120
	dd if=test of=a.out bs=1 skip=4096 seek=120 count=116
	dd if=x of=a.out bs=1 count=1 seek=24 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=8 seek=40 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=6 seek=58 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=8 seek=72 conv=notrunc
	dd if=x of=a.out bs=1 count=1 seek=72 conv=notrunc
	dd if=x of=a.out bs=1 count=1 seek=80 conv=notrunc
	dd if=x of=a.out bs=1 count=1 seek=88 conv=notrunc
	rm test

test: test.o
	ld -T test.ld -o test test.o
	rm test.o

test.o: test.s
	as -o test.o test.s

.PHONY:
clean:
	rm test.o test
