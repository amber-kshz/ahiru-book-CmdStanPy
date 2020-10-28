TAG=amberkshz/ahiru-book:1

.PHONY: build
build:
	docker image build -t $(TAG) --no-cache -f docker/Dockerfile docker

.PHONY: push
push:
	docker push $(TAG)

.PHONY: run
run:
	docker container run -it --rm \
		-p 8888:8888 \
		--mount type=bind,src=`pwd`,dst=/workdir \
		$(TAG)
