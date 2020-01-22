.PHONY: test-profiling test-no-profiling build-profiling build-no-profiling run-profiling run-no-profiling clean unsafe-run

BASE_OPTS = --ghc-options -O0
PROFILE_OPTS = $(BASE_OPTS) --profile --ghc-options -fprof-auto-calls

test-profiling:
	stack test $(PROFILE_OPTS)

test-no-profiling:
	stack test $(BASE_OPTS)

run-profiling: build-profiling unsafe-run

run-no-profiling: build-no-profiling unsafe-run

# Because of weirdness with stack exec, better to just clean beforehand.

build-profiling: clean
	stack build $(PROFILE_OPTS)

build-no-profiling: clean
	stack build $(BASE_OPTS) $(PROFILE_OPTS)

# I don't know why this doesn't work
# stack exec haskell-stack-with-rts-callstacks-exe

unsafe-run:
	find \
          $(PWD)/.stack-work/install/*/*/8.6.5/bin/haskell-stack-with-rts-callstacks-exe \
	  -exec {} \;

clean:
	stack clean
