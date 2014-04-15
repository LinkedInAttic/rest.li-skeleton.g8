Put the location of this project in a ~/.rpmmacros file so rpm knows where to build everything from.

```
%_topdir %(echo $HOME)/projects/restli-skeleton/rpmbuild
```

To build a rpm, run:

```
./build-rpm
```

To test installing locally:

```
sudo rpm -ivp RPMS/x86_64/rest.li-*.rpm
```

To uninstall:

```
rpm -e rest.li
```