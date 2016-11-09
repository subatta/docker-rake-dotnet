# Docker Rake Dotnet
This repo stores artifacts used to build a docker image for working with dotnet projects using rake, albacore, mono. It is build with a scratch [alpine-linux image](https://hub.docker.com/r/gliderlabs/alpine/).

# Image location
It's on docker hub: https://hub.docker.com/r/sbatta/rake-dotnet/

Install image with: `docker pull sbatta/rake-dotnet`

# How to build
First, apart from having docker setup, ensure you are familiar with the following:
  - [albacore ruby gem](https://github.com/Albacore/albacore)
  - [rake](https://github.com/ruby/rake)

The docker image can be used to build any number of dotnet projects or solutions.

Each Dotnet solution is built with rake and albacore using a rake.rb or rakefile.rb. A sample rakefile.rb is in this repository's ConsoleApp folder.

Test the rake build on local machine. Once satisfied, you have twol steps that builds you solution within the docker container.

  1. Change to folder where 'rake' file is
  2. Run this command at console: docker run -v `pwd`:`pwd` -w `pwd` sbatta/rake-dotnet "rake"


# What's so cool about using docker to build?
  - _Isolation:_ everything related to building your solution outside of Visual studio is in docker app. No need to install anything locally on development machine
  - _Distributability:_ Providing instructions to install and setup requisite ruby, gems etc., is great but everyone who needs it has to do it over. Instead, pull the docker image, checkout your solution, add the dockerfile and run rake from docker. Everyone in dev and devops do exactly the same thing! The dream comes true with docker!!
  - _Extensibility_: Have custom build needs like running tests, building nugets and such? Modify the base image and go!
  - _Centralized updates_: One image source for everyone means all updates are matter of running docker pull

Contact me if you see any issues.
