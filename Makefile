prefix = /usr/local

build/apt-why.1: bin/apt-why
	mkdir -p build
	pod2man $< > $@

test:
	prove test

install: build/apt-why.1
	mkdir -p $(prefix)/bin $(prefix)/share/man/man1
	cp bin/apt-why $(prefix)/bin
	cp build/apt-why.1 $(prefix)/share/man/man1
	chmod 755 $(prefix)/bin/apt-why
	chmod 644 $(prefix)/share/man/man1/apt-why.1

clean:
	rm -rf build

uninstall:
	rm -f $(prefix)/bin/apt-why
	rm -f $(prefix)/share/man/man1/apt-why.1

.PHONY: clean install test uninstall
