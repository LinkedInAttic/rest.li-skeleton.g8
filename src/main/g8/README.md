Welcome to Rest.li
==================

This is a rest.li application using gradle as the build system.


To build for the first time, use gradle 1.8 or greater and run:

```
gradle build
```

You can then run the server with:

`gradle JettyRunWar`

Once running, you can send a GET request to the server with:

`curl http://localhost:8080/$restli_resource;format="camel"$/1`

