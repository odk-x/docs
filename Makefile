# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
PYTHON = python3
SPHINXOPTS    = 
SPHINXBUILD   = sphinx-build
SOURCE_DIR   = src
BUILD_DIR = build

.PHONY: help Makefile

serve:
	sphinx-autobuild --port 8080 --host 0.0.0.0 src build

clean:
	rm -rf $(BUILD_DIR)

build: clean
	@$(SPHINXBUILD) -W -b dirhtml "$(SOURCE_DIR)" "$(BUILD_DIR)" $(SPHINXOPTS)

latex:
	@$(SPHINXBUILD) -b latex "$(SOURCE_DIR)" "$(BUILD_DIR)/latex" $(SPHINXOPTS)
	$(PYTHON) util/resize.py "$(BUILD_DIR)/latex"

pdf: latex
	cd "$(BUILD_DIR)/latex" && \
	xelatex ODK-X.tex && \
	xelatex ODK-X.tex && \
	mkdir -p ../_downloads && \
	mv ODK-X.pdf ../_downloads/ODK-X-Documentation.pdf

style-check: build
	$(PYTHON) style-test.py -r $(SOURCE_DIR)

spell-check:
	sphinx-build -b spelling $(SOURCE_DIR) $(BUILD_DIR)/spelling
	$(PYTHON) util/check-spelling-output.py $(BUILD_DIR)

check-all: style-check spell-check