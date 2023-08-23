
NAME = Inception

VOLUME_PATH :=  /home/junoh/data

all: fclean up

up:
	@mkdir -p $(VOLUME_PATH)/wordpress
	@mkdir -p $(VOLUME_PATH)/mariadb
	@sudo chmod 647 /etc/hosts
	@echo "127.0.0.1	junoh.42.fr" > /etc/hosts
	@sudo chmod 644 /etc/hosts
	@docker compose -f ./srcs/docker-compose.yml up --build -d;
	@echo ">>> docker compose up"

.PHONY: up

down:
	@docker compose -f ./srcs/docker-compose.yml down;
	@echo ">>> docker compose down"
.PHONY: down

clean: 
	@docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	@echo ">>> docker stop and remove volume, networks and caches"
.PHONY: stop

fclean: clean
#	@rm -rf ./srcs/requirements/tools/mariadb/*
#	@rm -rf ./srcs/requirements/tools/wordpress/*
	@sudo rm -rf $(VOLUME_PATH)/mariadb
	@sudo rm -rf $(VOLUME_PATH)/wordpress
	@echo ">>> remove your volume files"
# .PHONY: fclean
# remove files from the volumes (you need to fill it)
# you need to change directory!!! to /home/data/
