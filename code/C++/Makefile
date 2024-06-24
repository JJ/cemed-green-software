###############################################################################
CXX=g++
ifeq (/opt/homebrew/bin/g++-14,$(wildcard /opt/homebrew/bin/g++-14*))
    CXX=g++-14
else ifeq (/usr/bin/g++-10,$(wildcard /usr/bin/g++-10*))
    CXX=g++-10
endif

CXXFLAGS = -g -march=native -O3 -std=c++2a -Wall

###############################################################################

SRC = $(wildcard *.cc)
EXE = $(basename $(SRC))
PERF = $(EXE:=.perf)
REP = $(EXE:=.rep)
DAT = $(EXE:=.dat)

###############################################################################

default: $(EXE)

all: $(DAT)

clean:
	$(RM) -rf $(EXE) $(PERF) $(DAT) *.perf.old

chromosomes-gprof:
	$(CXX) -pg chromosomes.cc -o $@

###############################################################################

%.perf: %
	perf record --call-graph dwarf -o $@ ./$<

%.rep: %.perf
	perf report -i $<

%.dat: %
	./$< | tee $@


###############################################################################

.PHONY: all clean default
.NOEXPORT:

###############################################################################

perf-chromosomes:
	perf stat -e power/energy-cores/,power/energy-pkg/,power/energy-psys/ ./chromosomes
