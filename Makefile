AS		= nasm
ASFLAGS		= -f elf64

CC		= ld
CFLAGS		= -fPIC -shared

RM		= rm -f

NAME		= libasm.so

SRCS_DIR	= src/
SRCS_FILES	= strlen.asm		\
		  strcmp.asm		\
		  strncmp.asm		\
		  strcasecmp.asm	\
		  strchr.asm		\
		  strcspn.asm		\
		  strpbrk.asm		\
		  rindex.asm		\
		  memset.asm		\
		  memcpy.asm		\
		  memmove.asm

SRCS		= $(addprefix $(SRCS_DIR), $(SRCS_FILES))

OBJS		= $(SRCS:.asm=.o)


all: $(NAME)

$(NAME): $(OBJS)
	 $(CC) $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY: all clean fclean re
