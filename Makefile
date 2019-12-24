.PHONY: all rebuild load


all:
	docker build -t hotoku/python .

rebuild:
	docker build --no-cache -t hotoku/python .

info.hotoku.jupyterlab.plist: info.hotoku.jupyterlab.dat
	plutil -convert xml1 -o $@ $< 

load: info.hotoku.jupyterlab.plist
