
all:
	@echo "type 'make alpha10' or 'make c557715'"
alpha10:
	./composer.alpha10 -V
	./composer.alpha10 install

c557715:
	./composer.c557715 -V
	./composer.c557715 install

clean:
	rm -f composer.lock
	rm -rf vendor
