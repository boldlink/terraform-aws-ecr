CURRENT_DIR = $(shell pwd)
EXAMPLES_PATH = $(CURRENT_DIR)/examples/*
SUBDIRS := $(shell find $(EXAMPLES_PATH) -maxdepth 0 -type d)

.PHONY: all


tfinit:
	for folder in $(SUBDIRS) ; do \
		echo "[info]: Initialising $$folder stack" ;\
		cd $$folder ;\
		terraform init ;\
	done

tfplan:
	for folder in $(SUBDIRS) ; do \
		echo "[info]: Plan for $$folder stack" ;\
		cd $$folder ;\
		terraform plan ;\
	done

tfapply:
	for folder in $(SUBDIRS) ; do \
		echo "[info]: Creating $$folder stack" ;\
		cd $$folder ;\
		terraform plan --out=plan.tmp ;\
		terraform apply plan.tmp ;\
		rm plan.tmp ;\
	done

tfdestroy:
	for folder in $(SUBDIRS) ; do \
		echo "[info]: Destroying $$folder stack" ;\
		cd $$folder ;\
		terraform destroy --auto-approve ;\
	done

tfclean:
	for folder in $(SUBDIRS) ; do \
		echo "[info]: Cleaning $$folder tests" ;\
		rm -rf $$folder/.terraform* ;\
	done

tests: tfinit tfapply

clean: tfdestroy tfclean
