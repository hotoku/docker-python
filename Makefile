.PHONY: all rebuild


all:
	docker build -t hotoku/python .

rebuild:
	docker build --no-cache -t hotoku/python .
