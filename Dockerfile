FROM "hwasub/docker-texlive-alpine"

LABEL maintainer="AJIOB <aleksandr9809@gmail.com>"
LABEL version="1.0.0"

# Windows fonts
RUN apk add --no-cache \
  msttcorefonts-installer \
  && update-ms-fonts \
  && fc-cache -f
