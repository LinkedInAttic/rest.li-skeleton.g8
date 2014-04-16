#!/bin/sh

#  Copyright (c) 2014 LinkedIn Corp.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

VERSION = 0.0.1

PKG_NAME = restli-$(VERSION)
TAR_FILE_NAME = $(PKG_NAME).tar.gz

# tar the contents of any bin/{build} directory
build/%/$(TAR_FILE_NAME): bin/%/*
	mkdir -p "$(@D)/$(PKG_NAME)"
	cp -r $(<D)/* $(@D)/$(PKG_NAME)/
	cd $(@D) && tar -czf $(TAR_FILE_NAME) $(PKG_NAME)

# copy built tar files to dist
dist/%/$(TAR_FILE_NAME): build/%/$(TAR_FILE_NAME)
	mkdir -p $(@D)
	cp $< $@

# copy tar from dist into RPM SOURCES directory for RPM generation
packagers/rpm/SOURCES/$(TAR_FILE_NAME): dist/bundled/$(TAR_FILE_NAME)
	cp $< $@

# generate RPM from tar file in RPM SOURCES directory
packagers/rpm/RPMS/x86_64/%.rpm: packagers/rpm/SOURCES/$(TAR_FILE_NAME)
	cd packagers/rpm && VERSION=$(VERSION) packagers/rpm --define "'_topdir $(<D)/..'" -ba SPECS/restli.spec

# copy generated RPM from RPMS directory into dist
dist/rpm/%.rpm: packagers/rpm/RPMS/x86_64/%.rpm
	mkdir -p $(@D)
	cp  $< $@

# all tar tasks
tars: dist/bundled/$(TAR_FILE_NAME) dist/modular/$(TAR_FILE_NAME)

# all rpm tasks
rpm: dist/rpm/restli-$(VERSION)-1.el6.x86_64.rpm

# all tasks
all: tars rpm

clean:
	rm -rf packagers/rpm/RPMS/*
	rm -rf packagers/rpm/SOURCES/*
	rm -rf dist
	rm -rf build

.PHONY: clean