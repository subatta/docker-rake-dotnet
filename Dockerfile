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

# cleanup unused packages
RUN apk del \
	alpine-sdk \
	ruby-dev \
	zlib-dev

# cleanup cache
RUN rm -rf /var/cache/apk/*

# Copy source and build

#  Copy C# solution folder
#  Docker cache is smart to catch any folder/file changes and rebuild from here onwards only


#  Change to folder where rake is


# run rake
#RUN rake