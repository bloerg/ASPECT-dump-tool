# choose compiler
# gcc or g++
CC=g++

# define compiler flags
#
CFLAGS       = -fPIC -g -Wall -m64 -D_FILE_OFFSET_BITS=64  -fopenmp

# define linker flags
# 
LDFLAGS      = -shared

# define debug flags
#
DEBUGFLAGS	 = 

# define any directories containing header files other than /usr/include
# i.e. -I/home/mylib/include  -I../include
INCLUDES = -I../  -I../3rdparty 


# define any libraries to link into executable:
#   e.g. -lmylib -lm will link in libmylib.so and libm.so
LIBS = 


TARGET  = ../libsdss.so
EXCLUDES = BigTiff glextensions glFBO glhelper glshaderprogram gltexture FileArchive
SOURCES = $(filter-out $(addsuffix .cpp,$(EXCLUDES)),$(wildcard *.cpp))
HEADERS = $(filter-out $(addsuffix .h,$(EXCLUDES))   ,$(wildcard *.h))
OBJECTS = $(SOURCES:.cpp=.o)


all: $(TARGET)
	
#link:
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $(DEBUGFLAGS) $(INCLUDES) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(LIBS)

#compile:
.cpp.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) *.o *~ $(TARGET)

test:
	@echo $(OBJECTS)

depend: $(SOURCES)
	makedepend $(INCLUDES) $^

# DO NOT DELETE THIS LINE -- make depend needs it