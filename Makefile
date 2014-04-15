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
	cd rpmbuild && rpmbuild --define "'_topdir $(<D)/..'" -ba $dir/SPECS/restli.spec

rpm: rpmbuild/RPMS/x86_64/%.rpm
	mkdir -p $(@D)
	cp  $< $@

tars: dist/bundled/$(TAR_FILE_NAME) dist/modular/$(TAR_FILE_NAME)

all: tars rpm

clean:
	rm -rf rpmbuild/SOURCES/*
	rm -rf dist
	rm -rf build
