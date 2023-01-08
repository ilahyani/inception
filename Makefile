all: build up

build:
	@docker-compose -f ./srcs/docker-compose.yml build

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@docker ps -aq | xargs docker rm -f
	@docker images -aq | xargs docker rmi
	@docker volume ls -q | xargs docker volume rm
	@sudo rm -rf /Users/ilahyani/inception/srcs/volumes/wordpress/*
	@sudo rm -rf /Users/ilahyani/inception/srcs/volumes/mariadb/*

fclean: clean
	@docker volume prune -f
	@docker system prune -af

re: clean all