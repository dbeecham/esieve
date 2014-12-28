esieve: esieve.hs
	ghc esieve.hs -o esieve -O2

clean:
	rm esieve.hi esieve.o

distclean:
	rm esieve esieve.hi esieve.o

install:
	cp esieve /usr/local/bin
	
uninstall:
	rm /usr/local/bin/esieve
