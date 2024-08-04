ifndef TC_NATIVE_OCAML_SWITCH
	TC_NATIVE_OCAML_SWITCH := 4.14
endif

ifndef TC_BASE_VERSION
	TC_BASE_VERSION := v0.15.1
endif


# We should use something more recent, but opam keeps telling me they don't exist
TC_OCAMLFORMAT_VERSION := 0.20.1

build:
	@printf "\n\e[31mBuilding tablecloth-base ...\e[0m\n"
	opam config exec -- dune build
	@printf "\n\e[31mBuilt!\e[0m\n"

watch:
	@printf "\n\e[31mBuilding native...\e[0m\n"
	opam config exec -- dune build --watch

watch-test:
	@printf "\n\e[31mBuilding native...\e[0m\n"
	opam config exec -- dune test --watch

.PHONY: test
test:
	@printf "\n\e[31mRunning tablecloth-base tests ...\e[0m\n"
	opam config exec -- dune runtest -f
	@printf "\n\e[31mTested!\e[0m\n"

.PHONY: integration-test
integration-test:
	echo -e "\n\e[31mBuilding native integration test\e[0m"
	cd integration-test;\
		dune build main.exe;\
		echo -e "\n\e[31mRunning compiled file\e[0m";\
		../_build/default/integration-test/main.exe

deps:
	@printf "\n\e[31mInstalling native dependencies ...\e[0m\n"
	opam update
	opam switch set ${TC_NATIVE_OCAML_SWITCH}
	opam install alcotest.1.4.0 base.${TC_BASE_VERSION} dune.2.9.1 junit.2.0.2 junit_alcotest.2.0.2 odoc.2.1.1 -y
	@printf "\n\e[31mInstalled!\e[0m\n"

deps-format:
	@printf "\n\e[31mInstalling formatting dependencies ...\e[0m\n"
	opam update
	opam switch set ${TC_NATIVE_OCAML_SWITCH}
	opam install ocamlformat.${TC_OCAMLFORMAT_VERSION} -y
	@printf "\n\e[31mInstalled!\e[0m\n"

all: deps build test integration-test
	@printf "\n\e[31mAll done!\e[0m\n"

.PHONY: check-format format
check-format:
	opam config exec -- dune build @fmt

format:
	opam config exec -- dune build @fmt --auto-promote
