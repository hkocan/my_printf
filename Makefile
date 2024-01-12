# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hkocan <hkocan@student.42kocaeli.com.tr    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/06 13:02:25 by hkocan            #+#    #+#              #
#    Updated: 2023/11/06 13:02:26 by hkocan           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = libftprintf.a

CC = cc
CFLAGS = -Wall -Wextra -Werror
RM = rm -f
AR = ar rcs
SRC = ft_printf.c

OBJ = $(SRC:%.c=%.o)

all: $(NAME)

$(NAME):
	$(CC) $(CFLAGS) -c $(SRC)
	$(AR) $(NAME) $(OBJ)

c:clean
clean:
	$(RM) $(OBJ)

fc:fclean	
fclean: clean
	$(RM) $(OBJ) $(NAME)

re: fclean all

.PHONY: all clean fclean re
