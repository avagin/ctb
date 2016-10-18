NUMBERS := $(shell seq 10 20)

run:
	unshare -Urm sh ./run.sh 30

iter:
	$(foreach i,$(NUMBERS),unshare -Urm sh ./run.sh $(i);)
