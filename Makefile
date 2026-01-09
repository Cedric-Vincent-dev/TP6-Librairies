CC = gcc
CFLAGS = -Wall -Wextra -O2


# Dossiers
SRC_DIR = src
APP_DIR = $(SRC_DIR)/app
STATIC_DIR = $(SRC_DIR)/lib/staticCalculatrice
DYNAMIC_DIR = $(SRC_DIR)/lib/dynamicCalculatrice
BIN_DIR = bin

# Fichiers
STATIC_LIB = $(STATIC_DIR)/libstaticCalculatrice.a
DYNAMIC_LIB = $(DYNAMIC_DIR)/libdynamicCalculatrice.so
MAIN = $(APP_DIR)/main.c
OUTPUT = $(BIN_DIR)/calculatrice

# Règle principale
all: $(STATIC_LIB) $(DYNAMIC_LIB) $(OUTPUT)

# Librairie statique
$(STATIC_LIB): $(STATIC_DIR)/static_calculatrice.o
	ar rcs $@ $^

$(STATIC_DIR)/static_calculatrice.o: $(STATIC_DIR)/static_calculatrice.c
	$(CC) $(CFLAGS) -c $< -o $@

# Librairie dynamique
$(DYNAMIC_LIB): $(DYNAMIC_DIR)/dynamic_calculatrice.o
	$(CC) -shared -o $@ $^

$(DYNAMIC_DIR)/dynamic_calculatrice.o: $(DYNAMIC_DIR)/dynamic_calculatrice.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

# Compilation du main
$(OUTPUT): $(MAIN)
	mkdir -p $(BIN_DIR)
	$(CC) $(MAIN) -I$(STATIC_DIR) -I$(DYNAMIC_DIR) \
	-L$(STATIC_DIR) -lstaticCalculatrice \
	-L$(DYNAMIC_DIR) -ldynamicCalculatrice \
	-o $(OUTPUT)


# Exécution
run: 
	LD_LIBRARY__PATH=$(DYNAMIC_DIR) ./$(OUTPUT)

# Nettoyage
clean:
	rm -f $(STATIC_DIR)/*.o
	rm -f $(DYNAMIC_DIR)/*.o
	rm -f $(STATIC_LIB)
	rm -f $(DYNAMIC_LIB)
	rm -rf $(BIN_DIR)

.PHONY: all clean run


