# $FreeBSD: japanese/platex-jsclasses/Makefile 319148 2013-05-27 01:56:56Z hrs $

PORTNAME=	jsclasses
PORTVERSION=	1.0.20130514
CATEGORIES=	japanese print
MASTER_SITES=	http://oku.edu.mie-u.ac.jp/~okumura/jsclasses/:0 
PKGNAMEPREFIX=	ja-tex-platex-
DISTFILES=	${PORTNAME}-${PORTVERSION:S/^1.0.20//}${EXTRACT_SUFX}:0
DIST_SUBDIR=	TeX

MAINTAINER=	kenji.rikitake@acm.org
MAINTAINER=	hrs@FreeBSD.org
COMMENT=	New document class files for TeXlive-based pLaTeX

USE_ZIP=	YES
USE_TEX=	texlive ptex texhash
NO_BUILD=	YES
PLIST_SUB=	CLASSDIR=${CLASSDIR} TFMDIR=${TFMDIR} \
		PLDIR=${PLDIR} MKTEXLSR=${MKTEXLSR} \
		TEXMFDIR=${TEXMFDIR}
WRKSRC=		${WRKDIR}

TEXMFDIR=	share/texmf
MKTEXLSR=	${LOCALBASE}/bin/mktexlsr

CLASSDIR=	${TEXMFDIR}/ptex/platex/js
CLASS_FILES=	jsarticle.cls jsbook.cls \
		jsclasses.dtx jsclasses.ins jspf.cls \
		jsverb.dtx jsverb.ins jsverb.sty \
		kiyou.cls minijs.sty \
		morisawa.dtx morisawa.ins morisawa.sty \
		okumacro.dtx okumacro.ins okumacro.sty \
		okuverb.dtx okuverb.ins okuverb.sty

do-install:
	${MKDIR} ${PREFIX}/${CLASSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${CLASS_FILES} ${PREFIX}/${CLASSDIR}

.include <bsd.port.mk>
