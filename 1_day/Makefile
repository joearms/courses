all: one_day_erlang.pdf

one_day_erlang.pdf: one_day_erlang.tex
	pdflatex one_day_erlang.tex
	pdflatex one_day_erlang.tex

clean:
	rm -rf one_day_erlang.aux one_day_erlang.log one_day_erlang.toc
	rm -rf *.beam
