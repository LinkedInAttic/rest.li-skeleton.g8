Rest.li Tool
============

Installing with Homebrew (mac)
------------------------------

TODO

Manual Installation
-------------------

Install [giter8](https://github.com/n8han/giter8) either manually of using homebrew (brew install giter8).

Download [restli.tar.gz](http://rest.li/releases/restli-tool/0.0.1/restli-0.0.1.tar.gz) and unzip it to wherever you want it installed, e.g.:

```
tar -zxf restli.tar.gz -C /usr/local
```

Add it's bin to your path, usually, in a shell profile (e.g. ~/.bash_profile), e.g.:

```
export PATH=/usr/local/restli-<version>/bin:$PATH
```

Usage
-----

```
$ restli new

Generating a new Rest.li project. 

organization [org.example]:
name [fortunes]:
restli_resource [fortunes]:
restli_resource_entity [Fortune]:

Template applied in ./fortunes
```

The fortunes directory now contains a skeleton rest.li project:

```
$ cd fortunes
$ ls
README.md         build.gradle      fortunes-api      fortunes-server   gradle.properties settings.gradle
```

You can build it and test it, .e.g.:

```
$ gradle build
...

$ gradle JettyRunWar
...

$ curl -v http://localhost:8080/fortunes-server/fortunes/1
...
{ "message": "Today is your lucky day!" }
```

Building Locally
================

To make changes to a locally checked out copy of this project, make any changes and run:

```
bin/modular/restli <args>
```

You should see a warning printed like:

```
[This appears to be local development checkout.  Using /.../restli-skeleton for RESTLI_HOME and skeleton]
```

This indicates that the locally checked out files will be used for everything, including the skeleton.


Packaging and Publishing a new version
======================================

First run:
```
make all
```

This will produce:
* `/dist/bundled/rest.li-<version>.tar.gz`, that contains g8 as well the restli cli tool, for package managers where g8 is unavailable
* `/dist/modular/rest.li-<version>.tar.gz`, that contains just the restli cli tool, for package managers where g8 is available
* An RPM under `/rpmbuild/RPMS/x86_64` for rpm and yum package managers.

Homebrew (mac)
--------------

'Library/Formula/restli.rb' is a valid homebrew tap.

To test locally:

```
cp Library/Formula/restli.rb /usr/local/Library/Formula/restli.rb
brew install restli
```
to uninstall:

```
brew uninstall
```

To publish:

* bump version in restli.rb
* update sha1 in restli.rb
* clone homebrew/homebrew on github
* apply changes and commit
* submit a pull request to homebrew/homebrew

Yum / RPM
---------

`rpmbuild` contains a RPM build setup.

To test locally:

```
make all
sudo rpm -ivp dist/rpm/restli-*.rpm
```

to uninstall:

```
sudo rpm -e restli
```

To publish:

* bump version in Makefile, build with new version (make clean; make all)
* TODO: how to submit?