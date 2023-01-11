all: up

up:
	@docker-compose -f ./srcs/docker-compose.yml up --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@docker ps -aq | xargs docker rm -f
	@docker images -aq | xargs docker rmi
	@docker volume ls -q | xargs docker volume rm
	@echo y | rm -rf /Users/ilahyani/inception/srcs/volumes/wordpress/*
	@echo y | rm -rf /Users/ilahyani/inception/srcs/volumes/mariadb/*

re: clean all

fclean: clean
	@docker system prune -af