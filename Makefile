# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
PYTHON = python3
SPHINXOPTS    = 
SPHINXBUILD   = sphinx-build
ODKX_SRCDIR   = odkx-src
COMPILE_X_SRCDIR = tmpx-src
ODKX_BUILDDIR = odkx-build

.PHONY: help Makefile

serve:
	sphinx-autobuild --port 8080 --host 0.0.0.0 odkx-src odkx-build

clean:
	rm -rf $(COMPILE_X_SRCDIR)
	rm -rf $(ODKX_BUILDDIR)

copy: clean
	mkdir $(COMPILE_X_SRCDIR)
	cp -rf $(ODKX_SRCDIR)/* $(COMPILE_X_SRCDIR)

build: copy
	@$(SPHINXBUILD) -W -b dirhtml "$(COMPILE_X_SRCDIR)" "$(ODKX_BUILDDIR)" $(SPHINXOPTS)

latex: copy
	@$(SPHINXBUILD) -b latex "$(COMPILE_X_SRCDIR)" "$(ODKX_BUILDDIR)"/latex $(SPHINXOPTS)
	$(PYTHON) util/resize.py "$(ODKX_BUILDDIR)"

pdf: latex
	cd "$(ODKX_BUILDDIR)"/latex && \
	xelatex ODK-X.tex && \
	xelatex ODK-X.tex && \
	mkdir -p ../_downloads && \
	mv ODK-X.pdf ../_downloads/ODK-X-Documentation.pdf

style-check: build
	$(PYTHON) style-test.py -r $(COMPILE_X_SRCDIR)

spell-check: copy
	sphinx-build -b spelling $(COMPILE_X_SRCDIR) $(ODKX_BUILDDIR)/spelling
	$(PYTHON) util/check-spelling-output.py $(ODKX_BUILDDIR)

check-all: style-check spell-check