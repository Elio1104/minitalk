SHELL	=	/bin/bash

# Variables

NAME_CL		= client
NAME_SV		= server
LIBFT		= libft
INC			= inc
HEADER		= -I inc
SRCS_DIR	= src/
OBJS_DIR	= obj/
CC			= gcc
FLAGS		= -Wall -Werror -Wextra
RM			= rm -f
ECHO		= echo -e

# Colors

DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

# Sources

SRCCL_FILES	=	client
SRCSV_FILES	=	server

SRCCL 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCCL_FILES)))
OBJCL 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCCL_FILES)))

SRCSV 		= 	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRCSV_FILES)))
OBJSV 		= 	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRCSV_FILES)))

###

OBJF		=	.cache_exists

start:
			@make -C $(LIBFT)
			@cp $(LIBFT)/libft.a .
			@$(ECHO) -n "$(YELLOW)[Minitalk]:\t$(DEF_COLOR)"
			@$(ECHO) -n "$(RED)[$(DEF_COLOR)"
			@make all
			@$(ECHO) -n "$(RED)]$(DEF_COLOR)"

all:		$(NAME_CL) $(NAME_SV)

$(NAME_CL):	$(OBJCL) $(OBJF)
			@$(CC) $(FLAGS) $(OBJCL) $(HEADER) libft.a -o $(NAME_CL)

$(NAME_SV):	$(OBJSV) $(OBJF)
			@$(CC) $(FLAGS) $(OBJSV) $(HEADER) libft.a -o $(NAME_SV)
		
$(OBJS_DIR)%.o: $(SRCS_DIR)%.c $(OBJF)
			@$(ECHO) -n "$(ORANGE)=$(DEF_COLOR)"
			@$(CC) $(FLAGS) $(HEADER) -c $< -o $@

$(OBJF):
			@mkdir -p $(OBJ_DIR)
			@touch $(OBJF)


			
