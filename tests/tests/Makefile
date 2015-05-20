SHELL := /bin/bash

CLANG=../llvm-analysis-version/bin/Release+Asserts/bin/clang
LBG_ANALYZE=../analyze/lbg-analyze
N=1
NLIST=$(shell seq -s " " 1 $(N))
BCLIST=$(NLIST:%=%.bc)
TESTLIST=$(NLIST:%=%.ltest)

test: $(TESTLIST)
	@echo -e "\e[1;32mRegression tests passed.\e[0m"
compile: $(BCLIST)

%.bc: %.c
	@echo "clang -g -c -O3 -emit-llvm -o $@ $^"
	@$(CLANG) -g -c -O3 -emit-llvm -o $@ $^

%.ltest: %.bc
	@echo "lbg-analyze -no-verbose $^ > $@"
	@$(LBG_ANALYZE) -no-verbose $^ > $@
	@diff $@ $@.ok

clean:
	rm -f *.bc *.ltest
