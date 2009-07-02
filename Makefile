prefix = /usr/local

build/apt-why.1: bin/apt-why
	mkdir -p build
	pod2man $< > $@

install: build/apt-why.1
	mkdir -p $(prefix)/bin $(prefix)/share/man/man1
	cp bin/apt-why $(prefix)/bin
	cp build/apt-why.1 $(prefix)/share/man/man1
	chmod 755 $(prefix)/bin/apt-why
	chmod 644 $(prefix)/share/man/man1/apt-why.1

install-completion:
	mkdir -p $(prefix)/share/zsh/site-functions
	cp provides/zsh/completions/_apt-why $(prefix)/share/zsh/site-functions
	chmod 644 $(prefix)/share/zsh/site-functions/_apt-why

clean:
	rm -rf build

uninstall:
	rm -f $(prefix)/bin/apt-why
	rm -f $(prefix)/share/man/man1/apt-why.1

uninstall-completion:
	rm -f $(prefix)/share/zsh/site-functions/_apt-why
