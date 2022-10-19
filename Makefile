ifndef TC_NATIVE_OCAML_SWITCH
	TC_NATIVE_OCAML_SWITCH := 4.14
endif

ifndef TC_BASE_VERSION
	TC_BASE_VERSION := v0.14.3
endif


# We should use something more recent, but opam keeps telling me they don't exist
TC_OCAMLFORMAT_VERSION := 0.19.0

build:
	@printf "\n\e[31mBuilding tablecloth-native ...\e[0m\n"
	opam config exec -- dune build
	@printf "\n\e[31mBuilt!\e[0m\n"

watch:
	@printf "\n\e[31mBuilding native...\e[0m\n"
	opam config exec -- dune build --watch

watch-test:
	@printf "\n\e[31mBuilding native...\e[0m\n"
	opam config exec -- dune test --watch

doc:
	@printf "\n\e[31mBuilding native docs ...\e[0m\n"
	opam config exec -- dune build @doc -f
	@printf "\n\e[31mBuilt!\e[0m\n"

.PHONY: test
test:
	@printf "\n\e[31mRunning tablecloth-native tests ...\e[0m\n"
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
	opam install alcotest.1.4.0 base.${TC_BASE_VERSION} dune.2.9.0 junit.2.0.2 junit_alcotest.2.0.2 odoc.1.5.3 -y
	@printf "\n\e[31mInstalled!\e[0m\n"

deps-format:
	@printf "\n\e[31mInstalling formatting dependencies ...\e[0m\n"
	opam update
	opam switch set ${TC_NATIVE_OCAML_SWITCH}
	opam install ocamlformat.${TC_OCAMLFORMAT_VERSION} -y
	@printf "\n\e[31mInstalled!\e[0m\n"

all: deps build test integration-test doc
	@printf "\n\e[31mAll done!\e[0m\n"

.PHONY: check-format format
check-format:
	opam install ocamlformat.0.19.0 -y
	opam config exec -- dune build @fmt

format:
	opam install ocamlformat.0.19.0 -y
	opam config exec -- dune build @fmt --auto-promote
