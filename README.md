Rest.li project generator
=========================

Installation
------------

Download restli.tar.gz and unzip it to wherever you want it installed, e.g.:

```
tar -zxf restli.tar.gz -C /usr/local
```

In your shell profile (e.g. ~/.bash_profile), set a RESTLI_HOME environment variable to the directory you've selected, and add it's bin to your path, e.g.:

```
export RESTLI_HOME=$HOME/usr/local/restli
export PATH=$RESTLI_HOME/bin:$PATH
```

TODO
----

* extend generator to allow dependency injection to be used (pick guice or spring)
* extend generator to produce an empty skeleton with no sample code
* add a example generated test

* publish into homebrew, apt-get and yum (windows?)
* Put online and adjust tutorials and such to make use of it
* update webpage with detail on 'getting started' page
* create a command line player based demo

Development
-----------

To make changes to a locally checked out copy of this project, make any changes and run:

```
bin/modular/restli <args>
```

You should see a warning printed like:

```
[This appears to be local development checkout.  Using /.../restli-skeleton for RESTLI_HOME and skeleton]
```

This indicates that the locally checked out files will be used for everything, including the skeleton.

Building
--------

Run:

```
./package
```

This will produce:
* `/dist/bundled/rest.li-<version>.tar.gz`, that contains g8 as well the restli cli tool, for package managers where g8 is unavailable
* `/dist/modular/rest.li-<version>.tar.gz`, that contains just the restli cli tool, for package managers where g8 is available
* An RPM under `/rpmbuild/RPMS/x86_64` for rpm and yum package managers.

Packaging
=========

Homebrew (mac)
--------------

'Library/Formula/restli.rb' is a valid homebrew tap.  To test locally:

```
cp Library/Formula/restli.rb /usr/local/Library/Formula/restli.rb
brew install restli
```

Once published,  developers should simply be able to do:

```
brew install restli
```

to uninstall:

```
brew uninstall
```

RPM/Yum
-------

`rpmbuild` contains a RPM build setup.  To test locally:

```
make all
sudo rpm -ivp rpmbuild/RPMS/x86_64/restli-*.rpm
```

to uninstall:

```
sudo rpm -e restli
```