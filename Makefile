# Directories
SRCDIR = source
INCDIR = include
LIBDIR = library
OBJDIR = object
BINDIR = bin

# Library Name and Location
LIB = Template
LIBPATH = -L./$(LIBDIR)/lib$(LIB)
LIBTARGET = -l$(LIB)

# Compiler and Flags
CC = gcc
CFLAGS = -I./$(INCDIR) $(LIBPATH) $(LIBTARGET) -Wall -Werror -Wextra

# Name
NAME = $(notdir $(CURDIR))

# Source Files
SOURCES = $(wildcard $(SRCDIR)/*.c)

# Object Files
OBJECTS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SOURCES))

# Executable
EXECUTABLE = $(BINDIR)/$(NAME)

.PHONY: all
all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(EXECUTABLE) $(CFLAGS) $(LIBRA)

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	$(CC) -c $< -o $@ $(CFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJDIR)/*.o $(BINDIR)/*

$(BINDIR):
	$(MKDIR_P) $@
$(OBJDIR):
	$(MKDIR_P) $@
$(LIBDIR):
	$(MKDIR_P) $@
$(INCDIR):
	$(MKDIR_P) $@
$(SRCDIR):
	$(MKDIR_P) $@
