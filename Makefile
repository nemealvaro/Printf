# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aneme <aneme@student.42madrid.com>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/29 16:36:59 by aneme             #+#    #+#              #
#    Updated: 2024/10/29 16:38:57 by aneme            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CC = cc
INCLUDE = libftprintf.h

GREEN  = \033[0;32m
YELLOW = \033[0;33m
BLUE   = \033[0;34m
RESET  = \033[0m

SRCS = ft_atoi.c ft_bzero.c \
       ft_calloc.c \
       ft_isalnum.c \
       ft_isalpha.c \
       ft_isascii.c \
       ft_isdigit.c \
       ft_isprint.c \
       ft_memchr.c \
       ft_memcmp.c \
       ft_memcpy.c \
       ft_memmove.c \
       ft_memset.c \
       ft_strchr.c \
       ft_strdup.c \
       ft_strlcat.c \
       ft_strlcpy.c \
       ft_strlen.c \
       ft_strncmp.c \
       ft_strnstr.c \
       ft_strrchr.c \
       ft_substr.c \
       ft_tolower.c \
       ft_toupper.c \
       ft_substr.c \
       ft_striteri.c \
       ft_strmapi.c \
       ft_strjoin.c \
       ft_itoa.c \
       ft_strtrim.c \
       ft_putchar_fd.c \
       ft_putendl_fd.c \
       ft_putnbr_fd.c \
       ft_putstr_fd.c \
       ft_split.c \

OBJS = $(SRCS:.c=.o)

FLAGS = -Wall -Werror -Wextra

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)
	@echo "$(GREEN)FILE: 		OK$(RESET)"
	
%.o: %.c
	@echo "$(BLUE)Compiling... $(YELLOW) $< $(RESET)" 
	@$(CC) $(FLAGS) -c $< -o $@ 

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re:    fclean all