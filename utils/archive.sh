#!/usr/bin/env bash

# Creates an archive from given directory
function maketar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
function makegzip() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
function makebzip() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }
function makezip() { zip -r   "${1%%/}.zip"     "${1%%/}/"; }

# Creates ab archive for given directory, with precentage
# function pvtar() { tar cf - "${1%%/}/" | pv -s $(du -sb . | awk '{print $1}') > "${1%%/}.tar"; }
# function pvgzip() { tar cf - "${1%%/}/" | pv -s $(du -sb . | awk '{print $1}') | gzip > "${1%%/}.tar.gz"; }
