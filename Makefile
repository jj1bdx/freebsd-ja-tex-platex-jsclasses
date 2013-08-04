# for a private port of japanese/ja-tex-platex-jsclasses
# Originally from: $FreeBSD: japanese/platex-jsclasses/Makefile 319148 2013-05-27 01:56:56Z hrs $

PORTNAME=	jsclasses
PORTVERSION=	1.0.20130514
CATEGORIES=	japanese print
MASTER_SITES=	http://oku.edu.mie-u.ac.jp/~okumura/jsclasses/:0 
PKGNAMEPREFIX=	ja-tex-platex-
DISTFILES=	${PORTNAME}-${PORTVERSION:S/^1.0.20//}${EXTRACT_SUFX}:0
DIST_SUBDIR=	TeX
BUILD_DEPENDS=	platex:${PORTSDIR}/japanese/tex-ptex

#MAINTAINER=	kenji.rikitake@acm.org
MAINTAINER=	hrs@FreeBSD.org
COMMENT=	New document class files for TeXlive-based pLaTeX

USE_ZIP=	YES
USE_TEX=	texlive ptex texhash
NO_BUILD=	YES
WRKSRC=		${WRKDIR}

CLASSDIR=	${TEXMFLOCALDIR}/tex/platex/js
CLASS_FILES=	jsarticle.cls jsbook.cls \
		jsclasses.dtx jsclasses.ins jspf.cls \
		jsverb.dtx jsverb.ins jsverb.sty \
		kiyou.cls minijs.sty \
		morisawa.dtx morisawa.ins morisawa.sty \
		okumacro.dtx okumacro.ins okumacro.sty \
		okuverb.dtx okuverb.ins okuverb.sty
PLIST_SUB=	CLASSDIR=${CLASSDIR}

do-install:
	${MKDIR} ${PREFIX}/${CLASSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${CLASS_FILES} ${PREFIX}/${CLASSDIR}

.include <bsd.port.mk>
