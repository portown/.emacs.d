# Makefile
# Copyright (C) 2010 YASUDA Jiro

# author:  YASUDA Jiro
# Time:    '10/10/27


# Variables

COMPILED_DIR = inits

PART_SOURCES := init.el addpath.el env.el
INIT_SOURCES := $(shell ls init.d/*.el)

OBJSUFFIX = .elc
PART_OBJ  = $(addsuffix $(OBJSUFFIX),$(basename $(PART_SOURCES)))
INIT_OBJ  = $(addprefix $(COMPILED_DIR)/,$(notdir $(addsuffix $(OBJSUFFIX),$(basename $(INIT_SOURCES)))))

SOURCES = $(PART_SOURCES) $(INIT_SOURCES)
OBJ     = $(PART_OBJ) $(INIT_OBJ)

EMACS = emacs
EMACSFLAGS = --batch --load settings.el --load addpath.el --funcall batch-byte-compile


# Pattern Rules

$(COMPILED_DIR)/%.elc: init.d/%.el
	$(EMACS) $(EMACSFLAGS) $<
	mv -f $(addsuffix $(OBJSUFFIX),$(basename $<)) $@

%.elc: %.el
	$(EMACS) $(EMACSFLAGS) $<


# Phony Targets

.PHONY: all clean

all: $(COMPILED_DIR) $(OBJ)

clean:
	rm -f $(PART_OBJ)
	rm -Rf $(COMPILED_DIR)


# Physical Targets

$(COMPILED_DIR):
	mkdir $@





# EOF
