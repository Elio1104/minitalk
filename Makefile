SHELL	=	/bin/bash

# Variables

NAME_CL		= client
NAME_SV		= server
LIBFT		= libft
INC			= inc
HEADER		= -I inc
SRC_DIR		= src/
OBJ_DIR		= obj/
CC			= gcc
FLAGS		= -Wall -Werror -Wextra
RM			= rm -f
ECHO		= echo -e

# Colors

DEF_COLOR	=	\033[0;39m
ORANGE		=	\033[0;33m
GRAY		=	\033[0;90m
RED			=	\033[0;91m
GREEN		=	\033[1;92m
YELLOW		=	\033[1;93m
BLUE		=	\033[0;94m
MAGENTA		=	\033[0;95m
CYAN		=	\033[0;96m
WHITE		=	\033[0;97m

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
		
$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(OBJF)
			@$(ECHO) -n "$(ORANGE)=$(DEF_COLOR)"
			@$(CC) $(FLAGS) $(HEADER) -c $< -o $@

$(OBJF):
			@mkdir -p $(OBJ_DIR)
			@touch $(OBJF)

clean:
			@$(RM) -r $(OBJ_DIR)
			@$(RM) $(OBJF)
			@make clean -C $(LIBFT)
			@$(ECHO) -n "$(BLUE)[Minitalk]:\tobject files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"

fclean:		clean
			@$(RM) $(NAME_CL) $(NAME_SV)
			@$(RM) $(LIBFT)/libft.a
			@$(RM) libft.a
			@$(ECHO) -n "$(CYAN)[LIBFT]:\texec. files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"
			@$(ECHO) -n "$(CYAN)[Minitalk]:\texec. files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"

re:			fclean start
			@$(ECHO) -n "\n$(GREEN)Cleaned and rebuilt everything for [Minitalk]!$(DEF_COLOR)\n"

norm:
			@clear
			@norminette $(SRC) $(INC) $(LIBFT) | grep -v Norme -B1 || true

.PHONY:		start all clean fclean re norm
