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

fclean: clean
	@docker volume prune -f
	@docker system prune -af
	@rm -rf /Users/ilahyani/data/wordpress/*
	@rm -rf /Users/ilahyani/data/mariadb/*

re: fclean all