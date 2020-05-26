<h1>SwiftLint Docker Image</h1>

[![CircleCI Build Status](https://circleci.com/gh/BytesGuy/swiftlint-docker.svg?style=shield)](https://circleci.com/gh/BytesGuy/swiftlint-docker) [![Software License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/BytesGuy/swiftlint-dockermaster/LICENSE) [![Docker Pulls](https://img.shields.io/docker/pulls/bytesguy/swiftlint)](https://hub.docker.com/r/bytesguy/swiftlint)

`bytesguy/swiftlint` is a docker image designed to make using SwiftLint easy, particulary in CircleCI jobs. SwiftLint is a tool to enforce style and conventions in Swift code. More information about SwiftLint can be found at the [SwiftLint repo](https://github.com/realm/SwiftLint).

You can find the image on [DockerHub](https://hub.docker.com/r/bytesguy/swiftlint)

## Getting Started

An example of how to use this image with CircleCI can be found below:

```
version: 2.1

jobs:
  swiftlint:
    docker:
        - image: bytesguy/swiftlint:latest
    steps:
        - checkout
        - run: swiftlint lint --reporter junit | tee result.xml
        - store_artifacts:
            path: result.xml
        - store_test_results:
            path: result.xml
```

The same command applies to running this image in other environments, simply call `swiftlint lint` in your project directory.

Why use this docker image instead of calling SwiftLint in your macOS job?

- SwiftLint can be run in parallel with the build, saving overall build time
- Running SwiftLint in docker also saves build credits as the Docker executor is cheaper to use
- If you only want to validate code standards, instead of building your full project, then this provides a quick and easy solution (it can also be used locally!)

More information about a multi executor setup can be found in the [CircleCI iOS Documentation](https://circleci.com/docs/2.0/testing-ios/#using-multiple-executor-types-macos--docker).

## Image Information

Each time SwiftLint is updated, there will be a new, version tagged, release of the SwiftLint docker image. The latest version of Swift, at the time of building, will always be used.

The images are built on the official CircleCI base image to ensure compatbility with CircleCI jobs.

The Dockerfile for each version can be found in the `versions` directory.