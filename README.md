# Docker Rake Dotnet
This repo stores artifacts used to build a docker image for working with dotnet projects using rake, albacore, mono. It is build with a scratch [alpine-linux image](https://hub.docker.com/r/gliderlabs/alpine/).

# Image location
It's on docker hub: https://hub.docker.com/r/sbatta/rake-dotnet/

Install image with: docker pull sbatta/rake-dotnet

# How to build
First, apart from having docker setup, ensure you are familiar with the following:
  - [albacore ruby gem](https://github.com/Albacore/albacore)
  - [rake](https://github.com/ruby/rake)

The docker image can be used to build any number of dotnet projects or solutions.

Each Dotnet solution is built with rake and albacore using a rake.rb or rakefile.rb. A sample rakefile.rb is in this repository's ConsoleApp folder.

It's recommended to place one dockerfile per repository where the rake file exists.

Test the rake build on local machine. Once satisfied, modify the docketfile adding three additional steps that builds you solution within the docker container.

  1. Copy source
  2. Change to folder where 'rake' file is
  3. RUN rake

Build your docker image and profit!

Have changes to code? no problem, build your image again.

# What's so cool about using docker to build?
  - _Isolation:_ everything related to building your solution outside of Visual studio is in docker app. No need to install anything locally on development machine
  - _Distributability:_ This is my favorite. Providing instructions to install and setup requisite ruby, gems etc., is great but everyone who needs it has to do it over. Instead, pull the docker image, checkout your solution, add the dockerfile (if it doesn't exist already), build image and done. Everyone in dev and devops do exactly the same thing! The dream has come true with docker!!
  - _Extensibility_: Have custom build needs like running tests, building nugets and such? Use the base image and go!

Contact me if you see any issues.
