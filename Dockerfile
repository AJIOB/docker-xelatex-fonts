FROM "phipsgabler/texlive-minimal"

LABEL maintainer="AJIOB <aleksandr9809@gmail.com>"
LABEL version="1.1.0"

# TeXLive update
RUN tlmgr update --self

# TeXLive deps
RUN apk add --no-cache \
  fontconfig

# TeXLive packages
RUN tlmgr install \
  xetex \
  extsizes

# Windows fonts
RUN apk add --no-cache \
  msttcorefonts-installer \
  && update-ms-fonts \
  && fc-cache -f

# Other tools
RUN apk add --no-cache \
  make
