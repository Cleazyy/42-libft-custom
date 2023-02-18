# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fluchten <fluchten@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/06 15:03:07 by fluchten          #+#    #+#              #
#    Updated: 2023/02/18 16:26:20 by fluchten         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = rm -rf

INC_DIR = includes
SRCS_DIR = srcs
OBJS_DIR = objs

SRCS = 	allocate/ft_bzero.c \
		allocate/ft_calloc.c \
		character/ft_putchar_fd.c \
		character/ft_putchar.c \
		checkers/ft_isalnum.c \
		checkers/ft_isalpha.c \
		checkers/ft_isascii.c \
		checkers/ft_isdigit.c \
		checkers/ft_isprint.c \
		checkers/ft_tolower.c \
		checkers/ft_toupper.c \
		converters/ft_atoi.c \
		converters/ft_itoa.c \
		converters/ft_split.c \
		fd/ft_putendl_fd.c \
		fd/ft_putnbr_fd.c \
		fd/ft_putstr_fd.c \
		lst/ft_lstadd_back.c \
		lst/ft_lstadd_front.c \
		lst/ft_lstclear.c \
		lst/ft_lstdelone.c \
		lst/ft_lstiter.c \
		lst/ft_lstlast.c \
		lst/ft_lstmap.c \
		lst/ft_lstnew.c \
		lst/ft_lstsize.c \
		mem/ft_memchr.c \
		mem/ft_memcmp.c \
		mem/ft_memcpy.c \
		mem/ft_memmove.c \
		mem/ft_memset.c \
		string/ft_strchr.c \
		string/ft_strdup.c \
		string/ft_striteri.c \
		string/ft_strjoin.c \
		string/ft_strlcat.c \
		string/ft_strlcpy.c \
		string/ft_strlen.c \
		string/ft_strmapi.c \
		string/ft_strncmp.c \
		string/ft_strnstr.c \
		string/ft_strrchr.c \
		string/ft_strtrim.c \
		string/ft_substr.c

OBJS = $(addprefix ${OBJS_DIR}/, ${SRCS:%.c=%.o})

COLOR_CYAN = \033[1;36m
COLOR_RED = \033[0;31m
COLOR_GREEN	= \033[0;32m
COLOR_RESET = \033[0m

all: ${NAME}

${OBJS_DIR}/%.o: ${SRCS_DIR}/%.c
	@mkdir -p ${@D}
	@${CC} ${CFLAGS} -I ${INC_DIR} -c $< -o $@
	@echo "${COLOR_GREEN}.${COLOR_RESET}\c"

${NAME}: ${OBJS}
	@ar -rcs ${NAME} ${OBJS}
	@echo "\n${COLOR_CYAN}${NAME} ${COLOR_GREEN}${OBJS_DIR} were created${COLOR_RESET}"
	@echo "${COLOR_CYAN}${NAME} ${COLOR_GREEN}${NAME} was created${COLOR_RESET}"

clean:
	@${RM} ${OBJS_DIR}
	@echo "${COLOR_CYAN}${NAME} ${COLOR_RED}${OBJS_DIR} were deleted${COLOR_RESET}"

fclean: clean
	@${RM} ${NAME}
	@echo "${COLOR_CYAN}${NAME} ${COLOR_RED}${NAME} was deleted${COLOR_RESET}"

re: fclean all

.PHONY: all clean fclean re