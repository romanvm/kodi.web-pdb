SHELL := /bin/bash

.PHONY: frontend-build

frontend-build:
	. ~/.nvm/nvm.sh && cd frontend && npm run build
