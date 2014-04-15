# Don't try fancy stuff like debuginfo, which is useless on binary-only
# packages. Don't strip binary too
# Be sure buildpolicy set to do nothing
%define        __spec_install_post %{nil}
%define          debug_package %{nil}
%define        __os_install_post %{_dbpath}/brp-compress

Name:	restli
Version:	0.0.1
Release:	1%{?dist}
Summary:	A command line utility for Rest.li, a REST framework.
Group:		Development/Tools
License:	apache 2.0
URL:	http://rest.li
Source0:	%{name}-%{version}.tar.gz

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
%{summary}

%prep
%setup -q

%build
# Empty section.

%install
rm -rf %{buildroot}
mkdir -p  %{buildroot}/usr/local/lib/restli/bin
mkdir -p  %{buildroot}/usr/local/bin

# in builddir
cp -a * %{buildroot}/usr/local/lib/restli/bin
echo 'RESTLI_HOME=/usr/local/lib/restli /usr/local/lib/restli/bin/restli $@' > %{buildroot}/usr/local/bin/restli

%files
%defattr(644,root,root)
/usr/local/lib/restli/bin/g8/giter8.launchconfig
/usr/local/lib/restli/bin/sbt/sbt-launch.jar
/usr/local/lib/restli/bin/README.md
%defattr(775,root,root)
/usr/local/lib/restli/bin/restli
/usr/local/bin/restli
