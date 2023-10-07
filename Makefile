# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
PYTHON = python3
SPHINXOPTS    = 
SPHINXBUILD   = sphinx-build
SOURCE_DIR   = src
TMP_SOURCE = tmp_src
BUILD_DIR = build

.PHONY: help Makefile

serve:
	sphinx-autobuild --port 8080 --host 0.0.0.0 src build

clean:
	rm -rf $(TMP_SOURCE)
	rm -rf $(BUILD_DIR)

copy: clean
	mkdir $(TMP_SOURCE)
	cp -rf $(SOURCE_DIR)/* $(TMP_SOURCE)

build: copy
	@$(SPHINXBUILD) -W -b dirhtml "$(TMP_SOURCE)" "$(BUILD_DIR)" $(SPHINXOPTS)

latex: copy
	@$(SPHINXBUILD) -b latex "$(TMP_SOURCE)" "$(BUILD_DIR)"/latex $(SPHINXOPTS)
	$(PYTHON) util/resize.py "$(BUILD_DIR)"

pdf: latex
	cd "$(BUILD_DIR)/latex" && \
	xelatex ODK-X.tex && \
	xelatex ODK-X.tex && \
	mkdir -p ../_downloads && \
	mv ODK-X.pdf ../_downloads/ODK-X-Documentation.pdf

style-check: build
	$(PYTHON) style-test.py -r $(TMP_SOURCE)

spell-check: copy
	sphinx-build -b spelling $(TMP_SOURCE) $(BUILD_DIR)/spelling
	$(PYTHON) util/check-spelling-output.py $(BUILD_DIR)

check-all: style-check spell-check