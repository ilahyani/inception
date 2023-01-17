all: up

up:
	@mkdir -p $(HOME)/data/{mariadb,wordpress}
	@docker-compose -f ./srcs/docker-compose.yml up --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean: down
	@docker images -q | xargs docker rmi
	@docker volume ls -q | xargs docker volume rm
	rm -rf $(HOME)/data

re: clean all

fclean: clean
	@docker system prune -af