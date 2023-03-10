all: up

up:
	@docker-compose -f ./srcs/docker-compose.yml up --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@docker images -q | xargs docker rmi
	@docker volume ls -q | xargs docker volume rm
	@rm -rf ~/data/wordpress/*
	@rm -rf ~/data/mariadb/*

re: clean all

fclean: clean
	@docker system prune -af