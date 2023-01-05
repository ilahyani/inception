all: build up

build:
	@docker-compose -f ./srcs/docker-compose.yml build

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@docker ps -aq | xargs docker rm
	@docker images -aq | xargs docker rmi

fclean: clean
	@docker volume prune -f
	@docker system prune -af