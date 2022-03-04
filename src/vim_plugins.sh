#!/bin/bash
vim -c :PlugInstall

# COC Analyzers
# Rust
vim -c :CocInstall coc-rust-analyzer

# Python
vim -c :CocInstall coc-pyright

# R
# Must install.packages("languageserver")
vim -c :CocInstall coc-r-lsp

# JSON
vim -c :CocInstall coc-json

# Markdown
vim -c :CocInstall coc-markdownlint

# Javascript
vim -c :CocInstall coc-tsserver

