.PHONY: test-profiling test-no-profiling build-profiling build-no-profiling run-profiling run-no-profiling clean unsafe-run

BASE_OPTS = --ghc-options -O0
PROFILE_OPTS = $(BASE_OPTS) --profile --ghc-options -fprof-auto-calls

test-profiling:
	stack test $(PROFILE_OPTS)

test-no-profiling:
	stack test $(BASE_OPTS)

build-profiling:
	stack build $(PROFILE_OPTS)

build-no-profiling:
	stack build $(BASE_OPTS)

# Note that we need to use 'stack build --exec' instead of 'stack run' as the latter
# doesn't seem to find the exe built with profiling properly.

run-profiling:
	stack build $(PROFILE_OPTS) --exec haskell-stack-with-rts-callstacks-exe

run-no-profiling:
	stack build $(BASE_OPTS) --exec haskell-stack-with-rts-callstacks-exe

clean:
	stack clean
