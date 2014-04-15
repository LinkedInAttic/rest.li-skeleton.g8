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

BUILDS = modular bundled

build/%/$(TAR_FILE_NAME): bin/%/*
	mkdir -p "$(@D)/$(PKG_NAME)"
	cp -r $(<D)/* $(@D)/$(PKG_NAME)/
	cd $(@D) && tar -czf $(TAR_FILE_NAME) $(PKG_NAME)

dist/%/$(TAR_FILE_NAME): build/%/$(TAR_FILE_NAME)
	mkdir -p $(@D)
	cp $< $@

rpmbuild/SOURCES/$(TAR_FILE_NAME): dist/bundled/$(TAR_FILE_NAME)
	cp $< $@

rpmbuild/RPMS/x86_64/%.rpm: rpmbuild/SOURCES/$(TAR_FILE_NAME)
	cd rpmbuild && rpmbuild --define "'_topdir $(<D)/..'" --define "'restlit_version $(VERSION)'" -ba SPECS/restli.spec

dist/rpm/%.rpm: rpmbuild/RPMS/x86_64/%.rpm
	mkdir -p $(@D)
	cp  $< $@

tars: dist/bundled/$(TAR_FILE_NAME) dist/modular/$(TAR_FILE_NAME)

rpm: dist/rpm/restli-$(VERSION)-1.el6.x86_64.rpm

all: tars rpm

clean:
	rm -rf rpmbuild/RPMS/*
	rm -rf rpmbuild/SOURCES/*
	rm -rf dist
	rm -rf build

.PHONY: clean