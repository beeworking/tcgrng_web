BIN=web
SRC=$(wildcard *.go)

all: build run

$(BIN): $(SRC)
	go build -o $(BIN) $(SRC)

build: $(BIN)

run: $(BIN)
	@./$(BIN)

.PHONY: build run all
