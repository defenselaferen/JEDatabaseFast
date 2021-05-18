# Settings Compiler
CXX           = g++
AR            = ar

# Flags Optimize
OPTIMIZE      = -ffast-math -O2 -g -Ofast -Os
# FLAGS
FLAGS         = -Og
INCLUDE       = -I /usr/include

# Get all list file .cpp
SOURCES_CPP   := $(shell find $(SOURCEDIR) -name '*.cpp')

# OUTPUT Object
OUTPUT_SRC    = obj

# OUTPUT END
FINISH_OUTPUT = libdbmem.a

# Start
all: @start_compile @compile_cpp @check_obj @compile_end

@start_compile:
	@printf "+==================+ \n"
	@printf "|   Build Start    | \n"
	@printf "+==================+ \n"

@compile_cpp:
	@for _source_ in $(SOURCES_CPP); do \
		printf "\033[0;32mCompile File: [\033[0;33m$$_source_\033[0m\033[0;32m]\033[0m \n"; \
		$(CXX) -c $$_source_ $(INCLUDE) $(OPTIMIZE); \
	done
	
@check_obj:
	@if [ ! -d $(OUTPUT_SRC) ]; then \
		printf "\033[0;32mMissing Folder: [\033[0;31m$(OUTPUT_SRC)\033[0m\033[0;32m]\033[0m\n"; \
		mkdir $(OUTPUT_SRC); \
	fi

@compile_end:
	@printf "\033[0;32mTarget File: [\033[0;33m$(FINISH_OUTPUT)\033[0m\033[0;32m]\033[0m \n"
	@$(AR) rcs $(FINISH_OUTPUT) *.o
	@mv *.o $(OUTPUT_SRC)
	@printf "Finish Output: [\033[0;32m$(FINISH_OUTPUT)\033[0m] \n"