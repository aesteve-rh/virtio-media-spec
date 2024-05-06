#!/bin/sh

SPECDOC=${SPECDOC:-`cat REVISION`}

ISODATE=`git show --format=format:'%cd' --date=iso | head -n 1`
DATESTR=`date -d "$DATE" +'%d %B %Y'`
STAGE=wd
STAGENAME="Working Draft"
WORKINGDRAFT=`basename "$1" | sed 's/.*-wd//'`
VERSION=`echo "$1"| sed -e 's/virtio-v//' -e 's/-.*//'`
OASISSTAGENAME="OASIS $STAGENAME"

cat > setup-generated.tex <<EOF
% define VIRTIO Working Draft number and date
\newcommand{\virtiorev}{$VERSION}
\newcommand{\virtioworkingdraftdate}{$DATESTR}
\newcommand{\virtioworkingdraft}{$WORKINGDRAFT}
\newcommand{\virtiodraftstage}{$STAGE}
\newcommand{\virtiodraftstageextra}{$STAGEEXTRA}
\newcommand{\virtiodraftstageextratitle}{$STAGEEXTRATITLE}
\newcommand{\virtiodraftstagename}{$STAGENAME}
\newcommand{\virtiodraftoasisstagename}{$OASISSTAGENAME}
EOF

rm $SPECDOC.aux $SPECDOC.pdf $SPECDOC.out
xelatex --jobname $SPECDOC virtio.tex
