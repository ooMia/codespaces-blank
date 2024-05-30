#!/bin/bash

# Navigate to the desired directory
cd /home/oomia/workspace/springboot

# +-------------+------------------------------------------+------------------------------+
# | Id          | Description                              | Default value                |
# +-------------+------------------------------------------+------------------------------+
# | artifactId  | project coordinates (infer archive name) | demo                         |
# | bootVersion | spring boot version                      | 3.3.0                        |
# | description | project description                      | Demo project for Spring Boot |
# | groupId     | project coordinates                      | com.example                  |
# | javaVersion | language level                           | 17                           |
# | language    | programming language                     | java                         |
# | name        | project name (infer application name)    | demo                         |
# | packageName | root package                             | com.example.demo             |
# | packaging   | project packaging                        | jar                          |
# | type        | project type                             | gradle-project               |
# | version     | project version                          | 0.0.1-SNAPSHOT               |
# +-------------+------------------------------------------+------------------------------+
# Run the spring init command with default options separated by a line feed

spring init foo \
    --packageName=com.example.demo \
    --description="Demo project for Spring Boot" \
    --bootVersion=3.3.0 \
    --javaVersion=21 \
    --language=java \
    --packaging=jar \
    --type=gradle-project \
    --version=0.0.1-SNAPSHOT \
    --force

# or git clone template project
# git clone https://github.com/ooMia/live-stream.git