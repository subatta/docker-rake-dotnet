FROM gliderlabs/alpine

# don't install docs with gems
RUN echo 'gem: --no-rdoc --no-ri' >/etc/gemrc

# add testing repo where mono is
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# install packages
RUN apk add --update \
  ruby \
  ruby-rake \
  ruby-dev \
  zlib-dev \
  alpine-sdk \
  mono@testing

# the DotNet build gem, installs semver too
RUN gem install albacore
# manage nuget packages
RUN gem install nuget

# cleanup unused packages
RUN apk del \
	ruby-dev \
	zlib-dev \
	alpine-sdk

# cleanup cache
RUN rm -rf /var/cache/apk/*