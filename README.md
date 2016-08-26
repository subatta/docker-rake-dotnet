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

Test the rake build on local machine. Once satisfied, modify the docketfile adding the three additional steps that builds you solution within the docker container.

  1. Copy source
  2. Change to folder where 'rake' file is
  3. RUN rake
   
That's it!

Contact me if you see any issues.
