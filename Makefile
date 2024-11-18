# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aneme <aneme@student.42madrid.com>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/11 12:00:00 by aneme             #+#    #+#              #
#    Updated: 2024/11/12 12:30:25 by aneme            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables
NAME = libftprintf.a
CC = cc
CFLAGS = -Wall -Wextra -Werror
LIBFT_DIR = ../libft
LIBFT = $(LIBFT_DIR)/libft.a
INCLUDE = -I.

GREEN  = \033[0;32m
YELLOW = \033[0;33m
BLUE   = \033[0;34m
RESET  = \033[0m

# Archivos de ft_printf
SRCS = ft_printf.c ft_printf_utils.c
OBJS = $(SRCS:.c=.o)

# Regla principal
all: $(LIBFT) $(NAME)

# Compilar ft_printf y enlazar con libft
$(NAME): $(OBJS)
	@cp $(LIBFT) $(NAME)
	@ar rcs $(NAME) $(OBJS)
	@echo "$(GREEN)ft_printf compiled successfully!$(RESET)"

# Regla para compilar libft si no existe
$(LIBFT):
	@echo "$(YELLOW)Compiling libft...$(RESET)"
	@$(MAKE) -C $(LIBFT_DIR)

%.o: %.c
	@echo "$(BLUE)Compiling... $(YELLOW)$<$(RESET)"
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

# Limpiar archivos objeto y la librería
clean:
	@rm -f $(OBJS)
	@echo "$(YELLOW)ft_printf object files removed$(RESET)"

fclean: clean
	@rm -f $(NAME)
	@$(MAKE) fclean -C $(LIBFT_DIR)
	@echo "$(YELLOW)libftprintf.a removed$(RESET)"

re: fclean all

.PHONY: all clean fclean re
