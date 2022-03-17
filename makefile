# This file will run / install
# components for this project

.PHONY: run stop install shell

run:
	docker-compose up --build -d

stop:
	docker-compose down

install:
	mkdir -p ~/.local/bin
	cp scripts/i2p ~/.local/bin/
	chmod +x ~/.local/bin/i2p

shell:
	scripts/i2p