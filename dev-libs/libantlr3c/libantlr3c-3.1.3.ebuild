# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Antlr3 C Implementation"
HOMEPAGE="http://antlr.org"
SRC_URI="http://antlr.org/download/C/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=dev-java/antlr-${PV}*"

src_install() {
	emake DESTDIR="${D}" install || die "emake failed."
}
