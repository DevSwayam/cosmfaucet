BUF_VERSION:=1.5.0

generate:
	docker run -v $$(pwd):/src -w /src --rm bufbuild/buf:$(BUF_VERSION) generate

lint:
	docker run -v $$(pwd):/src -w /src --rm bufbuild/buf:$(BUF_VERSION) lint
	docker run -v $$(pwd):/src -w /src --rm bufbuild/buf:$(BUF_VERSION) breaking --against 'https://github.com/johanbrandhorst/grpc-gateway-boilerplate.git#branch=master'

.PHONY: generate lint