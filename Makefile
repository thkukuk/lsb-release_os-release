# 
# Makefile for lsb_release program
#
# Copyright (C) 2000, 2002, 2004 Free Standards Group, Inc
# 
# Christopher Yeoh <cyeoh@samba.org>
#
# This is $Revision: 1.7 $

# Config

ifndef INSTALL_ROOT
prefix=/usr/local
else
prefix=$(INSTALL_ROOT)
endif
mandir=${prefix}/man

all: man

man: lsb_release.1 lsb-release.1

lsb-release.1: lsb_release help2man lsb_release.examples
	@./help2man -N --include ./lsb_release.examples --alt_version_key=program_version ./lsb_release >lsb-release.1

lsb_release.1: 
	@echo ".so man1/lsb-release.1" > lsb_release.1

install: all
	install -D -m 644 lsb_release.1 ${mandir}/man1/lsb_release.1
	install -D -m 644 lsb-release.1 ${mandir}/man1/lsb-release.1
	install -D -m 755 lsb_release ${prefix}/bin/lsb_release
	ln -sf lsb_release ${prefix}/bin/lsb-release
