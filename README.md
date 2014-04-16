Rest.li Project Skeleton
========================

A project skeleton generator for [rest.li](http://rest.li).

Requirements
------------

* Java 1.6+
* <a href="http://www.gradle.org/">Gradle</a> 1.8+
* <a href="https://github.com/n8han/giter8">Giter8</a>

Setup
-----

Install [giter8](https://github.com/n8han/giter8) either manually:

```
curl https://raw.github.com/n8han/conscript/master/setup.sh | sh
cs n8han/giter8
```

or using homebrew:

```
brew update && brew install giter8
```

Try it Out
----------

```
$ g8 linkedin/rest.li-skeleton

Generating a new Rest.li project. 

organization [org.example]: org.example
name [fortunes]: fortunes
restli_resource [fortunes]: fortunes
restli_resource_entity [Fortune]: Fortune

Template applied in ./fortunes
```

The fortunes directory now contains a skeleton rest.li project. You can build it and test it, .e.g.:

```
cd fortunes
gradle build
...

gradle JettyRunWar
...
> Building 90% > :fortunes-server:jettyRunWar > Running at http://localhost:8080/fortunes-server

## in another terminal, do:

curl http://localhost:8080/fortunes-server/fortunes/1
...
{"message":"Hello, Rest.li!"}
```

To modify your rest.li resource, simply edit:

```
fortunes-server/src/main/java/org/example/fortunes/impl/FortunesResource.java
```

Usage
-----

To generate a project skeleton to fit your needs, set the properties:

* 'organization' - The java package name to use for your application
* 'name' - The name of your application, used for the gradle project name
* 'restli_resource' - The name of inital sample REST resource to generate, you can easily add others later
* 'restli_resource_entity' - The name of the initial REST entity for your resource, you can add more of these later as well

You can pass in any of these properties as arguments, if you do this, any you do not set will use their default value (e.g. 'fortunes').

```
g8 linkedin/rest.li-skeleton --organization=com.company.project --name=project --restli_resource=examples --restli_resource_entity=Example
```