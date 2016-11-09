FROM gliderlabs/alpine

# don't install docs with gems
RUN echo 'gem: --no-rdoc --no-ri' >/etc/gemrc

# alpine-sdk required for nokogiri. Removed after building container
# Doing this before adding edge repo paths  due to Bug: http://bugs.alpinelinux.org/issues/6375
RUN apk add --update alpine-sdk

# base ruby packages
RUN apk add --update ruby
RUN apk add ruby ruby-rake
RUN apk add ruby ruby-bundler

# add edge main and testing repo where python2(for mono) and mono are:
RUN echo "@edgemain http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --update python2@edgemain
RUN apk add --update mono@testing

# required for nokogiri, in edge repositories
RUN apk add --update zlib-dev
RUN apk add --update ruby-dev

RUN mkdir /usr/app
WORKDIR /usr/app
COPY Gemfile /usr/app/

# installs albacore (hence nokogiri) and nuget
RUN bundle install

# cleanup unused packages
RUN apk del \
	ruby-dev \
	zlib-dev \
	alpine-sdk

# cleanup cache
RUN rm -rf /var/cache/apk/*

# import certs
RUN mozroots --import --machine --sync
RUN certmgr -ssl -m https://nuget.org
RUN certmgr -ssl -m https://nugetgallery.blob.core.windows.net
RUN certmgr -ssl -m https://go.microsoft.com