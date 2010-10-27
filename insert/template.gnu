# %file%
# Copyright (C) %year% %user%

# author:  %user%
# Time:    %time%


# Variables

TARGET =%
SOURCES =
CLEANEE =

OBJSUFFIX =
OBJ       = $(addsuffix $(OBJSUFFIX),$(basename $(SOURCES)))


# Pattern Rules



# Phony Targets

.PHONY: all clean

all: Makefile.depend $(TARGET)

clean:
	rm -f $(TARGET) $(OBJ) $(CLEANEE)


# Physical Targets

$(TARGET): $(OBJ)


# Dependences

Makefile.depend:

-include Makefile.depend


# EOF
