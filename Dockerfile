FROM frolvlad/alpine-glibc:alpine-3.8_glibc-2.28

LABEL maintainer="AJIOB <aleksandr9809@gmail.com>"
LABEL version="1.1.6"

# Config the automated install
COPY texlive.profile texlive.profile

# set up packages
## &&
# Remove unnecessary archieves
RUN apk add --no-cache wget perl xz && \
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
  tar -xzf install-tl-unx.tar.gz && \
  install-tl-20*/install-tl --profile=./texlive.profile && \
  apk --no-cache del xz \
    && \
  rm install-tl-unx.tar.gz texlive.profile && \
  rm -r install-tl-20*

# set up path
ENV PATH="/usr/local/texlive/bin/x86_64-linuxmusl:${PATH}"

# TeXLive update
## &&
# TeXLive deps
## &&
# TeXLive packages
## hyphen-* for english/russial lang word wraps support
## xstring for string switch-cases
## latexmk for fast build target
## xetex for xelatex compiler
## t2 for mathtext
## tools for indentfirst
## oberdiek for ifpdf
## bigfoot for perpage
## zapfding for pzdr
## koma-script for tocbasic
## * for -//-
## &&
# Windows fonts
## &&
# Other tools
RUN tlmgr update --self \
    && \
  apk add --no-cache fontconfig \
    && \
  tlmgr install \
  \
  hyphen-english \
  hyphen-russian \
  \
  latexmk \
  xetex \
  polyglossia \
  t2 \
  tools \
  oberdiek \
  bigfoot \
  zapfding \
  xstring \
  datetime \
  nomencl \
  \
  geometry \
  setspace \
  footmisc \
  tocloft \
  fancyhdr \
  titlesec \
  graphics \
  graphics-cfg \
  caption \
  amsmath \
  amscls \
  mathspec \
  enumitem \
  makecell \
  multirow \
  was \
  SIstyle \
  xcolor \
  listings \
  ulem \
  hyperref \
  latexconfig \
  url \
  natbib \
  lastpage \
  totcount \
  pdfpages \
  textcase \
  fp \
  extsizes \
  fmtcount \
  koma-script \
    && \
  apk add --no-cache \
  msttcorefonts-installer \
  && update-ms-fonts \
  && fc-cache -f \
    && \
  apk add --no-cache make
