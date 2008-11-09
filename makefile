build/apt-why.1: bin/apt-why
	mkdir -p build
	pod2man $< > $@

install:
	install -m 755 bin/apt-why /usr/local/bin
	install -m 644 -D build/apt-why.1 /usr/local/share/man/man1/apt-why.1

clean:
	$(RM) -r build

uninstall:
	$(RM) /usr/local/bin/apt-why
	$(RM) /usr/local/share/man/man1/apt-why.1
