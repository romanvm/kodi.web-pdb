SHELL := /bin/bash

.PHONY: frontend-build

frontend-build:
	. ~/.nvm/nvm.sh && cd frontend && npm run build
	cd script.module.web-pdb/libs/web_pdb/static && sha256sum bundle.min.js | tee bundle.min.js.sha256
	cd script.module.web-pdb/libs/web_pdb/static && sha256sum styles.min.css | tee styles.min.css.sha256
