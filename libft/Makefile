SHELL		=	/bin/bash

#variables

NAME		=	libft.a
INCLUDES	=	includes/
SRCS_DIR 	=	src/
OBJS_DIR	=	obj/
CC			=	gcc
CFLAGS		=	-Wall -Werror -Wextra -I
RM			=	rm -f
AR			=	ar rcs
ECHO		=	echo -e

#Colors

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

#Sources

FTIS_DIR	=	ft_is/
FTIS		=	ft_isalnum ft_isalpha ft_isascii ft_isdigit ft_isprint

FTMEM_DIR	=	ft_mem/
FTMEM		=	ft_bzero ft_calloc ft_memchr ft_memcmp ft_memmove ft_memset

FTPUT_DIR	=	ft_put/
FTPUT		=	ft_putchar_fd ft_putendl_fd ft_putnbr_fd ft_putstr_fd

FTTO_DIR	=	ft_to/
FTTO		=	ft_atoi ft_itoa ft_tolower ft_toupper

FTSTR_DIR	=	ft_str/
FTSTR		=	ft_split ft_strchr ft_strdup ft_striteri ft_strjoin \
				ft_strlcat ft_strlcpy ft_strlen ft_strmapi ft_strncmp \
				ft_strnstr ft_strrchr ft_strtrim ft_substr

FTLST_DIR	=	ft_lst/
FTLST		=	ft_lstadd_back ft_lstadd_front ft_lstclear ft_lstdelone \
				ft_lstiter ft_lstlast ft_lstmap ft_lstnew ft_lstsize

GNL_DIR		=	gnl/
GNL			=	get_next_line get_next_line_utils

FTPRINTF_DIR	= ft_printf/
FTPRINTF	=	ft_printf ft_printf_utils ft_print_hex ft_print_ptr ft_print_unsigned

SRC_FILES+=$(addprefix $(FTIS_DIR),$(FTIS))
SRC_FILES+=$(addprefix $(FTMEM_DIR),$(FTMEM))
SRC_FILES+=$(addprefix $(FTPUT_DIR),$(FTPUT))
SRC_FILES+=$(addprefix $(FTTO_DIR),$(FTTO))
SRC_FILES+=$(addprefix $(FTSTR_DIR),$(FTSTR))
SRC_FILES+=$(addprefix $(FTLST_DIR),$(FTLST))
SRC_FILES+=$(addprefix $(GNL_DIR),$(GNL))
SRC_FILES+=$(addprefix $(FTPRINTF_DIR),$(FTPRINTF))

SRCS 		= 	$(addprefix $(SRCS_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJS 		= 	$(addprefix $(OBJS_DIR), $(addsuffix .o, $(SRC_FILES)))

###

OBJF		=	.cache_exists

start:
			@$(ECHO) -n "$(YELLOW)[LIBFT]:\t$(DEF_COLOR)"
			@$(ECHO) -n "$(RED)[$(DEF_COLOR)"
			@make all

all:		$(NAME)

$(NAME):	$(OBJS)
			@$(AR) $(NAME) $(OBJS)
			@$(ECHO) -n "$(RED)]$(DEF_COLOR)"
			@$(ECHO) "$(GREEN) => 100%$(DEF_COLOR)"

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c | $(OBJF)
			@$(ECHO) -n "$(ORANGE)=$(DEF_COLOR)"
			@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(OBJF):
			@mkdir -p $(OBJS_DIR)
			@mkdir -p $(OBJS_DIR)$(FTIS_DIR)
			@mkdir -p $(OBJS_DIR)$(FTMEM_DIR)
			@mkdir -p $(OBJS_DIR)$(FTPUT_DIR)
			@mkdir -p $(OBJS_DIR)$(FTTO_DIR)
			@mkdir -p $(OBJS_DIR)$(FTSTR_DIR)
			@mkdir -p $(OBJS_DIR)$(FTLST_DIR)
			@mkdir -p $(OBJS_DIR)$(GNL_DIR)
			@mkdir -p $(OBJS_DIR)$(FTPRINTF_DIR)
			@touch $(OBJF)

clean:
			@$(RM) -r $(OBJS_DIR)
			@$(RM) $(OBJF)
			@echo -e -n "$(BLUE)[LIBFT]:\tobject files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"

fclean:		clean
			@$(RM) $(NAME)
			@$(ECHO) -n "$(CYAN)[LIBFT]:\texec. files$(DEF_COLOR)$(GREEN)  => Cleaned!$(DEF_COLOR)\n"

re:			fclean start
			@$(ECHO) -n "$(GREEN)Cleaned and rebuilt everything for libft!$(DEF_COLOR)\n"

norm:
			@norminette $(SRCS) $(INCLUDES) | grep -v Norme -B1 || true

.PHONY:		all clean fclean re norm
