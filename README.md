# Spring Rest Demo Project archetype
This project is maven archetype of [SpringMvcRestApiDemo](https://github.com/lucianogrippa/SpringMvcRestApiDemo) project.<br />

To use it just you download the zip or clone it and then compile the project with command:

```bash

$ mvn clean install

```
This command installs the jar file in local catalog and so you can use it to create your own app. <br />
Before creating an app you need to create a project folder.

```bash

$ mkdir myproject
#change directory to nyproject
$ cd myproject

```

now let's create the project. 

Assuming :
- groupId=my.test
- artifactId=apitest
  
```bash
mvn archetype:generate  -DarchetypeGroupId=SpringRestApiDemo  -DarchetypeArtifactId=SpringRestApiDemo-archetype  -DarchetypeVersion=0.1.6  -DgroupId=my.test   -DartifactId=apitest
```
With this command will create a basic application from SpringRestApiDemo archetype.
