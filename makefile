# params
EXE = main.pdf
COMPILER = pdflatex
DEBUG = --interaction=batchmode
FLAGS = -output-directory pdf
DIR = src


# get src objects
REPORT_OBJS = $(wildcard $(DIR)/*tex)

# compile main
$(EXE): $(REPORT_OBJS)
	$(COMPILER) $(DEBUG) $(FLAGS) $(DIR)/$(@:.pdf=.tex)

verbose:$(REPORT_OBJS)
	$(COMPILER) $(FLAGS) $(DIR)/$(EXE:.pdf=.tex)


# phony
.PHONY: clean open

clean:
	rm -rf pdf/*


open:
	google-chrome pdf/$(EXE) &

