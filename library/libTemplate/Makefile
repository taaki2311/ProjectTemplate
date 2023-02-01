# specify the compiler and flags
CC = gcc
CFLAGS = -c -Wall -Werror

# specify the library name and source files
LIBNAME = $(notdir $(CURDIR))
SOURCES = $(wildcard src/*.c)
OBJECTS = $(SOURCES:src/%.c=obj/%.o)

# specify the library and include directories
LIBDIR = .
INCDIR = include
SRCDIR = src
OBJDIR = obj

# specify the library target
all: $(OBJECTS)
	ar rcs $(LIBDIR)/$(LIBNAME).a $(OBJECTS)

# specify the compile target
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -I$(INCDIR) $< -o $@

# specify the clean target
clean:
	rm -f $(OBJECTS) $(LIBDIR)/$(LIBNAME).a

# specify the create object directory
$(OBJDIR):
	mkdir -p $(OBJDIR)
