# gradle-release-example 

[![Build Status](https://travis-ci.org/carloscaverobarca/gradle-release-example.svg?branch=master)](https://travis-ci.org/carloscaverobarca/gradle-release-example) [![codecov.io](https://codecov.io/gh/carloscaverobarca/gradle-release-example/branch/master/graphs/badge.svg)](http://codecov.io/gh/carloscaverobarca/gradle-release-example)

# Description

Gradle release example for CI and CD including integration with sonar, versioning and changelog. This is used for the gradle webinars.

# Technologies

Java
Gradle

# How to deploy

The Jenkinsfile and JenkinsfileDeploy store the gradle activities in the CI and CD pipeline. All the modifications are done via Pull Requests, see the [Contribution Guidelines](https://github.com/carloscaverobarca/gradle-release-example/blob/master/CONTRIBUTING.md) for further information.

## Build
```
gradle clean build
```
## Test
```
gradle clean build
```
## Sonar
```
gradle sonarqube
```
## Release
```
gradle clean release -Prelease.useAutomaticVersion=true
```
## CI and CD

We use Travis CI as automation server and Codecov for test coverage:

- On Push to any branch, to build the source code
- On Pull Requests to master, to build, test and execute the sonar analysis and upload the SNAPSHOT library to Nexus
- On Push to release branch (from master), to prepare and perform the release using gradle-release plugin automatically generating the changelog

# How to contribute

Features and bug fixes are more than welcome. They must be linked to an issue, so the first step before contributing is the creation of a [GitHub issue](https://github.com/carloscaverobarca/gradle-release-example/issues).

# External resources

- [Git changelog command line](https://github.com/tomasbjerre/git-changelog-command-line)

# License

Apache 2.0

