all: patterns patterns-test network-test

all-nonrandom: patterns-nonrandom patterns-test-nonrandom network-test-nonrandom

nonrandom: patterns-nonrandom network-nonrandom

patterns:
	./generate_patterns.py patterns

patterns-nonrandom:
	./generate_patterns.py -s 42 patterns

patterns-test:
	./generate_patterns.py patterns_test

patterns-test-nonrandom:
	./generate_patterns.py -s 43 patterns_test

patterns-small:
	./generate_patterns.py -n 10 patterns_small

patterns-small-nonrandom:
	./generate_patterns.py -s 42 -n 10 patterns_small

network:
	./neuralnet.py patterns

network-nonrandom:
	./neuralnet.py -s 42 patterns

network-test:
	./neuralnet.py patterns -t patterns_test

network-test-nonrandom:
	./neuralnet.py -s 42 patterns -t patterns_test

cython:
	python build.py build_ext --inplace

clean:
	-rm -f patterns patterns_test patterns_small
	-rm -f *.{pyc,c,so}
	-rm -rf build/
