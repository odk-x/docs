# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCE_DIR     = src
BUILD_DIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCE_DIR)" "$(BUILD_DIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

dockerserve:
	sphinx-autobuild --host 0.0.0.0 --port 8080 -b dirhtml "$(SOURCE_DIR)" "$(BUILD_DIR)/html"

serve:
	sphinx-autobuild -b dirhtml "$(SOURCE_DIR)" "$(BUILD_DIR)/html"

autobuild : serve

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCE_DIR)" "$(BUILD_DIR)" $(SPHINXOPTS) $(O)