#!/bin/bash

# sets only if must build with specific version of jdk otherwise comment it
# export JAVA_HOME=/home/lucianogrippa/sdk/jdk8u252-b09
DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"`
MVNW_FILE=./mvnw
MVN_DIR=.mvn
MVN_REPO_SETTINGS=$HOME/.m2/settings.xml
DEFAULT_SETTINGS_CONTENT="<settings xmlns=\"http://maven.apache.org/SETTINGS/1.0.0\"
      xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
      xsi:schemaLocation=\"http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd\">
    </settings>"

CURRENT_DIRECTORY=$PWD

getopts a: prjdirname

ARCHETYPE_PROJECT_DIR=$OPTARG
if [ ! -n "$ARCHETYPE_PROJECT_DIR" ]; then
  echo "set ../spring-rest-archetype"
  ARCHETYPE_PROJECT_DIR="../spring-rest-archetype"
fi

echo "archetipe project $ARCHETYPE_PROJECT_DIR"

getopts X maketest

echo "-x = $maketest"

getopts m: commitMessage

if [ "$commitMessage" = "m" ]; then
   COMMIT_MESSAGE=$OPTARG
else
  COMMIT_MESSAGE="generate archetype $DATE_WITH_TIME"
fi

# options solo uno -debug
if [ "$maketest" = "X" ]; then
	DEBUGOPTION=-X
else
   DEBUGOPTION="-B"
fi

echo "debug option $DEBUG"

# search  JAVA_HOME 
if [ -n "$JAVA_HOME" ] && [ -x "$JAVA_HOME/bin/java" ];  then
    echo "JAVA_HOME found in $JAVA_HOME"    
else
    echo "no java_home environment settings found please set it"
fi


if [ ! -f "$MVNW_FILE" ] || [ ! -d "$MVN_DIR" ]; then
    echo "$MVNW_FILE does not exist"
    echo "create wrapper"
    exec mvn -N io.takari:maven:wrapper
fi

# fix settings.xml
if [ ! -f "$MVN_REPO_SETTINGS" ]; then
  # crea il file settingis di default
  echo $DEFAULT_SETTINGS_CONTENT > $MVN_REPO_SETTINGS
fi

./mvnw clean install archetype:create-from-project $DEBUGOPTION

# cp -r ./docker $ARCHETYPE_PROJECT_DIR/docker
# cp compile.sh  $ARCHETYPE_PROJECT_DIR/compile.sh
# cp compile.bat $ARCHETYPE_PROJECT_DIR/compile.bat

# se e' presente il progetto archetipe ed e' stato creato in source
# allora copia 
echo "checking $ARCHETYPE_PROJECT_DIR directory"

if [ ! -d "$ARCHETYPE_PROJECT_DIR" ]; then
  echo "creating directory.. $ARCHETYPE_PROJECT_DIR"
  mkdir $ARCHETYPE_PROJECT_DIR
fi

if [ -d "$ARCHETYPE_PROJECT_DIR" ] && [ -d "./target/generated-sources/archetype" ] ; then
echo "checking ok"
   rm -rf $ARCHETYPE_PROJECT_DIR/pom.xml && \
   rm -rf $ARCHETYPE_PROJECT_DIR/target && \
   rm -rf $ARCHETYPE_PROJECT_DIR/src && \
   cp -r ./target/generated-sources/archetype/** $ARCHETYPE_PROJECT_DIR/ && \
   ./mvnw -f $ARCHETYPE_PROJECT_DIR clean install -B
  
  # uncommet only if want push to repository
  #  cd $ARCHETYPE_PROJECT_DIR && \
  #  git add . && \
  #  git commit -m "$COMMIT_MESSAGE" && \
  #  git pull && \
  #  git push && \
  #  cd $CURRENT_DIRECTORY
fi