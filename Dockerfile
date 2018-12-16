FROM "phipsgabler/texlive-minimal"

LABEL maintainer="AJIOB <aleksandr9809@gmail.com>"
LABEL version="1.1.0"

# TeXLive update
RUN tlmgr update --self

# TeXLive deps
RUN apk add --no-cache \
  fontconfig

# TeXLive packages
## xetex for xelatex compiler
## t2 for mathtext
## tools for indentfirst
## oberdiek for ifpdf
## bigfoot for perpage
## * for -//-
RUN tlmgr install \
  xetex \
  polyglossia \
  t2 \
  tools \
  oberdiek \
  bigfoot \
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
  extsizes

# Windows fonts
RUN apk add --no-cache \
  msttcorefonts-installer \
  && update-ms-fonts \
  && fc-cache -f

# Other tools
RUN apk add --no-cache \
  make
