CC = gcc
CFLAGS = -Wall -Wextra -O2
PICFLAGS = -fPIC

STATIC_DIR = src/lib/staticCalculatrice
DYN_DIR = src/lib/dynamicCalculatrice
APP = src/app/main.c
BIN = bin/calculatrice

STATIC_OBJS = $(STATIC_DIR)/static_addition.o $(STATIC_DIR)/static_soustraction.o $(STATIC_DIR)/static_multiplication.o $(STATIC_DIR)/static_division.o
DYN_OBJS = $(DYN_DIR)/dynamic_addition.o $(DYN_DIR)/dynamic_soustraction.o $(DYN_DIR)/dynamic_multiplication.o $(DYN_DIR)/dynamic_division.o

all: $(STATIC_DIR)/libstaticCalculatrice.a $(DYN_DIR)/libdynamicCalculatrice.so $(BIN)

$(STATIC_DIR)/libstaticCalculatrice.a: $(STATIC_OBJS)
	ar rcs $@ $^

$(DYN_DIR)/libdynamicCalculatrice.so: $(DYN_OBJS)
	$(CC) -shared -o $@ $^

$(STATIC_DIR)/%.o: $(STATIC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(DYN_DIR)/%.o: $(DYN_DIR)/%.c
	$(CC) $(CFLAGS) $(PICFLAGS) -c $< -o $@

$(BIN): $(APP) $(STATIC_DIR)/libstaticCalculatrice.a $(DYN_DIR)/libdynamicCalculatrice.so
	$(CC) $(APP) -Isrc/lib/staticCalculatrice -Isrc/lib/dynamicCalculatrice \
	-L$(STATIC_DIR) -lstaticCalculatrice -L$(DYN_DIR) -ldynamicCalculatrice -o $(BIN)

run: all
	LD_LIBRARY_PATH=$(DYN_DIR) ./$(BIN)

clean:
	rm -f $(STATIC_OBJS) $(DYN_OBJS) $(BIN) \
	$(STATIC_DIR)/libstaticCalculatrice.a $(DYN_DIR)/libdynamicCalculatrice.so
