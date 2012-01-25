# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $ 

inherit eutils

DESCRIPTION="Server software with the aim of being fully compliant with DLNA/UPnP-AV clients."
HOMEPAGE="http://sourceforge.net/projects/minidlna"
SRC_URI="mirror://sourceforge/${PN}/${PN}_${PV}_src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~amd64"

DEPEND="
	>=dev-db/sqlite-3.6.12
	>=media-libs/flac-1.2
	>=media-libs/jpeg-6
	>=media-libs/libexif-0.6.10
	>=media-libs/libid3tag-0.15
	>=media-libs/libvorbis-1.2.1
	>=media-video/ffmpeg-0.5
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	PREFIX="${D}" emake install

	newinitd "${FILESDIR}"/minidlna-initd minidlna
	newconfd "${FILESDIR}"/minidlna-confd minidlna

}
