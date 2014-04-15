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

%define        __spec_install_post %{nil}
%define          debug_package %{nil}
%define        __os_install_post %{_dbpath}/brp-compress

Name:	restli
Version:	%{restlit_version}
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
%defattr(775,root,root)
/usr/local/lib/restli/bin/restli
/usr/local/bin/restli
