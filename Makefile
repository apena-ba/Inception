
all:
	docker-compose -f ./srcs/docker-compose.yml up --build

clean:
	/docker-clean.sh

fclean:
	/docker-clean.sh -r

re: fclean all

.PHONY: all clean fclean re
